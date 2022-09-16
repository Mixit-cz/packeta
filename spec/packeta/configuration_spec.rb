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

    it "returns requests api password" do
      request = Packeta::CreatePacket.new({})
      expect(request.configuration.api_password).to eq(ENV["PACKETA_API_PASSWORD"])
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

  context "with instance configuration" do
    before do
      Packeta.reset
    end

    it "returns the correct API key" do
      configuration = Packeta::Configuration.new(api_key: ENV["PACKETA_API_KEY"])
      expect(configuration.api_key).to eq(ENV["PACKETA_API_KEY"])
    end

    it "returns the correct API password" do
      configuration = Packeta::Configuration.new(api_password: ENV["PACKETA_API_PASSWORD"])
      expect(configuration.api_password).to eq(ENV["PACKETA_API_PASSWORD"])
    end

    it "returns the correct API base URL" do
      configuration = Packeta::Configuration.new(base_url: ENV["PACKETA_BASE_URL"])
      expect(configuration.base_url).to eq(ENV["PACKETA_BASE_URL"])
    end

    it "raises error with requests api password due incomplete instance configuration" do
      configuration = Packeta::Configuration.new(api_key: 'yyy')
      request = Packeta::CreatePacket.new({}, configuration)
      expect { request.configuration.api_password }.to raise_error(Packeta::Errors::Configuration)
    end

    it "returns requests api password" do
      configuration = Packeta::Configuration.new(api_password: ENV["PACKETA_API_PASSWORD"])
      request = Packeta::CreatePacket.new({}, configuration)
      expect(request.configuration.api_password).to eq(ENV["PACKETA_API_PASSWORD"])
    end

    it "raises error with requests wrong api password" do
      configuration = Packeta::Configuration.new(api_password: 'xxx')
      request = Packeta::CreatePacket.new({}, configuration)
      expect(request.configuration.api_password).not_to eq(ENV["PACKETA_API_PASSWORD"])
    end
  end
end
