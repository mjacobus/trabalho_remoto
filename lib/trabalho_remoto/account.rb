# frozen_string_literal: true

module TrabalhoRemoto
  class Account
    attr_reader :items

    def initialize(items: [])
      @items = items
    end

    def withdraw(item)
      item = Withdraw.new(amount: item.amount, description: item.description, link: item.link)
      add_item(item)
    end

    def deposit(item)
      item = Deposit.new(amount: item.amount, description: item.description, link: item.link)
      add_item(item)
    end

    def balance
      items.inject(0) do |sum, item|
        sum + item.amount
      end
    end

    private

    def add_item(item)
      @items << item
    end
  end
end
