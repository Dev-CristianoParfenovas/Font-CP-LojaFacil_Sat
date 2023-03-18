unit untFluxoPrecoA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmFluxoPrecoA = class(TForm)
    qrpFluxoCxPrecoA: TQuickRep;
    DetailBand1: TQRBand;
    qrdbProd: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbValorA: TQRDBText;
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
    QRLabel1: TQRLabel;
    qrexpValor: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoPrecoA: TfrmFluxoPrecoA;

implementation

{$R *.dfm}

end.
