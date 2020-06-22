RSpec.describe Packeta::Configuration do
  context "with configuration block" do
    it "returns the correct host" do
      expect(Packeta.configuration.host).to eq(ENV["PACKETA_HOST"])
    end

    it "returns the correct API password" do
      expect(Packeta.configuration.api_password).to eq(ENV["PACKETA_API_PASSWORD"])
    end

    it "returns the correct API key" do
      expect(Packeta.configuration.api_key).to eq(ENV["PACKETA_API_KEY"])
    end

    it "returns the correct base URL" do
      expect(Packeta.configuration.base_url).to eq(ENV["PACKETA_BASE_URL"])
    end
  end

  context "without configuration block" do
    before do
      Packeta.reset
    end

    it "raises configuration error for missing API password" do
      expect { Packeta.configuration.api_password }.to raise_error(Packeta::Errors::Configuration)
    end

    it "raises configuration error for missing API key" do
      expect { Packeta.configuration.api_key }.to raise_error(Packeta::Errors::Configuration)
    end
  end
end
