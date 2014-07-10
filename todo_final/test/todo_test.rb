require '../lib/todo.rb'

require 'test/unit'


class Testtodo < Test::Unit::TestCase

def test_empty
assert_equal true, Todolist.empty
assert_equal 0, Todolist.pending
assert_equal 0, Todolist.list
assert_equal 0, Todolist.completed
end
def test_add_first
assert_equal 1, Todolist.add("open")
assert_equal 1, Todolist.pending
assert_equal 1, Todolist.list
assert_equal 0, Todolist.completed
end
def test_add_second
assert_equal 2, Todolist.add("save")
assert_equal 2, Todolist.pending
assert_equal 2, Todolist.list
assert_equal 0, Todolist.completed
end
def test_add_third
assert_equal 3, Todolist.add("edit")
assert_equal 3, Todolist.pending
assert_equal 3, Todolist.list
assert_equal 0, Todolist.completed
end
def test_complete
assert_equal 1, Todolist.complete(1)
assert_equal 2, Todolist.pending
assert_equal 3, Todolist.list

end
def test_delete
assert_equal 0, Todolist.delete(1)
assert_equal 2, Todolist.pending
assert_equal 2, Todolist.list
end
def test_modify
assert_equal "close", Todolist.modify(2,"close")
assert_equal 0, Todolist.completed
assert_equal 2, Todolist.pending
assert_equal 2, Todolist.list
end
def test_show_pending
assert_equal "close", Todolist.show_pending(2)
end
def test_show_completed
assert_equal nil, Todolist.show_completed(1)
end

end
