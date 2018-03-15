lmtank = "Lirrian"
lmhealer = "Lirheal"
lmdpsone = "Lirmagic"
lmdpstwo = "Lirshoot"
lmdpsthree = "Wandaa"

lmwrath = "Wrath(rank 1)"
lmlowcosthealtouch = "Healing Touch(rank 4)"
lmrejuv = "Rejuvenation(rank 1)"
lmregrowth = "Regrowth(rank 1)"
lmsheep = "Polymorph(rank 1)"
lmfrostbolt = "Frostbolt(rank 3)"
lmstarshards = "Starshards(rank 3)"
lmsmite = "Smite(rank 5)"
lmholyfire = "Holy Fire(rank 3)"
lmpallyflash = "Holy Light(rank 3)"
lmhuntmark = "Hunter's Mark(rank 1)"

lmpriestmanathreshold = 0.25
lmmagemanathreshold = 0.05

function lmsheepstar()
	for i=1,15 do if GetRaidTargetIndex("target") == 1 then
		CastSpellByName(lmsheep)
		else
		TargetNearestEnemy()
		end
	end
end


function lmdruidheal()
	for i=1,GetNumPartyMembers() do
		TargetUnit("party"..i)
		if UnitHealth("target")/UnitHealthMax("target") < 0.8 then
			CastSpellByName(lmlowcosthealtouch)
		elseif UnitHealth("target")/UnitHealthMax("target") < 0.4 then
			CastSpellByName(lmregrowth)
		end
		
	end
		TargetUnit("player")
		if UnitHealth("player")/UnitHealthMax("player") < 0.8 then
			CastSpellByName(lmlowcosthealtouch)
		elseif UnitHealth("player")/UnitHealthMax("player") < 0.4 then
			CastSpellByName(lmregrowth)
		end
end

function lmpallyheal()
	for i=1,GetNumPartyMembers() do
		TargetUnit("party"..i)
		if UnitHealth("target")/UnitHealthMax("target") < 0.8 then
			CastSpellByName(lmpallyflash)
		end
	end
		TargetUnit("player")
		if UnitHealth("player")/UnitHealthMax("player") < 0.8 then
			CastSpellByName(lmpallyflash)
		end
end

function lmsmitepriest()
	for i=1,15 do if GetRaidTargetIndex("target") == 8 and UnitMana("player")/UnitManaMax("player") > lmpriestmanathreshold then
			if IsAutoRepeatAction(60) == 1 then CastSpellByName("Shoot") end
			if not buffed("Holy Fire",'target') then CastSpellByName(lmholyfire) end
			CastSpellByName(lmsmite)
			lmpriestmanathreshold = 0.25
		elseif GetRaidTargetIndex("target") == 8 and UnitMana("player")/UnitManaMax("player") < lmpriestmanathreshold then
			if not IsAutoRepeatAction(60) then CastSpellByName("Shoot") end
			lmpriestmanathreshold = 0.8
		else
			TargetNearestEnemy()
		end
	end
end

function lmmagedps()
	for i=1,15 do if GetRaidTargetIndex("target") == 8 and UnitMana("player")/UnitManaMax("player") > lmmagemanathreshold then
			if IsAutoRepeatAction(60) == 1 then CastSpellByName("Shoot") end
			CastSpellByName(lmfrostbolt)
			lmmagemanathreshold = 0.05
		elseif GetRaidTargetIndex("target") == 8 and UnitMana("player")/UnitManaMax("player") < lmmagemanathreshold then
			if not IsAutoRepeatAction(60) then CastSpellByName("Shoot") end
			lmmagemanathreshold = 0.8
		else
			TargetNearestEnemy()
		end
	end
end

function lmhuntdps()
	for i=1,15 do if GetRaidTargetIndex("target") == 8 then
		if not IsAutoRepeatAction(60) then CastSpellByName("Auto Shot") end
		if not buffed("Hunter's Mark",'target') then CastSpellByName("Hunter's Mark") end
			CastSpellByName("Arcane Shot(rank 2)")
		else
			if IsAutoRepeatAction(60) == 1 then CastSpellByName("Auto Shot") end
			TargetNearestEnemy()
		end
	end
end

