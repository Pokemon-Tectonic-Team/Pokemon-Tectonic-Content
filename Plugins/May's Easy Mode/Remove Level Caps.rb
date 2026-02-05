# Level caps aren't used
# But the variable is still silently incremented for the purposes of scaled Pokemon gifts
def giveBattleReport
  $game_variables[LEVEL_CAP_VAR] += 5
end
LEVEL_CAPS_USED = false