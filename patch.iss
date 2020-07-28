; Copyright (C) 2020  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;--------------------------------------------Full game name for naming patch itself and desktop icons
#define NAME "Koikatsu"
;----------------------------------------------------------------------------Current HF Patch version
#define VERSION "3.3"
;----------------------------------------------------------------------------------------------------
#include "_Common\Header.iss"

;#define WEBINSTALLER

[Setup]
#ifdef WEBINSTALLER
AppName=HF Patch for Koikatu! and Koikatsu Party (Web installer)
OutputBaseFilename=Koikatsu HF Patch v{#VERSION} Web installer
#else
AppName=HF Patch for Koikatu! and Koikatsu Party
OutputBaseFilename=Koikatsu HF Patch v{#VERSION}
#endif

ArchitecturesInstallIn64BitMode=x64
CloseApplications=yes
RestartApplications=no
CloseApplicationsFilter=*.exe,*.dll
Compression=lzma2/ultra64
;lzma2/ultra64 | zip | lzma2/fast
LZMAUseSeparateProcess=yes
;LZMADictionarySize=208576
LZMADictionarySize=208576
LZMANumFastBytes=273
LZMANumBlockThreads=7
DiskSpanning=yes
DefaultDirName={reg:HKCU\Software\Illusion\Koikatu\koikatu,INSTALLDIR}

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "sc"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

#include "Translations.iss"

[Types]
Name: "full_en";  Description: "{cm:fullInstall}";  Languages: en;
Name: "full";     Description: "{cm:fullInstall}";  Languages: jp sc;
Name: "extra_en"; Description: "{cm:extraInstall}"; Languages: en;
Name: "extra";    Description: "{cm:extraInstall}"; Languages: jp sc;
Name: "bare";     Description: "{cm:bareInstall}"
Name: "none";     Description: "{cm:noneInstall}"
Name: "custom";   Description: "{cm:customInstall}"; Flags: iscustom

[Components]
Name: "Patch"; Description: "Official patches + CharaStudio + KK Party Special Patch"; Types: full_en full extra_en extra custom bare none; Flags: fixed
Name: "Patch\UserData"; Description: "{cm:CompDefCards}";

Name: "BepInEx"; Description: "BepInEx v5.2.0.237 Plugin framework + MessageCenter v1.2 + ConfigurationManager v16.0 + BepIn4Patcher v1.0"; Types: full_en full extra_en extra custom bare; Flags: fixed 
Name: "BepInEx\Compat"; Description: "Backwards compatibility with IPA plugins (IPALoaderX v1.2.1)"; Types: extra_en extra 
#ifndef WEBINSTALLER
Name: "BepInEx\Dev"; Description: "{cm:CompDev}";
#endif

Name: "KKAPI"; Description: "KKAPI v1.13 (Modding API, needed by other plugins)"; Types: full_en full extra_en extra custom bare; Flags: fixed
Name: "ResourceRedirector"; Description: "XUnity.ResourceRedirector v1.1.2 (Modding API)"; Types: full_en full extra_en extra custom bare; Flags: fixed

Name: "BepisPlugins"; Description: "BepisPlugins r15.2 (Essential plugins)"; Types: full_en full extra_en extra custom bare; Flags: fixed

Name: "KKManager"; Description: "KKManager v0.13.0 (Manage and update mods)"; Types: full_en full extra_en extra custom
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "CustomLauncher"; Description: "IllusionLaunchers v2.1 (Custom launcher)"; Types: full extra full_en extra_en custom

Name: "AT"; Description: "XUnity.AutoTranslator v4.12.0"; Types: full extra full_en extra_en custom

Name: "AT\TL"; Description: "{cm:CompTL}"; Types: full_en extra_en 
Name: "AT\TL\EnglishTranslation"; Description: "Collection of English translations up to 25/07/2020 + KK_TextResourceRedirector v1.4"; Types: full_en extra_en
Name: "AT\TL\EnglishTranslation\UserData"; Description: "Translated cards, scenes and backgrounds (they overwrite defaults)"

Name: "AT\TL\KK_Subtitles"; Description: "KK_Subtitles v1.6.1 (Maker and H-scene subtitles. Warning: Most of the subs are machine-translated and can be pretty bad in H-scenes)"; Types: extra_en 

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "UNC"; Description: "{cm:CompUNC}"; Types: full_en full extra_en extra

Name: "UNC\Selector"; Description: "KK_UncensorSelector v3.9.2 (NEEDS Koikatsu Overlay Mods!)"; Types: full_en full extra_en extra
Name: "UNC\Selector\Pack"; Description: "Sideloader Modpack - KK_UncensorSelector (Uncensors for use with UncensorSelector)"; Types: full_en full extra_en extra

Name: "UNC\Tongue"; Description: "Tongue Texture v1.1 + Outline Fix"; Types: full_en full extra_en extra

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "Content"; Description: "Additional content for character and scene creation (Needed to properly load most character cards and scenes)"; Types: full_en full extra_en extra

Name: "Content\Modpack"; Description: "Sideloader Modpack (Lots of additional content for making characters)"; Types: full_en full extra_en extra
Name: "Content\ModpackCompat"; Description: "Sideloader Modpack - Compatibility Pack (Deprecated mods for backwards compatibility)"; Types: full_en full extra_en extra
Name: "Content\ModpackStudio"; Description: "Sideloader Modpack - Studio (Partial)(Additional content for making Studio scenes)"; Types: full_en full extra_en extra
Name: "Content\ModpackMaps"; Description: "Sideloader Modpack - Maps (Partial)(Additional maps)"; Types: full_en full extra_en extra

Name: "Content\KK_ClothingUnlocker"; Description: "KK_ClothingUnlocker v2.0.1 (Can use female clothes in male maker and vice versa)"; Types: full_en full extra_en extra
Name: "Content\KK_HairAccessoryCustomizer"; Description: "KK_HairAccessoryCustomizer v1.1.5 (adds advanced controls for hair accessories)"; Types: full_en full extra_en extra

Name: "Content\KK_MaterialEditor"; Description: "KK_MaterialEditor v2.1.1 (adds advanced material controls to maker and studio)"; Types: full_en full extra_en extra
Name: "Content\KK_MaterialEditor\Modpack"; Description: "Sideloader Modpack - KK_MaterialEditor (Materials for use with KK_MaterialEditor)"; Types: full_en full extra_en extra
Name: "Content\KK_MaterialEditor\KK_StudioImageEmbed"; Description: "KK_StudioImageEmbed v1.0 (Embeds custom images in scene files so others can load them)"; Types: full_en full extra_en extra

Name: "Content\MoreAccessories"; Description: "MoreAccessories 1.1.0 (Unlocks accessory limit)"; Types: full_en full extra_en extra
Name: "Content\KKABMX"; Description: "KKABMX v4.3 (More sliders in maker)"; Types: full_en full extra_en extra
Name: "Content\KKABMX\Pregnancy"; Description: "KK_Pregnancy v2.0 (Adds pregnancy to gameplay, maker and studio)"; Types: full_en full extra_en extra

Name: "Content\KSOX"; Description: "Koikatsu Overlay Mods v5.2 (Custom body, clothes and eye textures)"; Types: full_en full extra_en extra
Name: "Content\KSOX\KK_SkinEffects"; Description: "Additional Skin Effects v1.7.2 (Effects for sweating, crying, bukkake and deflowering)"; Types: full_en full extra_en extra

Name: "Content\KK_InvisibleBody"; Description: "KK_InvisibleBody v1.3.2 (Hide character body in studio)"; Types: full_en full extra_en extra
;Name: "Content\KK_AnimationController"; Description: "KK_AnimationController v2.1 (Create custom animations in studio)"; Types: full_en full extra_en extra
Name: "Content\NodesConstraints"; Description: "NodesConstraints v1.1 (Create custom animations in studio)"; Types: full_en full extra_en extra
Name: "Content\KKPE"; Description: "KKPE v2.12.0 (Advanced studio controls)"; Types: full_en full extra_en extra
Name: "Content\KK_StudioSceneSettings"; Description: "KK_StudioSceneSettings v1.1 (Adds more effect settings for scenes)"; Types: full_en full extra_en extra
Name: "Content\KK_MoreAccessoryParents"; Description: "KK_MoreAccessoryParents v1.0 (More parent options for accessories)"; Types: full_en full extra_en extra
Name: "Content\AddPose"; Description: "[moderchan]Add Pose v1.6 (Adds more poses to maker, but the pose list will become slow to load)"

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "FIX"; Description: "{cm:CompFIX}"; Types: extra_en extra

Name: "FIX\ModpackFixes"; Description: "Sideloader Modpack - Fixes (Fixes to some of the official content)"; Types: full_en full extra_en extra
Name: "FIX\KoikatuFixes"; Description: "IllusionFixes Koikatsu 14.0_26/07/2020 (A collection of important fixes)"; Types: full_en full extra_en extra
Name: "FIX\KK_ListOverride"; Description: "KK_ListOverride v1.0 + half-open pantyhose fix"; Types: full_en full extra_en extra
Name: "FIX\KK_StudioSaveWorkspaceOrderFix"; Description: "KK_StudioSaveWorkspaceOrderFix 1.0.0 (Preserve order of studio items in workspace list)"; Types: full_en full extra_en extra
Name: "FIX\KK_StudioReflectFKFix"; Description: "KK_StudioReflectFKFix 1.0.3"; Types: full_en full extra_en extra

Name: "FIX\KK_InputHotkeyBlock"; Description: "KK_InputHotkeyBlock v1.2 (Blocks plugin keybinds while typing)"; Types: full_en full extra_en extra
Name: "FIX\HideAllUI"; Description: "IllusionMods/HideAllUI.Koikatu 2.2 (Press space to hide interface)"; Types: full_en full extra_en extra

Name: "FIX\CharaStateX"; Description: "CharaStateX v1.0.2 (Can edit state of multiple charas in studio at once)"; Types: full_en full extra_en extra
Name: "FIX\KK_ReloadCharaListOnChange"; Description: "KK_ReloadCharaListOnChange v1.5.1"; Types: full_en full extra_en extra

Name: "FIX\LiquidExtension"; Description: "Base Liquid Extension v1.1 + Gloves Liquid Patch v1.0 (Expands liquid textures during H onto arms and some gloves)"; Types: full_en full extra_en extra
Name: "FIX\KK_MaleJuice"; Description: "KK_MaleJuice v1.2.2 (Enables liquid textures on males)"; Types: full_en full extra_en extra

Name: "FIX\Pupils"; Description: "Smaller Heart Pupil v1.1 (Better-looking ahegao eyes)"; Types: full_en full extra_en extra

;Name: "FIX\URL"; Description: "Use custom Character Database (fan-operated character DB - no IP blocking and mods are allowed)"; Types: full_en bare custom extra_en

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "Feature"; Description: "Improvements and additional features"; Types: extra_en extra
Name: "Feature\KK_SFW"; Description: "KK_SFW v1.0_11/07/2020 (Adds family-friendly/streamer mode with all lewd content disabled)"; Types: full_en full extra_en extra
Name: "Feature\KK_QuickAccessBox"; Description: "KK_QuickAccessBox v2.2.1 (Search all studio items, LeftCtrl+Space)"; Types: full_en full extra_en extra
Name: "Feature\KKUS"; Description: "KKUS v1.9 (Search boxes, studio and maker improvements)"; Types: full_en full extra_en extra
Name: "Feature\KK_MakerSearch"; Description: "KK_MakerSearch v1.1.1 (Search boxes in character maker item lists)"; Types: full_en full extra_en extra
Name: "Feature\DragAndDrop"; Description: "IllusionDragAndDrop.Koikatu v1.2.1 (Drag cards and scenes from explorer into game window)"; Types: full_en full extra_en extra
Name: "Feature\KK_BrowserFolders"; Description: "KK_BrowserFolders v2.1 (Folder support in chara/scene select screens)"; Types: full_en full extra_en extra
Name: "Feature\KK_PoseFolders"; Description: "KK_PoseFolders v1.0 (Folder support in studio pose list)"; Types: full_en full extra_en extra
Name: "Feature\KK_ClothesLoadOption"; Description: "KK_ClothesLoadOption 0.2.2 (Can load only some parts of coordinate cards)"; Types: full_en full extra_en extra
Name: "Feature\KK_BetterColorPicker"; Description: "KK_BetterColorPicker v2.0.1 (Select color from anywhere on screen in maker, useful for copying colors from reference images)"; Types: full_en full extra_en extra
Name: "Feature\KK_CharaMakerLoadedSound"; Description: "KK_CharaMakerLoadedSound v1.0 (Makes a sound when maker loads)"; Types: full_en full extra_en extra
Name: "Feature\KK_StudioSceneLoadedSound"; Description: "KK_StudioSceneLoadedSound v1.1 (Makes a sound when a scene loads)"; Types: full_en full extra_en extra
Name: "Feature\KK_StudioObjectMoveHotkeys"; Description: "KK_StudioObjectMoveHotkeys v1.0 (Adds T/Y/U/I hotkeys for manipulating items in studio)"; Types: full_en full extra_en extra
Name: "Feature\KK_FKIK"; Description: "KK_FKIK v1.1 (Adds FK & IK mode in studio)"; Types: full_en full extra_en extra
Name: "Feature\TitleShortcuts"; Description: "TitleShortcuts.Koikatu build 136 (Adds configurable hotkeys to main menu)"; Types: full_en full extra_en extra
Name: "Feature\KK_GamepadSupport"; Description: "KK_GamepadSupport v1.0.1 (Adds UI support for xinput gamepads and keyboard arrow keys to main game)";
Name: "Feature\KKVMD"; Description: "KKVMDPlayPlugin v0.2.3 (Support for MMD animations in Studio, press Ctrl+Shift+V)"
Name: "Feature\VideoExport"; Description: "VideoExport v1.1 (High quality recording plugin, press Ctrl+E)"; Types: extra_en extra

Name: "Feature\KK_Ahegao"; Description: "KK_Ahegao v1.8 (Make girl cum 3 times for ahegao)"; Types: full_en full extra_en extra
Name: "Feature\OutdoorSex"; Description: "Super Outdoor Sex 2.0(fixed) (More H locations on some maps)"; Types: full_en full extra_en extra
Name: "Feature\POV"; Description: "RealPOV.Koikatu build 136 + KK_StudioPOV v1.1.1 (First person view)"; Types: full_en full extra_en extra

Name: "Feature\KK_BecomeTrap"; Description: "Koikatsu: Become Trap v2.0 (Can mark a male as a trap in maker, changes gameplay)"; Types: full_en full extra_en extra
Name: "Feature\KK_EyeShaking"; Description: "KK_EyeShaking v1.0 (Adds excited eyes effect to H scenes)"; Types: full_en full extra_en extra
Name: "Feature\Gameplay"; Description: "Gameplay mod v2.0_26/07/2020 (Gameplay tweaks; Load 99 characters in school)"; Types: full_en full extra_en extra
Name: "Feature\KK_NightDarkener"; Description: "KK_NightDarkener v1.1.1 (Makes H scenes at night much darker)"; Types: extra_en extra
Name: "Feature\KK_LewdCrest"; Description: "KK_LewdCrest v0.2 (Adds a lewd crest to club members and internal finish animation in hscenes)"; Types: extra_en extra
Name: "Feature\KK_MoanSoftly"; Description: "KK_MoanSoftly v1.0 (Quieter breathing in H scenes, automatically gets louder as excitement increases)"; Types: full_en full extra_en extra
Name: "Feature\KK_ExperienceLogic"; Description: "KK_ExperienceLogic v1.0.1 (Girls can get experienced status with only vaginal or only anal experience)"; Types: full_en full extra_en extra
;Name: "Feature\KK_MoveMapFromCharaList"; Description: "KK_MoveMapFromCharaList v0.0.2"; Types: full_en full extra_en extra
Name: "Feature\KK_WarpToCharacters"; Description: "KK_WarpToCharacters v1.0 (Easily warp to characters from roster in roaming mode)"; Types: full_en full extra_en extra
Name: "Feature\KK_MobAdder"; Description: "KK_MobAdder v2.0 (Adds mobs in story mode)"; Types: full_en full extra_en extra

Name: "Feature\Bra"; Description: "KK_Pushup v1.2 (Bras affect breast shape, replaces Kiyase)"; Types: full_en full extra_en extra
Name: "Feature\KK_ForceHighPoly"; Description: "KK_ForceHighPoly v1.2.2 (Full-quality characters in school, enable in plugin settings)"; Types: full_en full extra_en extra

Name: "Feature\GraphicsSettings"; Description: "GraphicsSettings v1.1 (More game settings, allows better/worse quality)"; Types: full_en full extra_en extra
Name: "Feature\DefaultParamEditor"; Description: "DefaultParamEditor build 136 (Set custom default studio settings)"; Types: full_en full extra_en extra
Name: "Feature\KK_MakerDefaults"; Description: "KK_MakerDefaults v1.0 (Set custom default character maker settings)"; Types: full_en full extra_en extra

Name: "Feature\Colliders"; Description: "KK_Colliders v1.1 (Add physics to characters)"; Types: full_en full extra_en extra

Name: "Feature\ClothingStateMenu"; Description: "ClothingStateMenu v3.0 (Can undress in chara maker and in H scenes)"; Types: full_en full extra_en extra
Name: "Feature\HeightBar"; Description: "HeightBar v3.3 (Can measure character height in centimeters)"; Types: full_en full extra_en extra 
Name: "Feature\KK_RemoveToRecycleBin"; Description: "KK_RemoveToRecycleBin v1.1.1 (Prevents accidentally losing cards by overwriting them)"; Types: full_en full extra_en extra

Name: "Feature\KK_RandomCharacterGenerator"; Description: "AUTOMATIC1111/CharacterRandomizer v1.0 (Adds character randomization function to chara maker)"; Types: full_en full extra_en extra
Name: "Feature\KK_UniformUniforms"; Description: "KK_UniformUniforms v1.1 (Allows easily changing uniforms for the entire class, like in AA2)"; Types: extra_en extra

Name: "Feature\KK_ANIMATIONOVERDRIVE"; Description: "KK_ANIMATIONOVERDRIVE v1.1 (Unlock animation speed in studio, type in the text box)"; Types: full_en full extra_en extra
Name: "Feature\KK_PoseQuickLoad"; Description: "KK_PoseQuickLoad v1.0 (Load poses in studio by only selecting, turn on in plugin settings)"; Types: full_en full extra_en extra

Name: "Feature\KK_FreeHRandom"; Description: "KK_FreeHRandom v1.1.1 (Adds Random Character buttons to FreeH)"; Types: full_en full extra_en extra
Name: "Feature\KK_OrthographicCamera"; Description: "KK_OrthographicCamera v1.1.1 (Adds a new camera hotkey to game and studio)"; Types: full_en full extra_en extra
Name: "Feature\KK_CrossEye"; Description: "KK_CrossEye 1.6 (Adds a new camera hotkey for fake 3D mode by crossing your eyes)"; Types: extra_en extra
Name: "Feature\KK_HLightControl"; Description: "HLightControl v1.2.2 (Gives better control of lighting in H scenes)"; Types: full_en full extra_en extra
Name: "Feature\KK_HCharaAdjustment"; Description: "KK_HCharaAdjustment v2.0 (Tweak character positions in H scenes, check settings for keybinds)"; Types: full_en full extra_en extra

Name: "Feature\JannieReplacer"; Description: "Koikatsu_CharacterReplacer v1.6.2 (Can change the janitor to any character, requires Darkness)"; Types: full_en full extra_en extra

;Name:  "Feature\KK_StudioAllGirlsPlugin"              ; Description: "KK_StudioAllGirlsPlugin 1.3.2"              ; Types: full_en full extra_en extra
Name:  "Feature\KK_StudioAutoCloseLoadingSceneWindow" ; Description: "KK_StudioAutoCloseLoadingSceneWindow 1.0.3" ; Types: full_en full extra_en extra
Name:  "Feature\KK_StudioCharaOnlyLoadBody"           ; Description: "KK_StudioCharaOnlyLoadBody 1.3.7"           ; Types: full_en full extra_en extra
Name:  "Feature\KK_StudioCoordinateLoadOption"        ; Description: "KK_StudioCoordinateLoadOption 3.3.4"        ; Types: full_en full extra_en extra
;Name:  "Feature\KK_StudioSimpleColorOnGirls"          ; Description: "KK StudioSimpleColorOnGirls 1.0.5"          ; Types: full_en full extra_en extra
Name:  "Feature\KK_StudioTextPlugin"                  ; Description: "KK_StudioTextPlugin 1.1.5 (Allows writing text as studio objects)"; Types: full_en full extra_en extra
Name:  "Feature\KK_StudioCharaLightLinkedToCamera"    ; Description: "KK_StudioCharaLightLinkedToCamera 1.1.6"; Types: full_en full extra_en extra

Name: "Feature\EnableResize"; Description: "BepInEx.EnableResize v1.5 (Allows resizing the game window, can mess with the UI, turn on in plugin settings)"; Types: full_en full extra_en extra
Name: "Feature\MuteInBackground"; Description: "BepInEx.MuteInBackground v1.1 (Mute the game when it's not in focus, turn on in plugin settings)"; Types: full_en full extra_en extra

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "MISC"; Description: "{cm:CompMISC}";

Name: "MISC\FPS"; Description: "FPS Counter v3.0 (Useful for performance testing)"; Types: full_en full extra_en extra
Name: "MISC\Trainer"; Description: "Cheat tools v2.7.1 + Runtime Unity Editor v2.1.1 (Trainer and debugger)"; Types: full_en full extra_en extra

Name: "MISC\ScriptLoader"; Description: "ScriptLoader v1.2.2 (Runs user scripts from scripts folder)"; Types: full_en full extra extra_en

Name: "MISC\UnlockHPositions"; Description: "UnlockHPositions 2019-08-09 (Unlocks all positions without playing; Cheat)"
Name: "MISC\FullSave"; Description: "Unlock all events and memories (Cheat)"

;Name: "MISC\SaveEditor"; Description: "Koikatsu Save Data Editor V12 by kiletw"; Types: extra_en extra
Name: "MISC\Meme"; Description: "Custom intro voices v11 (AH↓ HA↑ HA↑ HA↑)"; Types: extra_en extra

Name: "MISC\FIX"; Description: "Fix game registry (e.g. after moving to different folder)"; Types: bare full_en full extra_en extra

[Files]
Source: "HelperLib.dll"; DestDir: "{app}"; Flags: dontcopy

Source: "Input\DirectX\Jun2010\*"; DestDir: "{tmp}\hfp\DirectXRedist2010"; Flags: ignoreversion recursesubdirs createallsubdirs deleteafterinstall; Check: DirectXRedistNeedsInstall
Source: "Input\start.bat"; DestDir: "{tmp}\hfp"; Flags: ignoreversion recursesubdirs createallsubdirs
 
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Patch\empty_ud\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\empty_ud_eng\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Languages: en

Source: "Input\KKManager\*"; DestDir: "{app}\[UTILITY] KKManager\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: KKManager

Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks_ud\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch\UserData; Check: KoikatuInstalled
;Source: "Input\_Patch\extras\UserData\*"; DestDir: "{app}\UserData\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch\UserData; Check: KoikatuInstalled

Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks_ud\UserData\Studio\scene\*"; DestDir: "{app}\UserData\Studio\scene"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch\UserData; Check: PartyInstalled

Source: "Input\_Patch\small_common\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\small_kk\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: KoikatuInstalled
Source: "Input\_Patch\small_kkp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: PartyInstalled
Source: "Input\_Patch\small_dark\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: DarknessInstalled and not PartyInstalled
#ifndef WEBINSTALLER
Source: "Input\_Patch\Remote\Patches\extras\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks_kk\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: KoikatuInstalled
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks_as\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: AfterSchoolInstalled
Source: "Input\_Patch\Remote\Patches\koikatu_03vr_d0531hg\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak createallsubdirs; Components: Patch; Check: not PartyInstalled
Source: "Input\_Patch\Remote\Patches\dkn_diff\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: DarknessInstalled and not PartyInstalled
Source: "Input\_Patch\Remote\Patches\party_diff\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: PartyInstalled
Source: "Input\_Patch\Remote\Patches\koikatsuparty_sp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: PartyInstalled
#endif

Source: "Input\BepInEx_x64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx
Source: "Input\BepInEx_Essentials\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx
Source: "Input\BepInEx_Compatibility\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx\Compat

#ifndef WEBINSTALLER
Source: "Input\BepInEx_Dev\common\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev
Source: "Input\BepInEx_Dev\Koikatu_Data\*"; DestDir: "{app}\Koikatu_Data"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev; Check: KoikatuInstalled
;Not sure how it works with the steam vr dlc
;Source: "Input\BepInEx_Dev\KoikatuVR_Data\*"; DestDir: "{app}\KoikatuVR_Data"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev; Check: VRInstalled
Source: "Input\BepInEx_Dev\Koikatsu Party_Data\*"; DestDir: "{app}\Koikatsu Party_Data"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev; Check: PartyInstalled
#endif

Source: "Input\_Plugins\BepisPlugins\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepisPlugins

Source: "Input\_Plugins\KKAPI\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: KKAPI
Source: "Input\_Plugins\XUnity.ResourceRedirector\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: ResourceRedirector

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_TL\_lang jp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: jp
Source: "Input\_TL\_lang ch\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: sc
Source: "Input\_TL\_lang eng\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: en

Source: "Input\_Plugins\XUnity.AutoTranslator\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: AT

Source: "Input\_TL\Translation_EN_base\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: AT\TL\EnglishTranslation
Source: "Input\_Plugins\KK_TextResourceRedirector\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: AT\TL\EnglishTranslation
Source: "Input\_TL\Translation_EN_jpver\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: AT\TL\EnglishTranslation; Check: not PartyInstalled

Source: "Input\_TL\Translation_EN_userdata_base\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation\UserData
Source: "Input\_TL\Translation_EN_userdata_jpver\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation\UserData; Check: not PartyInstalled

Source: "Input\Launcher_jp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: CustomLauncher; Check: not PartyInstalled
Source: "Input\Launcher_party\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: CustomLauncher; Check: PartyInstalled

Source: "Input\_Plugins\KK_Subtitles.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: AT\TL\KK_Subtitles

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Plugins\KK_UncensorSelector\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: UNC\Selector
#ifndef WEBINSTALLER
Source: "E:\Games\KoikatsuP\mods\Sideloader Modpack - KK_UncensorSelector\*"; DestDir: "{app}\mods\Sideloader Modpack - KK_UncensorSelector"; Flags: ignoreversion recursesubdirs; Components: UNC\Selector\Pack
#endif

Source: "Input\_Plugins\[moderchan]Tongue Texture v1.1 + Outline Fix.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: UNC\Tongue

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Plugins\ModBoneImplantor.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Content\Modpack

#ifndef WEBINSTALLER
Source: "E:\Games\KoikatsuP\mods\Sideloader Modpack\*";                      DestDir: "{app}\mods\Sideloader Modpack";                      Flags: ignoreversion recursesubdirs solidbreak; Components: Content\Modpack;        
Source: "E:\Games\KoikatsuP\mods\Sideloader Modpack - Compatibility Pack\*"; DestDir: "{app}\mods\Sideloader Modpack - Compatibility Pack"; Flags: ignoreversion recursesubdirs solidbreak; Components: Content\ModpackCompat; 
Source: "E:\Games\KoikatsuP\mods\Sideloader Modpack - Studio\*";             DestDir: "{app}\mods\Sideloader Modpack - Studio";             Flags: ignoreversion recursesubdirs solidbreak; Components: Content\ModpackStudio; 
Source: "E:\Games\KoikatsuP\mods\Sideloader Modpack - Fixes\*";              DestDir: "{app}\mods\Sideloader Modpack - Fixes";              Flags: ignoreversion recursesubdirs solidbreak; Components: FIX\ModpackFixes;       
Source: "E:\Games\KoikatsuP\mods\Sideloader Modpack - Maps\*";               DestDir: "{app}\mods\Sideloader Modpack - Maps";               Flags: ignoreversion recursesubdirs; Components: Content\ModpackMaps       
Source: "E:\Games\KoikatsuP\mods\Sideloader Modpack - KK_MaterialEditor\*";  DestDir: "{app}\mods\Sideloader Modpack - KK_MaterialEditor";  Flags: ignoreversion recursesubdirs; Components: Content\KK_MaterialEditor\Modpack;
#endif

Source: "Input\_Plugins\KK_ClothingUnlocker\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_ClothingUnlocker
Source: "Input\_Plugins\KK_HairAccessoryCustomizer\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_HairAccessoryCustomizer
Source: "Input\_Plugins\KK_MaterialEditor\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_MaterialEditor
Source: "Input\_Plugins\KK_StudioImageEmbed\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_MaterialEditor\KK_StudioImageEmbed

Source: "Input\_Plugins\MoreAccessories.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion ; Components: Content\MoreAccessories
Source: "Input\_Plugins\KKABMX\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KKABMX
Source: "Input\_Plugins\KK_Pregnancy\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KKABMX\Pregnancy
Source: "Input\_Plugins\Koikatsu Overlay Mods\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KSOX

Source: "Input\_Plugins\KK_SkinEffects\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KSOX\KK_SkinEffects
Source: "Input\_Plugins\KK_InvisibleBody\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_InvisibleBody
Source: "Input\_Plugins\NodesConstraints.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Content\NodesConstraints
Source: "Input\_Plugins\KKPE\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KKPE
Source: "Input\_Plugins\KK_StudioSceneSettings\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_StudioSceneSettings
Source: "Input\_Plugins\KK_MoreAccessoryParents.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Content\KK_MoreAccessoryParents
Source: "Input\_Plugins\[moderchan]Add Pose v1.6.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: Content\AddPose

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Plugins\IllusionFixes_Koikatsu\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\KoikatuFixes
Source: "Input\_Plugins\KK_ListOverride\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_ListOverride

Source: "Input\_Plugins\KK_InputHotkeyBlock\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_InputHotkeyBlock

Source: "Input\_Plugins\HideAllUI.Koikatu.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: FIX\HideAllUI

Source: "Input\_Plugins\CharaStateX.Koikatu.dll"; DestDir: "{app}\BepInEx\plugins\KeelPlugins"; Flags: ignoreversion; Components: FIX\CharaStateX
Source: "Input\_Plugins\KK_ReloadCharaListOnChange\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_ReloadCharaListOnChange

Source: "Input\_Plugins\Liquid extension\*"; DestDir: "{app}\mods"; Flags: ignoreversion recursesubdirs; Components: FIX\LiquidExtension
Source: "Input\_Plugins\KK_MaleJuice\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_MaleJuice

Source: "Input\_Plugins\[DeathWeasel][KK]Smaller Heart Pupil v1.1.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: FIX\Pupils

;Source: "Input\_Plugins\[Character Database][various] fixed\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\URL

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Plugins\KK_SFW\KK_SFW_Patcher.dll"; DestDir: "{app}\BepInEx\patchers";  Flags: ignoreversion; Components: Feature\KK_SFW
Source: "Input\_Plugins\KK_SFW\sfw\KK_SFW.cfg";     DestDir: "{app}\BepInEx\config";    Flags: ignoreversion; Components: Feature\KK_SFW; Check: SFWmode
Source: "Input\_Plugins\KK_SFW\nsfw\KK_SFW.cfg";    DestDir: "{app}\BepInEx\config";    Flags: ignoreversion; Components: Feature\KK_SFW; Check: NSFWmode

Source: "Input\_Plugins\KK_QuickAccessBox\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_QuickAccessBox
Source: "Input\_Plugins\KKUS.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\KKUS
Source: "Input\_Plugins\KK_MakerSearch\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_MakerSearch
Source: "Input\_Plugins\DragAndDrop.Koikatu.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\DragAndDrop
Source: "Input\_Plugins\KK_BrowserFolders\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_BrowserFolders
Source: "Input\_Plugins\KK_PoseFolders\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_PoseFolders
Source: "Input\_Plugins\KK_ClothesLoadOption.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\KK_ClothesLoadOption; Check: not PartyInstalled
Source: "Input\_Plugins\KK_BetterColorPicker\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_BetterColorPicker
Source: "Input\_Plugins\KK_StudioSceneLoadedSound\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_StudioSceneLoadedSound
Source: "Input\_Plugins\KK_CharaMakerLoadedSound\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_CharaMakerLoadedSound
Source: "Input\_Plugins\KK_StudioObjectMoveHotkeys\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_StudioObjectMoveHotkeys
Source: "Input\_Plugins\KK_FKIK\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_FKIK
Source: "Input\_Plugins\TitleShortcuts.Koikatu.dll"; DestDir: "{app}\BepInEx\plugins\KeelPlugins"; Flags: ignoreversion recursesubdirs; Components: Feature\TitleShortcuts
Source: "Input\_Plugins\KK_GamepadSupport\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_GamepadSupport
Source: "Input\_Plugins\KKVMD\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KKVMD
Source: "Input\_Plugins\VideoExport\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\VideoExport

Source: "Input\_Plugins\KK_Ahegao.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_Ahegao
Source: "Input\_Plugins\[uppervolta]Super Outdoor Sex 2.0.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: Feature\OutdoorSex
Source: "Input\_Plugins\RealPOV.Koikatu.dll"; DestDir: "{app}\BepInEx\plugins\KeelPlugins"; Flags: ignoreversion; Components: Feature\POV
Source: "Input\_Plugins\KK_StudioPOV\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\POV

Source: "Input\_Plugins\KK_BecomeTrap\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_BecomeTrap
Source: "Input\_Plugins\KK_EyeShaking\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_EyeShaking
Source: "Input\_Plugins\KoikatuGameplayMod.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\Gameplay
Source: "Input\_Plugins\KK_LewdCrest\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_LewdCrest
Source: "Input\_Plugins\KK_NightDarkener.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\KK_NightDarkener
Source: "Input\_Plugins\KK_MoanSoftly\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_MoanSoftly
Source: "Input\_Plugins\KK_ExperienceLogic.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_ExperienceLogic
;Source: "Input\_Plugins\KK_MoveMapFromCharaList_en\KK_MoveMapFromCharaList.dll"; DestDir: "{app}\BepInEx\IPA"; Flags: ignoreversion; Components: Feature\KK_MoveMapFromCharaList; Languages: en
;Source: "Input\_Plugins\KK_MoveMapFromCharaList_jp\KK_MoveMapFromCharaList.dll"; DestDir: "{app}\BepInEx\IPA"; Flags: ignoreversion; Components: Feature\KK_MoveMapFromCharaList; Languages: jp sc
Source: "Input\_Plugins\KK_WarpToCharacters\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_WarpToCharacters
Source: "Input\_Plugins\KK_MobAdder\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_MobAdder

Source: "Input\_Plugins\KK_Pushup\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\Bra
Source: "Input\_Plugins\KK_ForceHighPoly.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\KK_ForceHighPoly

Source: "Input\_Plugins\GraphicsSettings.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\GraphicsSettings
Source: "Input\_Plugins\DefaultParamEditor.Koikatu.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\DefaultParamEditor
Source: "Input\_Plugins\KK_MakerDefaults\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_MakerDefaults

Source: "Input\_Plugins\KK_Colliders\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\Colliders

Source: "Input\_Plugins\ClothingStateMenu\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\ClothingStateMenu
Source: "Input\_Plugins\KK_HeightBar\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\HeightBar
Source: "Input\_Plugins\KK_RemoveToRecycleBin.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\KK_RemoveToRecycleBin

Source: "Input\_Plugins\CharacterRandomizer.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_RandomCharacterGenerator
Source: "Input\_Plugins\KK_UniformUniforms.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\KK_UniformUniforms

Source: "Input\_Plugins\KK_AnimationOverdrive\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_ANIMATIONOVERDRIVE
Source: "Input\_Plugins\KK_PoseQuickLoad\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_PoseQuickLoad

Source: "Input\_Plugins\KK_FreeHRandom\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_FreeHRandom
Source: "Input\_Plugins\KK_OrthographicCamera.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\KK_OrthographicCamera
Source: "Input\_Plugins\KK_CrossEye\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_CrossEye
Source: "Input\_Plugins\KK_HLightControl\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_HLightControl
Source: "Input\_Plugins\KK_HCharaAdjustment\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_HCharaAdjustment

Source: "Input\_Plugins\Koikatsu_CharacterReplacer\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\JannieReplacer

;Source: "Input\_Plugins\jim\KK_StudioAllGirlsPlugin_1.3.2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\KK_StudioAllGirlsPlugin
Source: "Input\_Plugins\jim\KK_StudioAutoCloseLoadingSceneWindow_1.0.2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\KK_StudioAutoCloseLoadingSceneWindow
Source: "Input\_Plugins\jim\KK_StudioCharaOnlyLoadBody_1.3.6\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\KK_StudioCharaOnlyLoadBody
Source: "Input\_Plugins\jim\KK_StudioCoordinateLoadOption_3.0.3\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\KK_StudioCoordinateLoadOption
;Source: "Input\_Plugins\jim\KK_StudioSimpleColorOnGirls_1.0.5\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\KK_StudioSimpleColorOnGirls
Source: "Input\_Plugins\jim\KK_StudioTextPlugin_1.1.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\KK_StudioTextPlugin
Source: "Input\_Plugins\jim\KK_StudioCharaLightLinkedToCamera\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\KK_StudioCharaLightLinkedToCamera

Source: "Input\_Plugins\jim\KK_StudioReflectFKFix_1.0.3\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: FIX\KK_StudioReflectFKFix
Source: "Input\_Plugins\jim\KK_StudioSaveWorkspaceOrderFix\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: FIX\KK_StudioSaveWorkspaceOrderFix

Source: "Input\_Plugins\BepInEx.EnableResize\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\EnableResize
Source: "Input\_Plugins\BepInEx.MuteInBackground\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs;  Components: Feature\MuteInBackground

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Plugins\FPSCounter.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: MISC\FPS
Source: "Input\_Plugins\KK_CheatTools\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\Trainer
Source: "Input\_Plugins\RuntimeUnityEditor\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\Trainer

Source: "Input\_Plugins\ScriptLoader\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\ScriptLoader

Source: "Input\_Plugins\UnlockHPositions.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: MISC\UnlockHPositions
Source: "Input\_Misc\Full save\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\FullSave

;Source: "Input\_Misc\KoikatuSaveDataEdit\*"; DestDir: "{app}\_Tools\KoikatuSaveDataEdit"; Flags: ignoreversion recursesubdirs; Components: MISC\SaveEditor
Source: "Input\_Misc\Memes\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\Meme

[InstallDelete]
; Clean up old translations
Type: filesandordirs; Name: "{app}\BepInEx\translation"; Components: AT\TL\EnglishTranslation
Type: filesandordirs; Name: "{app}\BepInEx\plugins\KK_Plugins\KK_TextResourceRedirector.dll"; Components: AT\TL\EnglishTranslation
;Type: files; Name: "{app}\BepInEx\MakerLag.dll"; Components: FIX\FixCompilation
Type: files; Name: "{app}\BepInEx\KKSceneBrowserFolders.dll"; Components: Feature\KK_BrowserFolders
Type: files; Name: "{app}\InitSettingGameStudioVREN.exe"; Components: CustomLauncher
Type: files; Name: "{app}\InitSettingEN.exe"; Components: CustomLauncher
Type: files; Name: "{app}\InitSettingEnglish.exe"; Components: CustomLauncher
Type: files; Name: "{app}\InitSetting EN.exe"; Components: CustomLauncher
Type: files; Name: "{app}\InitSetting English.exe"; Components: CustomLauncher
Type: files; Name: "{app}\InitSetting.exe"
Type: files; Name: "{app}\Initial Settings.exe"
Type: files; Name: "{app}\InitSetting.exe.config"
Type: files; Name: "{app}\Initial Settings.exe.config"
Type: filesandordirs; Name: "{app}\UserData\LauncherEN"

; Need to use the steam DLC instead
Type: filesandordirs; Name: "{app}\KoikatuVR_Data"; Check: PartyInstalled
Type: files; Name: "{app}\KoikatuVR.exe"; Check: PartyInstalled

; Clean up old modpacks
Type: filesandordirs; Name: "{app}\mods\Sideloader Only Mods"
Type: filesandordirs; Name: "{app}\mods\[KK]Sideloader Modpack"
Type: filesandordirs; Name: "{app}\mods\[KK]Sideloader Modpack - Compatibility Pack"
Type: filesandordirs; Name: "{app}\mods\[KK]Sideloader Modpack - Studio"
Type: filesandordirs; Name: "{app}\mods\[KK]Sideloader Modpack - Fixes"
Type: filesandordirs; Name: "{app}\mods\[EC]Sideloader Modpack"
Type: filesandordirs; Name: "{app}\mods\[EC]Sideloader Modpack - Fixes"
Type: filesandordirs; Name: "{app}\mods\[KK]*.7z"
Type: filesandordirs; Name: "{app}\mods\[EC]*.7z"
Type: filesandordirs; Name: "{app}\BepInEx\introclips"
Type: filesandordirs; Name: "{app}\mods\[moderchan]Tongue Texture v1.1.zipmod"
; Completely remove only modpacks that we fully bundle; compatibility pack is safer to be removed since it can have dupes with main modpack
#ifndef WEBINSTALLER
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack"                      ; Components: Content\Modpack
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Compatibility Pack" ; Components: Content\ModpackCompat
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Studio"             ; Components: Content\ModpackStudio
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Fixes"              ; Components: FIX\ModpackFixes
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Maps"               ; Components: Content\ModpackMaps
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - KK_MaterialEditor"  ; Components: Content\KK_MaterialEditor\Modpack
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - KK_UncensorSelector"; Components: UNC\Selector
#endif

; Clean up old patches and packs
Type: files; Name: "{app}\start.bat"
Type: files; Name: "{app}\desktop.ini"
Type: files; Name: "{app}\*.ico"
Type: files; Name: "{app}\[BR]*"

; Always not necessary
Type: files; Name: "{app}\0Harmony.dll"
Type: files; Name: "{app}\BepInEx.dll"
Type: files; Name: "{app}\Mono.Cecil.dll"

; Junk
Type: filesandordirs; Name: "{app}\BepInEx\bepinex4_backup"
Type: filesandordirs; Name: "{app}\BepInEx\cache"
Type: filesandordirs; Name: "{app}\temp"
Type: files; Name: "{app}\README.*"
Type: files; Name: "{app}\*.log"
Type: files; Name: "{app}\*.pdb"
Type: files; Name: "{app}\changelog.txt"
Type: files; Name: "{app}\HF_Patch_log.txt"
Type: files; Name: "{app}\output_log.txt"
Type: files; Name: "{app}\CharaStudio_Data\output_log.txt"
Type: files; Name: "{app}\Koikatu_Data\output_log.txt"
Type: files; Name: "{app}\KoikatuVR_Data\output_log.txt"
Type: files; Name: "{app}\Koikatsu Party_Data\output_log.txt"
; Yikes, someone extracted a sideloader mod...
Type: files; Name: "{app}\manifest.xml"

; Needed to migrate from BepInEx 3.x to 4.x
Type: files; Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx

; Just in case. Also resets any hash caches
Type: filesandordirs; Name: "{app}\[UTILITY] KKManager"; Components: KKManager
Type: filesandordirs; Name: "{app}\temp"

; Potentially incompatible, outdated or buggy plugins
Type: files; Name: "{app}\mods\atari2.1 (normal bust).zipmod"
Type: files; Name: "{app}\BepInEx\IPA\KoikPlugins.dll"
Type: files; Name: "{app}\BepInEx\KK_ForceHighPoly.dll"
Type: files; Name: "{app}\BepInEx\ModBoneImplantor.dll"
Type: files; Name: "{app}\BepInEx\KKSubs.dll"
Type: files; Name: "{app}\BepInEx\HSubs.dll"
Type: files; Name: "{app}\BepInEx\KKUS.dll"; Check: PartyInstalled
Type: files; Name: "{app}\BepInEx\plugins\KKUS.dll"; Check: PartyInstalled
Type: files; Name: "{app}\BepInEx\FixCompilation.dll"
Type: files; Name: "{app}\BepInEx\KK_Ahegao.dll"
Type: files; Name: "{app}\BepInEx\KK_MoveMapFromCharaList.dll"
Type: files; Name: "{app}\BepInEx\ObjectTreeDebugKK.dll"; Components: MISC\Trainer
Type: files; Name: "{app}\BepInEx\MakerAPI.dll"; Components: KKAPI
Type: files; Name: "{app}\BepInEx\KK_AnimationController.dll"; Components: Content\NodesConstraints
Type: files; Name: "{app}\BepInEx\KKABMGUI.dll"; Components: Content\KKABMX
Type: files; Name: "{app}\BepInEx\KKABMPlugin.dll"; Components: Content\KKABMX
Type: files; Name: "{app}\BepInEx\DragAndDrop.dll"; Components: Feature\DragAndDrop
Type: files; Name: "{app}\BepInEx\IllusionDragAndDrop.Koikatu.dll"; Components: Feature\DragAndDrop
Type: files; Name: "{app}\BepInEx\KK_StudioCoordinateLoadOption.dll"; Components: Feature\KK_ClothesLoadOption
Type: files; Name: "{app}\BepInEx\KK_RandomCharacterGenerator.dll"; Components: Feature\KK_RandomCharacterGenerator
Type: files; Name: "{app}\BepInEx\KoiSkinOverlay.dll"; Components: Content\KSOX
Type: files; Name: "{app}\BepInEx\KoiClothesOverlay.dll"; Components: Content\KSOX
Type: files; Name: "{app}\BepInEx\RuntimeUnityEditor.dll"; Components: MISC\Trainer
Type: files; Name: "{app}\BepInEx\HideStudioUI.dll"
Type: files; Name: "{app}\BepInEx\HideHInterface.dll"

Type: files; Name: "{app}\XInputInterface.dll"

Type: files; Name: "{app}\BepInEx\FixCompilation.dll"                    ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\FixShaderDropdown.dll"                 ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_CutsceneLockupFix.dll"              ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_Fix_HeadFix.dll"                    ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_Fix_ListFix.dll"                    ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_Fix_MainGameOptimization.dll"       ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_Fix_MakerOptimization.dll"          ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_Fix_ResourceUnloadOptimization.dll" ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_Fix_SettingsFix.dll"                ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_HeadFix.dll"                        ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_MiscFixes.dll"                      ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_PersonalityCorrector.dll"           ; Components: FIX\KoikatuFixes
Type: files; Name: "{app}\BepInEx\KK_SettingsFix.dll"                    ; Components: FIX\KoikatuFixes

; Clean up old uncensors
Type: filesandordirs; Name: "{app}\mods\Uncensor"; Components: UNC\Selector
Type: filesandordirs; Name: "{app}\mods\Uncensors and body mods"; Components: UNC\Selector
Type: files; Name: "{app}\BepInEx\Demosaic.dll"; Components: UNC\Selector
Type: files; Name: "{app}\BepInEx\CartoonUncensor.dll"; Components: UNC\Selector
Type: files; Name: "{app}\BepInEx\AlexaeBubbleGum.dll"; Components: UNC\Selector

; Clean dlls completely to fix problems with copied/unnecessary/old dlls. All dlls are included in the patch data
Type: filesandordirs; Name: "{app}\CharaStudio_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\CharaStudio_Data\Mono"; Components: Patch
Type: filesandordirs; Name: "{app}\Koikatu_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\Koikatu_Data\Mono"; Components: Patch
;Type: filesandordirs; Name: "{app}\KoikatuVR_Data\Managed"; Components: Patch 
;Type: filesandordirs; Name: "{app}\KoikatuVR_Data\Mono"; Components: Patch
Type: filesandordirs; Name: "{app}\Koikatsu Party_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\Koikatsu Party_Data\Mono"; Components: Patch

; IPA, useless because patched assemblies are replaced
Type: files; Name: "{app}\IPA.exe"; Components: Patch

[Registry]
Root: HKCU; Subkey: "Software\Illusion"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"; ValueType: string; ValueName: "INSTALLDIR"; ValueData: "{app}\"; Components: MISC\FIX

[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Flags: unchecked
;Name: editordesktopicon; Description: "Create a save editor desktop icon"; Components: MISC\SaveEditor; Flags: unchecked
Name: partyfont; Description: "Use alternative font in Koikatsu Party (hand-written style, same as in the Japanese version)";
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked
Name: delete\Listfiles; Description: "{cm:TaskDeleteLst}"
Name: fixSideloaderDupes; Description: "{cm:TaskSideDupes}";
Name: PW; Description: "{cm:TaskPW}";
; IPA is always removed, can't go around that. Unchecking is disabled in code, this task has to stay at the same index for it to work
Name: IPA; Description: "{cm:TaskIPA}";

[Icons]
Name: "{userdesktop}\{cm:IconGame}"; Filename: "{app}\InitSetting.exe"; IconFilename: "{app}\InitSetting.exe"; WorkingDir: "{app}"; Comment: "{cm:IconGame}"; Flags: createonlyiffileexists
Name: "{userdesktop}\Koikatsu Party"; Filename: "{app}\Initial Settings.exe"; IconFilename: "{app}\Initial Settings.exe"; WorkingDir: "{app}"; Comment: "Koikatsu Party launcher"; Flags: createonlyiffileexists

[Run]
Filename: "{tmp}\hfp\DirectXRedist2010\DXSETUP.exe"; Parameters: "/silent"; Description: "Installing DirectX redistributables"; Flags: skipifdoesntexist runascurrentuser

Filename: "{tmp}\hfp\start.bat"; Parameters: """{app}"""; Description: "{cm:RunGame}"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist

Filename: "https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu/Technical_Help"; Description: "{cm:RunWiki}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
Filename: "https://discord.gg/Szumqcu"; Description: "{cm:RunDiscord}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

Filename: "{app}\[UTILITY] KKManager\StandaloneUpdater.exe"; Parameters: """{app}"""; Description: "{cm:StartUpdate}"; Flags: postinstall runascurrentuser unchecked nowait skipifsilent skipifdoesntexist

Filename: "https://www.patreon.com/ManlyMarco"; Description: "ManlyMarco Patreon (Creator of this patch)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;


[Code]
procedure CreateBackup(path: String);
external 'CreateBackup@files:HelperLib.dll stdcall';

procedure FixConfig(path: String);
external 'FixConfig@files:HelperLib.dll stdcall';

procedure PostInstallCleanUp(path: String);
external 'PostInstallCleanUp@files:HelperLib.dll stdcall';

procedure WriteVersionFile(path, version: String);
external 'WriteVersionFile@files:HelperLib.dll stdcall';

procedure SetConfigDefaults(path: String);
external 'SetConfigDefaults@files:HelperLib.dll stdcall';

procedure FixPermissions(path: String);
external 'FixPermissions@files:HelperLib.dll stdcall';

procedure RemoveJapaneseCards(path: String);
external 'RemoveJapaneseCards@files:HelperLib.dll stdcall';

procedure RemoveNonstandardListfiles(path: String);
external 'RemoveNonstandardListfiles@files:HelperLib.dll stdcall';

procedure RemoveSideloaderDuplicates(path: String);
external 'RemoveSideloaderDuplicates@files:HelperLib.dll stdcall';

procedure RemoveModsExceptModpacks(path: String);
external 'RemoveModsExceptModpacks@files:HelperLib.dll stdcall';

procedure StartAutoUpdate(path, installer: String; sm, smcp, smf, smme, smus, smmap, smstu: Boolean);
external 'StartAutoUpdate@files:HelperLib.dll stdcall';

//function VRInstalled(): Boolean;
//begin
//  Result := FileExists(ExpandConstant('{app}\KoikatuVR_Data\resources.assets'));
//end;

function SummerExpInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\etcetra\list\config\17.unity3d'));
end;

function AfterSchoolInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\etcetra\list\config\20.unity3d'));
end;

function YoyakuInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\etcetra\list\config\50.unity3d'));
end;

function DarknessInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\adv\scenario\c21\darkness.unity3d'));
end;

function KoikatuInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\Koikatu_Data\resources.assets'));
end;

function PartyInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\Koikatsu Party_Data\resources.assets'));
end;

function DirectXRedistNeedsInstall(): Boolean;
begin
  Result := not RegKeyExists(HKLM, 'SOFTWARE\WOW6432Node\Valve\Steam\Apps\CommonRedist\DirectX\Jun2010')
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectTasks then
  begin
    // Disable IPA task to keep it checked. Task count can change and it's always the last one so use the Count
    WizardForm.TasksList.ItemEnabled[WizardForm.TasksList.Items.Count - 1] := False;

    // If garbage plugins are detected, delete all old mods by default
    if(FileExists(ExpandConstant('{app}\BepInEx\CardCacher.dll')) or FileExists(ExpandConstant('{app}\BepInEx\0Harmony.dll')) or FileExists(ExpandConstant('{app}\BepInEx\TexResPatch.dll')) or FileExists(ExpandConstant('{app}\BepInEx\KK_GUIDMigration.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Sideloader.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Assembly-CSharp.dll'))) then
    begin
      SuppressibleMsgBox(ExpandConstant('{cm:MsgInvalidModsDetected}'), mbError, MB_OK, 0);
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 8, coCheckWithChildren);
    end;

    if (FileExists(ExpandConstant('{app}\BepInEx\IPA\KoikPlugins.dll'))) then
      SuppressibleMsgBox(ExpandConstant('{cm:MsgKplugDetected}'), mbError, MB_OK, 0);

    if (FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifier.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifierStudio.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifierStudioNEO.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\HSStudioNEOExtSave.dll')) or FileExists(ExpandConstant('{app}\BepInEx\FlashBangZ.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\KK_gaugeslider.dll'))) then
    begin
      SuppressibleMsgBox(ExpandConstant('{cm:MsgIncompatibleModsDetected}'), mbError, MB_OK, 0);
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 8, coCheckWithChildren);
    end;
    
    if (PartyInstalled() and IsComponentSelected('Patch\VR')) then
    begin
      SuppressibleMsgBox('To install the VR module for Koikatsu Party you have to go to your Steam Library, open properties of Koikatsu Party, go to the DLC tab and enable the VR DLC there. It''s recommended to do this before installing HF Patch.', mbInformation, MB_OK, 0);
    end;
    
    WizardForm.TasksList.Checked[WizardForm.TasksList.Items.Count - 9] := PartyInstalled();
    WizardForm.TasksList.ItemEnabled[WizardForm.TasksList.Items.Count - 9] := PartyInstalled();
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  // After install completes
  if CurStep = ssPostInstall then
  begin
    
#ifdef WEBINSTALLER
    // Run automatic update before further options
    StartAutoUpdate(ExpandConstant('{app}'), ExpandConstant('{src}'), IsComponentSelected('Content\Modpack'), IsComponentSelected('Content\ModpackCompat'), IsComponentSelected('FIX\ModpackFixes'), IsComponentSelected('Content\KK_MaterialEditor\Modpack'), IsComponentSelected('UNC\Selector\Pack'), IsComponentSelected('Content\ModpackMaps'), IsComponentSelected('Content\ModpackStudio'));
#endif
    
    // Removing this causes game to fall back to original font
    if IsTaskSelected('partyfont') then begin
      try
        DeleteFile(ExpandConstant('{app}\abdata\localize\translate\1\font.unit-y3d'));
        //DeleteFile(ExpandConstant('{app}\abdata\localize\translate\2\font.unit-y3d'));
        //DeleteFile(ExpandConstant('{app}\abdata\localize\translate\3\font.unit-y3d'));
        RenameFile(ExpandConstant('{app}\abdata\localize\translate\1\font.unity3d'), ExpandConstant('{app}\abdata\localize\translate\1\font.unit-y3d'))
        //RenameFile(ExpandConstant('{app}\abdata\localize\translate\2\font.unity3d'), ExpandConstant('{app}\abdata\localize\translate\2\font.unit-y3d'))
        //RenameFile(ExpandConstant('{app}\abdata\localize\translate\3\font.unity3d'), ExpandConstant('{app}\abdata\localize\translate\3\font.unit-y3d'))
      except
        ShowExceptionMessage();
      end;
    end;
    
    // Delete Japanese versions of cards and bgs if English versions are installed (only those with different names)
    if IsComponentSelected('AT\TL\EnglishTranslation\UserData') then
        RemoveJapaneseCards(ExpandConstant('{app}'));
        
    // Always clean up sideloader mods in case user already messed up
    if IsTaskSelected('fixSideloaderDupes') then
        RemoveSideloaderDuplicates(ExpandConstant('{app}'));
        
    FixConfig(ExpandConstant('{app}'));
    WriteVersionFile(ExpandConstant('{app}'), '{#VERSION}');
    
    // Prevent trying to install the redist again
    Exec('reg', 'add HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\Apps\CommonRedist\DirectX\Jun2010 /v dxsetup /t REG_DWORD /d 1 /f /reg:32', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    
    PostInstallCleanUp(ExpandConstant('{app}'));
  end;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
begin
  // allow the setup turning to the next page
  Result := True;

  if (CurPageID = wpSelectDir) then
  begin
    if (not KoikatuInstalled() and not PartyInstalled()) then
    begin
      if (SuppressibleMsgBox(ExpandConstant('{cm:MsgExeNotFound}'), mbError, MB_YESNO, 0) = IDNO) then
        Result := False;
    end;
    
    // If both KK and KKP files are present, remove the KK files
    if (KoikatuInstalled() and PartyInstalled()) then
    begin
      if (MsgBox(ExpandConstant('{cm:MsgKKandKKPdetected}'), mbConfirmation, MB_YESNO) = IDYES) then
      begin
        DeleteFile(ExpandConstant('{app}\Koikatu.exe'));
        DelTree(ExpandConstant('{app}\Koikatu_Data'), True, True, True);
        DeleteFile(ExpandConstant('{app}\KoikatuVR.exe'));
        DelTree(ExpandConstant('{app}\KoikatuVR_Data'), True, True, True);
      end;
    end;

    if Result = True then
    begin
      if (FileExists(ExpandConstant('{app}\EmotionCreators.exe'))) then
      begin
        MsgBox(ExpandConstant('{cm:MsgEmotionCreatorsDetected}'), mbError, MB_OK);
        Result := False;
      end
    end;

    if Result = True then
    begin
      if (FileExists(ExpandConstant('{app}\AI-Shoujo.exe')) or FileExists(ExpandConstant('{app}\AI-Syoujyo.exe'))) then
      begin
        MsgBox(ExpandConstant(ExpandConstant('{cm:MsgAISFilesDetected}')), mbError, MB_OK);
        Result := False;
      end
    end;
    
    if Result = True then
    begin
      if (Length(ExpandConstant('{app}')) > 100) then
      begin
        MsgBox(ExpandConstant('{cm:MsgDeepPath}'), mbError, MB_OK);
        Result := False;
      end
    end;
    
    if Result = True then
    begin
      // Check for file corruptions
      if (not FileExists(ExpandConstant('{app}\abdata\sound\setting\object\00.unity3d')) or not FileExists(ExpandConstant('{app}\abdata\sound\setting\sound3dsettingdata\00.unity3d')) or not FileExists(ExpandConstant('{app}\abdata\sound\setting\soundsettingdata\00.unity3d'))) then
      begin
        MsgBox(ExpandConstant('{cm:MsgMissingGameFiles}'), mbError, MB_OK);
        Result := False;
      end
      else
      begin
        // Check for missing paid DLC
        if not SummerExpInstalled() then
        begin
          SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC1}'), mbInformation, MB_OK, 0);
        end;
        if not AfterSchoolInstalled() then
        begin
          SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC2}'), mbInformation, MB_OK, 0);
        end;
        if not YoyakuInstalled() and not PartyInstalled() then
        begin
          SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC3}'), mbInformation, MB_OK, 0);
        end;
        if not DarknessInstalled() and not PartyInstalled() then
        begin
          SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC4}'), mbInformation, MB_OK, 0);
        end;
      end;

      // Check for extracted zipmods
      if FileExists(ExpandConstant('{app}\manifest.xml')) then
      begin
        SuppressibleMsgBox(ExpandConstant('{cm:MsgExtractedZipmod}'), mbError, MB_OK, 0);
      end;
    end;
  end;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  ResultCode: Integer;
begin
  NeedsRestart := false;
  try
    // Close the game if it's running
    Exec('taskkill', '/F /IM CharaStudio.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM Koikatu.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM Koikatsu Party.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM KoikatuVR.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM Koikatsu Party VR.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM InitSetting.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM InitSettingEN.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM InitSettingGameStudioVREN.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM Initial Settings.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM BepInEx.Patcher.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM KKManager.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM StandaloneUpdater.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    
    // Often needed after fixing permissions to unlock the files so the permissions can be written, without this access to them is always denied
    //Exec('taskkill', '/F /IM explorer.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);

    // Fix file permissions
    //Exec('takeown', ExpandConstant('/f "{app}" /r /SKIPSL /d y'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    //Exec('icacls', ExpandConstant('"{app}" /grant everyone:F /t /c /l'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    FixPermissions(ExpandConstant('{app}'));
    
    //try
    //  ExecAsOriginalUser('explorer.exe', '', '', 0, ewNoWait, ResultCode);
    //except
    //  ShowExceptionMessage();
    //end;
  except
    ShowExceptionMessage();
  end;
  
  CreateBackup(ExpandConstant('{app}'));
  
  // Backup plugin settings
  if (not IsTaskSelected('delete\Config')) then
    FileCopy(ExpandConstant('{app}\BepInEx\config.ini'), ExpandConstant('{app}\config.ini'), false);
  
  // Remove BepInEx folder
  if (IsTaskSelected('delete\Config') and IsTaskSelected('delete\Plugins')) then begin
    DelTree(ExpandConstant('{app}\BepInEx'), True, True, True);
  end
  else
  begin
    // Or only remove plugins
    if (IsTaskSelected('delete\Plugins')) then begin
      DelTree(ExpandConstant('{app}\BepInEx\plugins'), True, True, True);
      DelTree(ExpandConstant('{app}\BepInEx\patchers'), True, True, True);
      DelTree(ExpandConstant('{app}\BepInEx\IPA'), True, True, True);
      DelTree(ExpandConstant('{app}\scripts'), True, True, True);
      Exec(ExpandConstant('{cmd}'), '/c del *.dll', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
      Exec(ExpandConstant('{cmd}'), '/c del *.dl_', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
    end;
  end;
  
  if (not IsTaskSelected('delete\Config')) then
  begin
    // Restore the settings and remove the backup
    CreateDir(ExpandConstant('{app}\BepInEx'));
    FileCopy(ExpandConstant('{app}\config.ini'), ExpandConstant('{app}\BepInEx\config.ini'), false);
    DeleteFile(ExpandConstant('{app}\config.ini'));
  end
  else
  begin
    // Or remove settings
    DeleteFile(ExpandConstant('{app}\BepInEx\config.ini'));
  end;
    
  if (IsTaskSelected('delete\Sidemods')) then
    RemoveModsExceptModpacks(ExpandConstant('{app}'));
    
  if (IsTaskSelected('delete\Listfiles')) then
    RemoveNonstandardListfiles(ExpandConstant('{app}'));
    
  if (IsTaskSelected('PW')) then
  begin
    DelTree(ExpandConstant('{app}\Plugins'), True, True, True);
    DelTree(ExpandConstant('{app}\patchwork'), True, True, True);
    Exec(ExpandConstant('{cmd}'), '/c del patchwork_*', ExpandConstant('{app}'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
  end;
  
  SetConfigDefaults(ExpandConstant('{app}'));
end;

// SFW page
var
  PageSFWmode: TWizardPage;
  DescLabelFull: TLabel;
  DescLabelSafe: TLabel;
  ModeRadioButtonFull: TNewRadioButton;  
  ModeRadioButtonSafe: TNewRadioButton;  
procedure InitializeWizard;     
begin
  PageSFWmode := CreateCustomPage(wpSelectTasks, ExpandConstant('{cm:SfwTitle}'), ExpandConstant('{cm:SfwTitleDescription}'));
  ModeRadioButtonFull := TNewRadioButton.Create(WizardForm);
  ModeRadioButtonFull.Parent := PageSFWmode.Surface;
  ModeRadioButtonFull.Checked := True;
  ModeRadioButtonFull.Top := 16;
  ModeRadioButtonFull.Width := PageSFWmode.SurfaceWidth;
  ModeRadioButtonFull.Font.Style := [fsBold];
  ModeRadioButtonFull.Font.Size := 9;
  ModeRadioButtonFull.Caption := ExpandConstant('{cm:SfwOptNsfw}');
  DescLabelFull := TLabel.Create(WizardForm);
  DescLabelFull.Parent := PageSFWmode.Surface;
  DescLabelFull.Left := 8;
  DescLabelFull.Top := ModeRadioButtonFull.Top + ModeRadioButtonFull.Height + 8;
  DescLabelFull.Width := PageSFWmode.SurfaceWidth - 10; 
  DescLabelFull.Height := 60;
  DescLabelFull.AutoSize := False;
  DescLabelFull.Wordwrap := True;
  DescLabelFull.Caption := ExpandConstant('{cm:SfwOptNsfwDescription}');
  ModeRadioButtonSafe := TNewRadioButton.Create(WizardForm);
  ModeRadioButtonSafe.Parent := PageSFWmode.Surface;
  ModeRadioButtonSafe.Top := DescLabelFull.Top + DescLabelFull.Height + 16;
  ModeRadioButtonSafe.Width := PageSFWmode.SurfaceWidth;
  ModeRadioButtonSafe.Font.Style := [fsBold];
  ModeRadioButtonSafe.Font.Size := 9;
  ModeRadioButtonSafe.Caption := ExpandConstant('{cm:SfwOptSfw}');
  DescLabelSafe := TLabel.Create(WizardForm);
  DescLabelSafe.Parent := PageSFWmode.Surface;
  DescLabelSafe.Left := 8;
  DescLabelSafe.Top := ModeRadioButtonSafe.Top + ModeRadioButtonSafe.Height + 8;
  DescLabelSafe.Width := PageSFWmode.SurfaceWidth - 10;
  DescLabelSafe.Height := 60;
  DescLabelSafe.AutoSize := False;
  DescLabelSafe.Wordwrap := True;
  DescLabelSafe.Caption := ExpandConstant('{cm:SfwOptSfwDescription}') ;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := False;
  if PageID = PageSFWmode.ID then
    Result := not IsComponentSelected('Feature\KK_SFW');
end;

function SFWmode(): Boolean;
begin
  Result := ModeRadioButtonSafe.Checked;
end;
function NSFWmode(): Boolean;
begin
  Result := ModeRadioButtonFull.Checked;
end;