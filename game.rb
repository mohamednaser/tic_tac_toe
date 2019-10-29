class Game
  @@board = Array.new(3, [' '] * 3)

  def self.start(player1, player2)
    puts "Choose your symbol! X or O"
    symbol = gets.strip.downcase
    while symbol != 'x' && symbol != 'o'
      puts "Please provide a valid symbol"
      symbol = gets.strip.downcase
    end
    # player1.symbol = symbol
    draw_board
  end

  def self.draw_board
    to_print = ""
    @@board.each do |row|
      row.each do |column|
        to_print << column + '|'
      end
      to_print << "\n"
    end
    print to_print
  end
end
