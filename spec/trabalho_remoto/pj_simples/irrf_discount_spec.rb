# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TrabalhoRemoto::PjSimples::IrrfDiscount do
  describe '#for_monthly_amount' do
    it 'returns 0% for salary from 0 to 1.903,98' do
      expect(subject.for_monthly_amount(0)).to eq(0)
      expect(subject.for_monthly_amount(1_903.98)).to eq(0)
    end

    it 'returns 7.5% for salary from 1.903,99 to 2.826.65' do
      expect(subject.for_monthly_amount(1_903.99)).to eq(142.8)
      expect(subject.for_monthly_amount(2_826.65)).to eq(142.8)
    end

    it 'returns 15% for salary from 2.826,66 to 3.751,05' do
      expect(subject.for_monthly_amount(2_826.66)).to eq(354.8)
      expect(subject.for_monthly_amount(3_751.05)).to eq(354.8)
    end

    it 'returns 22.5% for salary from 3.751,06 até 4.664,68' do
      expect(subject.for_monthly_amount(3_751.06)).to eq(636.13)
      expect(subject.for_monthly_amount(4_664.68)).to eq(636.13)
      expect(subject.for_monthly_amount(4_200)).to eq(636.13)
    end

    it 'returns 27% for salary from 4.664,69 onwards' do
      expect(subject.for_monthly_amount(4_664.69)).to eq(869.36)
      expect(subject.for_monthly_amount(1_000_000)).to eq(869.36)
    end
  end
end
