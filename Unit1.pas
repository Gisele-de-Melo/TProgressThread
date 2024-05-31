//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type

  TProgressThread = class(TThread)
  private
    FProgressBar: TProgressBar;
  protected
    procedure Execute; override;
  public
    constructor Create(ProgressBar: TProgressBar);
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TProgressThread }

constructor TProgressThread.Create(ProgressBar: TProgressBar);
begin
  inherited Create(True);
  FProgressBar := ProgressBar;
  FreeOnTerminate := True;
end;

procedure TProgressThread.Execute;
var
  I: Integer;
begin
  for I := 1 to 100 do
  begin
    Sleep(50); // Simula uma operação demorada
    Synchronize(procedure
                begin
                  FProgressBar.Position := I;
                end);
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ProgressThread: TProgressThread;
begin
  ProgressThread := TProgressThread.Create(ProgressBar1);
  ProgressThread.Start;
end;

end.
