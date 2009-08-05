class Item < ActiveRecord::Base
  belongs_to :category

  # validations

  validates_presence_of :title, :date

  validates_presence_of :amount, :index_of_day
  validates_numericality_of :amount, :index_of_day

  def validate
    # validate category
    unless self.category && self.category.kind == self.class.to_s
      errors.add("category", "the category is not for #{self.class.to_s}")
    end

    # validate index_of_day
    if same = self.find_conflict
      errors.add("index_of_day", "index #{index_of_day} conflicts with #{same.title}")
    end
  end


end
