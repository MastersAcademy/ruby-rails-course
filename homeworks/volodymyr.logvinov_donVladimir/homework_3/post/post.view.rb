class PostView
  def initialize(model)
    @model = model
    puts model
  end

  def self.print(post)
    puts '', ''
    puts post["title"]
    puts "created: " + post["created_at"]
    puts "---------------"
    puts "> " + post["text"]
  end

end
