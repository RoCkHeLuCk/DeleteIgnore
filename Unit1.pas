unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.RegularExpressions, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.CheckLst, Vcl.ComCtrls,
  Vcl.Menus,
  Winapi.Shellapi, System.Masks, System.IniFiles, Vcl.Samples.Gauges,
  System.UITypes, Vcl.Imaging.pngimage, Winapi.ShlwApi, Winapi.ActiveX,
  Winapi.ShlObj, Vcl.Buttons;

type
  TForm1 = class(TForm)
    pgcDeleteIgnore: TPageControl;
    tbsIgnoreList: TTabSheet;
    tbsFindList: TTabSheet;
    clbFindList: TCheckListBox;
    ppmFindList: TPopupMenu;
    SelectAll1: TMenuItem;
    Invert1: TMenuItem;
    CleanSelect1: TMenuItem;
    pnlWaitFind: TPanel;
    Gauge1: TGauge;
    TabSheet1: TTabSheet;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FileOpenDialog1: TFileOpenDialog;
    lblFiles: TLabel;
    btnCancel: TButton;
    gpbIncludedList: TGroupBox;
    mmoIncluded: TMemo;
    gpbExcludedList: TGroupBox;
    mmoExculded: TMemo;
    Splitter1: TSplitter;
    ShowinExplorer1: TMenuItem;
    N1: TMenuItem;
    Panel1: TPanel;
    Label4: TLabel;
    edtSearchFor: TEdit;
    Button1: TButton;
    btnFind: TButton;
    ckbEmptyFolder: TCheckBox;
    pnlIgnore: TPanel;
    btnDelete: TButton;
    ckbSendTrash: TCheckBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFindClick(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure CleanSelect1Click(Sender: TObject);
    procedure Invert1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure tbsFindListShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ShowinExplorer1Click(Sender: TObject);
  private
    { Private declarations }
    FCancel: Boolean;
    FDir: String;
    FIniFile: TIniFile;
    function FindMask(TextFind:String; ListMask: TStrings): Boolean;
    function FileListDir(Directory: String): Boolean;
    procedure IniConfigSave();
    procedure IniConfigLoad();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.FindMask(TextFind:String; ListMask: TStrings): Boolean;
var
   RegEx: TRegEx;
   C: Integer;
begin
  Result := False;
  C := 0;
  while (C < ListMask.Count) and (not Result) do
  begin
    if (ListMask[c] <> '')
    and (Copy(ListMask[c],1,1) <> '#') then
    begin
      if (Copy(ListMask[c],1,1) = '\')
      and (Length(ListMask[c]) > 1) then
      begin
        try
          RegEx.Create( Copy(ListMask[c],2,length(ListMask[c])) );
          if RegEx.IsMatch(TextFind) then
          begin
            Result := True;
          end;
        except
          ShowMessage('Error: Regex "' + ListMask[c]+'", Line: '+C.ToString);
          pgcDeleteIgnore.TabIndex := 0;
          FCancel := True;
        end;
      end else begin
        if MatchesMask(TextFind, ListMask[c]) then
           Result := True;
      end;
    end;
    inc(C);
  end;
end;


function TForm1.FileListDir(Directory: String): Boolean;
var
  SearchRec: TSearchRec;
  FileName, Name: string;
  c: Integer;
begin

  Result := True; //assume que o diretori esta vazio
  Directory := IncludeTrailingPathDelimiter(Directory);

  c := FindFirst(Directory + '*', faAnyFile, SearchRec);
  while (c = 0) and (not FCancel) do
  begin
    Name := SearchRec.Name;

    if (Name <> '.') and (Name <> '..') then
    begin
      if (SearchRec.Attr and faDirectory > 0) then
      begin
        Name := Name + '\';
      end;
      FileName := Directory + Name;

      if not FindMask(Name, mmoExculded.Lines) then
      begin
        if FindMask(Name, mmoIncluded.Lines) then
        begin
          clbFindList.Items.Add(FileName);
        end else begin
          if (SearchRec.Attr and faDirectory > 0)
          and FileListDir(FileName)
          and ckbEmptyFolder.Checked then
          begin
            clbFindList.Items.Add(FileName);
          end else begin
            Result := False;
          end;
        end;
      end;
    end;
    c := FindNext(SearchRec);
    lblFiles.Caption := FileName;
    Application.ProcessMessages;
  end; // while (c = 0) do
  FindClose(SearchRec);
end;

procedure TForm1.IniConfigLoad();
begin
  Self.Left := FIniFile.ReadInteger(Self.Name, 'Left', Self.Left);
  Self.Top := FIniFile.ReadInteger(Self.Name, 'Top', Self.Top);
  Self.ClientWidth := FIniFile.ReadInteger(Self.Name, 'Width',
    Self.ClientWidth);
  Self.ClientHeight := FIniFile.ReadInteger(Self.Name, 'Height',
    Self.ClientHeight);
  Self.MakeFullyVisible(Self.Monitor);
  if FIniFile.ReadBool(Self.Name, 'Maximized', False) then
    Self.WindowState := wsMaximized;
  Self.ckbSendTrash.Checked := FIniFile.ReadBool(Self.Name, 'SendTrash', True);
  Self.ckbEmptyFolder.Checked := FIniFile.ReadBool(Self.Name, 'EmptyFolder', False);
  Self.gpbIncludedList.Height := FIniFile.ReadInteger(Self.Name, 'IncludedList', Self.gpbIncludedList.Height);
end;

procedure TForm1.IniConfigSave();
begin
  Self.MakeFullyVisible(Self.Monitor);
  if Self.WindowState <> wsMaximized then
  begin
    FIniFile.WriteInteger(Self.Name, 'Left', Self.Left);
    FIniFile.WriteInteger(Self.Name, 'Top', Self.Top);
    FIniFile.WriteInteger(Self.Name, 'Width', Self.ClientWidth);
    FIniFile.WriteInteger(Self.Name, 'Height', Self.ClientHeight);
    FIniFile.WriteBool(Self.Name, 'Maximized', False);
  end
  else
    FIniFile.WriteBool(Self.Name, 'Maximized', True);

  FIniFile.WriteBool(Self.Name, 'SendTrash', Self.ckbSendTrash.Checked);
  FIniFile.WriteBool(Self.Name, 'EmptyFolder', Self.ckbEmptyFolder.Checked);
  FIniFile.WriteInteger(Self.Name, 'IncludedList', Self.gpbIncludedList.Height);
  FIniFile.UpdateFile;
end;

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  FCancel := True;
  if btnCancel.Caption = '&Find' then
    btnFind.Click;
end;

procedure TForm1.btnDeleteClick(Sender: TObject);
var
  c, d: Integer;
  SH: TSHFILEOPSTRUCT;
begin
  FCancel := False;
  btnCancel.Caption := '&Cancel';
  d := 0;
  for c := 0 to clbFindList.Count - 1 do
  begin
    if clbFindList.Checked[c] then
      Inc(d);
  end;

  if (d = 0) and (MessageDlg('Select All Files?', mtConfirmation, [mbYes, mbNo],
    0, mbNo) = mrYes) then
  begin
    SelectAll1.Click;
  end;

  if MessageDlg('Confirm Delete All Files?', mtConfirmation, [mbYes, mbNo], 0,
    mbNo) = mrYes then
  begin
    btnDelete.Enabled := False;
    pnlWaitFind.Visible := True;
    pnlWaitFind.Caption := 'Delete';
    Gauge1.Progress := 0;
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := clbFindList.Count - 1;
    Gauge1.Visible := True;

    for c := 0 to clbFindList.Count - 1 do
    begin
      if clbFindList.Checked[c] then
      begin
        if ckbSendTrash.Checked then
        begin
          FillChar(SH, SizeOf(SH), 0);
          SH.Wnd := WindowHandle;
          SH.wFunc := FO_DELETE;
          SH.pFrom := PChar(clbFindList.Items[c] + #0);
          SH.fFlags := FOF_SILENT or FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
          SHFileOperation(SH);
        end
        else
        begin
          DeleteFile(clbFindList.Items[c]);
        end;
      end;
      Gauge1.Progress := c;
      lblFiles.Caption := clbFindList.Items[c];
      if FCancel then
        break;
      Application.ProcessMessages;
    end;
  end;

  if FCancel then
  begin
    lblFiles.Caption := 'Canceled!';
  end
  else
  begin
    lblFiles.Caption := 'Finished!';
  end;

  btnCancel.Caption := '&Find';
end;

procedure TForm1.btnFindClick(Sender: TObject);
begin
  FCancel := False;
  btnCancel.Caption := '&Cancel';
  btnDelete.Enabled := False;
  pgcDeleteIgnore.TabIndex := 1;
  pnlWaitFind.Visible := True;
  pnlWaitFind.Caption := 'Search';
  Gauge1.Visible := False;
  clbFindList.Items.Clear;
  FileListDir(edtSearchFor.Text);
  pnlWaitFind.Visible := False;
  if not FCancel then
  begin
    clbFindList.Sorted := True;
    if clbFindList.Count > 0 then
      btnDelete.Enabled := True;
  end
  else
  begin
    clbFindList.Items.Clear;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if FileOpenDialog1.Execute(Handle) then
  begin
    edtSearchFor.Text := FileOpenDialog1.FileName;
  end;
end;

procedure TForm1.CleanSelect1Click(Sender: TObject);
begin
  clbFindList.CheckAll(cbUnchecked, True, True);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.IniConfigSave();
  mmoIncluded.Lines.SaveToFile(FDir + 'Included.txt');
  mmoExculded.Lines.SaveToFile(FDir + 'Exculded.txt');
  FCancel := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDir := ExtractFilePath(ParamStr(0));
  FDir := IncludeTrailingPathDelimiter(FDir);
  FIniFile := TIniFile.Create(FDir + 'Config.ini');
  Self.IniConfigLoad();
  if FileExists(FDir + 'Included.txt') then
  begin
    mmoIncluded.Lines.LoadFromFile(FDir + 'Included.txt');
  end;
  if FileExists(FDir + 'Exculded.txt') then
  begin
    mmoExculded.Lines.LoadFromFile(FDir + 'Exculded.txt');
  end;

  pgcDeleteIgnore.TabIndex := 0;

  edtSearchFor.Text := string(ParamStr(1));
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Self.IniConfigSave();
  FIniFile.Free;
end;

procedure TForm1.Invert1Click(Sender: TObject);
var
  c: Integer;
begin
  for c := 0 to clbFindList.Count - 1 do
    clbFindList.Checked[c] := not clbFindList.Checked[c];
end;

procedure TForm1.SelectAll1Click(Sender: TObject);
begin
  clbFindList.CheckAll(cbChecked, True, True);
end;

procedure TForm1.ShowinExplorer1Click(Sender: TObject);
begin
  if clbFindList.ItemIndex > 0 then
     ShellExecute(Application.Handle, 'open', 'explorer.exe',
        PChar('/select,"' + clbFindList.Items[clbFindList.ItemIndex] +'"'),
     nil, SW_NORMAL);
end;

procedure TForm1.tbsFindListShow(Sender: TObject);
begin
  btnFind.Click;
end;

end.
