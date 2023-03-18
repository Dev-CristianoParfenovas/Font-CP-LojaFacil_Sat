unit untRelTotalFluxo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelTotalFluxo = class(TForm)
    qrpTotalFluxoCx: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrexprTotalVendido: TQRExpr;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    qrlTotalCusto: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    qrl_Acrescimos: TQRLabel;
    qrexpAcrescimos: TQRExpr;
    qrl_Descontos: TQRLabel;
    qrexpDescontos: TQRExpr;
    qrl_Menos: TQRLabel;
    qrl_Mais: TQRLabel;
    qrl_Menoss: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTotalFluxo: TfrmRelTotalFluxo;

implementation

{$R *.dfm}

end.
