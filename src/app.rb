require_relative './classes/movie'
require_relative './classes/db'
require_relative './modules/app_module'
require_relative './modules/io_handler'

class App
  include Appfunctions

  def initialize
    @db = DB.new
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
      '4'
    when 5
      @io.list_all_genres
    when 6
      @io.list_all_labels
      print 'Press any key to continue...'
      gets
    when 7
      '7'
    when 8
      show_sources
    when 9
      @io.add_book
    when 10
      @io.add_music_album
    when 11
      create_movie
    when 12
      '13'
    when 13
      @io.save
      exit!
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

  def list_options
    puts "\n"
    puts 'Please choose an option by entering a number'
    @options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    puts "\n"
  end
end
