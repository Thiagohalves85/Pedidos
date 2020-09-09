program Pedidos;

uses
  Vcl.Forms,
  UPrincipal in 'View\UPrincipal.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  UModel in 'Model\UModel.pas',
  UControl in 'Control\UControl.pas',
  USobre in 'View\USobre.pas' {frmSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.Run;
end.
