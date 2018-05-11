program MATLAB;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX.Code.C in '_LIBRARY\LUXOPHIA\LUX.Code\LUX.Code.C.pas',
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.MATLAB in '_LIBRARY\LUXOPHIA\LUX.MATLAB\LUX.MATLAB.pas',
  MATLAB.engine in '_LIBRARY\LUXOPHIA\LUX.MATLAB\MATLAB\MATLAB.engine.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
