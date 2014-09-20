module Traktion
  class Reader
    attr_accessor :strategy
    attr_reader :pathname

    def self.for(pathname)
      new(pathname)
    end

    def initialize(pathname)
      @pathname = pathname
    end

    def use(strategy)
      self.strategy = strategy
    end

    def data
      @data ||= pathname.read
    end

    def parse
      @parse ||= parser.parse(data)
    end

    def parser
      strategy || ::Traktion::Strategy::Nil
    end
  end
end

