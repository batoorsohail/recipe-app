class Food < ApplicationRecord
  belongs_to :name, class_name: 'User', foreign_key: :user_id
end
