unit untRelTermoAutSacrif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmAutSacrif = class(TForm)
    qrpAutSacrif: TQuickRep;
    DetailBand1: TQRBand;
    qrdbCliente: TQRDBText;
    qrdbNomeAnimal: TQRDBText;
    qrdbSexo: TQRDBText;
    qrdbRaca: TQRDBText;
    qrdbPeso: TQRDBText;
    qrdbPelagem: TQRDBText;
    qrdbNascto: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    TitleBand1: TQRBand;
    qrlCliente: TQRLabel;
    qrlNomeAnimal: TQRLabel;
    qrlSexoAnimal: TQRLabel;
    qrlRaca: TQRLabel;
    qrlPeso: TQRLabel;
    qrlPelagem: TQRLabel;
    QRLabel2: TQRLabel;
    QRMemo1: TQRMemo;
    qrl_Prop: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutSacrif: TfrmAutSacrif;

implementation

{$R *.dfm}

end.
