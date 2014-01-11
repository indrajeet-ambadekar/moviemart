class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :cast
      t.string :director
      t.string :category

      t.timestamps
    end
  end
end
