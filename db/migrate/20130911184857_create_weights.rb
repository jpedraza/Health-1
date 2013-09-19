class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
			t.date :date_of_entry
			t.decimal :weight
			t.belongs_to :user
			t.integer :user_id

      t.timestamps
    end
  end
end
