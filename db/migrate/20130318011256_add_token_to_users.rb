class AddTokenToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :authentication_token
    end
  end
  def self.down
    t.remove :authentication_token
  end
end

