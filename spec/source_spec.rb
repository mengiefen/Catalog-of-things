require_relative './source'

describe Source do
  before :each do
    @source = Source.new(1, Netflix)
  end

  context '#new' do
    it 'Should be an instance of Source' do
      expect(@source).to be_an_instance_of(Source)
    end
  end

  context 'Property name' do
    it 'Should be able to read' do
      name = @source.name
      expect(name).to eql(Netflix)
    end

    it 'Should not be able to be written' do
      expect { @source.name = 'Something' }.to raise_error(NoMethodError)
    end
  end

  context 'Property id' do
    it 'Should not be accessible' do
      expect { @source.id }.to raise_error(NoMethodError)
      expect { @source.id = 1 }.to raise_error(NoMethodError)
    end
  end

  context 'Property items' do
    it 'Should not be accessible' do
      expect { @source.items }.to raise_error(NoMethodError)
      expeect { @source.items = [] }.to raise_error(NoMethodError)
    end
  end

  context 'Add item' do
    it 'Should add item to source items array' do
      item = double('Item', source: nil)

      items = @source.add_item(item)

      expect(items.length).to eq(1)
    end

    it 'Should add multiple items to source items array' do
      item1 = double('Item', source: nil)
      item2 = double('Item', source: nil)
      item3 = double('Item', source: nil)

      @source.add_item(item1, item2)
      items = @source.add_item(item3)

      expect(items.length).to eq(3)
    end

    it 'Item should have genre property equal to self' do
      item = double('Item', source: nil)

      @source.add_item(item)

      expect(item).to have_received(:source=).with(@source)
    end

    it 'Should not accept repeated values' do
      item = double('Item', source: nil)

      @source.add_item(item)
      items = @source.add_item(item)

      expect(items.length).to eq(1)
    end
  end
end
