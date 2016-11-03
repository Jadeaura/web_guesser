require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

def check_guess(guess)
  guess = guess.to_i
  if guess > SECRET_NUMBER
    if guess - SECRET_NUMBER > 5
      return "Way too high!"
    else
      return "Too high!"
    end
  elsif guess < SECRET_NUMBER
    if SECRET_NUMBER - guess > 5
      return "Way too low!"
    else
      return "Too low!"
    end
  else
    "You got it right!"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end
