class Item < ActiveRecord::Base
  belongs_to :category

  # validations

  validates_presence_of :title, :date

  validates_presence_of :amount, :position
  validates_numericality_of :amount, :position

  def find_conflict
    Item.first(:conditions => {
      :type => type,
      :date => date, 
      :account_id => account_id,
      :category_id => category_id,
      :position => position,
    })
  end

  def validate
    # validate category
    unless self.category && self.category.kind == self.type
      errors.add("category", "the category is not for #{self.type}")
    end

    # validate index of day
    if same = self.find_conflict
      errors.add("position", "position #{dindex} conflicts with #{same.title}")
    end
  end
end
