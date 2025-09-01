RSpec.describe Packeta::PacketCourierLabelPdf do
  include PacketaRequestsHelper

  describe '#call' do
    let(:label) { Packeta::CourierLabelPdf.new(packet_id: 1, format: Packeta::Entity::LABEL_FORMATS.first, courier_number: 'number') }
    let(:label_pdf_content) { 'mock PDF content' }

    let(:response) do
      api_response_mock do |result_node|
        result_node.content = Base64.encode64(label_pdf_content)
      end
    end

    before do
      allow(HTTP).to receive(:post).with(ENV['PACKETA_HOST'], anything).and_return(response)
    end

    it 'returns result with PDF file content' do
      result = described_class.new(label).call

      expect(result.pdf).to eq(label_pdf_content)
    end
  end
end
