class AddPointsToCalorie < ActiveRecord::Migration
  def change
    add_column :calories, :points, :number
    add_column :calories, :calories, :number
  end
end
