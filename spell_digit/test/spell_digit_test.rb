require '../lib/spell_digit'
require 'test/unit'


class TestSpell_digit < Test::Unit::TestCase

  def test_hello
    assert true
  end


  def test_one
   assert_equal "eleven",Spell_digit.convert(11)
   assert_equal "twelve",Spell_digit.convert(12)
   assert_equal "thirty three",Spell_digit.convert(33)
   assert_equal "fifteen",Spell_digit.convert(15)
   assert_equal "fifty three",Spell_digit.convert(53)
   assert_equal "one hundred ninety nine",Spell_digit.convert(199)
   assert_equal "hundred",Spell_digit.convert(100)
   assert_equal "two thousand two hundred thirteen",Spell_digit.convert(2213)
   assert_equal "five hundred ",Spell_digit.convert(500)
   assert_equal "five thousand ",Spell_digit.convert(5000)
   assert_equal "six hundred eighty seven",Spell_digit.convert(687)
   assert_equal "one thousand two hundred fifty",Spell_digit.convert(1250)
   assert_equal "five thousand eight hundred ninety",Spell_digit.convert(5890)
   assert_equal "eight thousand ninety",Spell_digit.convert(8090)
  end
end
