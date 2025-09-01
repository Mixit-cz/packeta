RSpec.describe Packeta::PacketCourierLabelPdf do
  describe '#call' do
    let(:label) { Packeta::CourierLabelPdf.new(packet_id: 1, format: 'A6 on A6', courier_number: 'number') }
    let(:pdf_content) { 'mock PDF content' }
    let(:response) do
      LibXML::XML::Document.new.tap do |doc|
        response = LibXML::XML::Node.new('response')

        status = LibXML::XML::Node.new('status')
        status.content = 'ok'

        result = LibXML::XML::Node.new('result')
        result.content = Base64.encode64(pdf_content)

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

    it 'returns result with PDF file content' do
      result = described_class.new(label).call

      expect(result.pdf).to eq(pdf_content)
    end
  end
end
