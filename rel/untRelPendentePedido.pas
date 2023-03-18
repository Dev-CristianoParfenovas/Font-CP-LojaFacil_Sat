unit untRelPendentePedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelPendentePedido = class(TForm)
    qrpPendentes: TQuickRep;
    DetailBand1: TQRBand;
    qrdbProd: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbData: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbNPedido: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrl_Titulo: TQRLabel;
    qrl_NomeCliente: TQRLabel;
    qrl_Cliente: TQRLabel;
    qrl_TotalPendente: TQRLabel;
    qrl_VlrTotalP: TQRLabel;
    qrl_PagtoParcial: TQRLabel;
    qrl_PParcial: TQRLabel;
    qrl_SaldoDevedor: TQRLabel;
    qrl_SDevedor: TQRLabel;
    TitleBand1: TQRBand;
    qrlProd: TQRLabel;
    qrl_Data: TQRLabel;
    qrl_Vendedor: TQRLabel;
    qrl_Total: TQRLabel;
    qrl_Qtde: TQRLabel;
    qrl_NPedido: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPendentePedido: TfrmRelPendentePedido;

implementation

{$R *.dfm}

end.
