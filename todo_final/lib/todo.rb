$todo = []
$completed = []
$pending = []
class Todolist
attr_accessor :filename

def initialize(filename)
@filename = filename
end

def pending
return $pending.size
end

def list
$todo = $pending + $completed
return $todo.size
end

def completed
return $completed.length
end

def add(items)
$todo << items
$pending << items
return $pending.length
end

def complete(num)
$completed << $pending[num - 1]
$pending.delete_at(num - 1)
return $completed.size
end

def delete(num)
$completed.delete_at(num-1)
return $completed.size
end

def modify(num , item)
$pending[num-1] = item
return $pending.length
end

def empty
$pending.clear
$completed.clear
$todo.clear
return $todo.size
end

def show_pending(num)
return $pending[num-1]
end

def show_completed(num)
return $completed[num-1]
end

def save
f = File.open(@filename, "w")
str =""
str = $todo.join("\n")
f.write(str)
f.close
count = File.foreach(@filename).inject(0) {|c, line| c+1}
return count
end

def load1
$todo = open(@filename).map { |line| line.split('\n')[0] }
$completed = $todo.select { |c| c.match(/#Done/) }
$pending = $todo - $completed
return $todo.size
end
end
