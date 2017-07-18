#ruby/rspec/connect_four/lib/Connect4.rb

class Connect4


  def create_board
    Board.new
  end


end


class Board
  attr_accessor :spaces, :color

  def initialize
    6.times do |x|
      5.times do |y|
        @spaces = {[x,y] => nil}
      end
    end    
  end


  def empty?
    6.times do |x|
      5.times do |y|
        return false if !@spaces[[x,y]].nil?
      end
    end

    return true
  end

end


=begin
| ◉ | ● | ○ |   |   |   |   | 
| ◌ | ◌ | ◌ |   |   |   |   | 
| ◦ |   |   |   |   |   |   | 
| ◦ |   |   |   |   |   |   | 
| ◦ |   |   |   |   |   |   | 
| ◦ |   |   |   |   |   |   | 

7x6

[0..6, 0..5]

=end