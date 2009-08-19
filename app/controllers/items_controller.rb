class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    @items = Item.all(:order => "updated_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
    @accounts = Account.all
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @accounts = Account.all
    @categories = Category.all
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    @item.type = @item.category.kind
    @accounts = Account.all
    @categories = Category.all

    respond_to do |format|
      if @item.save
        format.html {
          flash[:notice] = 'Item was successfully created.'
          redirect_to(@item) 
        }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
        format.json { render :text => "['ok', #{@item.id}]" }
      else
        logger.debug @item.errors.inspect
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
        format.json { render :text => "['error']" }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])
    @accounts = Account.all
    @categories = Category.all

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { 
          flash[:notice] = 'Item was successfully updated.'
          redirect_to(@item) 
        }
        format.xml  { head :ok }
        format.json { render :text => "['ok']" }
      else
        logger.debug @item.errors.inspect
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
        format.json { render :text => "['error']" }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
      format.json { render :text => "['ok']" }
    end
  end
end
