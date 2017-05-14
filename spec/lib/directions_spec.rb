require 'directions'
require 'rantly/rspec_extensions'

describe Directions do
  all_directions = [Directions::NORTH, Directions::EAST, Directions::SOUTH, Directions::WEST]

  describe "NORTH" do
    it "is an instance of Direction" do
      expect(Directions::NORTH).to be_instance_of Directions::Direction
    end

    it "has a dx of 0" do
      expect(Directions::NORTH.dx).to be 0
    end

    it "has a dy of 1" do
      expect(Directions::NORTH.dy).to be 1
    end
  end

  describe "EAST" do
    it "is an instance of Direction" do
      expect(Directions::EAST).to be_instance_of Directions::Direction
    end

    it "has a dx of 1" do
      expect(Directions::EAST.dx).to be 1
    end

    it "has a dy of 0" do
      expect(Directions::EAST.dy).to be 0
    end
  end

  describe "SOUTH" do
    it "is an instance of Direction" do
      expect(Directions::SOUTH).to be_instance_of Directions::Direction
    end

    it "has a dx of 0" do
      expect(Directions::SOUTH.dx).to be 0
    end

    it "has a dy of -1" do
      expect(Directions::SOUTH.dy).to be -1
    end
  end

  describe "WEST" do
    it "is an instance of Direction" do
      expect(Directions::WEST).to be_instance_of Directions::Direction
    end

    it "has a dx of -1" do
      expect(Directions::WEST.dx).to be -1
    end

    it "has a dy of 0" do
      expect(Directions::WEST.dy).to be 0
    end
  end

  describe "#left" do
    context "with argument NORTH" do
      it "returns WEST" do
        expect(Directions.left(Directions::NORTH)).to be Directions::WEST
      end
    end

    context "with argument EAST" do
      it "returns NORTH" do
        expect(Directions.left(Directions::EAST)).to be Directions::NORTH
      end
    end

    context "with argument SOUTH" do
      it "returns EAST" do
        expect(Directions.left(Directions::SOUTH)).to be Directions::EAST
      end
    end

    context "with argument WEST" do
      it "returns SOUTH" do
        expect(Directions.left(Directions::WEST)).to be Directions::SOUTH
      end
    end

    describe "then #right" do
      it "returns the starting direction" do
        property_of {
          choose(*all_directions)
        }.check { |d|
          expect(Directions.right Directions.left d).to be d
        }
      end
    end

    describe "4 times in a row" do
      it "returns the starting direction" do
        property_of {
          choose(*all_directions)
        }.check { |d|
          expect(Directions.left Directions.left Directions.left Directions.left d).to be d
        }
      end
    end
  end

  describe "#right" do
    context "with argument NORTH" do
      it "returns EAST" do
        expect(Directions.right(Directions::NORTH)).to be Directions::EAST
      end
    end

    context "with argument EAST" do
      it "returns SOUTH" do
        expect(Directions.right(Directions::EAST)).to be Directions::SOUTH
      end
    end

    context "with argument SOUTH" do
      it "returns WEST" do
        expect(Directions.right(Directions::SOUTH)).to be Directions::WEST
      end
    end

    context "with argument WEST" do
      it "returns NORTH" do
        expect(Directions.right(Directions::WEST)).to be Directions::NORTH
      end
    end

    describe "then #left" do
      it "returns the starting direction" do
        property_of {
          choose(*all_directions)
        }.check { |d|
          expect(Directions.left Directions.right d).to be d
        }
      end
    end

    describe "4 times in a row" do
      it "returns the starting direction" do
        property_of {
          choose(*all_directions)
        }.check { |d|
          expect(Directions.right Directions.right Directions.right Directions.right d).to be d
        }
      end
    end
  end
end
