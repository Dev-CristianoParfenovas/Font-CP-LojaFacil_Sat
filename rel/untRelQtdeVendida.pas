unit untRelQtdeVendida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelQtdeVendida = class(TForm)
    qrpRelQtdeVendida: TQuickRep;
    DetailBand1: TQRBand;
    qrdbProd: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbVlrA: TQRDBText;
    qrdbQtde: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    TitleBand1: TQRBand;
    qrlProd: TQRLabel;
    qrl_Qtde: TQRLabel;
    qrl_VlrUnit: TQRLabel;
    qrl_VltTotal: TQRLabel;
    SummaryBand1: TQRBand;
    qrlDe: TQRLabel;
    qrlDataIni: TQRLabel;
    qrlTotalGeral: TQRLabel;
    qrexpTotalGeralP: TQRExpr;
    qrlAte: TQRLabel;
    qrlDataF: TQRLabel;
    qrdbData: TQRDBText;
    qrl_Dt: TQRLabel;
    qrl_QtdeItens: TQRLabel;
    qrl_QtdeTotalItens: TQRLabel;
    qrl_QtdeEstoque: TQRLabel;
    qrdbQtdeEstoque: TQRDBText;
    qrsysdataPagina: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelQtdeVendida: TfrmRelQtdeVendida;

implementation

{$R *.dfm}

end.
