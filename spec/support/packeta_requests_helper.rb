module PacketaRequestsHelper
  def api_response(status: 'ok', &response)
    LibXML::XML::Document.new.tap do |result|
      response_node = LibXML::XML::Node.new('response')
      result_node = LibXML::XML::Node.new('result')
      status_node = LibXML::XML::Node.new('status')

      yield(result_node)

      status_node.content = status
      response_node << status_node
      response_node << result_node

      result.root = response_node
    end
  end
end
