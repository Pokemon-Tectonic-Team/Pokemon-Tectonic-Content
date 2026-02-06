# Nerf the AI
# Specifically:
#   Less likely to switch pokemon
#   Place less value on achieving damage thresholds (2hko, 3hko, etc.)
#   Place less value on raising their stats
#   Place less value on using Wish
# In the base game this is already true at lower levels (easing off by level 30)
# But this majorly increases its effect on the early game and makes it stick around
# at half strength even at the lategame
class PokeBattle_Battler
    AI_SCORING_PENALTIES_BY_LEVEL =
    {
        5 => 30,
        10 => 30,
        15 => 30,
        20 => 28,
        25 => 26,
        30 => 24,
        35 => 22,
        40 => 20,
        45 => 18,
        50 => 16,
        55 => 14,
        60 => 14,
        65 => 14,
        70 => 14,
    }
end