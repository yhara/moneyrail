require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Categoly do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :type => 
    }
  end

  it "should create a new instance given valid attributes" do
    Categoly.create!(@valid_attributes)
  end
end
