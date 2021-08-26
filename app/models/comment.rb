class Comment < ApplicationRecord
    validates :content, {presence: true, uniqueness: {scope: :commentable}}
    belongs_to :commentable, polymorphic: true

end
