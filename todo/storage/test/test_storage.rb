require '../lib/storage'
require 'test/unit'

class Todo_test < Test::Unit::TestCase
   def test_one
     assert_equal 'hello',Storage.load
  
     assert_equal true, Storage.dump
  end    
end

