require 'spec_helper'

describe AreAnagrams do
  describe "#are_anagrams?" do

      it "should check for nil object and return error message" do
        expect(AreAnagrams.are_anagrams?(nil, 'first')).to eq('Not a valid input')
        expect(AreAnagrams.are_anagrams?('second', nil)).to eq('Not a valid input')
        expect(AreAnagrams.are_anagrams?(nil, nil)).to eq('Not a valid input')
      end

      it "should retrun true if two input strings are anagrams" do
        expect(AreAnagrams.are_anagrams?('momdad', 'dadmom')).to eq(true)
        expect(AreAnagrams.are_anagrams?('sunrise', 'snerius')).to eq(true)
      end

      it "should retrun false if two input strings are not anagrams" do
        expect(AreAnagrams.are_anagrams?('omdad', 'dadmom')).to eq(false)
        expect(AreAnagrams.are_anagrams?('momdad', 'zadmom')).to eq(false)
      end
  end
end
