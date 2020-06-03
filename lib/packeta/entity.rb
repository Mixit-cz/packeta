module Packeta
  class Entity < Dry::Struct
    def xml
      raise Errors::NotImplemented, "Do not call Packeta::Entity directly."
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
