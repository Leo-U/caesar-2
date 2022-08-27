def caesar_cipher(str, shift)
  return str if shift % 26 == 0

  new_arr = str.chars
  new_arr = new_arr.map do |element|
    element.ord.between?(65, 90) || element.ord.between?(97, 122) ? element = [element.ord] : element = element
  end

  if shift > 0
    shift = shift % 26
  elsif shift < 0
    shift = shift % -26
  end

  new_arr = new_arr.map do |element|
    if element.is_a?(Array) then
      if element[0].between?(65, 90)
        if (element[0] + shift).between?(65, 90) == false
          if shift > 0
            element[0] = shift - (91 - element[0]) + 65
          elsif shift < 0
            element[0] = element[0] - 64 + 90 + shift
          end
        else
          element[0] = element[0] + shift
        end
      elsif element[0].between?(97, 122)
        if (element[0] + shift).between?(97, 122) == false
          if shift > 0
            element[0] = shift - (123 - element[0]) + 97
          elsif shift < 0
            element[0] = element[0] - 96 + 122 + shift
          end
        else
          element[0] = element[0] + shift
        end
      end
      element[0] = element[0].chr
    else
      element = element
    end
  end
  new_arr.join
end