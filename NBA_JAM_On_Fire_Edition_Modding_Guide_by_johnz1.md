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


## Texture Files
Texture files are stored in archive files.  These are all of the texture files for players, teams, and arenas.
| Archive File | Filename | Description | bounce.db Field | Resolution | DDS Compression Type | Mip maps | Notes |
| - | - | - | - | - | - | - | - |
| fecro_big.ast | PLSH_* | In-menu player headshot photos | AssetID | 256x256 | DXT5 | No |  |
| fecro_big.ast | PLYN_* | In-menu player nametags | AssetID | 256x32 | DXT5 | No |  |
| fecro_big.ast | TMBR_* | Team logos in the Road Trip team selection menu | None (Hard-coded to the stock team IDs) | 256x64 | DXT5 | No |  |
| fecro_big.ast | TMLG_* | Team logo in matchup screen just before tipoff | AssetID | 256x256 | DXT5 | No |  |
| fecro_big.ast | TMPN_* | Team logo in team & player selection screen (background behind the player headshot photos) | AssetID | 512x256 | DXT5 | No |  |
| fecro_big.ast | TMSD_* | JAM Store team logo | AssetID | 256x256 | DXT5 | No |  |
| fecro_big.ast | TMSI_* | Small square team logo in team selection screen | AssetID | 128x128 | DXT5 | No |  |
| ge_environment_big.ast | COURT_BASELINE_* | Court baseline text or logo | Environment | Varies | DXT5 | Yes |  |
| ge_environment_big.ast | COURT_CENTER_* | Center court logo | Environment | Varies | DXT5 | Yes |  |
| ge_environment_big.ast | COURT_SECONDARY_* | Secondary court logo (usually in between the paint and the three point line) | Environment | Varies | DXT5 | Yes |  |
| ge_environment_big.ast | COURT_SURFACE_* | Hardwood court surface | Environment | 2048x1024 | DXT1 | Yes |  |
| ge_environment_big.ast | CROWD_COACH_* | Team coaches on the sideline | RenderAssetID | 256x512 or 128x256 | DXT5 | Yes |  |
| ge_environment_big.ast | CROWD_FINGERS_* | Foam fingers in the crowd | Environment | 256x512 | DXT5 | Yes |  |
| ge_environment_big.ast | CROWD_LM_* | Unknown - Nothing looks different after replacing it |  |  |  |  |  |
| ge_environment_big.ast | CROWD_MASCOT_* | Team mascot | Environment | 256x128 | DXT5 | Yes |  |
| ge_environment_big.ast | CROWD_SIGNAGE_* | Signs held up by fans in the crowd | Environment | 128x128 | DXT5 | Yes |  |
| ge_environment_big.ast | DORNA_* | Scrolling banners on the media table | Environment | 512x512 | DXT1 | Yes |  |
| ge_environment_big.ast | MEDIATABLE_* | Media table scoreboard and right team logo | RenderAssetID and Environment | 512x128 | DXT5 | Yes | The media table color for an 'Environment' is determined by this file, but it is assigned to team 'RenderAssetID', not 'Environment'. |
| ge_environment_big.ast | MEDIATABLE_LOGO_* | Media table scoreboard team logo (left) | RenderAssetID | 128x128 | DXT1 | Yes |  |
| ge_environment_big.ast | POWERRING_* | Thin arena video screen | Environment | 256x16 | DXT1 | Yes | UTA is the only one that is 256x32. |
| ge_environment_big.ast | POWERRING_GLOW_* | Glowing outline of thin arena video screen ('POWERRING') | Environment | 64x64 | DXT5 | Yes |  |
| ge_environment_big.ast | SIDELINE_* | Arena banners and NBA sign above arena walkways | Environment | 256x128 | DXT1 | Yes |  |
| ge_environment_big.ast | STADIUM_STANDS_LM_* | Unknown - Nothing looks different after replacing it |  |  |  |  |  |
| ge_environment_big.ast | STAN_BODY_* | Stanchion texture | Environment | 512x512 | DXT1 | Yes |  |
| ge_environment_big.ast | VIP_LIGHTS_* | Arena stair lighting | Environment | 64x64 | DXT5 | Yes |  |
| ge_hud_big.ast | INTRO_TEAM_BG_* | Team background of pre-game "versus" screen | RenderAssetID | 512x256 | DXT5 | Yes |  |
| ge_hud_big.ast | *_LOGO_TEX | Small team logo in the small scoreboard at the top of the screen | RenderAssetID | 128x32 | DXT5 | Yes |  |
| ge_hud_big.ast | *_NAME_TEX | In-game player nametags | AssetID | 512x128 | DXT5 | Yes | Don't use "Error Diffusion Dithering" because it leaves artifacts (dark dots).  Ideally, use "Bilinear" for mipmaps.  If the compressed file doesn't fit, use "Nearest Neighbor". |
| ge_hud_big.ast | SCORE_TEAM_* | Scoreboard team logo after a score | RenderAssetID | 256x64 | DXT5 | Yes |  |
| ge_hud_big.ast | TEAM_WINS_* | Post-game "(TEAM NAME) WINS!" text | RenderAssetID | 1024x256 | DXT5 | Yes |  |
| ge_player_big.ast | *_BODY_DIF | In-game player body textures | AttribKey | 512x512 | DXT5 | Yes | "MARK_TURMELL_HOME_BODY_DIF" is the only one that is 1024x1024. |
| ge_player_big.ast | *_HEAD_DIF | In-game player heads | AttribKey | 1024x512 | DXT5 | Yes | "DWIGHT_HOWARD_ADI_AWAY_HEAD_DIF", "DWIGHT_HOWARD_AWAY_HEAD_DIF", and "KOBE_BRYANT_AWAY_HEAD_DIF" are the only ones that are 1024x1024. |
| ge_player_big.ast | (Shoes) | In-game player shoes | AttribKey | Mostly 256x256, but sometimes 1024x1024 | DXT1 | No |  |
| ge_player_big.ast | (Uniforms) | In-game player uniforms | AttribKey | 512x512 | DXT5 | Yes |  |
| jersey_font_big.ast | JERSEY_FONT_* | In-game uniform numbers and letters | JerseyPackType | Mostly 512x512, but some 128x128 and 64x64 | DXT5 | Sometimes |  |


# How to Edit the Localization Database String Table to Modify In-Game Text
eng_us.db is the localization database for the US version of the game.  This database contains only one table, named "LanguageStrings".  It can be modified with a combination of FIFA DB Master and FIFA DB Converter:

- Convert the stock eng_us.db from big endian to little endian with FIFA Database Converter ("DB Converter").
- Edit the database in DB Master ("DBMaster_15").
	- I highly recommend exporting the table to a text file, editing that file in a text editor, then importing it with DB Master.
- Convert the file back to big endian with FIFA Database Converter.


## How to Create Player Head Textures
Almost all player head textures are 1024x512 DDS image files that have eight 256x256 images.  However, heads #3 and #8 seem to be completely unused.  I have named the six heads "Yelling" (used when dunking), "Angry" (also used when dunking), "Pain" (used when a player is shoved, stolen from, and blocked), "Front", "Side", and "Rear".

Unfortunately, player head textures are not "one size fits all" in relation to the player models.  Models have a value in ATTRIBDB that scales the size of the head texture.  Without being able to edit ATTRIBDB, this means that when you use a head texture file with different player models, it's unlikely to be the same size in the game.  This makes moving players to a different player model painful, because you need to resize all of their head textures.

Most player models only have one head texture, but players who have a headband (and even some that don't wear a headband, like Kobe Bryant, Chris Paul, and Dwight Howard) have two (for home and away).

The "Side" head is the most important because it's by far the one you see the most.

As with everything you create for this game, I recommend saving what you have done at every step.  That way, you shouldn't have to re-do work if you want to go backwards.  For example, when I'm editing a head, I have image layers to save the progress at every step (in addition to saving every color correction attempt): Before Cutting Neck, Before Adding Transparency, Before Rotating, After Rotating

The guidelines provided below are based on my analysis of the stock head textures, and what I think looks good.

- Make a copy of the "Player Head Texture" template folder for the new player head
	- I use the player name and year for the name of these folders (e.g. "Brandon Miller (2026)")
- Collect photos of the player and categorize them in the folders under "Photos"
	- Getty Images (gettyimages.com) is the best resource that I've found.  They provide high resolution photos with watermarks that don't usually cover the players' heads.
	- Only use in-game photos.  Avoid photo shoot photos.  They just don't good in the game.
	- Avoid photos that are over-exposed or have too much light reflection.  It makes color correcting much more difficult, if not impossible.  This is a classic problem with players who are bald.
 	- Ideally, use photos from the same game.  This kind of consistency looks better, and makes things easier when color correcting.  This isn't usually possible, so at least try to have all the photos be from the same small period of time.  My standard is to at least have "Front" and "Side" be from the same game because the transition between these two happens very frequently, and can be jarring if they aren't similar looking.
	- Ideally, the "Yelling", "Angry", "Pain", and "Front" photos should all be facing the camera and not turned to the side.
	- Ideally, don't use photos where the camera is very close to the player or zoomed in.  It's difficult to make these look right, and sometimes they just don't ever look good.
	- The "Side" photo should be turned to the side, but not completely.  If it's completely turned to the side, it won't look good when the player is moving diagonally.  You should be able to see the far side eye, but not anything past it.  See the example head textures in "Player Head Texture Examples.pdn":
		- Ricky Rubio is a good example of a head that's turned too far.
		- Kevin Durant is a good example of a head that's not turned far enough.
		- Tim Duncan is a good example of a proper "Side" head.
	- The "Rear" photo should be of the back of the head, but slightly turned.  If their head isn't slightly turned, it won't look good when the player is moving diagonally.  It should be turned enough so that you can see the indent of their eye socket, but not the eye itself, and you should at least be able to see part of the far side ear.  If you can't see both ears, the head is probably turned too far.  See the example head textures in "Player Head Texture Examples.pdn":
		- Anthony Davis is a good example of a head that's turned too far.
		- Paul Pierce is a good example of a head that's not turned enough.
		- Tim Duncan is a good example of a proper "Rear" head.
- Choose one photo to use for each of the six heads.
	- I recommend moving the others in the "Archive" folders.
- Crop out the backgrounds of the six photos.  Use the example head textures in "Player Head Texture Examples.pdn" for reference.
	- There are many applications that can remove the background of an image.  My current favorite for free applications is the "Remove background" feature of Windows Paint.
	- The "Yelling", "Angry", "Pain", and "Front" heads should only include player's head.  The neck should be removed.
	- The "Side" head requires some editing to look good:
		- The back of the head below the ear should be cut inwards
		- The front of the neck beneath the chin should also be cut inwards
		- There should be a transparent gradient applied to the neck.  This should be at an angle that makes more of the back of the neck transparent.
	- The "Rear" head also requires some editing:
		- The back of the head below the ear should be cut inwards - even more dramatically than the "Side" head
		- The front of the neck beneath the chin should also be cut inwards
		- There should be a transparent gradient applied to the neck.  This should be at an angle that makes more of the back of the neck transparent.
- Assuming you've already created the body texture, start the game and take a couple screenshots of the player (F12 in RPCS3).  This will be used for color correcting the heads.
- Adjust each head to match the player's body
	- To get a head that looks perfect, you will almost always need to adjust the brightness, contrast, hue, and saturation.  In Paint.net, I use BoltBait's Combined Adjustments to adjust and preview all of these at once.
	- For me, this takes at least a couple rounds of reviewing and adjusting.  For the first pass, I only adjust the Side head.
- Assemble the heads
	- Open the template head texture file ("TEMPLATE_HEAD_DIF.pdn")
	- Open the .DDS stock player head texture from the player model you are replacing.  Copy the image onto the lowest layer (named "ORIGINAL_HEAD_DIF" in the template).  Player models scale the head texture, so you want to size the new heads to match the target player model.
	- "Yelling" and "Angry" should be ~15% larger than all of the other heads.
	- I think "Rear" should be slightly smaller than "Front" and "Side".
	- If a head is looking in a particular direction, have them looking to the right.
	- Observe the divider lines.  You don't want hair from one head to show up on the edges of another head.
- Create the head texture file
	- After saving the file in a lossless format that supports layers (like Paint.net's .PDN), save the file as a .DDS image with the specs listed in the "Texture Files" section.  I recommend naming the file with the name of the player model's head texture (e.g. "TIM_DUNCAN_HOME_HEAD_DIF", so that you know which player model this head was sized for.
	- Copy the any head texture file into the same folder and give it the same name as the player model's head texture (e.g. "TIM_DUNCAN_HOME_HEAD_DIF").
	- Use the "Copy DDS Images to Texture Files.ps1" script to update the texture file.
- Import the new head texture into 'ge_player_big.ast' or 'rend_roster_update_big.ast' (depending on the player model)
- Test in-game, then make corrections and adjustments
	- It's highly unlikely that all six heads will look right on the first pass.  The size, positioning, and color almost always need to be adjusted.
	- I'm a bit of a perfectionist, so I create a video capture of the player, then review each head by watching the video (pausing, rewinding, going frame by frame) and taking notes of what should be changed.  If you want to create player heads that look great, I recommend doing this.
