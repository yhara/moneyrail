class CategoliesController < ApplicationController
  # GET /categolies
  # GET /categolies.xml
  def index
    @categolies = Categoly.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categolies }
    end
  end

  # GET /categolies/1
  # GET /categolies/1.xml
  def show
    @categoly = Categoly.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @categoly }
    end
  end

  # GET /categolies/new
  # GET /categolies/new.xml
  def new
    @categoly = Categoly.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @categoly }
    end
  end

  # GET /categolies/1/edit
  def edit
    @categoly = Categoly.find(params[:id])
  end

  # POST /categolies
  # POST /categolies.xml
  def create
    @categoly = Categoly.new(params[:categoly])

    respond_to do |format|
      if @categoly.save
        flash[:notice] = 'Categoly was successfully created.'
        format.html { redirect_to(@categoly) }
        format.xml  { render :xml => @categoly, :status => :created, :location => @categoly }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @categoly.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categolies/1
  # PUT /categolies/1.xml
  def update
    @categoly = Categoly.find(params[:id])

    respond_to do |format|
      if @categoly.update_attributes(params[:categoly])
        flash[:notice] = 'Categoly was successfully updated.'
        format.html { redirect_to(@categoly) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @categoly.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categolies/1
  # DELETE /categolies/1.xml
  def destroy
    @categoly = Categoly.find(params[:id])
    @categoly.destroy

    respond_to do |format|
      format.html { redirect_to(categolies_url) }
      format.xml  { head :ok }
    end
  end
end
