# frozen_string_literal: true

require 'minitest/autorun'

require 'lib/leasing_ninja/sales/domain/lease_term'

module LeasingNinja
  module Sales
    module Domain
      class LeaseTermTest < Minitest::Test
        def test_given_whenALeaseTermIsCreatedOfYears_thenNoOfMonthsIsCorrect
          # given

          # when
          lease_term = LeaseTerm.of_years(4)

          # then
          assert_equal(48, lease_term.no_of_months)
        end

      end
    end
  end
end
