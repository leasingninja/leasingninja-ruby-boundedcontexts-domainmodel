# frozen_string_literal: true

require 'minitest/autorun'

require 'lib/leasing_ninja/sales/domain/interest'

module LeasingNinja
  module Sales
    module Domain
      class InterestTest < Minitest::Test
        def test_givenAnInterest_whenPerMonth_thenCorrectValue
          # given
          interest = Interest.of(3.6)

          # when
          per_month = interest.per_month

          # then
          assert_equal(0.3, per_month)
        end
      end
    end
  end
end
