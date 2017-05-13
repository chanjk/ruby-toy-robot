require 'robot'

describe Robot do
  describe "#move" do
    context "given a NORTH-facing robot" do
      it "returns a robot one unit up" do
        expect(Robot.new(0, 0, Directions::NORTH).move).to have_attributes(x: 0, y: 1, direction: Directions::NORTH)
      end
    end

    context "given a EAST-facing robot" do
      it "returns a robot one unit right" do
        expect(Robot.new(1, 1, Directions::EAST).move).to have_attributes(x: 2, y: 1, direction: Directions::EAST)
      end
    end

    context "given a SOUTH-facing robot" do
      it "returns a robot one unit down" do
        expect(Robot.new(2, 2, Directions::SOUTH).move).to have_attributes(x: 2, y: 1, direction: Directions::SOUTH)
      end
    end

    context "given a WEST-facing robot" do
      it "returns a robot one unit left" do
        expect(Robot.new(3, 3, Directions::WEST).move).to have_attributes(x: 2, y: 3, direction: Directions::WEST)
      end
    end
  end
end
