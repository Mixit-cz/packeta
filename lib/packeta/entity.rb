module Packeta
  class Entity < Dry::Struct
    def xml
      attributes.map do |k, v|
        create_node(k, v)
      end
    end

    private

    def create_node(name, value = nil, type = nil)
      node = LibXML::XML::Node.new(name.to_s.camelize(:lower))
      node.content = value.to_s unless value.nil?
      LibXML::XML::Attr.new(node, "type", type) unless type.nil?
      node
    end
  end
end
