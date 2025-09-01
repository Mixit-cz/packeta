RSpec.describe Packeta::PacketCourierNumberV2 do
  include PacketaRequestsHelper

  describe '#call' do
    let(:label) { Packeta::LabelPdf.new(packet_id: 1, format: Packeta::Entity::LABEL_FORMATS.first) }
    let(:request) { described_class.new(label) }
    let(:courier_number) { 'mock_number' }
    let(:response) do
      expected_response do |result_node|
        number = LibXML::XML::Node.new('courierNumber')
        number.content = courier_number

        result_node << number
      end
    end

    before do
      allow(HTTP).to receive(:post).with(ENV['PACKETA_HOST'], expected_request(request)).and_return(response)
    end

    it 'returns result with courier number' do
      result = request.call

      expect(result.courier_number).to eq(courier_number)
    end
  end
end
