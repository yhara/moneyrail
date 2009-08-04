class Income < Item
  belongs_to :account
  
  # validations

  validates_presence_of :account
end
