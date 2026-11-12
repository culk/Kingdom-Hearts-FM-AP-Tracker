# Kingdom Hearts Final Mix AP Tracker

A [PopTracker](https://github.com/black-sliver/PopTracker/) Pack for Kingdom Hearts Final Mix to be used for the multiworld randomizer [Archipelago](https://archipelago.gg/).

## Getting Started

Download the kh1_ap_tracker.zip file from the latest [Release](https://github.com/culk/Kingdom-Hearts-FM-AP-Tracker/releases) and either drag it to the [PopTracker](https://poptracker.github.io/) window or place it in your `poptracker/packs` directory.

### Detailed Setup Instructions

1. Download and install [PopTracker](https://poptracker.github.io/).
2. Download the PopTracker pack named "kh1_ap_tracker.zip" from the [latest release](https://github.com/culk/Kingdom-Hearts-FM-AP-Tracker/releases/latest) under "Assets".
3. Start PopTracker then drag and drop the "kh1_ap_tracker.zip" file onto the PopTracker window to install the pack. Alternatively, move the "kh1_ap_tracker.zip" file into your `poptracker/packs` directory without unzipping the pack.
4. Connect PopTracker to an Archipelago Multiworld for autotracking by clicking on the grey "AP" icon and then entering your Archipelago host and port information followed by your slot name and password. The "AP" icon will turn green if you are successfully connected.

## Features

- Supports advanced difficulty settings and color codes locations that require higher difficulty logic. Green locations are reachable on the current logic setting. Yellow are reachable out of logic with advanced tricks or difficult combat. Red are not reachable.
- Automatically reads player options from the AP server.
- Autotracking of found key items and checked locations.
- Highlighting of hinted item locations.

## Compatibility

The most recent release of this PopTracker pack is compatible with the following versions of the AP world in addition to the core version that comes with the AP launcher. Locations and logic available only in non-core versions are shown by changing the "World Version" setting to the correct world version.

| Non-Core World Version    | Supported since pack version |
|---------------------------|------------------------------|
| v1.4.0+ (main website)    | v1.6.0+                      |
| v1.3.0 (old)              | v1.5.2+                      |
| v1.2.0 (old)              | v1.5.2+                      |
| v1.1.0 (old)              | v1.3.1+                      |

## Screenshot

![Screenshot](images/screenshot.png)

## Pack Settings

All settings are loaded automatically when connecting the tracker to the AP server. Settings can also be changed manually to update which locations are displayed as available checks.

Settings are divided into five sections: AP world, goal, collectible requirements, settings, and locations.

### AP World

The **World Version** setting controls which version of the AP world to track. Some settings in this menu are only available in more recent non-core versions of the AP world. Settings that are not available for the selected world version are hidden.

![AP World](images/ui_ap_world.png)

- **World Version** - Changes the items, locations, and access logic to match the non-AP core versions of the AP world. This value is automatically detected when connecting to the AP server and should only be manually changed if you are playing a non-core version offline with manual tracking.

### Goal

The Goal section controls the requirements for unlocking the **End of the World** and opening the **Final Rest Door**. If playing on AP world version v1.4.0 or newer, then the option for **Raft Finish** is also available to control whether the final boss can be reached by turning in raft materials on Destiny Islands Day 2.

![Goal](images/ui_goal.png)

### Collectible Requirements

The Collectible Requirements section controls how many of a collectible are required for their respective goal. Note that a collectable is only required if their respective goal is set or if Destiny Islands checks are enabled.

![Collectible Requirements](images/ui_collectible_requirements.png)

### Settings

The Settings section controls when checks are considered available in logic or by a sequence break.

![Settings](images/ui_settings.png)

- (New in world v1.1.0) **Auto-Tab Map** - Requires AP world version v1.1.0 or newer and an active connection to the AP server using the in-game client. Enables or disables the map tab auto updating to the players current world.
- **Logic Difficulty** controls what kinds of movement or skips are required to reach out of logic check locations. Checks that are only reachable with more advanced tricks than this setting's value are considered "out of logic". Out of logic checks will display as yellow on the map tracker. Logic difficulty options:
    - Beginner: Logic only expects what would be the natural solution in vanilla gameplay or similar, as well as a guarantee of tools for boss fights.
    - Normal: Logic expects some clever use of abilities, exploration of options, and competent combat ability; generally does not require advanced knowledge.
    - Proud: Logic expects advanced knowledge of tricks and obscure interactions, such as using Combo Master, Dumbo, and other unusual methods to reach locations.
    - Minimal: Logic expects the bare minimum to get to locations; may require extensive grinding, beating fights with no tools, and performing very difficult or tedious tricks.
- **Keyblade Locks** controls whether world-specific keyblades are needed to open chests in their respective world.
- (New in world v1.1.0) **Accessory Augments** - Enables tracking of accessory augment items and advanced logic that requires accessory augments.
- **Stacking World Items** and the key item bundle options control how worlds and key items unlock locations.
    - HT Key Item Bundled: controls whether "Forget-Me-Not" and "Jack-In-The-Box" are separate items or are merged into a single key item.
    - (New in world v1.2.0) Evidence Bundled/Slides Bundled: controls whether each Evidence/Slide item is separate or if they are replaced by a single key item to progress their world state.

### Locations

The Locations section controls which optional world and minigame locations are enabled. Disabled options are not displayed on the map tracker.

![Locations](images/ui_locations.png)

## Feedback

Feedback is always appreciated. If there is an issue with the tracker, either open an issue here on github or contact me via Discord.

## Credits

- Original [Kingdom Hearts Final Mix AP Tracker](https://github.com/Lojtana/Kingdom-Hearts-FM-AP-Tracker) created by Lojtana.
- Keyblade icons are adapted from [Kingdom Hearts: Chain of Memories cards](https://www.spriters-resource.com/game_boy_advance/khcom/asset/1054/) by [GaryCXJk](https://www.spriters-resource.com/submitter/GaryCXJk/).
- All fonts and all other icons were made by [Televo](https://github.com/Televo/kingdom-hearts-recollection).
- Overview map background image is adapted from "[M42 Orion & Running Man](https://www.flickr.com/photos/65141172@N00/23216543151/)" by [Dylan O’Donnell](https://deography.com/), used under [CCO 1.0](https://creativecommons.org/publicdomain/zero/1.0/).
- All other map images made by [culk](https://github.com/culk) using Kingdom Hearts map models hosted on [noclip](https://noclip.website/) by [magcius](https://github.com/magcius). These map images are licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)