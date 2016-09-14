module AreAnagrams
    def self.are_anagrams?(string_a, string_b)
        if string_a && string_b
          if string_a.sum == string_b.sum
            return true
          else
            return false
          end
        else
          return "Not a valid input"
        end
    end
end
