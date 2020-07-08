module Packeta
  module Types
    class Size < Entity
      attribute :length, Types::Integer
      attribute :width, Types::Integer
      attribute :height, Types::Integer

      def xml
        doc = LibXML::XML::Node.new("size")
        attributes.each do |k, v|
          doc << create_node(k, v)
        end
        doc
      end
    end
  end
end
