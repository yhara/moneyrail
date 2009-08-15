class Account < ActiveRecord::Base
  has_many :incomes
  has_many :expenses
  has_many :moves_from, :class_name => "Move", :foreign_key => :account_id_from
  has_many :moves_to,   :class_name => "Move", :foreign_key => :account_id_to

  validates_presence_of :name
  validates_uniqueness_of :name

  # provides move_higher, move_lower, etc.
  acts_as_list
end
