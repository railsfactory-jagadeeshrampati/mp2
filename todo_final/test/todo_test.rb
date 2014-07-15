require '../lib/todo.rb'
require 'test/unit'


class Testtodo < Test::Unit::TestCase
	
       def setup
	  @t = Todolist.new("jagadeesh.txt")
       end
 
     def teardown
       @t=nil
     end
   
	def test_zempty
	    @t.empty
	    assert_equal 0,@t.pending.size
	    assert_equal 0,@t.completed.size
	    assert_equal 0,@t.list.size
	end

    
        def test_add1
	   @t.empty
	   @t.add("one")
	   assert_equal 1,@t.list.size
	   assert_equal 1,@t.pending.size
	   assert_equal 0,@t.completed.size
	 end



	def test_add2
	   @t.empty
	   @t.add("one")
	   @t.add("two")
	   assert_equal 2,@t.list.size
	   assert_equal 2,@t.pending.size
	   assert_equal 0,@t.completed.size
	end

	def test_complete
		
		# precondition
		@t.empty
		@t.add("one")
                @t.add("two")
		#before state
		assert_equal 2,@t.pending.size
		assert_equal 0,@t.completed.size
		assert_equal 2,@t.list.size


		#action
		   @t.complete(1)

		#after 
		assert_equal 1,@t.pending.size
		assert_equal 1,@t.completed.size
		assert_equal 2,@t.list.size
	end



	def test_delete

		 # precondition
		 @t.empty
		 @t.add("one")
		 @t.complete(1)

		 
		 #before state
		 assert_equal 0,@t.pending.size
		 assert_equal 1,@t.completed.size
		 assert_equal 1,@t.list.size

		#action
		 @t.delete(1)
	 
		 #after
		 assert_equal 0,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 0,@t.list.size
	 end


	 def test_modify
		 # precondition
		 @t.empty
		 @t.add("one")
		 @t.add("two")
	       
		 #before state
		 assert_equal 2,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 2,@t.list.size

		#action
		 @t.modify(1,"three")
	 
		 #after
		 assert_equal 2,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 2,@t.list.size
	end

	 def test_show_pending
		 # precondition
		 @t.empty
		 @t.add("one")
		 @t.add("two")
	       
		 #before state
		 assert_equal 2,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 2,@t.list.size

		#action
		 @t.show_pending(1)
	 
		 #after
		 assert_equal 2,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 2,@t.list.size
                 assert_equal "one #undone",@t.show_pending(1)
                 
	end

	 def test_show_complete
		 # precondition
		 @t.empty
		 @t.add("one")
		 @t.add("two")
                 @t.add("three")
	       
		 #before state
		 assert_equal 3,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 3,@t.list.size

		#action
		 @t.complete(1)    
                @t.save       
		 #after
		 assert_equal 2,@t.pending.size
		 assert_equal 1,@t.completed.size
		 assert_equal 3,@t.list.size
                 assert_equal "one #done",@t.show_completed(1) 
                 
	end
	def test_storage
		 # precondition
		 @t.empty
		 @t.add("goto market")
		 @t.add("goto movie")
                 @t.add("buy books")
	       
		 #before state
		 assert_equal 3,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 3,@t.list.size
                 
                 #action
                  @t.complete(1)
                  @t.complete(2)
                  @t.save
          
                 #after saving   
                
                 assert_equal 3,@t.save #checking the number of tasks in a file 
                 
                 #deleting the elements of array
                 @t.empty
                 assert_equal 0,@t.pending.size
		 assert_equal 0,@t.completed.size
		 assert_equal 0,@t.list.size
                 
                 # calling load function
                 @t.load1
                 #after loading
                 assert_equal 1,@t.pending.size
		 assert_equal 2,@t.completed.size
		 assert_equal 3,@t.list.size
                 assert_equal "buy books #done",@t.show_completed(2) 
                 assert_equal "goto market #done",@t.show_completed(1) 
                 assert_equal "goto movie #undone",@t.show_pending(1) 
                 
       end
       def test_storage1
		 # precondition
		 @t.empty
		 @t.add("goto market")
		 @t.add("goto movie")
                 @t.add("buy books")
	       
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
 

