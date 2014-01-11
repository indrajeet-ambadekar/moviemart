class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :movie, index: true
      t.integer :like

      t.timestamps
    end
  end
end
