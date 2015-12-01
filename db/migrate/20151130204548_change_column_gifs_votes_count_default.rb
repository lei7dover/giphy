class ChangeColumnGifsVotesCountDefault < ActiveRecord::Migration
  def change
    change_column_default(:gifs, :votes_count, 0)
  end
end
