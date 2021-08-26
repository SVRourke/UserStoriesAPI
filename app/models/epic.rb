class Epic < ApplicationRecord
    validates :content, {presence: true, uniqueness: {scope: :project, message: "Project already contains that epic"}}
    
    belongs_to :project
    has_many :stories
end
