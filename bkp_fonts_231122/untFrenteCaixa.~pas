unit untFrenteCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB;

type
  TfrmFrentedeCaixa = class(TForm)
    imgFundo: TImage;
    sCupom: TShape;
    sMensagem: TShape;
    imgCupom: TImage;
    imgMensagem: TImage;
    sLogo: TShape;
    imgLOGO: TImage;
    sData: TShape;
    lbl_edtData: TLabeledEdit;
    Shape1: TShape;
    Image1: TImage;
    lbl_edtCodigo: TLabeledEdit;
    lbl_edtDescricao: TLabeledEdit;
    lbl_edtQtde: TLabeledEdit;
    lbl_edtVlrUnitario: TLabeledEdit;
    lbl_edtVlrTotal: TLabeledEdit;
    Image2: TImage;
    lbl_X: TLabel;
    lbl_Igual: TLabel;
    mCabecalho: TMemo;
    lbl_edtCodBarra: TLabeledEdit;
    listboxCupom: TListBox;
    lbl_edtFuncionario: TLabeledEdit;
    lbl_edtTotalVendas: TLabeledEdit;

    procedure ExecSELECTProdutos;
    procedure ExibeProdutos;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl_edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtQtdeExit(Sender: TObject);
    procedure lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtVlrTotalExit(Sender: TObject);
    procedure lbl_edtVlrTotalKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure lbl_edtCodBarraChange(Sender: TObject);
    procedure lbl_edtCodBarraKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFrentedeCaixa: TfrmFrentedeCaixa;

  IDProduto : Integer;//variavel para trazer o produto atraves do id no busca produtos pro caixa.

implementation

uses funcPosto, uBuscaProdutos, untRecebeCx, untdmModule;

{$R *.dfm}

procedure TfrmFrentedeCaixa.ExibeProdutos;

begin

  with dmModule do begin


  lbl_edtCodigo.Text       := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);
  lbl_edtDescricao.Text    := ibProdutos.FieldByName('NOME').AsString;
  lbl_edtVlrUnitario.Text  := FormatFloat(CasasDecimais('Combustiveis'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

  lbl_edtQtde.Clear;
  lbl_edtVlrTotal.Clear;


  end;{with}

end;

procedure TfrmFrentedeCaixa.ExecSELECTProdutos;

begin

  with dmModule do begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE IDPROD=''' + IntToStr(IDProduto) + '''');
    ibProdutos.Open;

  end;{with}

end;

procedure TfrmFrentedeCaixa.FormShow(Sender: TObject);
begin

  lbl_edtData.Text := FormatDateTime('dd/mm/yyy',now);
  mCabecalho.Visible  := False;

  lbl_edtCodBarra.SetFocus;

  with dmModule do begin

 //   lbl_edtFuncionario.Text := frmSenhaCaixa.cboUsuario.Text;

  {  if frmPosto.Active Then begin

    lbl_edtFuncionario.Text := frmPosto.lbl_edtFuncionario.Text;

    mCabecalho.Visible := True;

    end; }

    ExecSELECTProdutos;

  end;{with}

end;

procedure TfrmFrentedeCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  with dmModule do begin

    case Key of

      VK_F2:begin

        mCabecalho.Visible := True;

      end;{begin}

      VK_F3:begin

        frmRecebimentoCx.ShowModal;

      end;{begin}


      VK_F7:begin

        frmBuscaProdutos.ShowModal;

         //select para trazer os dados do produto
        ibProdutos.Close;
        ibProdutos.SQL.Clear;
        ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS');
        ibProdutos.Open;

    //    lbl_edtBico.Clear;

      end;{begin}

    end;{case}

  end;{with}

end;

procedure TfrmFrentedeCaixa.lbl_edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  with dmModule do begin

   if Key=#13 Then begin

      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CADPRODUTOS.IDPROD=''' + lbl_edtCodigo.Text + '''');
      ibProdutos.Open;
      (ibProdutos.FieldByName('VALORCUSTO') as TFloatField).DisplayFormat      := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO
      (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat      := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO
      (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat      := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO



      lbl_edtDescricao.Text   := ibProdutos.FieldByName('NOME').AsString;
      
      lbl_edtVlrUnitario.Text := FormatFloat(CasasDecimais('Combustiveis'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

      lbl_edtQtde.SetFocus;

    end;{if}

  end{with}
end;

procedure TfrmFrentedeCaixa.lbl_edtQtdeExit(Sender: TObject);
var

Valor1,Valor2 : Real;

begin

  with dmModule do begin


    if (lbl_edtQtde.Text <> '') Then begin// se for em branco executa rotina abaixo.

      if (Pos(',',lbl_edtQtde.Text)>0) and (lbl_edtQtde.Text <> '') Then begin

        Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtVlrTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

      //  Valor3 := (Valor2 * Valor1);

     end else begin

        Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtVlrTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

     //   Valor3 := (Valor2 * Valor1);

      end;{if}

    end;{if}

  //  if lbl_edtTotalVendas.Text <> '' Then begin

   //  lbl_edtTotalVendas.Text := FormatFloat(',0.00',Valor3);

  //  end else begin

 //   Valor4 := StrToFloat(StringReplace(lbl_edtTotalVendas.Text,ThousandSeparator,'',[rfReplaceAll]));
  //  lbl_edtTotalVendas.Text := FormatFloat(',0.00',(Valor4 + Valor3));

  //  end;{if}

  end;{with}

end;

procedure TfrmFrentedeCaixa.lbl_edtQtdeKeyPress(Sender: TObject;
  var Key: Char);


begin

  if Key = #13 Then begin

    lbl_edtVlrTotal.SetFocus;

  end;

end;

procedure TfrmFrentedeCaixa.lbl_edtVlrTotalExit(Sender: TObject);
var

Valor1,Valor2,Valor3,Valor4 : Real;

begin

  with dmModule do begin


    if (lbl_edtVlrTotal.Text <> '') Then begin// se for em branco executa rotina abaixo.

      if (Pos(',',lbl_edtVlrTotal.Text)>0) and (lbl_edtVlrTotal.Text <> '') Then begin

        Valor1 := StrToFloat(StringReplace(lbl_edtVlrTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtQtde.Text := FormatFloat(',0.00',(Valor1 / Valor2));

        Valor3 := Valor1;

      end else begin

        Valor1 := StrToFloat(StringReplace(lbl_edtVlrTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtQtde.Text := FormatFloat(',0.00',(Valor1 / Valor2));

       Valor3 := Valor1;

      end;{if}

    end;{if}

    if lbl_edtTotalVendas.Text = '' Then begin

     lbl_edtTotalVendas.Text := FormatFloat(',0.00',Valor3);

   end else begin

     Valor4 := StrToFloat(StringReplace(lbl_edtTotalVendas.Text,ThousandSeparator,'',[rfReplaceAll]));
     lbl_edtTotalVendas.Text := FormatFloat(',0.00',(Valor4 + Valor3));

    end;{if}

    lbl_edtCodBarra.Clear;
    lbl_edtCodigo.Clear;
  //  lbl_edtBico.Clear;
    lbl_edtDescricao.Clear;
    lbl_edtQtde.Clear;
    lbl_edtVlrUnitario.Clear;
    lbl_edtVlrTotal.Clear;

  end;{with}

end;

procedure TfrmFrentedeCaixa.lbl_edtVlrTotalKeyPress(Sender: TObject;
  var Key: Char);

var

Produto : Array[0..50] of String;

begin

  if Key = #13 Then begin

    Produto[0]:=lbl_edtCodigo.Text;
    Produto[1]:=lbl_edtDescricao.Text;
    Produto[2]:=lbl_edtQtde.Text;
    Produto[3]:=lbl_X.Caption;
    Produto[4]:=lbl_edtVlrUnitario.Text;
    Produto[5]:=lbl_Igual.Caption;
    Produto[6]:=lbl_edtVlrTotal.Text;


    listboxCupom.Items.Add(Produto[0] + ' ' + '-' + ' ' + Produto[1]);
    listboxCupom.Items.Add(Produto[2] + ' ' + ' ' + ' ' + Produto[3] + ' ' + ' ' + ' ' + Produto[4] + ' ' + ' ' + ' ' + Produto[5]  + ' ' + ' ' + ' ' + Produto[6]);

    lbl_edtCodBarra.SetFocus;

 //   lbl_edtQtde.Clear;
  //  lbl_edtVlrTotal.Clear;
   { lbl_edtCodigo.Clear;
    lbl_edtBico.Clear;
    lbl_edtDescricao.Clear;

    lbl_edtVlrUnitario.Clear;
     }

  end;

end;

procedure TfrmFrentedeCaixa.FormActivate(Sender: TObject);
//var
//  MatTabs : Array[0..5] of Integer;
begin
{  MatTabs[0] := 40;
  MatTabs[1] := 80;
  MatTabs[2] := 200;
  MatTabs[3] := 400;
  MatTabs[4] := 500;
  MatTabs[5] := 700;
  listboxCupom.Perform(LB_SETTABSTOPS,1,Integer(@MatTabs[0]));  }
end;

procedure TfrmFrentedeCaixa.lbl_edtCodBarraChange(Sender: TObject);

var

i : Integer;

begin

  with dmModule do begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CODBARRAS=''' + lbl_edtCodBarra.Text + '''');
    ibProdutos.Open;

    {  for i:=0 to cboProduto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboProduto.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboProduto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboProduto.ClearSelection;//LIMPA A SELECAO. }
     //   end;{if}
     // end;{for}

    lbl_edtDescricao.Text := ibProdutos.FieldByName('NOME').AsString;
    lbl_edtVlrunitario.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

  end;{with}


end;

procedure TfrmFrentedeCaixa.lbl_edtCodBarraKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 Then begin

    if lbl_edtCodBarra.Text <> '' Then begin

      lbl_edtQtde.SetFocus;

    end;

  end;

end;

end.
