# frozen_string_literal: true

module TrabalhoRemoto
  module PjSimples
    class AliquotaInss
      # TODO: 5.465,80 parece ser o máximo. Então se 11% for maior que isto,
      # o programa não funciona, mas a surpresa vai ser boa ;-)
      def for_monthly_amount(amount)
        ranges = [
          [Range.new(0, 1_692.92), 0.08],
          [Range.new(1_692.93, 2_822.90), 0.09]
        ]

        ranges.each do |range, aliquota|
          return aliquota if range.include?(amount)
        end

        0.11
      end
    end
  end
end
