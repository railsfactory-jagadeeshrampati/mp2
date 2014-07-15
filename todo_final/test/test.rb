require '../lib/todo.rb'
require 'test/unit'


class Testtodo < Test::Unit::TestCase
	
       def setup
	  @t = Todolist.new("jagadeesh.txt")
       end
 
     def teardown
       @t=nil
     end
 def test_storage1
		 # precondition
		 @t.empty
		 @t.add("goto market ")
		 @t.add("goto movie ")
                 @t.add("buy books ")
	       
		 #before state
		 assert_equal 3,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 3,@t.list.size
                 
                 #action
                  @t.complete(1)
                  @t.complete(2)
                  @t.save_to_file("rj.txt")
                 #after saving   
                
                 assert_equal 3,@t.save_to_file("rj.txt") #checking the number of tasks in a file
                 
                 #deleting the elements of array
                 @t.empty
                 assert_equal 0,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 0,@t.list.size
                 
                 # calling load function
                 @t.load_from_file("rj.txt")
                 #after loading
                 assert_equal 1,@t.pending.size
		 assert_equal 2,@t.completed.size
		 assert_equal 3,@t.list.size
                 assert_equal "buy books #done",@t.show_completed(2) 
                 assert_equal "goto market #done",@t.show_completed(1) 
                 assert_equal "goto movie #undone",@t.show_pending(1) 
                 
      end

               
end
 

