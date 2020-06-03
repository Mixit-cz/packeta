module Packeta
  module Errors
    class Error < StandardError; end
    class Configuration < Error; end
    class NotImplemented < Error; end
    class IncorrectAPIPassword < Error; end
    class PacketAttributes < Error; end
    class Attributes < Error; end
    class CustomBarcodeNotAllowed < Error; end
    class DateOutOfRange < Error; end
    class DispatchOrderNotAllowed < Error; end
    class NoPacketIDs < Error; end
    class NotSupported < Error; end
    class PacketID < Error; end
    class PacketIDs < Error; end
    class SenderNotExists < Error; end
    class UnknownLabelFormat < Error; end
    class ExternalGateway < Error; end
    class InvalidCourierNumber < Error; end
  end
end
