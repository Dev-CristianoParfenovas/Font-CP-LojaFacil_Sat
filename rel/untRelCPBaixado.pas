unit untRelCPBaixado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelCPBaixado = class(TForm)
    qrpCPBaixado: TQuickRep;
    DetailBand1: TQRBand;
    qrdbForn: TQRDBText;
    qrdbEmissao: TQRDBText;
    qrdbValor: TQRDBText;
    qrdbVcto: TQRDBText;
    qrdbTipoServico: TQRDBText;
    qrdbNomeBco: TQRDBText;
    qrdbNumDoc: TQRDBText;
    qrdbLocalizacao: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrl_Titulo: TQRLabel;
    TitleBand1: TQRBand;
    qrlForn: TQRLabel;
    qrlDataEmiss: TQRLabel;
    qrlVlr: TQRLabel;
    qrlVcto: TQRLabel;
    qrlTipoServico: TQRLabel;
    qrl_Bco: TQRLabel;
    QRLabel2: TQRLabel;
    qrl_local: TQRLabel;
    SummaryBand1: TQRBand;
    qrl_TotalaPagar: TQRLabel;
    QRExpr1: TQRExpr;
    qrdbDataBx: TQRDBText;
    qrl_DtBx: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCPBaixado: TfrmRelCPBaixado;

implementation

{$R *.dfm}

end.
