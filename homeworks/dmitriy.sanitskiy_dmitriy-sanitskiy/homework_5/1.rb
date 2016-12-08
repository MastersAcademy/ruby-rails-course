module Eql
  40.times { print "+'=" }
  puts
end

module Article

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

  def info
    puts "> Title: #{title}, Author: #{author}, Comments: "
    comments.each { |c| c.info }
  end
end

module Category

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

  def show_all_articles
    puts "you are looking articles of category #{name} "
    @articles.each { |a| a.info }
  end

end

module Comment

  attr_accessor :text, :author

  def initialize(text, author)
    @text = text
    @author = author

    puts "Comment created by #{author}"
  end

  def info
    puts "\t|- Author: #{author}, text: #{text}"
  end

end

class ArticleClass
  extend Eql
  include Article
end
class CategoryClass
  include Category
end
class CommentClass
  include Comment
end

category1 = CategoryClass.new("CAT#1", [])
article1 = ArticleClass.new('Title-1', 'abrakadabra', 'kitty', 'author-1')
category1.add_article(article1)
article1.add_comment(CommentClass.new("bla-bla-bla", "Riky"))
article1.add_comment(CommentClass.new("bla-bla-bla", "TIKY"))
article1.add_comment(CommentClass.new("bla-bla-bla", "Tavy"))
article1.add_comment(CommentClass.new("bla-bla-bla", "TOM"))
category1.add_article(ArticleClass.new('Title-2', 'abrakadabra', 'kitty', 'author-2'))
category1.add_article(ArticleClass.new('Title-3', 'abrakadabra', 'kitty', 'author-3'))
category1.add_article(ArticleClass.new('Title-4', 'abrakadabra', 'kitty', 'author-4'))
category1.show_all_articles
