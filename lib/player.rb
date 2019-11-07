# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol
  @@current = nil

  def initialize(symbol = :x)
    @@current = @@current.nil? ? 'first' : 'second'
    return false unless symbol = :x or symbol = :o
    @symbol = symbol
  end

  def self.current
    @@current
  end

  def self.current=(current)
    @@current = current
  end
end
