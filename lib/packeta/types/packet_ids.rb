module Packeta
  module Types
    class PacketIds < Entity
      attribute :ids, Types::Array.of(Types::Coercible::String)

      def xml
        doc = LibXML::XML::Node.new("packetIds")
        ids.each do |id|
          doc << create_node("id", id)
        end
        doc
      end
    end
  end
end
