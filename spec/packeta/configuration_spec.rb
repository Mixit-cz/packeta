RSpec.describe Packeta::Configuration do
  context "with configuration block" do
    it "returns the correct host" do
      expect(Packeta.configuration.host).to eq(ENV["PACKETA_HOST"])
    end

    it "returns the correct API key" do
      expect(Packeta.configuration.api_key).to eq(ENV["PACKETA_API_KEY"])
    end
  end

  context "without configuration block" do
    before do
      Packeta.reset
    end

    it "raises configuration error for missing API key" do
      expect { Packeta.configuration.api_key }.to raise_error(Packeta::Errors::Configuration)
    end
  end
end
