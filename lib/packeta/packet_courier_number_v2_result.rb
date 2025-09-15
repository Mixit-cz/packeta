module Packeta
  class PacketCourierNumberV2Result < Result
    def courier_number
      return unless ok?

      @response.find_first('result/courierNumber').content
    end
  end
end
