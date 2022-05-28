require_relative './classes/movie'
require_relative './classes/db'
require_relative './modules/app_module'
require_relative './modules/io_handler'
require_relative './classes/game'
require_relative './classes/author'
require_relative './modules/author_data'
require_relative './modules/game_data'

class App
  include Appfunctions
  include GameData
  include AuthorsData

  def initialize
    @db = DB.new
    @games = read_games
    @authors = read_authors
    @options = [
      'List all books',
      'List all music albums',
      'List all movies',
      'List all games',
      'List all genres',
      'List all labels',
      'List all authors',
      'List all sources',
      'Add a book',
      'Add a music album',
      'Add a movie',
      'Add a game',
      'Exit'
    ]
    @run_app = false
    @io = IoHandler.new
  end

  def run
    @run_app = true
    select_option while @run_app
  end

  def exit!
    puts 'Thank you for using this app! 👋'
    @run_app = false
  end

  private

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def select_option
    list_options
    selected_option = gets.chomp.to_i

    case selected_option
    when 1
      @io.list_all_books
      print 'Press any key to continue...'
      gets
    when 2
      @io.list_music_albums
    when 3
      show_movies
    when 4
      list_games
    when 5
      @io.list_all_genres
    when 6
      @io.list_all_labels
      print 'Press any key to continue...'
      gets
    when 7
      list_authors
    when 8
      show_sources
    when 9
      @io.add_book
    when 10
      @io.add_music_album
    when 11
      create_movie
    when 12
      add_new_game
    when 13
      @io.save
      exit!
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength'13'

  def list_options
    puts "\n"
    puts 'Please choose an option by entering a number'
    @options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    puts "\n"
  end

  def list_authors
    puts 'There are no @authors yet!' if @music_albums.empty?
    @authors.each do |author|
      puts "First name: #{author.first_name}, last name : #{last.first_name}}"
    end
  end

  def list_games
    puts 'There are no games yet!' if @games.empty?
    @games.each do |game|
      puts "Multiplayer : #{game.multiplayer},
      last date played : #{game.last_played_at},
      publishing : #{game.publish_date}"
    end
  end

  def add_new_game
    print 'It is a multiplayer game [Enter answer in format true / false]: '
    multiplayer = gets.chomp.to_s.casecmp('true').zero?

    print 'Please, enter the last date the game was played (mm-dd-yyyy)'
    last_played_at = gets.chomp

    print 'Published Date [Enter date in format (mm-dd-yyyy)]: '
    publish_date = gets.chomp
    return unless publish_date

    puts 'Choose an author: '
    if @authors.empty?
      create_author
      author_index = 0
    else
      list_authors
      author_index = gets.chomp.to_i
    end

    @games.push(Game.new(publish_date, multiplayer, last_played_at))
    save_games(@games)
    puts 'Game created successfully'
  end
end
