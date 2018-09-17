
require 'spec_helper'

RSpec.describe TrabalhoRemoto::PjSimples::AliquotaSobreNotasFiscais do
  let(:policy) { subject }

  describe '#for_monthly_amount' do
    context 'when the yearly total is less then or equal to 180.000' do
      it 'returns 6%' do
        expect(policy.for_monthly_amount(10_000)).to eq(0.06)
        expect(policy.for_monthly_amount(15_000)).to eq(0.06)
      end
    end

    context 'when the yearly total is greather than 180.000' do
      it 'returns 6%' do
        expect(policy.for_monthly_amount(15_001)).to eq(0.112)
        expect(policy.for_monthly_amount(19_001)).to eq(0.112)
      end
    end
  end
end
