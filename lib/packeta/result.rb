module Packeta
  class Result
    attr_accessor :response

    def initialize(response)
      @response = LibXML::XML::Document.string(response.to_s).find_first("/response")
      check_for_errors unless Packeta.configuration.debug
    end

    def check_for_errors
      if fault?
        info = @response.find_first("string").content
        detail = @response.find_first("detail").content
        error = @response.find_first("fault").content

        message = [info, detail].compact.join(" - ")

        case error
        when "IncorrectApiPasswordFault"
          raise Errors::IncorrectAPIPassword, message
        when "PacketAttributesFault"
          raise Errors::PacketAttributes, message
        when "AttributesFault"
          raise Errors::Attributes, message
        when "CustomBarcodeNotAllowedFault"
          raise Errors::CustomBarcodeNotAllowed, message
        when "DateOutOfRangeFault"
          raise Errors::DateOutOfRange, message
        when "DispatchOrderNotAllowedFault"
          raise Errors::DispatchOrderNotAllowed, message
        when "NoPacketIdsFault"
          raise Errors::NoPacketIDs, message
        when "NotSupportedFault"
          raise Errors::NotSupported, message
        when "PacketIdFault"
          raise Errors::PacketID, message
        when "PacketIdsFault"
          raise Errors::PacketIDs, message
        when "SenderNotExistsFault"
          raise Errors::SenderNotExists, message
        when "UnknownLabelFormatFault"
          raise Errors::UnknownLabelFormat, message
        when "ExternalGatewayFault"
          raise Errors::ExternalGateway, message
        when "InvalidCourierNumberFault"
          raise Errors::InvalidCourierNumber, message
        end
      end
    end

    def ok?
      status == "ok"
    end

    def fault?
      status == "fault"
    end

    def status
      @response.find_first("status").content
    end
  end
end
