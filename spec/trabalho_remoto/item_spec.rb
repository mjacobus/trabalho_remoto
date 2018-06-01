# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TrabalhoRemoto::Item do
  let(:item) do
    described_class.new(
      amount: 123,
      description: 'the-description',
      link: 'the-link'
    )
  end

  it 'has a amount' do
    expect(item.amount).to be 123
  end

  it 'has a description' do
    expect(item.description).to be 'the-description'
  end

  it 'has a link' do
    expect(item.link).to be 'the-link'
  end

  it 'can be coverted to string' do
    expect(item.to_s).to eq('+123 - the-description (the-link)')
  end
end
