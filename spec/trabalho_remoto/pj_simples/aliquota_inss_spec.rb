# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TrabalhoRemoto::PjSimples::AliquotaInss do
  describe '#for_monthly_amount' do
    it 'returns 8% for salary up to 1.693,62' do
      expect(subject.for_monthly_amount(0)).to eq(0.08)
      expect(subject.for_monthly_amount(1_692.62)).to eq(0.08)
    end

    it 'returns 9% for salary between 1.693,63 and 2.822,90' do
      expect(subject.for_monthly_amount(1_693.63)).to eq(0.09)
      expect(subject.for_monthly_amount(2_822.90)).to eq(0.09)
    end

    it 'returns 11% for salary greather then 2.822,90' do
      expect(subject.for_monthly_amount(2_822.91)).to eq(0.11)
      expect(subject.for_monthly_amount(111_111)).to eq(0.11)
    end
  end
end
