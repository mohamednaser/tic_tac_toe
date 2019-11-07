# frozen_string_literal: true

require_relative '../lib/player.rb'

describe Player do
  describe '#initalize' do
    let(:test_player_obj) { Player.new }

    it 'check initalize with default symbol ' do
      player_obj = Player.new

      expect(player_obj.symbol).to eq(:x)
    end

    context 'initalize with argument ' do
      it 'valid argument' do
        player_obj = Player.new(:o)

        expect(player_obj.symbol).to eq(:o)
      end
    end

    context 'create first player ' do
      before { Player.current = nil }
      it 'check current to be first when create a new player instance ' do
        test_case = test_player_obj.class.current
        expected_result = 'first'

        expect(test_case).to eq(expected_result)
      end
    end

    context 'second player object ' do
      before { Player.current = 'first' }
      it 'check current to be second after initalize another player object ' do
        test_case = test_player_obj.class.current
        expected_result = 'second'

        expect(test_case).to eq(expected_result)
      end
    end
  end

  describe '#name' do
    it 'check set player name correctly ' do
      first_player_obj = Player.new
      test_case = first_player_obj.name = 'mohamed'
      expected_result = 'mohamed'

      expect(test_case).to eql(expected_result)
    end
  end

  describe '#symbol' do
    it 'check set player symbol correctly ' do
      first_player_obj = Player.new
      first_player_obj.name = 'mohamed'
      first_player_obj.symbol = :x

      test_case = first_player_obj.symbol
      expected_result = :x

      expect(test_case).to eql(expected_result)
    end
  end
end
