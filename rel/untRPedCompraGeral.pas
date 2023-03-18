unit untRPedCompraGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRPedCompraGeral = class(TForm)
    qrpPedCompra: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlVlrUnit: TQRLabel;
    qrlQtde: TQRLabel;
    qrlVlrTotal: TQRLabel;
    qrlRef: TQRLabel;
    qrlDesc: TQRLabel;
    qrlAcres: TQRLabel;
    qrl_PedidoN: TQRLabel;
    DetailBand1: TQRBand;
    qrdbProduto: TQRDBText;
    qrdbUnit: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbRef: TQRDBText;
    qrdbDesc: TQRDBText;
    qrdbAcresc: TQRDBText;
    qrdbNPedido: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    SummaryBand1: TQRBand;
    QRExprtotalPedido: TQRExpr;
    qrlTotalPed: TQRLabel;
    qrlDe: TQRLabel;
    qrl_DataIni: TQRLabel;
    qrlAte: TQRLabel;
    qrl_DataF: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRPedCompraGeral: TfrmRPedCompraGeral;

implementation

{$R *.dfm}

end.
