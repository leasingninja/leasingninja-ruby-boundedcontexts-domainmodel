# frozen_string_literal: true

module LeasingNinja
  module Sales
    module Domain
      class Currency

        private

        def initialize(currency_string)
          @currency_string = currency_string
        end

        public

        def to_s
          @currency_string
        end

        EUR = Currency.new('EUR')
        GBP = Currency.new('GBP')
        USD = Currency.new('USD')

      end
    end
  end
end
