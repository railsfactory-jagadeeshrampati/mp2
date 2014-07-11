class Loading
def load
   todo = []
   completed = []
 pending = []
   f = File.open("todo.txt",'r')
   f.each_line { |line| todo << line }
   completed = todo.select {|c| c.match("#done")}
    pending = todo - completed
puts "---todo list  array------"   
puts todo
 puts "-----completed array-----"
 puts completed
puts "-------pending array-----"
 puts pending
   f.close   
end
end
l = Loading.new
l.load 
