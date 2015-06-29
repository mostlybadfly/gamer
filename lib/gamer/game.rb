class Game
  attr_accessor :name, :year, :system
  def initialize(name, year, system)
    @name = name
    @year = year
    @system = system
  end

  def to_json
    JSON.dump({:name => @name,:year => @year,:system => @system})
  end
end
