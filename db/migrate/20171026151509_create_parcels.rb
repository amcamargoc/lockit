class CreateParcels < ActiveRecord::Migration[5.0]
  def change
    create_table :parcels do |t|
      t.string :name
      t.references :locker_box,  foreign_key: true
      t.references :recipient,   foreign_key: true
      t.float      :capicity,    null: false
      t.string     :label_photo, null: false

      t.timestamps
    end
  end
end
