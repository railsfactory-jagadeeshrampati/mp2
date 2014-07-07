require '../lib/numbers'
require 'test/unit'


class TestNumbers < Test::Unit::TestCase



  def test_num
    assert_equal '1st',Numbers.convert(1)
    assert_equal '9th',Numbers.convert(9)
    assert_equal '3rd',Numbers.convert(3)
    assert_equal '15th',Numbers.convert(15)
    assert_equal '21st',Numbers.convert(21)
    assert_equal '22nd',Numbers.convert(22)
    assert_equal '91st',Numbers.convert(91)
    
  end



end 
