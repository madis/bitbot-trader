module Bitbot
  module Trader
    module Providers
      class MtGox
        # Parses raw open orders
        #
        class OpenOrderParser
          include Virtus

          attribute :oid,              String
          attribute :currency,         String
          attribute :type,             String
          attribute :effective_amount, Hash,  writer_class: AmountWriter
          attribute :price,            Price, writer_class: PriceWriter
          attribute :type,             String

          # Makes raw open order hash into OpenOrder object
          #
          # @return [OpenOrder]
          #
          # @api private
          #
          def parse
            OpenOrder.new(
              id: oid,
              price: price,
              amount: effective_amount,
              bid: type == "bid"
            )
          end
        end
      end
    end
  end
end
