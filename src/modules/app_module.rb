require_relative '../classes/source'
require_relative '../classes/db'
require_relative '../classes/movie'
require 'date'

module Appfunctions
  def create_movie
    source = create_source
    puts "\nWhat was the publish date of  the movie? e. g. [YYYY-MM-DD]"
    date = gets.chomp
    puts "\nIs the movie silent?"
    puts '1 - YES'
    puts '2 - NO'
    silent = gets.chomp.to_i
    id = Random.rand(1..100)
    movie = Movie.new(id, date, silent: silent == 1)
    movie.add_source(source)
    data = {
      id: movie.id,
      publish_date: movie.publish_date,
      silent: movie.silent == 1,
      source: movie.source.name
    }
    @db.save(data, 'movies')
  end

  def create_source
    puts "\nSelect a source from the following list or 'a' to add a new source:"
    source_list = @db.get_all_data_of('sources')
    show_sources
    input = gets.chomp
    if input == 'a'
      puts "\nWhat is your source?"
      new_source = gets.chomp
      data = { name: new_source }
      @db.save(data, 'sources')
      Source.new(new_source)
    else
      Source.new(source_list[input.to_i]['name'])
    end
  end

  def show_movies
    list = @db.get_all_data_of('movies')
    if list.empty?
      puts "\nThere are no movies."
    else
      list.each do |movie|
        puts "\nPublished in: #{movie['publish_date']}, Silent: #{movie['silent']}, Source: #{movie['source']}"
      end
    end
  end

  def show_sources
    list = @db.get_all_data_of('sources')
    if list.empty?
      puts "\nThere are no sources."
    else
      puts "\nSources:"
      list.each_with_index { |source, index| puts "#{index} - #{source}" }
    end
  end
end
