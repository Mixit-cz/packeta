module Packeta
  class PacketStatusResult < Result
    def date_time
      @response.find_first("result/dateTime").content if ok?
    end

    def status_code
      @response.find_first("result/statusCode").content if ok?
    end

    def code_text
      @response.find_first("result/codeText").content if ok?
    end

    def status_text
      @response.find_first("result/statusText").content if ok?
    end

    def branch_id
      @response.find_first("result/branchId").content if ok?
    end

    def destination_branch_id
      @response.find_first("result/destinationBranch_Id").content if ok?
    end

    def external_tracking_code
      @response.find_first("result/externalTrackingCode").content if ok?
    end

    def is_returning
      @response.find_first("result/isReturning").content if ok?
    end

    def store_until
      @response.find_first("result/storeUntil").content if ok?
    end

    def carrier_id
      @response.find_first("result/carrierId").content if ok?
    end

    def carrier_name
      @response.find_first("result/carrierName").content if ok?
    end
  end
end
