module Item
  def self.included(klass)
    klass.belongs_to :account
    klass.belongs_to :category

    klass.validates_presence_of :title, :date

    klass.validates_presence_of :amount, :index_of_day
    klass.validates_numericality_of :amount, :index_of_day

    klass.validates_presence_of :account
  end

  def validate_category
    unless self.category && self.category.kind == self.class.to_s
      errors.add("category", "the category is not for #{self.class.to_s}")
    end
  end
end
