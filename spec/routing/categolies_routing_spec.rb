require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CategoliesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "categolies", :action => "index").should == "/categolies"
    end

    it "maps #new" do
      route_for(:controller => "categolies", :action => "new").should == "/categolies/new"
    end

    it "maps #show" do
      route_for(:controller => "categolies", :action => "show", :id => "1").should == "/categolies/1"
    end

    it "maps #edit" do
      route_for(:controller => "categolies", :action => "edit", :id => "1").should == "/categolies/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "categolies", :action => "create").should == {:path => "/categolies", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "categolies", :action => "update", :id => "1").should == {:path =>"/categolies/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "categolies", :action => "destroy", :id => "1").should == {:path =>"/categolies/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/categolies").should == {:controller => "categolies", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/categolies/new").should == {:controller => "categolies", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/categolies").should == {:controller => "categolies", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/categolies/1").should == {:controller => "categolies", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/categolies/1/edit").should == {:controller => "categolies", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/categolies/1").should == {:controller => "categolies", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/categolies/1").should == {:controller => "categolies", :action => "destroy", :id => "1"}
    end
  end
end
