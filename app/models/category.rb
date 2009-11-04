class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def validate
    unless %w(Income Expense).include?(self.kind)
      errors.add("kind", "#{self.kind.inspect} must be either of Income or Expense")
    end
  end

  # provides move_higher, move_lower, etc.
  # categories are indexed in those of the same kind
  acts_as_list :scope => 'kind == \'#{kind}\''

  def self.hashed
    {
      :income =>
      self.all(:conditions => {:kind => "Income"},  :order => "position"),
      :expense =>
      self.all(:conditions => {:kind => "Expense"}, :order => "position"),
    }
  end

end
