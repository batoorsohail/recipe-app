class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
end
