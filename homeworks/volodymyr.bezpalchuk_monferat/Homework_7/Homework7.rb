require 'json'

RESPONSE = '{
  "movie": {
    "basic_info": {
      "title": "Rogue One",
      "year": 2016,
      "genres": ["Action, Adventure, Sci-Fi"],
      "runtime": 133,
      "country": "USA",
      "language": "English"
    },
    "details": {
      "studio": "Walt Disney Pictures",
      "mpaa_rating": "PG-13",
      "release_dates": {
        "theater": "2016-12-16",
        "dvd": "2017-04-02"
      },
      "ratings": {
        "metascore": 6.5,
        "usercore": 7.8,
        "imbd": 8.1,
        "kinopoisk": 7.568
      },
      "plot": "The Rebel Alliance makes a risky move to steal the plans for the Death Star, setting up the epic saga to follow."
    },
    "cast": {
      "actors": [
        {
          "name": "Felicity Jones",
          "characters": "Jyn Erso"
        },
        {
          "name": "Diego Luna",
          "characters": "Cassian Andor"
        },
        {
          "name": "Alan Tudyk",
          "characters": "K-2SO"
        },
        {
          "name": "Donnie Yen",
          "characters": "Chirrut Imwe"
        },
        {
          "name": "Ben Mendelsohn",
          "characters": "Orson Krennic"
        }
      ],
      "director": "Gareth Edwards",
      "writers": ["Chris Weitz, Tony Gilroy, John Knoll, Gary Whitta, George Lucas"]
    }
  }
}'

response = JSON.parse(RESPONSE)

class_name = -> (item) { item.split('_').map!{|a| a.capitalize}.join }

def parse_movies(movies, &block)
  movies.each do |key, value|
    name_class = yield(key)
    if value.is_a?(Hash)
      Struct.new(name_class,*value.keys.map(&:to_sym))
    else
      Struct.new(name_class,key.to_sym)
    end
  end
end

movie = response['movie']
parse_movies(movie, &class_name)

Struct::Details.class_eval do
  def age_recommendation
    case mpaa_rating
      when 'G'
        'All ages admitted'
      when 'PG'
        'Some material may not be suitable for children'
      when 'PG-13'
        'Some material may be inappropriate for children under 13'
      when 'R'
        'Under 17 requires accompanying parent or adult guardian'
      when 'NC-17'
        'No one 17 and under admitted'
      else
        'Not Rated'
    end
  end

  def average_rating
    average = ratings.values.inject(:+)
    average/ratings.size
  end
end

Struct::Cast.class_eval do
  def starring
    actors_name = actors.map{|actor| actor['name']}
    actors_name.join(', ')
  end
end

basic_info = Struct::BasicInfo.new(*movie['basic_info'].values)
details = Struct::Details.new(*movie['details'].values)
cast = Struct::Cast.new(*movie['cast'].values)

puts "#{basic_info.title} (#{basic_info.year})"
puts "#{basic_info.runtime} min"

puts '------------------------------------------------------------------'
puts "Director: #{cast.director}"
puts "Starring: #{cast.starring}"
puts "Storyline: #{details.plot}"

puts '------------------------------------------------------------------'
puts "Release date: #{details.release_dates['theater']}"
puts "IMBd rating: #{details.ratings['imbd']}"
print "Movie average rating: %.3f\n" %details.average_rating
puts details.age_recommendation