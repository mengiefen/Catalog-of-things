require_relative '../src/classes/genre'
require_relative '../src/classes/item'
require 'date'

describe Genre do
  before :each do
    @genre = Genre.new('Pop')
  end

  it 'Should be an instance of Genre' do
    expect(@genre).to be_an_instance_of(Genre)
  end

  it 'Should have a name' do
    expect(@genre.name).to be == 'Pop'
  end

  it 'Should have a valid ID' do
    expect(@genre.id).to be_between(1, 1000).inclusive
  end

  it 'Should be able to add an item' do
    item = Item.new(Random.rand(1..1000), Time.now)
    expect(@genre.items.length).to be == 0
    @genre.add_item(item)
    expect(@genre.items.length).to be == 1
  end
end
