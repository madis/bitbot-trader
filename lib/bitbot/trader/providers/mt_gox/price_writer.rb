require "virtus"

module Bitbot
  module Trader
    module Providers
      class MtGox
        # Coerces price objects
        #
        class PriceWriter < Virtus::Attribute::Writer::Coercible
          # Parses price or volume
          #
          # @param [Hash] data
          #
          # @return [Hash]
          #
          # @api private
          #
          def coerce(data)
            ValueWithCurrency.parse(data, 5)
          end
        end
      end
    end
  end
end
