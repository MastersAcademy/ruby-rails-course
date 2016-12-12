module ArticleM

  def info
    puts "> Title: #{title}, Author: #{author}, Comments: "
    comments.each { |c| c.info }
  end

  module Greet
    def bla
      puts "Hello in Class Article!!!"
    end
  end

end

module CategoryM

  def show_all_articles
    puts "you are looking articles of category #{name} "
    @articles.each { |a| a.info }
  end

end

module CommentM

  def info
    puts "\t|- Author: #{author}, text: #{text}"
  end

end

class Article
  extend ArticleM::Greet
  include ArticleM

  attr_accessor :title, :text, :image, :author, :comments

  def initialize(title, text, image, author)
    @title = title
    @text = text
    @image = image
    @author = author
    @comments = []

    puts "Article #{title} was created!"
  end

  def add_comment(comment)
    @comments << comment

    puts "Comment with text '#{comment.text}' was added by '#{comment.author}'"
  end

end

class Category

  include CategoryM

  attr_accessor :name, :articles

  def initialize(name, articles)
    @name = name
    @articles = articles
    puts "Category #{name} created!!!"
  end

  def add_article(article)
    @articles << article
    puts "article '#{article.title}' added to '#{name}' category"
  end

end

class Comment

  include CommentM

  attr_accessor :text, :author

  def initialize(text, author)
    @text = text
    @author = author

    puts "Comment created by #{author}"
  end

end

category1 = Category.new("CAT#1", [])
article1 = Article.new('Title-1', 'abrakadabra', 'kitty', 'author-1')
category1.add_article(article1)
article1.add_comment(Comment.new("bla-bla-bla", "Riky"))
article1.add_comment(Comment.new("bla-bla-bla", "TIKY"))
article1.add_comment(Comment.new("bla-bla-bla", "Tavy"))
article1.add_comment(Comment.new("bla-bla-bla", "TOM"))
category1.add_article(Article.new('Title-2', 'abrakadabra', 'kitty', 'author-2'))
category1.add_article(Article.new('Title-3', 'abrakadabra', 'kitty', 'author-3'))
category1.add_article(Article.new('Title-4', 'abrakadabra', 'kitty', 'author-4'))
category1.show_all_articles
puts "===================================="
puts "#{Article.public_methods}\n\n" # first method :bla
puts "#{Article.public_instance_methods}"