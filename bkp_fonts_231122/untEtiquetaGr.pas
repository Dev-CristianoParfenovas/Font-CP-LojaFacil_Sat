unit untEtiquetaGr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, classComboBox,
  IBQuery, Printers, Data.DB;

type
  TfrmEtiquetaGr = class(TForm)
    lbl_edtRef: TLabeledEdit;
    lbl_edtCodBarras: TLabeledEdit;
    cboProdutos: TComboBox;
    lbl_edtVlrVenda: TLabeledEdit;
    GroupBox1: TGroupBox;
    ckEtiqueta1: TCheckBox;
    ckEtiqueta2: TCheckBox;
    ckEtiqueta3: TCheckBox;
    ckEtiqueta4: TCheckBox;
    ckEtiqueta5: TCheckBox;
    ckEtiqueta6: TCheckBox;
    ckEtiqueta7: TCheckBox;
    ckEtiqueta8: TCheckBox;
    ckEtiqueta9: TCheckBox;
    ckEtiqueta10: TCheckBox;
    ckEtiqueta16: TCheckBox;
    ckEtiqueta11: TCheckBox;
    ckEtiqueta17: TCheckBox;
    ckEtiqueta12: TCheckBox;
    ckEtiqueta18: TCheckBox;
    ckEtiqueta13: TCheckBox;
    ckEtiqueta19: TCheckBox;
    ckEtiqueta14: TCheckBox;
    ckEtiqueta20: TCheckBox;
    ckEtiqueta15: TCheckBox;
    ckEtiqueta21: TCheckBox;
    ckEtiqueta22: TCheckBox;
    ckEtiqueta23: TCheckBox;
    ckEtiqueta24: TCheckBox;
    dbgProdutos: TDBGrid;
    lbl_Produto: TLabel;
    procedure ibeaSairClick(Sender: TObject);
    procedure LimparBotoes;
    procedure LimpaCampo;
    procedure ExecSELECT;
    procedure ExecSELECTEtiqueta;
    procedure GravarEtiqueta;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure lbl_edtRefExit(Sender: TObject);
    procedure lbl_edtRefKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtCodBarrasChange(Sender: TObject);
    procedure lbl_edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure cboProdutosClick(Sender: TObject);
    procedure ibeaApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEtiquetaGr: TfrmEtiquetaGr;
  MontaColunas : Boolean;
  
implementation

uses untdmModule, funcPosto,untConfigEtiquetaGr;

{$R *.dfm}

procedure TfrmEtiquetaGr.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmEtiquetaGr.LimpaCampo;

begin

lbl_edtRef.Clear;
lbl_edtVlrVenda.Clear;
lbl_edtCodBarras.Clear;
cboProdutos.ClearSelection;

end;

procedure TfrmEtiquetaGr.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmEtiquetaGr.LimparBotoes;

begin

  ckEtiqueta1.Checked   := False;
  ckEtiqueta2.Checked   := False;
  ckEtiqueta3.Checked   := False;
  ckEtiqueta4.Checked   := False;
  ckEtiqueta5.Checked   := False;
  ckEtiqueta6.Checked   := False;
  ckEtiqueta7.Checked   := False;
  ckEtiqueta8.Checked   := False;
  ckEtiqueta9.Checked   := False;
  ckEtiqueta10.Checked  := False;
  ckEtiqueta11.Checked  := False;
  ckEtiqueta12.Checked  := False;
  ckEtiqueta13.Checked  := False;
  ckEtiqueta14.Checked  := False;
  ckEtiqueta15.Checked  := False;
  ckEtiqueta16.Checked  := False;
  ckEtiqueta17.Checked  := False;
  ckEtiqueta18.Checked  := False;
  ckEtiqueta19.Checked  := False;
  ckEtiqueta20.Checked  := False;
  ckEtiqueta21.Checked  := False;
  ckEtiqueta22.Checked  := False;
  ckEtiqueta23.Checked  := False;
  ckEtiqueta24.Checked  := False;

end;

procedure TfrmEtiquetaGr.ExecSELECT;

var
IDClassProduto : TClasseCombo;

begin
  with dmModule do begin


    Commit(ibProdutos);
    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS ORDER BY NOME');
    ibProdutos.Open;

    cboProdutos.Clear; //LIMPA O COMBOBOX
    while not ibProdutos.Eof do begin
      IDClassProduto     := TClasseCombo.Create;
      IDClassProduto.ID  := ibProdutos.FieldByName('IDPROD').AsInteger;
      cboProdutos.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDClassProduto);
      ibProdutos.Next;
    end;

  end;
end;

procedure TfrmEtiquetaGr.ExecSELECTEtiqueta;

begin

  with dmModule do begin

    ibEtiquetaGr.Close;
    ibEtiquetaGr.SQL.Clear;
    ibEtiquetaGr.SQL.Add('SELECT * FROM TBLETIQUETAGR');
    ibEtiquetaGr.Open;

    (ibEtiquetaGr.FieldByName('VLRVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

  end;//with

end;

procedure TfrmEtiquetaGr.GravarEtiqueta;

var
ClassGravaProd : TClasseCombo;
StringGravaProd,Valor : String;
Et1,Et2,Et3,Et4,Et5,Et6,Et7,Et8,Et9,Et10,Et11,Et12,Et13,Et14,Et15 : String;
Et16,Et17,Et18,Et19,Et20,Et21,Et22,Et23,Et24 : String;

begin

  with dmModule do begin

    if cboProdutos.ItemIndex = -1 Then begin

      StringGravaProd := ' ''0'',';

    end else begin

      ClassGravaProd  := TClasseCombo(cboProdutos.Items.Objects[cboProdutos.ItemIndex]);
      StringGravaProd := ' ''' + IntToStr(ClassGravaProd.ID) + ''','

    end;//if cboprodutos

    Commit(ibEtiquetaGr);
    ibEtiquetaGr.Close;
    ibEtiquetaGr.SQL.Clear;
    ibEtiquetaGr.SQL.Add('SELECT * FROM TBLETIQUETAGR ORDER BY IDETIQUETA DESC');
    ibEtiquetaGr.Open;

    if ckEtiqueta1.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA1').AsString = '')or(ibEtiquetaGr.FieldByName('ETIQUETA1').AsString = Null) Then begin

        Et1 := 'Sim';

      end else begin

        Et1 := 'Nao';

      end;

    end;

    if ckEtiqueta2.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA2').AsString = '')or(ibEtiquetaGr.FieldByName('ETIQUETA2').AsString = Null) Then begin

        Et2 := 'Sim';

      end else begin

        Et2 := 'Nao';

      end;

    end;

    if ckEtiqueta3.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA3').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA3').AsString = Null) Then begin

        Et3 := 'Sim';

      end else begin

        Et3 := 'Nao';

      end;

    end;

    if ckEtiqueta4.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA4').AsString = '')or(ibEtiquetaGr.FieldByName('ETIQUETA4').AsString = Null) Then begin

        Et4 := 'Sim';

      end else begin

        Et4 := 'Nao';

      end;

    end;

    if ckEtiqueta5.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA5').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA5').AsString = Null) Then begin

        Et5 := 'Sim';

      end else begin

        Et5 := 'Nao';

      end;

    end;

    if ckEtiqueta6.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA6').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA6').AsString = Null) Then begin

        Et6 := 'Sim';

      end else begin

        Et6 := 'Nao';

      end;

    end;

    if ckEtiqueta7.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA7').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA7').AsString = Null) Then begin

        Et7 := 'Sim';

      end else begin

        Et7 := 'Nao';

      end;

    end;

    if ckEtiqueta8.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA8').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA8').AsString = Null) Then begin

        Et8 := 'Sim';

      end else begin

        Et8 := 'Nao';

      end;

    end;


    if ckEtiqueta9.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA9').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA9').AsString = Null) Then begin

        Et9 := 'Sim';

      end else begin

        Et9 := 'Nao';

      end;

    end;


    if ckEtiqueta10.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA10').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA10').AsString = Null) Then begin

        Et10 := 'Sim';

      end else begin

        Et10 := 'Nao';

      end;

    end;

    if ckEtiqueta11.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA11').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA11').AsString = Null) Then begin

        Et11 := 'Sim';

      end else begin

        Et11 := 'Nao';

      end;

    end;

    if ckEtiqueta12.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA12').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA12').AsString = Null) Then begin

        Et12 := 'Sim';

      end else begin

       Et12 := 'Nao';

      end;

    end;

    if ckEtiqueta13.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA13').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA13').AsString = Null) Then begin

        Et13 := 'Sim';

      end else begin

        Et13 := 'Nao';

      end;

    end;

    if ckEtiqueta14.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA14').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA14').AsString = Null) Then begin

        Et14 := 'Sim';

      end else begin

        Et14 := 'Nao';

      end;

    end;

    if ckEtiqueta15.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA15').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA15').AsString = Null) Then begin

        Et15 := 'Sim';

      end else begin

        Et15 := 'Nao';

      end;

    end;


    if ckEtiqueta16.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA16').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA16').AsString = Null) Then begin

        Et16 := 'Sim';

      end else begin

        Et16 := 'Nao';

      end;

    end;

    if ckEtiqueta17.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA17').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA17').AsString = Null) Then begin

        Et17 := 'Sim';

      end else begin

        Et17 := 'Nao';

      end;

    end;

    if ckEtiqueta18.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA18').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA18').AsString = Null) Then begin

        Et18 := 'Sim';

     end else begin

        Et18 := 'Nao';

      end;

    end;

    if ckEtiqueta19.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA19').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA19').AsString = Null) Then begin

        Et19 := 'Sim';

      end else begin

       Et19 := 'Nao';

      end;

    end;

    if ckEtiqueta20.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA20').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA20').AsString = Null) Then begin

        Et20 := 'Sim';

      end else begin

        Et20 := 'Nao';

      end;

    end;

    if ckEtiqueta21.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA21').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA21').AsString = Null) Then begin

        Et21 := 'Sim';

     end else begin

        Et21 := 'Nao';

      end;

    end;

    if ckEtiqueta22.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA22').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA22').AsString = Null) Then begin

        Et22 := 'Sim';

      end else begin

        Et22 := 'Nao';

      end;

    end;

    if ckEtiqueta23.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA23').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA23').AsString = Null) Then begin

        Et23 := 'Sim';

      end else begin

        Et23 := 'Nao';

      end;

    end;

    if ckEtiqueta24.Checked Then begin

      if (ibEtiquetaGr.FieldByName('ETIQUETA24').AsString = '')or (ibEtiquetaGr.FieldByName('ETIQUETA24').AsString = Null) Then begin

        Et24 := 'Sim';

      end else begin

        Et24 := 'Nao';

      end;

    end;

    Valor := StringReplace(lbl_edtVlrVenda.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    Valor := StringReplace(Valor,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if Valor = '' Then
    valor := '0';

    {if Et1 = '' Then begin

     Et1 := 'Nao';

    end;

    if Et2 = '' Then begin

     Et2 := 'Nao';

    end;

    if Et3 = '' Then begin

     Et3 := 'Nao';

    end;

    if Et4 = '' Then begin

     Et4 := 'Nao';

    end;

    if Et5 = '' Then begin

     Et5 := 'Nao';

    end;

    if Et6 = '' Then begin

     Et6 := 'Nao';

    end;

    if Et7 = '' Then begin

     Et7 := 'Nao';

    end;

    if Et8 = '' Then begin

     Et8 := 'Nao';

    end;

    if Et9 = '' Then begin

     Et9 := 'Nao';

    end;

    if Et10 = '' Then begin

     Et10 := 'Nao';

    end;

    if Et11 = '' Then begin

     Et11 := 'Nao';

    end;

    if Et12 = '' Then begin

     Et12 := 'Nao';

    end;

    if Et13 = '' Then begin

     Et13 := 'Nao';

    end;

    if Et14 = '' Then begin

     Et14 := 'Nao';

    end;

    if Et15 = '' Then begin

     Et15 := 'Nao';

    end;

    if Et16 = '' Then begin

     Et16 := 'Nao';

    end;

    if Et17 = '' Then begin

     Et17 := 'Nao';

    end;

    if Et18 = '' Then begin

     Et18 := 'Nao';

    end;

    if Et19 = '' Then begin

     Et19 := 'Nao';

    end;

    if Et20 = '' Then begin

     Et20 := 'Nao';

    end;

    if Et21 = '' Then begin

     Et21 := 'Nao';

    end;

    if Et22 = '' Then begin

     Et22 := 'Nao';

    end;

    if Et23 = '' Then begin

     Et23 := 'Nao';

    end;

    if Et24 = '' Then begin

     Et24 := 'Nao';

    end;}

    ibEtiquetaGr.Close;
    ibEtiquetaGr.SQL.Clear;
    ibEtiquetaGr.SQL.Add('INSERT INTO TBLETIQUETAGR'
    +'(NOMEPROD,IDPROD,CODBARRAS,VLRVENDA,REF,ETIQUETA1,ETIQUETA2,ETIQUETA3,ETIQUETA4,'
    + 'ETIQUETA5,ETIQUETA6,ETIQUETA7,ETIQUETA8,ETIQUETA9,ETIQUETA10,'
    + 'ETIQUETA11,ETIQUETA12,ETIQUETA13,ETIQUETA14,ETIQUETA15,ETIQUETA16,'
    + 'ETIQUETA17,ETIQUETA18,ETIQUETA19,ETIQUETA20,ETIQUETA21,ETIQUETA22,'
    + 'ETIQUETA23,ETIQUETA24) values'
    + '(''' + cboProdutos.Text + ''','
    +StringGravaProd
    + ' ''' + lbl_edtCodBarras.Text + ''','
    + ' ''' + Valor + ''','
    + ' ''' + lbl_edtRef.Text + ''','
    + ' ''' + Et1 + ''',''' + Et2 + ''','
    + ' ''' + Et3 + ''',''' + Et4 + ''','
    + ' ''' + Et5 + ''',''' + Et6 + ''','
    + ' ''' + Et7 + ''',''' + Et8 + ''','
    + ' ''' + Et9 + ''',''' + Et10 + ''','
    + ' ''' + Et11 + ''',''' + Et12 + ''','
    + ' ''' + Et13 + ''',''' + Et14 + ''','
    + ' ''' + Et15 + ''',''' + Et16 + ''','
    + ' ''' + Et17 + ''',''' + Et18 + ''','
    + ' ''' + Et19 + ''',''' + Et20 + ''','
    + ' ''' + Et21 + ''',''' + Et22 + ''','
    + ' ''' + Et23 + ''',''' + Et24 + ''')');
    ibEtiquetaGr.ExecSQL;
    Commit(ibEtiquetaGr);

    LimpaCampo;

  end;//with

end;


procedure TfrmEtiquetaGr.ibeaIncluirClick(Sender: TObject);
begin

  with dmModule do begin

    GravarEtiqueta;
    ExecSELECTEtiqueta;
    
  end;//with

end;

procedure TfrmEtiquetaGr.lbl_edtRefExit(Sender: TObject);

var

i : Integer;

begin

  with dmModule do begin

    if lbl_edtRef.Text <> '' Then begin

      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CADPRODUTOS.REF=''' + lbl_edtRef.Text + '''');
      ibProdutos.Open;

      (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      lbl_edtRef.Text := ibProdutos.FieldByName('REF').asString;
      lbl_edtVlrVenda.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

      for i:=0 to cboProdutos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboProdutos.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboProdutos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboProdutos.ClearSelection;//LIMPA A SELECAO.}
        end;{if}
      end;{for}

    end;//if lbl_edtref<> ''

  end;//with

end;

procedure TfrmEtiquetaGr.lbl_edtRefKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtCodBarras.SetFocus;

  end;//if
  
end;

procedure TfrmEtiquetaGr.lbl_edtCodBarrasChange(Sender: TObject);

var

i : Integer;


begin

  with dmModule do begin

    if lbl_edtCodBarras.Text <> '' Then begin

      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarras.Text + ''' or CADPRODUTOS.CODBARRASAD=''' + lbl_edtCodBarras.Text + '''');
      ibProdutos.Open;

      (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      lbl_edtRef.Text := ibProdutos.FieldByName('REF').asString;
      lbl_edtVlrVenda.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);


      if (ibProdutos.FieldByName('CODBARRASAD').AsString <> '')and(ibProdutos.FieldByName('CODBARRAS').AsString = '') Then begin

        lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRASAD').AsString;

      end else if (ibProdutos.FieldByName('CODBARRASAD').AsString <> '')and(ibProdutos.FieldByName('CODBARRAS').AsString <> '')Then begin

        lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRASAD').AsString;

      end else if (ibProdutos.FieldByName('CODBARRASAD').AsString = '')or(ibProdutos.FieldByName('CODBARRASAD').AsString = 'null')and(ibProdutos.FieldByName('CODBARRAS').AsString <> '')Then begin

        lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRAS').AsString;

      end;

      for i:=0 to cboProdutos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboProdutos.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboProdutos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboProdutos.ClearSelection;//LIMPA A SELECAO. }
        end;{if}
      end;{for}

    end;//if cob barras <> ''
    
  end;{with}

end;

procedure TfrmEtiquetaGr.lbl_edtCodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtVlrVenda.SetFocus;

  end;//if

end;

procedure TfrmEtiquetaGr.cboProdutosClick(Sender: TObject);

var

i : Integer;
IDDadosProd : TClasseCombo;
StringDadosProd : String;
begin

  with dmModule do begin

    if cboProdutos.ItemIndex <> - 1 Then begin

      IDDadosProd := TClasseCombo(cboProdutos.Items.Objects[cboProdutos.ItemIndex]);
      StringDadosProd := ' IDPROD=''' + IntToStr(IDDadosProd.ID) + '''';

    end;{if}

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CADPRODUTOS.IDPROD=''' + IntToStr(IDDadosProd.ID) + '''');
    ibProdutos.Open;

    (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


    lbl_edtRef.Text := ibProdutos.FieldByName('REF').asString;
    lbl_edtVlrVenda.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

    if (ibProdutos.FieldByName('CODBARRASAD').AsString <> '')and(ibProdutos.FieldByName('CODBARRAS').AsString = '') Then begin

      lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRASAD').AsString;

    end else if (ibProdutos.FieldByName('CODBARRASAD').AsString <> '')and(ibProdutos.FieldByName('CODBARRAS').AsString <> '')Then begin

      lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRASAD').AsString;

    end else if (ibProdutos.FieldByName('CODBARRASAD').AsString = '')or(ibProdutos.FieldByName('CODBARRASAD').AsString = 'null')and(ibProdutos.FieldByName('CODBARRAS').AsString <> '')Then begin

      lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRAS').AsString;

    end;

    for i:=0 to cboProdutos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboProdutos.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboProdutos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboProdutos.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}

  end;{with}


end;

procedure TfrmEtiquetaGr.ibeaApagarClick(Sender: TObject);

begin

  with dmModule do begin

    ibEtiquetaGr.Close;
    ibEtiquetaGr.SQL.Clear;
    ibEtiquetaGr.SQL.Add('DELETE FROM TBLETIQUETAGR');
    ibEtiquetaGr.ExecSQL;
    Commit(ibEtiquetaGr);

    ExecSELECTEtiqueta;
    
    LimparBotoes;

  end;//with

end;

procedure TfrmEtiquetaGr.FormShow(Sender: TObject);
begin

 with dmModule do begin

   ExecSELECT;
   ExecSELECTEtiqueta;
   
    with dbgProdutos do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

         DataSource := dtsEtiquetaGr;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);

        //Parametros da Coluna que exibe o C�digo da entrada no estoque
        Columns.Items[0].Title.Caption := 'Ref.';
        Columns.Items[0].FieldName     := 'REF';
        Columns.Items[0].Width         := 100;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[1].Title.Caption := 'Descri��o do Produto';
        Columns.Items[1].FieldName     := 'NOMEPROD';
        Columns.Items[1].Width         := 280;
        Columns.Items[1].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[2].Title.Caption := 'Valor';
        Columns.Items[2].FieldName     := 'VLRVENDA';
        Columns.Items[2].Width         := 70;
        Columns.Items[2].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with}

////////////////////////////////////////////////////////////////////////////////

 end;//with

end;

procedure TfrmEtiquetaGr.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmEtiquetaGr.btImprimirClick(Sender: TObject);
begin
frmConfigEtiquetaGr.ShowModal;
end;

end.
