# frozen_string_literal: true

require 'lib/dddbits/tiny_type'

module LeasingNinja
  module Sales
    module Domain
      class LeaseTerm < DDDBits::TinyType
        class << self
          def of_months(no_of_months)
            of(no_of_months)
          end

          def of_years(no_of_years)
            of(no_of_years * 12)
          end
        end

        def no_of_months
          @value
        end
      end
    end
  end
end
