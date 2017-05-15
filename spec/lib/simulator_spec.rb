require 'simulator'

describe Simulator do
  describe "#play" do
    def play_with_inputs(inputs)
      allow(Simulator).to receive(:gets).and_return(*inputs)
      Simulator.play(inputs.length)
    end

    test_inputs_with_expected = [
      [["PLACE 0,0,NORTH", "REPORT"], "0,0,NORTH\n"],
      [["MOVE", "REPORT"], ""],
      [["LEFT", "REPORT"], ""],
      [["RIGHT", "REPORT"], ""],
      [["REPORT"], ""],
      [["PLACE 1,2,SOUTH", "MOVE", "REPORT"], "1,1,SOUTH\n"],
      [["PLACE 0,0,NORTH", "MOVE", "REPORT"], "0,1,NORTH\n"],
      [["PLACE 0,0,NORTH", "LEFT", "REPORT"], "0,0,WEST\n"],
      [["PLACE 0,0,SOUTH", "MOVE", "RIGHT", "MOVE", "REPORT"], "0,0,WEST\n"],
      [["PLACE 4,4,EAST", "MOVE", "LEFT", "MOVE", "REPORT"], "4,4,NORTH\n"],
      [["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"], "3,3,NORTH\n"],
      [["PLACE 4,2,WEST", "MOVE", "RIGHT", "MOVE", "MOVE", "REPORT"], "3,4,NORTH\n"],
      [["PLACE 5,5,NORTH", "REPORT"], ""],
      [["PLACE -1,-1,SOUTH", "REPORT"], ""],
      [["PLACE 1,2,NORTH", "MOVE"], ""],
      [['$@%*^#{*&^*}'], ""],
      [["PLC12NORTH", "REPORT"], ""],
      [["PLACE 4,4,SOUTH", '@#{$%^&*"}', "REPORT"], "4,4,SOUTH\n"]
    ]

    test_inputs_with_expected.each do |inputs, expected|
      context "#{inputs.join(" | ")}" do
        it "outputs '#{expected.chomp}'" do
          expect {
            play_with_inputs(inputs)
          }.to output("> " * inputs.length + expected).to_stdout
        end
      end
    end
  end
end
