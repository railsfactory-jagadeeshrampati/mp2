class Numbers

  def self.convert(number)
      num = number.to_i
        if num <20 and num>10
             "#{number}th"
         elsif  num%10 == 1
           "#{number}st"
          elsif num%10 == 2
           "#{number}nd"
          elsif num%10 == 3
            "#{number}rd"
         else
                 "#{number.to_i}th"
     end
                             
end 
end 
