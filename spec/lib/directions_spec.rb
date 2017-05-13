require 'directions'

describe Directions do
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
  end
end
