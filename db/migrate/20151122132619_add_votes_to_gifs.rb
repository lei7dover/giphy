class AddVotesToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :votes_count, :integer
  end
end
