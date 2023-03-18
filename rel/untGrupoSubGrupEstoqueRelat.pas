unit untGrupoSubGrupEstoqueRelat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmGrupoSubGrupoEstoqueRelat = class(TForm)
    qrpRelEstoqueGrupoSubGrupo: TQuickRep;
    DetailBand1: TQRBand;
    qrdbDescricao: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbQtdeMinima: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrlTItuloRelatorio: TQRLabel;
    qrl_Grupo: TQRLabel;
    qrl_SubGrupo: TQRLabel;
    qrl_NomeGrupo: TQRLabel;
    qrl_NomeSubGrupo: TQRLabel;
    TitleBand1: TQRBand;
    qrlDescr: TQRLabel;
    qrlVlrUnit: TQRLabel;
    qrlQtde: TQRLabel;
    qrlTotal: TQRLabel;
    qrlMinima: TQRLabel;
    SummaryBand1: TQRBand;
    qrlTotalCusto: TQRLabel;
    QRExpr1: TQRExpr;
    qrlTotalVenda: TQRLabel;
    qrexpTotalVenda: TQRExpr;
    QRLabel1: TQRLabel;
    qrdbVlrCusto: TQRDBText;
    qrdbLucroVenda: TQRDBText;
    QRLabel2: TQRLabel;
    qrdbVctoLote: TQRDBText;
    QRLabel3: TQRLabel;
    qrdbDtUltEntr: TQRDBText;
    qrlFalta: TQRLabel;
    qrsysdataPagina: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupoSubGrupoEstoqueRelat: TfrmGrupoSubGrupoEstoqueRelat;

implementation

{$R *.dfm}

end.
