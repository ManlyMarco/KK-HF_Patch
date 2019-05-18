;--------------------------------------------Full game name for naming patch itself and desktop icons
#define NAME "Koikatsu"
;----------------------------------------------------------------------------Current HF Patch version
#define VERSION "2.6"
;----------------------------------------------------------------------------------------------------
#include "_Common\Header.iss"

[Setup]
CloseApplications=yes
RestartApplications=no
CloseApplicationsFilter=*.exe,*.dll
Compression=lzma2/ultra64
;lzma2/ultra64 | zip
LZMAUseSeparateProcess=yes
LZMADictionarySize=208576
LZMANumFastBytes=273
LZMANumBlockThreads=3
DiskSpanning=yes
DefaultDirName={reg:HKCU\Software\Illusion\Koikatu\koikatu,INSTALLDIR}

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"

#include "Translations.iss"

[Types]
Name: "full_en"; Description: "{cm:fullInstall}"; Languages: en;
Name: "full"; Description: "{cm:fullInstall}"; Languages: jp;
Name: "extra"; Description: "{cm:extraInstall}"
Name: "bare"; Description: "{cm:bareInstall}"
Name: "none"; Description: "{cm:noneInstall}"
Name: "custom"; Description: "{cm:customInstall}"; Flags: iscustom

[Components]
Name: "Patch"; Description: "Patch and free DLC up to 02/01 by Illusion (uses the AIO) + Game repair"; Types: full_en full extra custom bare none; Flags: fixed
Name: "Patch\VR"; Description: "KoikatuVR Patch 01/11 by Illusion (install if you use VR module)"; Types: full_en full extra custom bare none
Name: "Patch\UserData"; Description: "{cm:CompDefCards}";

Name: "BepInEx"; Description: "BepInEx v4.1.2RC Unity plugin framework"; Types: full_en full extra custom bare; Flags: fixed 
Name: "BepInEx\Dev"; Description: "{cm:CompDev}";
Name: "BepisPlugins"; Description: "BepisPlugins r10"; Types: full_en full extra custom bare; Flags: fixed

Name: "KKAPI"; Description: "KKAPI v1.3 (Modding API needed by many plugins)"; Types: full_en full extra custom bare; Flags: fixed

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "TL"; Description: "{cm:CompTL}"; Types: full_en extra

Name: "TL\UItranslation"; Description: "UI Graphics translation v2.8"; Types: full_en extra
Name: "TL\EnglishTranslation"; Description: "bbepis/KoikatsuTranslation 31-12-2018"; Types: full_en extra
Name: "TL\EnglishTranslation\UserData"; Description: "Translated cards, scenes and backgrounds (they overwrite defaults)"; Types: full_en extra

Name: "TL\EnglishTranslation2"; Description: "DeathWeasel1337/Koikatsu-Translations v2"; Types: full_en extra
Name: "TL\Plugins"; Description: "DeathWeasel1337/Koikatsu-Plugin-Translations 2019-04-19"; Types: full_en extra
Name: "TL\romanization"; Description: "Nickname romanization 1.3 by BadOne"; Types: full_en extra

Name: "TL\EnglishLauncher"; Description: "English Launchers v1.0 by user539"; Types: full_en extra
Name: "TL\KK_Subtitles"; Description: "KK_Subtitles v1.2"; Types: extra

Name: "TL\AutoTranslator"; Description: "XUnity.AutoTranslator 3.1.0"; Types: full_en extra

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "UNC"; Description: "{cm:CompUNC}"; Types: full_en full extra

Name: "UNC\Selector"; Description: "Uncensor Selector v3.5.1"; Types: full_en full extra
Name: "UNC\Selector\Pack"; Description: "Uncensor pack 16/04/2019"; Types: full_en full extra

Name: "UNC\Tongue"; Description: "Tongue Texture v1.1 by moderchan"; Types: full_en full extra

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "Content"; Description: "Additional content for character and scene creation (Needed to properly load most character cards and scenes)"; Types: full_en full extra

Name: "Content\Modpack"; Description: "Sideloader Modpack 26-4-2019 (Lots of additional content for making characters"; Types: full_en full extra
Name: "Content\ModpackStudio"; Description: "Studio Sideloader Modpack 26-4-2019 (Additional content for making Studio scenes)"; Types: full_en full extra
Name: "Content\KK_GUIDMigration"; Description: "KK_GUIDMigration v1.5 (Improves card and scene compatibility)"; Types: full_en full extra
Name: "Content\KK_ClothingUnlocker"; Description: "KK_ClothingUnlocker v1.1 (Can use female clothes in male maker and vice versa)"; Types: full_en full extra
Name: "Content\KK_HairAccessoryCustomizer"; Description: "KK_HairAccessoryCustomizer v1.0 (adds advanced controls for hair accessories)"; Types: full_en full extra

Name: "Content\MoreAccessories"; Description: "MoreAccessories 1.0.4 by Joan6694 (Unlocks accessory limit)"; Types: full_en full extra
Name: "Content\KKABMX"; Description: "KKABMX v3.1 (More sliders in maker)"; Types: full_en full extra
Name: "Content\KSOX"; Description: "Koikatsu Overlay Mods v4.2.1 (Custom body, clothes and eye textures)"; Types: full_en full extra
Name: "Content\KSOX\KK_SkinEffects"; Description: "Additional Skin Effects v1.4 (Effects for sweating, crying, bukkake and deflowering)"; Types: full_en full extra
Name: "Content\KK_InvisibleBody"; Description: "KK_InvisibleBody v1.1 (Hide character body in studio)"; Types: full_en full extra
;Name: "Content\KK_AnimationController"; Description: "KK_AnimationController v2.1 (Create custom animations in studio)"; Types: full_en full extra
Name: "Content\NodesConstraints"; Description: "NodesConstraints v1.0.1 (Create custom animations in studio)"; Types: full_en full extra
Name: "Content\KKPE"; Description: "KKPE 1.2.0 by Joan6694 (Advanced studio controls)"; Types: full_en full extra
Name: "Content\KK_MoreAccessoryParents"; Description: "KK_MoreAccessoryParents 1.0 (More parent options for accessories)"; Types: full_en full extra

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "FIX"; Description: "{cm:CompFIX}"; Types: extra

Name: "FIX\FixCompilation"; Description: "FixCompilation 2019-03-18 (Improves performance)"; Types: full_en full extra
Name: "FIX\KK_CutsceneLockupFix"; Description: "KK_CutsceneLockupFix v1.0 (Fixes some mods crashing story)"; Types: full_en full extra
Name: "FIX\KK_PersonalityCorrector"; Description: "KK_PersonalityCorrector v1.3.1 (Fixes story crashes with some cards)"; Types: full_en full extra
Name: "FIX\KK_MiscFixes"; Description: "KK_MiscFixes v1.1"; Types: full_en full extra
Name: "FIX\KK_ListOverride"; Description: "KK_ListOverride v1.0 + half-open pantyhose fix"; Types: full_en full extra

Name: "FIX\KK_InputHotkeyBlock"; Description: "KK_InputHotkeyBlock v1.1 (Blocks plugin keybinds while typing)"; Types: full_en full extra
Name: "FIX\FixShaderDropdown"; Description: "FixShaderDropdown v1.0 (Expands shader menu)"; Types: full_en full extra
Name: "FIX\HideStudioUI"; Description: "HideStudioUI v1.2 (Press space)"; Types: full_en full extra
Name: "FIX\HideHInterface"; Description: "HideHInterface v1.0 (Press space)"; Types: full_en full extra

Name: "FIX\CharaStateX"; Description: "CharaStateX 2019-01-13 (Can edit state of multiple charas in studio at once)"; Types: full_en full extra
Name: "FIX\KK_ReloadCharaListOnChange"; Description: "KK_ReloadCharaListOnChange v1.4.1"; Types: full_en full extra

Name: "FIX\LiquidExtension"; Description: "Base Liquid Extension v1.1 + Gloves Liquid Patch v1.0 (expands liquid textures during H onto arms and some gloves)"; Types: full_en full extra

;Name: "FIX\URL"; Description: "Use custom Character Database (Connects to non-IP-blocked character DB)"; Types: full_en bare custom extra

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "Feature"; Description: "Improvements and additional features"; Types: extra
Name: "Feature\KKUS"; Description: "KKUS v1.0.0 (Search boxes, studio and maker improvements)"; Types: full_en full extra
Name: "Feature\DragAndDrop"; Description: "Drag and drop character cards and scenes v1.3"; Types: full_en full extra
Name: "Feature\KK_BrowserFolders"; Description: "KK_BrowserFolders v1.3 (Folder support in chara/scene select screens)"; Types: full_en full extra
Name: "Feature\KK_PoseFolders"; Description: "KK_PoseFolders v1.0 (Folder support in studio pose list)"; Types: full_en full extra
Name: "Feature\KK_ClothesLoadOption"; Description: "KK_ClothesLoadOption 0.0.0 (Can load only some parts of coordinate cards)"; Types: full_en full extra
Name: "Feature\KK_BetterColorPicker"; Description: "KK_BetterColorPicker v1.0 (Select color from anywhere on screen in maker, useful for copying colors from reference images)"; Types: full_en full extra
Name: "Feature\KK_CharaMakerLoadedSound"; Description: "KK_CharaMakerLoadedSound v1.0 (Makes a sound when maker loads)"; Types: full_en full extra
Name: "Feature\KK_StudioSceneLoadedSound"; Description: "KK_StudioSceneLoadedSound v1.0 (Makes a sound when a scene loads)"; Types: full_en full extra

Name: "Feature\KK_Ahegao"; Description: "KK_Ahegao v1.8 (Make girl cum 3 times for ahegao)"; Types: full_en full extra
Name: "Feature\Pupils"; Description: "Smaller Heart Pupil v1.1 (Better-looking ahegao eyes)"; Types: full_en full extra
Name: "Feature\OutdoorSex"; Description: "Super Outdoor Sex 2.0 (More H locations on some maps)"; Types: full_en full extra

Name: "Feature\KK_BecomeTrap"; Description: "Koikatsu: Become Trap v1.1 (Can mark a male as a trap in maker, changes gameplay)"; Types: full_en full extra
Name: "Feature\KK_EyeShaking"; Description: "KK_EyeShaking v1.0 (Adds excited eyes effect to H scenes)"; Types: full_en full extra
Name: "Feature\Gameplay"; Description: "Gameplay mod v1.4 (Can force no condom insert, load 99 characters in school, other tweaks)"; Types: full_en full extra
Name: "Feature\KK_NightDarkener"; Description: "KK_NightDarkener v1.1 (Makes H scenes at night much darker)"; Types: extra
Name: "Feature\KK_ExperienceLogic"; Description: "KK_ExperienceLogic v1.0 (Girls can get experienced status with only vaginal or only anal experience)"; Types: full_en full extra

Name: "Feature\Bra"; Description: "Bra Push-Up Mod / KK_Kiyase 0.2.0 (Bras affect breast shape)"; Types: extra
Name: "Feature\KK_ForceHighPoly"; Description: "KK_ForceHighPoly v1.2 (Full-quality characters in school, enable in plugin settings)"; Types: full_en full extra

Name: "Feature\GraphicsSettings"; Description: "GraphicsSettings 2018-11-04 (More game settings, allows better/worse quality)"; Types: extra
Name: "Feature\DefaultParamEditor"; Description: "DefaultParamEditor 2018-11-04 (Set custom default studio settings)"; Types: full_en full extra

Name: "Feature\Colliders"; Description: "KK_Colliders v1.0 and FloorCollider v0.1 (Add physics to characters)"; Types: full_en full extra

Name: "Feature\ClothingStateMenu"; Description: "ClothingStateMenu v2.3 (Can undress in chara maker and in H scenes)"; Types: full_en full extra
Name: "Feature\HeightBar"; Description: "HeightBar v2.0 (Can measure character height in centimeters)"; Types: full_en full extra
Name: "Feature\KK_RemoveToRecycleBin"; Description: "KK_RemoveToRecycleBin v1.0 (Prevents accidentally losing cards by overwriting them)"; Types: full_en full extra

Name: "Feature\KK_RandomCharacterGenerator"; Description: "KK_RandomCharacterGenerator v1.0 (Adds character randomization function to chara maker)"; Types: full_en full extra
Name: "Feature\KK_UniformUniforms"; Description: "KK_UniformUniforms 17/04/2019 beta (Allows easily changing uniforms for the entire class, like in AA2)"; Types: extra

Name: "Feature\KK_ANIMATIONOVERDRIVE"; Description: "KK_ANIMATIONOVERDRIVE (Unlock animation speed in studio, type in the text box)"; Types: full_en full extra

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "MISC"; Description: "{cm:CompMISC}";

Name: "MISC\FPS"; Description: "FPS Counter v1.3 (Useful for performance testing)"; Types: extra
Name: "MISC\Trainer"; Description: "Cheat tools v2.3 (Trainer and debugger)"; Types: full_en full extra

Name: "MISC\UnlockHPositions"; Description: "UnlockHPositions 2018-11-04 hotfix (Unlocks all positions)"; Types: extra
Name: "MISC\FullSave"; Description: "Unlock all events and memories"; Types: extra

;Name: "MISC\SaveEditor"; Description: "Koikatsu Save Data Editor V12 by kiletw"; Types: extra
Name: "MISC\Meme"; Description: "Custom intro voices v5 (is this a Jojo reference?)"; Types: extra

Name: "MISC\FIX"; Description: "Fix game registry (e.g. after moving to different folder)"; Types: bare full_en full extra

[Files]
Source: "HelperLib.dll"; DestDir: "{app}"; Flags: dontcopy

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Excludes: "\UserData\bg\*,\UserData\cardframe\*,\UserData\chara\*,\UserData\coordinate\*,\UserData\frame\*,\UserData\Studio\scene\*"; Components: Patch
Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks\UserData\*"; DestDir: "{app}\UserData"; Flags: ignoreversion recursesubdirs; Components: Patch\UserData
Source: "Input\_Patch\koikatu_02plus_cdp0201hbtks_as\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch; Check: AfterSchoolInstalled

Source: "Input\_Patch\koikatu_03vr_d0111\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Patch\VR; Check: VRInstalled

Source: "Input\BepInEx\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: BepInEx; Check: "not IsWin64"
Source: "Input\BepInEx\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: BepInEx; Check: IsWin64
Source: "Input\BepInEx_Dev\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev;

Source: "Input\BepisPlugins\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepisPlugins
; Create empty IPA directory if it doesn't exist to avoid the IPA dir doesn't exist message on game start
;Source: "Input\BepisPlugins.IPAdir\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepisPlugins

Source: "Input\KKAPI.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: KKAPI

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_TL\KoikatsuImageTranslation\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\UItranslation

Source: "Input\_TL\KoikatsuTranslation-master\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Excludes: UserData; Components: TL\EnglishTranslation
Source: "Input\_TL\KoikatsuTranslation-master\UserData\*"; DestDir: "{app}\UserData"; Flags: ignoreversion recursesubdirs; Components: TL\EnglishTranslation\UserData
Source: "Input\_TL\KoikatsuTranslation-master\UserData\names\*"; DestDir: "{app}\UserData\names"; Flags: ignoreversion recursesubdirs; Components: TL\EnglishTranslation

Source: "Input\_TL\Koikatsu-Translations-master\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Excludes: UserData; Components: TL\EnglishTranslation2
Source: "Input\_TL\Plugin translations\*"; DestDir: "{app}\BepInEx\translation\Text\Plugins"; Flags: ignoreversion recursesubdirs; Excludes: UserData; Components: TL\Plugins
Source: "Input\_TL\translation_eng.nicknames 1.3 BadOne\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\romanization

Source: "Input\_TL\[Koikatu English Launchers] [v1.0]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\EnglishLauncher
Source: "Input\_TL\KK_Subtitles.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: TL\KK_Subtitles

Source: "Input\_TL\XUnity.AutoTranslator-BepIn\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator
Source: "Input\_TL\XUnity.AutoTranslator-custom_config\AutoTranslatorConfig.ini"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Uncensor\\KK_UncensorSelector\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: UNC\Selector
Source: "Input\_Uncensor\Uncensors and body mods\*"; DestDir: "{app}\mods\Uncensors and body mods"; Flags: ignoreversion recursesubdirs; Components: UNC\Selector\Pack

Source: "Input\_Uncensor\[moderchan]Tongue Texture v1.1.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: UNC\Tongue

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Content\Sideloader Modpack\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Content\Modpack
Source: "Input\_Content\ModBoneImplantor.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs solidbreak; Components: Content\Modpack
Source: "Input\_Content\Sideloader Modpack - Studio\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Content\ModpackStudio
Source: "Input\_Content\KK_GUIDMigration\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_GUIDMigration
Source: "Input\_Content\KK_ClothingUnlocker.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion solidbreak; Components: Content\KK_ClothingUnlocker
Source: "Input\_Content\KK_HairAccessoryCustomizer.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion solidbreak; Components: Content\KK_HairAccessoryCustomizer

Source: "Input\_Content\MoreAccessories.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion solidbreak; Components: Content\MoreAccessories
Source: "Input\_Content\KKABMX\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: Content\KKABMX
Source: "Input\_Content\Koikatsu Overlay Mods\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: Content\KSOX
Source: "Input\_Content\KK_SkinEffects.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: Content\KSOX\KK_SkinEffects
Source: "Input\_Content\KK_InvisibleBody.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Content\KK_InvisibleBody
Source: "Input\_Content\NodesConstraints.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Content\NodesConstraints
Source: "Input\_Content\KKPE\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KKPE
Source: "Input\_Content\KK_MoreAccessoryParents.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Content\KK_MoreAccessoryParents

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Fix\FixCompilation.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\FixCompilation
Source: "Input\_Fix\KK_CutsceneLockupFix.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_CutsceneLockupFix
Source: "Input\_Fix\KK_PersonalityCorrector.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\KK_PersonalityCorrector
Source: "Input\_Fix\KK_MiscFixes.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\KK_MiscFixes
Source: "Input\_Fix\KK_ListOverride\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_ListOverride

Source: "Input\_Fix\KK_InputHotkeyBlock.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\KK_InputHotkeyBlock
Source: "Input\_Fix\FixShaderDropdown.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\FixShaderDropdown
Source: "Input\_Fix\HideStudioUI.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\HideStudioUI
Source: "Input\_Fix\HideHInterface.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\HideHInterface

Source: "Input\_Fix\CharaStateX.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\CharaStateX
Source: "Input\_FIX\KK_ReloadCharaListOnChange.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\KK_ReloadCharaListOnChange

Source: "Input\_FIX\Liquid extension\*"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: FIX\LiquidExtension

;Source: "Input\_Fix\[Character Database][various] fixed\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: FIX\URL

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Feature\KKUS.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KKUS
Source: "Input\_Feature\DragAndDrop.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\DragAndDrop
Source: "Input\_Feature\KK_BrowserFolders.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_BrowserFolders
Source: "Input\_Feature\KK_PoseFolders.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_PoseFolders
Source: "Input\_Feature\KK_ClothesLoadOption.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_ClothesLoadOption
Source: "Input\_Feature\KK_BetterColorPicker\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_BetterColorPicker
Source: "Input\_Feature\KK_StudioSceneLoadedSound\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_StudioSceneLoadedSound
Source: "Input\_Feature\KK_CharaMakerLoadedSound\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_CharaMakerLoadedSound

Source: "Input\_Feature\KK_Ahegao.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_Ahegao
Source: "Input\_Feature\[DeathWeasel]Smaller Heart Pupil v1.1.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: Feature\Pupils
Source: "Input\_Feature\[uppervolta]Super Outdoor Sex 2.0.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: Feature\OutdoorSex

Source: "Input\_Feature\KK_BecomeTrap_v1.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_BecomeTrap
Source: "Input\_Feature\KK_EyeShaking.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_EyeShaking
Source: "Input\_Feature\KoikatuGameplayMod.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\Gameplay
Source: "Input\_Feature\KK_NightDarkener.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_NightDarkener
Source: "Input\_Feature\KK_ExperienceLogic.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_ExperienceLogic

Source: "Input\_Feature\KK_Kiyase\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\Bra
Source: "Input\_Feature\KK_ForceHighPoly.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_ForceHighPoly

Source: "Input\_Feature\GraphicsSettings.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\GraphicsSettings
Source: "Input\_Feature\DefaultParamEditor\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: Feature\DefaultParamEditor

Source: "Input\_Feature\Colliders\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: Feature\Colliders

Source: "Input\_Feature\ClothingStateMenu.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\ClothingStateMenu
Source: "Input\_Feature\HeightBar.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\HeightBar
Source: "Input\_Feature\KK_RemoveToRecycleBin.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_RemoveToRecycleBin

Source: "Input\_Feature\KK_RandomCharacterGenerator.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_RandomCharacterGenerator
Source: "Input\_Feature\KK_UniformUniforms.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_UniformUniforms

Source: "Input\_Feature\KK_ANIMATIONOVERDRIVE.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: Feature\KK_ANIMATIONOVERDRIVE

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Misc\FPSCounter.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: MISC\FPS
Source: "Input\_Misc\KoikatuCheatTools\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: MISC\Trainer

Source: "Input\_Misc\UnlockHPositions.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: MISC\UnlockHPositions
Source: "Input\_Misc\Full save\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\FullSave

;Source: "Input\_Misc\KoikatuSaveDataEdit\*"; DestDir: "{app}\_Tools\KoikatuSaveDataEdit"; Flags: ignoreversion recursesubdirs; Components: MISC\SaveEditor
Source: "Input\_Misc\Memes\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\Meme

[InstallDelete]
; Clean up old translations
Type: filesandordirs; Name: "{app}\BepInEx\translation\Images"; Components: TL\UItranslation
Type: filesandordirs; Name: "{app}\BepInEx\translation\Text"; Components: TL\EnglishTranslation
Type: filesandordirs; Name: "{app}\BepInEx\translation\scenario"; Components: TL\EnglishTranslation2
;Type: files; Name: "{app}\BepInEx\MakerLag.dll"; Components: FIX\FixCompilation
Type: files; Name: "{app}\BepInEx\KKSceneBrowserFolders.dll"; Components: Feature\KK_BrowserFolders
Type: files; Name: "{app}\InitSettingGameStudioVREN.exe"; Components: TL\EnglishLauncher

; Clean up old modpacks
Type: filesandordirs; Name: "{app}\mods\Sideloader Only Mods"; Components: Content\Modpack
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack"; Components: Content\Modpack
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Studio"; Components: Content\ModpackStudio
Type: filesandordirs; Name: "{app}\BepInEx\introclips"; Components: MISC\Meme

; Always not necessary
Type: files; Name: "{app}\0Harmony.dll"
Type: files; Name: "{app}\BepInEx.dll"
Type: files; Name: "{app}\Mono.Cecil.dll"

; Junk
Type: files; Name: "{app}\*.log"
Type: files; Name: "{app}\*.pdb"
; Yikes, someone extracted a sideloader mod...
Type: files; Name: "{app}\manifest.xml"

; Needed to migrate from BepInEx 3.x to 4.x
Type: files; Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx

; Potentially incompatible, outdated or buggy plugins
Type: files; Name: "{app}\mods\atari2.1 (normal bust).zipmod"
Type: files; Name: "{app}\BepInEx\IPA\KoikPlugins.dll"
Type: files; Name: "{app}\BepInEx\KK_ForceHighPoly.dll"
Type: files; Name: "{app}\BepInEx\KKSubs.dll"
Type: files; Name: "{app}\BepInEx\HSubs.dll"
Type: files; Name: "{app}\BepInEx\FixCompilation.dll"
Type: files; Name: "{app}\BepInEx\KK_Ahegao.dll"
Type: files; Name: "{app}\BepInEx\ObjectTreeDebugKK.dll"; Components: MISC\Trainer
Type: files; Name: "{app}\BepInEx\MakerAPI.dll"; Components: KKAPI
Type: files; Name: "{app}\BepInEx\KK_AnimationController.dll"; Components: Content\NodesConstraints

; Clean up old uncensors
Type: filesandordirs; Name: "{app}\mods\Uncensor"; Components: UNC\Selector
Type: filesandordirs; Name: "{app}\mods\Uncensors and body mods"; Components: UNC\Selector
Type: files; Name: "{app}\BepInEx\Demosaic.dll"; Components: UNC\Selector
Type: files; Name: "{app}\BepInEx\CartoonUncensor.dll"; Components: UNC\Selector
Type: files; Name: "{app}\BepInEx\AlexaeBubbleGum.dll"; Components: UNC\Selector

; Patch resets all assembly modifications so these files are useless, need to run patcher again anyways
;Type: files; Name: "{app}\Koikatu_Data\Managed\0Harmony.dll"; Components: Patch
;Type: files; Name: "{app}\Koikatu_Data\Managed\BepInEx.dll"; Components: Patch
;Type: files; Name: "{app}\CharaStudio_Data\Managed\0Harmony.dll"; Components: Patch
;Type: files; Name: "{app}\CharaStudio_Data\Managed\BepInEx.dll"; Components: Patch
;Type: files; Name: "{app}\KoikatuVR_Data\Managed\0Harmony.dll"; Components: Patch
;Type: files; Name: "{app}\KoikatuVR_Data\Managed\BepInEx.dll"; Components: Patch
;Type: files; Name: "{app}\Koikatu_Data\Managed\BepInEx.Bootstrapper.dll"; Components: Patch
;Type: files; Name: "{app}\CharaStudio_Data\Managed\BepInEx.Bootstrapper.dll"; Components: Patch
;Type: files; Name: "{app}\KoikatuVR_Data\Managed\BepInEx.Bootstrapper.dll"; Components: Patch

; Replaced with a fresh version, so no need for backups
;Type: files; Name: "{app}\Koikatu_Data\Managed\UnityEngine.dll.bak"; Components: Patch
;Type: files; Name: "{app}\CharaStudio_Data\Managed\UnityEngine.dll.bak"; Components: Patch
;Type: files; Name: "{app}\KoikatuVR_Data\Managed\UnityEngine.dll.bak"; Components: Patch

; IPA, useless because patched assemblies are replaced
;Type: files; Name: "{app}\Koikatu_Data\Managed\IllusionInjector.dll"; Components: Patch
;Type: files; Name: "{app}\Koikatu_Data\Managed\IllusionPlugin.dll"; Components: Patch
;Type: files; Name: "{app}\Koikatu_Data\Managed\IllusionPlugin.xml"; Components: Patch
;Type: files; Name: "{app}\CharaStudio_Data\Managed\IllusionInjector.dll"; Components: Patch
;Type: files; Name: "{app}\CharaStudio_Data\Managed\IllusionPlugin.dll"; Components: Patch
;Type: files; Name: "{app}\CharaStudio_Data\Managed\IllusionPlugin.xml"; Components: Patch
;Type: files; Name: "{app}\KoikatuVR_Data\Managed\IllusionInjector.dll"; Components: Patch
;Type: files; Name: "{app}\KoikatuVR_Data\Managed\IllusionPlugin.dll"; Components: Patch
;Type: files; Name: "{app}\KoikatuVR_Data\Managed\IllusionPlugin.xml"; Components: Patch
Type: files; Name: "{app}\IPA.exe"; Components: Patch

; Clean dlls completely to fix problems with copied/unnecessary/old dlls. All dlls are included in the patch data
Type: filesandordirs; Name: "{app}\CharaStudio_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\CharaStudio_Data\Mono"; Components: Patch
Type: filesandordirs; Name: "{app}\Koikatu_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\Koikatu_Data\Mono"; Components: Patch
Type: filesandordirs; Name: "{app}\KoikatuVR_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\KoikatuVR_Data\Mono"; Components: Patch

[Registry]
Root: HKCU; Subkey: "Software\Illusion"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"; ValueType: string; ValueName: "INSTALLDIR"; ValueData: "{app}\"; Components: MISC\FIX

[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Components: TL\EnglishLauncher; Flags: unchecked
Name: desktopicon\jp; Description: "{cm:TaskIcon}"; Components: not TL\EnglishLauncher; Flags: unchecked
;Name: editordesktopicon; Description: "Create a save editor desktop icon"; Components: MISC\SaveEditor; Flags: unchecked
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked
Name: delete\Listfiles; Description: "{cm:TaskDeleteLst}"
Name: fixSideloaderDupes; Description: "{cm:TaskSideDupes}";
Name: PW; Description: "{cm:TaskPW}"; Flags: unchecked
; IPA is always removed, can't go around that. Unchecking is disabled in code, this task has to stay at the same index for it to work
Name: IPA; Description: "{cm:TaskIPA}";

[Icons]
Name: "{userdesktop}\{#NAME}"; Filename: "{app}\InitSettingEN.exe"; IconFilename: "{app}\InitSettingEN.exe"; WorkingDir: "{app}\"; Comment: "Koikatsu English launcher"; Tasks: desktopicon
Name: "{userdesktop}\{#NAME}"; Filename: "{app}\InitSetting.exe"; IconFilename: "{app}\InitSetting.exe"; WorkingDir: "{app}\"; Comment: "{cm:IconGame}"; Tasks: desktopicon\jp
;Name: "{userdesktop}\Koikatsu save editor"; Filename: "{app}\_Tools\KoikatuSaveDataEdit\gui.exe"; IconFilename: "{app}\_Tools\KoikatuSaveDataEdit\gui.exe"; WorkingDir: "{app}\_Tools\KoikatuSaveDataEdit\"; Comment: "Koikatsu save editor"; Tasks: editordesktopicon

[Run]
Filename: "{app}\InitSettingEN.exe"; Description: "{cm:RunGame}"; Flags: postinstall runascurrentuser nowait skipifsilent skipifdoesntexist; Components: TL\EnglishLauncher
Filename: "{app}\InitSetting.exe"; Description: "{cm:RunGame}"; Flags: postinstall runascurrentuser nowait skipifsilent skipifdoesntexist; Components: not TL\EnglishLauncher

Filename: "https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu/Technical_Help"; Description: "{cm:RunWiki}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
Filename: "https://discord.gg/Szumqcu"; Description: "{cm:RunDiscord}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

Filename: "http://www.hongfire.com/forum/forum/hentai-lair/hentai-game-discussion/5921249-illusion-koikatu-コイカツ！-discussion-and-faq"; Description: "{cm:RunHF}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent

; If user didn't select new bepinex install or if debug version is selected, run old version patcher if it exists
Filename: "{app}\BepInEx.Patcher.exe"; Flags: runascurrentuser skipifdoesntexist waituntilterminated; Description: "Setting up BepInEx for dnSpy debugging"

[Code]
procedure FixConfig(path: String);
external 'FixConfig@files:HelperLib.dll stdcall';

procedure SetConfigDefaults(path: String);
external 'SetConfigDefaults@files:HelperLib.dll stdcall';

procedure RemoveJapaneseCards(path: String);
external 'RemoveJapaneseCards@files:HelperLib.dll stdcall';

procedure RemoveNonstandardListfiles(path: String);
external 'RemoveNonstandardListfiles@files:HelperLib.dll stdcall';

procedure RemoveSideloaderDuplicates(path: String);
external 'RemoveSideloaderDuplicates@files:HelperLib.dll stdcall';

function VRInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\KoikatuVR_Data\resources.assets'));
end;

function AfterSchoolInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\etcetra\list\config\20.unity3d'));
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectTasks then
  begin
    // Disable IPA task to keep it checked. Task count can change and it's always the last one so use the Count
    WizardForm.TasksList.ItemEnabled[WizardForm.TasksList.Items.Count - 1] := False;

    // If garbage plugins are detected, delete all old mods by default
    if(FileExists(ExpandConstant('{app}\BepInEx\CardCacher.dll')) or FileExists(ExpandConstant('{app}\BepInEx\0Harmony.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Assembly-CSharp.dll'))) then
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
    
    WizardForm.ComponentsList.Checked[1] := VRInstalled();
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
    if (not FileExists(ExpandConstant('{app}\Koikatu.exe'))) then
    begin
      if(SuppressibleMsgBox(ExpandConstant('{cm:MsgExeNotFound}'), mbError, MB_YESNO, 0) = IDNO) then
        Result := False;
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
      // Check for file corruptions
      if (not FileExists(ExpandConstant('{app}\abdata\sound\setting\object\00.unity3d')) or not FileExists(ExpandConstant('{app}\abdata\sound\setting\sound3dsettingdata\00.unity3d')) or not FileExists(ExpandConstant('{app}\abdata\sound\setting\soundsettingdata\00.unity3d'))) then
      begin
        MsgBox(ExpandConstant('{cm:MsgMissingGameFiles}'), mbError, MB_OK);
        Result := False;
      end
      else
      begin
        // Check for missing paid DLC
        if not FileExists(ExpandConstant('{app}\abdata\etcetra\list\config\17.unity3d')) then
        begin
          SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC1}'), mbInformation, MB_OK, 0);
        end;
        if not AfterSchoolInstalled() then
        begin
          SuppressibleMsgBox(ExpandConstant('{cm:MsgMissingDLC2}'), mbInformation, MB_OK, 0);
        end;
        
        WizardForm.ComponentsList.Checked[1] := VRInstalled();
        WizardForm.ComponentsList.ItemEnabled[1] := VRInstalled();
      end;

      // Check for extracted zipmods
      if FileExists(ExpandConstant('{app}\manifest.xml')) then
      begin
        SuppressibleMsgBox(ExpandConstant('{cm:MsgExtractedZipmod}'), mbError, MB_OK, 0);
      end;
    end;
  end;

  // After install completes
  if (CurPageID = wpFinished) then
  begin
    // Delete Japanese versions of cards and bgs if English versions are installed (only those with different names)
    if IsComponentSelected('TL\EnglishTranslation\UserData') then
        RemoveJapaneseCards(ExpandConstant('{app}'));
    // Always clean up sideloader mods in case user already messed up
    if IsComponentSelected('fixSideloaderDupes') then
        RemoveSideloaderDuplicates(ExpandConstant('{app}'));
        
    FixConfig(ExpandConstant('{app}'));
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
    Exec('taskkill', '/F /IM KoikatuVR.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM InitSetting.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM InitSettingEN.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM InitSettingGameStudioVREN.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM BepInEx.Patcher.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);

    // Fix file permissions
    //if (FileExists('takeown'))
    Exec('takeown', ExpandConstant('/f "{app}" /r /SKIPSL /d y'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    //if (FileExists('icacls'))
    Exec('icacls', ExpandConstant('"{app}" /grant everyone:F /t /c /l'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
  except
    ShowExceptionMessage();
  end;
  
  // Backup plugin settings
  if (not IsTaskSelected('delete\Config')) then
    FileCopy(ExpandConstant('{app}\BepInEx\config.ini'), ExpandConstant('{app}\config.ini'), false);
  
  // Remove BepInEx folder
  if (IsTaskSelected('delete\Plugins')) then
    DelTree(ExpandConstant('{app}\BepInEx'), True, True, True);
  
  if (not IsTaskSelected('delete\Config')) then
  begin
    // Restore the settings and remove the backup
    FileCopy(ExpandConstant('{app}\config.ini'), ExpandConstant('{app}\BepInEx\config.ini'), false);
    DeleteFile(ExpandConstant('{app}\config.ini'));
  end
  else
  begin
    // Or remove settings
    DeleteFile(ExpandConstant('{app}\BepInEx\config.ini'));
  end;
    
  if (IsTaskSelected('delete\Sidemods')) then
    DelTree(ExpandConstant('{app}\mods'), True, True, True);
    
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
