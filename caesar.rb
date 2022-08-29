def caesar_cipher(str, shift)
  return str if shift % 26 == 0

  #make large shift values small (small values unaffected), negative shift stays negative:
  if shift > 0
    shift = shift % 26
  elsif shift < 0
    shift = shift % -26
  end
  #------

  arr = str.chars.map do |chr|
    
    if (65..90) === chr.ord || (97..122) === chr.ord
      chr = chr.ord
      if (65..90) === chr
        if (65..90) === (chr + shift)
          chr = chr + shift
        else
          if shift > 0
            chr = shift - (91 - chr) + 65
          elsif shift < 0
            chr = chr - 64 + 90 + shift
          end
        end
      elsif (97..122) === chr
        if (65..90) === (chr + shift)
          chr = chr + shift
        else
          if shift > 0
            chr = shift - (123 - chr) + 97
          elsif shift < 0
            chr = chr - 96 + 122 + shift
          end
        end
      end
      chr = chr.chr
    else
      chr = chr
    end
  end
  
  arr.join
end