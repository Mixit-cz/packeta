require "bundler/setup"
require "packeta"

ENV["PACKETA_HOST"] ||= "https://www.zasilkovna.cz/api/rest"
ENV["PACKETA_BASE_URL"] ||= "https://www.zasilkovna.cz/api"
ENV["PACKETA_API_KEY"] ||= "abcdefgh"
ENV["PACKETA_API_PASSWORD"] ||= "abcdefgh"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Packeta.configure do |config|
      config.host = ENV["PACKETA_HOST"]
      config.api_password = ENV["PACKETA_API_PASSWORD"]
      config.api_key = ENV["PACKETA_API_KEY"]
      config.base_url = ENV["PACKETA_BASE_URL"]
    end
  end
end
