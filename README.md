# Civilization 6 Double Player Abilities Mod

## Overview
This mod doubles the player's leader ability, leader agenda, and civilization abilities in Civilization 6. It supports a configurable multiplier (default: 2x) that can be adjusted from 1x to 10x.

## Features
- **Doubles Civilization Abilities**: Enhances production, science, culture, faith, gold, and strength modifiers.
- **Doubles Leader Abilities**: Amplifies leader-specific modifiers.
- **Doubles Leader Agenda**: Boosts agenda-related modifiers.
- **Configurable Multiplier**: Adjust the multiplier from 1x to 10x in-game.
- **Expansion Support**: Compatible with Rise and Fall, Gathering Storm, and New Frontier Pass expansions.

## Installation
1. **Download the mod files**:
   - Clone this repository or download the ZIP file.
2. **Install the mod**:
   - Place the mod files in your Civilization 6 mods folder:
     - **Windows**: `Documents\My Games\Sid Meier's Civilization VI\Mods\DoublePlayerAbilities`
     - **Mac**: `~/Documents/Aspyr/Sid Meier's Civilization VI/Mods/DoublePlayerAbilities`
3. **Enable the mod**:
   - Launch Civilization 6 and enable the mod in the Additional Content menu.

## Usage
- The mod automatically applies the default multiplier (2x) to all relevant abilities for the human player.
- To change the multiplier, use the in-game function:
  ```lua
  ExposedMembers.DoublePlayerAbilities.ChangeMultiplier(desiredMultiplier)
  ```
  Replace `desiredMultiplier` with an integer between 1 and 10.

## Testing
A test script (`test_mod.lua`) is included to verify the mod's functionality outside of the game. Run it using Lua:
```sh
lua test_mod.lua
```

## Dependencies
- Base Game
- Rise and Fall
- Gathering Storm
- New Frontier Pass

## License
This mod is open-source and available under the MIT License.

## Contributing
Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## Contact
For questions or feedback, please open an issue on this repository. 