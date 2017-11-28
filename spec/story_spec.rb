describe Story do
  it 'has a name' do
    #SETUP
    story = Story.new
    story.name = "The Old Man and the Sea"
    #EXPECTATION
    expect(story.name).to eq("The Old Man and the Sea")
  end
end
