# https://repl.it/EeSo/11
# array
class Abc
  
  def self.rus
    # создаем алфавит
    abc_rus = ( 'а'..'я' ).to_a
    # есть буква ё ?
    abc_rus.include?('ё')
    # вставим букву ё  
    abc_rus.insert(6, 'ё')
    # добавим символы
    abc_rus.push(' ')
    abc_rus
  end

  def self.rus_lat
    ['a','b','v','g','d','e','yo','zh','z','i','y','k','l','m','n','o','p','r','s','t','u','f','kh','ts','ch','sh','shch','','y','','e','yu','ya', ' ']
  end
  
end

# Функция транслитерации, на вход принимается строка
def array_translite(str)
  # поиск транслитерации. downcase не работает, так как не подключен юникод
  result = ''
  str.downcase.split('').each { |value| result += Abc.rus_lat[Abc.rus.index(value)] }
  result
end

puts array_translite('транслит с использованием массива')

# hash
def hash_translite(str)
  # перебор по значению элемента, преобразуем массив в двумерный с соответствием транслитерации
  abc_rus = Abc.rus.collect { |x| [x, Abc.rus_lat[Abc.rus.index(x)]] }
  # заполним хеш из двумерного массива
  hash = Hash[abc_rus]
  hash.default= '?' # '?' - значение по умолчанию
  hash[':'] = '::'
  result = ''
  str.downcase.split('').each { |value| result += hash[value]}
  result
end

puts hash_translite('транслит с использованием хеша :)')

