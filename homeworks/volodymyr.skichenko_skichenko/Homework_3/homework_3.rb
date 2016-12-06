class Software

  @@update_v = 9
  @@license_v = 0

  attr_accessor :update_v

  def initialize(value)
    :update_v = value
  end

  def update
    if :update_v == @@update_v
      puts "У вас актуальна версія оновлення"
    else
      puts "Доступні нові оновлення"
    end
  end

  def license
    if @@license_v == 0
      puts "Демонстраційний режим"
    end
  end

  def amount_of_jobs
  end

  def technical_support
  end
end

a = Software.new (8)
a.update
a.license
