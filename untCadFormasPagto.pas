unit untCadFormasPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  ExtCtrls;

type
  TfrmCadFormasPagto = class(TForm)
    lbl_edtFormasPagto: TLabeledEdit;
    procedure ibeaSairClick(Sender: TObject);
    procedure ibeaCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFormasPagto: TfrmCadFormasPagto;

implementation

uses DB;

{$R *.dfm}

procedure TfrmCadFormasPagto.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadFormasPagto.ibeaCadastrarClick(Sender: TObject);

/// var

 ///Str_Descricao_das_Formas_Pagamento: String;
/// ConfirmaCadastro : Integer;

 begin

///  if lbl_edtFormasPagto.Text <> '' Then begin

 ///   ConfirmaCadastro := Application.MessageBox('Confirma as Formas de Pagamento?','Cadastro de Formas de Pagamento',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

  ///  if ConfirmaCadastro = 6 Then begin

  ///    Str_Descricao_das_Formas_Pagamento := lbl_edtFormasPagto.Text;
   ///
     /// Int_Retorno := Daruma_FI_ProgramaFormasPagamento( pchar( Str_Descricao_das_Formas_Pagamento ) );

  ///  end;//if

 /// end;//if

end;

end.
