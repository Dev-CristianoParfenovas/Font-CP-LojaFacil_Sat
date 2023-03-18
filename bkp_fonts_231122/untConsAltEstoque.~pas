unit untConsAltEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, IBEAntialiasButton, StdCtrls, ExtCtrls, IBQuery,
  classComboBox, DB, RxGIF;

type
  TfrmConsAlteraEstoque = class(TForm)
    cboConsEstoque: TComboBox;
    Label3: TLabel;
    cboConsProd: TComboBox;
    Label6: TLabel;
    lbl_edtQtdeEs: TLabeledEdit;
    lbl_edtQtdeESMin: TLabeledEdit;
    lbl_edtVlrUnitEs: TLabeledEdit;
    lbl_edtTotalEs: TLabeledEdit;
    ibeaExcluir: TIBEAntialiasButton;
    ibeaSairCons: TIBEAntialiasButton;
    dbgConsEstoque: TDBGrid;
    ibeaaltEstoque: TIBEAntialiasButton;
    lbl_edtTotalCusto: TLabeledEdit;
    lbl_edtTotalVenda: TLabeledEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    ibeaConsulta: TIBEAntialiasButton;
    lbl_edtNome: TLabeledEdit;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExibeDadosEstoque;
    procedure ExecSELECTConsProd;
    procedure ExecSELECTConsEstoque;
    procedure AlteraEstoque;
    procedure cboConsEstoqueClick(Sender: TObject);
    procedure cboConsProdChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgConsEstoqueCellClick(Column: TColumn);
    procedure ibeaSairConsClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure lbl_edtQtdeEsExit(Sender: TObject);
    procedure ibeaaltEstoqueClick(Sender: TObject);
    procedure cboConsEstoqueChange(Sender: TObject);
    procedure ibeaConsultaClick(Sender: TObject);
    procedure lbl_edtNomeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsAlteraEstoque: TfrmConsAlteraEstoque;
  MontaColConsEstoque : Boolean;
  IDConsEstoque : TClasseCombo;
  IDConsProduto : TClasseCombo;

  IDEstoqueCons : TClasseCombo;
  StringEstoqueCons : String;
  IDProdutoCons : TClasseCombo;

  IDProdutodoEstoque : Integer;

  ConfirmaMSG : Integer;

  ClassProduto : TClasseCombo;

  QtdeEstoque,EstoqueMin,VlrEstoque : String;//variaveis para alterar o estoque

  ValorVenda : Real;
  ValorVendaGeral : String;
  ValorCusto : Real;
  ValorCustoGeral : String;
  QtdeEstoqueSomado : Real;
  QtdeGeralEst : String;
  VlrTotalCusto : Real;
  TotalGeralCusto : String;
  //vaiaveis para alterar  valor de custo do produto em sua alteração.
  TotalCustoEstoque : Real;
  TotalQtdeProduto : Real;
  TotalCustoEstoqueAlterado : Real;
  ValorCustoAlterado : String;
  CustoTotalProcessado : String;

implementation

uses untdmModule, funcPosto, uBuscaProdutos;

{$R *.dfm}

procedure TfrmConsAlteraEstoque.Commit(IBQueryExec : TIBQuery);
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


procedure TfrmConsalteraEstoque.ExibeDadosEstoque;

var

i : Integer;

begin

  with dmModule do begin

    IDProdutodoEstoque := ibEntrProdEstoque.FieldByName('IDPROD').AsInteger;


    if ibEntrProdEstoque.RecordCount > 0 Then begin

      lbl_edtQtdeEs.Text      := FormatFloat(',0.00',ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat);
      lbl_edtQtdeESMin.Text   := ibEntrProdEstoque.FieldByName('ESTOQUEMIN').AsString;
      lbl_edtVlrUnitEs.Text   := FormatFloat(',0.00',ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat);
      lbl_edtTotalEs.Text     := FormatFloat(',0.00',ibEntrProdEstoque.FieldByName('VLRTOTAL').AsFloat);

 //   if ibEntrProdEstoque.FieldByName('TOTALCUSTO').AsFloat <> 0 Then begin

    TotalCustoEstoque := StrToFloat(StringReplace(FloatToStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

 //   end;

      for i:=0 to cboConsProd.Items.Count -1 do begin
        if TClasseCombo( cboConsProd.Items.Objects[i]).ID = ibEntrProdEstoque.FieldByName('IDPROD').AsInteger then begin
          cboConsProd.ItemIndex:= i;
          Break;
        end else begin
          cboConsProd.ClearSelection;
        end;
      end;

      for i:=0 to cboConsEstoque.Items.Count -1 do begin
        if TClasseCombo( cboConsEstoque.Items.Objects[i]).ID = ibEntrProdEstoque.FieldByName('IDLOCAL').AsInteger then begin
          cboConsEstoque.ItemIndex:= i;
          Break;
        end else begin
          cboConsEstoque.ClearSelection;
        end;
      end;


    end;{if record count}


  end;{with}

end;


procedure TfrmConsAlteraEstoque.ExecSELECTConsProd;

begin

  with dmModule do begin

    //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS.
    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS');
    ibProdutos.Open;

    cboConsProd.Clear;

    while not ibProdutos.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDConsProduto := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDConsProduto.ID := ibProdutos.FieldByName('IDPROD').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboConsProd.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDConsProduto);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibProdutos.Next;

    end;


  end;{with}

end;

procedure TfrmConsAlteraEstoque.ExecSELECTConsEstoque;

begin

  with dmModule do begin

     //SELECT PARA TRAZER OS DADOS DA TABELA
      ibEstoque.Close;
      ibEstoque.SQL.Clear;
      ibEstoque.SQL.Add('SELECT * FROM LOCALESTOCAGEM');
      ibEstoque.Open;

      cboConsEstoque.Clear;//LIMPA A SELECAO DO COMBO

    while not ibEstoque.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDConsEstoque := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDConsEstoque.ID := ibEstoque.FieldByName('IDESTOQUE').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboConsEstoque.Items.AddObject(ibEstoque.FieldByName('NOME').AsString,IDConsEstoque);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibEstoque.Next;

    end;

  end;{with}

end;

procedure TfrmConsAlteraEstoque.AlteraEstoque;

begin

  with dmModule do begin

    QtdeEstoque := StringReplace(lbl_edtQtdeEs.Text,ThousandSeparator,'',[rfReplaceAll]);
    QtdeEstoque := StringReplace(QtdeEstoque,DecimalSeparator,'.',[rfReplaceAll]);
    if QtdeEstoque = '' Then
      QtdeEstoque := '0';

    EstoqueMin := StringReplace(lbl_edtQtdeESMin.Text,ThousandSeparator,'',[rfReplaceAll]);
    EstoqueMin := StringReplace(EstoqueMin,DecimalSeparator,'.',[rfReplaceAll]);
    if EstoqueMin = '' Then
      EstoqueMin := '0';

    VlrEstoque := StringReplace(lbl_edtTotalEs.Text,ThousandSeparator,'',[rfReplaceAll]);
    VlrEstoque := StringReplace(VlrEstoque,DecimalSeparator,'.',[rfReplaceAll]);
    if VlrEstoque = '' Then
      VlrEstoque := '0';

    ValorCustoAlterado := StringReplace(CustoTotalProcessado,DecimalSeparator,'.',[rfReplaceAll]);
    ValorCustoAlterado := StringReplace(ValorCustoAlterado,DecimalSeparator,'.',[rfReplaceAll]);
    if ValorCustoAlterado = '' Then
    ValorCustoAlterado := '0';

    ibEntrProdEstoque.Close;
    ibEntrProdEstoque.SQL.Clear;
    ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
    + 'QUANTIDADE = ''' + QtdeEstoque + ''','
    + 'ESTOQUEMIN = ''' + EstoqueMin + ''','
    + 'TOTALCUSTO =  ''' + ValorCustoAlterado + ''','
    + 'VLRTOTAL = ''' + VlrEstoque + ''' WHERE IDPROD = ''' + IntToStr(IDProdutodoEstoque) + '''');
    ibEntrProdEstoque.ExecSQL;
    Commit(ibEntrProdEstoque);


  end;{with}

end;

procedure TfrmConsAlteraEstoque.cboConsEstoqueClick(Sender: TObject);
begin
  with dmModule do begin

    if cboConsEstoque.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      IDEstoqueCons         := TClasseCombo( cboConsEstoque.Items.Objects[cboConsEstoque.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringEstoqueCons     := ' IDLOCAL=''' + InttoStr( IDEstoqueCons.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.

      Commit(ibEntrProdEstoque);
      ibEntrProdEstoque.Close;
      ibEntrProdEstoque.SQL.Clear;
      ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.VLRTOTAL,'
      + 'TBLENTRADAESTOQUEPROD.TOTALCUSTO,TBLENTRADAESTOQUEPROD.IDPROD,'
      + 'CADPRODUTOS.NOME,CADPRODUTOS.IDLOCAL,CADPRODUTOS.VALORCUSTO,'
      + 'CADPRODUTOS.IDPROD,CADPRODUTOS.VALORVENDAA FROM TBLENTRADAESTOQUEPROD '
      + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE CADPRODUTOS.IDLOCAL=''' + IntToStr(IDEstoqueCons.ID) + ''' ORDER BY CADPRODUTOS.NOME');
      ibEntrProdEstoque.Open;

     (ibEntrProdEstoque.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';

      cboConsProd.Clear;// LIMPA O COMBO
      while not ibEntrProdEstoque.Eof do begin

        IDProdutoCons := TClasseCombo.Create;
        IDProdutoCons.ID := ibEntrProdEstoque.FieldByName('IDPROD').AsInteger;
        cboConsProd.Items.AddObject(ibEntrProdEstoque.FieldByName('NOME').AsString,IDProdutoCons);

        if (ValorVenda = 0) Then begin

          ValorVenda := StrToFloat(StringReplace(FloatToStr(ibEntrProdEstoque.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));


        end else begin

          ValorVendaGeral := StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
          ValorVenda := ValorVenda + StrtoFloat(StringReplace(ValorVendaGeral,ThousandSeparator,'',[rfReplaceAll]));

        end;{if}
                          //   
    //    if (ibEntrProdEstoque.FieldByName('TOTALCUSTO').AsFloat <> 0) Then begin

        {  if (ValorCusto = 0) and (QtdeEstoqueSomado = 0) Then begin

            ValorCusto  := StrToFloat(StringReplace(FloatToStr(ibEntrProdEstoque.FieldByName('TOTALCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
            QtdeEstoqueSomado := StrToFloat(StringReplace(FloatToStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            ValorCustoGeral := StringReplace(FloatToStr(ibEntrProdEstoque.FieldByName('TOTALCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
            ValorCusto := ValorCusto + StrToFloat(StringReplace(ValorCustoGeral,ThousandSeparator,'',[rfReplaceAll]));

            QtdeGeralEst := StringReplace(FloatToStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
            QtdeEstoqueSomado  := QtdeEstoqueSomado + StrToFloat(StringReplace(QtdeGeralEst,ThousandSeparator,'',[rfReplaceAll]));

            if (ValorCusto > 0) and (QtdeEstoqueSomado > 0) Then begin  }



        ibEntrProdEstoque.Next;

      end;{while}

      lbl_edtTotalVenda.Text := FormatFloat(CasasDecimais('Produtos'),ValorVenda);


////////////////////////////////////////////////////////////////////////////////
      Commit(ibTempProdEstoque);
      ibTempProdEstoque.Close;
      ibTempProdEstoque.SQL.Clear;
      ibTempProdEstoque.SQL.Add('SELECT SUM(TBLENTRADAESTOQUEPROD.QUANTIDADE*CADPRODUTOS.VALORCUSTO)As TotaldoCusto FROM TBLENTRADAESTOQUEPROD INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD');
      ibTempProdEstoque.Open;

      ValorCusto := StrToFloat(StringReplace(FloatToStr(ibTempProdEstoque.FieldByName('TotaldoCusto').AsFloat),ThousandSeparator,'',[rfReplaceAll]));



            TotalCustoEstoque :=  ValorCusto;

////////////////////////////////////////////////////////////////////////////////


      lbl_edtTotalCusto.Text := FormatFloat(CasasDecimais('Produtos'),TotalCustoEstoque);

    end;{if}

     dbgConsEstoque.Enabled := True;

  end;{with}

end;

procedure TfrmConsAlteraEstoque.cboConsProdChange(Sender: TObject);

var

i : Integer;

begin
  with dmModule do begin

    if cboConsProd.ItemIndex <> - 1 Then begin

      IDProdutoCons  := TClasseCombo( cboConsProd.Items.Objects[cboConsProd.ItemIndex] );

      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT CADPRODUTOS.NOME, CADPRODUTOS.IDPROD,'
      + 'CADPRODUTOS.IDLOCAL,CADPRODUTOS.VALORVENDAA,TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.VLRTOTAL,'
      + 'LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
      + 'INNER JOIN TBLENTRADAESTOQUEPROD ON CADPRODUTOS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
      + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
      + 'WHERE CADPRODUTOS.IDPROD=''' + IntToStr(IDProdutoCons.ID) + '''');
      //      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE ' + StringEstoqueCons);
      ibProdutos.Open;

      (ibProdutos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';


    if ibProdutos.RecordCount > 0 Then begin

      lbl_edtQtdeEs.Text      := FormatFloat(',0.00',ibProdutos.FieldByName('QUANTIDADE').AsFloat);
      lbl_edtQtdeESMin.Text   := ibProdutos.FieldByName('ESTOQUEMIN').AsString;
      lbl_edtVlrUnitEs.Text   := FormatFloat(',0.00',ibProdutos.FieldByName('VALORVENDAA').AsFloat);
      lbl_edtTotalEs.Text     := FormatFloat(',0.00',ibProdutos.FieldByName('VLRTOTAL').AsFloat);

      for i:=0 to cboConsEstoque.Items.Count -1 do begin
        if TClasseCombo( cboConsEstoque.Items.Objects[i]).ID = ibProdutos.FieldByName('IDLOCAL').AsInteger then begin
          cboConsEstoque.ItemIndex:= i;
          Break;
        end else begin
          cboConsEstoque.ClearSelection;
        end;
      end;


    end;{if record count}



   end;{if}

  end;{with}

end;

procedure TfrmConsAlteraEstoque.FormShow(Sender: TObject);
begin
  ibeaaltEstoque.Caption := '&Alterar';
  cboConsEstoque.ClearSelection;
  cboConsProd.ClearSelection;
  lbl_edtQtdeEs.Text := '0,00';
  lbl_edtVlrUnitEs.Text := '0,00';
  lbl_edtTotalEs.Text := '0,00';
  lbl_edtQtdeESMin.Text := '0';
  lbl_edtTotalVenda.Text := '0,00';
  lbl_edtTotalCusto.Text := '0,00';
 // lbl_edtNome.Text := '';

   ValorCusto := 0;
   QtdeEstoqueSomado := 0;

  dbgConsEstoque.Enabled := False;

  with dmModule do begin

    ExecSELECTConsProd;
    ExecSELECTConsEstoque;
    ibProdutos.Close;
    ibEntrProdEstoque.Close;
////////////////////////////////////////////////////////////////////////////////

   with dbgConsEstoque do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColConsEstoque Then begin

      DataSource := dmModule.dtsEntrProdEstoque;
      
        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
      //  Columns.Insert(4);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'NOME';
        Columns.Items[0].Width         := 230;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
     {   Columns.Items[1].Title.Caption := 'Local de Estoque';
        Columns.Items[1].FieldName     := 'Estoque';
        Columns.Items[1].Width         := 130;
        Columns.Items[1].Alignment     := taLeftJustify; }

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[1].Title.Caption := 'Qtde.';
        Columns.Items[1].FieldName     := 'QUANTIDADE';
        Columns.Items[1].Width         := 110;
        Columns.Items[1].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[2].Title.Caption := 'Estoque Mínimo';
        Columns.Items[2].FieldName     := 'ESTOQUEMIN';
        Columns.Items[2].Width         := 120;
        Columns.Items[2].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[3].Title.Caption := 'Total';
        Columns.Items[3].FieldName     := 'VLRTOTAL';
        Columns.Items[3].Width         := 100;
        Columns.Items[3].Alignment     := taLeftJustify;

        MontaColConsEstoque := False;

      end;{if}

    end;{with}
////////////////////////////////////////////////////////////////////////////////



  end;{with}

end;

procedure TfrmConsAlteraEstoque.FormCreate(Sender: TObject);
begin
MontaColConsEstoque := True;
end;

procedure TfrmConsAlteraEstoque.dbgConsEstoqueCellClick(Column: TColumn);

begin

  with dmModule do begin
   
   ExibeDadosEstoque;

  end;{with}


end;

procedure TfrmConsAlteraEstoque.ibeaSairConsClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsAlteraEstoque.ibeaExcluirClick(Sender: TObject);
begin
  with dmModule do begin
    ConfirmaMSG := Application.MessageBox('Você deseja Excluir esse Registro?','Notificação: Exclusão de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
    if ConfirmaMSG = 6 Then begin


     // if cboConsProd.ItemIndex <> -1 Then begin

     //   ClassProduto := TClasseCombo(cboConsProd.Items.Objects[cboConsProd.ItemIndex]);

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('DELETE FROM TBLENTRADAESTOQUEPROD WHERE IDPROD=''' + InttoStr(IDProdutodoEstoque) + '''');
        ibEntrProdEstoque.Open;

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.*,'
        + 'CADPRODUTOS.NOME FROM TBLENTRADAESTOQUEPROD '
        + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD');
        ibEntrProdEstoque.Open;

        (ibEntrProdEstoque.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';

     {   ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.*,'
        + 'LOCALESTOCAGEM.NOME As Estoque,CADPRODUTOS.NOME,'
        + 'CADPRODUTOS.VALORVENDAA FROM TBLENTRADAESTOQUEPROD '
        + 'INNER JOIN LOCALESTOCAGEM ON TBLENTRADAESTOQUEPROD.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
        + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD ');  }
     //   + 'WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + IntToStr(IDProdutodoEstoque) + '''');



      ibEntrProdEstoque.Close;
      ibEntrProdEstoque.SQL.Clear;
      ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.VLRTOTAL,'
      + 'TBLENTRADAESTOQUEPROD.TOTALCUSTO,'
      + 'CADPRODUTOS.NOME,CADPRODUTOS.IDLOCAL,CADPRODUTOS.VALORCUSTO,'
      + 'CADPRODUTOS.IDPROD,CADPRODUTOS.VALORVENDAA FROM TBLENTRADAESTOQUEPROD '
      + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE CADPRODUTOS.IDLOCAL=''' + IntToStr(IDEstoqueCons.ID) + ''' ORDER BY CADPRODUTOS.NOME');
      ibEntrProdEstoque.Open;

     (ibEntrProdEstoque.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';



    end;{if confmsg}

  end;{with}

end;

procedure TfrmConsAlteraEstoque.lbl_edtQtdeEsExit(Sender: TObject);
var
Valor1 : Real;
Valor2 : Real;
Valor3 : Real;
//Valor4 : Real;
//TotalEst : Real;
begin


  if (lbl_edtQtdeEs.Text <> '') Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQtdeEs.Text)>0) and (lbl_edtQtdeEs.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtdeEs.Text,ThousandSeparator,'',[rfReplaceAll]));

      Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnitEs.Text,ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtTotalEs.Text := FormatFloat(',0.00',(Valor2 * Valor1));



    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtdeEs.Text,ThousandSeparator,'',[rfReplaceAll]));

      Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnitEs.Text,ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtTotalEs.Text := FormatFloat(',0.00',(Valor2 * Valor1));


    {  if (lbl_edtQuantidade.Text <> '') and (lbl_edtQtdeProd.Text <> '') Then begin// se for diferente de branco executa rotina abaixo.

       Valor1 := StrToFloat(StringReplace(lbl_edtQuantidade.Text,ThousandSeparator,'',[rfReplaceAll]));
       Valor2 := StrToFloat(StringReplace(lbl_edtVlrunit.Text,ThousandSeparator,'',[rfReplaceAll]));
       Valor3 := StrToFloat(StringReplace(lbl_edtQtdeProd.Text,ThousandSeparator,'',[rfReplaceAll]));

       Valor4 := (Valor1 + Valor3);

       lbl_edtQtdeProd.Text := FormatFloat(',0.00',(Valor4));

       lbl_edtTotalEstoque.Text := FormatFloat(',0.00',(Valor4 * Valor2));

      end;   }

    end;{if}

  end;{if}

     // lbl_edtTotalNF.Text := lbl_edtVlrtotal.Text;

{ if   (lbl_edtQuantidade.Text <> '') and (lbl_edtQtdeProd.Text = '') and (lbl_edtVlrtotal.Text <> '') and (lbl_edtTotalEstoque.Text = '') Then begin

   TotalEst := StrToFloat(StringReplace(lbl_edtVlrtotal.Text,ThousandSeparator,'',[rfReplaceAll]));
   lbl_edtQtdeProd.Text     := FormatFloat(',0',Valor1);
   lbl_edtTotalEstoque.Text := FormatFloat(',0.00',TotalEst);

 end;}



      Valor3 := StrToFloat(StringReplace(lbl_edtQtdeEs.Text,ThousandSeparator,'',[rfReplaceAll]));

      TotalQtdeProduto := Valor3;

      TotalCustoEstoqueAlterado := TotalQtdeProduto * TotalCustoEstoque;

      CustoTotalProcessado := StringReplace(FloattoStr(TotalCustoEstoqueAlterado),ThousandSeparator,'',[rfReplaceAll]);
      CustoTotalProcessado := StringReplace(CustoTotalProcessado,DecimalSeparator,'.',[rfReplaceAll]);


end;

procedure TfrmConsAlteraEstoque.ibeaaltEstoqueClick(Sender: TObject);
begin
  with dmModule do begin

 //   if ibeaaltEstoque.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Confirma a alteração do Estoque?','Notificação: Alteração de Estoque', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
      if ConfirmaMSG = 6 Then begin

        AlteraEstoque;

        Commit(ibEntrProdEstoque);

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.*,'
        + 'CADPRODUTOS.NOME,CADPRODUTOS.VALORVENDAA FROM TBLENTRADAESTOQUEPROD '
        + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE TBLENTRADAESTOQUEPROD.IDPROD = ''' + IntToStr(IDProdutodoEstoque) + '''');
        ibEntrProdEstoque.Open;

     { ibEntrProdEstoque.Close;
      ibEntrProdEstoque.SQL.Clear;
      ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.VLRTOTAL,'
      + 'TBLENTRADAESTOQUEPROD.TOTALCUSTO,'
      + 'CADPRODUTOS.NOME,CADPRODUTOS.IDLOCAL,CADPRODUTOS.VALORCUSTO,'
      + 'CADPRODUTOS.IDPROD,CADPRODUTOS.VALORVENDAA FROM TBLENTRADAESTOQUEPROD '
      + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE CADPRODUTOS.IDLOCAL=''' + IntToStr(IDEstoqueCons.ID) + ''' ORDER BY CADPRODUTOS.NOME');
      ibEntrProdEstoque.Open;  }

        (ibEntrProdEstoque.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := ',0.00';
        (ibEntrProdEstoque.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';
        (ibEntrProdEstoque.FieldByName('QUANTIDADE') as TFloatField).DisplayFormat := ',0.00';
        //(ibEntrProdEstoque.FieldByName('ESTOQUEMIN') as TFloatField).DisplayFormat := ',0.00';

      cboConsEstoque.ClearSelection;
      cboConsProd.ClearSelection;
      lbl_edtQtdeEs.Text := '0,00';
      lbl_edtVlrUnitEs.Text := '0,00';
      lbl_edtTotalEs.Text := '0,00';
      lbl_edtTotalCusto.Text := '0,00';
      lbl_edtTotalVenda.Text := '0,00';

      end;{if conf msg}

  end;{with}

end;

procedure TfrmConsAlteraEstoque.cboConsEstoqueChange(Sender: TObject);
begin

  ValorVenda := StrToFloat('0,00');
  ValorCusto := StrToFloat('0,00');

end;

procedure TfrmConsAlteraEstoque.ibeaConsultaClick(Sender: TObject);
begin
frmBuscaProdutos.ShowModal;
end;

procedure TfrmConsAlteraEstoque.lbl_edtNomeChange(Sender: TObject);
begin

  with dmModule do begin

  {  Commit(ibEntrProdEstoque);
    ibEntrProdEstoque.Close;
    ibEntrProdEstoque.SQL.Clear;
    ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.*,'
    + 'CADPRODUTOS.NOME As Produto FROM TBLENTRADAESTOQUEPROD '
    + 'INNER CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
    + 'WHERE CADPRODUTOS.NOME LIKE '+''''+'%'+lbl_edtNome.text+'%'+'''');
    ibEntrProdEstoque.Open; }
  //  (ibEntrProdEstoque.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
 //   (ibEntrProdEstoque.FieldByName('TotalEstoque') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      ibEntrProdEstoque.Close;
      ibEntrProdEstoque.SQL.Clear;
      ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.VLRTOTAL,'
      + 'TBLENTRADAESTOQUEPROD.TOTALCUSTO,TBLENTRADAESTOQUEPROD.IDPROD,'
      + 'CADPRODUTOS.NOME,CADPRODUTOS.IDLOCAL,CADPRODUTOS.VALORCUSTO,'
      + 'CADPRODUTOS.IDPROD,CADPRODUTOS.VALORVENDAA FROM TBLENTRADAESTOQUEPROD '
      + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE CADPRODUTOS.IDLOCAL=''' + IntToStr(IDEstoqueCons.ID) + ''' and CADPRODUTOS.NOME LIKE '+''''+'%'+lbl_edtNome.text+'%'+'''');
      ibEntrProdEstoque.Open;

     (ibEntrProdEstoque.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';

  end;{with}


end;

end.
