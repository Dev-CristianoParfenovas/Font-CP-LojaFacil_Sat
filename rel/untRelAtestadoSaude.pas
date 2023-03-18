unit untRelAtestadoSaude;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelAtestadoSaude = class(TForm)
    qrpAtestadoSaude: TQuickRep;
    DetailBand1: TQRBand;
    qrdbCliente: TQRDBText;
    qrdbNomeAnimal: TQRDBText;
    qrdbSexo: TQRDBText;
    qrdbRaca: TQRDBText;
    qrdbPeso: TQRDBText;
    qrdbPelagem: TQRDBText;
    qrdbNascto: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrl_ATVacina: TQRLabel;
    TitleBand1: TQRBand;
    qrlCliente: TQRLabel;
    qrlNomeAnimal: TQRLabel;
    qrlSexoAnimal: TQRLabel;
    qrlRaca: TQRLabel;
    qrlPeso: TQRLabel;
    qrlPelagem: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrlAtesto: TQRLabel;
    qrlDiagnostico: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAtestadoSaude: TfrmRelAtestadoSaude;

implementation

{$R *.dfm}

end.
