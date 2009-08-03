require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  fixtures :accounts, :incomes

  it "should have name" do
    accounts(:wallet).name.should == "Wallet"
  end

  it "should have incomes" do
    accounts(:bank).incomes.should_not be_nil
  end
end
