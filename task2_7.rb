require 'active_support/core_ext/string'

class WrongCurrencyError < StandardError; end

# Numeric
class Numeric
  %w(dollar euro ruble).each do |name|
    define_method "#{name}" do
      Money.new(name.to_s.singularize, self)
    end
    alias_method "#{name}s", "#{name}"
  end
end

# Money
class Money
  attr_accessor :currency
  attr_accessor :number

  RATES = {
    dollar_ruble: 32.26,
    euro_ruble: 43.61,
    euro_dollar: 1.35
  }

  CURRENCY = [:dollar, :euro, :ruble]

  def initialize(currency, number)
    self.currency = currency
    self.number = number
  end

  def in(arg)
    singular_currency = arg.to_s.singularize
    fail WrongCurrencyError unless CURRENCY.include?(singular_currency.to_sym)
    rate = [currency, singular_currency].join('_').to_sym
    return 1 if singular_currency == currency
    return number * RATES[rate] if RATES.include?(rate)
    1 / RATES[[singular_currency, currency].join('_').to_sym] * number
  end
end
