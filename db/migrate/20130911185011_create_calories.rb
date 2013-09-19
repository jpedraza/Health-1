class CreateCalories < ActiveRecord::Migration
  def change
    create_table :calories do |t|
			t.date :date_of_entry
			t.decimal :protein
			t.decimal :fat
			t.decimal :carbs
			t.decimal :fiber
			t.belongs_to :user
			t.integer :user_id

      t.timestamps
    end
  end
end
