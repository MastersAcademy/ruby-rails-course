class PostController
  def initialize(model, view, db)
    @db = db.new
    @db.connect('My fake DB')

    @model = model
    @view = view
  end

  def input_post
    post = @model.new(input('title'), input('text'))

    @db.post('posts', post.get)
  end

  def input(subject)
    puts "Please input " + subject
    gets.chomp
  end

  def show_posts
    posts = @db.get_all('posts')
    unless posts.empty?
      puts "You have " + posts.length.to_s + (posts.length.to_i == 1 ? ' post' : ' posts')
      posts.each {|post|  @view.print(post)}
      return
    end

    puts "No posts yet."
  end

end
