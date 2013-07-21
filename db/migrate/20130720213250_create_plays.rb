class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :word
      t.datetime :date
    end

    add_index :plays, :word_id
  end
end
