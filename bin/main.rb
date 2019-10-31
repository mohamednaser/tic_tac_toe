#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Welcome to Tic Tac Toe game!'
puts 'Developed by @mohamed_naser and @santiago-rodrig'
puts
puts 'First Player : Enter Your Name '
first_player_name = gets.strip

puts 'Choose your symbol! X or O'
first_player_symbol = gets.strip.downcase

while first_player_symbol != 'x' && first_player_symbol != 'o'
  puts "Wrong input!\nYou should choose X or O!"
  first_player_symbol = gets.strip.downcase
end

puts 'Second Player : Enter Your Name '
second_player_name = gets.strip


second_player_symbol = first_player_symbol == 'x' ? 'o' : 'x'

puts "welcome #{first_player_name} with symbol (#{first_player_symbol}) and #{second_player_name} with symbol (#{second_player_symbol}) to our tic toc game"


board = <<STRING
 * | * | *
 * | * | *
 * | * | *
STRING

# This has no logic! Read the milestone 2! This is just a mockup...
# This loop is just an example, we don't want an infinite loop
6.times do |i|
  loop do
    if i % 2 != 0 
      puts "#{first_player_name} : Choose your number! 1-9"
    else
      puts "#{second_player_name} : Choose your number! 1-9"
    end
    choice = gets.strip.to_i
    break if (1..9).include? choice
  end
  puts 'Your choice is valid! printing current state of board...'
  puts "The board looks like:"
  puts board
  # check if the game is over
  # check if it is a draw
  # if it is not a draw then it is a win scenario for the current player
  # change the symbols
  # increment turns
end

puts "Well done #{second_player_name} you are the winner "
puts 'Game over!'
