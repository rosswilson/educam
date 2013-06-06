class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo, :limit => 250
      t.decimal :lat
      t.decimal :lon
      t.string :caption, :limit => 250
      t.integer :assignment_id

      t.timestamps
    end
  end
end
