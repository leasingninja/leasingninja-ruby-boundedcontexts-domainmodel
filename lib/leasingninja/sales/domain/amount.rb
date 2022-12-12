# frozen_string_literal: true

module LeasingNinja
  module Sales
    module Domain
      class Amount

        def initialize(amount_in_cents, currency)
          @amount_in_cents, @currency = amount_in_cents, currency
        end

        def self.of(amount, currency)
          Amount.new((amount * 100).round, currency)
        end

        def self.of_cents(amount_in_cents, currency)
          Amount.new(amount_in_cents, currency)
        end

        def amount
          amount_in_cents / 100
        end

        attr_reader :amount_in_cents

        attr_reader :currency

        def ==(other)
          if other.is_a? Amount
            @amount_in_cents == other.amount_in_cents && @currency == other.currency
          else
            false
          end
        end

        alias eql? ==

        def hash
          final int prime = 31
          int result = 1
          result = prime * result + amount_in_cents.hash
          result = prime * result + currency.hash
          result
        end

      end
    end
  end
end


