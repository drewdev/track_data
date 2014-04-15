module TrackData
  class Kitchen
    class RawIngredients
      attr_reader :unstructured

      def self.from(unstructured)
        new(unstructured)
      end

      def initialize(unstructured)
        @unstructured = unstructured
      end

      def headers
        unstructured.first
      end

      def rows
        unstructured[range]
      end

      def range
        start_position..end_position
      end

      private
      def start_position
        1
      end

      def end_position
        unstructured.length - 1
      end
    end
  end
end
