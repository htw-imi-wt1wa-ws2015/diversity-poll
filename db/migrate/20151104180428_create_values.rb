class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :label
      t.references :dimension, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
