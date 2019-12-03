unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Winapi.ShellAPI, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const
    PROGRAM_NAME ='this is master';
    PROGRAM_NAME2 ='现在是12月份分支';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure KillProcess(hWindowHandle: HWND);
var
  hprocessID: INTEGER;
  processHandle: THandle;
  DWResult: DWORD;
begin
  SendMessageTimeout(hWindowHandle, WM_CLOSE, 0, 0,
    SMTO_ABORTIFHUNG or SMTO_NORMAL, 500, DWResult);

  if isWindow(hWindowHandle) then
  begin
    { Get the process identifier for the window}
    GetWindowThreadProcessID(hWindowHandle, @hprocessID);
    if hprocessID <> 0 then
    begin
      { Get the process handle }
      processHandle := OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,
        False, hprocessID);
      if processHandle <> 0 then
      begin
        { Terminate the process }
        TerminateProcess(processHandle, 0);
        CloseHandle(ProcessHandle);
      end;
    end;
  end;
end;

procedure AppRestart;
var
  AppName : PChar;
begin
  AppName:=PChar(Application.ExeName);
  ShellExecute(Application.Handle, 'open', AppName, nil, nil, SW_SHOWNORMAL);
  KillProcess(Application.Handle);
end;


procedure TForm1.btn1Click(Sender: TObject);
begin
  ShowMessage('你好12月');
//  AppRestart;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption :=FormatDateTime('c',Now);
end;

end.
