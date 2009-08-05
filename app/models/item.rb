class Item < ActiveRecord::Base
  belongs_to :category

  # validations

  validates_presence_of :title, :date

  validates_presence_of :amount, :dindex
  validates_numericality_of :amount, :dindex

  def validate
    # validate category
    unless self.category && self.category.kind == self.class.to_s
      errors.add("category", "the category is not for #{self.class.to_s}")
    end

    # validate index of day
    if same = self.find_conflict
      errors.add("dindex", "index #{dindex} conflicts with #{same.title}")
    end
  end


end
