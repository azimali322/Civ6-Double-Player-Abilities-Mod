-- Test script for Double Player Abilities Mod
local config = require("config")
local mod = require("DoublePlayerAbilities")

-- Mock the game environment
local mockPlayers = {}
local mockGameDefines = {
    MAX_PLAYERS = 2
}

-- Mock Events table
Events = {
    PlayerCreated = {
        Add = function(func) end -- Mock event registration
    }
}

-- Mock ExposedMembers table
ExposedMembers = {}

-- Mock player class
local MockPlayer = {
    modifiers = {},
    isHuman = true,
    civType = 1,
    leaderType = 1
}

function MockPlayer:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.modifiers = {}
    o.isHuman = true
    o.civType = 1
    o.leaderType = 1
    return o
end

function MockPlayer:GetModifier(modifierType)
    return self.modifiers[modifierType] or 0
end

function MockPlayer:SetModifier(modifierType, value)
    self.modifiers[modifierType] = value
    if config.DEBUG_MODE then
        print(string.format("Set %s to %d", modifierType, value))
    end
end

function MockPlayer:GetCivilizationType()
    return self.civType
end

function MockPlayer:GetLeaderType()
    return self.leaderType
end

function MockPlayer:IsHuman()
    return self.isHuman
end

-- Create mock players
mockPlayers[0] = MockPlayer:new()
mockPlayers[1] = MockPlayer:new()
mockPlayers[1].isHuman = false -- AI player

-- Mock the game's Players table
Players = mockPlayers
GameDefines = mockGameDefines

-- Test function to verify modifier application
function TestModifierApplication()
    print("Testing modifier application...")
    
    -- Set initial values
    local testModifiers = {
        CIVILIZATION_ABILITY_MODIFIER = 10,
        COMBAT_STRENGTH_MODIFIER = 5,
        MOVEMENT_MODIFIER = 2,
        EXPERIENCE_MODIFIER = 3
    }
    
    for modifier, value in pairs(testModifiers) do
        mockPlayers[0].modifiers[modifier] = value
    end
    
    -- Apply the mod
    mod.DoubleCivilizationAbilities(0)
    mod.DoubleLeaderAbilities(0)
    mod.DoubleLeaderAgenda(0)
    
    -- Verify results
    for modifier, originalValue in pairs(testModifiers) do
        local newValue = mockPlayers[0].modifiers[modifier]
        local expectedValue = originalValue * config.MULTIPLIER
        if newValue == expectedValue then
            print(string.format("✓ %s: %d -> %d", modifier, originalValue, newValue))
        else
            print(string.format("✗ %s: Expected %d, got %d", modifier, expectedValue, newValue))
        end
    end
end

-- Test function to verify multiplier changes
function TestMultiplierChange()
    print("\nTesting multiplier changes...")
    
    -- Test valid multiplier
    local success = mod.ChangeMultiplier(3)
    if success then
        print("✓ Successfully changed multiplier to 3")
    else
        print("✗ Failed to change multiplier to 3")
    end
    
    -- Test invalid multiplier
    success = mod.ChangeMultiplier(11)
    if not success then
        print("✓ Correctly rejected invalid multiplier 11")
    else
        print("✗ Incorrectly accepted invalid multiplier 11")
    end
end

-- Test function to verify AI player handling
function TestAIPlayerHandling()
    print("\nTesting AI player handling...")
    
    -- Set initial values for AI player
    mockPlayers[1].modifiers["CIVILIZATION_ABILITY_MODIFIER"] = 10
    
    -- Apply the mod
    mod.DoubleCivilizationAbilities(1)
    
    -- Verify AI player's values weren't changed
    local newValue = mockPlayers[1].modifiers["CIVILIZATION_ABILITY_MODIFIER"]
    if newValue == 10 then
        print("✓ AI player modifiers unchanged")
    else
        print("✗ AI player modifiers were changed")
    end
end

-- Run all tests
print("Starting mod tests...")
print("Default multiplier:", config.MULTIPLIER)
print("-------------------")

TestModifierApplication()
TestMultiplierChange()
TestAIPlayerHandling()

print("\nTests completed!") 