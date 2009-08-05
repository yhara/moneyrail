class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      # common attributes
      t.string :title
      t.integer :amount
      t.integer :category_id
      t.date :date
      t.integer :dindex
      t.timestamps

      # for Expense, Income
      t.integer :account_id
      # for Move
      t.integer :account_id_from
      t.integer :account_id_to

      # for STI
      t.string :type 
    end
  end

  def self.down
    drop_table :items
  end
end
