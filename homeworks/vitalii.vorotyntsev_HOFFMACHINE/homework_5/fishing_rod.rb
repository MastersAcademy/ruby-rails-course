module Typeable
  attr_accessor :type
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

class Rod
  attr_accessor :design, :material, :length, :weight, :casting

  include Typeable

  def initialize(type, design, material)
    @type = type
    @design = design
    @material = material
  end

  def set_length(length = 2.4)
    @length = length
  end

  def set_weight(weight = 300)
    @weight = weight
  end

  def set_casting(casting = 15)
    @casting = casting
  end
end

class Reel
  attr_accessor :friction_clutch, :size, :weight

  include Typeable

  def initialize(type, friction_clutch)
    @type = type
    @friction_clutch = friction_clutch
  end

  def set_size(size = 1000)
    @size = size
  end

  def set_weight(weight = 200)
    @weight = weight
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
