class Ingredient < ActiveRecord::Base
    belongs_to :recipes
    has_many :users, through: :recipes
end
