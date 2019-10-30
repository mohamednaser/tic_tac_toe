# frozen_string_literal: true

module Validations
  def self.valid_symbol(test_symbol)
    test_symbol = test_symbol.downcase
    %w[x o].any? test_symbol
  end

  def self.valid_number(test_move)
    (1..9).include? test_move
  end
end
