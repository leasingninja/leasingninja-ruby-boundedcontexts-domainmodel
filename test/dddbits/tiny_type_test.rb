# frozen_string_literal: true

require 'minitest/autorun'

require 'lib/dddbits/tiny_type'

module DDDBits
  class TinyTypeTest < Minitest::Test

    class Firstname < TinyType
      def initalize(value)
        super(value)
      end
    end

    class Lastname < TinyType
      def initalize(value)
        super(value)
      end
    end

    def test_givenAValueObject_whenGetValue_thenValueIsEqualToTheString
      # given
      vo = TinyType.new('The string value')

      # when
      value = vo.value()

      # then
      assert_equal('The string value', value)
    end

    def test_givenTwoValueObjectsOfSameTypeWithSameValue_whenEquals_thenTrue
      # given
      vo1 = Firstname.new('Otto')
      vo2 = Firstname.new('Otto')

      # when
      equal = vo1 == vo2

      # then
      assert_equal(true, equal)
    end

    def test_givenTwoValueObjectsOfDifferentSubtypeWithSameValue_whenEquals_thenFalse
      # given
      vo1 = Firstname.new('Otto')
      vo2 = Lastname.new('Otto')

      # when
      equal = vo1 == vo2

      # then
      assert_equal(false, equal)
    end

    def test_givenAValueObject_whenCallingToString_thenItReturnsSubClassNameAndValue
      # given
      vo = Firstname.new('Otto')

      # when
      String string = vo.to_s

      # then
      assert_equal('Firstname [Otto]', string)
    end
  end
end
