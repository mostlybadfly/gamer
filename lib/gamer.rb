require_relative 'gamer/game'


class Gamer
  attr_accessor :games
  def initialize(input)
    @input = input
    @games = []
  end

  def parse_input
    @input.readlines.each do |line|
      command, *args = line.split

      case command.downcase
      when "add"
        add(args)
      when "update"
        update(args)
      when "delete"
        delete(args)
      when "show"
        show
      else
        raise "Error: invalid command #{ command }."
      end
    end
  end

  def add(args)
    name, year, system = args
    @games << Game.new(name, year, system)
  end

  def update(args)
    name, year, system = args
    @game = get_game(name)
    @game.year = year
  end

  def delete(args)
    name, year, system = args
    @game = get_game(name)
    @games.delete @game
  end
  
  def show
    puts "Your List of games:"
    @games.each_with_index do  |game, id|
      id += 1  
      puts "#{id}.) #{game.name} | #{game.year} | #{game.system}"
      puts "...thank you!"
    end
  end

  def get_game(name)
    @games.find { |game| game.name == name }
  end
end

