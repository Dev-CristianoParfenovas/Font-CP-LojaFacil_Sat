unit untR_Orc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmR_Orc = class(TForm)
    qrpOrcamento: TQuickRep;
    TitleBand1: TQRBand;
    qrlNumPed: TQRLabel;
    qrlCli: TQRLabel;
    qrdbNOrc: TQRDBText;
    qrlVendedor: TQRLabel;
    qrdbVendedor: TQRDBText;
    QRLabel2: TQRLabel;
    qrdbCnpj: TQRDBText;
    qrlFone: TQRLabel;
    qrdbFone: TQRDBText;
    QRLabel1: TQRLabel;
    qrlVlrUnit: TQRLabel;
    qrlQtde: TQRLabel;
    qrlVlrTotal: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlRef: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlEndereco: TQRLabel;
    qrlNum: TQRLabel;
    QRLabel3: TQRLabel;
    qrlBairro: TQRLabel;
    QRLabel5: TQRLabel;
    qrlDDDEmpresa: TQRLabel;
    qrlTelefoneEmpresa: TQRLabel;
    qrlEstado: TQRLabel;
    QRLabel4: TQRLabel;
    qrlNomeCliente: TQRLabel;
    qrdbData: TQRDBText;
    qrl_Endereco: TQRLabel;
    qrdbEndereco: TQRDBText;
    qrl_Num: TQRLabel;
    qrdbNumero: TQRDBText;
    qrl_Bairr: TQRLabel;
    qrdbBairro: TQRDBText;
    qrl_Cidade: TQRLabel;
    qrdbCid: TQRDBText;
    qrdbEstado: TQRDBText;
    DetailBand1: TQRBand;
    qrdbProd: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbVlrTotal: TQRDBText;
    qrdbRef: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrl_Titulo: TQRLabel;
    SummaryBand1: TQRBand;
    QRExprtotalPedido: TQRExpr;
    QRLabel8: TQRLabel;
    qrl_DTEmissao: TQRLabel;
    qrl_Data: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmR_Orc: TfrmR_Orc;

implementation

{$R *.dfm}

end.
