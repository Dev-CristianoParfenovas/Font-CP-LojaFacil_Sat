unit untRelCRBaixado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelCRBaixado = class(TForm)
    qrpCRBaixado: TQuickRep;
    DetailBand1: TQRBand;
    qrdbDescricao: TQRDBText;
    qrdbVcto: TQRDBText;
    qrdbValor: TQRDBText;
    qrdbTipoDoc: TQRDBText;
    qrdbNumCheque: TQRDBText;
    qrdbNomeAvulso: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    TitleBand1: TQRBand;
    qrlDescr: TQRLabel;
    qrlVcto: TQRLabel;
    qrlVlr: TQRLabel;
    qrlTipoDoc: TQRLabel;
    qrlNumCheque: TQRLabel;
    qrl_CliAvulso: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    qrexprTotal: TQRExpr;
    qrlDataBX: TQRLabel;
    qrdbDataBX: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCRBaixado: TfrmRelCRBaixado;

implementation

{$R *.dfm}

end.
