class CreateJoinTableUsersInventories < ActiveRecord::Migration
  def change
    create_join_table :users, :inventories do |t|
      t.index [:user_id, :inventory_id]
      # t.index [:inventory_id, :user_id]
    end
  end
end
