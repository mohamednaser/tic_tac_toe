#!/usr/bin/env ruby
# frozen_string_literal: true

lib_path = __dir__.split('/')
lib_path.pop
lib_path << 'lib'
lib_path = lib_path.join '/'
$LOAD_PATH << lib_path

require 'validations'
require 'helpers'
require 'game'

puts 'Welcome to Tic Tac Toe game!'
puts 'Developed by @mohamed_naser and @santiago-rodrig'
puts
puts 'Choose your symbol! X or O'
symbol = gets.strip.downcase

until Validations.valid_symbol(symbol)
  puts "Wrong input!\nYou should choose X or O!"
  symbol = gets.strip.downcase
end

game = Game.new symbol

until game.over?
  game.draw_board
  puts "Player #{game.symbol} choose your number!"
  choice = gets.strip.downcase
  choice_numeric = choice.to_i
  until Validations.valid_number(choice_numeric) && game.valid_move(choice_numeric)
    unless Validations.valid_number(choice_numeric)
      puts 'Your choice is not valid! you should choose from 1 to 9, not ' + choice
      choice = gets.strip.downcase
      choice_numeric = choice.to_i
      next
    end
    next if game.valid_move(choice_numeric)

    puts 'That position is already taken...'
    choice = gets.strip.downcase
    choice_numeric = choice.to_i
  end
  game.make_choice(choice_numeric)
end

puts
puts 'Game over!'
puts
game.draw_board
puts

case game.state
when :winner
  puts "Player #{game.symbol} is the winner!"
when :draw
  puts 'Nobody wins!'
end
