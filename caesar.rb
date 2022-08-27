def caesar_cipher(str, shift)
  return str if shift % 26 == 0

  #produce an array of ordinals. non-letters aren't converted. Each ordinal is an array so that it can be exclusively modified.

  new_arr = str.chars
  new_arr = new_arr.map do |element|
    element.ord.between?(65, 90) || element.ord.between?(97, 122) ? element = [element.ord] : element = element
  end

  #set shift factor equal to small value (already small are unaffected)
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
    else
      element = element
    end
  end

  print new_arr

end



  # new_var = new_var.gsub(/[a-zA-Z]/) {|chr| chr.ord.to_s + ' '}
  #



caesar_cipher("abc",0)


#1Number values need to wrap, e.g:
#90 + 1 must equal 65
#65 - 1 must equal 90
#90 + 2259 must equal 90 + wrapped small number. to make it small, use modulus.
#90 - 2259 must equal 90 + -(wrapped small number)

#Initial condition so that addition occurs on the correct values:
  #if num.between?(65, 90) || num.between?(97, 122))

#And the following execution could be:
  #step 1: shift = shift % 26. Now if the SF was a large number, the value should be correct.
  #

#How is modulus used to achieve this?
  #looks like should apply modulus to SF first. %26 looks promising, since there are 26 letters in the alphabet.
  #except maybe I should add the SF to the base value first.


#convert string characters back into letters and return the string.











#if you want an array, #codepoints is an option