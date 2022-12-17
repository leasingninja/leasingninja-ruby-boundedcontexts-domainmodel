# frozen_string_literal: true

require 'minitest/autorun'

require 'lib/leasing_ninja/sales/domain/amount'
require 'lib/leasing_ninja/sales/domain/currency'

module LeasingNinja
  module Sales
    module Domain

      class AmountTest < Minitest::Test
        def test_givenTwoEqualAmounts_whenEquals_thenAreEqual
          # given
          amount1 = Amount.of(100, Currency::EUR)
          amount2 = Amount.of(100, Currency::EUR)

          # when
          are_equal = amount1 == amount2

          # then
          assert_equal(true, are_equal)
        end

        def test_givenTwoUnequalAmounts_whenEquals_thenAreNotEqual
          # given
          amount1 = Amount.of(100, Currency::EUR)
          amount2 = Amount.of(200, Currency::EUR)

          # when
          # when
          are_equal = amount1 == amount2

          # then
          assert_equal(false, are_equal)
        end

        def test_givenTwoAmountsWithRoundingAfterThePoint_whenEquals_thenAreEqual
          # given
          amount1 = Amount.of(100.45, Currency::EUR)
          amount2 = Amount.of(100.447123, Currency::EUR)

          # when
          are_equal = amount1 == amount2

          # then
          assert_equal(true, are_equal)
        end

        def test_givenAnAmountsWithCents_whenToString_thenAfterThePointIsCorrectlyPrinted
          # given
          amount = Amount.of(100.45, Currency::EUR)

          # when
          amount_string = amount.to_s

          # then
          assert_equal('EUR 100.45', amount_string)
        end

        def test_givenTwoAmountsOfEurosAndCents_whenEquals_thenAreEqual
          # given
          amount1 = Amount.of(100.45, Currency::EUR)
          amount2 = Amount.of_cents(10_045, Currency::EUR)

          # when
          are_equal = amount1 == amount2

          # then
          assert_equal(true, are_equal)
        end

      end
    end
  end
end
