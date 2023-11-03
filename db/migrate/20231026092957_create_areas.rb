class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.references :item, null: false, foreign_key: true
      t.string :area

      t.timestamps
    end
  end
end
