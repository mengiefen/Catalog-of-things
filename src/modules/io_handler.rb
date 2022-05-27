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
    puts 'Adding Book '
    print 'Who is the Publisher? : '
    publisher = gets.chomp
    print 'Specify Book Cover State: '
    cover_state = gets.chomp

    puts 'Choose book lebel: '
    if @labels.empty?
      add_label
      label_index = 0
    else
      list_all_labels
      label_index = gets.chomp.to_i
    end

    book = Book.new(publisher, cover_state, rand(1..1000))
    book.label = (@labels[label_index])

    @books << book
    puts 'Book Created Successfully ✅'
    sleep(2)
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
    if @books.empty?
      puts 'No Books to Show 🚫 '
    else
      @books.each_with_index do |book, index|
        puts "Book-[#{index}]: Publisher: #{book.publisher},  Cover State: #{book.cover_state}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'No labels available'

    else
      @labels.each_with_index do |label, index|
        puts "[#{index + 1}]: #{label.title}"
      end
    end
  end

  def add_label
    puts '--- No Labels in the List, Adding New Label ---'
    print ' Please enter the Title: '
    title = gets.chomp
    print 'Enter the Color: '
    color = gets.chomp
    @labels << Label.new(title, color, rand(1..1000))
    puts 'Book Created Successfully ✅'
    sleep(2)
  end

  def save
    save_to_storage
  end
end
