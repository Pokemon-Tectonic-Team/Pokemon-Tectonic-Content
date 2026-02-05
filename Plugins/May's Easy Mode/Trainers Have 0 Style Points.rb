# Trainers have 0 style points in all stats
module GameData
  class Trainer
    alias to_trainer_base_chasm to_trainer
    def to_trainer
      trainer = to_trainer_base_chasm
      trainer.party.each do |pkmn|
        GameData::Stat.each_main do |s|
          pkmn.ev[s.id] = 0
        end
        pkmn.calc_stats
      end
      return trainer
    end
  end
end