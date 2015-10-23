require 'active_support/core_ext/string'

# Numeric
class Numeric
  %w(dollar euro ruble).each do |name|
    define_method "#{name}" do
      Money.new(name, self)
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
    self.currency = currency.to_s.singularize.to_sym
    self.number = number
  end

  def rate(cur1, cur2)
    return 1 if cur1 == cur2
    return 0 if !CURRENCY.include?(cur1) || !CURRENCY.include?(cur2)
    rate = RATES[[cur1, cur2].sort.join('_').to_sym]
    cur1 < cur2 ? rate : 1 / rate
  end

  def in(arg)
    number * rate(currency, arg.to_s.singularize.to_sym)
  end
end
