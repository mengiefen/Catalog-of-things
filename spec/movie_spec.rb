require_relative '../src/classes/movie'
require_relative '../src/classes/item'

describe Movie do
  context 'Should create a movie' do
    it 'Expects user to pass publish_date and silent as parameters' do
      movie = Movie.new(rand(1..1000), '2010-05-05', silent: false)
      expect(movie).to be_an_instance_of Movie
    end

    it 'Should throw an error if the right arguments are not passed' do
      expect { Movie.new }.to raise_error(ArgumentError)
    end
  end

  context 'Using Movie can_be_archived? method' do
    it 'Returns true if super returns true, if publish_date > 10 years' do
      movie = Movie.new(rand(1..1000), '2010-05-05', silent: false)
      expect(movie.can_be_archived?).to be true
    end

    it 'Should return true if the movie is silent' do
      movie = Movie.new(rand(1..1000), '2010-05-05', silent: true)
      expect(movie.can_be_archived?).to be true
    end

    it 'Should return false if super returns false or if the movie is not silent' do
      movie = Movie.new(rand(1..1000), '2022-05-05', silent: false)
      expect(movie.can_be_archived?).to be false
    end
  end
end
