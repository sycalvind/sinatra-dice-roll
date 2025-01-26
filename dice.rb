require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

#argument: resource path (root in this case)
get("/") do
  #action
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  @title = "2d6"
  @rolls = []
  2.times do
    die = rand(1..6)
    @rolls.push(die) 
  end
  #sum = first_die + second_die
=begin
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
=end
  erb(:two_six)
end

get("/dice/2/10") do
  @title = "2d10"
  @rolls = []
  2.times do
    die = rand(1..10)
    @rolls.push(die)
  end
  #sum = first_die + second_die
=begin
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
=end
  erb(:two_ten)
end

get("/dice/1/20") do
  @title = "1d20"
  @rolls = []
  die = rand(1..20)
  @rolls.push(die)
  #@outcome = "You rolled a #{@die}."
  erb(:one_twenty)
end

get("/dice/5/4") do
  @title = "5d4"
  @rolls = []
  5.times do
    die = rand(1..4)
    @rolls.push(die)
  end
=begin
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
  @outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die}, and a #{fifth_die} for a total of #{sum}."
=end
  erb(:five_four)
end

get("/dice/100/6") do
  @title = "100d6"
  @rolls = []
  100.times do
    die = rand(1..6)
    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
