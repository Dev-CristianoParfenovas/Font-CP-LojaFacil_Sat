unit untFluxoPrecoD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelFluxoPrecoD = class(TForm)
    qrpFluxoCxPrecoD: TQuickRep;
    DetailBand1: TQRBand;
    qrdbProd: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbValorD: TQRDBText;
    qrdbData: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrl_Titulo: TQRLabel;
    TitleBand1: TQRBand;
    qrlProd: TQRLabel;
    qrl_Qtde: TQRLabel;
    qrl_Total: TQRLabel;
    qrl_PrecoA: TQRLabel;
    qrl_Data: TQRLabel;
    SummaryBand1: TQRBand;
    qrlTotal: TQRLabel;
    qrexpPrecoD: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFluxoPrecoD: TfrmRelFluxoPrecoD;

implementation

{$R *.dfm}

end.
