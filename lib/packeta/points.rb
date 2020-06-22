module Packeta
  class Points
    def self.paczkomat
      get_points(3060)
    end

    def self.get_points(*ids)
      ids = ids.join(",")
      url = [
        Packeta.configuration.base_url,
        Packeta.configuration.api_key,
        "point.json"
      ].join("/")

      response = HTTP.get(url, params: { ids: ids })

      if response.status.success?
        points = Oj.load(response.body.to_s)
      else
        raise Errors::Error, response.body.to_s
      end
    end
  end
end
