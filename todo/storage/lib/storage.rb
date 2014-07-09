class Storage
	def self.dump
		f = File.open("todo.txt","w")
	    f.write("hello")
              return File.writable?("todo.txt")
	    f.close	
	end
	def self.load
         data = ""
         f = File.open("todo.txt","r")
         data = f.read
         f.close
       return data.strip			
	end
end

 
