![preview](https://user-images.githubusercontent.com/39247311/94689673-74a13400-032f-11eb-8162-b83ce83f2a33.png)
# HF Patch for Koikatu! and Koikatsu Party!
An unofficial patch for [Koikatu](http://www.illusion.jp/preview/koikatu/index.php) and [Koikatsu Party](https://steamcommunity.com/app/1073440) with fan-made English translations and essential mods. It will allow you to load all character cards and scenes and give you countless content creation and gameplay improvements while still keeping the original, uncluttered feel of the game. All content is tested and fixed (or removed) as needed before each update, providing a stable platform for further modding. HF Patch can also repair many common issues, try it if you have issues.

Koikatsu can be split into two parts: character and scene creation tools (character maker and Studio), and an adventure game with story mode (it can use your custom characters, but not scenes). You can see preview videos of the game and some of the mods [here](https://www.youtube.com/channel/UClyTRNXmHHsbdUWC0hq8GrA).

HF Patch does not contain the full game, paid expansions or any other pirated content. You have to buy the game and expansions separately. You can buy the English version of the game and DLC [on Steam](https://steamcommunity.com/app/1073440), or the Japanese versions [on DMM](https://dlsoft.dmm.co.jp/list/article=maker/id=30012/).

The base game (Koikatu / Koikatsu Party), and by extension this patch are not suitable for minors. If you are under 18 years old you can not use this patch. The base game and this patch contain only characters of age 18 or higher. The creator of this patch is not responsible for creations of its users and prohibits any unlawful use of this software.

- Koikatu Darkness DLC is supported since HF Patch version v2.6
- Koikatsu Party (Steam release) is supported since HF Patch version v2.7.1

You can support development of HF Patch and many of the included plugins through my Patreon page: https://www.patreon.com/ManlyMarco

## What's included?
HF Patch includes and installs by default:
- All free updates (no need to install any updates manually)
- Fan-made translations and automatic machine translations to fill in gaps (official translation in KK Party is not modified, only added to)
- Most commonly used plugins and mods, which allows you to load most character cards and scenes available online
- Fixes for common issues with the game and mods like botched mod installs
- Full uncensor with multiple different models
You can see a full list of what HF Patch contains by checking the `[Components]` section [here](https://github.com/ManlyMarco/KK-HF_Patch/blob/master/patch.iss).
Note that HF Patch does not contain the full game, paid expansions or any other pirated content. The full game needs to be already installed for the patch to work. If you want to use the VR module, also install it before patching!

## Download
Check the [Releases](https://github.com/ManlyMarco/KK-HF_Patch/releases) page for download links. The magnet links need to be downloaded with a torrent client like [qBittorrent](https://www.qbittorrent.org/). To get mail updates for each new release you can watch this repositiory (top right) or watch the linked patreon page.

## How to install the patch?
Here's a [video of how to install the game and the patch](https://www.youtube.com/watch?v=Xece-wF86BM). It's for a different game, but the process should be similar except the DLC.
1. Install Koikatu or Koikatsu Party
2. (Optional) Install any DLCs* you have. You don't have to install all of them, you can pick only some DLCs or don't install any DLCs at all.
   - If you have Koikatsu Party, install [AfterParty*](https://store.steampowered.com/app/1485180/__Koikatsu_Party__After_Party/) (Contains all of the below while being cheaper and translated)
   - Install [Personality Pack*](https://dlsoft.dmm.co.jp/detail/illusion_0024/) (Koikatu only, not really worth it)
   - Install [Afterschool*](https://dlsoft.dmm.co.jp/detail/illusion_0026/) (Koikatu only, very worth it)
   - Install any preorder DLC you have* (Koikatu only, yoyaku and darkness don't work in Party)
   - Install the VR DLC (Get it from official website for the Japanese release, and from Steam library for Koikatsu Party)
3. Download the latest HF Patch release from [Releases](https://github.com/ManlyMarco/KK-HF_Patch/releases/latest). You should get a single .exe file and 2 or more .bin files. You can place these files anywhere you want. DO NOT download any .zip files from GitHub - they contain source code for the patch, not the patch itself.
4. Install the latest HF Patch by running the .exe and following the wizard. The default settings should work well for most users.
5. Done! You can now start the game launcher as usual and you will notice some new options straight away. You can remove the downloaded patcher files now if you want to save some space.
Special patch is included in HF Patch, you don't have to install it manually. It won't hurt anything if you have it installed already, the patch will figure itself out. Just to be safe you can verify game files in Steam before installing the HF Patch if you messed with your installation folder before doing this.

### How to install DLCs
All things marked with * are paid DLC content and are all fully optional. The AfterParty DLC contains translated versions of all Japanse DLC (except Yoyaku and Darkness) at a lower price. This is the recommended option over buying the Japanse DLC if you have KK Party.

You can follow [this guide](https://steamcommunity.com/sharedfiles/filedetails/?id=2144965669) to buy and install the two major Japanse expansion DLCs.

Here's a simple way to install any downloaded DLCs (JP versions):
1. Extract the DLC/expansion with 7zip (or similar) until you find a "setup" folder that contains an "abdata" folder and some other files.
2. You need to copy all of these folders and files into your game's install directory (you should see our own abdata folder and other files similar to what's in the DLC). Replace files when asked.
3. Install HF Patch, even if you already have it installed.
If you have Koikatsu Party then do not install the Darkness and EmotionCreators preorder bonuses - they don't work properly. You will get some of the clothes, but it's just not worth it (and both of these DLC can't be legally purchased anyways, so the point is moot).

### Solutions to common issues with the patch
- If after installing the patch you have issues running the game, restart your PC and try to install the patch again with default settings.
- If after installing the patch Studio hangs when loading, start KKManager (it's in a folder in game directory) and click "Look for updates" at the top, then tell it to update the Studio modpack.
- If you have trouble downloading by using the magnet link, try updating your torrent client or use the latest qBittorrent (it's known to work well).
- Make sure you downloaded ALL parts to the same folder and that the parts all have the same name. You need ALL parts for the patch to work. If the installer asks you for another disc it means that your download was not extracted correctly and is missing files, or you renamed or removed some of the extracted files. 
- If you see any messages about corrupted files you'll have to re-download the offending part (or all of the parts).  If you downloaded the torrent, most torrent clients can "force recheck" the downloaded files so you don't have to re-download the whole thing.
- If your antivirus is flagging the .exe file make sure that you've downloaded the patch by following links in this post. If you are sure the download came from the right place, it's most likely a false positive (it's a common issue with non-signed application installers).

## Discussion and help
There is an extensive FAQ on the [wiki](https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu/Technical_Help) and in the [Koikatsu! discord server](https://discord.gg/zS5vJYS). There are also some guides available on the server.

If you need further help, feel free to ask in the **#help** channel on the server. Try to search for your issue first by using the Discord's search box at top right, it might have been already answered before. Please don't ask for help under this guide because I rarely check the comments here.

- [Koikatu Wiki (Gameplay and technical help)](https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu)
- [Koikatsu! discord server](https://discord.gg/zS5vJYS)
- [Illusion Soft discord server](https://discord.gg/F3bDEFE)

### General FAQ / Notes
- You can configure many plugins by Pressing F1 and then "Plugin settings". You can also see most of the plugin hotkeys in this menu (and change them).
- You only need to install the latest version of the patch. If you installed a previous version you don't have to do anything, just install the latest version as normal.
- Installing HF Patch will add free updates for Koikatu, which contain Studio (separate exe file). For many people this is the only mode they use (apart from character maker to make characters for use in studio), so it is highly recommended that you check it out. All of Koikatu HF Patch preview images were made in studio. You can see other people's creations and download their studio scenes from the Discord server and various card sharing boorus.
- HF Patch does not contain the full game, paid expansions or any other pirated content. The full game needs to be already installed for the patch to work. If you want to use the VR module, also install it before patching! All paid DLC are optional and not required, you can skip them and the patch will still work fine (some features might be disabled/unavailable).
- You can install HF Patch over almost any game install and have it work perfectly, and you can run it again to enable/disable some plugins. This patch will automatically fix many broken game/mod installs and common issues. Just make sure to let it remove all old mods when asked.
- It's recommended to install all content mods if you plan to download character cards - they are required by many cards and scenes. If you find a card that is showing mod missing warnings try updating Sideloader Modpacks. This can be done with [KK Manager](https://github.com/IllusionMods/KKManager).
- The mods included in the patch don't modify any game files and can be easily disabled by removing the "winhttp.dll" file from your game directory. Official patches are applied permanently.
- Please leave the modders some positive feedback or help them in some other way!
- There is no warranty on this patch or on any of the included mods. You are installing this patch at your own risk. That being said, we try our best to help in case of issues. If you find any bugs, do let us know so they can be fixed.

### FAQ / Notes for the Steam release (Koikatsu Party)
- Consider pausing your Koikatsu updates on Steam. New updates might install automatically and break mods (which can break the game in return) with no user input. 
- You can prevent Steam from showing you play the game by starting the .exe manually (not from the Steam library). Make your games private to be extra sure. The game can also run with Steam turned off. Just know that we won't judge you for your hours played :)
- If you verify game files in your Steam client, you will lose many features and have to re-run HF Patch to get them back. You can do this if you have issues as it will restore game files but not remove any of your data.
- Included fan translations are only used to fill in the gaps in official translation (DLC, studio, mods). The official English/Chinese translations are not modified.
- It is possible to install Japanese versions of Summer Personality Expansion and After School Expansion packs to the Steam release (note that they only have mostly low quality machine translations, but the features work fine). They are both entirely optional and HF Patch will inform you if they are missing. Check the discord server for more info.
- Installing HF Patch will add free updates for Koikatu, which contain Studio and optionally the VR module (both are separate exe files).

## How to build the source
At least Visual Studio 2017 is needed for the helper library and latest unicode Inno Setup compiler is needed for the patch itself. All necessary mods have to be placed inside correct subfolders of the Input directory to compile. Because of massive size, they are not included here.
