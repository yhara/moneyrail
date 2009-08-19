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
  
  # featues

  acts_as_list :scope => [
    'date = #{date}',
    'account_id = #{account_id}',
    'category_id = #{category_id}',
  ].join(" AND ")
end
