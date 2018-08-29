require 'rest-client'
require 'json'
require 'pry'

def get_api_data(type)
  response_string = RestClient.get("http://www.swapi.co/api/#{type}/")
  JSON.parse(response_string)

end

#method gets films that a character has appeared in
def get_character_movies_from_api(character)
  #make the web request
  response_hash = get_api_data("people")
  film_arrays = [ ]
  response_hash["results"].each do |hash|
    if hash["name"] == character
       hash["films"].each do |film_url|
         film_string = RestClient.get(film_url)
         film_arrays << JSON.parse(film_string)
       end
       return film_arrays

     end

   end
   false
end

#Method gets information on a sepcified film:
def get_film_info(film_title)
  #make the web request
  response_hash = get_api_data("films")

  response_hash["results"].each do |film|
    if film["title"] == film_title
       puts "------------------------------"
       puts "Episode #{film["episode_id"]}: #{film["title"]}"
       puts "Release date: #{film["release_date"]}"
       puts "Director: #{film["director"]}"
       puts "Producer: #{film["producer"]}"
       puts "------------------------------"
       return
     end
   end
  puts "Film not found"
end

def print_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
  puts "This character appears in the following films:"
  films_array.each do |film|
    puts "------------------------------"
    puts "Episode #{film["episode_id"]}: #{film["title"]}"
    puts "Release date: #{film["release_date"]}"
    puts "------------------------------"
  end

end

def show_character_movies(character)
  if get_character_movies_from_api(character)
    films_array = get_character_movies_from_api(character)
    print_movies(films_array)
  else
    puts "Character not found"
  end
end

def character_not_found(character)

end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
