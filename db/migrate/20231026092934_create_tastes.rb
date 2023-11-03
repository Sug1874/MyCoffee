class CreateTastes < ActiveRecord::Migration[7.0]
  def change
    create_table :tastes do |t|
      t.references :item, null: false, foreign_key: true
      t.string :taste

      t.timestamps
    end
  end
end
