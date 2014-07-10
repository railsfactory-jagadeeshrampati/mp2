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
return @completed.size
end

def self.add(items)
@pending << items
return @pending.count
end

def self.complete(num)
@completed << @pending[num - 1]
@pending.delete_at(num - 1)
return @completed.size
end

def self.delete(num)
@completed.delete_at(num-1)
return @completed.size
end

def self.modify(num , item)
@pending[num-1] = item
return @pending[num-1]
end

def self.empty
@pending.clear
@completed.clear
@todo.clear
return true
end

def self.show_pending(num)
return @pending[num-1]
end

def self.show_completed(num)
return @completed[num-1]
end

end
