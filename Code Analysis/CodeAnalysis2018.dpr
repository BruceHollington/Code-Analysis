program CodeAnalysis2018;

uses
  Forms,
  viewMain in 'View\viewMain.pas' {frmMain},
  DM in 'Model\DM.pas' {DM1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM1, DM1);
  Application.Run;
end.
