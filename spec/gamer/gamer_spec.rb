require "spec_helper"
require "JSON"

describe Gamer do
  describe '#add' do
    it 'adds a new game' do
      gamer = Gamer.new
      gamer.add("Earthbound", "1996", "SNES")
      expect(JSON.parse(gamer.games.first)).to be_a(Hash)
      p JSON.parse(gamer.games.first)
    end
  end

  describe '#update' do
    it 'updates an existing game' do
      gamer = Gamer.new
      gamer.add("Earthbound", "1996", "SNES")
      gamer.update(0, "Earthbound", "1995", "SNES")
      expect(gamer.get_game(0)["year"]).to eq("1995")
    end
  end

  describe '#delete' do
    it 'deletes an existing game' do
      gamer = Gamer.new
      gamer.add("Shaq-Fu", "1996", "SNES")
      gamer.delete("Shaq-fu")
      expect(gamer.get_game('Shaq-fu')).to be_nil
    end
  end
end
