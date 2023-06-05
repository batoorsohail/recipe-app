class User < ApplicationRecord
    has_many :foods, class_name: "food", foreign_key: "reference_id"
end
