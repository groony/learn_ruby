class Numeric
  %w(dollars dollar euro euros ruble rubles).each do |name|
    define_method "#{name}" do
      Currency.new(name.to_s.gsub(/s$/,''), self.to_i)
    end
  end
end

class Currency

  @@currencies = {
    'ruble' => {'ruble' => 1, 'dollar' => 0.030, 'euro' => 0.023},
    'dollar' => {'ruble' => 32.26, 'dollar' => 1, 'euro' => 0.73},
    'euro' => {'ruble' => 43.61, 'dollar' => 1.35, 'euro' => 1}
  }

  def initialize(name, number)
    @name = name
    @number = number
  end

  def in(arg)
    singular_currency = arg.to_s.gsub(/s$/,'')
    if @@currencies.has_key?(@name)
      @@currencies[@name][singular_currency] * @number
    end
  end
end