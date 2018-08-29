def welcome
  p "Hello! Welcome to Star Wars world."
end
def get_character_from_user
  p "please enter a character"
  user_input = gets.chomp
  return user_input.downcase
end
