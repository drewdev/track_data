module TrackData
  class Kitchen
    attr_reader :data

    def self.with(data)
      new(data)
    end

    def initialize(data)
      @data = data
    end

    def headers
      @headers ||= SavoryHeaders.from(raw.headers)
    end

    def rows
      raw.rows
    end

    def raw
      @raw ||= RawIngredients.from(data)
    end

    def serve
      chef.serve
    end

    def chef
      Chef.cook(headers, rows)
    end
  end
end
