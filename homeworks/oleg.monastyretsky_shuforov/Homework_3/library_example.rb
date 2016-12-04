# Library exemple

# Librarry class
class Library
  attr_accessor :book_shelf, :list_of_librarions, :list_of_registered_readers
  
  def initialize(book_list, librarion_list)
    @list_of_registered_readers = []
    @book_shelf = {}
    @list_of_librarions = {}
    book_list.each do |book|
      @book_shelf[book.title] = book.number_of_books
    end
    librarion_list.each do |librarion|
      @list_of_librarions[librarion] = librarion.working_days
    end
  end

  def worker_for_today(day)
    @list_of_librarions.keys.each do |librerian|
      if librerian.working_days.include? day
        librerian.work_place_for_to_day = self.itself
        return librerian
      end
    end
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
  attr_accessor :work_place_for_to_day
  def initialize(name, surname, working_days)
    @name = name
    @surname = surname
    @working_days = working_days
    @work_place_for_to_day = work_place_for_to_day
  end
  
  def register_reader(reader)
    class << reader
      def take_book_home(book_name)
        p "#{@reader_name} looking for #{book_name}"
        if @librerian.give_book_to_reader(book_name, self.itself) == true
          p "#{self.itself.reader_name} take book #{book_name} home"
        end
      end
    end
    @work_place_for_to_day.list_of_registered_readers << reader
    p "#{reader.reader_name} registered successfully"
  end

  def give_book_to_reader(book_name, reader)
    if @work_place_for_to_day.book_shelf.include?(book_name)
      if @work_place_for_to_day.book_shelf[book_name] > 0
        @work_place_for_to_day.book_shelf[book_name] -= 1
        p "Book #{book_name} was gived to reader"
        p "#{reader.reader_name} take book from librarion"
        return true
      else
        p "We're out of this book, please come later to take it"
        return false
      end
    else
      p 'We do not have books with this title'
      return false
    end
  end

  def take_book_from_reader(book_name)
    if @work_place_for_to_day.book_shelf.include?(book_name)
      @work_place_for_to_day.book_shelf[book_name] += 1
      p "#{book_name} was returned"
    else
      @work_place_for_to_day.book_shelf[book_name] = 1
      p "Book #{book_name} was add to the library"
    end
  end
end

# Reader classp
class Reader
  attr_reader :surname, :reader_name, :librerian
  def initialize(surname, reader_name)
    @surname = surname
    @reader_name = reader_name
  end

  def enter_to_library(library, day)
    @librerian = library.worker_for_today(day)
  end

  def take_book(book_name)
    p"#{@reader_name} looking for #{book_name}"
    if @librerian.give_book_to_reader(book_name, self.itself) == true
      p "#{@reader_name} Reading book at reading room"
    end
  end

  def give_book_back(book_name)
    @librerian.take_book_from_reader(book_name)
  end

  def register_in_library()
    @librerian.register_reader(self.itself)
  end

  def give_book_to_library(book_name)
    @librerian.take_book_from_reader(book_name)
  end  
end

p ''
# Books for library
hobbit = Book.new('J.R.R Tolkien', 'The Hobbit', 1937, 1)
silmarillion = Book.new('J.R.R Tolkien', 'The Silmarillion', 1977, 1)
# Librarions
dave_mustain = Librarion.new('Mustain', 'Dave', %w(Sun Mon Tue Wed))
rob_halford = Librarion.new('Halford', 'Rob', %w(Thu Fri Sat))
# Library
school_library = Library.new([hobbit, silmarillion], [dave_mustain, rob_halford])
# Readers
james = Reader.new('Hetfeald', 'James')
randy = Reader.new('Rhoads', 'Randy')
# Readers come to library
james.enter_to_library(school_library, 'Thu')
randy.enter_to_library(school_library, 'Thu')
# Readers read books
james.take_book('The Hobbit')
randy.take_book('The Hobbit')
randy.take_book('The Silmarillion')
james.give_book_back('The Hobbit')
randy.give_book_back('The Silmarillion')
# James register in library
james.register_in_library()
# James take book home
james.take_book_home('The Hobbit')
james.enter_to_library(school_library, 'Wed')
randy.enter_to_library(school_library, 'Mon')
james.give_book_back('The Hobbit')
# James give his book to library
james.give_book_to_library('Lord of the Rings: the Fellowship of the Ring')
# Randy want take 'Lord of the Rings: the Fellowship of the Ring'
randy.take_book('Lord of the Rings: the Fellowship of the Ring')
randy.give_book_back('Lord of the Rings: the Fellowship of the Ring')
# James want read other book
james.take_book("Schindler's List")
p ''
