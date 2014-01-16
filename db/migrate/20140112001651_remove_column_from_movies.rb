class RemoveColumnFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :user_id, :string
  end
end
