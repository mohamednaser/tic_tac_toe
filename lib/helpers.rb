# frozen_string_literal: true

module Helpers
  module Validations
    def self.valid_symbol?(symbol)
      %i[x o].any? symbol
    end

    def self.valid_move?(board, number)
      return false unless number == number.to_i && number.between?(1, 9)

      mapped = Mappers.map_number number
      empty = board[mapped[:x]][mapped[:y]].nil?
      empty
    end
  end

  module Mappers
    def self.map_number(number)
      case number
      when 1
        { x: 0, y: 0 }
      when 2
        { x: 0, y: 1 }
      when 3
        { x: 0, y: 2 }
      when 4
        { x: 1, y: 0 }
      when 5
        { x: 1, y: 1 }
      when 6
        { x: 1, y: 2 }
      when 7
        { x: 2, y: 0 }
      when 8
        { x: 2, y: 1 }
      when 9
        { x: 2, y: 2 }
      end
    end
  end
end
