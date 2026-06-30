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
            if courier_tracking_url_data.any?
              item << LibXML::XML::Node.new('courierTrackingUrls').tap do |tracking_urls|
                courier_tracking_url_data.each do |url_data|
                  tracking_urls << LibXML::XML::Node.new('courierTrackingUrl').tap do |tracking_url|
                    tracking_url << LibXML::XML::Node.new('url').tap { _1.content = url_data[:url] } if url_data.key?(:url)
                  end
                end
              end
            end
          end
        end
      end
    end

    let(:barcode) { 'testing_barcode' }
    let(:courier_name) { 'test courier' }
    let(:courier_tracking_url_data) { [] }

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

    it 'returns an empty array when courier tracking URLs are missing' do
      result = request.call

      expect(result.courier_tracking_urls).to eq([])
    end

    context 'when courierTrackingUrl is returned as an array' do
      let(:courier_tracking_url_data) do
        [
          { url: 'https://tracking.example.test/first' },
          { url: '' },
          { url: '   ' },
          { url: 'https://tracking.example.test/second' }
        ]
      end

      it 'returns all non-blank URLs' do
        result = request.call

        expect(result.courier_tracking_urls).to eq([
          'https://tracking.example.test/first',
          'https://tracking.example.test/second'
        ])
      end
    end

    context 'when courierTrackingUrl is returned as a single hash' do
      let(:courier_tracking_url_data) { [{ url: 'https://tracking.example.test/only' }] }

      it 'returns the URL' do
        result = request.call

        expect(result.courier_tracking_urls).to eq(['https://tracking.example.test/only'])
      end
    end

    context 'when courierTrackingUrl entries have blank or missing URLs' do
      let(:courier_tracking_url_data) do
        [
          { url: '' },
          {}
        ]
      end

      it 'skips blank and missing URLs' do
        result = request.call

        expect(result.courier_tracking_urls).to eq([])
      end
    end
  end
end
