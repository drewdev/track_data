module TrackData
  class Kitchen
    class SavoryHeaders
      attr_accessor :headers

      def self.from(ugly_headers)
        new(ugly_headers).tap do |headers|
          headers.downcase.underscore.symbolize
        end.headers
      end

      def initialize(ugly_headers)
        self.headers = ugly_headers
      end

      def downcase
        tap{|savory| savory.headers = headers.map(&:downcase) }
      end

      def underscore
        tap{|savory| savory.headers = headers.map(&snake_the_case) }
      end

      def symbolize
        tap{|savory| savory.headers = headers.map(&:to_sym) }
      end

      def snake_the_case
        -> (value) do
          value.sub(' ','_')
        end
      end
    end
  end
end
