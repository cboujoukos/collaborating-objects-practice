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
  end
end
