class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.references :user
      t.string :text_color
      t.string :avatar
      t.timestamps
    end
    add_index :settings, :user_id
  end
  
  def self.down
    drop_table :settings
  end
end
