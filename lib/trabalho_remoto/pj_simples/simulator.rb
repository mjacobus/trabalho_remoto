# frozen_string_literal: true

module TrabalhoRemoto
  module PjSimples
    class Simulator
      def initialize
        @aliquota_policy = AliquotaSobreNotasFiscais.new
        @irrf_policy = AliquotaIrrf.new
        @irrf_discount_policy = IrrfDiscount.new
        @inss_policy = AliquotaInss.new
      end

      def simulate(income)
        Account.new.tap do |account|
          notas = Item.new(amount: income, description: 'Total em notas fiscais')
          prolabore = Item.new(amount: notas.amount * 0.28, description: 'Pro-Labore (28%)')

          account.deposit(notas)
          account.withdraw(imposto_sobre_notas(notas))
          account.withdraw(prolabore)
          account.deposit(prolabore)
          account.withdraw(irrf(prolabore))
          account.deposit(irrf_discount(prolabore))
          account.withdraw(inss(prolabore))
        end
      end

      private

      def imposto_sobre_notas(notas)
        aliquota = @aliquota_policy.for_monthly_amount(notas.amount)

        Item.new(
          amount: notas.amount * aliquota,
          description: 'Imposto sobre nota'
        )
      end

      def irrf(prolabore)
        aliquota = @irrf_policy.for_monthly_amount(prolabore.amount)

        Item.new(
          amount: prolabore.amount * aliquota,
          description: "IRRF sobre Pro-Labore (#{format_percentage(aliquota)})"
        )
      end

      def irrf_discount(prolabore)
        discount = @irrf_discount_policy.for_monthly_amount(prolabore.amount)

        Item.new(
          amount: discount,
          description: 'Parcela a deduzir do IRRF do Pro-Labore'
        )
      end

      def inss(prolabore)
        percentage = @inss_policy.for_monthly_amount(prolabore.amount)

        Item.new(
          amount: prolabore.amount * percentage,
          description: "INSS sobre Pro-Labore (#{format_percentage(percentage)})"
        )
      end

      def format_percentage(percentage)
        percentage = format('%.2f', (percentage * 100))
        "#{percentage}%"
      end
    end
  end
end
