# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TrabalhoRemoto::Account do
  let(:account) { described_class.new }

  describe '#balance' do
    it 'is initially zero' do
      expect(account.balance).to be 0
    end

    it 'returns the sum of values of the items' do
      account.deposit(TrabalhoRemoto::Item.new(amount: 10))
      account.withdraw(TrabalhoRemoto::Item.new(amount: 1.5))

      expect(account.balance).to eq(8.5)
    end
  end
end
