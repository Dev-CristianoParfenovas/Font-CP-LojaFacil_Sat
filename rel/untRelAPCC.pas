unit untRelAPCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelAPCC = class(TForm)
    qrpRelAPCC: TQuickRep;
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
    qrlFNasal: TQRLabel;
    qrdbFNS: TQRDBText;
    qrdbFNN: TQRDBText;
    qrdbFNDireita: TQRDBText;
    qrdbFNEsquerda: TQRDBText;
    qrdbFNContinuo: TQRDBText;
    qrdbFNAsVezes: TQRDBText;
    qrdbFNAquoso: TQRDBText;
    qrdbFNMucoso: TQRDBText;
    qrdbFNPus: TQRDBText;
    qrdbFNSangue: TQRDBText;
    qrl_CFSN: TQRLabel;
    qrdbCFacilSN: TQRDBText;
    qrl_CSN: TQRLabel;
    qrdbCianoseSN: TQRDBText;
    qrl_DSN: TQRLabel;
    qrdbDiarreiaSN: TQRDBText;
    qrl_ASN: TQRLabel;
    qrdbAnasorcaSN: TQRDBText;
    qrlAVASN: TQRLabel;
    qrdbAVolAbSN: TQRDBText;
    qrl_EMSN: TQRLabel;
    qrdbEdemaMSN: TQRDBText;
    qrl_PCSN: TQRLabel;
    qrdbPerdaCSN: TQRDBText;
    QRStringsBand1: TQRStringsBand;
    qrl_TS: TQRLabel;
    qrdbTosseS: TQRDBText;
    qrdbTosseN: TQRDBText;
    qrdbTosseU: TQRDBText;
    qrdbTosseSeca: TQRDBText;
    qrl_Outros: TQRLabel;
    qrdbNervMedo: TQRDBText;
    qrdbRetCresc: TQRDBText;
    qrdbSedeInt: TQRDBText;
    qrdbPoliuroOutros: TQRDBText;
    qriBarraRel: TQRImage;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAPCC: TfrmRelAPCC;

implementation

{$R *.dfm}

end.
