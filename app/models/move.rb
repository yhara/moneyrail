class Move < Item
  # associations
  
  belongs_to :account_from, :class_name => "Account", :foreign_key => :account_id_from
  belongs_to :account_to, :class_name => "Account", :foreign_key => :account_id_to

  # validations

  def self.find_conflict(item)
    Move.all(:conditions => {
      :date => item.date,
      :account_id_from => item.account_id_from,
      :account_id_to => item.account_id_to,
      :position => item.position,
    }).reject{|x| x.id == item.id}.first
  end

  def validate
    if account_id_from && (account_id_from == account_id_to)
      errors.add("account_id_from", "from and to must not be same")
    end
    super
  end
  
  # featues

  acts_as_list :scope => [
    'date = #{date}',
    'account_id_from = #{account_id_from}',
    'account_id_to = #{account_id_to}',
  ].join(" AND ")

  def find_position
    klass = self.class
    items = klass.all(conditions: {
      date: self.date,
      account_id_from: self.account_id_from,
      account_id_to: self.account_id_to,
    })

    n = 0
    loop do
      if items.none?{|item| item.position == n}
        $stderr.puts "[find_position] #{n}"
        return n
      end
      n += 1
    end
  end
end
