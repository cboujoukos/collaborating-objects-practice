authors
  has_many stories
  has_many categories through stories

stories
  belongs_to an author
  belongs_to a category

categories
  has_many stories
  has_many authors, through stories


hemingway =  Author.new
hemingway.stories #=> [#<Story>, #<Story>]

Implement a through for categories..

author.build_story("The Name")
story.build_author("New Author")
