# frozen_string_literal: true

# frozen_string_literal: true

require 'minitest/autorun'

require 'lib/leasing_ninja/sales/domain/amount'
require 'lib/leasing_ninja/sales/domain/car'
require 'lib/leasing_ninja/sales/domain/contract'
require 'lib/leasing_ninja/sales/domain/contract_number'
require 'lib/leasing_ninja/sales/domain/customer'

module LeasingNinja
  module Sales
    module Domain
      class ContractTest < Minitest::Test
        def test_givenAFilledOutContract_whenCalculate_thenInstallmentIsX
          # given
          contract = Contract.new(ContractNumber.of('4711'),
                                  Customer.of('John Buyer'),
                                  Car.of('Volkswagen ID.3'),
                                  Amount.of(40_000.00, Currency::EUR))

          # when
          contract.calculate_installment_for(LeaseTerm.of_months(48), Interest.of(3.7))

          # then
          assert_equal(true, contract.calculated?)
          assert_equal(LeaseTerm.of_months(48), contract.lease_term)
          assert_equal(Interest.of(3.7), contract.interest)
          assert_equal(Amount.of(897.80, Currency::EUR), contract.installment)
        end

      end
    end
  end
end
