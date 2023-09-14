require_relative '../game'
require 'date'

describe Game do
  context 'When testing the Game class' do
    it 'should return the game label: Resident Evil' do
      @game = Game.new(publish_date: '12/09/2023', multiplayer: true)
      @game.label = 'Resident Evil'
      expect(@game.label).to eq 'Resident Evil'
    end
    it 'should it return the state of can_be_archived? method' do
      @game = Game.new(publish_date: '22/03/1996', multiplayer: true)
      expect(@game.can_be_archived?).to eq true
    end
  end
end
