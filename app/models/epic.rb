class Epic < ApplicationRecord
    validates :content, {presence: true, uniqueness: {scope: :project, message: "Project already contains that epic"}}
    
    belongs_to :project
    has_many :stories, dependent: :destroy
    has_many :comments, dependent: :destroy, as: :commentable
end
