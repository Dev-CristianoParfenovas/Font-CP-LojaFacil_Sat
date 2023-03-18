unit untRelNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelNotaFiscal = class(TForm)
    qrpNF: TQuickRep;
    TitleBand1: TQRBand;
    qrdbEntrada: TQRDBText;
    qrdbNatureza: TQRDBText;
    qrdbCNat: TQRDBText;
    qrdbCliente: TQRDBText;
    qrdbCnpjCpf: TQRDBText;
    qrdbDataEmissao: TQRDBText;
    qrdbDataSaida: TQRDBText;
    qrdbMunicipio: TQRDBText;
    qrdbFoneFax: TQRDBText;
    qrdbUF: TQRDBText;
    qrdbIE: TQRDBText;
    qrdbCep: TQRDBText;
    qrdbBairro: TQRDBText;
    qrdbEndereco: TQRDBText;
    qrdbNumero: TQRDBText;
    qrdbVcto: TQRDBText;
    qrdbValor: TQRDBText;
    qrdbForn: TQRDBText;
    qrdbPBruto: TQRDBText;
    qrdbPLiq: TQRDBText;
    qrdbNumNFSuperior: TQRDBText;
    qrmemoObs: TQRMemo;
    qrdbFrete: TQRDBText;
    qrdbTipoEspecie: TQRDBText;
    qrdbBaseCalcICMS: TQRDBText;
    qrdbVlrdoICMS: TQRDBText;
    qrdbFreteConta: TQRDBText;
    qrdbtotaldoIPI: TQRDBText;
    qrdbVlrtotalNota: TQRDBText;
    qrdbVlrtotalProd: TQRDBText;
    DetailBand1: TQRBand;
    qrdbCLFisc: TQRDBText;
    qrdbUN: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbSaida: TQRDBText;
    qrdbUnit: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbICMS: TQRDBText;
    qrdbIPI: TQRDBText;
    qrdbVlrIPI: TQRDBText;
    SummaryBand1: TQRBand;
    qrdbCodRef: TQRDBText;
    qrdbNomeProd: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelNotaFiscal: TfrmRelNotaFiscal;

implementation

{$R *.dfm}

end.
