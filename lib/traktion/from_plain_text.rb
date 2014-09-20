module Traktion
  class FromPlainText
    attr_accessor :errors
    attr_accessor :raw
    attr_accessor :track_data
    attr_reader :pathname

    def self.use(pathname)
      new(pathname)
    end

    def initialize(pathname)
      @pathname = pathname
      @errors = []
    end

    def process
      read && prepare && (translate || native?)
    end

    def read
      self.raw = reader.parse
    end

    def reader
      Reader.for(pathname).tap{|reader| reader.use(Strategy::PlainText) }
    end

    def prepare
      self.track_data = preparer.serve
    end

    def preparer
      Kitchen.with(raw)
    end

    def translate
    end

    def native?
      true
    end
  end
end
