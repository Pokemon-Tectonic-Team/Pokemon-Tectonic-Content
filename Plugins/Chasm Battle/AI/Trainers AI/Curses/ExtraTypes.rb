PokeBattle_Battle::BattleStartApplyCurse.add(:CURSE_EXTRA_TYPES,
    proc { |curse_policy, battle, curses_array|
        battle.amuletActivates(
            _INTL("A Constant Companion, in Continous Care, shows a Radiant Rainbow, in Riveting Refractions"),
            _INTL("Enemy Pokemon all have an extra type.")
        )
        curses_array.push(curse_policy)
        next curses_array
    }
)