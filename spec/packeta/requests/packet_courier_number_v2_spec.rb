RSpec.describe Packeta::PacketCourierNumberV2 do
  describe '#call' do
    let(:label) { Packeta::LabelPdf.new(packet_id: 1, format: 'A6 on A6') }
    let(:courier_number) { 'mock_number' }
    let(:response) do
      LibXML::XML::Document.new.tap do |doc|
        response = LibXML::XML::Node.new('response')

        status = LibXML::XML::Node.new('status')
        status.content = 'ok'

        number = LibXML::XML::Node.new('courierNumber')
        number.content = courier_number

        result = LibXML::XML::Node.new('result')
        result << number

        response << status
        response << result

        doc.root = response
      end
    end

    before do
      allow(HTTP)
        .to receive(:post)
        .with(ENV['PACKETA_HOST'], anything)
        .and_return(response)
    end

    it 'returns result with courier number' do
      result = described_class.new(label).call

      expect(result.courier_number).to eq(courier_number)
    end
  end
end
