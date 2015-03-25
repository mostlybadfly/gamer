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
# TODO
  def update(*args)
    name, year, system = args
    @game = get_game(name)
    @game.year = year
    @game.system = system
  end
# TODO
  def delete(name)
    @game = get_game(name)
    @games.delete @game
  end
  
  def show
    puts "Your List of games:"
    @games.each_with_index do  |game, id|
      id += 1
      game = JSON.load(game)
      puts "#{id}.) #{game["name"]} | #{game["year"]} | #{game["system"]}"
    end
    puts "...thank you!"
  end

  def get_game(name)
    @games.find { |game| game.name == name }
  end

  def save
    gamefile = File.open("gamelist.json", "w")
    gamefile.write(@games)
    gamefile.close
  end
end

