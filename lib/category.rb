class Category
  attr_accessor :name

  def initialize #has_many stories interface
    @stories = []
  end

  def stories #has_many stories interface
    @stories.dup.freeze
    # Freeze prevents us from accidentally shoveling things into our @stories variable without going therough the #add_story method.
    # Enforces the #add_story interface
  end

  def add_story(story) #has_many stories interface
    # Check that story is a Story object, then push to @stories
    raise AssociationTypeMismatchError,  "#{story.class} received, Story expected." if !story.is_a?(Story)
    @stories << story
    # reciprocate by assigning the story to belong to
    # author unless it is already assigned (preventing
    # infinite loop)
    story.category = self unless story.category == self
  end

  def authors #has_many authors through stories
    self.stories.collect{|s| s.author}.uniq
  end
end
