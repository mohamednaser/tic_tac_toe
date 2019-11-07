# frozen_string_literal: true

require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

describe Game do
  let(:first) { Player.new }
  let(:second) { Player.new }
  before do
    first.symbol = :x
    second.symbol = :o
    @game = Game.new first, second
  end

  describe '#initialize' do
    it 'sets @board to a 3 by 3 matrix with nils' do
      all_nil = @game.board.all? { |row| row.all?(NilClass) }
      expect(all_nil).to be_truthy
    end

    it 'sets @player to @first' do
      expect(@game.player).to eq(first)
    end

    it 'sets @moves to 0' do
      expect(@game.moves).to eq(0)
    end

    it 'sets @state to :playing' do
      expect(@game.state).to eq(:playing)
    end
  end

  context 'setting the board' do
    describe '#board=' do
      it 'should raise NoMethodError' do
        expect { @game.board = [] }.to raise_error(NoMethodError)
      end
    end
  end

  context 'getting the board' do
    describe '#board' do
      it 'should not raise an error' do
        expect { @game.board }.not_to raise_error
      end

      it 'should return an array' do
        expect(@game.board).to be_instance_of(Array)
      end

      it 'should contain three arrays' do
        expect(@game.board).to be_all(Array)
      end

      it 'every array is made of integers from 1 to 9 or nils' do
        def integer_or_nil
          @game.board.all? do |array|
            array.all? do |element|
              element.instance_of?(Integer) &&
                element.between?(1, 9) ||
                element.nil?
            end
          end
        end

        expect(integer_or_nil).to be_truthy
        (1..6).each { |move| @game.make_move move }
        expect(integer_or_nil).to be_truthy
      end
    end
  end

  context 'setting the player' do
    describe '#player=' do
      it 'should raise an error' do
        expect { @game.player = Player.new }.to raise_error(NoMethodError)
      end
    end
  end

  context 'getting the player' do
    describe '#player' do
      it 'should return one of the players' do
        is_one_of_the_players = @game.player.eql?(first) ||
          @game.player.eql?(second)
        expect(is_one_of_the_players).to be_truthy
      end
    end
  end

  context 'setting the moves' do
    describe '#moves=' do
      it 'should raise an error' do
        expect { @game.moves = 10 }.to raise_error(NoMethodError)
      end
    end
  end

  context 'getting the moves' do
    describe '#moves' do
      it 'should not raise an error' do
        expect { @game.moves }.not_to raise_error
      end
    end

    context 'no moves at all' do
      describe '#moves' do
        it 'should return 0' do
          expect(@game.moves).to eq(0)
        end
      end
    end

    context 'some moves' do
      describe '#moves' do
        it 'should return an integer between 0 and 9' do
          is_integer = @game.moves.is_a? Integer
          is_between = @game.moves.between? 0, 9
          expect(is_integer && is_between).to be_truthy
        end
      end
    end
  end

  describe '#board_string' do
    it 'gives a string representing the board' do
      board_as_string_zero = " -  -  - \n -  -  - \n -  -  - \n"
      board_as_string_one = " x  x  - \n -  o  - \n -  x  o \n"
      expect(@game.board_string).to eq(board_as_string_zero)
      moves = [1, 5, 2, 9, 8]
      moves.each { |move| @game.make_move(move) }

      expect(@game.board_string).to eq(board_as_string_one)
    end
  end

  describe '#playing' do
    it 'gives false if @state is not equal to :playing' do
      @game.state = :winner
      expect(@game.playing).to be_falsy
    end
    it 'gives true if @state is equal to :playing' do
      expect(@game.playing).to be_truthy
    end
  end

  describe '#swap_players' do
    it 'check swap players after success move' do
      current_player = @game.player
      @game.make_move(3)
      expect(@game.player).not_to eq(current_player)
    end
  end

  describe '#make_move' do
    context '#winner?' do
      it 'changes the state to winner' do
        moves = [1, 5, 2, 9, 8, 4, 3]
        moves.each { |move| @game.make_move(move) }

        expect(@game.state).to eql(:winner)
      end
    end
    context 'having a draw' do
      it 'changes the state to draw' do
        moves = [1, 5, 3, 7, 4, 2, 8, 6, 9]
        moves.each { |move| @game.make_move(move) }

        expect(@game.state).to eql(:draw)
      end
    end
  end
end
