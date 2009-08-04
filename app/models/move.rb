class Move < Item
  belongs_to :account_from, :class_name => Account, :foreign_key => :account_id_from
  belongs_to :account_to, :class_name => Account, :foreign_key => :account_id_to
  
  # validations

  validates_presence_of :account_from
  validates_presence_of :account_to
end
