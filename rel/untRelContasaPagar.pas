unit untRelContasaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelContasPagar = class(TForm)
    qrpContasPagar: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    qrdbForn: TQRDBText;
    qrdbEmissao: TQRDBText;
    qrdbValor: TQRDBText;
    qrdbVcto: TQRDBText;
    QRLabel1: TQRLabel;
    qrlForn: TQRLabel;
    qrlDataEmiss: TQRLabel;
    qrlVlr: TQRLabel;
    qrlVcto: TQRLabel;
    qrlTipoServico: TQRLabel;
    qrdbTipoServico: TQRDBText;
    SummaryBand1: TQRBand;
    qrl_TotalaPagar: TQRLabel;
    QRExpr1: TQRExpr;
    qrl_Bco: TQRLabel;
    qrdbNomeBco: TQRDBText;
    QRLabel2: TQRLabel;
    qrdbNumDoc: TQRDBText;
    qrl_local: TQRLabel;
    qrdbLocalizacao: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelContasPagar: TfrmRelContasPagar;

implementation

{$R *.dfm}

end.
