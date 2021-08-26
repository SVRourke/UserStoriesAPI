class Story < ApplicationRecord
    validates :content, {presence: true}

    belongs_to :epic
end

# TODO add Notes model for sub-notes