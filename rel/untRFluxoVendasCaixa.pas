unit untRFluxoVendasCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfrmFluxoVendasCaixa = class(TForm)
    qrpFluxoVendasCaixa: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRBand1: TQRBand;
    qrl_NCupom: TQRLabel;
    qrlProd: TQRLabel;
    QRLabel1: TQRLabel;
    sdProdutos: TQRSubDetail;
    sdDesc: TQRSubDetail;
    qrdbNCupom: TQRDBText;
    qrdbProd: TQRDBText;
    qrpDesconto: TQuickRep;
    PageHeaderBand2: TQRBand;
    sdDesconto: TQRSubDetail;
    qrdbDesc: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoVendasCaixa: TfrmFluxoVendasCaixa;

implementation

{$R *.dfm}

end.
