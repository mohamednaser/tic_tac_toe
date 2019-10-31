#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Welcome to Tic Tac Toe game!'
puts 'Developed by @mohamed_naser and @santiago-rodrig'
puts
print 'First player, please enter your name: '
first_player_name = gets.strip
print 'Choose your symbol! X or O: '
first_player_symbol = gets.strip.downcase
while first_player_symbol != 'x' && first_player_symbol != 'o'
  puts "Wrong input!\nYou should choose X or O!"
  first_player_symbol = gets.strip.downcase
end
print 'Second player, please enter your name: '
second_player_name = gets.strip
second_player_symbol = first_player_symbol == 'x' ? 'o' : 'x'
puts "Welcome #{first_player_name}, your symbol is: #{first_player_symbol}"
puts "Welcome #{second_player_name}, your symbol is: #{second_player_symbol}"
board = <<STRING
 * | * | *
 * | * | *
 * | * | *
STRING
scenario = nil
loop do
  print 'There are two possible scenarios: draw or winner, pick one: '
  scenario = gets.chomp.downcase
  break if scenario == 'winner' || scenario == 'draw'
end
case scenario
when 'winner'
  6.times do |i|
    loop do
      if i.odd?
        puts "#{first_player_name} : Choose your number! 1-9"
      else
        puts "#{second_player_name} : Choose your number! 1-9"
      end
      choice = gets.strip.to_i
      break if (1..9).include? choice
    end
    puts 'Your choice is valid! printing current state of board...'
    puts 'The board looks like:'
    puts board
    # check if the game is over
    # check if it is a draw
    # if it is not a draw then it is a win scenario for the current player
    # change the symbols
  end
  puts "Well done #{second_player_name} you are the winner "
  puts 'Game over!'
when 'draw'
  8.times do |i|
    loop do
      if i.odd?
        puts "#{first_player_name} : Choose your number! 1-9"
      else
        puts "#{second_player_name} : Choose your number! 1-9"
      end
      choice = gets.strip.to_i
      break if (1..9).include? choice
    end
    puts 'Your choice is valid! printing current state of board...'
    puts 'The board looks like:'
    puts board
    # check if the game is over
    # check if it is a draw
    # if it is not a draw then it is a win scenario for the current player
    # change the symbols
  end
  puts 'There are no winners this time!'
  puts 'Game over!'
end
