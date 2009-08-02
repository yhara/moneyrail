class CreateMoves < ActiveRecord::Migration
  def self.up
    create_table :moves do |t|
      t.string :title
      t.integer :amount
      t.integer :categoly_id_from
      t.integer :categoly_id_to
      t.date :date
      t.integer :index_of_day

      t.timestamps
    end
  end

  def self.down
    drop_table :moves
  end
end
