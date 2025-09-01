module PacketaRequestsHelper
  def request_mock(instance, label)
    xml_parts = label.xml.map(&:to_s).join("\n  ")
    body = "<#{instance.action}>\n  <apiPassword>#{ENV['PACKETA_API_PASSWORD']}</apiPassword>\n  #{xml_parts}\n</#{instance.action}>"

    {
      body: body
    }
  end

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
