; Copyright (C) 2020  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

;-------------Full game name for naming patch itself and desktop icons
#define NAME "Koikatsu"
;---------------------------------------------Current HF Patch version
#define VERSION "3.38"
;-----------------------------------------Sideloader modpack directory
;#define GameDir "L:\HFpatchmaking\KK\MODSOURCE"
#define GameDir "F:\Games\KoikatsuP"
;--Don't include any files in the build to make it go fast for testing
;#define DEBUG
;---Skip file verification for easier testing, COMMENT OUT FOR RELEASE
;#define NOVERIFY
;------------Don't include general, studio and map sideloader modpacks
#define LITE
;--------------------------------------------------------Configuration
; The main executable name without the .exe
#define GameName "Koikatu"
; Set to empty if the game has no steam version
#define GameNameSteam "Koikatsu Party"
; Set CompanyName to empty if the game has no registry keys
#define CompanyName "Illusion"
;---------------------------------------------------------------------
#include "HelperLib\Common.iss"
;---------------------------------------------------------------------
; Used for post install run links, comment out to hide
#define WikiLink "https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu/Technical_Help"
#define RepoLink "https://github.com/ManlyMarco/KK-HF_Patch"
; Can be KoiDiscordLink, IsDiscordLink, or a normal link
#define DiscordLink KoiDiscordLink
;---------------------------------------------------------------------

[Setup]
#ifndef LITE
AppName=HF Patch for Koikatu! and Koikatsu Party
OutputBaseFilename=Koikatsu HF Patch v{#VERSION}
#else
AppName=HF Patch for Koikatu! and Koikatsu Party (Light Version)
OutputBaseFilename=Koikatsu HF Patch v{#VERSION} Light Version
#endif

;lzma2/ultra64 | zip | lzma2/fast
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
;Usual settings: 208576 273 8
LZMADictionarySize=208576
LZMANumFastBytes=273
LZMANumBlockThreads=8
DiskSpanning=yes
DiskSliceSize=4294967295

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "sc"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"


[Types]
Name: "full_en";  Description: "{cm:fullInstall}";  Languages: en sc;
Name: "full";     Description: "{cm:fullInstall}";  Languages: jp;
Name: "extra_en"; Description: "{cm:extraInstall}"; Languages: en sc;
Name: "extra";    Description: "{cm:extraInstall}"; Languages: jp;
Name: "bare";     Description: "{cm:bareInstall}"
Name: "none";     Description: "{cm:noneInstall}"
Name: "custom";   Description: "{cm:customInstall}"; Flags: iscustom

[Components]
Name: "Patch";                    Description: "All free updates + game repair"; Types: full_en full extra_en extra custom bare none; Flags: fixed
Name: "Patch\VR";                 Description: "Install/Update VR Module"; Types: full_en full extra_en extra custom
Name: "Patch\UserData";           Description: "{cm:CompDefCards}"
Name: "Server";                   Description: "Use worldwide server in the in-game card browser instead of Japanese-only"; Types: full_en extra_en
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Modpack";                  Description: "Sideloader Modpacks {#CurrentDate} (Add additional content to the game, needs at least BepisPlugins to work)"
#ifndef LITE
Name: "Modpack\General";          Description: "General (Content for making characters, always recommended)";       Types: full_en full extra_en extra
Name: "Modpack\Studio";           Description: "Studio (Additional content for making Studio scenes)";              Types: full_en full extra_en extra
Name: "Modpack\Maps";             Description: "Maps (Additional maps for use in Studio and H scenes)";             Types: full_en full extra_en extra
Name: "Modpack\Animations";       Description: "Animations (Additional adnimations for use in Studio and Free H)";  Types: full_en full extra_en extra
#endif
Name: "Modpack\Fixes";            Description: "Fixes (Fixes to some of the official content, always recommended)"; Types: full_en full extra_en extra
Name: "Modpack\MaterialEditor";   Description: "KK_MaterialEditor (Materials for use with MaterialEditor)";         Types: full_en full extra_en extra
Name: "Modpack\UncensorSelector"; Description: "KK_UncensorSelector (Uncensors for use with UncensorSelector)";     Types: full_en full extra_en extra
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Experimental"; Description: "Experimental performance optimizations (Reduces stutter, allows loading KKS scenes. Disable in case of plugin compatibility issues)"; 

[Files]
Source: "Input\start.bat"; DestDir: "{tmp}\hfp"; Flags: ignoreversion recursesubdirs createallsubdirs
#ifndef DEBUG
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\empty_ud\*";                                              DestDir: "{app}";                       Flags: ignoreversion recursesubdirs createallsubdirs solidbreak;Components: Patch
Source: "Input\_Patch\empty_ud_eng\*";                                          DestDir: "{app}";                       Flags: ignoreversion recursesubdirs createallsubdirs;           Components: Patch; Languages: en
Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks_ud\*";                        DestDir: "{app}\";                      Flags: ignoreversion recursesubdirs createallsubdirs;           Components: Patch\UserData; Check: KoikatuInstalled
Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks_ud\UserData\Studio\scene\*";  DestDir: "{app}\UserData\Studio\scene"; Flags: ignoreversion recursesubdirs createallsubdirs;           Components: Patch\UserData; Check: IsSteam
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\small_common\*";                                  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\small_kk\*";                                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: KoikatuInstalled
Source: "Input\_Patch\small_kkp\*";                                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: IsSteam
Source: "Input\_Patch\small_dark\*";                                    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: DarknessInstalled and not IsSteam
Source: "Input\_Patch\Remote\Patches\extras\*";                         DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks\*";    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks_kk\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: KoikatuInstalled
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks_as\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: AfterSchoolInstalled
Source: "Input\_Patch\Remote\Patches\koikatu_03vr_d0531hg\*";           DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch\VR; Check: not IsSteam
Source: "Input\_Patch\Remote\Patches\dkn_diff\*";                       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: DarknessInstalled and not IsSteam
Source: "Input\_Patch\Remote\Patches\party_diff\*";                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: IsSteam
Source: "Input\_Patch\Remote\Patches\koikatsuparty_sp_20210522\*";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: IsSteam
; Add missing studio lists
Source: "Input\_Patch\Remote\Patches\partydlc_diff\*";                  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: IsSteam and SummerExpInstalled and AfterSchoolInstalled
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\VR_JP\*";                                         DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch\VR; Check: not IsSteam
Source: "Input\_Patch\VR_EN\*";                                         DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch\VR; Check: VRInstalled and IsSteam
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\experimental\*";                                  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Experimental; Check: DarknessInstalled
Source: "Input\_Patch\experimental_jp\*";                               DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Experimental; Check: not IsSteam and DarknessInstalled
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Solidbreak at the start to split off the modpacks from other files in case they don't have to be installed. solidbreak splits before the files entry with it is processed
#ifndef LITE
Source: "{#GameDir}\mods\Sideloader Modpack\*";                      DestDir: "{app}\mods\Sideloader Modpack";                       Flags: ignoreversion recursesubdirs solidbreak; Components: Modpack\General
Source: "{#GameDir}\mods\Sideloader Modpack - Exclusive KK\*";       DestDir: "{app}\mods\Sideloader Modpack - Exclusive KK";        Flags: ignoreversion recursesubdirs; Components: Modpack\General
Source: "{#GameDir}\mods\Sideloader Modpack - Exclusive KK KKS\*";   DestDir: "{app}\mods\Sideloader Modpack - Exclusive KK KKS";    Flags: ignoreversion recursesubdirs; Components: Modpack\General
Source: "{#GameDir}\mods\Sideloader Modpack - Studio\*";             DestDir: "{app}\mods\Sideloader Modpack - Studio";              Flags: ignoreversion recursesubdirs; Components: Modpack\Studio
Source: "{#GameDir}\mods\Sideloader Modpack - Maps\*";               DestDir: "{app}\mods\Sideloader Modpack - Maps";                Flags: ignoreversion recursesubdirs; Components: Modpack\Maps
Source: "{#GameDir}\mods\Sideloader Modpack - Animations\*";         DestDir: "{app}\mods\Sideloader Modpack - Animations";          Flags: ignoreversion recursesubdirs; Components: Modpack\Animations
#endif
Source: "{#GameDir}\mods\Sideloader Modpack - Fixes\*";              DestDir: "{app}\mods\Sideloader Modpack - Fixes";               Flags: ignoreversion recursesubdirs; Components: Modpack\Fixes
Source: "{#GameDir}\mods\Sideloader Modpack - KK_MaterialEditor\*";  DestDir: "{app}\mods\Sideloader Modpack - KK_MaterialEditor";   Flags: ignoreversion recursesubdirs; Components: Modpack\MaterialEditor
Source: "{#GameDir}\mods\Sideloader Modpack - KK_UncensorSelector\*";DestDir: "{app}\mods\Sideloader Modpack - KK_UncensorSelector"; Flags: ignoreversion recursesubdirs; Components: Modpack\UncensorSelector
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "{#GameDir}\BepInEx\cache\sideloader_zipmod_cache.bin*"; DestDir: "{app}\BepinEx\cache"; Flags: ignoreversion recursesubdirs createallsubdirs;           
; Make sure this is never missing in case the plugin archive doesn't have it included. Also solidbreak to split off the modpacks
Source: "Input\_Plugins\KK_UncensorSelector Base.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion solidbreak; Components: UNC\Selector
#endif

; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; This include should be here because the patch files above can be overwritten by this include, and the Files section below overwrites some config files that this include extracts
#include "components.iss"

#include "KK_SFW.iss"
#include "HelperLib\DirectXredist.iss"

[Files]
#ifndef DEBUG
Source: "Input\BepInEx_config\*";                   DestDir: "{app}";                        Components: BepInEx;     Flags: ignoreversion recursesubdirs createallsubdirs solidbreak; 
Source: "Input\BepInEx_Dev\common\*";               DestDir: "{app}";                        Components: BepInEx\Dev; Flags: ignoreversion recursesubdirs;
Source: "Input\BepInEx_Dev\Koikatu_Data\*";         DestDir: "{app}\Koikatu_Data";           Components: BepInEx\Dev; Flags: ignoreversion recursesubdirs; Check: KoikatuInstalled
Source: "Input\BepInEx_Dev\KoikatuVR_Data\*";       DestDir: "{app}\KoikatuVR_Data";         Components: BepInEx\Dev; Flags: ignoreversion recursesubdirs; Check: VRInstalled and not IsSteam
Source: "Input\BepInEx_Dev\KoikatuVR_Data\*";       DestDir: "{app}\Koikatsu Party VR_Data"; Components: BepInEx\Dev; Flags: ignoreversion recursesubdirs; Check: VRInstalled and IsSteam
Source: "Input\BepInEx_Dev\Koikatsu Party_Data\*";  DestDir: "{app}\Koikatsu Party_Data";    Components: BepInEx\Dev; Flags: ignoreversion recursesubdirs; Check: IsSteam
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_TL\Translation_EN_base\*";          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation
Source: "Input\_TL\Translation_EN_jpver\*";         DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation; Check: not IsSteam
Source: "Input\_TL\Translation_EN_jpexpansion\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation; Check: not IsSteam or not KKPAPInstalled
;Source: "Input\_TL\Translation_EN_userdata_base\*";DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation\UserData
Source: "Input\_TL\Translation_EN_userdata_jpver\*";DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation\UserData; Check: not IsSteam
Source: "Input\_TL\_lang jp\*";                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: jp
Source: "Input\_TL\_lang ch\*";                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: sc
Source: "Input\_TL\_lang eng\*";                    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: en
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\Launcher_branding\*";                DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: IllusionLaunchers
Source: "Input\Server\*";                           DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Server
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; If BP isn't installed, exclude BP uncensors from the random selection
Source: "Input\US_config_noBP.cfg";                 DestDir: "{app}\BepInEx\config"; DestName: "com.deathweasel.bepinex.uncensorselector.cfg"
; This config only allows BP uncensors to be chosen by random
Source: "Input\US_config_BP.cfg";                   DestDir: "{app}\BepInEx\config"; DestName: "com.deathweasel.bepinex.uncensorselector.cfg"; Components: UNC\Selector\KK_BetterPenetration
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Only copy our blacklist if the user doesn't already have one (onlyifdoesntexist)
Source: "Input\itemblacklist.xml";                  DestDir: "{app}\UserData\save"; Flags: onlyifdoesntexist
; Other default config
Source: "Input\marco.kkapi.cfg";                    DestDir: "{app}\BepInEx\config"; DestName: "marco.kkapi.cfg";        Flags: onlyifdoesntexist
Source: "Input\MK.KK_BetterSquirt.cfg";             DestDir: "{app}\BepInEx\config"; DestName: "MK.KK_BetterSquirt.cfg";                      Components: Feature\KK_BetterSquirt
Source: "Input\AniMorph.ABMX.cfg";                  DestDir: "{app}\BepInEx\config"; DestName: "AniMorph.ABMX.cfg";      Flags: solidbreak;   Components: Content\AnisotropicMorph
#endif

[InstallDelete]
; Need to use the steam VR DLC instead
Type: filesandordirs; Name: "{app}\KoikatuVR_Data"; Check: IsSteam
Type: files;          Name: "{app}\KoikatuVR.exe";  Check: IsSteam

; Clean dlls completely to fix problems with copied/unnecessary/old dlls. All dlls are included in the patch data
Type: filesandordirs; Name: "{app}\CharaStudio_Data\Managed";   Components: Patch
Type: filesandordirs; Name: "{app}\CharaStudio_Data\Mono";      Components: Patch
Type: filesandordirs; Name: "{app}\Koikatu_Data\Managed";       Components: Patch
Type: filesandordirs; Name: "{app}\Koikatu_Data\Mono";          Components: Patch
Type: filesandordirs; Name: "{app}\Koikatsu Party_Data\Managed";Components: Patch
Type: filesandordirs; Name: "{app}\Koikatsu Party_Data\Mono";   Components: Patch
Type: filesandordirs; Name: "{app}\KoikatuVR_Data\Managed";     Components: Patch
Type: filesandordirs; Name: "{app}\KoikatuVR_Data\Mono";        Components: Patch

; Remove stock launchers to make sure only one exists, a fresh copy will be copied back during install
Type: files; Name: "{app}\InitSetting.exe";                     Components: Patch
Type: files; Name: "{app}\InitSetting.exe.config";              Components: Patch
Type: files; Name: "{app}\Initial Settings.exe";                Components: Patch
Type: files; Name: "{app}\Initial Settings.exe.config";         Components: Patch

; Clean up old custom launchers
Type: files; Name: "{app}\InitSettingGameStudioVREN.exe";   Components: IllusionLaunchers
Type: files; Name: "{app}\InitSettingEN.exe";               Components: IllusionLaunchers
Type: files; Name: "{app}\InitSettingEnglish.exe";          Components: IllusionLaunchers
Type: files; Name: "{app}\InitSetting EN.exe";              Components: IllusionLaunchers
Type: files; Name: "{app}\InitSetting English.exe";         Components: IllusionLaunchers
Type: filesandordirs; Name: "{app}\UserData\LauncherEN";    Components: IllusionLaunchers
; Used by stock launcher in steam release, remove to declutter if using custom launcher
Type: filesandordirs; Name: "{app}\ja-JP";                  Components: IllusionLaunchers
Type: filesandordirs; Name: "{app}\zh-CN";                  Components: IllusionLaunchers
Type: filesandordirs; Name: "{app}\zh-TW";                  Components: IllusionLaunchers

; Clean up old uncensors
Type: filesandordirs; Name: "{app}\mods\Uncensor";                  Components: UNC\Selector
Type: filesandordirs; Name: "{app}\mods\Uncensors and body mods";   Components: UNC\Selector
Type: files;          Name: "{app}\BepInEx\Demosaic.dll";           Components: UNC\Selector
Type: files;          Name: "{app}\BepInEx\CartoonUncensor.dll";    Components: UNC\Selector
Type: files;          Name: "{app}\BepInEx\AlexaeBubbleGum.dll";    Components: UNC\Selector

; Clean up old translations
Type: filesandordirs; Name: "{app}\BepInEx\translation";                                        Components: AT\TL\EnglishTranslation
Type: filesandordirs; Name: "{app}\BepInEx\plugins\KK_Plugins\KK_TextResourceRedirector.dll";   Components: AT\TL\EnglishTranslation

; Just in case. Also resets any hash caches
Type: filesandordirs; Name: "{app}\[UTILITY] KKManager"; Components: KKManager

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
; Completely remove modpacks that we fully bundle
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Fixes"              ; Components: Modpack\Fixes
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - KK_MaterialEditor"  ; Components: Modpack\MaterialEditor
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - KK_UncensorSelector"; Components: Modpack\UncensorSelector
Type: filesandordirs; Name: "{app}\mods\MyMods\BetterPenetration"                ; Components: Modpack\UncensorSelector
; Compatibility pack is safer to be removed since it can have dupes with main modpack
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Compatibility Pack"

; Problematic config files
Type: files; Name: "{app}\BepInEx\config\com.joan6694.illusionplugins.videoexport.cfg"
Type: files; Name: "{app}\BepInEx\config\org.bepinex.plugins.PostProcessingEffectsV3.cfg"

; Potentially incompatible, outdated or buggy plugins
Type: files; Name: "{app}\mods\atari2.1 (normal bust).zipmod"
Type: files; Name: "{app}\BepInEx\IPA\KoikPlugins.dll"
Type: files; Name: "{app}\BepInEx\KK_ForceHighPoly.dll"
Type: files; Name: "{app}\BepInEx\ModBoneImplantor.dll"
Type: files; Name: "{app}\BepInEx\KKSubs.dll"
Type: files; Name: "{app}\BepInEx\HSubs.dll"
Type: files; Name: "{app}\BepInEx\KKUS.dll";         
Type: files; Name: "{app}\BepInEx\plugins\KKUS.dll"; Check: IsSteam
Type: files; Name: "{app}\BepInEx\FixCompilation.dll"
Type: files; Name: "{app}\BepInEx\KK_Ahegao.dll"
Type: files; Name: "{app}\BepInEx\KK_MoveMapFromCharaList.dll"
Type: files; Name: "{app}\BepInEx\ObjectTreeDebugKK.dll";           
Type: files; Name: "{app}\BepInEx\RuntimeUnityEditor.dll";          
Type: files; Name: "{app}\BepInEx\MakerAPI.dll";                    
Type: files; Name: "{app}\BepInEx\KK_AnimationController.dll";     
Type: files; Name: "{app}\BepInEx\KKABMGUI.dll";                    
Type: files; Name: "{app}\BepInEx\KKABMPlugin.dll";                 
Type: files; Name: "{app}\BepInEx\DragAndDrop.dll";                 
Type: files; Name: "{app}\BepInEx\IllusionDragAndDrop.Koikatu.dll"; 
Type: files; Name: "{app}\BepInEx\KoiSkinOverlay.dll";              
Type: files; Name: "{app}\BepInEx\KoiClothesOverlay.dll";           
Type: files; Name: "{app}\BepInEx\HideStudioUI.dll"
Type: files; Name: "{app}\BepInEx\HideHInterface.dll"
Type: files; Name: "{app}\BepInEx\KKSceneBrowserFolders.dll";       
Type: files; Name: "{app}\BepInEx\FixCompilation.dll"                    
Type: files; Name: "{app}\BepInEx\FixShaderDropdown.dll"                 
Type: files; Name: "{app}\BepInEx\KK_CutsceneLockupFix.dll"              
Type: files; Name: "{app}\BepInEx\KK_Fix_HeadFix.dll"                    
Type: files; Name: "{app}\BepInEx\KK_Fix_ListFix.dll"                    
Type: files; Name: "{app}\BepInEx\KK_Fix_MainGameOptimization.dll"       
Type: files; Name: "{app}\BepInEx\KK_Fix_MakerOptimization.dll"          
Type: files; Name: "{app}\BepInEx\KK_Fix_ResourceUnloadOptimization.dll" 
Type: files; Name: "{app}\BepInEx\KK_Fix_SettingsFix.dll"                
Type: files; Name: "{app}\BepInEx\KK_HeadFix.dll"                        
Type: files; Name: "{app}\BepInEx\KK_MiscFixes.dll"                      
Type: files; Name: "{app}\BepInEx\KK_PersonalityCorrector.dll"           
Type: files; Name: "{app}\BepInEx\KK_SettingsFix.dll"                    
Type: files; Name: "{app}\XInputInterface.dll"

[CustomMessages]
MsgMissingDLC1=NOTICE - You are missing the optional "Additional Personality Pack" expansion (07/27 2018 Summer Paid DLC). It adds 3 new personalities and new items.%n%nThis expansion is optional, the patch will work fine without it. If you want to use it, install it BEFORE running HF Patch.%n%nIf you have the game on Steam, you can get this expansion by installing the AfterParty DLC. You can find it in the DLC section of Koikatsu in your Steam library.
MsgMissingDLC2=NOTICE - You are missing the optional "After School" expansion (12/21 2018 Winter Paid DLC). It adds 4 new personalities, 3P, dating spots, weddings, and some other gameplay features.%n%nThis expansion is optional but recommended. If you want to use it, install it BEFORE running HF Patch.%n%nIf you have the game on Steam, you can get this expansion by installing the AfterParty DLC. You can find it in the DLC section of Koikatsu in your Steam library.
MsgMissingDLC3=NOTICE - You are missing the optional "Yoyaku" preorder DLC (emocre_yoyaku). It adds 1 new personality, some clothes and head types.%n%nThis expansion is optional, the patch will work fine without it. If you want to use it, install it BEFORE running HF Patch.
MsgMissingDLC4=NOTICE - You are missing the optional "Darkness" preorder expansion (emocre_dkn_01f). It adds a small amount of MMF/dark content to the game.%n%nThis expansion is optional, the patch will work fine without it. If you want to use it, install it BEFORE running HF Patch.
jp.MsgMissingDLC1=注意 - 「コイカツ！性格追加発売記念水着データVer.2018-08-31」のアップデートが欠けています。 それは3つの新しい個性と新しいアイテムを加えます。%n%n使用したい場合は、HF Patchを実行する前にインストールしてください。
jp.MsgMissingDLC2=注意 - 「コイカツ！アフタースクールVer.2018-12-21」のアップデートが欠けています。 四つの新しい人格、3Pや他のいくつかのゲームプレイの機能が追加されます。%n%n使用したい場合は、HF Patchを実行する前にインストールしてください。
jp.MsgMissingDLC3=注意 - オプションの「Yoyaku」予約特典DLC（emocre_yoyaku）が不足しています。このDLCは、新しい性格1つ、服、頭部タイプを追加します。%n%nこの拡張パックはオプションであり、なくてもパッチは正常に動作します。使用したい場合は、HF Patchを実行する前にインストールしてください。
jp.MsgMissingDLC4=注意 - 「コイカツ！ダークネス」のアップデートが欠けています。 このアップデートはMMFとダークコンテンツを追加します。%n%n使用したい場合は、HF Patchを実行する前にインストールしてください。

MsgKplugDetected=WARNING - KoikPlugins was detected and will be removed if you start installation to avoid potential compatibility issues (settings will not be removed).%n%nPlease follow KoikPlugins manual on how to install it again after patching is done.
MsgKKandKKPdetected=Both Koikatu! and Koikatsu Party files have been detected in the installation folder. To prevent issues with this patch and installed mods the Koikatu! files should be removed. This will not affect Koikatsu Party in any way. If you installed any Japanese DLCs to your Koikatsu Party this is normal and the files should be removed.%n%nDo you want to remove the problematic files? (Koikatu.exe, Koikatu_data, KoikatuVR.exe and KoikatuVR_Data will be removed if they exist)
jp.MsgKplugDetected=警告 - 互換性の問題を回避するためにインストールを開始すると、KoikPluginsは削除されます（設定は削除されません）。%n%n後でそれをインストールする方法についてはKoikPluginsマニュアルに従ってください
jp.MsgKKandKKPdetected=インストールフォルダ内に「コイカツ！」と「Koikatsu Party」の両方のファイルが検出されました。このパッチとインストール済みのMODとの互換性の問題を回避するため、「Koikatu!」ファイルを削除する必要があります。これは「Koikatsu Party」には一切影響しません。「Koikatsu Party」に日本語版DLCをインストールしている場合、これは正常な動作であり、これらのファイルは削除する必要があります。%n%n問題のあるファイルを削除しますか？（Koikatu.exe、Koikatu_data、KoikatuVR.exe、KoikatuVR_Dataが存在する場合は削除されます）

TaskPW=Uninstall Patchwork if installed and delete Plugins folder (Optional, will free up some disk space. If you intend to use PW, make sure your version is compatible with the current game update. If you have issues, run the game without PW)
jp.TaskPW=インストールされている場合はPatchworkをアンインストールし、Pluginsフォルダを削除します（オプション。ディスクスペースをいくらか解放します。PWを使用する予定の場合は、最新のゲームアップデートと互換性があります

IconGame=Koikatsu!
jp.IconGame=コイカツ！

[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Flags: unchecked
Name: partyfont; Description: "Use alternative font in Koikatsu Party (hand-written style, same as in the Japanese version)";
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked
Name: delete\scripts; Description: "Delete old scripts"; Flags: unchecked
Name: delete\Listfiles; Description: "{cm:TaskDeleteLst}"
#ifndef LITE
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"
#else
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"; Flags: unchecked
#endif
Name: PW; Description: "{cm:TaskPW}";

[Icons]
Name: "{userdesktop}\{cm:IconGame}"; Filename: "{app}\InitSetting.exe"; IconFilename: "{app}\InitSetting.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"
Name: "{userdesktop}\Koikatsu Party"; Filename: "{app}\Initial Settings.exe"; IconFilename: "{app}\Initial Settings.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"

[Run]
Filename: "{tmp}\hfp\start.bat"; Parameters: """{app}"""; Description: "{cm:RunGame}"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist runhidden
Filename: "{app}\manual\English\README.html"; Description: "Open official game manual (English)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent skipifdoesntexist
Filename: "{app}\[UTILITY] KKManager\StandaloneUpdater.exe"; Parameters: """{app}"""; Description: "{cm:StartUpdate}"; Flags: postinstall runascurrentuser unchecked nowait skipifsilent skipifdoesntexist
#include "HelperLib\CommonRun.iss"

[Code]
// --------------------------------------------------------------------------------------- Helper methods
function VRInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\KoikatuVR_Data\resources.assets')) or FileExists(ExpandConstant('{app}\Koikatsu Party VR_Data\resources.assets'));
end;

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

function KKPAPInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\adv\scenario\common\70.unity3d'));
end;

function KoikatuInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\Koikatu_Data\resources.assets'));
end;

function IsSteam(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\Koikatsu Party_Data\resources.assets'));
end;

function IsConvertedSteam(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\BRConvert\OK.txt'));
end;

// --------------------------------------------------------------------------------------- Installation Events

function OnInstallLocationTest(): Boolean; // Additional validity checks (.exe checks are already passed)
begin
  if (not FileExists(ExpandConstant('{app}\abdata\sound\setting\object\00.unity3d')) 
   or not FileExists(ExpandConstant('{app}\abdata\sound\setting\sound3dsettingdata\00.unity3d')) 
   or not FileExists(ExpandConstant('{app}\abdata\sound\setting\soundsettingdata\00.unity3d'))) then
  begin
    // Cancel, there's file corruptions that we can't fix
    MsgBox(ExpandConstant('{cm:MsgMissingGameFiles}'), mbCriticalError, MB_OK);
    Result := False;
    Exit;
  end;
  
  // If both KK and KKP files are present, remove the KK files
  if (KoikatuInstalled() and IsSteam()) then
  begin
    if (MsgBox(ExpandConstant('{cm:MsgKKandKKPdetected}'), mbConfirmation, MB_YESNO) = IDYES) then
    begin
      DeleteFile(ExpandConstant('{app}\Koikatu.exe'));
      DeleteFile(ExpandConstant('{app}\KoikatuVR.exe'));
      DelTree(ExpandConstant('{app}\Koikatu_Data'), True, True, True);
      DelTree(ExpandConstant('{app}\KoikatuVR_Data'), True, True, True);
    end
    else
    begin
      Result := False;
      Exit;
    end;
  end;
    
  // Check for missing paid DLC
  if not SummerExpInstalled() then
    SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC1}'), mbInformation, MB_OK, 0);
  if not AfterSchoolInstalled() then
    SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC2}'), mbInformation, MB_OK, 0);
  if not YoyakuInstalled() and not IsSteam() then
    SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC3}'), mbInformation, MB_OK, 0);
  if not DarknessInstalled() and not IsSteam() then
    SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC4}'), mbInformation, MB_OK, 0);
  
  if VRInstalled() then
    WizardSelectComponents('Patch\VR');
  
  Result := True;
end;

procedure OnTasksPageOpen(); // Use to change which tasks are on by default
begin
  // Party font remove task
  WizardForm.TasksList.Checked[1] := IsSteam();
  WizardForm.TasksList.ItemEnabled[1] := IsSteam();
  
  // If garbage plugins are detected, delete all old mods by default
  if (FileExists(ExpandConstant('{app}\BepInEx\config\EC.Core.Fixes.MakerFPS.cfg')) 
   or FileExists(ExpandConstant('{app}\BepInEx\CardCacher.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\0Harmony.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\TexResPatch.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\KK_GUIDMigration.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\Sideloader.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\Assembly-CSharp.dll'))) then
  begin
    SuppressibleMsgBox(ExpandConstant('{cm:MsgInvalidModsDetected}'), mbError, MB_OK, 0);
    WizardSelectTasks('delete,delete\Plugins,delete\Config');
  end;
  
  if (FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifier.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifierStudio.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifierStudioNEO.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\IPA\HSStudioNEOExtSave.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\FlashBangZ.dll')) 
   or FileExists(ExpandConstant('{app}\BepInEx\IPA\KK_gaugeslider.dll'))) then
  begin
    SuppressibleMsgBox(ExpandConstant('{cm:MsgIncompatibleModsDetected}'), mbError, MB_OK, 0);
    WizardSelectTasks('delete,delete\Plugins,delete\Config');
  end;
  
  if (FileExists(ExpandConstant('{app}\BepInEx\IPA\KoikPlugins.dll'))) then
  begin
    SuppressibleMsgBox(ExpandConstant('{cm:MsgKplugDetected}'), mbError, MB_OK, 0);
    WizardSelectTasks('delete,delete\Plugins,delete\Config');
  end;
  
  if (IsSteam() and WizardIsComponentSelected('Patch\VR') and not VRInstalled()) then
  begin
    SuppressibleMsgBox('To install the VR module for Koikatsu Party you have to go to your Steam Library, open properties of Koikatsu Party, go to the DLC tab and enable the VR DLC there. You should do this before installing HF Patch.', mbInformation, MB_OK, 0);
  end;
end;

procedure OnPrepKillTasks(); // Close the game if it's running
begin
  MassTaskKill(['CharaStudio.exe', 'Koikatu.exe', 'Koikatsu Party.exe', 'KoikatuVR.exe', 'Koikatsu Party VR.exe', 
                'InitSetting.exe', 'InitSettingEN.exe', 'InitSettingGameStudioVR.exe', 'Initial Settings.exe', 
                'BepInEx.Patcher.exe', 'KKManager.exe', 'StandaloneUpdater.exe']);
end;

procedure OnPrepDoCleanup(); // Remove any additional mods outside of the Bepinex folder
begin
  if (WizardIsTaskSelected('delete\Sidemods')) then
    RemoveModsExceptModpacks(ExpandConstant('{app}'), ExpandConstant('{src}'));

  if (WizardIsTaskSelected('delete\Listfiles')) then
    RemoveNonstandardListfiles(ExpandConstant('{app}'), ExpandConstant('{src}'));

  if (WizardIsTaskSelected('delete\scripts')) then
    DelTree(ExpandConstant('{app}\scripts'), True, True, True);

  if (WizardIsTaskSelected('PW')) then
  begin
    DelTree(ExpandConstant('{app}\Plugins'), True, True, True);
    DelTree(ExpandConstant('{app}\patchwork'), True, True, True);
    Exec(ExpandConstant('{cmd}'), '/c del patchwork_*', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
  end;
end;

procedure OnInstallCompleted(); // Final installation step, use to modify files installed by the patch
begin
  FixConfigIllusion(ExpandConstant('{app}'), ExpandConstant('{src}'));
  FixConfigKoikatsu(ExpandConstant('{app}'), ExpandConstant('{src}'));
  
  // Removing this causes game to fall back to original font
  if WizardIsTaskSelected('partyfont') then begin
    try
      DeleteFile(ExpandConstant('{app}\abdata\localize\translate\1\font.unit-y3d'));
      RenameFile(ExpandConstant('{app}\abdata\localize\translate\1\font.unity3d'), ExpandConstant('{app}\abdata\localize\translate\1\font.unit-y3d'))
    except
      ShowExceptionMessage();
    end;
  end;
  
  // Delete Japanese versions of cards and bgs if English versions are installed (only those with different names)
  if WizardIsComponentSelected('AT\TL\EnglishTranslation\UserData') then
  begin
      MassDeleteFile(['{app}\UserData\bg\チャペル_夕.png', '{app}\UserData\bg\チャペル_昼.png', '{app}\UserData\bg\公園_夕.png', '{app}\UserData\bg\公園_夜.png', '{app}\UserData\bg\公園_昼.png', 
                      '{app}\UserData\bg\夜景.png', '{app}\UserData\bg\宇宙空間01.png', '{app}\UserData\bg\宇宙空間02.png', '{app}\UserData\bg\宇宙空間03.png', '{app}\UserData\bg\宇宙空間04.png', 
                      '{app}\UserData\bg\遊園地_夕.png', '{app}\UserData\bg\遊園地_夜.png', '{app}\UserData\bg\遊園地_昼.png', '{app}\UserData\bg\駅前_夕.png', '{app}\UserData\bg\駅前_夜.png', 
                      '{app}\UserData\bg\駅前_昼.png', '{app}\UserData\chara\female\お嬢様.png', '{app}\UserData\chara\female\のじゃっ子.png', '{app}\UserData\chara\female\ひねくれ.png', 
                      '{app}\UserData\chara\female\ものぐさ.png', '{app}\UserData\chara\female\オタク女子.png', '{app}\UserData\chara\female\ギャル.png', '{app}\UserData\chara\female\ギャル2.png', 
                      '{app}\UserData\chara\female\セクシー.png', '{app}\UserData\chara\female\ボーイッシュ.png', '{app}\UserData\chara\female\ミステリアス.png', '{app}\UserData\chara\female\ミーハー.png', 
                      '{app}\UserData\chara\female\モジモジ.png', '{app}\UserData\chara\female\ヤンデレ.png', '{app}\UserData\chara\female\不幸少女.png', '{app}\UserData\chara\female\不良少女.png', 
                      '{app}\UserData\chara\female\勝ち気.png', '{app}\UserData\chara\female\単純.png', '{app}\UserData\chara\female\単純2.png', '{app}\UserData\chara\female\大和撫子.png', 
                      '{app}\UserData\chara\female\姉御肌.png', '{app}\UserData\chara\female\後輩キャラ.png', '{app}\UserData\chara\female\意地っ張り.png', '{app}\UserData\chara\female\意識高いクール.png', 
                      '{app}\UserData\chara\female\意識高いクール2.png', '{app}\UserData\chara\female\文学少女.png', '{app}\UserData\chara\female\正統派ヒロイン.png', '{app}\UserData\chara\female\正統派ヒロイン2.png', 
                      '{app}\UserData\chara\female\母性的.png', '{app}\UserData\chara\female\母性的2.png', '{app}\UserData\chara\female\気さく.png', '{app}\UserData\chara\female\無口.png', 
                      '{app}\UserData\chara\female\無口2.png', '{app}\UserData\chara\female\純真無垢.png', '{app}\UserData\chara\female\純真無垢2.png', '{app}\UserData\chara\female\素直クール.png', 
                      '{app}\UserData\chara\female\素直クール2.png', '{app}\UserData\chara\female\艶やか.png', '{app}\UserData\chara\female\誠実.png', '{app}\UserData\chara\female\邪気眼.png', 
                      '{app}\UserData\chara\female\野性的.png', '{app}\UserData\chara\female\電波.png', '{app}\UserData\chara\female\高飛車.png', '{app}\UserData\coordinate\お泊り１.png', 
                      '{app}\UserData\coordinate\お泊り２.png', '{app}\UserData\coordinate\アイドル.png', '{app}\UserData\coordinate\キャビンアテンダント.png', '{app}\UserData\coordinate\キュートナース.png', 
                      '{app}\UserData\coordinate\クリスマス.png', '{app}\UserData\coordinate\クロスホルター.png', '{app}\UserData\coordinate\サスペンダー.png', '{app}\UserData\coordinate\ショートパレオ（単色）.png', 
                      '{app}\UserData\coordinate\ショートパレオ.png', '{app}\UserData\coordinate\シースルーパレオ.png', '{app}\UserData\coordinate\セクシーパレオ.png', '{app}\UserData\coordinate\セクシーランジェリー.png', 
                      '{app}\UserData\coordinate\チアガール.png', '{app}\UserData\coordinate\ハイクオリティメイド.png', '{app}\UserData\coordinate\ハロウィン.png', '{app}\UserData\coordinate\パレオ.png', 
                      '{app}\UserData\coordinate\ビキニ水着（フリル付き）.png', '{app}\UserData\coordinate\フリルワンピース.png', '{app}\UserData\coordinate\マイクロモノキニ.png', '{app}\UserData\coordinate\メカ.png', 
                      '{app}\UserData\coordinate\ラインタンガ.png', '{app}\UserData\coordinate\ワンピース(無地).png', '{app}\UserData\coordinate\ワンピース(花柄).png', '{app}\UserData\coordinate\体操着.png', 
                      '{app}\UserData\coordinate\全身タイツ.png', '{app}\UserData\coordinate\制服.png', '{app}\UserData\coordinate\和メイド.png', '{app}\UserData\coordinate\大人ワンピース.png', 
                      '{app}\UserData\coordinate\小悪魔.png', '{app}\UserData\coordinate\巫女武者.png', '{app}\UserData\coordinate\教師.png', '{app}\UserData\coordinate\水着.png', 
                      '{app}\UserData\coordinate\白衣.png', '{app}\UserData\coordinate\私服.png', '{app}\UserData\coordinate\裸エプロン.png', '{app}\UserData\coordinate\裸サスペンダー.png', 
                      '{app}\UserData\coordinate\軍服.png', '{app}\UserData\coordinate\騎士.png', '{app}\UserData\coordinate\鬼神.png', '{app}\UserData\coordinate\魔法少女.png']);
  end;
end;

