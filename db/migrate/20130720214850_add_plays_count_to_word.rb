class AddPlaysCountToWord < ActiveRecord::Migration
  def up
    add_column :words, :plays_count, :integer, null: false, default: 0
    # reset cached counts for words with plays only
    ids = Set.new
    Play.all.each {|p| ids << p.word_id}
    ids.each do |word_id|
      Word.reset_counters(word_id, :plays)
    end
  end
  
  def down
    remove_column :words, :plays_count
  end
end