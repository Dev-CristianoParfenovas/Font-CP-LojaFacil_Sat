unit untLocalEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBEAntialiasButton, StdCtrls, CheckLst, mxFlatControls, RxGIF,
  ExtCtrls;

type
  TfrmLocalEstoque = class(TForm)
    Label1: TLabel;
    Image13: TImage;
    lbl_edtDescricao: TLabeledEdit;
    mxFlatPanel1: TmxFlatPanel;
    Image2: TImage;
    Label6: TLabel;
    Label3: TLabel;
    lblTotalProdutos: TLabel;
    Label5: TLabel;
    lblTotalEstoque: TLabel;
    chkListLocalEstocagem: TmxFlatCheckListBox;
    btnExcluir: TIBEAntialiasButton;
    btnAlterar: TIBEAntialiasButton;
    ibeaIncluir: TIBEAntialiasButton;
    btnSair: TIBEAntialiasButton;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalEstoque: TfrmLocalEstoque;

implementation

{$R *.dfm}

procedure TfrmLocalEstoque.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
