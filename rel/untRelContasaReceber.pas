unit untRelContasaReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfrmRelContasaReceber = class(TForm)
    qrpContasaReceber: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    qrdbDescricao: TQRDBText;
    qrdbVcto: TQRDBText;
    qrdbValor: TQRDBText;
    QRLabel1: TQRLabel;
    qrlDescr: TQRLabel;
    qrlVcto: TQRLabel;
    qrlVlr: TQRLabel;
    qrlTotal: TQRLabel;
    qrexpTotal: TQRExpr;
    qrlTipoDoc: TQRLabel;
    qrdbTipoDoc: TQRDBText;
    qrlNumCheque: TQRLabel;
    qrdbNumCheque: TQRDBText;
    qrl_CliAvulso: TQRLabel;
    qrdbNomeAvulso: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    qrexprTotal: TQRExpr;
    qrdbTipoPagto: TQRDBText;
    qrl_Cartao: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelContasaReceber: TfrmRelContasaReceber;

implementation

{$R *.dfm}

end.
