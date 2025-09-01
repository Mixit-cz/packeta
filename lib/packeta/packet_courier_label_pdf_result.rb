module Packeta
  class PacketCourierLabelPdfResult < Result
    def pdf
      return unless ok?

      encoded_pdf_content = @response.find_first('result').content
      Base64.decode64(encoded_pdf_content)
    end
  end
end
