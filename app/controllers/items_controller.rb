class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    session[:inventory_id]=(params[:format])? params[:format]:session[:inventory_id]
    @items = Inventory.find_by(id: session[:inventory_id]).items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to @item, notice: 'Item was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
      if @item.update(item_params)
        redirect_to @item, notice: 'Item was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
      redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # def correct_user
    #   @item = items.find_by(id: params[:id])
    #   redirect_to root_url if @item.nil?
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :quantity, :inventory_id, :inventory)
    end
end
