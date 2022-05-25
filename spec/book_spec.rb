require_relative '../src/classes/book'

describe Book do
  before :each do
    @book1 = Book.new('Publisher1', 'Cover-State', rand(1..1000))
    @book2 = Book.new('Publisher2', 'bad', rand(1..1000))
  end

  context 'creating #new book' do
    it 'requires two arguments ' do
      expect(@book1).to be_an_instance_of Book
    end
  end

  it 'should return JPublisher1 when #new is called' do
    expect(@book1.publisher).to eq 'Publisher1'
  end

  it 'should return Cover-State when #new is called' do
    expect(@book1.cover_state).to eq 'Cover-State'
  end

  it 'should return nil when #new move_to_archive called' do
    expect(@book1.move_to_archive).to eq nil
  end

  it 'should return true when #new move_to_archive called' do
    expect(@book2.move_to_archive).to be_truthy
  end
end
