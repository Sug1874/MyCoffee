class CreateRoasts < ActiveRecord::Migration[7.0]
  def change
    create_table :roasts do |t|
      t.string :roast_level

      t.timestamps
    end
  end
end
