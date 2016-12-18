module Typeable
  attr_accessor :type
end

module Validation
  def must_be_numeric(value)
    raise AssertionError.new("Error! The '#{value}' must be a numeric and greater than zero. The value was reset to default.") unless value.respond_to?(:to_i) && value.to_i > 0
  end
end

module FishingRod
  def choose_rod
    p ' Удилище'
    p " - Тип: #{rod.type}"
    p " - Кострукция: #{rod.design}"
    p " - Материал: #{rod.material}"
    p " - Длина: #{rod.length} м"
    p " - Вес: #{rod.weight} г"
    p " - Кастинг (тест): #{rod.casting} г"
  end

  def set_reel
    p ' Катушка'
    p " - Тип: #{reel.type}"
    p " - Фрикцион: #{reel.type}"
    p " - Типоразмер: #{reel.size}"
    p " - Вес: #{reel.weight} г"
  end

  def mount_tackle
    p " Оснастка: #{tackle.type}"
  end
end

class AssertionError < StandardError
  def initialize(message)
    p message
  end
end

class Rod
  attr_accessor :design, :material, :length, :weight, :casting

  include Typeable
  include Validation

  def initialize(type, design, material)
    @type = type
    @design = design
    @material = material
  end

  def set_length(length = 2.4)
    begin
      must_be_numeric(length)
    rescue AssertionError
      @length = 2.4
    else
      @length = length
    end
  end

  def set_weight(weight = 300)
    begin
      must_be_numeric(weight)
    rescue AssertionError
      @weight = 300
    else
      @weight = weight
    end
  end

  def set_casting(casting = 15)
    begin
      must_be_numeric(casting)
    rescue AssertionError
      @casting = 15
    else
      @casting = casting
    end
  end
end

class Reel
  attr_accessor :friction_clutch, :size, :weight

  include Typeable
  include Validation

  def initialize(type, friction_clutch)
    @type = type
    @friction_clutch = friction_clutch
  end

  def set_size(size = 1000)
    begin
      must_be_numeric(size)
    rescue AssertionError
      @size = 1000
    else
      @size = size
    end
  end

  def set_weight(weight = 200)
    begin
      must_be_numeric(weight)
    rescue AssertionError
      @weight = 200
    else
      @weight = weight
    end
  end
end

class Tackle
  include Typeable
end

class SalmoSupreeme
  attr_accessor :rod, :reel, :tackle

  def initialize(rod, reel, tackle)
    @rod = rod
    @reel = reel
    @tackle = tackle
  end

  def build
    puts
    p 'Начинаем сборку удочки от фирмы Salmo под названием Supreeme Feeder 90 для фидерного вида ловли.'
    p 'Основные характеристики:'

    choose_rod
    set_reel
    mount_tackle
  end
end

rod = Rod.new('фидерное', 'штекерная', 'композит')
rod.set_length(3.3)
rod.set_weight(315)
rod.set_casting(90)

reel = Reel.new('безынерционная', 'передний')
reel.set_size(3000)
reel.set_weight(240)

tackle = Tackle.new
tackle.type = 'фидерная'

salmo_supreeme = SalmoSupreeme.new(rod, reel, tackle)
salmo_supreeme.extend(FishingRod)
salmo_supreeme.build

puts

class DaiwaTournament
  attr_accessor :rod, :tackle

  def initialize(rod, tackle)
    @rod = rod
    @tackle = tackle
  end

  def build
    puts
    p 'Начинаем сборку удочки от фирмы Daiwa под названием Daiwa Tournament VIP V50 для поплавочного вида ловли.'
    p 'Основные характеристики:'
  end
end

rod = Rod.new('болонские', 'телескопическая', 'карбон')
rod.set_length(5)
rod.set_weight(152)
rod.set_casting

tackle = Tackle.new
tackle.type = 'поплавочная'

daiwa_tournament = DaiwaTournament.new(rod, tackle)
daiwa_tournament.build

begin
  daiwa_tournament.choose_rod
  daiwa_tournament.mount_tackle
rescue NoMethodError
  daiwa_tournament.extend(FishingRod)

  retry
end
