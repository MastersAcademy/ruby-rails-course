# Library exemple

# Librarry class
class Library
  @@list_of_registered_readers = []
  @@book_shelf = {}
  @@list_of_librarions = {}
  def initialize(book_list, librarion_list)
    book_list.each do |book|
      @@book_shelf[book.title] = book.number_of_books
    end
    librarion_list.each do |librarion|
      @@list_of_librarions[librarion.name] = librarion.working_days
    end
  end

  def self.add_new_reader_to_list(reader)
    @@list_of_registered_readers << reader
    puts "#{reader.reader_name} successful registered"
  end

  def self.add_book_to_shelf(book_name)
    if @@book_shelf.include?(book_name)
      @@book_shelf[book_name] += 1
    else
      @@book_shelf[book_name] = 1
    end
    puts "Book #{book_name} was add to the library"
  end

  def self.take_out_book(book_name, reader)
    if @@book_shelf.include?(book_name)
      if @@book_shelf[book_name] > 0
        @@book_shelf[book_name] -= 1
        puts "Book #{book_name} was gived to reader"
        puts "#{reader} Take book #{book_name} from librerian"
        return true
      else
        puts "We're out of this book, please come later to take it"
        return false
      end
    else
      puts 'We do not have books with this title'
      return false
    end
  end

  def self.take_back_book(book_name)
    @@book_shelf[book_name] += 1
    puts "Book #{book_name} was given back to the library"
  end
end

# Book class
class Book
  attr_reader :author, :title, :year, :edition, :number_of_books
  def initialize(author, title, year, number_of_books, edition = 'first')
    @author = author
    @title = title
    @year = year
    @edition = edition
    @number_of_books = number_of_books
  end
end

# Librarion class
class Librarion
  attr_reader :name, :surname, :working_days
  def initialize(name, surname, working_days)
    @name = name
    @surname = surname
    @working_days = working_days
  end

  def self.register_reader(reader)
    class << reader
      def take_book_home(book_name, reader)
        Librarion.give_reader_book_home(book_name, reader)
      end
    end
    Library.add_new_reader_to_list reader
  end

  def self.give_book_to_reader(book_name, reader)
    if Library.take_out_book(book_name, reader) == true
      puts "#{reader} Reading book at reading room"
    end
  end

  def self.give_reader_book_home(book_name, reader)
    if Library.take_out_book(book_name, reader) == true
      puts "#{reader} Take book #{book_name} home"
    end
  end

  def self.take_book_from_reader(book_name)
    Library.take_back_book(book_name)
  end

  def self.take_new_book_from_readere(book_name)
    Library.add_book_to_shelf(book_name)
  end
end

# Reader class
class Reader
  attr_reader :surname, :reader_name
  def initialize(surname, reader_name)
    @surname = surname
    @reader_name = reader_name
  end

  def take_book(book_name)
    puts "#{@reader_name} looking for #{book_name}"
    Librarion.give_book_to_reader(book_name, @reader_name)
  end

  def give_book_back(book_name)
    Librarion.take_book_from_reader(book_name)
  end

  def register_in_library(reader)
    Librarion.register_reader reader
  end

  def give_book_to_library(book_name)
    Librarion.take_new_book_from_readere(book_name)
  end
end

puts ''
hobbit = Book.new('J.R.R Tolkien', 'The Hobbit', 1937, 2)
silmarillion = Book.new('J.R.R Tolkien', 'The Silmarillion', 1977, 1)

kirk = Reader.new('Hammett', 'Kirk')
james = Reader.new('Hetfield', 'James')

dave_mustain = Librarion.new('Mustain', 'Dave', %w(Sun Mon Tue Wed))
rob_halford = Librarion.new('Halford', 'Rob', %w(Thu Fri Sat))

school_library = Library.new([hobbit, silmarillion], [dave_mustain, rob_halford])

puts ''
kirk.take_book('The Hobbit')
james.take_book('The Hobbit')
kirk.give_book_back('The Hobbit')
james.give_book_back('The Hobbit')
james.register_in_library(james)
james.take_book_home('The Hobbit', james.reader_name)
kirk.take_book('The Hobbit')
kirk.give_book_back('The Hobbit')
kirk.give_book_to_library('The Hobbit')
kirk.give_book_to_library('Lord of the Rings: the Fellowship of the Ring')
james.take_book('Lord of the Rings: the Fellowship of the Ring')
james.give_book_back('Lord of the Rings: the Fellowship of the Ring')
james.take_book("Schindler's List")
puts ''
