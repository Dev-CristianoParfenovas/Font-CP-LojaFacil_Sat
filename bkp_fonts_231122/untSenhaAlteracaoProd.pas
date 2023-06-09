unit untSenhaAlteracaoProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IBQuery, Buttons;

type
  TfrmSenhaAlteracaoProd = class(TForm)
    lbl_edtSenha: TLabeledEdit;
    ibeaOk: TSpeedButton;
    ibeaSair: TSpeedButton;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ibeaOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaAlteracaoProd: TfrmSenhaAlteracaoProd;

implementation

uses untdmModule, untProdutos_MPrima, untServicos;

{$R *.dfm}

procedure TfrmSenhaAlteracaoProd.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmSenhaAlteracaoProd.Commit(IBQueryExec : TIBQuery);
begin

  with dmModule do begin

    with IBQueryExec do begin
      SQL.Clear;
      SQL.Add('Commit');
      Open;
      Close;
    end;

  end;

end;

procedure TfrmSenhaAlteracaoProd.ibeaOkClick(Sender: TObject);

var
strTipoUsuario : String;

begin

  with dmModule do begin

    if lbl_edtSenha.Text <> '' Then begin

      Commit(ibUser);
      ibUser.Close;
      ibUser.SQL.Clear;
      ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE SENHA=''' + lbl_edtSenha.Text + '''');
      ibUser.Open;

      strTipoUsuario := ibUser.FieldByName('TIPOUSUARIO').AsString;

      if ibUser.RecordCount > 0 Then begin

        if frmProd_MPrima.Showing Then begin

          if ibUser.FieldByName('ALTERACAODEPRODUTOS').AsString = 'Bloqueado' Then begin

            ShowMessage('Altera��o n�o permitida');
            frmSenhaAlteracaoProd.Close;
            frmProd_MPrima.Close;

          end else begin

            frmSenhaAlteracaoProd.Close;

          end;

        end;

        if frmVendasLoja.Showing then begin

          if strTipoUsuario = 'Administrador' then begin

            frmVendasLoja.lbl_CancelaItem.Caption := 'Cancelar Item';
            frmVendasLoja.dbgVendas.SetFocus;
            frmSenhaAlteracaoProd.Close;

          end else begin

             ShowMessage('Para cancelar o item da venda contate o administrador');
             frmSenhaAlteracaoProd.Close;

          end;

        end;

      end else begin

          ShowMessage('Senha n�o existente');
          frmSenhaAlteracaoProd.Close;

      end;//if recordcount

    end;//if label senha

  end;//with

end;

procedure TfrmSenhaAlteracaoProd.FormShow(Sender: TObject);
begin

  lbl_edtSenha.Clear;

end;

end.
