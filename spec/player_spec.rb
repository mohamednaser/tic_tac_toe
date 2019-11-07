# frozen_string_literal: true

require_relative '../lib/player.rb'

describe Player do
  let(:player) { Player.new }

  context 'first player has been created' do
    describe '#initialize' do
      it "should set the current player to 'first'" do
        expect(player.class.current).to eq('first')
      end
    end
  end

  context 'secon player has been created' do
    describe '#initialize' do
      it "should set the current player to 'second'" do
        expect(player.class.current).to eq('second')
      end
    end
  end

  context 'setting the name for the player' do
    describe '#name' do
      it 'should not raise NoMethodError' do
        expect { player.name = 'some name' }.not_to raise_error(NoMethodError)
      end
    end
  end

  context 'getting the name of the player' do
    describe '#name' do
      it 'should not raise NoMethodError' do
        expect { player.name }.not_to raise_error(NoMethodError)
      end
    end
  end

  context 'setting the symbol of the player' do
    describe '#symbol' do
      it 'should not raise NoMethodError' do
        expect { player.symbol = :x }.not_to raise_error(NoMethodError)
      end
    end
  end

  context 'getting the symbol of the player' do
    describe '#symbol' do
      it 'should not raise NoMethodError' do
        expect { player.symbol }.not_to raise_error(NoMethodError)
      end
    end
  end
end
