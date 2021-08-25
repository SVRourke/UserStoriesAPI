class Project < ApplicationRecord
    validates :name, {presence: true, uniqueness: {scope: :user, message: "project already exists"}}
    belongs_to :user
end
