require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Income do
  fixtures :accounts, :categories, :incomes

  it "should be valid" do
    incomes(:august_sarary).should be_valid
  end
end
