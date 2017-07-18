#ruby/rspec/connect_four/spec/connect4_spec.rb
require 'Connect4'

describe Connect4 do 

  before do
    c4 = Connect4.new
  end


  describe '.create_board' do

    #c4 = Connect4.new

    it "returns board" do
      expect(c4.create_board).to be_instance_of(Board)
    end

    b = c4.create_board

    it "is empty" do
      expect(b.empty?).to eql(true)
      end 

  end #create_board

  describe ".add_piece" do
    context "first piece in coloumn 1" do
      it "makes the board at space [0,0] white" do
        c4 = Connect4.new
        board = c4.create_board
        c4.add_piece(0)

        expect(board.spaces[[0,0]]).to eql("white")
      end
    end
  end #add_piece


end