# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TrabalhoRemoto::PjSimples::Simulator do
  describe '#simulate with 15.000' do
    let(:account) { subject.simulate(15_000) }
    it 'calculates things correctly' do
      expect(account.items[0].amount).to eq(15_000)
      expect(account.items[0].description).to eq('Total em notas fiscais')

      expect(account.items[1].amount).to eq(-900)
      expect(account.items[1].description).to eq('Imposto sobre nota')

      expect(account.items[2].amount).to eq(-4_200)
      expect(account.items[2].description).to eq('Pro-Labore (28%)')

      expect(account.items[3].amount).to eq(4_200)
      expect(account.items[3].description).to eq('Pro-Labore (28%)')

      expect(account.items[4].amount).to eq(-945)
      expect(account.items[4].description).to eq('IRRF sobre Pro-Labore (22.50%)')

      expect(account.items[5].amount).to eq(+636.13)
      expect(account.items[5].description).to eq('Parcela a deduzir do IRRF do Pro-Labore')

      expect(account.items[6].amount).to eq(-462.00)
      expect(account.items[6].description).to eq('INSS sobre Pro-Labore (11.00%)')

      expect(account.balance).to eq(13_329.13)

    end
  end
end
