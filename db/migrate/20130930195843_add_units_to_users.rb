class AddUnitsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :metric, :int
  end
end
