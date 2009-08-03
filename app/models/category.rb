class Category < ActiveRecord::Base
  validates_presence_of :name
  
  def validate
    unless %w(Income Expense Move).include?(self.kind)
      errors.add("kind", "#{self.kind.inspect} must be either of Income, Expense, Move")
    end
  end

end
