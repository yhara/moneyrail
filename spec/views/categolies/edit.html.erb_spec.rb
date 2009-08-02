require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categolies/edit.html.erb" do
  include CategoliesHelper

  before(:each) do
    assigns[:categoly] = @categoly = stub_model(Categoly,
      :new_record? => false,
      :name => "value for name",
      :type => 
    )
  end

  it "renders the edit categoly form" do
    render

    response.should have_tag("form[action=#{categoly_path(@categoly)}][method=post]") do
      with_tag('input#categoly_name[name=?]', "categoly[name]")
      with_tag('input#categoly_type[name=?]', "categoly[type]")
    end
  end
end
