class ChangePrecisionOnPhotosAgain < ActiveRecord::Migration
  def change
    change_column :photos, :lat, :decimal, :precision => 14, :scale => 9
    change_column :photos, :lon, :decimal, :precision => 14, :scale => 9
  end
end
