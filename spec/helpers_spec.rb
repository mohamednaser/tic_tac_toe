# frozen_string_literal: true

require_relative '../lib/helpers'
require_relative '../lib/game'

describe Helpers do
  describe Helpers::Validations do
    describe '.valid_symbol' do
      it 'validates correct symbols' do
        expect(Helpers::Validations.valid_symbol?(:x)).to be_truthy
      end
      it 'invalids wrong symbols' do
        expect(Helpers::Validations.valid_symbol?(:fgf)).to be_falsy
      end
    end
    describe '.valid_move?' do
      let(:player_one) { Player.new }
      let(:player_two) { Player.new(:o) }
      let(:game) { Game.new(player_one, player_two) }
      it 'validates a correct move' do
        expect(Helpers::Validations.valid_move?(game.board, 1)).to be_truthy
      end
      it 'invalidates a letter' do
        expect(Helpers::Validations.valid_move?(game.board, 'asd')).to be_falsy
      end
      it 'invalidates a noninteger number' do
      end
      it 'invalidates a position that is already taken' do
      end
    end
  end
end
