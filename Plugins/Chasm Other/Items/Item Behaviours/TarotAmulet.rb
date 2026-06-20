def useTarotAmulet
	$PokemonGlobal.tarot_amulet_active = !$PokemonGlobal.tarot_amulet_active
  followerEventGraphicSwap(true)
	duration = amuletMessageDuration
	if $PokemonGlobal.tarot_amulet_active
		pbMessage(_INTL("\\db[Items/TAROTAMULET_active]You turn the Tarot Amulet to its front face. It is now active.\\wtnp[{1}]",duration))
	else
		pbMessage(_INTL("\\db[Items/TAROTAMULET]You turn the Tarot Amulet to its back face. It is now disabled.\\wtnp[{1}]",duration))
	end
	return true
end

def tarotAmuletActive?
	return $PokemonGlobal.tarot_amulet_active || false
end