class Income < Item
  belongs_to :account
  
  # validations

  validates_presence_of :account

  def find_conflict
    Income.first(:conditions => {
      :date => date, 
      :account_id => account_id,
      :category_id => category_id,
      :index_of_day => index_of_day,
    })
  end
end
