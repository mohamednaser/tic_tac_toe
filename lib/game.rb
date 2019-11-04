# frozen_string_literal: true

require_relative 'helpers'

class Game
  attr_reader :state, :board, :player

  def initialize(first, second)
    @board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
    @state = :playing
    @first = first
    @second = second
    @player = @first
    @moves = 0
  end

  def playing
    state.eql? :playing
  end

  def board_string
    to_print = ''
    @board.each do |row|
      row.each do |column|
        to_print += column.nil? ? ' - ' : " #{column} "
      end
      to_print << "\n"
    end
    to_print
  end

  def make_move(number)
    @moves += 1
    move = Helpers::Mappers.map_number number
    @board[move[:x]][move[:y]] = @player.symbol.to_s
    @state = winner? ? :winner : :draw if @moves.eql? 9
    @state = winner? ? :winner : :playing unless @moves.eql? 9
    swap_players if playing
  end

  private

  def swap_players
    @player = @player.eql?(@first) ? @second : @first
  end

  def winner?
    symbol_as_string = @player.symbol.to_s
    @board.any? { |row| row.all? symbol_as_string } ||
    columns.any? { |column| column.all? symbol_as_string } ||
    diagonals.any? { |diagonal| diagonal.all? symbol_as_string }
  end

  def columns
    [
      [@board[0][0], @board[1][0], @board[2][0]],
      [@board[0][1], @board[1][1], @board[2][1]],
      [@board[0][2], @board[1][2], @board[2][2]]
    ]
  end

  def diagonals
    [
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[2][0], @board[1][1], @board[0][2]]
    ]
  end
end
