require_relative 'gamer/game'
require 'json'

class Gamer
  attr_accessor :games
  def initialize
    @games = File.read("gamelist.json")
    @games = JSON.parse(@games)
  end

  def add(*args)
    name, year, system = args
    @games << Game.new(name, year, system).to_json
    save
  end
# TODO: have user select game from list and select attribute to change
  def update
    puts "Please select the number of the game you want to change:"
    list
    choice = gets.chomp
    @game = get_game(name)
    @game.year = year
    @game.system = system
  end
# TODO: have user select game from list to delete
  def delete(name)
    @game = get_game(name)
    @games.delete @game
  end
  
  def show
    puts "Your List of games:"
    list
    puts "...thank you!"
  end

  def list
    @games.each_with_index do  |game, id|
      id += 1
      game = JSON.load(game)
      puts "#{id}.) #{game["name"]} | #{game["year"]} | #{game["system"]}"
    end
  end
# TODO: rework method to get game from @games and JSON.load
  def get_game(name)
    @games.find { |game| game.name == name }
  end

  def save
    gamefile = File.open("gamelist.json", "w")
    gamefile.write(@games)
    gamefile.close
  end
end

