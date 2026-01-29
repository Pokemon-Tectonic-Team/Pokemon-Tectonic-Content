# Battles are always perfected
def battlePerfected?
  return true
end

# Nerf the AI
def levelNerf(switch,damage,intensity)
  levelBracket = (level / 5.0).ceil
                # 5, 10,15,20,25,30,35,40,45,50,55,60,65,70
  levelPenalty = [30,30,30,28,26,24,22,20,18,16,15,15,15,15][levelBracket]
  levelPenalty = levelPenalty.to_f * intensity
  if switch == true
      PBDebug.log("[STAY-IN RATING][LEVEL NERF] #{pbThis} (#{index}) is penalizing switching (+#{levelPenalty.round})")
  elsif damage == true
      levelPenalty = levelPenalty / 5 / 10 + 1.0
      PBDebug.log"[LEVEL NERF] Adjusted score by (+#{((levelPenalty - 1) * 100).round})%"
  else
      levelPenalty = -levelPenalty / 5 / 10 + 1.0
      PBDebug.log"[LEVEL NERF] Adjusted score by (-#{100 - (levelPenalty * 100).round})%"
  end
  
  return levelPenalty
end

# Aid kit heals more
AID_KIT_BASE_HEALING = 50
HEALING_UPGRADE_AMOUNT = 20

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

# Level caps aren't used
# But the variable is still silently incremented for the purposes of scaled Pokemon gifts
def giveBattleReport
  $game_variables[LEVEL_CAP_VAR] += 5
end
LEVEL_CAPS_USED = false