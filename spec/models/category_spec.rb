require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Category do
  fixtures :categories

  it "should have a name" do
    categories(:food_expense).name.should == "Food expense"
  end
end
