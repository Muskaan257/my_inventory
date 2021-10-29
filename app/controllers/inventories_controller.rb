class InventoriesController < ApplicationController
    def index
        @inventories = User.find_by(id: session[:user_id]).inventory
        # session[:inventory_id] =  Inventory.select(:id).find_or_create_by(user_id: session[:user_id])
        # User.find_or_create_by(id: session[:user_id]).inventory
    end
    
    def new
        @inventory = Inventory.new
    end

    def create
        @inventory = Inventory.new(inventory_params) 
        if @inventory.save
            user_id = session[:user_id]
            redirect_to root_path, notice: "Successfully created inventory"
        else
            render :new
        end
    end
    private
    def inventory_params
        params.require(:inventory).permit(:user_id)
    end

end
