class Item < ActiveRecord::Base
  belongs_to :category

  # validations
  
  def before_validation
    self.title = "" if self.title.nil?
    self.amount = 0 if self.amount.blank?
    self.position = find_position if self.position.nil?
  end

  validates_presence_of :date

  validates_presence_of :amount
  validates_numericality_of :amount

  def self.find_conflict(item)
    item.type.constantize.find_conflict(item)
  end

  def validate
    # validate index of day
    if same = self.class.find_conflict(self)
      errors.add("position", "position #{position} conflicts with #{same.title} (#{same.amount}, #{same.date})")
    end
  end
end
