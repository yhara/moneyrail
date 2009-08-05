class Move < Item
  # associations
  
  belongs_to :account_from, :class_name => Account, :foreign_key => :account_id_from
  belongs_to :account_to, :class_name => Account, :foreign_key => :account_id_to

  # validations

  validates_presence_of :account_from
  validates_presence_of :account_to

  def find_conflict
    Move.first(:conditions => {
      :date => date, 
      :account_id_from => account_id_from,
      :account_id_to => account_id_to,
      :category_id => category_id,
      :position => position,
    })
  end
  
  # featues

  acts_as_list :scope => [
    'date => #{date}',
    'account_id_from => #{account_id_from}',
    'account_id_to => #{account_id_to}',
    'category_id => #{category_id}',
  ].join(" AND ")
end
