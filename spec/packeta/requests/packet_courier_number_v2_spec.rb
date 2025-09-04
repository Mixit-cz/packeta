RSpec.describe Packeta::PacketCourierNumberV2 do
  include PacketaRequestsHelper

  describe '#call' do
    let(:request) do
      entity = Packeta::CourierNumberV2.new(packet_id: '1234')

      described_class.new(entity)
    end

    let(:courier_number) { 'mock_number' }

    let(:response) do
      expected_response do |result_node|
        number = LibXML::XML::Node.new('courierNumber')
        number.content = courier_number

        result_node << number
      end
    end

    before do
      expect(HTTP)
        .to receive(:post)
        .with(ENV['PACKETA_HOST'], body: expected_payload(request))
        .and_return(response)
    end

    it 'returns result with courier number' do
      result = request.call

      expect(result.courier_number).to eq(courier_number)
    end
  end
end
