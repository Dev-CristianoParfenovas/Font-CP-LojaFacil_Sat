unit untRProdFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRProdFornecedor = class(TForm)
    qrpProdutosFornecedor: TQuickRep;
    DetailBand1: TQRBand;
    qrdbCodigoAd: TQRDBText;
    qrdbDescricao: TQRDBText;
    qrdbValorVenda: TQRDBText;
    qrdbVlrCusto: TQRDBText;
    qrdbQtdeEstoque: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrlProdutos: TQRLabel;
    qrsysdataPagina: TQRSysData;
    TitleBand1: TQRBand;
    qrlCodigoAD: TQRLabel;
    qrlDescricao: TQRLabel;
    qrlVlrVenda: TQRLabel;
    qrl_Custo: TQRLabel;
    qrl_QtdeEStoque: TQRLabel;
    qrl_NomeFornecedor: TQRLabel;
    SummaryBand1: TQRBand;
    qrexpTotalCusto: TQRExpr;
    qrexpTotalVenda: TQRExpr;
    qrl_TotalCusto: TQRLabel;
    qrl_Total: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRProdFornecedor: TfrmRProdFornecedor;

implementation

{$R *.dfm}

end.
