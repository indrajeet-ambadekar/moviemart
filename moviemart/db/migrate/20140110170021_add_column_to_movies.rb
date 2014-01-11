class AddColumnToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :like, :integer
    add_column :movies, :dislike, :integer
    add_reference :movies, :user, index: true
    add_column :movies, :genre, :string
  end
end
