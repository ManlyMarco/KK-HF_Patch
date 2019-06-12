![preview](https://user-images.githubusercontent.com/39247311/49796741-cf723180-fd3d-11e8-8b8a-2d4d3de6b568.PNG)
# HF Patch for Koikatu! / Koikatsu!
Patch with all updates and mods necessary to play the game fully uncensored and translated to English. It can repair most broken game installations and return the game to a mostly stock state. Most content mods are also included, so it's possible to load most cards and scenes.

- Koikatu Darkness DLC is supported by HF Patch versions *newer than v2.6*
- Koikatsu Party (Steam release) is supported by HF Patch versions *newer than v2.7*

You can support development of HF Patch through my Patreon page: https://www.patreon.com/ManlyMarco

## Download
Check the [Releases](https://github.com/ManlyMarco/KK-HF_Patch/releases) page for latest version download links.

## How to install
1. Install the game
2. Run the latest HF Patch
3. Wait until it's done and enjoy the game!

**Notes:**
- You can choose what mods you want, but for beginners it's recommended to leave the default settings.
- If you have installed a repack (e.g. FlashBangZ repack) or are updating from old patch, tell HF Patch to delete all old mods.

## What mods are included?
You can see a list of all included mods [here](https://github.com/ManlyMarco/KK-HF_Patch/blob/master/patch.iss#L24-L85) (lines that contain mods are highlighted, Description contains the mod name and version number).

## Important notes, please read
- This patch requires the full game to be already installed. If you want to use the VR module, also install it before patching!
Sideloader Modpack by Anon11 is included - it adds large amounts of new content and allows you to load most custom character cards. It is updated periodically here.
- If you have installed a previous HF Patch, repack like FlashBangZ or separate mods it is recommended to remove ALL mods when prompted. This will prevent any potential mod conflicts or outdated mods causing problems.
- You can run this patch as many times as you want and nothing will break. All mods are optional to install, and most can be removed by running the patch again.
- It's recommended to install all content mods if you plan to download character cards - they might be required by some (or many) cards.
You can use this patch to fix many broken game/mod installs.
- Older versions of BepInEx will be automatically upgraded, and most botched installations should get fixed by running this patch. WARNING: If you have a very old BepInEx folder REMOVE it when prompted!
- Most mods are in plugin and sideloader form to avoid modifying game files. You can run HF Patch to remove them.
- Make sure you are installing to the correct directory! (the one with original exe files)
- Please leave the modders some positive feedback or help them in some other way! You can find their posts in links below and in the official HF discussion thread!
- There is no warranty on this patch or on any of the included mods. You are installing this patch at your own risk.

## Discussion and help
- [Koikatu Wiki (Gameplay and technical help)](https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu)
- [Koikatsu! discord server](https://discord.gg/zS5vJYS)
- [HongFire Koikatu! Discussion thread](http://www.hongfire.com/forum/forum/hentai-lair/hentai-game-discussion/5921249)
- [Illusion Soft discord server](https://discord.gg/F3bDEFE)

## How to build
Needs Visual Studio 2017 for the helper library and latest unicode Inno Setup compiler. All necessary mods have to be placed inside the Input directory to compile. Because of massive size, they are not included here.
