require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Category do
  fixtures :categories

  it "should be valid" do
    categories(:salary).should be_valid
  end
end
