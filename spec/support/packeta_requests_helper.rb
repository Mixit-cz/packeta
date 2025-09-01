module PacketaRequestsHelper
  def api_response_mock(status: 'ok', &response_creator)
    LibXML::XML::Document.new.tap do |result|
      response_node = LibXML::XML::Node.new('response')
      result_node = LibXML::XML::Node.new('result')
      status_node = LibXML::XML::Node.new('status')

      response_creator.call(result_node)

      status_node.content = status
      response_node << status_node
      response_node << result_node

      result.root = response_node
    end
  end
end
