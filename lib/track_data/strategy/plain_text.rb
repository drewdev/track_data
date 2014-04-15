require 'delegate'

module TrackData
  module Strategy
    class PlainText < SimpleDelegator
      def self.parse(data)
        new(data).parse
      end

      def parse
        rows.map(&fields)
      end

      def rows
        @rows ||= split(row_delimiter)
      end

      def fields
        -> (row) do
          row.split(field_delimiter)
        end
      end

      private
      def row_delimiter
        "\r"
      end

      def field_delimiter
        "\t"
      end
    end
  end
end
