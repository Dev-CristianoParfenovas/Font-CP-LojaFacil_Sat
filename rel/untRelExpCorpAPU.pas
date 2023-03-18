unit untRelExpCorpAPU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelExprCorpAPU = class(TForm)
    qrpRelExpCorpAPU: TQuickRep;
    DetailBand1: TQRBand;
    qrdbCliente: TQRDBText;
    qrdbNomeAnimal: TQRDBText;
    qrdbSexo: TQRDBText;
    qrdbRaca: TQRDBText;
    qrdbPeso: TQRDBText;
    qrdbPelagem: TQRDBText;
    qrdbNascto: TQRDBText;
    qrdbQueixaPrinc: TQRDBText;
    qrl_QPrinc: TQRLabel;
    qrl_Duracao: TQRLabel;
    qrdbDuracao: TQRDBText;
    qrdbCurso: TQRDBText;
    qrl_Curso: TQRLabel;
    qrdbFreq: TQRDBText;
    qrl_Freq: TQRLabel;
    qrdbTratamento: TQRDBText;
    qrl_Tratamento: TQRLabel;
    qrdbFormaap: TQRDBText;
    qrl_Formaap: TQRLabel;
    qrl_Resultados: TQRLabel;
    qrdbResultados: TQRDBText;
    qrlAbdomeECAPU: TQRLabel;
    qrdbAAssimetrico: TQRDBText;
    qrdbARecolhido: TQRDBText;
    qrdbAAumentado: TQRDBText;
    qrlRim: TQRLabel;
    qrdbRDNPolpOEC: TQRDBText;
    qrdbRDAumentOEC: TQRDBText;
    qrdbRDDolorosoOEC: TQRDBText;
    qrdbRENPolpOEC: TQRDBText;
    qrdbREAumentOEC: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlAltMetal: TQRLabel;
    qrl_Disuria: TQRLabel;
    qrlBexigaEcau: TQRLabel;
    qrlFuncfiltro: TQRLabel;
    qrlVV: TQRLabel;
    QRImage3: TQRImage;
    QRImage2: TQRImage;
    QRImage4: TQRImage;
    QRImage1: TQRImage;
    PageHeaderBand1: TQRBand;
    qrl_RelAPU: TQRLabel;
    TitleBand1: TQRBand;
    qrlCliente: TQRLabel;
    qrlNomeAnimal: TQRLabel;
    qrlSexoAnimal: TQRLabel;
    qrlRaca: TQRLabel;
    qrlPeso: TQRLabel;
    qrlPelagem: TQRLabel;
    qrlNascto: TQRLabel;
    qrdbAVentreFlacido: TQRDBText;
    qrdbAOndPosit: TQRDBText;
    qrdbAVentreTenso: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrdbREDolorosoOEC: TQRDBText;
    qrdbSupIrrOEC: TQRDBText;
    qrdbDuroOEC: TQRDBText;
    qrdbMoleOec: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qrdbProstNPECAU: TQRDBText;
    qrdbMCECAU: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrdbPelECAU: TQRDBText;
    qrdbBtECAU: TQRDBText;
    qrdbRnECAU: TQRDBText;
    qrdbNaopECAU: TQRDBText;
    qrdbVazia: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qrdbPrTPECAU: TQRDBText;
    qrdbPrImECAU: TQRDBText;
    qrdbPrDefECAU: TQRDBText;
    qrdbPrNPSECAU: TQRDBText;
    qrdbPrAssECAU: TQRDBText;
    qrdbPRpapECAU: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    qrdbPrdaECAU: TQRDBText;
    qrdbFimoseECAU: TQRDBText;
    qrdbPFimoseECAU: TQRDBText;
    qrdbPRPECAU: TQRDBText;
    qrdbLemPECAU: TQRDBText;
    qrdbMIOECAU: TQRDBText;
    qrdbMRoxoECAU: TQRDBText;
    qrdbMIECAU: TQRDBText;
    qrdbTumECAU: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel37: TQRLabel;
    qrdbPosanECAU: TQRDBText;
    qrdbUPECAU: TQRDBText;
    qrdbCGECAU: TQRDBText;
    qrdbUDECAU: TQRDBText;
    qrdbMAECAU: TQRDBText;
    qrdbORECAU: TQRDBText;
    qrdbPurECAU: TQRDBText;
    qrdbPDECAU: TQRDBText;
    qrdbOUVVECAU: TQRDBText;
    qrdbDisfVVECAU: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelExprCorpAPU: TfrmRelExprCorpAPU;

implementation

{$R *.dfm}

end.
