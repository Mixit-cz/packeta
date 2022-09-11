module Packeta
  class Request
    attr_accessor :action, :obj, :configuration

    def initialize(obj, configuration = Packeta.configuration)
      @obj = obj
      @configuration = configuration
    end

    def action
      raise Errors::NotImplemented, "Do not call Packeta::Request directly."
    end

    def body
      node = LibXML::XML::Node.new(action)
      node << LibXML::XML::Node.new("apiPassword", @configuration.api_password)
      node
    end

    def call
      response = HTTP.post(@configuration.host, body: xml)
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
