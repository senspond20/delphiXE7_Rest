program Project;

uses
  Vcl.Forms,
  main in 'main.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  Func in 'Func.pas',
  RestModule in 'RestModule.pas' {Rest: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TRest, Rest);
  Application.Run;
end.
