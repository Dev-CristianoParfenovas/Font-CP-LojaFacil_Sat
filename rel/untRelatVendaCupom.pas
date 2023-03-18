unit untRelatVendaCupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelatVendaCupom = class(TForm)
    qrpVendasCupom: TQuickRep;
    DetailBand1: TQRBand;
    qrdbProd: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbVlrTotal: TQRDBText;
    qrdbData: TQRDBText;
    qrdbNCupom: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrl_Titulo: TQRLabel;
    TitleBand1: TQRBand;
    qrlProd: TQRLabel;
    qrl_Qtde: TQRLabel;
    qrl_VlrUnit: TQRLabel;
    qrl_VltTotal: TQRLabel;
    qrl_Data: TQRLabel;
    qrl_PrecoB: TQRLabel;
    SummaryBand1: TQRBand;
    qrlTotalRecebido: TQRLabel;
    qrexpTotal: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatVendaCupom: TfrmRelatVendaCupom;

implementation

{$R *.dfm}

end.
