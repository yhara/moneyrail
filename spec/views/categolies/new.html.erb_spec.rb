require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categolies/new.html.erb" do
  include CategoliesHelper

  before(:each) do
    assigns[:categoly] = stub_model(Categoly,
      :new_record? => true,
      :name => "value for name",
      :type => 
    )
  end

  it "renders new categoly form" do
    render

    response.should have_tag("form[action=?][method=post]", categolies_path) do
      with_tag("input#categoly_name[name=?]", "categoly[name]")
      with_tag("input#categoly_type[name=?]", "categoly[type]")
    end
  end
end
