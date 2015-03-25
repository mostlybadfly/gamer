require "spec_helper"

describe Gamer do
  describe '#add' do
    it 'adds a new game' do
      gamer = Gamer.new
      gamer.add("Earthbound", 1996, "SNES")
      expect(gamer.games.first).to be_a(Game)
    end
  end

  describe '#update' do
    it 'updates an existing game' do
      gamer = Gamer.new
      gamer.add("Earthbound", 1996, "SNES")
      gamer.update("Earthbound", 1995, "SNES")
      expect(gamer.games.first.year).to eq(1995)
    end
  end

  describe '#delete' do
    it 'deletes an existing game' do
      gamer = Gamer.new
      gamer.add("Shaq-Fu", 1996, "SNES")
      gamer.delete("Shaq-fu")
      expect(gamer.get_game('Shaq-fu')).to be_nil
    end
  end
end
