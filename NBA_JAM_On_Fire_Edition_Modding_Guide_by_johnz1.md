# NBA JAM: On Fire Edition Modding Guide by johnz1
This is a guide for modding NBA JAM: On Fire Edition for PlayStation 3.  Reference files, templates, databases, spreadsheets, extracted files, and applications will be included in the future.  With this information, it should be possible to create a full conversion mod with new players, teams, arenas, campaigns, and more.

If you are considering starting a new JAM OFE project, feel free to contact me for advice.  I've been working on this game since 2019.  I'm happy to consult on a project and help avoid the many pitfalls there are with modding this game.  My email address is listed on nba-jam.com


# Limitations and Warnings
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


# Overview
These are the types of game files that I know how to read and edit:

- Archives (.ast)
  - These are archives that each contain multiple files.  The game has more than 200 of these files.
  - QuickBMS (with the 'nbajamfire.bms' script) can be used to extract and replace files in .ast files.
- Textures (.dds)
	- These are image files that are sometimes used as a flat image (e.g. game menu logos, team logos, player headshots) and sometimes used as 3D textures (e.g. player bodies, uniforms).
	- A variety of DDS specification options are used, but all of them are either BC1 (DX1) or BC3 (DXT5).
- Databases
	- These files are not all in the same format, so there is no universal editor for all of them.
	- 'ps3/database/bounce.db' is a T3DB database that contains data for players, teams, Road Trip, challenges/achievements, Jam Store items, and more.
	- 'ps3/loc/eng_us.db' is the localization database for the US/English version of the game.
	- 'ps3/bigs/attribdb_big.ast' is ATTRIBDB.  It is an AttribSys database that is also used in other games like Burnout, Need for Speed, and FIFA.  I do not know how to read or edit this database.
- Definition files (.xml)
	- These are plain text XML files.  They can be read and modified in any text editor.
	- 'common/gamemode' contains gameplay and matchup definitions for all game modes, including all rules and default teams and players.
	- 'common/overachiever/BounceProject.xml' defines the in-game Challenges.
	- 'ps3/database/bounce-meta.xml' details the schema of the bounce.db database.


# Tools
To help create new image files for the game, many image templates will be included in this guide.  These are all in Paint.net's .PDN format.  I like Paint.net, but I wish I had chosen something cross-platform and open source from the start.  I haven't tried to convert or open .PDN files in another application, but I hope it's possible and not too much of a pain.


# Archive Files
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


# Texture Files
Texture files are stored in archive files.  See the "reference_texture_files" table in the reference database for details about all texture files for players, teams, and arenas.


# How to Edit the bounce.db Database
bounce.db is a T3DB database that defines players, teams, unlockable items, and more.  While there are several ways to read and edit this file, as far as I know they all use Artem Khassanov's TDBAccess library.

bounce.db uses short names for all table and column names that don't at all describe their contents or purpose.  Fortunately, the NBA JAM OFE developers were nice enough to include a mapping and description of everything in the 'bounce-meta.xml' file.

For many columns (e.g. player ratings, height), you must subtract one from the value in the database to get the real value.

## TDBView
If you just want to view bounce.db, Artem Khassanov's TDBView works well (https://www.artemkh.com/nhl/tdbview/).

## Madden Xtreme DB Editor
If you want to quickly modify bounce.db, the Madden Xtreme DB Editor isn't perfect, but it does work (https://www.footballidiot.com/forum/viewtopic.php?t=21400).  The most important thing to know is that the table and column names are reversed.  For example, the 'player' table (short name: "mCJj") is "jJCm".

## Create a New Editor
If you want to modify bounce.db but want something easier to use, you might have to create your own app.  Artem has already done the hard work with the TDBAccess library.  I'm sure a decent editor app can be created with AI very quickly.

## My Solution
For my projects, I have put all data I need into a SQLite DB and basically use that as an editor.  I have a script that reads the SQLite DB and uses TDBAccess to recreate all teams and players in bounce.db.  This workflow really only works when you want to manage an entire conversion project.  This is the reason why I don't use an "editor" app for bounce.db.


# bounce.db Table and Column Descriptions

## 'player' Table (mCJj)
This table defines all players in the game.
- 'FirstName' is the player's first name, but it doesn't seem to appear anywhere in the game.
- 'LastName' is the player's last name.  The only place I've seen it used is the player's name on the back of their jersey.  This does not change the player's in-menu or in-game nametag.
- 'TeamId' is the ID of the team that the player is assigned to.
	- This will not change the uniform that player wears, but it will change the uniform lettering.
	- To hide a player, set this to "99".
- 'RosterPosition' is unknown.  It certainly has something to do with the player order when selecting a team, but I haven't been able to figure out how it works.  My workaround is to set all players to "0" and use 'Rating_Overall' to determine the player order.
- 'JerseyNum' is the jersey number that the player wears.
	- I haven't figured out how to set the number to "00".  My workaround is to replace an unused number with zero in the uniform lettering texture (JERSEY_FONT), then set 'JerseyNum' to two of that number.
- 'Rating_*' are the player ratings.
	- The database value is one higher than the real, in-game value.  e.g. If you want a rating to be 6, set it to 7.
- 'Rating_Overall' is unknown, except that it determines the player order when selecting players.  e.g. A player with 'Rating_Overall' of 4 will be listed before a player with 'Rating_Overall' of 3.
- 'Dunk_Package' controls which dunks and layups a player performs.
	- 'package_layup_generic' is for players who don't dunk.  The only time they will dunk is if they are very close to the basket.
	- 'package_dunk_basic' is for basic dunkers.
	- 'package_dunk_bigman' is for big men.  This primarily features simple, powerful-looking dunks.
	- 'package_dunk_highskill' is for big dunkers.  This features fancy, fast-moving dunks.
	- 'package_dunk_highskill_ten' is for big dunkers.  I don't know the difference between this and 'package_dunk_highskill', but if you look at the stock players who have it, it's the best dunkers in NBA history: Dominique, LeBron, Kemp, Vince, and some others.  I believe this is the only package that includes the Jordan "jumpman" dunk.
	- 'mirror' is only used by the JAMbots.  I haven't tested with it and don't know what other kind of player should be using it.
	- 'package_dunk_ssx' is only used by the SSX players.  It includes unique snowboarding dunks.
	- There are several packages that are unused in the stock game, but they aren't very useful:
		- 'package_dunk_obama' doesn't seem to perform any new dunks.  It should be noted that Obama doesn't have this package assigned to him, which makes me think the developers were going to have a special dunk package for him but they didn't complete it.
		- 'package_dunk_generic' always performs the same dunk.
		- 'package_dunk_sprite' always performs the same dunk.
		- 'package_dunk_jordan' has a very exciting name, but it seems to be the same as 'package_dunk_generic' because it always performs the same dunk.
		- 'package_layup_bigman' doesn't seem to be any different from 'package_layup_generic'.
		- 'package_layup_highskill' doesn't seem to be any different from 'package_layup_generic'.
- 'Loco_Package' is the running animation that the player uses.  See the loco package reference video here: https://www.mediafire.com/file/7a66hlkhc6gx5nt/NBA_JAM_On_Fire_Edition_-_Player_Loco_Packages.mp4/file
	- 'package_loco_smallman' leans forward the most.
	- 'package_loco_swingman' is more upright.
	- 'package_loco_bigman' is very upright.
	- 'mirror' is only used by the JAMbots.
- 'Shot_Package' is the shot animation that the player uses.  See the shot package reference video here: https://www.mediafire.com/file/ho2waph4dxzccx1/NBA_JAM_On_Fire_Edition_-_Player_Shot_Packages.mp4/file
	- 'package_shot_generic' is the style that most players in the stock game use.
	- 'package_shot_generic_bigman'
	- 'package_shot_sigbird' (Larry Bird)
	- 'package_shot_sigbol' (Bol Bol)
	- 'package_shot_sigboozer' (Carlos Boozer)
	- 'package_shot_sigbosh' (Chris Bosh)
	- 'package_shot_sigcarter' (Vince Carter)
	- 'package_shot_sigdavis' (Baron Davis)
	- 'package_shot_sigdrj' (Julius Erving) is the only shot package that uses a hook shot instead of a jump shot.  I suspect that this was going to be used for Kareem, but he didn't make it into the game.
	- 'package_shot_sigduncan' (Tim Duncan)
	- 'package_shot_sigdurant' (Kevin Durant)
	- 'package_shot_sigginobli' (Manu Ginobili)
	- 'package_shot_siggranger' (Danny Granger)
	- 'package_shot_sighardaway' (Tim Hardaway)
	- 'package_shot_sighoward' (Dwight Howard)
	- 'package_shot_sigisiah' (Isiah Thomas)
	- 'package_shot_sigiverson' (Allen Iverson)
	- 'package_shot_sigkg' (Kevin Garnett)
	- 'package_shot_sigkobe' (Kobe Bryant)
	- 'package_shot_siglebron' (LeBron James)
	- 'package_shot_sigmalone' (Karl Malone)
	- 'package_shot_sigmelo' (Carmelo Anthony)
	- 'package_shot_sigmullin' (Chris Mullin)
	- 'package_shot_signash' (Steve Nash)
	- 'package_shot_signoah' (Joakim Noah)
	- 'package_shot_signowitzki' (Dirk Nowitzki)
	- 'package_shot_sigpau' (Pau Gasol)
	- 'package_shot_sigpaul' (Chris Paul)
	- 'package_shot_sigpeja' (Peja Stojakovic)
	- 'package_shot_sigpierce' (Paul Pierce) is unused, perhaps because it doesn't look very good.
	- 'package_shot_sigroy' (Brandon Roy)
	- 'package_shot_sigshaq' (Shaquille O'Neal)
	- 'package_shot_sigsmith' (Kenny Smith)
	- 'package_shot_sigwade' (Dwyane Wade)
	- 'package_shot_sigyao' (Yao Ming)
- 'Archetype' roughly corresponds to the position that the player plays (e.g Dwight Howard is a "5", Rajon Rondo is a "1")
	- Oddly, Al Horford is the only player with a value of "6".  I suspect that this is a bug.
- 'AttribKey' is the player model that the player uses.
- 'ReflectionKey' is the player model that is reflected off the court's surface.  This directly corresponds to AttribKey.
- 'ScaledHeight' is the height of the player.  This doesn't change the player's proportions, it just scales everything in their player model.  Use this to adjust how tall a player is (but not how skinny or muscular they are).
	- I believe this is the formula that the stock game uses: <Height in inches> * 0.0117 + 0.1
- 'Handedness' controls which hand a player shoots with.
	- "l" for left-handed
	- "r" for right-handed
	- "m" is only used by JAMbots
- 'JerseyPackType' defines which team uniform lettering the player uses.  It also determines the color of team-controlled accessories in the body textures.
- 'SpeechID' is the ID for the player name audio used during a game.
- 'AssetID' is the collection of textures assigned to the player ID (PLYN, PLSH, NAME_TEX).  This should always be the same as the player ID, unless you want the same nametags and headshot photo to be used for a player on a different team.
- 'HotSpot_Id' is the location of the player's hot spot.  See the "NBA JAM On Fire Edition - Player Hot Spot Locations.png" reference image.
- 'Unlocked' determines whether or not the player is available by default, or needs to be unlocked in the Jam Store.
	- If you want a player to be available by default, set this to "1".
- 'Deleted' is always "0", except for the vacant slots that would later be used for players added in the official roster updates.
- 'Online' seems to be a player's eligibility for being used in online games.
	- All NBA players that are unlocked by default have a value of "1", and everyone else has a "0"
- 'Height' is in inches +1, but it doesn't seem to control anything.
- 'Weight' is in kilograms, but it doesn't seem to control anything.
- 'BirthDay' is the day of their birthday, but it doesn't seem to control anything.
- 'BirthMonth' is the month of their birthday, but it doesn't seem to control anything.
- 'BirthYear' is the year of their birthday, but it doesn't seem to control anything.
- 'IsCreated' is always "0".
- 'NewUnlocked' will add the "NEW" icon over the team's logo on the team selection screen.
- 'Challenge_Aggression' is always "-1".
- 'Challenge_Base' is always "-1".
- 'Challenge_Block' is always "-1".
- 'Challenge_Defensive_Lag' is always "-1".
- 'Challenge_Shove' is always "-1".
- 'Challenge_Spin' is always "-1".
- 'Tendency_Anklebreaker' is always "0".
- 'Tendency_Fadeaway' is always "0".
- 'Tendency_Perimeter' is always "0".
- 'Tendency_Steal' is always "0".

## 'team' Table (BSXd)
This table defines all teams in the game.
- 'City' is the name of the team's city.
	- Teams on the team selection screen are sorted by 'Category', then 'City'.  If you have two teams with the same 'City' name and you want to change the order that they are listed, add a tailing space to the end of the 'City' name that you want to be listed last.
	- A no-break space (NBSP) at the beginning of the 'City' name will move the team to the end of the team list.
- 'Name' is the team's nickname.  I think the only place that this is used is after the "Tonight's Matchup" screen.
- 'Abbreviation' is an abbreviated name of the team.  This doesn't seem to be used in the game, but it must be set to one of the stock values.
	- e.g. "CHI" for the Chicago Bulls.
- 'Division' is the NBA division that the team is in.  I don't know if this is used by the game.
	- 0 = Atlantic Division
	- 1 = Southeast Division
	- 2 = Central Division
	- 3 = Northwest Division
	- 4 = Southwest Division
	- 5 = Pacific Division
	- 6 = Non-NBA teams (European and fictional)
- 'Overall' seems to an overall rating for the team.  I don't know if this is used in the game.
	- The stock ratings don't make sense for the 2010-11 (when NBA JAM was released) or 2011-12 (when NBA JAM OFE was released) seasons.  I suspect they were made for an earlier season and simply were not updated.
		- OKC has a rating of 75, but they won 50 games in 2009-10, went to the Conference Finals in 2010-11, and went to the NBA Finals in 2011-12.
		- CLE has a rating of 92, but they were one of the worst teams in the league in 2010-11 and 2011-12.
		- HOU has a rating of 92, but they missed the playoffs in 2009-10, 2010-11, and 2011-12.
		- PHO has a rating of 92, but they missed the playoffs in 2010-11 and 2011-12.
	- All of the fictional teams have a rating of 100.
	- The highest rating for an NBA team is 96 for DEN.
	- The lowest rating is 74 for MIN.
- 'Unlocked' determines whether or not the team needs to be unlocked in the Jam Store.
	- If you want a team to be available by default, set this to "1".
- 'Category' controls the order that the team is displayed on the team selection screen
	- NBA teams have a value of "0".  They are displayed first.
	- Fictional teams have a value of "2".  They are displayed after the teams with a value of "0".
	- To hide a team, set this to "1".
- 'CC_MapLocX' and 'CC_MapLocY' do not seem to control anything.  The coordinates of cities on the Road Trip map are controlled by the 'roadtriplocations' table.
- 'PrimaryColor' and 'SecondaryColor' are the two colors that are used in the background of one of the "Tonight's Matchup" screens before tip-off.
- 'BenchColour' doesn't seem to control anything.
- 'AssetID' sets the AssetID package for the team.  This includes the TMLG, TMPN, and TMSI files.
- 'RenderAssetID' sets the RenderAssetID package for the team.  This includes the INTRO_TEAM_BG, LOGO_TEX, SCORE_TEAM, TEAM_WINS, CROWD_COACH, MEDIATABLE, and MEDIATABLE_LOGO files.
- 'SpeechID' is the ID number for the team name audio used during a game.
- 'Environment' is the ID of the arena that the team uses for their home games.


# How to Edit the Localization Database String Table to Modify In-Game Text
eng_us.db is the localization database for the US version of the game.  This database contains only one table ("LanguageStrings") for all non-image text in the game, aside from the team and player names that are in bounce.db.  It can be modified with a combination of FIFA DB Master and FIFA DB Converter:

- Convert the stock eng_us.db from big endian to little endian with FIFA Database Converter ("DB Converter").
- Edit the database in DB Master ("DBMaster_15").
	- I highly recommend exporting the table to a text file, editing that file in a text editor, then importing it with DB Master.
- Convert the file back to big endian with FIFA Database Converter.

Some fields support carriage returns.  To insert one, use "\n".


# How to Create Player Head Textures
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
	- The "Side" photo should be turned to the side, but not completely.  If it's completely turned to the side, it won't look good when the player is moving diagonally.  You should be able to see the far side eye, but not anything past it.  See the example head textures in "NBA JAM On Fire Edition - Player Head Texture Examples.pdn":
		- Ricky Rubio is a good example of a head that's turned too far.
		- Kevin Durant is a good example of a head that's not turned far enough.
		- Tim Duncan is a good example of a proper "Side" head.
	- The "Rear" photo should be of the back of the head, but slightly turned.  If their head isn't slightly turned, it won't look good when the player is moving diagonally.  It should be turned enough so that you can see the indent of their eye socket, but not the eye itself, and you should at least be able to see part of the far side ear.  If you can't see both ears, the head is probably turned too far.  See the example head textures in "NBA JAM On Fire Edition - Player Head Texture Examples.pdn":
		- Anthony Davis is a good example of a head that's turned too far.
		- Paul Pierce is a good example of a head that's not turned enough.
		- Tim Duncan is a good example of a proper "Rear" head.
- Choose one photo to use for each of the six heads.
	- I recommend moving the others in the "Archive" folders.
- Crop out the backgrounds of the six photos.  Use the example head textures in "NBA JAM On Fire Edition - Player Head Texture Examples.pdn" for reference.
	- I recommend cropping the image to a square resolution.  This will help later when resizing for the final texture image.
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
