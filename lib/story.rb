class Story
  attr_accessor :name
  attr_reader :author

  def author=(author) #belongs to author interface
    raise AssociationTypeMismatchError, "#{author.class} recieved, Author expected." if !author.is_a?(Author)
    @author = author
    # reciprocate by assigning the instance to authors story
    # collection unless it already exists there
    author.add_story(self) unless author.stories.include?(self)
  end

  attr_reader :category

  def category=(category) #belongs to category interface
    raise AssociationTypeMismatchError, "#{category.class} recieved, Category expected." if !category.is_a?(Category)
    @category = category
    # reciprocate by assigning the instance to categorys story
    # collection unless it already exists there
    category.add_story(self) unless category.stories.include?(self)
  end

end
