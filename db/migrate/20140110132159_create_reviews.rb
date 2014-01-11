class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :like
      t.text :review_text
      t.belongs_to :user
      t.belongs_to :movie
      t.timestamps
    end
  end
end
