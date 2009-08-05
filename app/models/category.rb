class Category < ActiveRecord::Base
  validates_presence_of :name, :kindex
  validates_numericality_of :kindex
  validates_uniqueness_of :kindex
  
  def validate
    unless %w(Income Expense Move).include?(self.kind)
      errors.add("kind", "#{self.kind.inspect} must be either of Income, Expense, Move")
    end
  end

  def kind_class
    Object.const_get(self.kind)
  end

  def self.hashed
    {
      :income =>
      self.all(:conditions => {:kind => "Income"},  :order => "kindex"),
      :expense =>
      self.all(:conditions => {:kind => "Expense"}, :order => "kindex"),
      :move =>
      self.all(:conditions => {:kind => "Move"},    :order => "kindex") 
    }
  end

end
