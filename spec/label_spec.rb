require_relative '../src/classes/label'
require_relative '../src//classes/book'

describe Label do
  before :each do
    @label = Label.new('BookTitle', 'BookColor')
    @book = Book.new('Publisher', 'Bad')
    @book.label = @label
  end

  context 'creating #new book' do
    it 'requires two arguments ' do
      expect(@label).to be_an_instance_of Label
    end
  end

  it 'should return BookTitle when #new is called' do
    expect(@label.title).to eq 'BookTitle'
  end

  it 'should return BookColor when #new is called' do
    expect(@label.color).to eq 'BookColor'
  end

  it 'should return return #1 when #new.items.length called' do
    expect(@label.items.length).to eq 1
  end
end
