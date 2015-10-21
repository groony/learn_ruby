class Numeric
  %w(dollar euro ruble).each do |name|
    define_method "#{name}" do
      Money.new(name.to_s.gsub(/s$/,''), self.to_i)
    end

    alias_method "#{name}s", "#{name}"

  end
end

class Money

  attr_accessor :currency
  attr_accessor :number

  RATES = {
    'ruble' => {'ruble' => 1, 'dollar' => 0.030, 'euro' => 0.023},
    'dollar' => {'ruble' => 32.26, 'dollar' => 1, 'euro' => 0.73},
    'euro' => {'ruble' => 43.61, 'dollar' => 1.35, 'euro' => 1}
  }

  def initialize(currency, number)
    self.currency = currency
    self.number = number
  end

  def in(arg)
    singular_currency = arg.to_s.gsub(/s$/,'')


    if @@currencies.has_key?(@name)
      @@currencies[@name][singular_currency] * @number
    end
  end
end