# frozen_string_literal: true

class Game
  attr_reader :state, :symbol
  def initialize(symbol)
    @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    @state = :playing
    @symbol = symbol.to_sym
    @moves_counter = 0
  end

  def over?
    return false if state == :playing

    true
  end

  def draw_board
    to_print = ''
    @board.each do |row|
      row.each do |column|
        to_print += column.nil? ? ' - ' : " #{column} "
      end
      to_print << "\n"
    end
    print "The Board Looks Like : \n"
    print to_print
  end

  def valid_move(move)
    move_creds = map_move_to_x_y(move)
    @board[move_creds['x']][move_creds['y']].nil?
  end

  def make_choice(move)
    @moves_counter += 1
    move_creds = map_move_to_x_y(move)
    @board[move_creds['x']][move_creds['y']] = @symbol.to_s
    @state = winner? ? :winner : :draw if @moves_counter == 9
    @state = winner? ? :winner : :playing unless @moves_counter == 9
    swap_symbol unless over?
  end

  private

  include Helpers

  def swap_symbol
    @symbol = @symbol == :x ? :o : :x
  end

  def winner?
    winner_vectors = [
      [@board[0][0], @board[0][1], @board[0][2]],
      [@board[1][0], @board[1][1], @board[1][2]],
      [@board[2][0], @board[2][1], @board[2][2]],
      [@board[0][0], @board[1][0], @board[2][0]],
      [@board[0][1], @board[1][1], @board[2][1]],
      [@board[0][2], @board[1][2], @board[2][2]],
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[2][0], @board[1][1], @board[0][2]]
    ]
    winner_vectors.any? { |vector| vector.all? @symbol.to_s }
  end
end
