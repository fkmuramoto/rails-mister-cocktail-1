class CreateDoses < ActiveRecord::Migration[5.1]
  def change
    create_table :doses do |t|
      t.integer :cocktail_id
      t.integer :ingredient_id
      t.text :description

      t.timestamps
    end
  end
end
