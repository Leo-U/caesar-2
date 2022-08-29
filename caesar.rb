def caesar_cipher(str, shift)
  return str if shift % 26 == 0

  #make large shift values small (small values unaffected). negative shift stays negative.
  if shift > 0
    shift = shift % 26
  elsif shift < 0
    shift = shift % -26
  end
  #------

  arr = str.chars.map do |chr|
    #
    chr.ord.between?(65, 90) || chr.ord.between?(97, 122) ? chr = [chr.ord] : chr = chr

    if chr.is_a?(Array) then
      if chr[0].between?(65, 90)
        if (chr[0] + shift).between?(65, 90) == false
          if shift > 0
            chr[0] = shift - (91 - chr[0]) + 65
          elsif shift < 0
            chr[0] = chr[0] - 64 + 90 + shift
          end
        else
          chr[0] = chr[0] + shift
        end
      elsif chr[0].between?(97, 122)
        if (chr[0] + shift).between?(97, 122) == false
          if shift > 0
            chr[0] = shift - (123 - chr[0]) + 97
          elsif shift < 0
            chr[0] = chr[0] - 96 + 122 + shift
          end
        else
          chr[0] = chr[0] + shift
        end
      end
      chr[0] = chr[0].chr
    else
      chr = chr
    end
  end
  
  arr.join
end