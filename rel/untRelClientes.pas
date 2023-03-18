unit untRelClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfrmRelClientes = class(TForm)
    qrpRelClientes: TQuickRep;
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlCod: TQRLabel;
    qrdbCodigoCli: TQRDBText;
    qrlNome: TQRLabel;
    qrdbNomeCliente: TQRDBText;
    qrlEnd: TQRLabel;
    qrdbEndCli: TQRDBText;
    qrlNumero: TQRLabel;
    qrdbNumeroCli: TQRDBText;
    qrlFone: TQRLabel;
    qrdbTelefone: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientes: TfrmRelClientes;

implementation

{$R *.dfm}

end.
