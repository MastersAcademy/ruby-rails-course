
$list_of_readers = []

$book_shelf = []

class Book

  attr_reader :author, :name_of_book, :year, :edition
  
  def initialize(author, name_of_book, year, edition = "first" )
    @author = author
    @name_of_book = name_of_book
    @year = year
    @edition = edition
  end
  
end

class Librarion
  
  def initialize (name, surname)
    @name = name
    @surname = surname
  end
    
  def register_reader(reader)
    class << reader
      def take_book_home(book_name)
        puts @reader_name + " Take book '" + book_name.name_of_book + "' home"
      end
    end
    $list_of_readers << reader
    puts reader.reader_name + " successful registered"
  end

  def take_book_from_shelf(book_name, reader)
    if $book_shelf.include? book_name
      $book_shelf.delete book_name
      puts reader + " Take book '" + book_name.name_of_book + "' from librerian"
      puts reader + " Reading book at reading room"
    else
      puts "There is no book with this name on the book shalf at the moment"
    end
  end

  def give_book_to_reader(book_name)
    book_shelf.delete(book_name)
  end
    
  def put_book_at_shelf()
  end

  def take_book_from_reader(book_name)
    $book_shelf << book_name
    puts "Book '" + book_name.name_of_book + "' was given back to the library" 
  end
  
  def take_new_book_from_readere(book_name)
    $book_shelf << book_name
    puts "Book '" + book_name.name_of_book + "' was add to the library"
  end
  
end

class Reader

  attr_reader :surname, :reader_name
  
  def initialize(surname, reader_name)
    @surname = surname
    @reader_name = reader_name  
  end
  
  def take_book(book_name, librerian)
    puts @reader_name + " looking for '" + book_name.name_of_book + "'"
    librerian.take_book_from_shelf book_name, @reader_name
  end

  def give_book_back(book_name, librerian)
    librerian.take_book_from_reader book_name
  end

  def register_in_library(reader, librerian)
    librerian.register_reader reader
  end

  def give_book_to_library(book_name, librerian)
    librerian.take_book_from_reader(book_name)
  end
end

puts ''
hobbit = Book.new "J.R.R Tolkien", "The Hobbit", 1937
silmarillion = Book.new "J.R.R Tolkien", "The Silmarillion", 1977
$book_shelf << hobbit
kirk = Reader.new "Hammett", "Kirk"
james = Reader.new "Hetfield", "James"
dave_mustain = Librarion.new "Mustain", "Dave"
kirk.take_book silmarillion, dave_mustain
james.take_book silmarillion, dave_mustain
kirk.take_book hobbit, dave_mustain
james.take_book hobbit, dave_mustain
kirk.give_book_back hobbit, dave_mustain
james.take_book hobbit, dave_mustain
kirk.give_book_to_library silmarillion, dave_mustain
kirk.register_in_library kirk, dave_mustain
james.give_book_back hobbit, dave_mustain
kirk.take_book_home hobbit
puts ''
