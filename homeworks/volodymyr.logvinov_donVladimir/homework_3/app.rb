require './post/post.controller'
require './post/post.model'
require './post/post.view'

require './shared/db.service'

class App
  def initialize
    @controller = PostController.new(PostModel, PostView, DB)
    main_loop
  end

  def main_loop

    loop do
      system "clear"
      puts  "1 - show posts",
            "2 - add new posts",
            "q - quit"

      puts "Select variant: "

      case gets.chomp
      when "1"
        @controller.show_posts
        puts "Press Enter to continue..."
        gets
      when "2"
        @controller.input_post
      when "q"
        break
      end
    end

  end

end

App.new
