# frozen_string_literal: true

require 'lib/dddbits/tiny_type'

module LeasingNinja
  module Sales
    module Domain
      class Interest < DDDBits::TinyType
        def per_month
          @value / 12.0
        end
      end
    end
  end
end
