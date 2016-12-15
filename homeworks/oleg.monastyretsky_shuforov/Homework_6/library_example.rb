
# Library exemple

# Module with function for Library
module BookPresentation
  def notification_about_event(book_name, author, day, library)
    p "At #{day} in #{library} will be presentation of book #{book_name} \
 wroted by #{author}"
  end
  
  def cost_of_book(sum)
    p "Book will be cost #{sum}$"
  end
end
# Module of faveorite books
module FavoriteBooks
  def favorite_books
    p "Favorite books list of #{self.name}"
    @list_of_favorite_books
  end

  def add_new_favorite_book(book_name)
    p "#{book_name} was added to favorite"
    @list_of_favorite_books << book_name
  end
end
# Refund book exeception
class RefundBook < StandardError
  def initialize(book_name, reader)
    p "#{reader.name} still has not returned the #{book_name}"
  end  
end
# Librarry class
class Library
  attr_accessor :book_shelf,
                :list_of_librarions,
                :list_of_registered_readers,
                :on_work
  def initialize(book_list, librarion_list)
    @list_of_registered_readers = {}
    @book_shelf = {}
    @list_of_librarions = {}
    @on_work = {}
    book_list.each do |book|
      @book_shelf[book.title] = book.number_of_books
    end
    librarion_list.each do |librarion|
      @list_of_librarions[librarion] = librarion.working_days
      librarion.working_place = self
    end
  end

  extend BookPresentation

  def worker_for_today(day)
    @list_of_librarions.each do |librarian, days|
      if days.include?(day)
        @on_work[librarian] = 'working'
        librarian.working_place = self
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
# Librarian class
class Librarian
  attr_reader :name, :surname, :working_days, :list_of_favorite_books
  attr_accessor :working_place
  def initialize(name, surname, working_days)
    @name = name
    @surname = surname
    @working_days = working_days
    @list_of_favorite_books = ['The Thing']
  end
  def lunch
    @working_place.on_work[self] = 'on lunch'
    p "#{self.name} going to luch"
  end

  def come_back
    @working_place.on_work[self] = 'working'
    p "#{self.name} back on work"
  end

  def register_reader(reader)
    class << reader
      def take_book_home(book_name)
        p "#{@name} looking for #{book_name}"
        if @library.on_work.value?('working')
          @library.on_work.key('working').give_book_to_registered_reader(book_name, self)
        end
      end
    end
    @working_place.list_of_registered_readers[reader] = []
    p "#{reader.name} registered successfully"
  end

  def give_book_to_registered_reader(book_name, reader)
    if @working_place.list_of_registered_readers[reader].length == 0
      give_book_to_reader(book_name, reader)
      p "#{self.name} take book #{book_name} home"
      @working_place.list_of_registered_readers[reader].push(book_name)      
    else
      begin
        raise RefundBook.new(book_name, reader)
      rescue RefundBook        
      end
    end
  end
  
  def give_book_to_reader(book_name, reader)
    if @working_place.book_shelf.include?(book_name)
      if @working_place.book_shelf[book_name] > 0
        @working_place.book_shelf[book_name] -= 1
        p "Book #{book_name} was gived to reader"
        p "#{reader.name} take book from librarion"
      else
        p "We're out of this book, please come later to take it"
      end
    else
      p 'We do not have books with this title'
    end
  end

  def take_book_from_registered_reader(book_name, reader)
    @working_place.list_of_registered_readers[reader].delete(book_name)
    take_book_from_reader(book_name)
  end
  
  def take_book_from_reader(book_name)
    if @working_place.book_shelf.include?(book_name)
      @working_place.book_shelf[book_name] += 1
      p "#{book_name} was returned"
    else
      @working_place.book_shelf[book_name] = 1
      p "Book #{book_name} was add to the library"
    end
  end

  include FavoriteBooks
  extend BookPresentation
  
end
# Reader classp
class Reader
  attr_reader :surname, :name, :library, :list_of_favorite_books
  def initialize(surname, name)
    @surname = surname
    @name = name
    @list_of_favorite_books = ['The Hobbit']
  end

  def enter_to_library(library, day)
    @library = library
    @library.worker_for_today(day)
  end

  def take_book(book_name)
    p "#{@name} looking for #{book_name}"
    if @library.on_work.value?('working')
      @library.on_work.key('working').give_book_to_reader(book_name, self)
      p "#{@name} Reading book at reading room"
    else
      p "Librarian is't here right now, i will came later"
    end
  end

  def give_book_back(book_name)
    if @library.on_work.value?('working')
      @library.on_work.key('working').take_book_from_reader(book_name)
    else
      p "Librarian is't here right now, i will wait"
    end
  end

  def refund_book(book_name)
    take_book_from_registered_reader(book_name, self)
  end
  
  def register_in_library
    if @library.on_work.value?('working')
      @library.on_work.key('working').register_reader(self)
    else
      p "Librarian is't here right now, i will came later"
    end
  end

  def give_book_to_library(book_name)
    if @library.on_work.value?('working')
      @library.on_work.key('working').take_book_from_reader(book_name)
    else
      p "Librarian is't here right now, i will came later"
    end
  end

  def can_i_take_book_home(book_name)
    take_book_home(book_name)
  rescue NoMethodError
    p 'Sorry, but you are not registered in our library'
  end
  
  include FavoriteBooks
end

p ''
# Books for library
hobbit = Book.new('J.R.R Tolkien', 'The Hobbit', 1937, 1)
silmarillion = Book.new('J.R.R Tolkien', 'The Silmarillion', 1977, 1)
# Librarions
dave_mustain = Librarian.new('Dave', 'Mustain', %w(Sun Mon Tue Wed))
rob_halford = Librarian.new('Rob', 'Halford', %w(Wed Thu Fri Sat))
# Library
school_library = Library.new([hobbit, silmarillion],
                             [dave_mustain, rob_halford])
#Book Presentation
Librarian.notification_about_event('The Last Mortal Bond',
                                 'Brian Staveley',
                                 'Tuesday',
                                 'School Library')
Librarian.cost_of_book(5)
# Readers
james = Reader.new('Hetfeald', 'James')
randy = Reader.new('Rhoads', 'Randy')
# Readers come to library
james.enter_to_library(school_library, 'Mon')
randy.enter_to_library(school_library, 'Mon')
p '-------'
# Randy want take book home
james.can_i_take_book_home('The Hobbit')
# Readers read books
james.take_book('The Hobbit')
randy.take_book('The Hobbit')
randy.take_book('The Silmarillion')
james.give_book_back('The Hobbit')
randy.give_book_back('The Silmarillion')
# Librarian Dave go to lunch
dave_mustain.lunch
# James trying to register in library
james.register_in_library
# Librarian Dave back to work
dave_mustain.come_back
# James trying to register agen
james.register_in_library
p '----'
# James take book home and try take another book
james.take_book_home('The Hobbit')
james.enter_to_library(school_library, 'Wed')
james.take_book_home('The Hobbit')
randy.enter_to_library(school_library, 'Wed')
james.give_book_back('The Hobbit')
p '-----'
# James give his book to library
james.give_book_to_library('Lord of the Rings: the Fellowship of the Ring')
# Randy want take 'Lord of the Rings: the Fellowship of the Ring'
randy.take_book('Lord of the Rings: the Fellowship of the Ring')
randy.give_book_back('Lord of the Rings: the Fellowship of the Ring')
# James want read other book
james.take_book("Schindler's List")
# Book Presentation
Library.notification_about_event('The Last Mortal Bond',
                                 'Brian Staveley',
                                 'Tuesday',
                                 'School Library')
# Favorite books list of James
james.add_new_favorite_book('Lord of the Rings: the Fellowship of the Ring')
p james.favorite_books
# Favorite books list of Dave
p dave_mustain.favorite_books
p ''
