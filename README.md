![preview](https://user-images.githubusercontent.com/39247311/49796741-cf723180-fd3d-11e8-8b8a-2d4d3de6b568.PNG)
# HF Patch for Koikatu! and Koikatsu Party!
A patch for [Koikatu](http://www.illusion.jp/preview/koikatu/index.php) and [Koikatsu Party](https://steamcommunity.com/app/1073440) with all free updates, fan-made English translations and essential mods. It will allow you to load all character cards and scenes and give you countless gameplay improvements while still keeping the original, uncluttered and clean feel of the game.

All content is tested and fixed (or removed) as needed before each update, providing a stable platform for further modding. HF Patch can also repair many common issues, try it if you have issues.

HF Patch does not contain the full game, paid expansions or any other pirated content. You have to buy the game and expansions separately. You can buy the game [on Steam](https://steamcommunity.com/app/1073440). Until the expansions are localized and released on Steam, their Japanese versions can be bought [here](https://dlsoft.dmm.co.jp/detail/illusion_0024/) and [here](https://dlsoft.dmm.co.jp/detail/illusion_0026/).

- Koikatu Darkness DLC is supported since HF Patch version v2.6
- Koikatsu Party (Steam release) is supported since HF Patch version v2.7.1

You can support development of HF Patch and many of the included plugins through my Patreon page: https://www.patreon.com/ManlyMarco

## Download
Check the [Releases](https://github.com/ManlyMarco/KK-HF_Patch/releases) page for download links. To get mail updates for each new release you can watch this repositiory (top right) or watch the linked patreon page.

## How to install
1. Install the game and any paid expansions that you want.
2. Download the latest HF Patch to any directory and run it.
3. You can customize the install but for beginners it's recommended to use the default settings.
4. Wait until it's done and enjoy the game!

## What mods are included?
You can see a list of all included mods in the source code [here under the "Components" section](https://github.com/ManlyMarco/KK-HF_Patch/blob/master/patch.iss).

## Discussion and help
If you need any help, visit the Koikatsu Discord server and check out the #faqs channel. If you didn't find what you need, feel free to ask in the #help channel or in comments under this post, we'll be happy to help!
- [Koikatu Wiki (Gameplay and technical help)](https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu)
- [Koikatsu! discord server](https://discord.gg/zS5vJYS)
- [HongFire Koikatu! Discussion thread](http://www.hongfire.com/forum/forum/hentai-lair/hentai-game-discussion/5921249)
- [Illusion Soft discord server](https://discord.gg/F3bDEFE)

## Important notes, please read
- HF Patch does not contain the full game, paid expansions or any other pirated content. The full game needs to be already installed for the patch to work. If you want to use the VR module, also install it before patching! 
- If you have installed a previous HF Patch or separate mods it is recommended to remove ALL mods when prompted. This will prevent any potential mod conflicts or outdated mods causing problems.
- Steam users: Consider changing Koikatsu Party updates on Steam to manual. New updates might install automatically and break mods (which can break the game in return) with no user input. If you verify game files in your Steam client, you will lose many features and have to re-run HF Patch. You can do this if you have issues as it will not remove any of your data. You can prevent Steam from showing you play the game by starting the .exe manually (not from the Steam library).
- All paid DLC are optional and not required. The patch is compatible with any combination of DLC and with both Japanese and English versions of Koikatu/Koikatsu.
- You can run this patch as many times as you want and nothing will break. All mods are optional to install, and most can be removed by running the patch again.
- It's recommended to install all content mods if you plan to download character cards - they are required by many cards and scenes.
- You can use this patch to fix many broken game/mod installs.
- Older versions of BepInEx will be automatically upgraded, and most botched installations should get fixed by running this patch. WARNING: If you have a very old BepInEx folder REMOVE it when prompted!
- Most mods are in plugin and sideloader form to avoid modifying game files. You can run HF Patch again to remove them.
- You can find more frequent updates to sideloader modpacks ⦁	here. If you find a card that is showing mod missing warnings, try updating these.
- Please leave the modders some positive feedback or help them in some other way!
- There is no warranty on this patch or on any of the included mods. You are installing this patch at your own risk.

### Notes for Steam release (Koikatsu Party)
- Consider pausing your Koikatsu updates on Steam. New updates might install automatically and break mods (which can break the game in return) with no user input. 
- You can prevent Steam from showing you play the game by starting the .exe manually (not from the Steam library). Make your games private to be extra sure. The game can also run with Steam turned off. Just know that we won't judge you for your hours played :)
- If you verify game files in your Steam client, you will lose many features and have to re-run HF Patch to get them back. You can do this if you have issues as it will restore game files but not remove any of your data.
- Included fan translations are only used to fill in the gaps in official translation (DLC, studio, mods).
- It is possible to install Japanese versions of Summer Personality Expansion and After School Expansion packs to the Steam release (note that they only have mostly low quality machine translations, but the features work fine). They are both entirely optional and HF Patch will inform you if they are missing. Check the discord server for more info.
- Installing HF Patch will add free updates for Koikatu, which contain Studio and optionally the VR module (both are separate exe files).

## How to build
At least Visual Studio 2017 is needed for the helper library and latest unicode Inno Setup compiler is needed for the patch itself. All necessary mods have to be placed inside correct subfolders of the Input directory to compile. Because of massive size, they are not included here.
