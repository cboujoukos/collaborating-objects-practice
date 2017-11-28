class Author
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
    story.author = self unless story.author == self
  end

  def bibliography
    # go through all story instances and grab the story's name
    self.stories.collect{|s| s.name}
    # Also can be written with Symbol to Proc syntax
    # @stories.collect(&:name)
  end

  def categories #has_many categories through stories
    self.stories.collect{|s| s.category}.uniq
  end
end
