# lmfunctions
alpha version of my vanilla (1.12.1) multiboxing functions addon.

Basically all it does for now is providing a very limited set of macros for a very limited set of race/class/spec scenarious.
Planning on expanding it greatly over time, but as of right now not really usable for the average guy. Some functions require SuperMacro to use. Simply said, I create functions that does stuff and call them ingame using /script functionName(); (e.g. /script lmsheepstar();

Targetting works by scanning the environment infront of the slaves with targetnearestenemy (basically tab) and check for raid marks (skull, cross, star, etc..), then do the approriate thing depending on the mark. Skull on target for DPSers to start DPSing. Add - SET targetNearestDistance "50" - your config.wtf file for improved tab targetting distance.

In the top of lmfunctions.lua change spell ranks and your toon names to make it work. Well not really using toon names right now, but will in the future for prioritizing buffs and heals. Feel free to copy and improve as you like :)

Right now I'm using it with a 5man team consisting of low levels: Druid tank, pally healer, frost mage, survival hunter and holyfire/smite priest.

Functions so far:

# /script lmsheepstar();
Does what it says on the tin. Sheeps star, by tab targetting 15 times, if it finds a star, it polymorphs. Change polymorph rank in the top of lua file depending on your level.

# /script lmdruidheal();
Stupid test I made to heal with druid. Not very good. Cast rank4 healing touch on anyone in party below 80%, or regrowth on anyone under 40%. Change ranks in top of lua file.

# /script lmpallyheal();
Pally healing, not very developed right now. I know it says flash heal in the source code, but pally is only level 19 right now, so using Holy Light. Anyway, it heals anyone under 80%.

# /script lmsmitepriest();
Smite priests main button. Took the healing part out right now for leveling purposes, but it does holy fire, if not buffed, and then spams smite till 25% mana, then wands till 80% mana, then smite back down to 25% mana, ad infinitum. Lots of plans for this guy though. Wand needs to be on action slot 60 ( https://imgur.com/VGArn )

# /script lmmagedps();
frost bolts till 5% mana, then wands backup to 80%.

# /script lmhuntdps();
Checks for hunter's mark and applies it. Casts arcane shot right now(aimed shot in the future) and Auto Shot if skull. 
