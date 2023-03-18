unit untRelatServEmitido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelatServicosEmitidos = class(TForm)
    qrpServicosEmitidos: TQuickRep;
    DetailBand1: TQRBand;
    qrdbServico: TQRDBText;
    qrdbServicoAvulso: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbTotal: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrl_Titulo: TQRLabel;
    qrl_TelefoneCli: TQRLabel;
    qrl_Cliente: TQRLabel;
    TitleBand1: TQRBand;
    qrlServico: TQRLabel;
    qrl_Vendedor: TQRLabel;
    qrl_Total: TQRLabel;
    qrl_ServicoAvulso: TQRLabel;
    qrimgCodBarras: TQRImage;
    qrl_CodBarra: TQRLabel;
    qrl_NomeData: TQRLabel;
    qrdbNomeCliente: TQRDBText;
    qrdbTelefoneCliente: TQRDBText;
    qrl_Func: TQRLabel;
    SummaryBand1: TQRBand;
    qrdbObs: TQRRichText;
    qrexpTotal: TQRExpr;
    qrl_TotalServ: TQRLabel;
    qrdbData: TQRDBText;
    qrdbFuncionario: TQRDBText;
    qrdbEndereco: TQRDBText;
    qrdbNumero: TQRDBText;
    qrdbBairro: TQRDBText;
    qrdbCep: TQRDBText;
    imgLogo: TQRImage;
    QRShape1: TQRShape;
    qrl_Obs: TQRLabel;
    qrsAssCli: TQRShape;
    qrl_Ass: TQRLabel;
    QRLabel1: TQRLabel;
    qrl_End: TQRLabel;
    qrl_N: TQRLabel;
    qrl_Bairro: TQRLabel;
    qrl_Cep: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatServicosEmitidos: TfrmRelatServicosEmitidos;

implementation

{$R *.dfm}

end.
