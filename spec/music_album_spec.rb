require 'date'
require_relative '../src/classes/music_album'
require_relative '../src/classes/item'

describe MusicAlbum do
  before :each do
    @album = MusicAlbum.new(Random.rand(1..1000), '2000-05-05', on_spotify: true)
  end

  it 'Should be an instance of MusicAlbum' do
    expect(@album).to be_an_instance_of(MusicAlbum)
  end

  it 'Should be an instance of Item' do
    expect(@album).to be_a_kind_of(Item)
  end

  it 'Should have an on_spotify property' do
    expect(@album.on_spotify).to eq(true)
  end

  it 'Should have a valid ID' do
    expect(@album.id).to be_between(1, 1000).inclusive
  end

  it 'Should be able to be archived' do
    @album.move_to_archive
    expect(@album.archived).to eq(true)
  end

  it 'Should have an publish date' do
    expect(@album.publish_date).to eq('2000-05-05')
  end
end
