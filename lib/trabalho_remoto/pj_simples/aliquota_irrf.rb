# frozen_string_literal: true

module TrabalhoRemoto
  module PjSimples
    class AliquotaIrrf
      def for_monthly_amount(amount)
        ranges = [
          [Range.new(0, 1_903.98), 0],
          [Range.new(1_903.99, 2_826.65), 0.075],
          [Range.new(2_826.66, 3_751.05), 0.15],
          [Range.new(3_751.06, 4_664.68), 0.225]
        ]

        ranges.each do |range, aliquota|
          return aliquota if range.include?(amount)
        end

        0.27
      end
    end
  end
end
