require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CategoliesController do

  def mock_categoly(stubs={})
    @mock_categoly ||= mock_model(Categoly, stubs)
  end

  describe "GET index" do
    it "assigns all categolies as @categolies" do
      Categoly.stub!(:find).with(:all).and_return([mock_categoly])
      get :index
      assigns[:categolies].should == [mock_categoly]
    end
  end

  describe "GET show" do
    it "assigns the requested categoly as @categoly" do
      Categoly.stub!(:find).with("37").and_return(mock_categoly)
      get :show, :id => "37"
      assigns[:categoly].should equal(mock_categoly)
    end
  end

  describe "GET new" do
    it "assigns a new categoly as @categoly" do
      Categoly.stub!(:new).and_return(mock_categoly)
      get :new
      assigns[:categoly].should equal(mock_categoly)
    end
  end

  describe "GET edit" do
    it "assigns the requested categoly as @categoly" do
      Categoly.stub!(:find).with("37").and_return(mock_categoly)
      get :edit, :id => "37"
      assigns[:categoly].should equal(mock_categoly)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created categoly as @categoly" do
        Categoly.stub!(:new).with({'these' => 'params'}).and_return(mock_categoly(:save => true))
        post :create, :categoly => {:these => 'params'}
        assigns[:categoly].should equal(mock_categoly)
      end

      it "redirects to the created categoly" do
        Categoly.stub!(:new).and_return(mock_categoly(:save => true))
        post :create, :categoly => {}
        response.should redirect_to(categoly_url(mock_categoly))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved categoly as @categoly" do
        Categoly.stub!(:new).with({'these' => 'params'}).and_return(mock_categoly(:save => false))
        post :create, :categoly => {:these => 'params'}
        assigns[:categoly].should equal(mock_categoly)
      end

      it "re-renders the 'new' template" do
        Categoly.stub!(:new).and_return(mock_categoly(:save => false))
        post :create, :categoly => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested categoly" do
        Categoly.should_receive(:find).with("37").and_return(mock_categoly)
        mock_categoly.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :categoly => {:these => 'params'}
      end

      it "assigns the requested categoly as @categoly" do
        Categoly.stub!(:find).and_return(mock_categoly(:update_attributes => true))
        put :update, :id => "1"
        assigns[:categoly].should equal(mock_categoly)
      end

      it "redirects to the categoly" do
        Categoly.stub!(:find).and_return(mock_categoly(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(categoly_url(mock_categoly))
      end
    end

    describe "with invalid params" do
      it "updates the requested categoly" do
        Categoly.should_receive(:find).with("37").and_return(mock_categoly)
        mock_categoly.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :categoly => {:these => 'params'}
      end

      it "assigns the categoly as @categoly" do
        Categoly.stub!(:find).and_return(mock_categoly(:update_attributes => false))
        put :update, :id => "1"
        assigns[:categoly].should equal(mock_categoly)
      end

      it "re-renders the 'edit' template" do
        Categoly.stub!(:find).and_return(mock_categoly(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested categoly" do
      Categoly.should_receive(:find).with("37").and_return(mock_categoly)
      mock_categoly.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the categolies list" do
      Categoly.stub!(:find).and_return(mock_categoly(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(categolies_url)
    end
  end

end
