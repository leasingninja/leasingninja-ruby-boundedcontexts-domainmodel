# frozen_string_literal: true

require 'lib/leasing_ninja/sales/domain/financial_calculator'

module LeasingNinja
  module Sales
    module Domain
      class Contract

        Calculation = Struct.new('Calculation', :lease_term, :interest, :installment)

        attr_reader :number, :lessee, :car, :price

        def initialize(number, lessee, car, price)
          @number = number
          @lessee = lessee
          @car = car
          @price = price
        end

        def calculate_installment_for(lease_term, interest)
          #requireNonNull(leaseTerm);
          #requireNonNull(interest);
          #assert !isSigned();

          in_advance = 0.0
          residual_value = 0.0

          pmt = FinancialCalculator.pmt(
            lease_term.no_of_months,
            interest.per_month,
            -1 * price.amount,
            residual_value,
            in_advance
          )

          @calculation = Calculation.new(lease_term, interest, Amount.of(pmt, price.currency))
          #assert calculated?
        end

        def calculated?
          @calculation != nil
        end

        def lease_term
          raise unless calculated?

          @calculation.lease_term
        end

        def interest
          raise unless calculated?

          @calculation.interest
        end

        def installment
          raise unless calculated?

          @calculation.installment
        end
      end
    end
  end
end
