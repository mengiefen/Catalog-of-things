require_relative '../src/classes/source'
require_relative '../src/classes/item'

describe Source do
  context 'Creating a source' do
    it 'Requires one parameter, name' do
      source = Source.new('Netflix')
      expect(source).to be_an_instance_of Source
    end

    it 'Accept parameter ID as well' do
      source = Source.new('Netflix', 153)
      expect(source).to be_an_instance_of Source
    end
  end
  context 'Using add_item method from Source' do
    before(:each) do
      @source = Source.new('Netflix')
      @item = Item.new(rand(1..1000), '2022-05-05')
    end

    it 'Should fail if the parameter is not an instance of Item' do
      expect(@source.add_item(153)).to eq 'Please insert a proper item'
    end

    it 'Add an item to its item list if an item instance is passed' do
      @source.add_item(@item)
      expect(@source.items[0]).to be @item
    end

    it 'Add itself to the item source if an item instance is passed' do
      @source.add_item(@item)
      expect(@item.source).to be @source
    end
  end
end
