class Author
  attr_accessor :name

  def initialize
    @stories = []
  end

  def stories
    @stories
  end

  def add_story(story)
    # Check that story is a Story object, then push to @stories
    raise AssociationTypeMismatchError if !story.is_a?(Story)
    @stories << story
  end
end
