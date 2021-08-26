# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "SVRourke", email: "s@s.com")
project = user.projects.create(name: "Project 1", description: "this is a project")
project.comments.create(content: "This is a comment")

epic = project.epics.create(content: "This is an epic")
epic.comments.create(content: "This is a comment")

story = epic.stories.create(content: "this is a story")
epic.stories.create(content: "this is another story")
epic.stories.create(content: "this is yet another story")

story.comments.create(content: "This is a comment")
story.comments.create(content: "This is another comment")
story.comments.create(content: "This is yet another comment")