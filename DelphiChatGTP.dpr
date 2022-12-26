program DelphiChatGTP;

uses
  Vcl.Forms,
  UChatGTP in 'UChatGTP.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
