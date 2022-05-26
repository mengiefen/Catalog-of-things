require_relative './Classes/movie'
require_relative './Classes/db'
require_relative './modules/app_module'


class App
    include Appfunctions;

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
  end

  def run
    @run_app = true
    select_option while @run_app
  end

  def exit!
    puts 'Thank you for using this app!'
    @run_app = false
  end

  private

  def select_option
    list_options
    selected_option = gets.chomp.to_i

    case selected_option
    when 1
      '1'
    when 2
      '2'
    when 3
      show_movies
    when 4
      '4'
    when 5
      '5'
    when 6
      '6'
    when 7
      '7'
    when 8
      show_sources
    when 9
      '9'
    when 10
      '10'
    when 11
      create_movie
    when 12
      '13'
    when 13
      exit!
    end
  end

  def list_options
    puts "\n"
    puts 'Please choose an option by enterin a number'
    @options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    puts "\n"
  end
end