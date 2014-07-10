require '../lib/storage'
require 'test/unit'
#require '../home/sureka/Desktop/mp2/todo/todo.txt'
class Todo_test < Test::Unit::TestCase
   def test_dump
     assert_equal 'hello world',Storage.dump
    end
   def test_load
     assert_equal 'hello world',Storage.load 
   end
 
end

