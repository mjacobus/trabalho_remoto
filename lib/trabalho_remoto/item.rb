# frozen_string_literal: true

module TrabalhoRemoto
  class Item
    attr_reader :amount
    attr_reader :description
    attr_reader :link

    def initialize(amount:, description: nil, link: nil)
      @amount = amount
      @description = description
      @link = link
    end

    def to_s
      signal = amount.positive? ? '+' : ''
      "#{signal}#{amount} - #{description} (#{link})"
    end
  end
end
