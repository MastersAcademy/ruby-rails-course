require 'date'

class PostModel

  def initialize(title, text)
    @title = title
    @text = text
    @created_at = DateTime.now.to_s
  end

  def get
    {
      "title" => @title,
      "text" => @text,
      "created_at" => @created_at
    }
  end

end
