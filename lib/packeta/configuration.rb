module Packeta
  class Configuration
    attr_accessor :debug
    attr_writer :host, :api_password

    def initialize
      @host = "https://www.zasilkovna.cz/api/rest"
      @api_password = nil
      @debug = true
    end

    def host
      raise Errors::Configuration, "Packeta host missing!" unless @host
      @host
    end

    def api_password
      raise Errors::Configuration, "Packeta API password missing!" unless @api_password
      @api_password
    end
  end
end
