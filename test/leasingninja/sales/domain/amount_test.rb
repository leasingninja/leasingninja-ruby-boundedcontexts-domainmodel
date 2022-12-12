# frozen_string_literal: true

require 'minitest/autorun'

require 'lib/leasingninja/sales/domain/amount'

module LeasingNinja
  module Sales
    module Domain

      class AmountTest < Minitest::Test
        def test_givenTwoEqualAmounts_whenEquals_thenAreEqual
          # given
          amount1 = Amount.of(100, 'EUR')
          amount2 = Amount.of(100, 'EUR')

          # when
          are_equal = amount1 == amount2

          # then
          assert_equal(true, are_equal)
        end

        def test_givenTwoUnequalAmounts_whenEquals_thenAreNotEqual
          # given
          amount1 = Amount.of(100, 'EUR')
          amount2 = Amount.of(200, 'EUR')

          # when
          # when
          are_equal = amount1 == amount2

          # then
          assert_equal(false, are_equal)
        end

        def test_givenTwoAmountsWithRoundingAfterThePoint_whenEquals_thenAreEqual
          # given
          amount1 = Amount.of(100.45, 'EUR')
          amount2 = Amount.of(100.447123, 'EUR')

          # when
          are_equal = amount1 == amount2

          # then
          assert_equal(true, are_equal)
        end

        def test_givenTwoAmountsOfEurosAndCents_whenEquals_thenAreEqual
          # given
          amount1 = Amount.of(100.45, 'EUR')
          amount2 = Amount.of_cents(10_045, 'EUR')

          # when
          are_equal = amount1 == amount2

          # then
          assert_equal(true, are_equal)
        end

      end
    end
  end
end
