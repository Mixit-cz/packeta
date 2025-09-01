module Packeta
  class PacketCourierNumberV2Result < Result
    def courier_number
      @response.find_first('result/courierNumber').content if ok?
    end
  end
end
