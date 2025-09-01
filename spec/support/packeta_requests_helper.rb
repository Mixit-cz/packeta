module PacketaRequestsHelper
  def api_response_mock(status: 'ok', &result_creator)
    LibXML::XML::Document.new.tap do |xml|
      xml.root = LibXML::XML::Node.new('response').tap do |response|
        status_node = LibXML::XML::Node.new('status')
        result_node = LibXML::XML::Node.new('result')

        status_node.content = status
        result_creator.call(result_node)

        response << status_node
        response << result_node
      end
    end
  end
end
