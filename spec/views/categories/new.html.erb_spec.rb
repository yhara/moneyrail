require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/new.html.erb" do
  include CategoriesHelper

  before(:each) do
    assigns[:category] = stub_model(Category,
      :new_record? => true,
      :name => "value for name",
      :kind => "value for kind"
    )
  end

  it "renders new category form" do
    render

    response.should have_tag("form[action=?][method=post]", categories_path) do
      with_tag("input#category_name[name=?]", "category[name]")
      with_tag("input#category_kind[name=?]", "category[kind]")
    end
  end
end
