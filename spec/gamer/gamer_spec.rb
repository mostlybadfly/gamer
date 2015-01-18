require "spec_helper"

describe Gamer do
  describe '#add' do
    it 'adds a new game' do
      input_file = File.open("input.txt", "r")
      gamer = Gamer.new(input_file)
      gamer.parse_input
      expect(gamer.games.first).to be_a(Game)
    end
  end

  describe '#update' do
    it 'updates an existing game' do
      input_file = File.open("input.txt", "r")
      gamer = Gamer.new(input_file)
      gamer.parse_input
    end
  end
end
