[CustomMessages]
SfwTitle=[SFW mod] Do you want to block access to R18 / NSFW content?
SfwTitleDescription=You can change this setting later through the game's launcher
SfwOptNsfw=Keep everything enabled (default, NSFW mode)
SfwOptNsfwDescription=Keep all of the game's content enabled, including adult content. All mods and features will be available. Please be careful when sharing your creations if they involve what looks like a loli in a lewd situation (those are often a bannable offense in online communities, and completely illegal in some countries).
SfwOptSfw=Disable R18 content (SFW mode)
SfwOptSfwDescription=Disable free H, story mode, nudity (can't strip), NSFW mods and plugins, and some game functions. Content creation tools (Character Maker and Studio) stay enabled. Useful for streaming and if you want to make only SFW characters and scenes. WARNING: Not all NSFW content might be blocked! Test before public use!

jp.SfwTitle=[SFW mod] R18/NSFWコンテンツへのアクセスをブロックしますか？
jp.SfwTitleDescription=この設定は、ゲームのランチャーから後で変更できます
jp.SfwOptNsfw=すべてを有効にしておく（デフォルト、NSFWモード）
jp.SfwOptNsfwDescription=アダルトコンテンツを含め、ゲームのすべてのコンテンツを有効にしてください。すべての改造と機能が利用可能になります。エッチな状況でロリのように見えるものが含まれる場合は、英語圏のコミュニティで作品を共有するときに注意してください。それらは許可されていません。（ロリは一部の国では完全に違法です）
jp.SfwOptSfw=R18コンテンツを無効にする（SFWモード）
jp.SfwOptSfwDescription=これにより、無料のH、ストーリーモード、ヌード（下着は脱ぎません）、NSFW改造とプラグイン、一部のゲーム機能が無効になります。キャラクターメーカーとスタジオは有効なままです。SFWシーンのストリーミングと作成に役立ちます。警告：すべてがブロックされているわけではありません。一般に使用する前にテストしてください！

[Files]
#ifndef DEBUG
Source: "Input\KK_SFW_config\sfw\KK_SFW.cfg";      DestDir: "{app}\BepInEx\config"; Flags: ignoreversion; Components: Feature\KK_SFW; Check: SFWmode
Source: "Input\KK_SFW_config\nsfw\KK_SFW.cfg";     DestDir: "{app}\BepInEx\config"; Flags: ignoreversion; Components: Feature\KK_SFW; Check: NSFWmode
#endif

[Code]
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

<event('ShouldSkipPage')>
function ShouldSkipPage_SFW(PageID: Integer): Boolean;
begin
  Result := False;
  if PageID = PageSFWmode.ID then
    Result := not WizardIsComponentSelected('Feature\KK_SFW');
end;

function SFWmode(): Boolean;
begin
  Result := ModeRadioButtonSafe.Checked;
end;
function NSFWmode(): Boolean;
begin
  Result := ModeRadioButtonFull.Checked;
end;

<event('InitializeWizard')>
procedure InitializeWizard_SFW;
begin
  CreateSfwPage();
end;