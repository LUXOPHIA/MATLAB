unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  LUX.Code.C,
  LUX.MATLAB, MATLAB.engine;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private 宣言 }
  public
    { public 宣言 }
    _Engine :P_Engine;
  end;

  T_mwSize = Integer;

  T_mxComplexity = ( mxREAL, mxCOMPLEX );

var
  Form1: TForm1;

const _LIBMX_ = _DLLDIR_ + 'libmx.dll';

function mxCreateDoubleMatrix( m_:T_mwSize; n_:T_mwSize; flag_:T_mxComplexity ) :P_mxArray; stdcall; external _LIBMX_;

function mxGetPr( const pa_:P_mxArray ) :P_double; stdcall; external _LIBMX_;

procedure mxDestroyArray( pa_:P_mxArray ); stdcall; external _LIBMX_;

implementation //############################################################### ■

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
const
     time :array [ 0..10-1 ] of Double = ( 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0 );
var
   T :P_mxArray;
begin
	   // Call engOpen with a NULL string. This starts a MATLAB process
     // on the current host using the command "matlab".

     _Engine := engOpen( '' );

     Assert( Assigned( _Engine ), 'Can''t start MATLAB engine!' );

	 	 // PART I
	 	 //
	 	 // For the first half of this demonstration, send data
  	 // to MATLAB, analyze the data, and plot the result.

   	 // Create a variable for the data

     T := mxCreateDoubleMatrix( 1, 10, T_mxComplexity.mxREAL );

     Move( time, mxGetPr( T )^, SizeOf( time ) );

   	 // Place the variable T into the MATLAB workspace

     engPutVariable( _Engine, 'T', T );

   	 // Evaluate a function of time, distance = (1/2)g.*t.^2
   	 // (g is the acceleration due to gravity)

     engEvalString( _Engine, 'D = .5.*(-9.8).*T.^2;' );

 	   // Plot the result

     engEvalString( _Engine, 'plot(T,D);' );
     engEvalString( _Engine, 'title(''Position vs. Time for a falling object'');' );
	   engEvalString( _Engine, 'xlabel(''Time (seconds)'');' );
	   engEvalString( _Engine, 'ylabel(''Position (meters)'');' );

	   // We're done for Part I! Free memory, close MATLAB figure.

     mxDestroyArray( T );
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     engEvalString( _Engine, 'close;' );

     engClose( _Engine );
end;

end. //######################################################################### ■
