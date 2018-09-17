# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TrabalhoRemoto::PjSimples::AliquotaIrrf do
  describe '#for_monthly_amount' do
    it 'returns 0% for salary from 0 to 1.903,98' do
      expect(subject.for_monthly_amount(0)).to eq(0)
      expect(subject.for_monthly_amount(1_903.98)).to eq(0)
    end

    it 'returns 7.5% for salary from 1.903,99 to 2.826.65' do
      expect(subject.for_monthly_amount(1_903.99)).to eq(0.075)
      expect(subject.for_monthly_amount(2_826.65)).to eq(0.075)
    end

    it 'returns 15% for salary from 2.826,66 to 3.751,05' do
      expect(subject.for_monthly_amount(2_826.66)).to eq(0.15)
      expect(subject.for_monthly_amount(3_751.05)).to eq(0.15)
    end

    it 'returns 27% for salary from 4.664,69 onwards' do
      expect(subject.for_monthly_amount(4_664.69)).to eq(0.27)
      expect(subject.for_monthly_amount(1_000_000)).to eq(0.27)
    end
  end
end
