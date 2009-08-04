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
    [
      self.all(:conditions => {:kind => "Income"}),
      self.all(:conditions => {:kind => "Expense"}),
      self.all(:conditions => {:kind => "Move"}) 
    ].flatten
  end


  def self.hashed
    {:income  => self.find(:all, :conditions => {:kind => "Income"}),
     :expense => self.find(:all, :conditions => {:kind => "Expense"}),
     :move    => self.find(:all, :conditions => {:kind => "Move"})} 
  end

end
