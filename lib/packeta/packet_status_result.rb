module Packeta
  class PacketStatusResult < Result
    def date_time
      @response.find_first("result/date_time").content if ok?
    end

    def status_code
      @response.find_first("result/status_code").content if ok?
    end

    def code_text
      @response.find_first("result/barcode_text").content if ok?
    end

    def status_text
      @response.find_first("result/status_text").content if ok?
    end

    def branch_id
      @response.find_first("result/branch_id").content if ok?
    end

    def destination_branch_id
      @response.find_first("result/destination_branch_id").content if ok?
    end

    def external_tracking_code
      @response.find_first("result/external_tracking_code").content if ok?
    end

    def is_returning
      @response.find_first("result/is_returning").content if ok?
    end

    def store_until
      @response.find_first("result/store_until").content if ok?
    end

    def carrier_id
      @response.find_first("result/carrier_id").content if ok?
    end

    def carrier_name
      @response.find_first("result/carrier_name").content if ok?
    end
  end
end
