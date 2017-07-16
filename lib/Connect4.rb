#ruby/rspec/connect_four/lib/connect4.rb

class Connect4


end



class Player
  attr_accessor :color

end


class Board


  def empty?()

  end

end


class Piece
  attr_accessor :color

  def inititalize(color)
    @color = color
  end
end

=begin
| ◉ | ● | ○ |   |   |
| ◌ | ◌ | ◌ |   |   |
| ◦ |   |   |   |   |
| ◦ |   |   |   |   |
| ◦ |   |   |   |   |
| ◦ |   |   |   |   |
|   |   |   |   |   |

=end