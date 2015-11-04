class CreateDimensionsInPolls < ActiveRecord::Migration
  def change
    create_table :dimensions_in_polls do |t|
      t.references :dimension, index: true, foreign_key: true
      t.references :poll, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
