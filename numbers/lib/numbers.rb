class Numbers

  def self.convert(number)
      num = number
        if num%10 == 1
           "#{number}st"
        elsif num%10 == 2
           "#{number}nd"
         elsif num <20 and num>10
             "#{number}th"
          elsif num%10 == 3
            "#{number}rd"
         else
                 "#{number}th"
     end
                             
end 
end 


