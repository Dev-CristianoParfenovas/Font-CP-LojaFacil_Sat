unit untRecebeAg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, classComboBox, IBQuery;

type
  TfrmRecebeAgenda = class(TForm)
    cboTipoPagto: TComboBox;
    Label1: TLabel;
    lbl_edtValor: TLabeledEdit;
    lbl_edtTotalVenda: TLabeledEdit;
    lbl_edtTroco: TLabeledEdit;
    Image1: TImage;
    lbl_edtSair: TLabeledEdit;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTTipoPagto;
    procedure lbl_edtValorExit(Sender: TObject);
    procedure lbl_edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtTotalVendaKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtTrocoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboTipoPagtoKeyPress(Sender: TObject; var Key: Char);
    procedure cboTipoPagtoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl_edtTrocoKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtSairExit(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecebeAgenda: TfrmRecebeAgenda;
  IDTipoPagto : TClasseCombo;
  StringCompromissoAg : String;
  ValorVenda,ValorPago,ValorTroco : String;
  ClassTipoPagto   : TClasseCombo;
  StringTipoPagto  : String;

  IDTipoProd : Integer;
  StringCliente : String;
  IDClassCliente : TClasseCombo;
  IDClassCompr : TClasseCombo;

implementation

uses untdmModule, untBxAgenda;

{$R *.dfm}

procedure TfrmRecebeAgenda.Commit(IBQueryExec : TIBQuery);
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



procedure TfrmRecebeAgenda.ExecSELECTTipoPagto;

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


procedure TfrmRecebeAgenda.lbl_edtValorExit(Sender: TObject);

var

Valor1,Valor2 : Real;


begin
  with dmModule do begin

   if lbl_edtValor.Text <> '' Then begin //se for em branco executa rotina abaixo.

      if (Pos(',',lbl_edtValor.Text)>0) and (lbl_edtValor.Text <> '') Then begin

        Valor1 := StrToFloat(StringReplace(lbl_edtValor.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtTotalVenda.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtTroco.Text := FormatFloat(',0.00',(Valor1 - Valor2));


      end else begin

        Valor1 := StrToFloat(StringReplace(lbl_edtValor.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtTotalVenda.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtTroco.Text := FormatFloat(',0.00',(Valor1 - Valor2));


      end;{if}

    end;{if}

 {   if lbl_edtSubTotal.Text = '' Then begin

     lbl_edtSubTotal.Text := FormatFloat(',0.00',Valor3);

    end else begin

     Valor4 := StrToFloat(StringReplace(lbl_edtSubTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
     lbl_edtSubTotal.Text := FormatFloat(',0.00',(Valor4 + Valor3));   }

   // end;{if}

  end;{with}

end;

procedure TfrmRecebeAgenda.lbl_edtValorKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 Then begin

    lbl_edtTotalVenda.SetFocus;

  end;

end;

procedure TfrmRecebeAgenda.lbl_edtTotalVendaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then begin

    lbl_edtTroco.SetFocus;

  end;
  
end;

procedure TfrmRecebeAgenda.lbl_edtTrocoExit(Sender: TObject);
begin

  with dmModule do begin

    ConfirmaMSG:= Application.MessageBox('Confirma o Recebimento?','Notifica��o: Baixa da Agenda',MB_YESNO + MB_ICONQUESTION);

    if ConfirmaMSG = 6 then begin



      ValorVenda := StringReplace(lbl_edtTotalVenda.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorVenda := StringReplace(ValorVenda,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorVenda  = '' Then
          ValorVenda := '0';

      ValorPago := StringReplace(lbl_edtValor.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorPago := StringReplace(ValorPago,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorPago  = '' Then
         ValorPago := '0';

      ValorTroco := StringReplace(lbl_edtTroco.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorTroco := StringReplace(ValorTroco,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorTroco  = '' Then
         ValorTroco := '0';


     //traz a identificacao do produto do item do objeto selecionado.
      If cboTipoPagto.ItemIndex = -1 Then begin

        Application.MessageBox('Informe o Tipo de Pagamento','Notifica��o: Tipo Pagamento n�o especificado',MB_OK+MB_ICONERROR);

      end else begin

        ClassTipoPagto   := TClasseCombo( cboTipoPagto.Items.Objects[cboTipoPagto.ItemIndex] );
        StringTipoPagto  := ' ''' + InttoStr( ClassTipoPagto.ID ) + ''',';

      end;

      if lbl_edtTotalVenda.Text <> '' Then begin

        IDTipoProd := 1;

      end;{if}


      If frmBxAgenda.cboCliente.ItemIndex = -1 Then begin

        StringCliente     := ' ''0'',';

      end else begin

        IDClassCliente  := TClasseCombo( frmBxAgenda.cboCliente.Items.Objects[frmBxAgenda.cboCliente.ItemIndex] );
        StringCliente   := ' ''' + InttoStr( IDClassCliente.ID ) + ''',';

      end;


      If frmBxAgenda.cboTipoCompromisso.ItemIndex = -1 Then begin

        StringCompromissoAg          := ' '' 0 '',';

      end else begin

        IDClassCompr   := TClasseCombo( frmBxAgenda.cboTipoCompromisso.Items.Objects[frmBxAgenda.cboTipoCompromisso.ItemIndex] );
        StringCompromissoAg          := ' ''' + InttoStr( IDClassCompr.ID ) + ''',';

      end;


      ibRecVendas.Close;
      ibRecVendas.SQL.Clear;
      ibRecVendas.SQL.Add('INSERT INTO TBLRECEBEVENDAS'
      + '(TOTALVENDA,VLRPAGO,TROCO,IDTIPOPAGTO,IDAGCOMPR,IDTIPOPROD,IDCLI,DATA,HORA) values '
      + '(''' + ValorVenda + ''',''' + ValorPago + ''','
      + ' ''' + ValorTroco + ''','
      + StringTipoPagto
      + StringCompromissoAg
      + ' ''' + InttoStr(IDTipoProd) + ''','
      + StringCliente
      + ' ''' + FormatDateTime('mm-dd-yyyy',now) + ''','
      + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
      ibRecVendas.ExecSQL;
      Commit(ibRecVendas);

    end;{if confirma msg}

      frmRecebeAgenda.Close;

  end;{with}

end;

procedure TfrmRecebeAgenda.FormShow(Sender: TObject);
begin

  with dmModule do begin

  //  StringCliente := StringCli;
  //  StringCompromissoAg := StringTipoCompr;

    ExecSELECTTipoPagto;

    lbl_edtTotalVenda.Text := frmBxAgenda.lbl_edtVlrCobrado.Text;

  end;{with}

end;

procedure TfrmRecebeAgenda.cboTipoPagtoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 Then begin

   cboTipoPagto.DroppedDown := True;
   SendMessage(cboTipoPagto.Handle,CB_SHOWDROPDOWN,1,0);
   lbl_edtValor.SetFocus;

  end;

end;

procedure TfrmRecebeAgenda.cboTipoPagtoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  cboTipoPagto.DroppedDown := True;
  SendMessage(cboTipoPagto.Handle,CB_SHOWDROPDOWN,1,0);
  
end;

procedure TfrmRecebeAgenda.lbl_edtTrocoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 Then begin

    lbl_edtSair.SetFocus;

  end;
  
end;

procedure TfrmRecebeAgenda.lbl_edtSairExit(Sender: TObject);
begin
lbl_edtTotalVenda.Text := '0,00';
end;

end.
