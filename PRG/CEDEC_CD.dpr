program CEDEC_CD;

uses
  Forms,
  UDM in 'UDM.pas' {DM: TDataModule},
  Uprincipal in 'Uprincipal.pas' {Form1},
  Usobre in 'Usobre.pas' {Fsobre};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
