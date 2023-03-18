unit untRelBxAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmRelBxAgenda = class(TForm)
    qrpBxAgenda: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrdbCliente: TQRDBText;
    qrdbNomeAnimal: TQRDBText;
    qrdbTipoCompr: TQRDBText;
    qrdbValor: TQRDBText;
    qrdbData: TQRDBText;
    qrdbHora: TQRDBText;
    QRLabel2: TQRLabel;
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
  frmRelBxAgenda: TfrmRelBxAgenda;

implementation

{$R *.dfm}

end.
