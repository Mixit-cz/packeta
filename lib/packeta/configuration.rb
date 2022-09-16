module Packeta
  class Configuration
    attr_accessor :debug
    attr_writer :host, :api_password, :api_key, :base_url

    def initialize(options = {})
      @host = options[:host] || "https://www.zasilkovna.cz/api/rest"
      @base_url = options[:base_url] || "https://www.zasilkovna.cz/api"
      @api_key = options[:api_key]
      @api_password = options[:api_password]
      @debug = options[:debug] || false
    end

    def host
      raise Errors::Configuration, "Packeta host missing!" unless @host
      @host
    end

    def api_password
      raise Errors::Configuration, "Packeta API password missing!" unless @api_password
      @api_password
    end

    def base_url
      raise Errors::Configuration, "Packeta base URL missing!" unless @base_url
      @base_url
    end

    def api_key
      raise Errors::Configuration, "Packeta API key missing!" unless @api_key
      @api_key
    end
  end
end
