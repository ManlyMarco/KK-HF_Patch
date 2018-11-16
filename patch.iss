;--------------------------------------------Full game name for naming patch itself and desktop icons
#define NAME "Koikatsu"
;----------------------------------------------------------------------------Current HF Patch version
#define VERSION "2.0"
;----------------------------------------------------------------------------------------------------
#include "_Common\Header.iss"

[Setup] 
Compression=lzma2/ultra64 
;lzma2/ultra64 | zip
LZMAUseSeparateProcess=yes
;LZMADictionarySize=708576
LZMANumFastBytes=273
DiskSpanning=yes
DefaultDirName={reg:HKCU\Software\Illusion\Koikatu\koikatu,INSTALLDIR}

[Types] 
Name: "full"; Description: "Recommended installation" 
Name: "extra"; Description: "Full installation" 
Name: "bare"; Description: "Update and repair"
Name: "none"; Description: "Skip BepInEx install (NOT RECOMMENDED)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom 

[Components]
Name: "Patch"; Description: "Patch and free DLC 10/26 by Illusion + Game repair"; Types: full custom bare none extra; Flags: fixed 
Name: "Patch\UserData"; Description: "Default cards, scenes and backgrounds"; Types: full custom extra; 
Name: "BepInEx"; Description: "BepInEx v4.1 Unity plugin framework (auto-update)"; Types: full custom bare extra; Flags: fixed 
Name: "BepInEx\Dev"; Description: "Developer version with dnSpy debugging"; 
Name: "BepisPlugins"; Description: "BepisPlugins r6"; Types: full custom bare extra; Flags: fixed   

Name: "TL"; Description: "English translation"; Types: full extra
Name: "TL\UItranslation"; Description: "UI Graphics translation v2.5"; Types: full extra
Name: "TL\EnglishStory"; Description: "Koikatsu partial story translation 29-07-2018 by xmex"; Types: full extra
Name: "TL\EnglishTranslation"; Description: "bbepis/KoikatsuTranslation 4-09-2018"; Types: full extra 
Name: "TL\EnglishTranslation\UserData"; Description: "Translated cards, scenes and backgrounds (overrides defaults)"; Types: full extra 
Name: "TL\romanization"; Description: "Nickname romanization 1.3 by BadOne"; Types: full extra
Name: "TL\EnglishLauncher"; Description: "English Launchers v1.0 by user539"; Types: full extra
Name: "TL\AutoTranslator"; Description: "XUnity.AutoTranslator 2.15.4"; Types: full extra      
;Name: "TL\HSubs"; Description: "KKSubs 0.8.6 (Translated subtitles)"; Types: extra

Name: "UNC"; Description: "Demosaic 1.0 by AUTOMATIC1111"; Types: full extra; Flags: checkablealone 
Name: "UNC\Male"; Description: "Male uncensor"; Types: full extra     
Name: "UNC\Male\Normal"; Description: "whatsadick4 - Skin color"; Flags: exclusive
Name: "UNC\Male\NormalBalls"; Description: "whatsadick4 - Skin color with balls"; Flags: exclusive; Types: full extra
Name: "UNC\Male\Dark"; Description: "whatsadick4 - Dark color"; Flags: exclusive
Name: "UNC\Male\DarkBalls"; Description: "whatsadick4 - Dark color with balls"; Flags: exclusive 
Name: "UNC\Male\LO"; Description: "KK LO pussy v0.5 - Textured with balls"; Flags: exclusive

Name: "UNC\Female"; Description: "Female uncensor"; Types: full extra 
Name: "UNC\Female\Chan"; Description: "Normal vagina model by moderchan"; Types: full extra; Flags: exclusive
Name: "UNC\Female\LO"; Description: "KK LO pussy v0.5 (Loli slit)"; Flags: exclusive 
Name: "UNC\Tongue"; Description: "Tongue Texture v1.1 by moderchan"; Types: full extra

Name: "Modpack"; Description: "Sideloader Modpack 15-11-2018 (Lots of additional content, needed to properly load most character cards and scenes)"; Types: full extra

Name: "FIX"; Description: "Fixes and improvements"; Types: extra                                                                                                                                           
Name: "FIX\MoreAccessories"; Description: "MoreAccessories 1.0.0 by Joan6694 (Needed to use and edit some characters)"; Types: full extra
Name: "FIX\KKABMX"; Description: "KKABMX v1.0 (Needed to use and edit some characters)"; Types: full extra          
Name: "FIX\KKPE"; Description: "KKPE 1.1.0 by Joan6694 (Advanced studio controls)"; Types: full extra  
Name: "FIX\KK_GUIDMigration"; Description: "KK_GUIDMigration v1.1.1 (Improves card and scene compatibility)"; Types: full extra  
Name: "FIX\KK_CutsceneLockupFix"; Description: "KK_CutsceneLockupFix v1.0 (Fixes some mods crashing story)"; Types: extra full 
Name: "FIX\FixCompilation"; Description: "FixCompilation 2018-11-04 (Improves performance)"; Types: full extra
Name: "FIX\FixShaderDropdown"; Description: "FixShaderDropdown v1.0 (Expands shader menu)"; Types: full extra 
Name: "FIX\DefaultParamEditor"; Description: "DefaultParamEditor 2018-11-04 (Set custom default studio settings) + Improved setting set"; Types: full extra 
Name: "FIX\KK_InvisibleBody"; Description: "KK_InvisibleBody v1.1 (Needed for some scenes)"; Types: full extra

Name: "FIX\OutdoorSex"; Description: "Super Outdoor Sex 2.0 (More H locations on some maps)"; Types: extra full 
Name: "FIX\KK_CharaMakerLoadedSound"; Description: "KK_CharaMakerLoadedSound v1.0 (Makes a sound when maker loads)"; Types: extra full
Name: "FIX\KK_StudioSceneLoadedSound"; Description: "KK_StudioSceneLoadedSound v1.0 (Makes a sound when a scene loads)"; Types: extra full
        
Name: "FIX\Gameplay"; Description: "Gameplay mod v1.0 (Can force no condom insert, other tweaks)"; Types: extra 
Name: "FIX\Bra"; Description: "Bra Push-Up Mod v0.1.1 (Bras affect breast shape)"; Types: extra 
Name: "FIX\Collider"; Description: "Atari 2.1 by Stinger722 (Breast and hair collisions)"; Types: extra 
Name: "FIX\SkirtFix"; Description: "Vanilla Skirt Fix by Stinger722 (Less clipping)"; Types: extra   
Name: "FIX\Pupils"; Description: "Smaller Heart Pupil v1.1 (Better-looking ahegao eyes)"; Types: extra             
Name: "FIX\KK_Ahegao"; Description: "KK_Ahegao v1.6 (Make girl cum 3 times for ahegao)"; Types: extra          
Name: "FIX\GraphicsSettings"; Description: "GraphicsSettings 2018-11-04 (More game settings, allows better quality)"; Types: extra                 
Name: "FIX\KK_ForceHighPoly"; Description: "KK_ForceHighPoly v1.1 (Full-quality characters in school, very resource-heavy)"; Types: extra 

Name: "MISC"; Description: "Other"; 
Name: "MISC\URL"; Description: "Use custom Character Database (Connects to non-IP-blocked character DB)"; Types: full bare custom extra
Name: "MISC\DragAndDrop"; Description: "Drag and drop character cards v1.2.1"; Types: full extra
Name: "MISC\KK_ReloadCharaListOnChange"; Description: "KK_ReloadCharaListOnChange v1.2"; Types: full extra
Name: "MISC\FPS"; Description: "FPS Counter v1.2"; Types: extra 
Name: "MISC\Trainer"; Description: "Cheat tools v2.0 (Trainer and debugger)"; Types: extra
Name: "MISC\FullSave"; Description: "Unlock all events and memories"; Types: extra
Name: "MISC\UnlockHPositions"; Description: "UnlockHPositions 2018-11-04 (Unlocks all positions)"; Types: extra
;Name: "MISC\SaveEditor"; Description: "Koikatsu Save Data Editor V12 by kiletw"; Types: extra
Name: "MISC\Meme"; Description: "Custom intro voices v3 (gachiGasm)"; Types: extra
Name: "MISC\FIX"; Description: "Fix game registry (e.g. after moving to different folder)"; Types: bare full extra
 
[Files]
Source: "HelperLib.dll"; DestDir: "{app}"; Flags: dontcopy

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\koikatu_02plus_cdp1026pfer\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Excludes: "UserData"; Components: Patch
Source: "Input\koikatu_02plus_cdp1026pfer\UserData\*"; DestDir: "{app}\UserData"; Flags: ignoreversion recursesubdirs; Components: Patch\UserData
Source: "Input\Studio_mods\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch
Source: "Input\Bad settings fix\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch

Source: "Input\BepInEx_x86_v4.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: BepInEx; Check: "not IsWin64" 
Source: "Input\BepInEx_x64_v4.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: BepInEx; Check: IsWin64 
Source: "Input\BepInEx_Dev\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev;
Source: "Input\BepisPlugins.r6\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepisPlugins
; Create empty IPA directory if it doesn't exist to avoid the IPA dir doesn't exist message on game start
Source: "Input\BepisPlugins.IPAdir\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepisPlugins

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_TL\Translation_2.5\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\UItranslation
Source: "Input\_TL\[Koikatu English Launchers] [v1.0]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\EnglishLauncher
Source: "Input\_TL\eng_story[29-07-2018]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\EnglishStory
Source: "Input\_TL\KoikatsuTranslation-master[4-09-2018]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Excludes: UserData; Components: TL\EnglishTranslation
Source: "Input\_TL\KoikatsuTranslation-master[4-09-2018]\UserData\*"; DestDir: "{app}\UserData"; Flags: ignoreversion recursesubdirs; Components: TL\EnglishTranslation\UserData
Source: "Input\_TL\XUnity.AutoTranslator-BepIn-2.15.4\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator
Source: "Input\_TL\translation_eng.nicknames 1.3 BadOne\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\romanization             
;Source: "Input\_TL\KKSubs.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: TL\HSubs

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Uncensor\[Demosaic][1.0][AUTOMATIC1111]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: UNC 
Source: "Input\_Uncensor\zipmod.uncensors\[enk][MUncensor]whatsadick4.zipmod"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion; Components: UNC\Male\Normal 
Source: "Input\_Uncensor\zipmod.uncensors\[enk][MUncensor]whatsadick4[rounderBalls].zipmod"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion; Components: UNC\Male\NormalBalls
Source: "Input\_Uncensor\zipmod.uncensors\[enk][MUncensor]whatsadick4[dark].zipmod"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion; Components: UNC\Male\Dark
Source: "Input\_Uncensor\zipmod.uncensors\[enk][MUncensor]whatsadick4[dark+roundBalls].zipmod"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion; Components: UNC\Male\DarkBalls 
Source: "Input\_Uncensor\[Male][Uncensor]KK_LO_pussy_v0.5.zipmod"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion; Components: UNC\Male\LO
 
Source: "Input\_Uncensor\zipmod.uncensors\[enk][FUncensor][moderchan]funcensor01.zipmod"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion; Components: UNC\Female\Chan
Source: "Input\_Uncensor\[Female][Uncensor]KK_LO_pussy_v0.5.zipmod"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion; Components: UNC\Female\LO 
Source: "Input\_Uncensor\[moderchan]Tongue Texture v1.1.zipmod"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Tongue
 
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\Sideloader Modpack\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Modpack

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Fix\MoreAccessories.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\MoreAccessories 
Source: "Input\_Fix\KKPE.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\KKPE 
Source: "Input\_Fix\KKABMX_v1.0\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: FIX\KKABMX 
Source: "Input\_Fix\KK_GUIDMigration\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_GUIDMigration 
Source: "Input\_Fix\FixCompilation.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\FixCompilation 
Source: "Input\_Fix\DefaultParamEditor\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: FIX\DefaultParamEditor 
Source: "Input\_Fix\FixShaderDropdown.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\FixShaderDropdown 
Source: "Input\_Fix\KK_InvisibleBody.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\KK_InvisibleBody 

Source: "Input\_Fix\[uppervolta]Super Outdoor Sex 2.0.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: FIX\OutdoorSex 
Source: "Input\_Fix\KK_StudioSceneLoadedSound\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_StudioSceneLoadedSound 
Source: "Input\_Fix\KK_CharaMakerLoadedSound\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_CharaMakerLoadedSound 
Source: "Input\_Fix\KK_CutsceneLockupFix\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_CutsceneLockupFix 

Source: "Input\_Fix\Koikatu-Gameplay-Mod_v1.0\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: FIX\Gameplay 
Source: "Input\_Fix\Bra_Push-Up_Mod_v0.1.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\Bra 
Source: "Input\_Fix\atari2.1 (normal bust).zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: FIX\Collider 
Source: "Input\_Fix\[Stinger722]Vanilla Skirt Fix.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: FIX\SkirtFix 
Source: "Input\_Fix\[DeathWeasel]Smaller Heart Pupil v1.1.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: FIX\Pupils 
Source: "Input\_Fix\KK_Ahegao.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\KK_Ahegao 
Source: "Input\_Fix\KK_ForceHighPoly.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\KK_ForceHighPoly 
Source: "Input\_Fix\GraphicsSettings.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: FIX\GraphicsSettings 

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
Source: "Input\_Fix\[Character Database][various] fixed\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\URL  
Source: "Input\_Misc\DragAndDrop.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: MISC\DragAndDrop
Source: "Input\_Misc\KK_ReloadCharaListOnChange.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: MISC\KK_ReloadCharaListOnChange 
Source: "Input\_Misc\[FPS Counter][MarC0][v1.2]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\FPS 
Source: "Input\_Misc\CheatTools.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: MISC\Trainer
Source: "Input\_Misc\UnlockHPositions.dll"; DestDir: "{app}\BepInEx"; Flags: ignoreversion; Components: MISC\UnlockHPositions
Source: "Input\_Misc\Full save\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\FullSave 
;Source: "Input\_Misc\KoikatuSaveDataEdit\*"; DestDir: "{app}\_Tools\KoikatuSaveDataEdit"; Flags: ignoreversion recursesubdirs; Components: MISC\SaveEditor 
Source: "Input\_Misc\Memes\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\Meme

[InstallDelete]
; Clean up old translations 
Type: filesandordirs; Name: "{app}\BepInEx\translation\Images"; Components: TL\UItranslation 
Type: filesandordirs; Name: "{app}\BepInEx\translation\Text"; Components: TL\EnglishTranslation
Type: filesandordirs; Name: "{app}\BepInEx\translation\scenario"; Components: TL\EnglishStory   
;Type: files; Name: "{app}\BepInEx\hsubs.dll"; Components: TL\HSubs 
Type: files; Name: "{app}\BepInEx\MakerLag.dll"; Components: FIX\FixCompilation

; Clean up old modpacks 
Type: filesandordirs; Name: "{app}\mods\Uncensor"; Components: UNC 
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack"; Components: Modpack                                                                                                 
Type: filesandordirs; Name: "{app}\mods\Sideloader Only Mods"; Components: Modpack

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
Type: files; Name: "{app}\BepInEx\IPA\KoikPlugins.dll"
Type: files; Name: "{app}\BepInEx\KK_ForceHighPoly.dll"
Type: files; Name: "{app}\BepInEx\KKSubs.dll" 
Type: files; Name: "{app}\BepInEx\FixCompilation.dll"
Type: files; Name: "{app}\BepInEx\ObjectTreeDebugKK.dll"; Components: MISC\Trainer

; Patch resets all assembly modifications so these files are useless, need to run patcher again anyways 
Type: files; Name: "{app}\Koikatu_Data\Managed\0Harmony.dll"; Components: Patch 
Type: files; Name: "{app}\Koikatu_Data\Managed\BepInEx.dll"; Components: Patch 
Type: files; Name: "{app}\CharaStudio_Data\Managed\0Harmony.dll"; Components: Patch 
Type: files; Name: "{app}\CharaStudio_Data\Managed\BepInEx.dll"; Components: Patch 
Type: files; Name: "{app}\KoikatuVR_Data\Managed\0Harmony.dll"; Components: Patch 
Type: files; Name: "{app}\KoikatuVR_Data\Managed\BepInEx.dll"; Components: Patch 
Type: files; Name: "{app}\Koikatu_Data\Managed\BepInEx.Bootstrapper.dll"; Components: Patch 
Type: files; Name: "{app}\CharaStudio_Data\Managed\BepInEx.Bootstrapper.dll"; Components: Patch 
Type: files; Name: "{app}\KoikatuVR_Data\Managed\BepInEx.Bootstrapper.dll"; Components: Patch

; Replaced with a fresh version, so no need for backups 
Type: files; Name: "{app}\Koikatu_Data\Managed\UnityEngine.dll.bak"; Components: Patch
Type: files; Name: "{app}\CharaStudio_Data\Managed\UnityEngine.dll.bak"; Components: Patch 
Type: files; Name: "{app}\KoikatuVR_Data\Managed\UnityEngine.dll.bak"; Components: Patch 

; IPA, useless because patched assemblies are replaced 
Type: files; Name: "{app}\Koikatu_Data\Managed\IllusionInjector.dll"; Components: Patch 
Type: files; Name: "{app}\Koikatu_Data\Managed\IllusionPlugin.dll"; Components: Patch 
Type: files; Name: "{app}\Koikatu_Data\Managed\IllusionPlugin.xml"; Components: Patch 
Type: files; Name: "{app}\CharaStudio_Data\Managed\IllusionInjector.dll"; Components: Patch 
Type: files; Name: "{app}\CharaStudio_Data\Managed\IllusionPlugin.dll"; Components: Patch 
Type: files; Name: "{app}\CharaStudio_Data\Managed\IllusionPlugin.xml"; Components: Patch
Type: files; Name: "{app}\KoikatuVR_Data\Managed\IllusionInjector.dll"; Components: Patch 
Type: files; Name: "{app}\KoikatuVR_Data\Managed\IllusionPlugin.dll"; Components: Patch 
Type: files; Name: "{app}\KoikatuVR_Data\Managed\IllusionPlugin.xml"; Components: Patch 
Type: files; Name: "{app}\IPA.exe"; Components: Patch 

[Registry]
Root: HKCU; Subkey: "Software\Illusion"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\Koikatu\koikatu"; ValueType: string; ValueName: "INSTALLDIR"; ValueData: "{app}\"; Components: MISC\FIX
 
[Tasks]
Name: desktopicon; Description: "Create a game &desktop icon"; Components: TL\EnglishLauncher; Flags: unchecked    
;Name: editordesktopicon; Description: "Create a save editor desktop icon"; Components: MISC\SaveEditor; Flags: unchecked             
Name: delete; Description: "Delete old mods before installation (Recommended if you have issues and when updating very old game installations)"; 
Name: delete\Sidemods; Description: "Delete ALL existing sideloader mods"; Flags: unchecked 
Name: delete\Plugins; Description: "Delete BepInEx folder (Deletes old plugins and translations, and resets plugin settings and AutoTranslator cache. Recommended if you have issues)"; Flags: unchecked 
Name: delete\Listfiles; Description: "Delete custom listfiles (Disables old-style content mods (hardmods). Recommended when upgrading from HF Patch v1.7 or older, or from repacks like flashbangz.)"    
Name: fixSideloaderDupes; Description: "Delete duplicate sideloader mods after installation (Newest versions are kept. Recommended)";  
Name: PW; Description: "Uninstall Patchwork if installed and delete Plugins folder (Optional, will free up some disk space. If you intend to use PW, make sure your version is compatible with the current game update. If you have issues, run the game without PW)"; Flags: unchecked    
; IPA is always removed, can't go around that. Unchecking is disabled in code, this task has to stay at the same index for it to work 
Name: IPA; Description: "Uninstall IPA if installed (Use BepInEx IPA loader instead. Has to be removed for BepInEx to work correctly)";

[Icons]
Name: "{userdesktop}\{#NAME}"; Filename: "{app}\InitSettingGameStudioVREN.exe"; IconFilename: "{app}\InitSettingGameStudioVREN.exe"; WorkingDir: "{app}\"; Comment: "Koikatsu English launcher"; Tasks: desktopicon                                                                                                                                                                                                                    
;Name: "{userdesktop}\Koikatsu save editor"; Filename: "{app}\_Tools\KoikatuSaveDataEdit\gui.exe"; IconFilename: "{app}\_Tools\KoikatuSaveDataEdit\gui.exe"; WorkingDir: "{app}\_Tools\KoikatuSaveDataEdit\"; Comment: "Koikatsu save editor"; Tasks: editordesktopicon

[Run]
Filename: "{app}\InitSettingGameStudioVREN.exe"; Description: "&Run Koikatsu"; Flags: postinstall runascurrentuser nowait skipifsilent skipifdoesntexist unchecked; Components: TL\EnglishLauncher 
Filename: "https://wiki.anime-sharing.com/hgames/index.php?title=Koikatu/Technical_Help"; Description: "Open Koikatsu wiki (FAQ, English manual)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent 
Filename: "https://discord.gg/Szumqcu"; Description: "Join Koikatsu! discord channel (Help, updates, sharing)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent; 

Filename: "http://www.hongfire.com/forum/forum/hentai-lair/hentai-game-discussion/5921249-illusion-koikatu-コイカツ！-discussion-and-faq"; Description: "Open HongFire release thread"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent 

; If user didn't select new bepinex install or if debug version is selected, run old version patcher if it exists
Filename: "{app}\BepInEx.Patcher.exe"; Flags: runascurrentuser skipifdoesntexist waituntilterminated 

[Code]
procedure RemoveJapaneseCards(path: String);
external 'RemoveJapaneseCards@files:HelperLib.dll stdcall';

procedure RemoveNonstandardListfiles(path: String);
external 'RemoveNonstandardListfiles@files:HelperLib.dll stdcall';

procedure RemoveSideloaderDuplicates(path: String);
external 'RemoveSideloaderDuplicates@files:HelperLib.dll stdcall';

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectTasks then
  begin
    // Disable IPA task to keep it checked. Task count can change and it's always the last one so use the Count
    WizardForm.TasksList.ItemEnabled[WizardForm.TasksList.Items.Count - 1] := False;
    
    // If garbage plugins are detected, delete all old mods by default
    if(FileExists(ExpandConstant('{app}\BepInEx\CardCacher.dll'))) then
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 7, coCheckWithChildren);
      
    if (FileExists(ExpandConstant('{app}\BepInEx\IPA\KoikPlugins.dll'))) then
      SuppressibleMsgBox('WARNINIG - KoikPlugins was detected and will be removed if you start installation to avoid potential compatibility issues (settings will not be removed).'#13#10''#13#10'Please follow KoikPlugins manual on how to install it again after patching is done.', mbError, MB_OK, 0);
      
    if (FileExists(ExpandConstant('{app}\manifest.xml'))) then
    begin
      SuppressibleMsgBox('WARNINIG - Most likely a sideloader mod was extracted inside the game directory. Some game files might now be corrupted.'#13#10''#13#10'Repair will be attempted, but if you still have problems you will have to reinstall the game.', mbError, MB_OK, 0);
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 7, coCheckWithChildren);
    end;
    
    if (FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifier.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifierStudio.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\AdditionalBoneModifierStudioNEO.dll')) or FileExists(ExpandConstant('{app}\BepInEx\IPA\HSStudioNEOExtSave.dll')) or FileExists(ExpandConstant('{app}\BepInEx\FlashBangZ.dll'))) then
    begin
      SuppressibleMsgBox('WARNINIG - Incompatible mods have been detected in your game folder! You are using HS mods in Koikatsu, which WILL cause problems. All old mods need to be removed to fix this.'#13#10''#13#10'Note: The FlashBangZ repack is known to include incompatible and useless mods that cause issues. In case you use it, in the future consider using the original game installer instead. It will most likely save you a lot of grief.', mbError, MB_OK, 0);
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 7, coCheckWithChildren);
    end;
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
      if(SuppressibleMsgBox('WARNINIG - Koikatu.exe was not found in selected directory. This patch has to be installed directly to the main Koikatsu game directory in order to work properly.'#13#10''#13#10'Are you sure that this directory is correct?', mbError, MB_YESNO, 0) = IDNO) then
        Result := False;
    end;
  end;
  
  if (CurPageID = wpReady) then
  begin
    if (IsTaskSelected('delete\Plugins')) then
      DelTree(ExpandConstant('{app}\BepInEx'), True, True, True);
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
  end;
end;

