def caesar_cipher(str, shift)
  return str if shift % 26 == 0
  if shift > 0 then shift = shift % 26
  elsif shift < 0 then shift = shift % -26
  end
  arr = str.chars.map do |chr|
    if (65..90) === chr.ord then range = (65..90)
    elsif (97..122) === chr.ord then range = (97..122)
    end
    if range != nil
      chr = chr.ord
      if (65..90) === (chr + shift) || (97..122) === (chr + shift)
        chr = chr + shift
      else
        if shift > 0 then chr = shift - (range.last + 1 - chr) + range.first
        elsif shift < 0 then chr = chr - (range.first - 1) + range.last + shift
        end
      end
      chr = chr.chr
    else
      chr = chr
    end
  end
  arr.join
end