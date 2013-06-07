class ChangePrecisionOnPhotosAgainX2 < ActiveRecord::Migration
  def change
    change_column :photos, :lat, :decimal, :precision => 20, :scale => 16
    change_column :photos, :lon, :decimal, :precision => 20, :scale => 16
  end
end
