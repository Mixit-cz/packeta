module Packeta
  class CreatePacketResult < Result
    def id
      @response.find_first("result/id").content if ok?
    end

    def barcode
      @response.find_first("result/barcode").content if ok?
    end

    def barcode_text
      @response.find_first("result/barcodeText").content if ok?
    end
  end
end
