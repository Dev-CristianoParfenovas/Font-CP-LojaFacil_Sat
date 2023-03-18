unit untAtestadoVacinacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfrmAtestVacinacao = class(TForm)
    qrpAtestadoVacinacao: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    qrl_ATVacina: TQRLabel;
    qrlCliente: TQRLabel;
    qrlNomeAnimal: TQRLabel;
    qrlSexoAnimal: TQRLabel;
    qrlRaca: TQRLabel;
    qrlPeso: TQRLabel;
    qrlPelagem: TQRLabel;
    QRLabel1: TQRLabel;
    qrdbCliente: TQRDBText;
    qrdbNomeAnimal: TQRDBText;
    qrdbSexo: TQRDBText;
    qrdbRaca: TQRDBText;
    qrdbPeso: TQRDBText;
    qrdbPelagem: TQRDBText;
    qrdbNascto: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtestVacinacao: TfrmAtestVacinacao;

implementation

{$R *.dfm}

end.
