class Category < ActiveRecord::Base
  validates_presence_of :name
  
  def validate
    unless %w(Income Expense Move).include?(self.kind)
      errors.add("kind", "#{self.kind.inspect} must be either of Income, Expense, Move")
    end
  end

  def kind_class
    Object.const_get(self.kind)
  end

  def self.sorted
    {:income  => self.find(:all, :conditions => {:kind => "Income"}),
     :expense => self.find(:all, :conditions => {:kind => "Expense"}),
     :move    => self.find(:all, :conditions => {:kind => "Move"})} 
  end

end
