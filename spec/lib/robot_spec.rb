require 'robot'
require 'rantly/rspec_extensions'

describe Robot do
  coordinates = proc { array(2) { range(0, 100) } }

  describe "#move" do
    context "given a NORTH-facing robot" do
      it "returns a robot one unit up" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::NORTH).move).to have_attributes(x: x, y: y + 1, direction: Directions::NORTH)
        }
      end
    end

    context "given a EAST-facing robot" do
      it "returns a robot one unit right" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::EAST).move).to have_attributes(x: x + 1, y: y, direction: Directions::EAST)
        }
      end
    end

    context "given a SOUTH-facing robot" do
      it "returns a robot one unit down" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::SOUTH).move).to have_attributes(x: x, y: y - 1, direction: Directions::SOUTH)
        }
      end
    end

    context "given a WEST-facing robot" do
      it "returns a robot one unit left" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::WEST).move).to have_attributes(x: x - 1, y: y, direction: Directions::WEST)
        }
      end
    end
  end
end
