# frozen_string_literal: true

require_relative '../lib/player.rb'

describe Player do
  let(:player_one) { Player.new }

  describe '#name' do
    it 'should allow to read the name' do
      player_one.name = 'mohamed'
      expect(player_one.name).to eq('mohamed')
    end
  end
  describe '#name=' do
    it 'should allow to set the name' do
      expect(player_one.name = 'santiago').to eq('santiago')
    end
  end
  describe '#symbol' do
    it 'should allow to read the symbol' do
      player_one.symbol = :x
      expect(player_one.symbol).to eq(:x)
    end
  end
  describe '#symbol=' do
    it 'should allow to set the symbol' do
      expect(player_one.symbol = :o).to eq(:o)
    end
  end
  describe '#initialize' do
    context 'first player created' do
      it "should set @@current to 'first'" do
      end
    end
    context 'second player created' do
      let(:player_two) { Player.new }

      it "should set @@current to 'second'" do
      end
    end
  end
  describe '.current' do
  end
end
