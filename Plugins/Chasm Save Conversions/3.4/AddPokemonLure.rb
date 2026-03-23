SaveData.register_conversion(:pokemon_lure_3_4_0) do
    game_version '3.4.0'
    display_title 'Adding the Pokemon Lure 3.4.0'
    to_all do |save_data|
        globalSwitches = save_data[:switches]
        globalVariables = save_data[:variables]
        selfSwitches = save_data[:self_switches]
        itemBag = save_data[:bag]
    
        questLog = save_data[:global_metadata].quests

        if questLog.completedQuests.include?(:QUEST_LOST_GROWLITHE)
            itemBag.pbStoreItem(:POKEMONLURE, 1, false)
        end
    end
end