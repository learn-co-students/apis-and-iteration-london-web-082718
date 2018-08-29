def welcome
  puts "Welcome to our amazing star wars program!"
end

def display_menu
  puts "Please choose from the following options to use the app:"
  puts "'1' to search for character"
  puts "'2' to search for movie info"
  puts "'q' to quit app"
  gets.chomp.downcase
end

def get_user_choice(entry)
  puts "Please enter #{entry}:"
  # use gets to capture the user's input. This method should return that input, downcased.
  capitalizer(gets.chomp.downcase)
end

def capitalizer(string)
  string.split.map(&:capitalize).join(" ")
end
