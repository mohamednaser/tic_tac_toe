#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Welcome to Tic Tac Toe game!'
puts 'Developed by @mohamed_naser and @santiago-rodrig'
puts
puts 'Choose your symbol! X or O'
symbol = gets.strip.downcase

while symbol != 'x' && symbol != 'o'
  puts "Wrong input!\nYou should choose X or O!"
  symbol = gets.strip
end

board = <<STRING
 * | * | *
 * | * | *
 * | * | *
STRING

i = 0
# This loop is just an example, we don't want an infinite loop
while i < 3
  puts 'Choose your number! 1-9'
  choice = gets.strip.downcase.to_i
  puts 'Your choice is valid! printing current state of board...'
  puts "The board looks like:"
  puts board
  # check if the game is over
  i += 1
end

puts 'Game over!'
# puts player-x is the winner
