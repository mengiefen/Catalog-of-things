module GenreAlbum
  def list_genres
    puts 'Genres:'
    return puts 'There is no genres to show.' if @genre.empty?

    @genre.each_with_index do |genre, index|
      puts "[#{index + 1}] #{genre.name}"
    end
  end

  def list_albums
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
      genre_index = 0
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

  def add_album
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
end
