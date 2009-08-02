module Item
  belongs_to :account
  belongs_to :category

  validates_presence_of :title, :date

  validates_presence_of :amount, :index_of_day
  validates_numericality_of :amount, :index_of_day

  validates_presence_of :account

  def validate_category
    unless self.category && self.category.kind == self.class.to_s
      errors.add("category", "the category is not for #{self.class.to_s}")
    end
  end
end
