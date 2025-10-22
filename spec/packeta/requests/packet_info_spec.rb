RSpec.describe Packeta::PacketInfo do
  include PacketaRequestsHelper

  describe '#call' do
    let(:request) do
      entity = Packeta::Info.new(packet_id: '1234')

      described_class.new(entity)
    end

    let(:response) do
      expected_response do |result_node|
        result_node << LibXML::XML::Node.new('courierInfo').tap do |info|
          info << LibXML::XML::Node.new('courierInfoItem').tap do |item|
            item << LibXML::XML::Node.new('courierName').tap { _1.content = courier_name }
            item << LibXML::XML::Node.new('courierBarcodes').tap do |barcodes|
              barcodes << LibXML::XML::Node.new('courierBarcode').tap { _1.content = barcode }
            end
          end
        end
      end
    end

    let(:barcode) { 'testing_barcode' }
    let(:courier_name) { 'test courier' }

    before do
      expect(HTTP)
        .to receive(:post)
        .with(ENV['PACKETA_HOST'], body: expected_payload(request))
        .and_return(response)
    end

    it 'returns barcode' do
      result = request.call

      expect(result.barcode).to eq(barcode)
    end

    it 'returns full response as hash' do
      result = request.call

      expected_info =
        {
          'courierBarcodes' => { 'courierBarcode' => barcode },
          'courierName' => courier_name
        }

      expect(result.to_h).to eq(expected_info)
    end
  end
end
