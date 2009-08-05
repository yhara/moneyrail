class Category < ActiveRecord::Base
  validates_presence_of :name, :position
  validates_numericality_of :position
  validates_uniqueness_of :position
  
  def validate
    unless %w(Income Expense Move).include?(self.kind)
      errors.add("kind", "#{self.kind.inspect} must be either of Income, Expense, Move")
    end
  end

  # provides move_higher, move_lower, etc.
  # categories are indexed in those of the same kind
  acts_as_list :scope => 'kind == #{kind}'

  def self.hashed
    {
      :income =>
      self.all(:conditions => {:kind => "Income"},  :order => "position"),
      :expense =>
      self.all(:conditions => {:kind => "Expense"}, :order => "position"),
      :move =>
      self.all(:conditions => {:kind => "Move"},    :order => "position") 
    }
  end

end
