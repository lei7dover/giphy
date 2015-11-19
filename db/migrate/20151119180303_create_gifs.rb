class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.text :url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
