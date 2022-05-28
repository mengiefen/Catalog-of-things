module AuthorsGame
  def list_all_authors
    puts 'Authors:'
    return puts 'There are no authors to show.' if @authors.empty?

    @authors.each_with_index do |author, index|
      puts "[#{index + 1}] First name:#{author.first_name}, Last name:#{author.last_name}"
    end
  end

  def list_all_games
    puts 'Games:'
    return puts 'There are no games to show.' if @games.empty?

    idx = 1
    @authors.each do |author|
      author.items.each do |game|
        multiplayer = game.multiplayer
        publish_date = game.publish_date
        puts "[#{idx}] Multiplayer: #{multiplayer}, Last played at: #{game.last_played_at}, Publishig: #{publish_date}"
        idx += 1
      end
    end
  end

  def create_author
    puts '-------  Adding author  -------'
    puts "\nEnter the last name:"
    lname = gets.chomp
    puts "\nEnter the first name:"
    fname = gets.chomp
    @authors << Author.new(lname, fname)
    puts "\nAuthor created successfully."
  end

  def select_author
    if @authors.empty?
      puts 'There are no authors to select'
      puts "\n"
      create_author
      author_index = 0
    else
      puts '[0] Create a new author'
      list_all_authors
      author_index = gets.chomp.to_i
      if author_index.zero?
        create_author
        puts "\n"
        puts 'Select a author by number:'
        list_all_authors
        author_index = gets.chomp.to_i
      end
    end
    author_index
  end

  def add_game
    puts '-------  Adding Game -------'
    print 'It is a multiplayer game [Enter answer in format true / false]: '
    multiplayer = gets.chomp.to_s.casecmp('true').zero?

    print 'Please, enter the last date the game was played (mm-dd-yyyy)'
    last_played_at = gets.chomp

    print 'Published Date [Enter date in format (mm-dd-yyyy)]: '
    publish_date = gets.chomp

    puts "\n"
    puts 'Select a author by number:'
    author_index = select_author
    game = Game.new(rand(1..1000), publish_date, multiplayer, last_played_at)
    game.author = @authors[author_index - 1]
    puts "\n"
    puts 'Game created successfully'
    @games << game
  end
end
