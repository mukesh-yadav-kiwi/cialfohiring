require 'spec_helper'

describe Flatten do
  describe "#make_flat" do

      it "should flatten a single dimension array" do
        input_array = [1, [2, 4],[5,[ 7, 9]]]
        output_array = [1, 2, 4, 5, 7, 9]
        expect(Flatten.new.make_flat(input_array)).to eq(output_array)
      end

      it "should flatten a single dimension array in sorted form" do
        input_array = [1, [7,2],[3,[4,5]]]
        output_array = [1, 2, 3, 4, 5, 7]
        expect(Flatten.new.make_flat(input_array)).to eq(output_array)
      end

  end
end
