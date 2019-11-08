# frozen_string_literal: true

require_relative '../lib/helpers'
require_relative '../lib/game'
require_relative '../lib/player'

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
      let(:first) { Player.new }
      let(:second) { Player.new }
      before do
        first.symbol = :x
        second.symbol = :o
        @game = Game.new first, second
      end

      it 'validates a correct move' do
        expect(Helpers::Validations.valid_move?(@game.board, 1)).to be_truthy
      end

      it 'invalidates a letter' do
        expect(Helpers::Validations.valid_move?(@game.board, 'asd')).to be_falsy
      end

      it 'invalidates a noninteger number' do
        expect(Helpers::Validations.valid_move?(@game.board, 9.7)).to be_falsy
        expect(Helpers::Validations.valid_move?(@game.board, 4.1)).to be_falsy
      end

      it 'invalidates a position that is already taken' do
        @game.make_move(1)
        expect(Helpers::Validations.valid_move?(@game.board, 1)).to be_falsy
      end
    end
  end

  describe Helpers::Mappers do
    describe '.map_number' do
      it 'maps correctly a valid number' do
        expect(Helpers::Mappers.map_number(1)).to eq(x: 0, y: 0)
        expect(Helpers::Mappers.map_number(5)).to eq(x: 1, y: 1)
        expect(Helpers::Mappers.map_number(7)).to eq(x: 2, y: 0)
        expect(Helpers::Mappers.map_number(9)).to eq(x: 2, y: 2)
      end

      it 'returns nil if the number is invalid' do
        expect(Helpers::Mappers.map_number(9.7)).to be_nil
        expect(Helpers::Mappers.map_number('123')).to be_nil
        expect(Helpers::Mappers.map_number(true)).to be_nil
      end
    end
  end
end
