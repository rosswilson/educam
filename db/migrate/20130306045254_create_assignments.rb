class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title, :limit => 50
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
