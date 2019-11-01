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
require 'player'

puts 'Welcome to Tic Tac Toe game!'
puts 'Developed by @mohamed_naser and @santiago-rodrig'
puts

print 'First player, please enter your name: '
first_player_name = gets.strip

print 'Choose your symbol! X or O: '
first_player_symbol = gets.strip.downcase

while !Validations.valid_symbol(first_player_symbol)
  puts "Wrong input!\nYou should choose X or O!"
  first_player_symbol = gets.strip.downcase
end

print 'Second player, please enter your name: '
second_player_name = gets.strip

second_player_symbol = first_player_symbol == 'x' ? 'o' : 'x'

puts "Welcome #{first_player_name}, your symbol is: #{first_player_symbol}"
puts "Welcome #{second_player_name}, your symbol is: #{second_player_symbol}"

first_player_obj = Player.new(first_player_name , first_player_symbol)
second_player_obj = Player.new(second_player_name , second_player_symbol)

game = Game.new(first_player_obj , second_player_obj)

until game.over?
  game.draw_board
  puts "Player #{game.curent_player_name} choose your number!"
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
  puts "Player #{game.curent_player_name} is the winner!"
when :draw
  puts 'Nobody wins!'
end