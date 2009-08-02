require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/index.html.erb" do
  include CategoriesHelper

  before(:each) do
    assigns[:categories] = [
      stub_model(Category,
        :name => "value for name",
        :kind => "value for kind"
      ),
      stub_model(Category,
        :name => "value for name",
        :kind => "value for kind"
      )
    ]
  end

  it "renders a list of categories" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for kind".to_s, 2)
  end
end
