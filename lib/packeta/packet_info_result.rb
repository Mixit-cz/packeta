require 'active_support/core_ext/hash/conversions'

module Packeta
  class PacketInfoResult < Result
    def barcode
      return unless ok?

      @response.find_first('result/courierInfo/courierInfoItem/courierBarcodes/courierBarcode').content
    end

    def to_h
      return unless ok?

      Hash.from_xml(response.to_s).dig('response', 'result', 'courierInfo', 'courierInfoItem')
    end
  end
end
