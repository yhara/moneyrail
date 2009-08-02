require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categolies/show.html.erb" do
  include CategoliesHelper
  before(:each) do
    assigns[:categoly] = @categoly = stub_model(Categoly,
      :name => "value for name",
      :type => 
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
  end
end
