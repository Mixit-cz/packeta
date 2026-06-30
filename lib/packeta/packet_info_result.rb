require 'active_support/core_ext/array/wrap'
require 'active_support/core_ext/hash/conversions'
require 'active_support/core_ext/object/blank'

module Packeta
  class PacketInfoResult < Result
    def barcode
      return unless ok?

      response.find_first('result/courierInfo/courierInfoItem/courierBarcodes/courierBarcode').content
    end

    def to_h
      return unless ok?

      Hash.from_xml(response.to_s).dig('response', 'result', 'courierInfo', 'courierInfoItem')
    end

    def courier_tracking_urls
      tracking_url_data = to_h&.dig('courierTrackingUrls', 'courierTrackingUrl')

      Array.wrap(tracking_url_data).map do |url_data|
        url_data&.[]('url').presence
      end.compact
    end
  end
end
