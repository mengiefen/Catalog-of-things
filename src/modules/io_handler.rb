require_relative '../classes/label'
require_relative '../classes/book'
require_relative '../classes/item'
require 'json'

class IoHandler
  def initialize
    @books = []
    @labels = []
    load_from_storage
  end

  def add_book
    puts '-------  Adding Book  -------'
    print 'Who is the Publisher? : '
    publisher = gets.chomp
    print 'Specify Book Cover State: '
    cover_state = gets.chomp

    puts 'Choose book lebel: '
    list_all_labels

    label_index = gets.chomp.to_i
    book = Book.new(publisher, cover_state, rand(1..1000))
    book.label = (@labels[label_index - 1])

    @books << book
  end

  def save_to_storage
    File.write('./src/storage/books.json', JSON.pretty_generate(@books))
    File.write('./src/storage/labels.json', JSON.pretty_generate(@labels))
  end

  def load_from_storage
    (File.exist? './src/storage/books.json') &&
      (@books = JSON.parse(
        File.read('./src/storage/books.json'), create_additions: true
      ))

    (File.exist? './src/storage/labels.json') &&
      (@labels = JSON.parse(
        File.read('./src/storage/labels.json'), create_additions: true
      ))
  end

  def list_all_books
    @books.each_with_index do |book, index|
      puts "Book-[#{index + 1}]: Publisher: #{book.publisher},  Cover State: #{book.cover_state}"
    end
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "[#{index + 1}]: #{label.title}"
    end
  end

  def add_label
    puts '--- Adding New Label ---'
    print ' Please enter the Title: '
    title = gets.chomp
    print 'Enter the Color: '
    color = gets.chomp
    @labels << Label.new(title, color)
  end

  def save
    save_to_storage
  end
end
