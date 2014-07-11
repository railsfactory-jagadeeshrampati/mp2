class Todolist
attr_accessor :filename,:todo,:pending,:completed
@todo = []
@pending = []
@completed = []

def self.initialize(filename)
@filename = filename
end

def self.pending
return @pending.size
end

def self.list
@todo = @pending + @completed
return @todo.size
end

def self.completed
return @completed.length
end

def self.add(items)
@todo << items
@pending << items
#self.save
#self.load1
return @pending.count
end

def self.complete(num)
@completed << @pending[num - 1]
@pending.delete_at(num - 1)
return @completed.size
end

def self.delete(num)
@completed.delete_at(num-1)
#self.save
#self.load1
return @completed.size
end

def self.modify(num , item)
@pending[num-1] = item
#self.save
#self.load1
return @pending.length
end

def self.empty
@pending.clear
@completed.clear
@todo.clear
#self.save
#self.load1
return true
end

def self.show_pending(num)
#self.save
#self.load1
return @pending[num-1]
end

def self.show_completed(num)
#self.save
#self.load1
return @completed[num-1]
end
def self.save
f = File.open("todo.txt", "w")
str =""
str = @todo.join("\n")
f.write(str)
f.close
return true
end
def self.load1
@todo = open('todo.txt').map { |line| line.split('\n')[0] }
@completed = @todo.select { |c| c.match(/#Done/) }
@pending = @todo - @completed
end
end
