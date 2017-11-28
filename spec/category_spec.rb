describe Category do
  it 'has a name' do
    #SETUP
    category = Category.new
    category.name = "Fiction"
    #EXPECTATION
    expect(category.name).to eq("Fiction")
  end
end
