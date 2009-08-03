require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  fixtures :accounts, :incomes

  it "should be valid" do
    accounts(:bank).should be_valid
  end

  it "should have incomes" do
    accounts(:bank).should have(1).incomes
  end
end
