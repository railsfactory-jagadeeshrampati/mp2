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
		#before state
		assert_equal 1,@t.pending.size
		assert_equal 0,@t.completed.size
		assert_equal 1,@t.list.size


		#action
		   @t.complete(1)

		#after 
		assert_equal 0,@t.pending.size
		assert_equal 1,@t.completed.size
		assert_equal 1,@t.list.size
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
                 assert_equal "one",@t.show_pending(1)
                 
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
                
		 #after
		 assert_equal 2,@t.pending.size
		 assert_equal 1,@t.completed.size
		 assert_equal 3,@t.list.size
                 assert_equal "one",@t.show_completed(1) 
                 
	end
               
end
 

