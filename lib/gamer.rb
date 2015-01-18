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
        show(args)
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
  end

  def delete
  end
  
  def show
  end
end

