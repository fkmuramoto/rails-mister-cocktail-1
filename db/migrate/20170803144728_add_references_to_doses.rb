class AddReferencesToDoses < ActiveRecord::Migration[5.1]
  def change
    remove_column :doses, :ingredient_id
    remove_column :doses, :cocktail_id

    add_reference :doses, :cocktail, foreign_key: true
    add_reference :doses, :ingredient, foreign_key: true
  end
end
