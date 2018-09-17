# frozen_string_literal: true

module TrabalhoRemoto
  class Withdraw < Item
    def amount
      return @amount * -1 if @amount > 0
      @amount
    end
  end
end
