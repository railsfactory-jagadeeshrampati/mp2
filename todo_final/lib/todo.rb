
class Todolist
attr_accessor :filename,:todo,:completed,:pending

def initialize(filename)
@filename = filename
@todo = []
@completed = []
@pending = []
end

def pending
  @pending
end

def list
@todo = @pending + @completed
 @todo
end

def completed
 @completed
end

def add(items)
@todo << items
@pending << items
@pending
end

def complete(num)
@completed << @pending[num - 1]
@pending.delete_at(num - 1)
@completed
end

def delete(num)
@completed.delete_at(num-1)
 @completed
end

def modify(num , item)
@pending[num-1] = item
 return @pending[num - 1]
end

def empty
@pending.clear
@completed.clear
@todo.clear
return true
end

def show_pending(num)
return @pending[num-1]
end

def show_completed(num)
return @completed[num-1]
end

def save
f = File.open(@filename, "w")
str =""
str = @todo.join("\n")
f.write(str)
f.close
end

def load1
@todo = open(@filename).map { |line| line.split('\n')[0] }
@completed = @todo.select { |c| c.match(/#Done/) }
@pending = @todo - @completed
return @todo.size
end
end
