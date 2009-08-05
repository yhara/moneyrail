class Expense < Item
  belongs_to :account
  
  # validations

  validates_presence_of :account

  def find_conflict
    Expense.first(:conditions => {
      :date => date, 
      :account_id => account_id,
      :category_id => category_id,
      :dindex => dindex,
    })
  end
end
