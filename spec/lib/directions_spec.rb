require 'directions'

describe Directions do
  describe Directions::NORTH do
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

  describe Directions::EAST do
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

  describe Directions::SOUTH do
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

  describe Directions::WEST do
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
end
