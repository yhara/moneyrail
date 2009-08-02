require 'lib/item.rb'

class Expense < ActiveRecord::Base
  include Item
  
  # validations

  validates_presence_of :account

  def validate
    validate_category
  end
end
