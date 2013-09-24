class DropWeightsFromUsersTable < ActiveRecord::Migration
  def change
		remove_column :users, :original_weight
		remove_column :users, :current_weight
  end
end
