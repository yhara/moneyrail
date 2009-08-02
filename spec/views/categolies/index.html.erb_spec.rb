require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categolies/index.html.erb" do
  include CategoliesHelper

  before(:each) do
    assigns[:categolies] = [
      stub_model(Categoly,
        :name => "value for name",
        :type => 
      ),
      stub_model(Categoly,
        :name => "value for name",
        :type => 
      )
    ]
  end

  it "renders a list of categolies" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
  end
end
