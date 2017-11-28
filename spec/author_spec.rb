describe Author do
  let(:author){Author.new.tap{|a| a.name = "Ernest Hemingway"}}
  let(:story){Story.new.tap{|s| s.name = "The Old Man and the Sea"}}

  it 'has a name' do
    expect(author.name).to eq("Ernest Hemingway")
  end

  context 'has_many stories' do
    describe '#stories' do
      it 'has an empty array of stories when initialized' do

        expect(author.stories).to match_array([])
      end

      it 'returns a frozen copy of the stories array' do
        expect(author.stories).to be_frozen
      end
    end

    describe '#add_story' do
      it 'can add story instance onto it' do
        author.add_story(story)

        expect(author.stories).to include(story)
      end

      it 'reciprocates assigning this author as the storys author' do
        author.add_story(story)

        expect(story.author).to eq(author)
      end

      it 'only allows story instances to be pushed onto it' do
        story = "The Old Man and the Sea"
        # Only allow Story objects to be pushed into stories.
        # Create error class, define in environment.rb
         expect{author.add_story(story)}.to raise_error(AssociationTypeMismatchError)

      end
    end

    describe '#bibliography' do
      it 'returns an arrayvof all the stories names of an author' do
        author = Author.new

        story_1 = Story.new.tap{|s| s.name = "Old Man and the Sea"}
        story_2 = Story.new.tap{|s| s.name = "The Sun Also Rises"}
        story_3 = Story.new.tap{|s| s.name = "For Whom the Bell Tolls"}

        author.add_story(story_1)
        author.add_story(story_2)
        author.add_story(story_3)

        expect(author.bibliography).to match_array(["Old Man and the Sea", "The Sun Also Rises", "For Whom the Bell Tolls"])
      end
    end
  end

  context 'has many categories through stories' do
    it 'returns the collection of unique category instances based on the stories' do
      fiction = Category.new.tap{|c| c.name = "Fiction"}
      non_fiction = Category.new.tap{|c| c.name = "Non-Fiction"}
      story_1 = Story.new.tap{|s| s.name = "Old Man and the Sea"; s.category = fiction}
      story_2 = Story.new.tap{|s| s.name = "The Sun Also Rises"; s.category = fiction}
      story_3 = Story.new.tap{|s| s.name = "A moveable Feast"; s.category = non_fiction}

      author.add_story(story_1)
      author.add_story(story_2)
      author.add_story(story_3)

      expect(author.categories).to match_array([fiction, non_fiction])
    end
  end
end
