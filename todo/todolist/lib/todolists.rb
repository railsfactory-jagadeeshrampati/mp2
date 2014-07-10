require '../../item/lib/item'

 class Todolist
   def self.add(item1)
     obj = Item.new
     t = obj.add(item1)   
       return item1
   
   end



 end 
