class CreateLockerBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :locker_boxes do |t|
      t.string :identification, null: false
      t.string :name
      t.text   :description
      t.float  :total_capacity, default: 0
      t.float  :used_capacity, default: 0
      t.timestamps
    end
  end
end
