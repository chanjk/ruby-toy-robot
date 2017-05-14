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

  describe "#turn_left" do
    context "given a NORTH-facing robot" do
      it "returns a robot at the same position facing WEST" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::NORTH).turn_left).to have_attributes(x: x, y: y, direction: Directions::WEST)
        }
      end
    end

    context "given a EAST-facing robot" do
      it "returns a robot at the same position facing NORTH" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::EAST).turn_left).to have_attributes(x: x, y: y, direction: Directions::NORTH)
        }
      end
    end

    context "given a SOUTH-facing robot" do
      it "returns a robot at the same position facing EAST" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::SOUTH).turn_left).to have_attributes(x: x, y: y, direction: Directions::EAST)
        }
      end
    end

    context "given a WEST-facing robot" do
      it "returns a robot at the same position facing SOUTH" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::WEST).turn_left).to have_attributes(x: x, y: y, direction: Directions::SOUTH)
        }
      end
    end
  end

  describe "#turn_right" do
    context "given a NORTH-facing robot" do
      it "returns a robot at the same position facing EAST" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::NORTH).turn_right).to have_attributes(x: x, y: y, direction: Directions::EAST)
        }
      end
    end

    context "given a EAST-facing robot" do
      it "returns a robot at the same position facing SOUTH" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::EAST).turn_right).to have_attributes(x: x, y: y, direction: Directions::SOUTH)
        }
      end
    end

    context "given a SOUTH-facing robot" do
      it "returns a robot at the same position facing WEST" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::SOUTH).turn_right).to have_attributes(x: x, y: y, direction: Directions::WEST)
        }
      end
    end

    context "given a WEST-facing robot" do
      it "returns a robot at the same position facing NORTH" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::WEST).turn_right).to have_attributes(x: x, y: y, direction: Directions::NORTH)
        }
      end
    end
  end

  describe "#to_s" do
    context "given a NORTH-facing robot" do
      it "returns 'X,Y,NORTH' where X, Y are the robot's coordinates" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::NORTH).to_s).to eq "#{x},#{y},NORTH"
        }
      end
    end

    context "given a EAST-facing robot" do
      it "returns 'X,Y,EAST' where X, Y are the robot's coordinates" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::EAST).to_s).to eq "#{x},#{y},EAST"
        }
      end
    end

    context "given a SOUTH-facing robot" do
      it "returns 'X,Y,SOUTH' where X, Y are the robot's coordinates" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::SOUTH).to_s).to eq "#{x},#{y},SOUTH"
        }
      end
    end

    context "given a WEST-facing robot" do
      it "returns 'X,Y,WEST' where X, Y are the robot's coordinates" do
        property_of(&coordinates).check { |x, y|
          expect(Robot.new(x, y, Directions::WEST).to_s).to eq "#{x},#{y},WEST"
        }
      end
    end
  end
end
