require_relative '../classes/label'
require_relative '../classes/book'
require_relative '../classes/item'
require_relative '../classes/genre'
require_relative '../classes/music_album'
require_relative '../classes/author'
require_relative '../classes/game'
require_relative '../modules/author_game'
require_relative '../modules/genre_album'
require_relative '../modules/book_label'
require 'json'

class IoHandler
  include AuthorsGame
  include GenreAlbum
  include BookLabel

  def initialize
    @books = []
    @labels = []
    @genre = []
    @music_album = []
    @games = []
    @authors = []
    load_from_storage
  end

  def save_to_storage
    File.write('./src/storage/books.json', JSON.pretty_generate(@books))
    File.write('./src/storage/labels.json', JSON.pretty_generate(@labels))
    File.write('./src/storage/genre.json', JSON.pretty_generate(@genre))
    File.write('./src/storage/music_album.json', JSON.pretty_generate(@music_album))
    File.write('./src/storage/games.json', JSON.pretty_generate(@games))
    File.write('./src/storage/authors.json', JSON.pretty_generate(@authors))
  end

  def load_from_storage
    (File.exist? './src/storage/books.json') && (@books = JSON.parse(
      File.read('./src/storage/books.json'), create_additions: true
    ))

    (File.exist? './src/storage/labels.json') && (@labels = JSON.parse(
      File.read('./src/storage/labels.json'), create_additions: true
    ))

    (File.exist? './src/storage/genre.json') && (@genre = JSON.parse(
      File.read('./src/storage/genre.json'), create_additions: true
    ))

    (File.exist? './src/storage/music_album.json') && (@music_album = JSON.parse(
      File.read('./src/storage/music_album.json'), create_additions: true
    ))

    (File.exist? './src/storage/games.json') && (@games = JSON.parse(
      File.read('./src/storage/games.json'), create_additions: true
    ))

    (File.exist? './src/storage/authors.json') && (@authors = JSON.parse(
      File.read('./src/storage/authors.json'), create_additions: true
    ))
  end

  def save
    save_to_storage
  end

  def add_book
    create_book
  end

  def list_all_books
    list_books
  end

  def list_all_labels
    list_labels
  end

  def add_label
    create_label
  end

  def list_all_genres
    list_genres
  end

  def list_music_albums
    list_albums
  end

  def add_music_album
    add_album
  end

  def list_authors
    list_all_authors
  end

  def list_games
    list_all_games
  end

  def add_new_game
    add_game
  end
end
