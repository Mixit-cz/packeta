module Packeta
  class PacketCourierLabelPdfResult < Result
    def pdf
      if ok?
        Base64.decode64(@response.find_first("result").content)
      end
    end
  end
end
