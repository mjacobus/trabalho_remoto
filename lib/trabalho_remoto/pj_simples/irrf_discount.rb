
# frozen_string_literal: true

module TrabalhoRemoto
  module PjSimples
    class IrrfDiscount
      def for_monthly_amount(amount)
        ranges = [
          [Range.new(0, 1_903.98), 0],
          [Range.new(1_903.99, 2_826.65), 142.8],
          [Range.new(2_826.66, 3_751.05), 354.8],
          [Range.new(3_751.06, 4_664.68), 636.13]
        ]

        ranges.each do |range, aliquota|
          return aliquota if range.include?(amount)
        end

        869.36
      end
    end
  end
end
