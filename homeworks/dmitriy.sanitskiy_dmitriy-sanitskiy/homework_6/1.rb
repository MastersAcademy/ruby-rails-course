module DestroyArticle

  def destroy_article(article)
    @articles.delete(article)
    puts "Article #{article.title} was deleted"
  end

end

module Info

  def comment_info
    puts "\t|- Author: #{author}, text: #{text}"
  end

  def article_info
    puts "> Title: #{title}, Author: #{author}, Comments: "
    comments.each { |c| c.comment_info }
  end

  def show_all_articles
    puts "you are looking articles of category #{name} "
    @articles.each { |a| a.article_info }
  end

end

class MySubStandardError < StandardError
end

class Article

  include Info

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

  include Info

  attr_accessor :name, :articles

  def initialize(name, articles)
    if name.size > 10
      raise MySubStandardError
    else
      @name = name
    end
    @articles = articles
    puts "Category #{name} created!!!"
  end

  def add_article(article)
    @articles << article
    puts "article '#{article.title}' added to '#{name}' category"
  end

end

class Comment

  include Info

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
article5 = Article.new('Title-5', 'abrakadabra', 'kitty', 'author-5')
category1.add_article(article5)
category1.show_all_articles
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

2.times do
  begin
    category1.destroy_article(article5)
  rescue NoMethodError => e
    include DestroyArticle
    puts "================================"
    puts "No such method"
    puts "================================"
    puts e.message
    puts e.backtrace
  else
    puts "================================"
    puts "That's method is here"
    puts "================================"
  ensure
    category1.show_all_articles
  end
end
puts "=========================================="

begin
  category3 = Category.new("1111", [])
  puts category3.name
rescue MySubStandardError => e
  e.backtrace
else
  puts "ok"
end
puts "---------------------------------"
begin
  category2 = Category.new("111111111111111adafasf1111111", [])
  puts category2.name
rescue MySubStandardError
  puts "Very long name of category. Try again"
else
  puts "ok"
end


