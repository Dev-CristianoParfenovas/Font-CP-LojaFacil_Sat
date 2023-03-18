unit untfrmREtiquetaZebra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfrmREtiquetaZebra = class(TForm)
    qrpZebra: TQuickRep;
    DetailBand1: TQRBand;
    qrl_CodB3: TQRLabel;
    qrl_Nome2: TQRLabel;
    qrl_CodB2: TQRLabel;
    qrl_Nome1: TQRLabel;
    qrl_CodB1: TQRLabel;
    qriCod2: TQRImage;
    qrl_Vlr2: TQRLabel;
    qrl_P2: TQRLabel;
    qrl_Vlr3: TQRLabel;
    qrl_P3: TQRLabel;
    qriCod1: TQRImage;
    qrl_Vlr1: TQRLabel;
    qrl_P1: TQRLabel;
    qriCod3: TQRImage;
    qrl_Nome3: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmREtiquetaZebra: TfrmREtiquetaZebra;

implementation

{$R *.dfm}

end.
