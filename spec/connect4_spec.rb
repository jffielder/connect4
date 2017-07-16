#ruby/rspec/connect_four/spec/connect4_spec.rb

require 'Connect4'

describe "Connect4" do

  describe ".setup_board" do
    it "creates new board" do
      expect(Connect4.setup_board).to be_an_instance_of(Board)
    end

    describe Board do
      it "has all spaces empty" do
        expect(Connect4.empty?).to eql(true)
      end
    end

  end #setup_board

end
