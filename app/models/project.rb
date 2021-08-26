class Project < ApplicationRecord
    validates :name, {presence: true, uniqueness: {scope: :user, message: "project already exists"}}
    belongs_to :user

    has_many :epics, dependent: :destroy
    has_many :comments, dependent: :destroy, as: :commentable
end
