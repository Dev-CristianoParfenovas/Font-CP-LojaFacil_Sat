unit untRCupomVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfrmCupomVenda = class(TForm)
    qrpRcupom: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    qrl_NomeEmpresa: TQRLabel;
    qrl_EndEmpresa: TQRLabel;
    qrl_BairroEmpresa: TQRLabel;
    qrl_TelEmpresa: TQRLabel;
    qrl_Data: TQRLabel;
    qrl_Hora: TQRLabel;
    qrl_NEmpresa: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbTotal: TQRDBText;
    qrlVlrTotal: TQRLabel;
    qrdbQtde: TQRDBText;
    qrlQtde: TQRLabel;
    qrdbVlrUnit: TQRDBText;
    qrdbProduto: TQRDBText;
    qrl_TPagto: TQRLabel;
    QRLabel8: TQRLabel;
    qrl_VlrPago: TQRLabel;
    qrl_Desc: TQRLabel;
    qrl_VlrDesc: TQRLabel;
    qrl_TipoPagto: TQRLabel;
    QRLabel1: TQRLabel;
    qrl_Troco: TQRLabel;
    qrl_TotalTroco: TQRLabel;
    qr_MemoFrase: TQRMemo;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrl_ValorPago: TQRLabel;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCupomVenda: TfrmCupomVenda;

implementation

{$R *.dfm}

end.
