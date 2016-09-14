module AreAnagrams
    def self.are_anagrams?(string_a, string_b)
        if string_a && string_b
          if string_a.length != string_b.length
            return false
          else
            char_hash = Hash.new(0)
            string_a.each_char do |element|
              char_hash[element] += 1
            end
            string_b.each_char do |element|
              return false  if char_hash[element] <= 0
              char_hash[element] -= 1
            end

            return true
          end
        else
          return "Not a valid input"
        end
    end
end
