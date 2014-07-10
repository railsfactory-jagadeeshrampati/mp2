class Storage
	def self.dump 
		f = File.open("todo.txt","w")
               a = "hello world"
               f.write(a)
               f.close
              self.load
	end
	def self.load
         data = ""
         f = File.open("todo.txt","r")
         data = f.read
         f.close
       return data.strip			
	end
end

 
