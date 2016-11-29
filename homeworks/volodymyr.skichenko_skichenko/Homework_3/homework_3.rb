class Software

  @@update_current_v = 9
  @@license_current_v = 0

  attr_accessor :update_v

  def initialize(value)
    :update_v = value
  end

  def update
    if :update_v == @@update_current_v
      puts "У вас актуальна версія оновлення"
    else
      puts "Доступні нові оновлення"
    end
  end

  def license
    if @@license_current_v == 0
      puts "Демонстраційний режим"
      puts "Локальна версія"
    end
    if @@license_current_v > 0
      puts "Робочий режим"
      puts "Мережева версія"
    end
  end

end

a = Software.new (8)
a.update
a.license
