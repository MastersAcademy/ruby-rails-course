require_relative 'person'
class Guest < Person

  def self.get_guest
    Guest.new(name: "Guest")
  end
end