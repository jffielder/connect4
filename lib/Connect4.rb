#ruby/rspec/connect_four/lib/Connect4.rb

class Connect4
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def add_piece(col)
    @board.add_to(col)
  end

  def check_win
    return @board.won?
  end

  def draw_board
    @board.draw
  end

end


class Board
  attr_accessor :spaces, :player

  def initialize
    6.times do |x|
      5.times do |y|
        @spaces = {[x,y] => nil}
      end
    end  
    @player = "white"
  end

  def switch_player
    if @player == "white"
      @player = "black"
    
    elsif @player == "black"
      @player = "white"
    end
  end

  #adds to column, returns true if works, false if doesn't
  def add_to(column)
    
    y = 0

    until spaces[[column,y]].nil? do
      y += 1
    end

    return false if y >= 6

    @spaces[[column,y]] = @player

    switch_player
    
    return true
  
  end

  def won?
    switch_player
    player = @player
    switch_player


    win_directions = [
      [-1, 1], [0, 1], [1, 1],
      [-1, 0],         [1, 0],
      [-1, -1], [0, -1], [1, -1]
    ]

    player_pieces = []

    6.times do |x|
      5.times do |y|
        player_pieces << [x,y] if @spaces[[x,y]] == player
      end
    end

    player_pieces.each do |loc|
      connected = 1

      win_directions.each do |win_direction|
          #check if pieces around loc are also in player_pieces
        connected = 1
        3.times do
          if player_pieces.include?([ loc[0]+ win_direction[0], loc[1]+ win_direction[1] ])
            connected += 1
            loc = [ loc[0]+ win_direction[0], loc[1]+ win_direction[1] ]
          end
          return true if connected == 4
        end
      end
    end
  return false 
  end #won?


  def empty?
    6.times do |x|
      5.times do |y|
        return false if !@spaces[[x,y]].nil?
      end
    end

    return true
  end

  def draw
    puts ""
    white = "●"
    black = "◍"
    5.downto(0) do |y|
      6.times do |x|
        print " | "
        if @spaces[[x,y]] == "white"
          print white
        elsif @spaces[[x,y]] == "black"
          print black
        else
          print "◌"
        end
      end
      puts " |"
    end
    print "   1    2   3    4    5   6" 
    puts "";puts ""
    
  end

end

def start_game
  puts "    Welcome To Connect Four"
  c4 = Connect4.new
  until c4.check_win == true do
    
    c4.draw_board
    puts "(#{c4.board.player}) Enter Move: "
    c4.add_piece(q = gets.chomp.to_i-1)
    return false if q < 0

  end
  c4.board.switch_player
  c4.draw_board
  puts "#{c4.board.player} Wins!"
end

start_game


=begin


| ◉ | ● | ○ |   ◍ |   |   |   | 
| ◌ | ◌ | ◌ |   |   |   |   | 
| ◦ | - |   | . |   |   |   | 
| ◦ | - | . |   |   |   |   | 
| ◦ | - |   |   |   |   |   | 
| ◦ | - |   |   |   |   |   | 
  0   1   2   3   4
7x6

[0..6, 0..5]

=end