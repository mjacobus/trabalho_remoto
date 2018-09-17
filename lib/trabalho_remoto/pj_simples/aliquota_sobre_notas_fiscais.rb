# frozen_string_literal: true
module TrabalhoRemoto
  module PjSimples
    class AliquotaSobreNotasFiscais
      def for_monthly_amount(amount)
        for_yearly_amount(amount * 12)
      end

      def for_yearly_amount(amount)
        if amount <= 180_000
          # 6%
          return 0.06
        end

        # 11.20%
        return 0.112

        # TODO: figure out the other ranges
        # there are other ranges, but I do not know them all at the moment
      end
    end
  end
end
