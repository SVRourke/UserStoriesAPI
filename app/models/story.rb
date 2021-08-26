class Story < ApplicationRecord
    validates :content, {presence: true, uniqueness: {scope: :epic, message: "duplicate story"}}

    belongs_to :epic
end

# TODO add Notes model for sub-notes