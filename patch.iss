;--------------------------------------------Full game name for naming patch itself and desktop icons
#define NAME "Koikatu"
;----------------------------------------------------------------------------Current HF Patch version
#define VERSION "1.7"
;----------------------------------------------------------------------------------------------------
#include "_Common\Header.iss"

[Setup] 
Compression=lzma2/ultra64 
;lzma2/ultra64 | zip
LZMAUseSeparateProcess=yes
;LZMADictionarySize=708576
;LZMANumFastBytes=273
DiskSpanning=yes
DefaultDirName={reg:HKCU\Software\Illusion\Koikatu\koikatu,INSTALLDIR}

[Types] 
Name: "full"; Description: "Recommended installation" 
Name: "extra"; Description: "Full installation" 
Name: "bare"; Description: "Update and repair"
Name: "none"; Description: "Skip BepInEx install (NOT RECOMMENDED)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom 
 
[Components]
Name: "Patch"; Description: "Patch 08/31 and free DLC by Illusion + Game repair"; Types: full custom bare none extra; Flags: fixed 
Name: "BepInEx"; Description: "BepInEx v4.1 Unity plugin framework"; Types: full custom bare extra; Flags: fixed 
Name: "BepInEx\Dev"; Description: "Developer version with dnSpy debugging"; 
Name: "BepisPlugins"; Description: "BepisPlugins r5.1"; Types: full custom bare extra; Flags: fixed 

Name: "TL"; Description: "English translation"; Types: full extra
Name: "TL\UItranslation"; Description: "UI Graphics translation v2.4"; Types: full extra
Name: "TL\EnglishStory"; Description: "Koikatsu partial story translation 29-07-2018 by xmex"; Types: full extra
Name: "TL\EnglishTranslation"; Description: "bbepis/KoikatsuTranslation 4-09-2018"; Types: full extra 
Name: "TL\romanization"; Description: "Nickname romanization 1.3 by BadOne"; Types: full extra
Name: "TL\EnglishLauncher"; Description: "English Launchers v1.0 by user539"; Types: full extra
Name: "TL\AutoTranslator"; Description: "XUnity-Development/XUnity.AutoTranslator 2.12.0"; Types: full extra      
Name: "TL\HSubs"; Description: "kkdevs/HSubs v4"; Types: full extra

Name: "UNC"; Description: "Demosaic 1.0 by AUTOMATIC1111"; Types: full extra; Flags: checkablealone 
Name: "UNC\Male"; Description: "Male uncensor"; Types: full extra
Name: "UNC\Male\Normal"; Description: "whatsadick4 - Skin color"; Flags: exclusive
Name: "UNC\Male\NormalBalls"; Description: "whatsadick4 - Skin color with balls"; Types: full extra; Flags: exclusive 
Name: "UNC\Male\Dark"; Description: "whatsadick4 - Dark color"; Flags: exclusive
Name: "UNC\Male\DarkBalls"; Description: "whatsadick4 - Dark color with balls"; Flags: exclusive 
Name: "UNC\Male\LO"; Description: "KK LO pussy v0.5 - Textured with balls"; Flags: exclusive
 
Name: "UNC\Female"; Description: "Female uncensor"; Types: full extra 
Name: "UNC\Female\Chan"; Description: "Normal vagina model by moderchan"; Types: full extra; Flags: exclusive
Name: "UNC\Female\LO"; Description: "KK LO pussy v0.5 (aka Kitty, better loli slit)"; Flags: exclusive 
Name: "UNC\Tongue"; Description: "Tongue Texture v1.1 by moderchan"; Types: full extra

Name: "Modpack"; Description: "Sideloader Modpack 5-09-2018 (Lots of additional content, needed for some character cards and scenes)"; Types: full extra
Name: "Modpack\Hard"; Description: "Hardmod Pack 5-09-2018 (Greatly improves compatibility with character cards and scenes, but mods show up twice on lists)"; Types: extra
 
Name: "FIX"; Description: "Fixes and improvements"; Types: extra 
Name: "FIX\Gameplay"; Description: "Gameplay mod v1.0 by MarC0 (Can force no condom insert, other tweaks)"; Types: extra 
Name: "FIX\Bra"; Description: "Bra Push-Up Mod v0.1.1 (Bras affect breast shape)"; Types: extra 
Name: "FIX\Collider"; Description: "Atari 2.1 by Stinger722 (Breast and hair collisions)"; Types: extra 
Name: "FIX\SkirtFix"; Description: "Vanilla Skirt Fix by Stinger722 (Less clipping)"; Types: extra 
Name: "FIX\OutdoorSex"; Description: "Super Outdoor Sex 2.0 (More H locations on some maps)"; Types: extra

Name: "MISC"; Description: "Other"; 
Name: "MISC\URL"; Description: "Use custom Character Database (Connects to non-IP-blocked character DB)"; Types: full bare custom extra
Name: "MISC\DragAndDrop"; Description: "Drag and drop character cards v1.1 by im-mi"; Types: full extra
Name: "MISC\FPS"; Description: "FPS Counter v1.2 by MarC0"; Types: extra 
Name: "MISC\Trainer"; Description: "Trainer / Cheat tools v1.6 by MarC0"; Types: extra
Name: "MISC\FullSave"; Description: "100% Save";
Name: "MISC\Meme"; Description: "Custom intro voices v2 (top kek)"; Types: extra
Name: "MISC\FIX"; Description: "Fix game registry (e.g. after moving to different folder)"; Types: bare
 
[Files]
Source: "HelperLib.dll"; DestDir: "{app}"; Flags: dontcopy

Source: "Input\koikatu_02plus_cdp08mp31_all\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Patch
Source: "Input\BepInEx_x86_v4.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: BepInEx; Check: "not IsWin64" 
Source: "Input\BepInEx_x64_v4.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: BepInEx; Check: IsWin64 
Source: "Input\BepInEx_Dev\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: BepInEx\Dev;
Source: "Input\BepisPlugins.r5.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak createallsubdirs; Components: BepisPlugins

Source: "Input\_TL\Translation_2.4\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\UItranslation
Source: "Input\_TL\[Koikatu English Launchers] [v1.0]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\EnglishLauncher
Source: "Input\_TL\eng_story[29-07-2018]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\EnglishStory
Source: "Input\_TL\KoikatsuTranslation-master[4-09-2018]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\EnglishTranslation
Source: "Input\_TL\XUnity.AutoTranslator-BepIn-2.12.0\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\AutoTranslator
Source: "Input\_TL\translation_eng.nicknames 1.3 BadOne\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\romanization             
Source: "Input\_TL\HSubs v4\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: TL\HSubs

Source: "Input\_Uncensor\[Demosaic][1.0][AUTOMATIC1111]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: UNC 
Source: "Input\_Uncensor\zipmod.uncensors\[enk][MUncensor]whatsadick4.zip"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Male\Normal 
Source: "Input\_Uncensor\zipmod.uncensors\[enk][MUncensor]whatsadick4[rounderBalls].zip"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Male\NormalBalls
Source: "Input\_Uncensor\zipmod.uncensors\[enk][MUncensor]whatsadick4[dark].zip"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Male\Dark
Source: "Input\_Uncensor\zipmod.uncensors\[enk][MUncensor]whatsadick4[dark+roundBalls].zip"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Male\DarkBalls 
Source: "Input\_Uncensor\[Male][Uncensor]KK_LO_pussy_v0.5.zip"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Male\LO
 
Source: "Input\_Uncensor\zipmod.uncensors\[enk][FUncensor][moderchan]funcensor01.zip"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Female\Chan
Source: "Input\_Uncensor\[Female][Uncensor]KK_LO_pussy_v0.5.zip"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Female\LO 
Source: "Input\_Uncensor\[moderchan]Tongue Texture v1.1.zip"; DestDir: "{app}\mods\Uncensor"; Flags: ignoreversion solidbreak; Components: UNC\Tongue
 
Source: "Input\Sideloader Modpack\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Modpack
Source: "Input\Hardmod Pack\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Modpack\Hard
 
Source: "Input\_Fix\Koikatu-Gameplay-Mod_v1.0\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: FIX\Gameplay 
Source: "Input\_Fix\Bra_Push-Up_Mod_v0.1.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: FIX\Bra 
Source: "Input\_Fix\atari2.1 (normal bust).zip"; DestDir: "{app}\mods"; Flags: ignoreversion solidbreak; Components: FIX\Collider 
Source: "Input\_Fix\[Stinger722]Vanilla Skirt Fix.zip"; DestDir: "{app}\mods"; Flags: ignoreversion solidbreak; Components: FIX\SkirtFix 
Source: "Input\_Fix\[uppervolta]Super Outdoor Sex 2.0.zip"; DestDir: "{app}\mods"; Flags: ignoreversion solidbreak; Components: FIX\OutdoorSex 
 
Source: "Input\_Fix\[Character Database][various] fixed\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\URL 
Source: "Input\_Misc\[KoikatuDragAndDrop][1.1][im-mi]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\DragAndDrop
Source: "Input\_Misc\[FPS Counter][MarC0][v1.2]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\FPS 
Source: "Input\_Misc\[Koikatu][CheatTools][v1.6][MarC0]\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\Trainer
Source: "Input\_Misc\Full save\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\FullSave 
Source: "Input\_Misc\Memes\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: MISC\Meme

[InstallDelete]
; Clean up old translations 
Type: filesandordirs; Name: "{app}\BepInEx\translation\Images"; Components: TL\UItranslation 
Type: filesandordirs; Name: "{app}\BepInEx\translation\Text"; Components: TL\EnglishTranslation
Type: filesandordirs; Name: "{app}\BepInEx\translation\scenario"; Components: TL\EnglishStory

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
Name: desktopicon; Description: "Create a &desktop icon"; Components: TL\EnglishLauncher 
Name: delete; Description: "Delete old mods before installation (recommended if you have issues, or when updating an old game install to refresh it)"; 
Name: delete\Sidemods; Description: "Delete sideloader mods folder (Deletes ALL old sideloader mods.)"; Flags: unchecked 
Name: delete\Plugins; Description: "Delete BepInEx plugins folder (Deletes old, potentially outdated or no longer necessary plugins. Resets plugin settings and AutoTranslator cache.)"; Flags: unchecked 
Name: delete\Listfiles; Description: "Delete custom listfiles (Disables old-style content mods (hardmods). Recommended when upgrading from HF Patch v1.2 or older, or from repacks like flashbangz.)"; Flags: unchecked     
Name: delete\PW; Description: "Delete Patchwork install and Plugins folder"; Flags: unchecked     
Name: fixSideloaderDupes; Description: "Remove duplicate sideloader mods (Leave only newest versions, recommended.)"; 

[Icons]
Name: "{userdesktop}\{#NAME}"; Filename: "{app}\InitSettingGameStudioVREN.exe"; IconFilename: "{app}\InitSettingGameStudioVREN.exe"; WorkingDir: "{app}\"; Comment: "Koikatsu English launcher"; Tasks: desktopicon

[Run]
Filename: "{app}\InitSettingGameStudioVREN.exe"; Description: "&Run Koikatu"; Flags: postinstall runascurrentuser nowait skipifsilent skipifdoesntexist unchecked; Components: TL\EnglishLauncher 
Filename: "https://discord.gg/Szumqcu"; Description: "Visit Koikatsu! discord channel"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent; 

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

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;   
begin
  // allow the setup turning to the next page
  Result := True;

  if (CurPageID = wpSelectDir) then
  begin       
    if (FileExists(ExpandConstant('{app}\manifest.xml'))) then
      SuppressibleMsgBox('WARNINIG - A sideloader mod was likely extracted inside the game directory. Some game files might be corrupted. Repair will be attempted, but if you still have problems you will have to reinstall the game.', mbError, MB_OK, 0);
  end;

  if (CurPageID = wpReady) then
  begin
    if (IsTaskSelected('delete\Plugins')) then
      DelTree(ExpandConstant('{app}\BepInEx'), True, True, True);
    if (IsTaskSelected('delete\Sidemods')) then
      DelTree(ExpandConstant('{app}\mods'), True, True, True);
    if (IsTaskSelected('delete\Listfiles')) then
      RemoveNonstandardListfiles(ExpandConstant('{app}'));      
    if (IsTaskSelected('delete\PW')) then
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
    if IsComponentSelected('TL\EnglishTranslation') then
        RemoveJapaneseCards(ExpandConstant('{app}'));
    // Always clean up sideloader mods in case user already messed up 
    if IsComponentSelected('fixSideloaderDupes') then
        RemoveSideloaderDuplicates(ExpandConstant('{app}'));
  end;
end;

