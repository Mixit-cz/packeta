module Packeta
  class Configuration
    attr_writer :host, :api_key

    def initialize
      @host = "https://www.zasilkovna.cz/api/rest"
      @api_key = nil
    end

    def host
      raise Errors::Configuration, "Packeta host missing!" unless @host
      @host
    end

    def api_key
      raise Errors::Configuration, "Packeta API key missing!" unless @api_key
      @api_key
    end
  end
end
