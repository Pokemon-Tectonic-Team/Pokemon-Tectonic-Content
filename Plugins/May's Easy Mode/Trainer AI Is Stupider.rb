# Nerf the AI
# Specifically:
#   Less likely to switch pokemon
#   Place less value on achieving damage thresholds (2hko, 3hko, etc.)
#   Place less value on raising their stats
#   Place less value on using Wish
# In the base game this is already true at lower levels, but this doubles the effect on the early game
# And also lowers the effect very slowly to half as much by the endgame
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