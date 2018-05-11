program MATLAB;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  MATLAB.engine in '__LIBRARY\LUXOPHIA\LUX.MATLAB\MATLAB.engine.pas',
  LUX.Code.C in '..\..\_LIBRARY\・LUX.Code\LUX.Code.C.pas',
  MATLAB.matrix in '__LIBRARY\LUXOPHIA\LUX.MATLAB\MATLAB.matrix.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
