require '../lib/todo.rb'
require 'test/unit'

$t = Todolist.new("jagadeesh.txt")
class Testtodo < Test::Unit::TestCase

def test_zempty
assert_equal true, $t.empty
assert_equal 0, $t.pending
assert_equal 0, $t.list
assert_equal 0, $t.completed
end
def test_add1
assert_equal 1, $t.add("open")
assert_equal 1, $t.pending
assert_equal 1, $t.list
assert_equal 0, $t.completed
end
def test_add2
assert_equal 2, $t.add("save")
assert_equal 2, $t.pending
assert_equal 2, $t.list
assert_equal 0, $t.completed
end
def test_add3
assert_equal 3, $t.add("edit")
assert_equal 3, $t.pending
assert_equal 3, $t.list
assert_equal 0, $t.completed
end
def test_add4
assert_equal 4, $t.add("select")
assert_equal 4, $t.pending
assert_equal 4, $t.list
assert_equal 0, $t.completed
end

def test_complete
assert_equal 1, $t.complete(1)
assert_equal 3, $t.pending
assert_equal 4, $t.list
assert_equal 1, $t.completed
end

def test_delete
assert_equal 0, $t.delete(1)
assert_equal 3, $t.pending
assert_equal 3, $t.list
assert_equal 0, $t.completed
end

def test_modify
assert_equal 3, $t.modify(1,"close")
assert_equal 0, $t.completed
assert_equal 3, $t.pending
assert_equal 3, $t.list
end

def test_show_pending
assert_equal "edit", $t.show_pending(2)
end

def test_show_completed
assert_equal nil , $t.show_completed(1)
end

def test_store
assert_equal true, $t.save
end

end
  

