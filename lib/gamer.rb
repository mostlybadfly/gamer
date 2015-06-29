require_relative 'gamer/game'
require 'json'

class Gamer
  attr_accessor :games
  def initialize
    @games = File.read("lib/gamer/gamelist.json")
    @games = JSON.parse(@games)
  end

  def add(*args)
    name, year, system = args
    @games << Game.new(name, year, system).to_json
    save
  end

  def update(id, *new_args)
    new_name, new_year, new_system = new_args
    @games[id] = (Game.new(new_name, new_year, new_system)).to_json
    puts "new game info:"
    new_game = JSON.load(@games[id])
    puts "#{new_game["name"]} | #{new_game["year"]} | #{new_game["system"]}"
    save
  end

  def delete(id)
    @games.delete_at(id)
    save
  end

  def show
    puts "Your List of games:"
    list
    puts "...thank you!"
  end

  def list
    @games.each_with_index do  |game, index|
      index += 1
      game = JSON.load(game)
      puts "#{index}.) #{game["name"]} | #{game["year"]} | #{game["system"]}"
    end
  end

  def get_game(id)
    JSON.load(@games[id])
  end

  def save
    gamefile = File.open("lib/gamer/gamelist.json", "w")
    gamefile.write(@games)
    gamefile.close
  end
end
