class Dose < ApplicationRecord
  validates :description, :cocktail, :ingredient, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient } # a dose must have a unique cocktail - ingredient combination
  belongs_to :ingredient
  belongs_to :cocktail
end
