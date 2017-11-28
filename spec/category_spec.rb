describe Category do
  let(:category){Category.new.tap{|c| c.name = "Fiction"}}
  let(:story){Story.new.tap{|s| s.name = "The Old Man and the Sea"}}
  it 'has a name' do
    expect(category.name).to eq("Fiction")
  end

  context 'has_many stories' do
    describe '#stories' do
      it 'has an empty array of stories when initialized' do

        expect(category.stories).to match_array([])
      end

      it 'returns a frozen copy of the stories array' do
        expect(category.stories).to be_frozen
      end
    end

    describe '#add_story' do
      it 'can add story instance onto it' do
        category.add_story(story)

        expect(category.stories).to include(story)
      end

      it 'reciprocates assigning this category as the storys category' do
        category.add_story(story)

        expect(story.category).to eq(category)
      end

      it 'only allows story instances to be pushed onto it' do
        story = "The Old Man and the Sea"
        # Only allow Story objects to be pushed into stories.
        # Create error class, define in environment.rb
         expect{category.add_story(story)}.to raise_error(AssociationTypeMismatchError)

      end
    end
  end

  context 'has many authors through stories' do
    it 'returns the collection of unique category instances based on the stories' do
      king = Author.new.tap{|c| c.name = "Steven King"}
      vonnegut = Author.new.tap{|c| c.name = "Kurt Vonnegut"}
      story_1 = Story.new.tap{|s| s.name = "The Shining"; s.author = king}
      story_2 = Story.new.tap{|s| s.name = "Slaughterhouse Five"; s.author = vonnegut}
      story_3 = Story.new.tap{|s| s.name = "Breakfast of Champions"; s.author = vonnegut}

      story_1.category = category
      story_2.category = category
      story_3.category = category

      expect(category.authors).to match_array([king, vonnegut])
    end
  end
end
