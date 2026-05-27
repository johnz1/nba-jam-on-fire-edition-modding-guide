# NBA JAM: On Fire Edition Modding Guide by johnz1



## Introduction
This is a guide for modding NBA JAM: On Fire Edition for PlayStation 3.  It is currently in a very early state, as I migrate information from documents to GitHub.  Reference files, templates, databases, spreadsheets, extracted files, and applications will be included in the future.  With this information, it should be possible to create a full conversion mod with new players, teams, arenas, campaigns, and more.

If you are considering starting a new JAM OFE project, feel free to contact me for advice.  I've been working on this game since 2019.  I'm happy to consult on a project and help avoid the many pitfalls there are with modding this game.  My contact info is listed on nba-jam.com



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
