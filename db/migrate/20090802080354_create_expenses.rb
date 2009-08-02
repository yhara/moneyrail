class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.string :title
      t.integer :amount
      t.integer :categoly_id
      t.date :date
      t.integer :index_of_day

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
