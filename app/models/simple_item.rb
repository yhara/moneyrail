class SimpleItem < Item
  # associations
  
  belongs_to :account
  
  # validations

  validates_presence_of :account

  def find_conflict
    Item.all(:conditions => {
      :type => type,
      :date => date, 
      :account_id => account_id,
      :category_id => category_id,
      :position => position,
    }).reject{|x| x.id == self.id}.first
  end
  
  # featues

  acts_as_list :scope => [
    'date => #{date}',
    'account_id => #{account_id}',
    'category_id => #{category_id}',
  ].join(" AND ")
end
