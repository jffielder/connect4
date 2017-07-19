#ruby/rspec/connect_four/spec/connect4_spec.rb
require 'Connect4'

describe Connect4 do 



  describe "Setup" do

    c4 = Connect4.new
    board = c4.board


    it "returns board" do
      expect(c4.board).to be_instance_of(Board)
    end

    it "is empty" do
      expect(board.empty?).to eql(true)
      end 

  end #create_board

  describe ".add_piece" do
    
    before(:each) do
        @c4 = Connect4.new
    end

    context "with first piece in column 1" do
      it "makes the board at space [0,0] white" do
        @c4.add_piece(0)  
        expect(@c4.board.spaces[[0,0]]).to eql("white")
      end
    end

    context "with a second(black) piece in column 1" do
      it "makes the board at space [0,1] black" do
        @c4.add_piece(0)
        @c4.add_piece(0)
        expect(@c4.board.spaces[[0,1]]).to eql("black")
      end
    end

    context "with column one full" do
      it "returns false" do
        6.times do @c4.add_piece(0) end
        expect(@c4.add_piece(0)).to eql(false)
      end
    end
  end #add_piece

  describe ".check_win" do

    before(:each) do
      @c4 = Connect4.new
    end

    context "with no win on board" do 
      it "returns false" do
        expect(@c4.check_win).to eql(false)
      end
    end

    context "with 4 whites in column 1" do
      it "returns true" do
        4.times do 
          @c4.add_piece(0) 
          @c4.board.switch_player
        end
        @c4.board.switch_player
        expect(@c4.check_win).to eql(true)
      end
    end

    context "with 4 blacks in col 1-4" do
      it "returns true" do
        @c4.add_piece(6)
        4.times do |i|
          @c4.add_piece(i)
          @c4.board.switch_player
        end
        @c4.board.switch_player
        expect(@c4.check_win).to eql(true)
      end
    end

    context "with 4 whites along a diagonal from [0,0] to [3,3]" do
      it "returns true" do
        #add black
        3.times do |i|
          (i+1).times do |x|
            @c4.board.switch_player
            @c4.add_piece(i+1)
          end
        end
        4.times do |x|
          @c4.add_piece(x)
          @c4.board.switch_player
        end
        @c4.board.switch_player
        expect(@c4.check_win).to eql(true)
      end
    end
  end #check_win

  describe ".draw_board" do
    it "looks cool" do
      c4 = Connect4.new
      3.times do |x| c4.add_piece(x) end
      2.times do c4.add_piece(2) end
      c4.add_piece(0)
      c4.draw_board
      except(true).to eql(false)
    end
  end


end