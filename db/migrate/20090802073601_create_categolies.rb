class CreateCategolies < ActiveRecord::Migration
  def self.up
    create_table :categolies do |t|
      t.string :name
      t.string :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :categolies
  end
end
