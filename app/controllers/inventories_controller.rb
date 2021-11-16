class InventoriesController < ApplicationController
    before_action :set_inventory, only: [:show, :edit, :update, :destroy]
    def index
        @inventories = User.find_by(id: session[:user_id]).inventories
    end

    def show
        @inventory = Inventory.find(params[:id])
    end

    def new
        @inventory = Inventory.new
    end

    def edit
        @inventory = Inventory.find(params[:id])
    end

    def create
        @inventory = User.find_by(id: session[:user_id]).inventories.create(inventory_params) 
        if @inventory.save
            # primary_user_id = session[:user_id]
            redirect_to root_path, notice: "Successfully created inventory"
        else
            render :new
        end
    end

    def update
        if @inventory.update(inventory_params)
          redirect_to @inventory, notice: 'Inventory was successfully updated.'
        else
          render :edit
        end
    end

    def destroy
        @inventory.destroy
          redirect_to inventories_url, notice: 'Inventory was successfully destroyed.'
    end

    def share
        @inventory = Inventory.find(params[:id])
     end
   
    private
    def set_inventory
        @inventory = Inventory.find(params[:id])
    end

    def inventory_params
        params.require(:inventory).permit(:primary_user_id, :name, :edit_flag, :destroy_flag, user_ids: [])
    end

end
