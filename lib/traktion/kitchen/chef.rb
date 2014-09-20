module StringExtensions
  refine String do
    def present?; respond_to?(:empty?) ? !empty? : self; end
  end
end

module Traktion
  class Kitchen
    class Chef
      using StringExtensions

      attr_reader :filets, :seasoning

      def self.cook(seasoning, filets)
        new(seasoning, filets)
      end

      def initialize(seasoning, filets)
        @seasoning = seasoning
        @filets = filets
      end

      def serve
        seasoned.map(&prepare)
      end

      def seasoned
        filets.map(&season)
      end

      def season
        -> (filet) do
          Hash[seasoning.zip(filet)]
        end
      end

      def prepare
        -> (seasoned) do
          seasoned.select{|key,value| value.present? }
        end
      end
    end
  end
end
