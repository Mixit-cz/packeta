module Packeta
  class Request
    cattr_accessor :action, :obj

    def initialize(obj)
      @obj = obj
    end

    def self.action
      raise Errors::NotImplemented, "Do not call Packeta::Request directly."
    end

    def body
      node = LibXML::XML::Node.new(self.action)
      node << LibXML::XML::Node.new("apiPassword", Packeta.configuration.api_password)
      node
    end

    def call
      response = HTTP.post(Packeta.configuration.host, body: xml)
      Packeta::Result.new(response)
    end

    def xml
      node = body
      node << @obj.xml
      node.to_s
    end
  end
end
