unit untRelFluxoTroca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelatFluxoTroca = class(TForm)
    qrpFluxoTroca: TQuickRep;
    DetailBand1: TQRBand;
    qrdbProd: TQRDBText;
    qrdbVlrTroca: TQRDBText;
    qrdbData: TQRDBText;
    qrdbVendedor: TQRDBText;
    qrdbObs: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrl_DataF: TQRLabel;
    TitleBand1: TQRBand;
    qrlProd: TQRLabel;
    qrl_Data: TQRLabel;
    qrl_Vendedor: TQRLabel;
    qrl_Obs: TQRLabel;
    SummaryBand1: TQRBand;
    qrlTotalRecebido: TQRLabel;
    qrexpVlrTroca: TQRExpr;
    qrl_DataFinal: TQRLabel;
    qrl_VltTotal: TQRLabel;
    qrl_DataIni: TQRLabel;
    qrl_De: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatFluxoTroca: TfrmRelatFluxoTroca;

implementation

{$R *.dfm}

end.
