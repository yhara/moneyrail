require 'lib/item.rb'

class Move < ActiveRecord::Base
  include Item

  belongs_to :account_from, :class_name => Account, :foreign_key => :account_id_from
  belongs_to :account_to, :class_name => Account, :foreign_key => :account_id_to
  
  # validations

  validates_presence_of :account_from
  validates_presence_of :account_to

  def validate
    validate_category
  end
end
