class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :bitterness
      t.integer :acidity
      t.integer :body
      t.string :roast
      t.string :variety
      t.string :process
      t.string :farm
      t.text :shop_url
      t.text :description

      t.timestamps
    end
    add_index :items, [:user_id, :created_at]
  end
end
