module Packeta
  class PacketTracking < Entity
    attribute :packetId, Types::Coercible::String

    def xml
      attributes.map do |k, v|
        create_node(k, v)
      end
    end
  end
end
