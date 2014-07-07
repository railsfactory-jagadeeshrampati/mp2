class Spell_digit      
 NUMS = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety',
  100 => 'hundred',
  1000 => 'thousand',
  1000000 => 'million',
  1000000000 => 'billion'
}

def self.convert(number)
  s = 1
  c = ""
  ret = []
  while number > 0
    c = print_num(number % 1000, s)  
      ret.push c
  number /= 1000
    s *= 1000
  end
  ret = ret.reverse.join ' '
    return ret
end

def self.print_num(num1, s)
  return '' if num1 == 0

  ret = ''
  until NUMS[num1]
    if num1 > 100
      ret = ret + NUMS[num1/100] + ' hundred '
      num1 = num1 % 100
       if num1==0
          return ret
       end
    else
      ret = ret + NUMS[num1 - num1 % 10] + ' '
      num1 = num1 % 10
    end
  end
  ret = ret + NUMS[num1] + ' '
  (s > 1 ? ret + NUMS[s] : ret).strip
end   
end



