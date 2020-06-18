module Packeta
  class Request
    cattr_accessor :action, :obj

    def initialize(obj)
      @obj = obj
    end

    def action
      raise Errors::NotImplemented, "Do not call Packeta::Request directly."
    end

    def body
      node = LibXML::XML::Node.new(action)
      node << LibXML::XML::Node.new("apiPassword", Packeta.configuration.api_password)
      node
    end

    def call
      response = HTTP.post(Packeta.configuration.host, body: xml)
      klass = "#{action}Result".classify
      namespaced_klass = "Packeta::#{klass}".constantize
      namespaced_klass.new(response)
    end

    def xml
      node = body

      if @obj.xml.is_a?(Array)
        @obj.xml.each { |x| node << x }
      else
        node << @obj.xml
      end

      node.to_s
    end
  end
end
