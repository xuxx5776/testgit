program testgit;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  SecondUnit in 'SecondUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
