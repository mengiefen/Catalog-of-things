require_relative '../src/classes/game'

describe 'Game' do
  context 'when create a new game' do
    it 'return a new object' do
      game = Game.new(rand(0..1000), '01/01/2000', false, '01/01/2005')
      expect(game).to be_an_instance_of(Game)
    end
  end
end
