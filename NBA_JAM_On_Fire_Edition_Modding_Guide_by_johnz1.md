# NBA JAM: On Fire Edition Modding Guide by johnz1


## Introduction
This is a guide for modding NBA JAM: On Fire Edition for PlayStation 3.  Reference files, templates, databases, spreadsheets, extracted files, and applications will be included in the future.  With this information, it should be possible to create a full conversion mod with new players, teams, arenas, campaigns, and more.

If you are considering starting a new JAM OFE project, feel free to contact me for advice.  I've been working on this game since 2019.  I'm happy to consult on a project and help avoid the many pitfalls there are with modding this game.  My email address is listed on nba-jam.com


## Limitations and Warnings
Unfortunately, there are critical elements of the game that I do not know how to edit.  The most important file is ATTRIBDB.  This is the attribute database that controls many things, for example:

- Uniforms that a player wears
- Shoes that a player wears
- Body shape
- Shorts length
- Jersey neck type

Without being able to edit ATTRIBDB, it's important to know these things:
- Assigning a player to a different team does not change which uniform they wear
- Uniform textures are assigned to player models
- One uniform texture is usually assigned to multiple player models, so changing that uniform will affect multiple players.

Working around ATTRIBDB is quite painful.  For example:
- You can't simply change the uniforms that one player wears.  You either have to replace the uniform textures (which changes the uniform for anyone who wears it), or move them to a different player model that has the appropriate body shape, jersey neck type, and number of head textures (for headbands).  Also, the new textures might be larger, so you'll have to find a way to shrink the size by editing the texture.
- Instead of simply changing the shoes that a player wears, you have to replace the textures of the shoes they are currently wearing.  But that will change those shoes for every player that wears them.  Also, shoe textures aren't all the same, so there might be warping, wrapping, or blank spots.  Also, the new textures might be larger, so you'll have to find a way to shrink the size by editing the texture.

The bottom line is that modding this game (and especially overhauling the roster) without editing ATTRIBDB is arduous and time consuming.  It requires careful planning, and any changes to the plan may require extra hours of work.  I don't want to discourage anyone from modding this game, but I think everyone should be firmly warned that until ATTRIBDB can be edited, modding this game can be frustrating and painful.  I generally encourage everyone to focus on figuring out ATTRIBDB before starting a major JAM OFE project.  It will make things so much better and easier.


## Overview
These are the types of game files that I know how to read and edit:

- Archives (.ast)
  - These are archives that each contain multiple files.  The game has more than 200 of these files.
  - QuickBMS (with the 'nbajamfire.bms' script) can be used to extract and replace files in .ast files.
- Textures (.dds)
	- These are image files that are sometimes used as a flat image (e.g. game menu logos, team logos, player headshots) and sometimes used as 3D textures (e.g. player bodies, uniforms).
	- A variety of DDS specification options are used, but all of them are either BC1 (DX1) or BC3 (DXT5).
- Databases
	- These files are not all in the same format, so there is no universal editor for all of them.
	- 'ps3/database/bounce.db' contains data for players, teams, Road Trip, challenges/achievements, Jam Store items, and more.  It is a T3DB database that can be modified using Artem Khassanov's tools: https://www.artemkh.com/nhl/devtools/
	- 'ps3/loc/eng_us.db' is the English localization database.  It contains all non-image text in the game, aside from the team and player names that are in 'bounce.db'.  It can be modified with a combination of FIFA DB Master and FIFA DB Converter.
	- 'ps3/bigs/attribdb_big.ast' is ATTRIBDB.  It is an AttribSys database that is used in other games like Burnout, Need for Speed, and FIFA.  I do not know how to read or edit this database.
- Definition files (.xml)
	- These are plain text XML files.  They can be read and modified in any text editor.
	- 'common/gamemode' contains gameplay and matchup definitions for all game modes, including all rules and default teams and players.
	- 'common/overachiever/BounceProject.xml' defines the in-game Challenges.
	- 'ps3/database/bounce-meta.xml' details the schema of the 'bounce.db' database.


## Tools
To help create new image files for the game, many image templates will be included in this guide.  These are all in Paint.net's .PDN format.  I like Paint.net, but I wish I had chosen something cross-platform and open source from the start.  I haven't tried to convert or open .PDN files in another application, but I hope it's possible and not too much of a pain.


## Archive Files
NBA JAM: On Fire Edition has more than 200 .AST archive files.  I think these are the most important ones:

- 'ps3/bigs/ge_player_big.ast' contains player model textures:
	- Body textures (BODY_DIF)
	- Head textures (HEAD_DIF)
	- Shoes
	- Uniforms
- 'ps3/bigs/ge_environment_big.ast' contains arena textures:
	- Baseline textures (COURT_BASELINE)
	- Center court logos (COURT_CENTER)
	- Secondary court logos (COURT_SECONDARY)
	- Court surface textures (COURT_SURFACE)
	- Coaches (CROWD_COACH)
	- Crowd foam fingers (CROWD_FINGERS)
	- Team mascots (CROWD_MASCOT)
	- Crowd signs (CROWD_SIGNAGE)
	- Media table banners (DORNA)
	- Media tables and the team logo on the right (MEDIATABLE)
	- Media table scoreboard team logos on the left (MEDIATABLE_LOGO)
	- Thin video screens (POWERRING, POWERRING_GLOW)
	- Team banners and stadium entranceway signs (SIDELINE)
	- Stanchion bodies (STAN_BODY)
	- Crowd aisle lighting (VIP_LIGHTS)
	- And more!
- 'ps3/bigs/fecro_big.ast' contains over 2,600 front-end images:
	- Player headshots (PLSH)
	- In-menu nametags (PLYN)
	- Team selection screen logos (TMSI)
	- Team selection screen background logos (TMPN)
	- "Tonight's Matchup" team logos (TMLG)
	- Road Trip team banners (TMBR), Jam Store team logos (TMSD)
	- Loading screen photos (LOBG)
	- Many files are from the previous NBA JAM game and are completely unused in this game (GMIT, PROF_0-447, TMBT, TMCP, TMMI, TMMU, TMSP, TMW1, TMWD, ULCP)
- 'ps3/bigs/ge_hud_big.ast' contains HUD and overlay textures:
	- "Tonight's Matchup" logo behind the players (INTRO_TEAM_BG)
	- Top scoreboard team logos (LOGO_TEX)
	- In-game player nametags (NAME_TEX)
	- Post-score scoreboard team logos (SCORE_TEAM)
	- "Team wins" text (TEAM_WINS)
- 'ps3/genbigs/jersey_font_big.ast' contains jersey lettering textures

QuickBMS (https://aluigi.altervista.org/quickbms.htm) and the 'nbajamfire.bms' script (https://aluigi.altervista.org/bms/nbajamfire.bms) can be used to extract and reimport files from all of the .AST files.  When extracting, I don't use any special options.  To reimport, I use the "-w" and "-r" options.
