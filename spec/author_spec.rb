describe Author do
  it 'has a name' do
    #SETUP
    author = Author.new
    author.name = "Hemingway"
    #EXPECTATION
    expect(author.name).to eq("Hemingway")
  end

  context 'with stories' do
    describe '#stories' do
      it 'has an empty array of stories when initialized' do
        author = Author.new

        expect(author.stories).to match_array([])
      end
    end

    describe 'stories<<' do
      it 'can push story instances onto it' do
        author = Author.new
        story = Story.new

        author.stories << story

        expect(author.stories).to include(story)
      end

      it 'only allows story instances to be pushed onto it' do
        author = Author.new
        story = "Old Man and the Sea"

        expect(author.stories << story).to raise_error(AssociationTypeMismatchError)
        
      end
    end
  end
end
