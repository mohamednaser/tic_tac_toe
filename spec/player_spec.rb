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
    end
  end
  describe '#symbol' do
    it 'should allow to read the symbol' do
    end
  end
  describe '#symbol=' do
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
