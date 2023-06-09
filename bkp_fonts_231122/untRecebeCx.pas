unit untRecebeCx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, classComboBox;

type
  TfrmRecebimentoCx = class(TForm)
    cboTipoPagto: TComboBox;
    lbl_edtValor: TLabeledEdit;
    Label1: TLabel;
    imgFundo: TImage;
    lbl_edtSubtotal: TLabeledEdit;


    procedure ExecSELECTTipoPagto;
    procedure FormShow(Sender: TObject);
    procedure cboTipoPagtoKeyPress(Sender: TObject; var Key: Char);
    procedure cboTipoPagtoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl_edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtValorExit(Sender: TObject);
    procedure lbl_edtSubtotalKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecebimentoCx: TfrmRecebimentoCx;

  IDTipoPagto : TClasseCombo; //variavel pra trazer os dados no combo de consulta do pagto avulso
  Valor3 : Real;


implementation

uses  untFrenteCaixa, untdmModule;

{$R *.dfm}



procedure TfrmRecebimentoCx.ExecSELECTTipoPagto;

begin

  with dmModule do begin

    ibTipoPagtoF.Close;
    ibTipoPagtoF.SQL.Clear;
    ibTipoPagtoF.SQL.Add('SELECT * FROM TBLTIPOPAGTOAVULSO');
    ibTipoPagtoF.Open;

    cboTipoPagto.Clear;

    while not ibTipoPagtoF.Eof do begin

      IDTipoPagto    := TClasseCombo.Create;
      IDTipoPagto.ID := ibTipoPagtoF.FieldByName('IDTIPO').AsInteger;
      cboTipoPagto.Items.AddObject(ibTipoPagtoF.FieldByName('DESCRICAO').AsString,IDTipoPagto);
      ibTipoPagtoF.Next;

    end;{while}

  end;{with}

end;


procedure TfrmRecebimentoCx.FormShow(Sender: TObject);
begin

  cboTipoPagto.SetFocus;

  with dmModule do begin

    ExecSELECTTipoPagto;

  end;{with}

end;

procedure TfrmRecebimentoCx.cboTipoPagtoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 Then begin

   cboTipoPagto.DroppedDown := True;
   SendMessage(cboTipoPagto.Handle,CB_SHOWDROPDOWN,1,0);
   lbl_edtValor.SetFocus;

  end;

end;

procedure TfrmRecebimentoCx.cboTipoPagtoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  cboTipoPagto.DroppedDown := True;
  SendMessage(cboTipoPagto.Handle,CB_SHOWDROPDOWN,1,0);

end;

procedure TfrmRecebimentoCx.lbl_edtValorKeyPress(Sender: TObject;
  var Key: Char);

var

Produto : Array[0..10] of String;

begin

  if Key = #13 Then begin

    lbl_edtSubtotal.SetFocus;

    Produto[0]:=frmFrentedeCaixa.lbl_edtTotalVendas.Text;
    Produto[1]:=cboTipoPagto.Text;
    Produto[2]:=lbl_edtValor.Text;
    Produto[3]:=lbl_edtSubtotal.Text;

    frmFrentedeCaixa.listboxCupom.Items.Add('');
    frmFrentedeCaixa.listboxCupom.Items.Add('Total da Venda' + ' ' + '=' + ' ' +  Produto[0]);
    frmFrentedeCaixa.listboxCupom.Items.Add(Produto[1] + ' ' + '=' + ' ' + Produto[2]);

    frmFrentedeCaixa.listboxCupom.Items.Add('TROCO' + ' ' + '=' + ' ' +Produto[3]);
    frmFrentedeCaixa.listboxCupom.Items.Add('');
    frmFrentedeCaixa.listboxCupom.Items.Add('Obrigado Pela PreferÍncia!');
    frmFrentedeCaixa.listboxCupom.Items.Add('' + '' + 'Volte Sempre!');
    
  end;

end;

procedure TfrmRecebimentoCx.lbl_edtValorExit(Sender: TObject);

var

Valor1,Valor2 : Real;

begin

  with dmModule do begin


    if (frmFrentedeCaixa.lbl_edtTotalVendas.Text <> '') Then begin// se for em branco executa rotina abaixo.

     if (Pos(',',frmFrentedeCaixa.lbl_edtTotalVendas.Text)>0) and (frmFrentedeCaixa.lbl_edtTotalVendas.Text <> '') Then begin

        Valor1 := StrToFloat(StringReplace(frmFrentedeCaixa.lbl_edtTotalVendas.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtValor.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor3 := (Valor2 - Valor1);
        lbl_edtSubtotal.Text := FormatFloat(',0.00',Valor3);
      //  lbl_edtSubtotal.Text := VirgPonto(lbl_edtSubtotal.Text);

      end else begin

        Valor1 := StrToFloat(StringReplace(frmFrentedeCaixa.lbl_edtTotalVendas.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtValor.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor3 := (Valor2 - Valor1);
        lbl_edtSubtotal.Text := FormatFloat(',0.00',Valor3);


      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmRecebimentoCx.lbl_edtSubtotalKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 Then begin

    frmRecebimentoCx.Close;

    frmFrentedeCaixa.listboxCupom.Clear;
    frmFrentedeCaixa.lbl_edtCodBarra.Clear;
    frmFrentedeCaixa.lbl_edtCodigo.Clear;
  //  frmFrentedeCaixa.lbl_edtBico.Clear;
    frmFrentedeCaixa.lbl_edtDescricao.Clear;
    frmFrentedeCaixa.lbl_edtQtde.Clear;
    frmFrentedeCaixa.lbl_edtVlrUnitario.Clear;
    frmFrentedeCaixa.lbl_edtVlrTotal.Clear;
    frmFrentedeCaixa.lbl_edtTotalVendas.Clear;
    frmFrentedeCaixa.mCabecalho.Visible := False;

  end;

end;

end.
