class Account < ActiveRecord::Base
  has_many :incomes
  has_many :outcomes
  has_many :move_outs, :class_name => Move, :foreign_key => :account_id_from
  has_many :move_ins, :class_name => Move, :foreign_key => :account_id_to

  validates_presence_of :name
end
