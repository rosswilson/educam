class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo
      t.decimal :lat
      t.decimal :lon
      t.string :caption
      t.integer :device_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
