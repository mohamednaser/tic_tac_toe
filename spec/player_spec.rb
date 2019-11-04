# frozen_string_literal: true

require_relative '../lib/player.rb'

describe Player do

  describe '.current' do
    player = Player.new

    it 'should read the current player created' do
      expect(player.class.current).to be_truthy
    end
  end
  describe '#initialize' do
    let(:player) { Player.new }

    context 'first player created' do
      it "should set @@current to 'first'" do
        expect(player_class.current).to eq('first')
      end
    end
    context 'second player created' do
      let(:player_two) { Player.new }

      it "should set @@current to 'second'" do
        expect(player_class.current).to eq('second')
      end
    end
  end
  
  let(:player) { Player.new }

  describe '#name' do
    it 'should allow to read and set the name' do
      player.name = 'mohamed'
      expect(player.name).to eq('mohamed')
    end
  end
  describe '#symbol' do
    it 'should allow to set and read the symbol' do
      player.symbol = :x
      expect(player.symbol).to eq(:x)
    end
  end
end
