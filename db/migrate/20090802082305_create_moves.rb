class CreateMoves < ActiveRecord::Migration
  def self.up
    create_table :moves do |t|
      t.string   "title"
      t.integer  "amount"
      t.integer  "category_id"
      t.integer  "account_id_from"
      t.integer  "account_id_to"
      t.date     "date"
      t.integer  "index_of_day"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :moves
  end
end
