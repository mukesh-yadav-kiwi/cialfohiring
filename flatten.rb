class Flatten

  def initialize
    @flatten_array = []
  end


  def make_flat(array)
    array.each do |element|
      if element.class != Array
        @flatten_array.push(element)
      else
        make_flat(element)
      end
    end
    return @flatten_array.sort
  end
end
