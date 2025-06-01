-- Double Player Abilities Mod
-- Author: Claude
-- Description: Doubles the player's leader ability, leader agenda, and civilization abilities

local MOD_ID = "DOUBLE_PLAYER_ABILITIES"
local config = require("config")

-- Function to apply multiplier to a modifier
function ApplyMultiplier(player, modifierType, currentValue)
    if currentValue and currentValue ~= 0 then
        local newValue = currentValue * config.MULTIPLIER
        player:SetModifier(modifierType, newValue)
        if config.DEBUG_MODE then
            print(string.format("Applied multiplier to %s: %d -> %d", modifierType, currentValue, newValue))
        end
    end
end

-- Function to double civilization abilities
function DoubleCivilizationAbilities(playerID)
    local player = Players[playerID]
    if not player then return end
    
    -- Get the civilization type
    local civType = player:GetCivilizationType()
    if civType == -1 then return end
    
    -- Basic modifiers
    local basicModifiers = {
        "CIVILIZATION_ABILITY_MODIFIER",
        "CIVILIZATION_ABILITY_STRENGTH_MODIFIER",
        "CIVILIZATION_ABILITY_PRODUCTION_MODIFIER",
        "CIVILIZATION_ABILITY_SCIENCE_MODIFIER",
        "CIVILIZATION_ABILITY_CULTURE_MODIFIER",
        "CIVILIZATION_ABILITY_FAITH_MODIFIER",
        "CIVILIZATION_ABILITY_GOLD_MODIFIER"
    }
    
    -- Additional modifiers for special abilities
    local specialModifiers = {
        -- Combat modifiers
        "COMBAT_STRENGTH_MODIFIER",
        "RANGED_COMBAT_STRENGTH_MODIFIER",
        "ANTI_CAVALRY_STRENGTH_MODIFIER",
        "ANTI_RANGED_STRENGTH_MODIFIER",
        "SIEGE_STRENGTH_MODIFIER",
        "NAVAL_COMBAT_STRENGTH_MODIFIER",
        "AIR_COMBAT_STRENGTH_MODIFIER",
        "ANTI_AIR_STRENGTH_MODIFIER",
        
        -- Movement modifiers
        "MOVEMENT_MODIFIER",
        "NAVAL_MOVEMENT_MODIFIER",
        "AIR_MOVEMENT_MODIFIER",
        "MOUNTAIN_MOVEMENT_MODIFIER",
        "HILL_MOVEMENT_MODIFIER",
        "FOREST_MOVEMENT_MODIFIER",
        "JUNGLE_MOVEMENT_MODIFIER",
        "MARSH_MOVEMENT_MODIFIER",
        "DESERT_MOVEMENT_MODIFIER",
        "SNOW_MOVEMENT_MODIFIER",
        "TUNDRA_MOVEMENT_MODIFIER",
        
        -- Experience modifiers
        "EXPERIENCE_MODIFIER",
        "UNIT_EXPERIENCE_MODIFIER",
        "COMBAT_EXPERIENCE_MODIFIER",
        "NAVAL_EXPERIENCE_MODIFIER",
        "AIR_EXPERIENCE_MODIFIER",
        
        -- Range modifiers
        "RANGE_MODIFIER",
        "ATTACK_RANGE_MODIFIER",
        "NAVAL_RANGE_MODIFIER",
        "AIR_RANGE_MODIFIER",
        
        -- Sight modifiers
        "SIGHT_MODIFIER",
        "NAVAL_SIGHT_MODIFIER",
        "AIR_SIGHT_MODIFIER",
        
        -- Resource modifiers
        "RESOURCE_ACCUMULATION_MODIFIER",
        "STRATEGIC_RESOURCE_ACCUMULATION_MODIFIER",
        "LUXURY_RESOURCE_ACCUMULATION_MODIFIER",
        "BONUS_RESOURCE_ACCUMULATION_MODIFIER",
        
        -- District modifiers
        "DISTRICT_PRODUCTION_MODIFIER",
        "DISTRICT_GOLD_MODIFIER",
        "DISTRICT_SCIENCE_MODIFIER",
        "DISTRICT_CULTURE_MODIFIER",
        "DISTRICT_FAITH_MODIFIER",
        "DISTRICT_AMENITY_MODIFIER",
        "DISTRICT_HOUSING_MODIFIER",
        
        -- Unit modifiers
        "UNIT_PRODUCTION_MODIFIER",
        "UNIT_MAINTENANCE_MODIFIER",
        "UNIT_UPGRADE_COST_MODIFIER",
        "UNIT_PURCHASE_COST_MODIFIER",
        
        -- Trade modifiers
        "TRADE_ROUTE_YIELD_MODIFIER",
        "INTERNATIONAL_TRADE_ROUTE_YIELD_MODIFIER",
        "DOMESTIC_TRADE_ROUTE_YIELD_MODIFIER",
        "TRADE_ROUTE_CAPACITY_MODIFIER",
        
        -- Policy modifiers
        "POLICY_SLOT_MODIFIER",
        "WILDCARD_POLICY_SLOT_MODIFIER",
        "MILITARY_POLICY_SLOT_MODIFIER",
        "ECONOMIC_POLICY_SLOT_MODIFIER",
        "DIPLOMATIC_POLICY_SLOT_MODIFIER",
        
        -- Diplomatic modifiers
        "DIPLOMATIC_VICTORY_POINTS_MODIFIER",
        "DIPLOMATIC_FAVOR_MODIFIER",
        "DIPLOMATIC_VISIBILITY_MODIFIER",
        "DIPLOMATIC_RELATIONS_MODIFIER",
        
        -- Gathering Storm modifiers
        "POWER_MODIFIER",
        "POWER_CONSUMPTION_MODIFIER",
        "POWER_GENERATION_MODIFIER",
        "CLIMATE_CHANGE_MODIFIER",
        "DISASTER_DAMAGE_MODIFIER",
        "DISASTER_RESISTANCE_MODIFIER",
        
        -- Rise and Fall modifiers
        "LOYALTY_MODIFIER",
        "GOLDEN_AGE_MODIFIER",
        "DARK_AGE_MODIFIER",
        "ERA_SCORE_MODIFIER",
        
        -- New Frontier Pass modifiers
        "SECRET_SOCIETY_MODIFIER",
        "HERO_MODIFIER",
        "HERO_STRENGTH_MODIFIER",
        "HERO_MOVEMENT_MODIFIER",
        
        -- Special ability modifiers
        "SPECIAL_ABILITY_STRENGTH_MODIFIER",
        "SPECIAL_ABILITY_DURATION_MODIFIER",
        "SPECIAL_ABILITY_COOLDOWN_MODIFIER"
    }
    
    -- Apply all modifiers
    for _, modifierType in ipairs(basicModifiers) do
        local modifier = player:GetModifier(modifierType)
        ApplyMultiplier(player, modifierType, modifier)
    end
    
    for _, modifierType in ipairs(specialModifiers) do
        local modifier = player:GetModifier(modifierType)
        ApplyMultiplier(player, modifierType, modifier)
    end
end

-- Function to double leader abilities
function DoubleLeaderAbilities(playerID)
    local player = Players[playerID]
    if not player then return end
    
    -- Get the leader type
    local leaderType = player:GetLeaderType()
    if leaderType == -1 then return end
    
    -- Basic modifiers
    local basicModifiers = {
        "LEADER_ABILITY_MODIFIER",
        "LEADER_ABILITY_STRENGTH_MODIFIER",
        "LEADER_ABILITY_PRODUCTION_MODIFIER",
        "LEADER_ABILITY_SCIENCE_MODIFIER",
        "LEADER_ABILITY_CULTURE_MODIFIER",
        "LEADER_ABILITY_FAITH_MODIFIER",
        "LEADER_ABILITY_GOLD_MODIFIER"
    }
    
    -- Additional modifiers for special abilities
    local specialModifiers = {
        -- Combat modifiers
        "LEADER_COMBAT_STRENGTH_MODIFIER",
        "LEADER_RANGED_COMBAT_STRENGTH_MODIFIER",
        "LEADER_SIEGE_STRENGTH_MODIFIER",
        "LEADER_NAVAL_COMBAT_STRENGTH_MODIFIER",
        "LEADER_AIR_COMBAT_STRENGTH_MODIFIER",
        
        -- Movement modifiers
        "LEADER_MOVEMENT_MODIFIER",
        "LEADER_NAVAL_MOVEMENT_MODIFIER",
        "LEADER_AIR_MOVEMENT_MODIFIER",
        
        -- Experience modifiers
        "LEADER_EXPERIENCE_MODIFIER",
        "LEADER_UNIT_EXPERIENCE_MODIFIER",
        "LEADER_COMBAT_EXPERIENCE_MODIFIER",
        
        -- Range modifiers
        "LEADER_RANGE_MODIFIER",
        "LEADER_ATTACK_RANGE_MODIFIER",
        "LEADER_NAVAL_RANGE_MODIFIER",
        "LEADER_AIR_RANGE_MODIFIER",
        
        -- Sight modifiers
        "LEADER_SIGHT_MODIFIER",
        "LEADER_NAVAL_SIGHT_MODIFIER",
        "LEADER_AIR_SIGHT_MODIFIER",
        
        -- Resource modifiers
        "LEADER_RESOURCE_ACCUMULATION_MODIFIER",
        "LEADER_STRATEGIC_RESOURCE_ACCUMULATION_MODIFIER",
        "LEADER_LUXURY_RESOURCE_ACCUMULATION_MODIFIER",
        
        -- District modifiers
        "LEADER_DISTRICT_PRODUCTION_MODIFIER",
        "LEADER_DISTRICT_GOLD_MODIFIER",
        "LEADER_DISTRICT_SCIENCE_MODIFIER",
        "LEADER_DISTRICT_CULTURE_MODIFIER",
        "LEADER_DISTRICT_FAITH_MODIFIER",
        
        -- Unit modifiers
        "LEADER_UNIT_PRODUCTION_MODIFIER",
        "LEADER_UNIT_MAINTENANCE_MODIFIER",
        "LEADER_UNIT_UPGRADE_COST_MODIFIER",
        
        -- Trade modifiers
        "LEADER_TRADE_ROUTE_YIELD_MODIFIER",
        "LEADER_INTERNATIONAL_TRADE_ROUTE_YIELD_MODIFIER",
        
        -- Policy modifiers
        "LEADER_POLICY_SLOT_MODIFIER",
        "LEADER_WILDCARD_POLICY_SLOT_MODIFIER",
        
        -- Diplomatic modifiers
        "LEADER_DIPLOMATIC_VICTORY_POINTS_MODIFIER",
        "LEADER_DIPLOMATIC_FAVOR_MODIFIER",
        
        -- Gathering Storm modifiers
        "LEADER_POWER_MODIFIER",
        "LEADER_POWER_CONSUMPTION_MODIFIER",
        "LEADER_POWER_GENERATION_MODIFIER",
        
        -- Rise and Fall modifiers
        "LEADER_LOYALTY_MODIFIER",
        "LEADER_GOLDEN_AGE_MODIFIER",
        "LEADER_DARK_AGE_MODIFIER",
        
        -- New Frontier Pass modifiers
        "LEADER_SECRET_SOCIETY_MODIFIER",
        "LEADER_HERO_MODIFIER",
        "LEADER_HERO_STRENGTH_MODIFIER",
        
        -- Special ability modifiers
        "LEADER_SPECIAL_ABILITY_STRENGTH_MODIFIER",
        "LEADER_SPECIAL_ABILITY_DURATION_MODIFIER",
        "LEADER_SPECIAL_ABILITY_COOLDOWN_MODIFIER"
    }
    
    -- Apply all modifiers
    for _, modifierType in ipairs(basicModifiers) do
        local modifier = player:GetModifier(modifierType)
        ApplyMultiplier(player, modifierType, modifier)
    end
    
    for _, modifierType in ipairs(specialModifiers) do
        local modifier = player:GetModifier(modifierType)
        ApplyMultiplier(player, modifierType, modifier)
    end
end

-- Function to double leader agenda
function DoubleLeaderAgenda(playerID)
    local player = Players[playerID]
    if not player then return end
    
    -- Get the leader type
    local leaderType = player:GetLeaderType()
    if leaderType == -1 then return end
    
    -- Basic modifiers
    local basicModifiers = {
        "AGENDA_MODIFIER",
        "AGENDA_STRENGTH_MODIFIER",
        "AGENDA_PRODUCTION_MODIFIER",
        "AGENDA_SCIENCE_MODIFIER",
        "AGENDA_CULTURE_MODIFIER",
        "AGENDA_FAITH_MODIFIER",
        "AGENDA_GOLD_MODIFIER"
    }
    
    -- Additional modifiers for special abilities
    local specialModifiers = {
        -- Diplomatic modifiers
        "DIPLOMATIC_VICTORY_POINTS_MODIFIER",
        "DIPLOMATIC_FAVOR_MODIFIER",
        "DIPLOMATIC_VISIBILITY_MODIFIER",
        "DIPLOMATIC_RELATIONS_MODIFIER",
        
        -- Combat modifiers
        "AGENDA_COMBAT_STRENGTH_MODIFIER",
        "AGENDA_RANGED_COMBAT_STRENGTH_MODIFIER",
        "AGENDA_SIEGE_STRENGTH_MODIFIER",
        "AGENDA_NAVAL_COMBAT_STRENGTH_MODIFIER",
        
        -- Movement modifiers
        "AGENDA_MOVEMENT_MODIFIER",
        "AGENDA_NAVAL_MOVEMENT_MODIFIER",
        "AGENDA_AIR_MOVEMENT_MODIFIER",
        
        -- Experience modifiers
        "AGENDA_EXPERIENCE_MODIFIER",
        "AGENDA_UNIT_EXPERIENCE_MODIFIER",
        "AGENDA_COMBAT_EXPERIENCE_MODIFIER",
        
        -- Range modifiers
        "AGENDA_RANGE_MODIFIER",
        "AGENDA_ATTACK_RANGE_MODIFIER",
        "AGENDA_NAVAL_RANGE_MODIFIER",
        "AGENDA_AIR_RANGE_MODIFIER",
        
        -- Sight modifiers
        "AGENDA_SIGHT_MODIFIER",
        "AGENDA_NAVAL_SIGHT_MODIFIER",
        "AGENDA_AIR_SIGHT_MODIFIER",
        
        -- Resource modifiers
        "AGENDA_RESOURCE_ACCUMULATION_MODIFIER",
        "AGENDA_STRATEGIC_RESOURCE_ACCUMULATION_MODIFIER",
        "AGENDA_LUXURY_RESOURCE_ACCUMULATION_MODIFIER",
        
        -- District modifiers
        "AGENDA_DISTRICT_PRODUCTION_MODIFIER",
        "AGENDA_DISTRICT_GOLD_MODIFIER",
        "AGENDA_DISTRICT_SCIENCE_MODIFIER",
        "AGENDA_DISTRICT_CULTURE_MODIFIER",
        "AGENDA_DISTRICT_FAITH_MODIFIER",
        
        -- Unit modifiers
        "AGENDA_UNIT_PRODUCTION_MODIFIER",
        "AGENDA_UNIT_MAINTENANCE_MODIFIER",
        "AGENDA_UNIT_UPGRADE_COST_MODIFIER",
        
        -- Trade modifiers
        "AGENDA_TRADE_ROUTE_YIELD_MODIFIER",
        "AGENDA_INTERNATIONAL_TRADE_ROUTE_YIELD_MODIFIER",
        
        -- Policy modifiers
        "AGENDA_POLICY_SLOT_MODIFIER",
        "AGENDA_WILDCARD_POLICY_SLOT_MODIFIER",
        
        -- Gathering Storm modifiers
        "AGENDA_POWER_MODIFIER",
        "AGENDA_POWER_CONSUMPTION_MODIFIER",
        "AGENDA_POWER_GENERATION_MODIFIER",
        
        -- Rise and Fall modifiers
        "AGENDA_LOYALTY_MODIFIER",
        "AGENDA_GOLDEN_AGE_MODIFIER",
        "AGENDA_DARK_AGE_MODIFIER",
        
        -- New Frontier Pass modifiers
        "AGENDA_SECRET_SOCIETY_MODIFIER",
        "AGENDA_HERO_MODIFIER",
        "AGENDA_HERO_STRENGTH_MODIFIER",
        
        -- Special ability modifiers
        "AGENDA_SPECIAL_ABILITY_STRENGTH_MODIFIER",
        "AGENDA_SPECIAL_ABILITY_DURATION_MODIFIER",
        "AGENDA_SPECIAL_ABILITY_COOLDOWN_MODIFIER"
    }
    
    -- Apply all modifiers
    for _, modifierType in ipairs(basicModifiers) do
        local modifier = player:GetModifier(modifierType)
        ApplyMultiplier(player, modifierType, modifier)
    end
    
    for _, modifierType in ipairs(specialModifiers) do
        local modifier = player:GetModifier(modifierType)
        ApplyMultiplier(player, modifierType, modifier)
    end
end

-- Function to change the multiplier
function ChangeMultiplier(newMultiplier)
    if newMultiplier >= config.MIN_MULTIPLIER and newMultiplier <= config.MAX_MULTIPLIER then
        config.MULTIPLIER = newMultiplier
        if config.DEBUG_MODE then
            print(string.format("Multiplier changed to %d", newMultiplier))
        end
        -- Reapply modifiers to all human players
        for i = 0, GameDefines.MAX_PLAYERS - 1 do
            local player = Players[i]
            if player and player:IsHuman() then
                DoubleCivilizationAbilities(i)
                DoubleLeaderAbilities(i)
                DoubleLeaderAgenda(i)
            end
        end
        return true
    end
    if config.DEBUG_MODE then
        print(string.format("Invalid multiplier value: %d", newMultiplier))
    end
    return false
end

-- Event handler for when a player is created
function OnPlayerCreated(playerID)
    -- Only apply to human players
    if Players[playerID]:IsHuman() then
        if config.DEBUG_MODE then
            print(string.format("Applying modifiers to player %d", playerID))
        end
        DoubleCivilizationAbilities(playerID)
        DoubleLeaderAbilities(playerID)
        DoubleLeaderAgenda(playerID)
    end
end

-- Register the event handler
Events.PlayerCreated.Add(OnPlayerCreated)

-- Expose the ChangeMultiplier function to the game
ExposedMembers.DoublePlayerAbilities = {
    ChangeMultiplier = ChangeMultiplier
}

print("Double Player Abilities Mod loaded successfully!") 