; Copyright (C) 2020  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

;-------------Full game name for naming patch itself and desktop icons
#define NAME "Koikatsu"
;---------------------------------------------Current HF Patch version
#define VERSION "3.16"
;-----------------------------------------Sideloader modpack directory
#define ModsDir "E:\HFpatchmaking\KK\Testbed\mods"
;#define ModsDir "F:\Games\KoikatsuP\mods"
;--Don't include any files in the build to make it go fast for testing
;#define DEBUG
;---Skip file verification for easier testing, COMMENT OUT FOR RELEASE
;#define NOVERIFY
;------------Don't include general, studio and map sideloader modpacks
;#define LITE
;---------------------------------------------------------------------

#include "_Common\Header.iss"
[Setup]
#ifndef LITE
AppName=HF Patch for Koikatu! and Koikatsu Party
OutputBaseFilename=Koikatsu HF Patch v{#VERSION}
#else
AppName=HF Patch for Koikatu! and Koikatsu Party (Light Version)
OutputBaseFilename=Koikatsu HF Patch v{#VERSION} Light Version
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
LZMANumBlockThreads=6
#ifndef LITE
DiskSpanning=yes
#endif
DefaultDirName={code:GetDefaultDirName}

WindowResizable=yes
WizardStyle=modern
WizardSizePercent=120,150

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

#define CurrentDate GetDateTimeString('yyyy-mm-dd', '-', ':');

[Components]
Name: "Patch"; Description: "All free updates + game repair"; Types: full_en full extra_en extra custom bare none; Flags: fixed
Name: "Patch\VR"; Description: "Install/Update VR Module"; Types: full_en full extra_en extra custom
Name: "Patch\UserData"; Description: "{cm:CompDefCards}"
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Modpack"; Description: "Sideloader Modpacks {#CurrentDate} (Add additional content to the game, needs at least BepisPlugins to work)"
#ifndef LITE
Name: "Modpack\General"; Description: "General (Content for making characters, always recommended)"; Types: full_en full extra_en extra
Name: "Modpack\Studio"; Description: "Studio (Additional content for making Studio scenes)"; Types: full_en full extra_en extra
Name: "Modpack\Maps"; Description: "Maps (Additional maps for use in Studio and H scenes)"; Types: full_en full extra_en extra
Name: "Modpack\Animations"; Description: "Animations (Additional adnimations for use in Studio and Free H)"; Types: full_en full extra_en extra
#endif
Name: "Modpack\Fixes"; Description: "Fixes (Fixes to some of the official content, always recommended)"; Types: full_en full extra_en extra
Name: "Modpack\MaterialEditor"; Description: "KK_MaterialEditor (Materials for use with MaterialEditor)"; Types: full_en full extra_en extra
Name: "Modpack\UncensorSelector"; Description: "KK_UncensorSelector (Uncensors for use with UncensorSelector)"; Types: full_en full extra_en extra
;Name: "Modpack\Compat"; Description: "Compatibility Pack (Deprecated mods for backwards compatibility)"; Types: full_en full extra_en extra
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Experimental"; Description: "Experimental performance optimizations (Reduces stutter. Disable in case of plugin compatibility issues)"; 
; Name: "FIX\URL"; Description: "Use custom Character Database (fan-operated character DB - no IP blocking and mods are allowed)"; Types: full_en bare custom extra_en

[Files]
Source: "HelperLib.dll"; DestDir: "{app}"; Flags: dontcopy
Source: "Input\start.bat"; DestDir: "{tmp}\hfp"; Flags: ignoreversion recursesubdirs createallsubdirs
#ifndef DEBUG
Source: "Input\DirectX\Jun2010\*"; DestDir: "{tmp}\hfp\DirectXRedist2010"; Flags: ignoreversion recursesubdirs createallsubdirs deleteafterinstall; Check: DirectXRedistNeedsInstall
Source: "Plugin Readme.md"; DestDir: "{app}"
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\empty_ud\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak; Components: Patch
Source: "Input\_Patch\empty_ud_eng\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Languages: en
Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks_ud\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch\UserData; Check: KoikatuInstalled
;Source: "Input\_Patch\extras\UserData\*"; DestDir: "{app}\UserData\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch\UserData; Check: KoikatuInstalled
Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks_ud\UserData\Studio\scene\*"; DestDir: "{app}\UserData\Studio\scene"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch\UserData; Check: IsSteam
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\small_common\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\small_kk\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: KoikatuInstalled
Source: "Input\_Patch\small_kkp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: IsSteam
Source: "Input\_Patch\small_dark\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: DarknessInstalled and not IsSteam
Source: "Input\_Patch\Remote\Patches\extras\*";                         DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks\*";    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks_kk\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: KoikatuInstalled
Source: "Input\_Patch\Remote\Patches\koikatu_02plus_cdp0201hbtks_as\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: AfterSchoolInstalled
Source: "Input\_Patch\Remote\Patches\koikatu_03vr_d0531hg\*";           DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: not IsSteam
Source: "Input\_Patch\Remote\Patches\dkn_diff\*";                       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: DarknessInstalled and not IsSteam
Source: "Input\_Patch\Remote\Patches\party_diff\*";                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: IsSteam
Source: "Input\_Patch\Remote\Patches\koikatsuparty_sp_20210522\*";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: IsSteam
; Add missing studio lists
Source: "Input\_Patch\Remote\Patches\partydlc_diff\*";                  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Check: IsSteam and SummerExpInstalled and AfterSchoolInstalled
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\VR_JP\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch\VR; Check: not IsSteam
Source: "Input\_Patch\VR_EN\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch\VR; Check: VRInstalled and IsSteam
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\experimental\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Experimental; Check: DarknessInstalled
Source: "Input\_Patch\experimental_jp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Experimental; Check: not IsSteam and DarknessInstalled
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Solidbreak at the start to split off the modpacks from other files in case they don't have to be installed. solidbreak splits before the files entry with it is processed
#ifndef LITE
Source: "{#ModsDir}\Sideloader Modpack\*";                      DestDir: "{app}\mods\Sideloader Modpack";                       Flags: ignoreversion recursesubdirs solidbreak; Components: Modpack\General
Source: "{#ModsDir}\Sideloader Modpack - Exclusive KK\*";       DestDir: "{app}\mods\Sideloader Modpack - Exclusive KK";        Flags: ignoreversion recursesubdirs; Components: Modpack\General
Source: "{#ModsDir}\Sideloader Modpack - Exclusive KK KKS\*";   DestDir: "{app}\mods\Sideloader Modpack - Exclusive KK KKS";    Flags: ignoreversion recursesubdirs; Components: Modpack\General
Source: "{#ModsDir}\Sideloader Modpack - Studio\*";             DestDir: "{app}\mods\Sideloader Modpack - Studio";              Flags: ignoreversion recursesubdirs; Components: Modpack\Studio
Source: "{#ModsDir}\Sideloader Modpack - Maps\*";               DestDir: "{app}\mods\Sideloader Modpack - Maps";                Flags: ignoreversion recursesubdirs; Components: Modpack\Maps
Source: "{#ModsDir}\Sideloader Modpack - Animations\*";         DestDir: "{app}\mods\Sideloader Modpack - Animations";          Flags: ignoreversion recursesubdirs; Components: Modpack\Animations
#endif
Source: "{#ModsDir}\Sideloader Modpack - Fixes\*";              DestDir: "{app}\mods\Sideloader Modpack - Fixes";               Flags: ignoreversion recursesubdirs; Components: Modpack\Fixes
Source: "{#ModsDir}\Sideloader Modpack - KK_MaterialEditor\*";  DestDir: "{app}\mods\Sideloader Modpack - KK_MaterialEditor";   Flags: ignoreversion recursesubdirs; Components: Modpack\MaterialEditor
Source: "{#ModsDir}\Sideloader Modpack - KK_UncensorSelector\*";DestDir: "{app}\mods\Sideloader Modpack - KK_UncensorSelector"; Flags: ignoreversion recursesubdirs; Components: Modpack\UncensorSelector
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Make sure this is never missing in case the plugin archive doesn't have it included. Also solidbreak to split off the modpacks
Source: "Input\_Plugins\KK_UncensorSelector Base.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion solidbreak; Components: UNC\Selector
#endif

; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; This include should be here because the patch files above can be overwritten by this include, and the Files section below overwrites some config files that this include extracts
#include "components.iss"

[Files]
#ifndef DEBUG
Source: "Input\BepInEx_config\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak; Components: BepInEx
Source: "Input\BepInEx_Dev\common\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev
Source: "Input\BepInEx_Dev\Koikatu_Data\*"; DestDir: "{app}\Koikatu_Data"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev; Check: KoikatuInstalled
Source: "Input\BepInEx_Dev\KoikatuVR_Data\*"; DestDir: "{app}\KoikatuVR_Data"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev; Check: VRInstalled and not IsSteam
Source: "Input\BepInEx_Dev\KoikatuVR_Data\*"; DestDir: "{app}\Koikatsu Party VR_Data"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev; Check: VRInstalled and IsSteam
Source: "Input\BepInEx_Dev\Koikatsu Party_Data\*"; DestDir: "{app}\Koikatsu Party_Data"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev; Check: IsSteam
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_TL\Translation_EN_base\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: AT\TL\EnglishTranslation
Source: "Input\_TL\Translation_EN_jpver\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: AT\TL\EnglishTranslation; Check: not IsSteam
Source: "Input\_TL\Translation_EN_jpexpansion\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: AT\TL\EnglishTranslation; Check: not IsSteam or not KKPAPInstalled
;Source: "Input\_TL\Translation_EN_userdata_base\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation\UserData
Source: "Input\_TL\Translation_EN_userdata_jpver\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation\UserData; Check: not IsSteam
Source: "Input\_TL\_lang jp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: jp
Source: "Input\_TL\_lang ch\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: sc
Source: "Input\_TL\_lang eng\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: en
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\KK_SFW_config\sfw\KK_SFW.cfg";      DestDir: "{app}\BepInEx\config"; Flags: ignoreversion; Components: Feature\KK_SFW; Check: SFWmode
Source: "Input\KK_SFW_config\nsfw\KK_SFW.cfg";     DestDir: "{app}\BepInEx\config"; Flags: ignoreversion; Components: Feature\KK_SFW; Check: NSFWmode
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\Launcher_branding\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: IllusionLaunchers
; Only copy our blacklist if the user doesn't already have one (onlyifdoesntexist)
Source: "Input\itemblacklist.xml"; DestDir: "{app}\UserData\save"; Flags: onlyifdoesntexist solidbreak
; This config only allows BP uncensors to be choosed by random
Source: "Input\US_config_BP.cfg";   DestDir: "{app}\BepInEx\config"; DestName: "com.deathweasel.bepinex.uncensorselector.cfg"; Flags: onlyifdoesntexist solidbreak; Components: UNC\Selector\KK_BetterPenetration
; If previous doesn't get installed, this one should be installed instead because the file still doesn't exist
Source: "Input\US_config_noBP.cfg"; DestDir: "{app}\BepInEx\config"; DestName: "com.deathweasel.bepinex.uncensorselector.cfg"; Flags: onlyifdoesntexist solidbreak
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Source: "Input\_Plugins\[Character Database][various] fixed\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\URL
; Source: "Input\_Misc\KoikatuSaveDataEdit\*"; DestDir: "{app}\_Tools\KoikatuSaveDataEdit"; Flags: ignoreversion recursesubdirs; Components: MISC\SaveEditor
#endif

[InstallDelete]
; Clean up old translations
Type: filesandordirs; Name: "{app}\BepInEx\translation"; Components: AT\TL\EnglishTranslation
Type: filesandordirs; Name: "{app}\BepInEx\plugins\KK_Plugins\KK_TextResourceRedirector.dll"; Components: AT\TL\EnglishTranslation
;Type: files; Name: "{app}\BepInEx\MakerLag.dll"; Components: FIX\FixCompilation
Type: files; Name: "{app}\BepInEx\KKSceneBrowserFolders.dll"; Components: Feature\KK_BrowserFolders
Type: files; Name: "{app}\InitSettingGameStudioVREN.exe"; Components: IllusionLaunchers
Type: files; Name: "{app}\InitSettingEN.exe"; Components: IllusionLaunchers
Type: files; Name: "{app}\InitSettingEnglish.exe"; Components: IllusionLaunchers
Type: files; Name: "{app}\InitSetting EN.exe"; Components: IllusionLaunchers
Type: files; Name: "{app}\InitSetting English.exe"; Components: IllusionLaunchers
Type: files; Name: "{app}\InitSetting.exe"
Type: files; Name: "{app}\InitSetting.exe.config"
Type: files; Name: "{app}\Initial Settings.exe"
Type: files; Name: "{app}\Initial Settings.exe.config"
Type: filesandordirs; Name: "{app}\UserData\LauncherEN"; Components: IllusionLaunchers
; Used by stock launcher in steam release, remove to declutter if using custom launcher
Type: filesandordirs; Name: "{app}\ja-JP"; Components: IllusionLaunchers   
Type: filesandordirs; Name: "{app}\zh-CN"; Components: IllusionLaunchers
Type: filesandordirs; Name: "{app}\zh-TW"; Components: IllusionLaunchers

; Need to use the steam DLC instead
Type: filesandordirs; Name: "{app}\KoikatuVR_Data"; Check: IsSteam
Type: files; Name: "{app}\KoikatuVR.exe"; Check: IsSteam

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
#ifndef LITE
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack"                      ; Components: Modpack\General
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Exclusive KK"       ; Components: Modpack\General
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Exclusive KK KKS    ; Components: Modpack\General
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Studio"             ; Components: Modpack\Studio
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Maps"               ; Components: Content\ModpackMaps
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Animations"         ; Components: Modpack\Animations
#endif
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Compatibility Pack"
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Fixes"              ; Components: Modpack\Fixes
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - KK_MaterialEditor"  ; Components: Modpack\MaterialEditor
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - KK_UncensorSelector"; Components: Modpack\UncensorSelector
Type: filesandordirs; Name: "{app}\mods\MyMods\BetterPenetration"                ; Components: Modpack\UncensorSelector

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
Type: filesandordirs; Name: "{app}\BepInEx_Shim_Backup"
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

; Just in case. Also resets any hash caches
Type: filesandordirs; Name: "{app}\[UTILITY] KKManager"; Components: KKManager
Type: filesandordirs; Name: "{app}\temp"

; Will get replaced, makes sure there are no stale files left
Type: filesandordirs; Name: "{app}\BepInEx\cache"; Components: BepInEx
Type: filesandordirs; Name: "{app}\BepInEx\core"; Components: BepInEx
Type: files; Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx
Type: files; Name: "{app}\version.dll"; Components: BepInEx
Type: files; Name: "{app}\winhttp.dll"; Components: BepInEx
Type: files; Name: "{app}\doorstop_config.ini"; Components: BepInEx

; Potentially incompatible, outdated or buggy plugins
Type: files; Name: "{app}\mods\atari2.1 (normal bust).zipmod"
Type: files; Name: "{app}\BepInEx\IPA\KoikPlugins.dll"
Type: files; Name: "{app}\BepInEx\KK_ForceHighPoly.dll"
Type: files; Name: "{app}\BepInEx\ModBoneImplantor.dll"
Type: files; Name: "{app}\BepInEx\KKSubs.dll"
Type: files; Name: "{app}\BepInEx\HSubs.dll"
Type: files; Name: "{app}\BepInEx\KKUS.dll"; Check: IsSteam
Type: files; Name: "{app}\BepInEx\plugins\KKUS.dll"; Check: IsSteam
Type: files; Name: "{app}\BepInEx\FixCompilation.dll"
Type: files; Name: "{app}\BepInEx\KK_Ahegao.dll"
Type: files; Name: "{app}\BepInEx\KK_MoveMapFromCharaList.dll"
Type: files; Name: "{app}\BepInEx\ObjectTreeDebugKK.dll"; Components: MISC\RuntimeUnityEditor
Type: files; Name: "{app}\BepInEx\MakerAPI.dll"; Components: API\KKAPI
Type: files; Name: "{app}\BepInEx\KK_AnimationController.dll"; Components: Content\NodesConstraints
Type: files; Name: "{app}\BepInEx\KKABMGUI.dll"; Components: Content\KKABMX
Type: files; Name: "{app}\BepInEx\KKABMPlugin.dll"; Components: Content\KKABMX
Type: files; Name: "{app}\BepInEx\DragAndDrop.dll"; Components: Feature\DragAndDrop
Type: files; Name: "{app}\BepInEx\IllusionDragAndDrop.Koikatu.dll"; Components: Feature\DragAndDrop
Type: files; Name: "{app}\BepInEx\KK_RandomCharacterGenerator.dll"; Components: Feature\KK_RandomCharacterGenerator
Type: files; Name: "{app}\BepInEx\KoiSkinOverlay.dll"; Components: Content\KSOX
Type: files; Name: "{app}\BepInEx\KoiClothesOverlay.dll"; Components: Content\KSOX
Type: files; Name: "{app}\BepInEx\RuntimeUnityEditor.dll"; Components: MISC\RuntimeUnityEditor
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
Root: HKCU; Subkey: "Software\Illusion"
Root: HKCU; Subkey: "Software\Illusion\Koikatu"
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"; ValueType: string; ValueName: "INSTALLDIR"; ValueData: "{app}\"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"; ValueType: string; ValueName: "INSTALLDIR_HFP"; ValueData: "{app}\"

[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Flags: unchecked
;Name: editordesktopicon; Description: "Create a save editor desktop icon"; Components: MISC\SaveEditor; Flags: unchecked
Name: partyfont; Description: "Use alternative font in Koikatsu Party (hand-written style, same as in the Japanese version)";
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked
Name: delete\scripts; Description: "Delete old scripts"; Flags: unchecked
Name: delete\Listfiles; Description: "{cm:TaskDeleteLst}"
Name: fixSideloaderDupes; Description: "{cm:TaskSideDupes}";
Name: PW; Description: "{cm:TaskPW}";
; IPA is always removed, can't go around that. Unchecking is disabled in code, this task has to stay at the same index for it to work
Name: IPA; Description: "{cm:TaskIPA}";

[Icons]
Name: "{userdesktop}\{cm:IconGame}"; Filename: "{app}\InitSetting.exe"; IconFilename: "{app}\InitSetting.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"
Name: "{userdesktop}\Koikatsu Party"; Filename: "{app}\Initial Settings.exe"; IconFilename: "{app}\Initial Settings.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"

[Run]
Filename: "{tmp}\hfp\DirectXRedist2010\DXSETUP.exe"; Parameters: "/silent"; Description: "Installing DirectX redistributables"; Flags: skipifdoesntexist runascurrentuser

Filename: "{tmp}\hfp\start.bat"; Parameters: """{app}"""; Description: "{cm:RunGame}"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist

Filename: "{app}\manual\English\README.html"; Description: "Open official game manual"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent skipifdoesntexist

Filename: "https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu/Technical_Help"; Description: "{cm:RunWiki}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
Filename: "https://discord.gg/Szumqcu"; Description: "{cm:RunDiscord}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

Filename: "{app}\[UTILITY] KKManager\StandaloneUpdater.exe"; Parameters: """{app}"""; Description: "{cm:StartUpdate}"; Flags: postinstall runascurrentuser unchecked nowait skipifsilent skipifdoesntexist

Filename: "https://github.com/ManlyMarco/KK-HF_Patch"; Description: "Latest releases and source code"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent

Filename: "https://www.patreon.com/ManlyMarco"; Description: "ManlyMarco Patreon (Creator of this patch)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

[Code]
procedure FindInstallLocation(path: String; gameName: String; gameNameSteam: String; out strout: WideString);
external 'FindInstallLocation@files:HelperLib.dll stdcall';

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

function GetDefaultDirName(Param: string): string;
var
  str: WideString;
begin
  FindInstallLocation(ExpandConstant('{src}'), 'Koikatu', 'Koikatsu Party', str);
  Result := str;
end;

procedure StartAutoUpdate(path, installer: String; sm, smcp, smf, smme, smus, smmap, smstu: Boolean);
external 'StartAutoUpdate@files:HelperLib.dll stdcall';

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

function DirectXRedistNeedsInstall(): Boolean;
begin
  Result := not RegKeyExists(HKLM, 'SOFTWARE\WOW6432Node\Valve\Steam\Apps\CommonRedist\DirectX\Jun2010')
end;

procedure CurPageChanged(CurPageID: Integer);
var
  ResultCode: Integer;
begin
  if CurPageID = wpSelectTasks then
  begin
    // Disable IPA task to keep it checked. Task count can change and it's always the last one so use the Count
    WizardForm.TasksList.ItemEnabled[WizardForm.TasksList.Items.Count - 1] := False;

    // If garbage plugins are detected, delete all old mods by default
    if(FileExists(ExpandConstant('{app}\BepInEx\config\EC.Core.Fixes.MakerFPS.cfg')) or FileExists(ExpandConstant('{app}\BepInEx\CardCacher.dll')) or FileExists(ExpandConstant('{app}\BepInEx\0Harmony.dll')) or FileExists(ExpandConstant('{app}\BepInEx\TexResPatch.dll')) or FileExists(ExpandConstant('{app}\BepInEx\KK_GUIDMigration.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Sideloader.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Assembly-CSharp.dll'))) then
    begin
      SuppressibleMsgBox(ExpandConstant('{cm:MsgInvalidModsDetected}'), mbError, MB_OK, 0);
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 9, coCheckWithChildren);
    end;

    if (FileExists(ExpandConstant('{app}\BepInEx\IPA\KoikPlugins.dll'))) then
      SuppressibleMsgBox(ExpandConstant('{cm:MsgKplugDetected}'), mbError, MB_OK, 0);

    if (FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifier.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifierStudio.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifierStudioNEO.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\HSStudioNEOExtSave.dll')) or FileExists(ExpandConstant('{app}\BepInEx\FlashBangZ.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\KK_gaugeslider.dll'))) then
    begin
      SuppressibleMsgBox(ExpandConstant('{cm:MsgIncompatibleModsDetected}'), mbError, MB_OK, 0);
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 9, coCheckWithChildren);
    end;
    
    if (IsSteam() and IsComponentSelected('Patch\VR') and not VRInstalled()) then
    begin
      SuppressibleMsgBox('To install the VR module for Koikatsu Party you have to go to your Steam Library, open properties of Koikatsu Party, go to the DLC tab and enable the VR DLC there. You should do this before installing HF Patch.', mbInformation, MB_OK, 0);
    end;
    
    WizardForm.TasksList.Checked[WizardForm.TasksList.Items.Count - 10] := IsSteam();
    WizardForm.TasksList.ItemEnabled[WizardForm.TasksList.Items.Count - 10] := IsSteam();
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  // After install completes
  if (CurStep = ssPostInstall) then
  begin
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

function IsCharValid(Value: Char): Boolean;
begin
  Result := Ord(Value) <= $007F;
end;

function IsDirNameValid(const Value: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 1 to Length(Value) do
    if not IsCharValid(Value[I]) then
      Exit;
  Result := True;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
begin
  // allow the setup turning to the next page
  Result := True;

  if (CurPageID = wpSelectDir) then
  begin
    if (not KoikatuInstalled() and not IsSteam()) then
    begin
      if(SuppressibleMsgBox(ExpandConstant('{cm:MsgExeNotFound}'), mbError, MB_YESNO, 0) = IDNO) then
        Result := False;
    end;

    if Result = True then
    begin
      if (Length(ExpandConstant('{app}')) > 100) then
      begin
        MsgBox(ExpandConstant('{cm:MsgPathTooLong}'), mbError, MB_OK);
        Result := False;
      end
    end;

    if Result = True then
    begin
      if not IsDirNameValid(ExpandConstant('{app}')) then
      begin
        MsgBox(ExpandConstant('{cm:MsgPathNonLatin}'), mbError, MB_OK);
      end;
    end;

    if Result = True then
    begin
      if (Pos(LowerCase(ExpandConstant('{app}\')), LowerCase(ExpandConstant('{src}\'))) > 0) then
      begin
        MsgBox('This patch is inside of the game directory you are attempting to install to. You have to move the patch files outside of the game directory and try again.', mbError, MB_OK);
        Result := False;
      end
    end;
    
    // If both KK and KKP files are present, remove the KK files
    if (KoikatuInstalled() and IsSteam()) then
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
      if (FileExists(ExpandConstant('{app}\KoikatsuSunshineTrial.exe'))
      or FileExists(ExpandConstant('{app}\KoikatsuSunshine.exe'))) then
      begin
        MsgBox('This patch is for Koikatu and Koikatsu Party only, it does not work with Koikatsu Sunshine. Look for a new KKS HF patch instead.', mbError, MB_OK);
        Result := False;
      end
    end;

    if Result = True then
    begin
      if (FileExists(ExpandConstant('{app}\PlayHome.exe'))
      or FileExists(ExpandConstant('{app}\AI-Syoujyo.exe'))
      or FileExists(ExpandConstant('{app}\AI-Shoujo.exe'))
      or FileExists(ExpandConstant('{app}\HoneySelect2.exe'))
      or FileExists(ExpandConstant('{app}\KoikatsuSunshine.exe'))) then
      begin
        MsgBox(ExpandConstant('{cm:MsgDifferentGameDetected}'), mbError, MB_OK);
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
        if not YoyakuInstalled() and not IsSteam() then
        begin
          SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC3}'), mbInformation, MB_OK, 0);
        end;
        if not DarknessInstalled() and not IsSteam() then
        begin
          SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC4}'), mbInformation, MB_OK, 0);
        end;
      end;
    end;

    if Result = True then
    begin
      // Check for extracted zipmods
      if FileExists(ExpandConstant('{app}\manifest.xml')) then
      begin
        SuppressibleMsgBox(ExpandConstant('{cm:MsgExtractedZipmod}'), mbError, MB_OK, 0);
      end;
    end;
    
    if VRInstalled() then
    begin
      WizardSelectComponents('Patch\VR');
    end;
  end;
end;


// SFW page
var
  PageSFWmode: TWizardPage;
  DescLabelFull: TLabel;
  DescLabelSafe: TLabel;
  ModeRadioButtonFull: TNewRadioButton;  
  ModeRadioButtonSafe: TNewRadioButton;  
procedure CreateSfwPage;     
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


procedure VerifyFiles(srcexe: String; out errormsg: WideString);
external 'VerifyFiles@files:HelperLib.dll stdcall';

// Set up a custom prepare to install page with progress
var
  PrepareToInstallWithProgressPage : TOutputProgressWizardPage;
procedure InitializeWizard;
var
  A: AnsiString;
  S: String;
begin
  // The string msgWizardPreparing has the placeholder '[name]' inside that I have to replace with the name of my app, stored in a define constant of my script.
  S := SetupMessage(msgPreparingDesc); 
  StringChange(S, '[name]', '{#NAME} HF Patch');
  A := S;
  PrepareToInstallWithProgressPage := CreateOutputProgressPage(SetupMessage(msgWizardPreparing), A);
  
  CreateSfwPage();
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  ResultCode: Integer;
  VerifyResult: WideString;
begin
  NeedsRestart := false;

  PrepareToInstallWithProgressPage.Show;
  
  PrepareToInstallWithProgressPage.SetProgress(0, 10);
  PrepareToInstallWithProgressPage.SetText('Verifying HF Patch files, this can take a few minutes', '');
  
#ifndef NOVERIFY
  VerifyFiles(ExpandConstant('{srcexe}'), VerifyResult);
#endif

  // If verification failed, set return of this method to it and innosetup will automatically fail the install. Still need to skip rest of the code though.
  if not (VerifyResult = '') then
  begin
    Result := VerifyResult;
  end
  else
  begin
    try
      PrepareToInstallWithProgressPage.SetProgress(4, 10);
      PrepareToInstallWithProgressPage.SetText('Exiting running game processes', '');
      
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

      PrepareToInstallWithProgressPage.SetProgress(5, 10);
      PrepareToInstallWithProgressPage.SetText('Fixing file permissions of game directory', '');

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

    PrepareToInstallWithProgressPage.SetProgress(6, 10);
    PrepareToInstallWithProgressPage.SetText('Creating a plugin backup', '');

    CreateBackup(ExpandConstant('{app}'));

    PrepareToInstallWithProgressPage.SetProgress(8, 10);
    PrepareToInstallWithProgressPage.SetText('Changing plugin configuration', '');
    
    // Backup plugin settings
    if (not IsTaskSelected('delete\Config') and FileExists(ExpandConstant('{app}\BepInEx\config.ini'))) then
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
        Exec(ExpandConstant('{cmd}'), '/c del *.dll', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
        Exec(ExpandConstant('{cmd}'), '/c del *.dl_', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
      end;
    end;
    
    if (not IsTaskSelected('delete\Config')) then
    begin
      // Restore the settings and remove the backup
      CreateDir(ExpandConstant('{app}\BepInEx'));
      if(FileExists(ExpandConstant('{app}\config.ini'))) then
      begin
        FileCopy(ExpandConstant('{app}\config.ini'), ExpandConstant('{app}\BepInEx\config.ini'), false);
        DeleteFile(ExpandConstant('{app}\config.ini'));
      end;
    end
    else
    begin
      // Or remove settings
      DeleteFile(ExpandConstant('{app}\BepInEx\config.ini'));
    end;

    PrepareToInstallWithProgressPage.SetProgress(9, 10);
    PrepareToInstallWithProgressPage.SetText('Cleaning up old mods and scripts', '');

    if (IsTaskSelected('delete\Sidemods')) then
      RemoveModsExceptModpacks(ExpandConstant('{app}'));

    if (IsTaskSelected('delete\Listfiles')) then
      RemoveNonstandardListfiles(ExpandConstant('{app}'));

    if (IsTaskSelected('delete\scripts')) then
      DelTree(ExpandConstant('{app}\scripts'), True, True, True);

    if (IsTaskSelected('PW')) then
    begin
      DelTree(ExpandConstant('{app}\Plugins'), True, True, True);
      DelTree(ExpandConstant('{app}\patchwork'), True, True, True);
      Exec(ExpandConstant('{cmd}'), '/c del patchwork_*', ExpandConstant('{app}'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
    end;

    SetConfigDefaults(ExpandConstant('{app}'));
  end;
  
  PrepareToInstallWithProgressPage.SetProgress(10, 10);
  PrepareToInstallWithProgressPage.Hide;
end;