require 'table'
require 'rantly/rspec_extensions'

describe Table do
  describe "#contains?" do
    context "given a width and length of 1" do
      table = Table.new(1, 1)

      it "returns true when (x, y) are both 0" do
        expect(table.contains?(0, 0)). to be true
      end

      it "returns false when x is not 0" do
        expect(table.contains?(1, 0)). to be false
      end

      it "returns false when y is not 0" do
        expect(table.contains?(0, -1)). to be false
      end

      it "returns false when (x, y) are both not 0" do
        expect(table.contains?(-1, 1)). to be false
      end
    end

    context "given a width and length of 5" do
      table = Table.new(5, 5)
      valid_coord = proc { array(1) { range(0, 4) } }
      invalid_coord = proc { array(1) { branch proc { range(-100, -1) }, proc { range(5, 100) } } }

      it "returns true when (x, y) are both between 0 and 4 (both inclusive)" do
        property_of {
          call(valid_coord) + call(valid_coord)
        }.check { |x, y|
          expect(table.contains?(x, y)).to be true
        }
      end

      it "returns false when x is not between 0 to 4 (both inclusive)" do
        property_of {
          call(invalid_coord) + call(valid_coord)
        }.check { |x, y|
          expect(table.contains?(x, y)).to be false
        }
      end

      it "returns false when y is not between 0 to 4 (both inclusive)" do
        property_of {
          call(valid_coord) + call(invalid_coord)
        }.check { |x, y|
          expect(table.contains?(x, y)).to be false
        }
      end

      it "returns false when (x, y) are both not between 0 to 4 (both inclusive)" do
        property_of {
          call(invalid_coord) + call(invalid_coord)
        }.check { |x, y|
          expect(table.contains?(x, y)).to be false
        }
      end
    end
  end
end
