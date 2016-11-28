# class What can doing
class WhatCanDoing
  def dig_a_hole
    puts "the pit dug by the gardener with the name #{@name}"
  end

  def pour_water
    puts 'water poured'
  end

  def fertilize
    puts "#{@name} fertilize the soil"
  end

  def appease_the_tree
    fertilize
    pour_water
    puts 'all done,have watered and fertilized'
  end

  def plant_trees(tree)
    puts "tree #{tree.sort} planted"
  end

  class << self
    def about_class
      puts 'class for somewhat'
    end
  end
end

# class Gardener
class Gardener < WhatCanDoing
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# class Tree
class Tree
  attr_reader :kind, :size
  attr_accessor :sort

  def initialize(sort, kind, size)
    @sort = sort
    @kind = kind
    @size = size
  end

  def grow
    puts 'tree grow'
  end

  def withered_away
    puts 'tree withered away'
  end

  def tree_fruits
    puts 'tree gave fruits'
  end
end

gardener = Gardener.new 'BigBoy'
p "Our gardener named #{Gardener.name}"

tree = Tree.new('Apple', 'Normal', '1')
p "Dealing with tree varieties #{tree.sort}"

WhatCanDoing.about_class

gardener.dig_a_hole
gardener.fertilize
gardener.plant_trees(tree)
gardener.pour_water
tree.grow
tree.withered_away
gardener.appease_the_tree

tree.tree_fruits
