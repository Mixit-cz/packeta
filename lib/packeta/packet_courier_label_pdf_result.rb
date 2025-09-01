module Packeta
  class PacketCourierLabelPdfResult < Result
    def pdf
      return unless ok?

      Base64.decode64(@response.find_first("result").content)
    end
  end
end
