class Categoly < ActiveRecord::Base
  validates_presence_of :name
  
  def validate
    unless %w(Income Expense Move).include?(self.kind)
      errors.add("kind", "kind must be either of Income, Expense, Move") 
    end
  end

end
