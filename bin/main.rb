#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/helpers'
require_relative '../lib/game'
require_relative '../lib/player'

welcome_message = <<-STRING
Welcome to the Tic Tac Toe game with Ruby!
Developed by @mohamed_naser and @santiago-rodrig

STRING
print welcome_message
players = []
2.times do
  player = Player.new
  players << player
  print "#{Player.current.capitalize} player, please enter your name: "
  player.name = gets.chomp
  break if Player.current.eql? 'second'
  loop do
    print "#{player.name}, please choose your symbol (x or o): "
    player.symbol = gets.chomp.downcase.to_sym
    break if Helpers::Validations.valid_symbol? player.symbol
  end
end
first, second = players
second.symbol = first.symbol.eql?(:x) ? :o : :x
players.each do |player|
  puts "Welcome #{player.name}, your symbol is: #{player.symbol}"
end
game = Game.new first, second
invalid_list = <<-STRING
|1| Is not an integer number between 1 and 9.
|2| Is a position that is already taken.

STRING
while game.playing
  puts "\n|!| Board state: \n\n#{game.board_string}\n"
  number = nil
  loop do
    print "#{game.player.name}, please choose your number: "
    number = gets.to_f
    break if Helpers::Validations.valid_move? game.board, number
    puts "\n|!| ERRROR: #{game.player.name}, that option is invalid because one of the following reasons:"
    print invalid_list
  end
  game.make_move number
end
game_over = <<-STRING

GAME OVER

|!| Final board state:

#{game.board_string}
STRING
print game_over
case game.state
when :winner
  puts "#{game.player.name}, you are the winner!"
when :draw
  puts 'Nobody wins!'
end
