# frozen_string_literal: true

require_relative 'helpers'

class Player
  attr_accessor :name, :symbol
  @@current = nil

  def initialize
    @@current = @@current.nil? ? 'first' : 'second'
  end

  def self.current
    @@current
  end

  def self.current=(current)
    @@current = current
  end
end
