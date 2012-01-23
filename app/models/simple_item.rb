class SimpleItem < Item
  # associations
  
  belongs_to :account
  
  # validations

  validates_presence_of :account

  def self.find_conflict(item)
    Item.all(:conditions => {
      :type => item.type,
      :date => item.date, 
      :account_id => item.account_id,
      :category_id => item.category_id,
      :position => item.position,
    }).reject{|x| x.id == item.id}.first
  end

  def validate
    super

    # validate category
    unless self.category && self.category.kind == self.type
      errors.add("category", "the category is not for #{self.type}")
    end
  end
  
  # featues

  acts_as_list :scope => [
    'date = #{date}',
    'account_id = #{account_id}',
    'category_id = #{category_id}',
  ].join(" AND ")

  def find_position
    klass = self.class
    items = klass.all(conditions: {
      date: self.date,
      account_id: self.account_id,
      category_id: self.category_id
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
