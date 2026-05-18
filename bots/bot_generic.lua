local bot = GetBot()
local botName = bot:GetUnitName()
if bot == nil or bot:IsInvulnerable() or not bot:IsHero() or not string.find(botName, "hero") or bot:IsIllusion() then return end

require( GetScriptDirectory()..'/FunLib/aba_global_overrides' )
local Utils = require( GetScriptDirectory()..'/FunLib/utils' )
local BotBuild = dofile(GetScriptDirectory() .. "/BotLib/" .. string.gsub(botName, "npc_dota_", ""));

if BotBuild == nil
then
	print('[ERROR] No build config file found for bot: '..botName)
	return
end

local function IsIgnoredMinion(hMinionUnit)
	if hMinionUnit == nil or hMinionUnit:IsNull() then return true end

	local unitName = hMinionUnit:GetUnitName()
	return unitName == 'npc_dota_side_gunner'
		or unitName == 'npc_dota_looping_sound'
end

function MinionThink(hMinionUnit)
	if IsIgnoredMinion(hMinionUnit) or not Utils.IsValidUnit(hMinionUnit) then return end
	if hMinionUnit.lastMinionFrameProcessTime == nil then hMinionUnit.lastMinionFrameProcessTime = DotaTime() end
	if DotaTime() - hMinionUnit.lastMinionFrameProcessTime < 0.3 then return end
	hMinionUnit.lastMinionFrameProcessTime = DotaTime()

	BotBuild.MinionThink(hMinionUnit)
end
