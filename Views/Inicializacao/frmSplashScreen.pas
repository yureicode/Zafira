unit frmSplashScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlCentro: TPanel;
    pbInicial: TProgressBar;
    lblProgress: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure IniciarApp;
  private
    procedure AtualizarProgresso(Valor: Integer; Texto: string);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin

  pbInicial.Min := 0;
  pbInicial.Max := 100;
  pbInicial.Position := 0;
  lblProgress.Caption := 'Iniciando...';


  TThread.ForceQueue(nil, procedure
  begin
    IniciarApp;
  end);
end;

procedure TForm1.IniciarApp;
begin
  AtualizarProgresso(20, 'Carregando m�dulos...');
  Sleep(500);

  AtualizarProgresso(40, 'Estabelecendo conex�o com o banco de dados...');
  Sleep(500);

  AtualizarProgresso(60, 'Inicializando componentes...');
  Sleep(500);

  AtualizarProgresso(80, 'Ajustando configura��es...');
  Sleep(500);

  AtualizarProgresso(100, 'Carregamento conclu�do! Aplica��o pronta.');
  Sleep(500);


  TThread.ForceQueue(nil, procedure
  begin
    Close;
  end);
end;

procedure TForm1.AtualizarProgresso(Valor: Integer; Texto: string);
begin
  pbInicial.Position := Valor;
  lblProgress.Caption := Texto;
  Application.ProcessMessages;
end;

end.

