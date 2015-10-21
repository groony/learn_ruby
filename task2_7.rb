require 'active_support/core_ext/string'

class WrongCurrencyError < StandardError ; end

class Numeric
  %w(dollar euro ruble).each do |name|
    define_method "#{name}" do
      Money.new(name.to_s.singularize, self.to_i)
    end
    alias_method "#{name}s", "#{name}"
  end
end

class Money

  attr_accessor :currency
  attr_accessor :number

  RATES  = {
    dollar_ruble: 32.26,
    euro_ruble: 43.61,
    euro_dollar: 1.35
  }

  VALID_CURRENCY = [:dollar, :euro, :ruble]

  def initialize(currency, number)
    self.currency = currency
    self.number = number
  end

  def in(arg)
    singular_currency = arg.to_s.singularize
    raise WrongCurrencyError unless (VALID_CURRENCY.include?(currency.to_sym) || VALID_CURRENCY.include?(singular_currency.to_sym))
    return 1 if singular_currency == self.currency
    return self.number * RATES[[currency, singular_currency].join('_').to_sym] if RATES.include?([currency, singular_currency].join('_').to_sym)
    return 1 / RATES[[singular_currency, currency].join('_').to_sym] * self.number
  end
end