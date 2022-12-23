# frozen_string_literal: true

module LeasingNinja
  module Sales
    module Domain
      # Simulates the infamous HP12c calculator that is widely used in the leasing industry.
      ## @Service
      class FinancialCalculator
        def self.pmt(n, i_in_percent, pv, fv, s)
          i = i_in_percent / 100.0

          return (-1 * pv - fv) / n if i.zero?

          (i * (fv + pv * (1 + i)**n)) / ((1 + i * s) * (1 - (1 + i)**n))
        end
      end
    end
  end
end
