class Item < ActiveRecord::Base
  belongs_to :category

  # validations

  validates_presence_of :title, :date

  validates_presence_of :amount, :position
  validates_numericality_of :amount, :position

  def self.find_conflict(item)
    item.type.constantize.find_conflict(item)
  end

  def validate
    # validate category
    unless self.category && self.category.kind == self.type
      errors.add("category", "the category is not for #{self.type}")
    end

    # validate index of day
    if same = self.class.find_conflict(self)
      errors.add("position", "position #{position} conflicts with #{same.title} (#{same.amount}, #{same.date})")
    end
  end
end
