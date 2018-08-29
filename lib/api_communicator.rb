require 'rest-client'
require 'json'
require 'pry'
def get_character_movies_from_api(character)
  film_arr = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |char|
    if char["name"].downcase == character
      char["films"].each do |link|
        response_filminfo = RestClient.get(link)
        film_arr << response_film = JSON.parse(response_filminfo)
      end
    end
  end
  film_arr
end
def print_movies(films_array)
    p "This character stars in:"
    films_array.each do |detail|
      p "#{detail["title"]}, directed by #{detail["director"]}."
  end
end
def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end
