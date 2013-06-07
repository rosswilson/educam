class ChangePrecisionOnPhotos < ActiveRecord::Migration
  def change
    change_column :photos, :lat, :decimal, :precision => 12, :scale => 2
    change_column :photos, :lon, :decimal, :precision => 12, :scale => 2
  end
end
