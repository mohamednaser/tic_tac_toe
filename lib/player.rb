# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol
  @@current = nil

  def initialize
    @@current = @@current.nil? ? 'first' : 'second'
  end

  def self.current
    @@current
  end
end
