module PacketaRequestsHelper
  def expected_payload(request)
    LibXML::XML::Node.new(request.action).tap do |xml|
      api_password_node = LibXML::XML::Node.new('apiPassword', ENV['PACKETA_API_PASSWORD'])

      xml << api_password_node
      request.obj.xml.each { |entity_node| xml << entity_node }
    end.to_s
  end

  def expected_response(status: 'ok', &result_creator)
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
