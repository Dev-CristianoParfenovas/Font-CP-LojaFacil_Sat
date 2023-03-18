unit untMaladireta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IBEAntialiasButton;

type
  TfrmMalaDireta = class(TForm)
    lbl_edtEndereco: TLabeledEdit;
    lbl_edtNumero: TLabeledEdit;
    lbl_edtComplemento: TLabeledEdit;
    lbl_edtBairro: TLabeledEdit;
    lbl_edtCep: TLabeledEdit;
    lbl_edtCidade: TLabeledEdit;
    lbl_edtEstado: TLabeledEdit;
    lbl_edtCodigo: TLabeledEdit;
    cboCliente: TComboBox;
    imgInformacao: TImage;
    lbl_Inf: TLabel;
    Label1: TLabel;
    ibeaSair: TIBEAntialiasButton;
    procedure ibeaSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMalaDireta: TfrmMalaDireta;

implementation

{$R *.dfm}

procedure TfrmMalaDireta.ibeaSairClick(Sender: TObject);
begin
  Close;
end;

end.
