require_relative '../classes/label'
require_relative '../classes/book'
require_relative '../classes/item'
require_relative '../classes/genre'
require_relative '../classes/music_album'
require 'json'

class IoHandler
  def initialize
    @books = []
    @labels = []
    @genre = []
    @music_album = []
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
    File.write('./src/storage/genre.json', JSON.pretty_generate(@genre))
    File.write('./src/storage/music_album.json', JSON.pretty_generate(@music_album))
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

    (File.exist? './src/storage/genre.json') &&
      (@genre = JSON.parse(
        File.read('./src/storage/genre.json'), create_additions: true
      ))

    (File.exist? './src/storage/music_album.json') &&
      (@music_album = JSON.parse(
        File.read('./src/storage/music_album.json'), create_additions: true
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

  def list_all_genres
    puts 'Genres:'
    return puts 'There is no genres to show.' if @genre.empty?

    @genre.each_with_index do |genre, index|
      puts "[#{index + 1}] #{genre.name}"
    end
  end

  def list_music_albums
    puts 'Music Albums:'
    return puts 'There is no music albums to show.' if @music_album.empty?

    idx = 1
    @genre.each do |genre|
      genre.items.each do |album|
        puts "[#{idx}] Genre:#{genre.name}, Date:#{album.publish_date}, Spotify:#{album.on_spotify}"
        idx += 1
      end
    end
  end

  def add_genre
    puts '-------  Adding Genre  -------'
    print 'Add a new genre: '
    name = gets.chomp
    @genre << Genre.new(name)
  end

  def select_genre
    if @genre.empty?
      puts 'There are no genres to select'
      puts "\n"
      add_genre
      genre_index = 1
    else
      puts '[0] Create a new genre'
      list_all_genres
      genre_index = gets.chomp.to_i
      if genre_index.zero?
        add_genre
        puts "\n"
        puts 'Select a genre by number:'
        list_all_genres
        genre_index = gets.chomp.to_i
      end
    end
    genre_index
  end

  def add_music_album
    puts '-------  Adding music album  -------'
    print 'Publish Date [YYYY-MM-DD]:'
    publish_date = gets.chomp
    print 'On Spotify [y/N]:'
    on_spotify = gets.chomp.downcase == 'y'
    puts "\n"
    puts 'Select a genre by number:'
    genre_index = select_genre
    music_album = MusicAlbum.new(rand(1..1000), publish_date, on_spotify)
    music_album.genre = @genre[genre_index - 1]
    puts "\n"
    puts 'Music album created successfully'
    @music_album << music_album
  end

  def save
    save_to_storage
  end
end
