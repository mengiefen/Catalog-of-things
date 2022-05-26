require_relative '../Classes/source'
require_relative '../Classes/db'
require_relative '../Classes/movie'

module CreateItems
    include ShowItems
    include PrivateMethods

    def valid_date?(date)
        return unless date.parse('yyyy-mm-dd')

        puts 'Please enter a valid year'
        date = gets.chomp
        vali_date?(date)
    end

    def create_movie
        source = create_source
        puts "\nWhat was the publish date of  the movie? e. g. yyyy-mm-dd"
        date = gets.chomp
        valid_date(date)
        puts "\nIs the movie silent?"
        puts '1 - YES'
        puts '2 - NO'
        silent = gets.chomp.to_i
        movie = Movie.new(date, silent: silent == 1)
        movie.add_source(source)
        date = { 
            publish_date: movie.publish_date,
            silent: movie.silent ==1,
            source: movie.source.name
         }
         @db.save(date, 'movies')
    end
end

module PrivateMethods
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
end

module ShowItems

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
            list.each_with_index { |source, index| pus "#{index} - #{source[name]}" }
        end
    end
end