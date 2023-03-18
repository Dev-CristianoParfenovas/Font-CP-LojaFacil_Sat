unit untRelProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport,
  StdCtrls, Buttons;

type
  TfrmRelProd = class(TForm)
    qrpProdutos: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    qrlProdutos: TQRLabel;
    qrlCodigo: TQRLabel;
    qrdbCodigo: TQRDBText;
    qrlDescricao: TQRLabel;
    qrdbDescricao: TQRDBText;
    qrlVlrVenda: TQRLabel;
    qrdbValorVenda: TQRDBText;
    qrl_Fabr: TQRLabel;
    qrdbCodFabr: TQRDBText;
    qrsysdataPagina: TQRSysData;
    procedure IBEAntialiasButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProd: TfrmRelProd;

implementation

uses untdmModule;


{$R *.dfm}

procedure TfrmRelProd.IBEAntialiasButton1Click(Sender: TObject);
begin
qrpProdutos.ExportToFilter(TQRAsciiExportFilter.Create('C:\REPORT.TXT'));
end;

end.
