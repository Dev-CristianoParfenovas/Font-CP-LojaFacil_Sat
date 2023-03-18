unit untPedidodeCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, mxFlatControls,
  Grids, DBGrids, IBQuery, classComboBox, Buttons;

type
  TfrmPedidodeCompra = class(TForm)
    pcPCompra: TPageControl;
    tbsEmissao: TTabSheet;
    lbl_Forn: TLabel;
    lbl_edtRef: TLabeledEdit;
    cboFornecedores: TComboBox;
    lbl_edtCodBarras: TLabeledEdit;
    cboProduto: TComboBox;
    lbl_Produto: TLabel;
    lbl_edtVlrProd: TLabeledEdit;
    lbl_edtQtde: TLabeledEdit;
    lbl_edtTotalProd: TLabeledEdit;
    lbl_edtDesc: TLabeledEdit;
    lbl_edtAcresc: TLabeledEdit;
    lbl_edtTotalPed: TLabeledEdit;
    shapeDadosProd: TShape;
    lbl_CodBarras: TLabel;
    lbl_Traco: TLabel;
    lbl_NomeProd: TLabel;
    lbl_Valor: TLabel;
    lbl_TipoPreco: TLabel;
    dbgPedCompras: TDBGrid;
    lbl_edtTotalGeral: TLabeledEdit;
    lbl_edtNumPedido: TLabeledEdit;
    lbl_edtVizualizarPed: TLabeledEdit;
    Label1: TLabel;
    dtpDataCompra: TmxFlatDateTimePicker;
    lbl_DtCompra: TLabel;
    ibeaNovo: TSpeedButton;
    ibeaAlterar: TSpeedButton;
    ibeaExcluir: TSpeedButton;
    ibeaIncluir: TSpeedButton;
    ibeaAbreRelatorio: TSpeedButton;
    ibeaIncluirItens: TSpeedButton;
    ibeaLimparCampos: TSpeedButton;
    ibeaBuscaProd: TSpeedButton;
    ibeaSair: TSpeedButton;
    lbl_edtCodInterno: TLabeledEdit;
    ibeaEstoquePedido: TSpeedButton;
    procedure ibeaSairClick(Sender: TObject);
    procedure LimpaCamposPedido;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure AlterarPedido;
    procedure ExecSELECTFornecedor;
    procedure ExecSELECTProdutos;
    procedure FormShow(Sender: TObject);
    procedure cboFornecedoresChange(Sender: TObject);
    procedure lbl_edtCodBarrasChange(Sender: TObject);
    procedure lbl_edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtRefExit(Sender: TObject);
    procedure lbl_edtRefKeyPress(Sender: TObject; var Key: Char);
    procedure cboProdutoClick(Sender: TObject);
    procedure lbl_edtQtdeExit(Sender: TObject);
    procedure lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtTotalProdKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtDescExit(Sender: TObject);
    procedure lbl_edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtAcrescExit(Sender: TObject);
    procedure lbl_edtAcrescKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaNovoClick(Sender: TObject);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure ibeaAbreRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPedComprasCellClick(Column: TColumn);
    procedure lbl_edtVizualizarPedExit(Sender: TObject);
    procedure lbl_edtVizualizarPedKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure ibeaBuscaProdClick(Sender: TObject);
    procedure ibeaLimparCamposClick(Sender: TObject);
    procedure ibeaIncluirItensClick(Sender: TObject);
    procedure lbl_edtCodInternoExit(Sender: TObject);
    procedure lbl_edtCodInternoKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtVlrProdKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaEstoquePedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidodeCompra: TfrmPedidodeCompra;
  MontaColunas : Boolean;
  IDPedCompra : Integer;
  
implementation

uses untdmModule, funcPosto, DB, untRelPedCompra, uBuscaProdutos;

{$R *.dfm}

procedure TfrmPedidodeCompra.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPedidodeCompra.LimpaCamposPedido;

begin

cboFornecedores.ClearSelection;
lbl_edtCodInterno.Clear;
lbl_edtRef.Clear;
lbl_edtCodBarras.Clear;
cboProduto.ClearSelection;
lbl_edtVlrProd.Clear;
lbl_edtQtde.Clear;
lbl_edtTotalProd.Clear;
lbl_edtDesc.Clear;
lbl_edtAcresc.Clear;
lbl_edtTotalPed.Clear;
lbl_edtVizualizarPed.Clear;
lbl_CodBarras.Caption := '';
lbl_NomeProd.Caption := '';
lbl_Valor.Caption := '';
lbl_TipoPreco.Caption := '';

end;

procedure TfrmPedidodeCompra.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmPedidodeCompra.AlterarPedido;

var

IDAlteraForn,IDAlteraProd : TClasseCombo;
StringAltForn,StringAltProd : String;
Valor,Qtde,Desconto,Acrescimo,TotalPedido : String;
begin

  with dmModule do begin

    if cboProduto.Text <> '' Then begin

    Valor := StringReplace(lbl_edtVlrProd.Text,ThousandSeparator,'',[rfReplaceAll]);
    Valor := StringReplace(Valor,DecimalSeparator,'.',[rfReplaceAll]);
    if Valor = '' Then
       Valor := '0';

    Qtde := StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]);
    Qtde := StringReplace(Qtde,DecimalSeparator,'.',[rfReplaceAll]);
    if Qtde = '' Then
    Qtde := '0';

    Desconto := StringReplace(lbl_edtDesc.Text,ThousandSeparator,'',[rfReplaceAll]);
    Desconto := StringReplace(Desconto,DecimalSeparator,'.',[rfReplaceAll]);
    if Desconto = '' Then
    Desconto := '0';

    Acrescimo := StringReplace(lbl_edtAcresc.Text,ThousandSeparator,'',[rfReplaceAll]);
    Acrescimo := StringReplace(Acrescimo,DecimalSeparator,'.',[rfReplaceAll]);
    if Acrescimo = '' Then
    Acrescimo := '0';

    TotalPedido := StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]);
    TotalPedido := StringReplace(TotalPedido,DecimalSeparator,'.',[rfReplaceAll]);
    if TotalPedido = '' Then
       TotalPedido := '0';

    if cboFornecedores.ItemIndex = -1 Then begin

      StringAltForn := 'IDFORNECEDOR=''0'',';

    end else begin

      IDAlteraForn  := TClasseCombo(cboFornecedores.Items.Objects[cboFornecedores.ItemIndex]);
      StringAltForn := ' IDFORNECEDOR=''' + IntToStr(IDAlteraForn.ID) + ''',';

    end;

    if cboProduto.ItemIndex = -1 Then begin

      StringAltProd := ' IDPROD=''0'',';

    end else begin

      IDAlteraProd  := TClasseCombo(cboProduto.Items.Objects[cboProduto.ItemIndex]);
      StringAltProd := ' IDPROD=''' + IntToStr(IDAlteraProd.ID) + ''',';

    end;


      ibPedCompra.Close;
      ibPedCompra.SQL.Clear;
      ibPedCompra.SQL.Add('UPDATE TBLPEDIDODECOMPRA SET '
      + 'VALOR =''' + Valor + ''','
      + 'QTDE =''' + Qtde + ''','
      + 'DESCONTO =''' + Desconto + ''','
      + 'ACRESCIMO =''' + Acrescimo + ''','
      + 'VLRTOTAL =''' + TotalPedido + ''','
      +StringAltForn
      +StringAltProd
      + 'REF =''' + lbl_edtRef.Text + ''','
      + 'CODBARRASPED =''' + lbl_edtCodBarras.Text + '''WHERE IDPEDCOMPRA=''' + IntToStr(IDPedCompra) + '''');
      ibPedCompra.ExecSQL;

    end;//if cboproduto

    lbl_edtCodBarras.Clear;
    lbl_edtCodInterno.Clear;
    lbl_edtRef.Clear;
    cboProduto.ClearSelection;
    lbl_edtVlrProd.Clear;
    lbl_edtQtde.Clear;
    lbl_edtTotalProd.Clear;
    lbl_edtDesc.Clear;
    lbl_edtAcresc.Clear;
    lbl_edtTotalPed.Clear;

  end;//with

end;



procedure TfrmPedidodeCompra.ExecSELECTFornecedor;

var
  IDClassForn : Integer;
  ClassForn : TClasseCombo;
begin
  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClassForn := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClassForn)+ ''' ORDER BY NOME');//('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboFornecedores.Clear; //LIMPA O COMBOBOX
    while not ibCadastro.Eof do begin
      ClassForn    := TClasseCombo.Create;
      ClassForn.ID  := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboFornecedores.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,ClassForn);
      ibCadastro.Next;
    end;
  end;
end;

procedure TfrmPedidodeCompra.ExecSELECTProdutos;

var
IDSelectProduto : TClasseCombo;
begin

  with dmModule do begin

  ibProdutos.Close;
  ibProdutos.SQL.Clear;
  ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS ORDER BY NOME');
  ibProdutos.Open;

  cboProduto.Clear;

    while not ibProdutos.Eof do begin

    IDSelectProduto := TClasseCombo.Create;
    IDSelectProduto.ID := ibProdutos.FieldByName('IDPROD').AsInteger;
    cboProduto.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDSelectProduto);
    ibProdutos.Next;

    end;{while}

  end;{with}

end;

procedure TfrmPedidodeCompra.FormShow(Sender: TObject);
begin

  dtpDataCompra.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  with dmModule do begin

      pcPCompra.ActivePageIndex := 0;

      lbl_edtTotalPed.Clear;
      lbl_edtVlrProd.Clear;
      lbl_edtRef.Clear;
      lbl_edtQtde.Clear;
      lbl_edtTotalProd.Clear;
      lbl_edtDesc.Clear;
      lbl_edtAcresc.Clear;
      lbl_edtTotalPed.Clear;
      lbl_CodBarras.Caption := '';
      lbl_NomeProd.Caption := '';
      lbl_Valor.Caption := '';
      lbl_edtVizualizarPed.Clear;
      lbl_edtCodInterno.Clear;
    ///  cboFornecedores.ClearSelection;
   ///   cboProduto.ClearSelection;
      ibPedCompra.Close;
      lbl_edtTotalGeral.Text := '0,00';

    ExecSELECTProdutos;
    ExecSELECTFornecedor;

    with dbgPedCompras do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

         DataSource := dtsPedCompra;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Ref.';
        Columns.Items[0].FieldName     := 'REF';
        Columns.Items[0].Width         := 100;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Descrição do Produto';
        Columns.Items[1].FieldName     := 'NomeProd';
        Columns.Items[1].Width         := 280;
        Columns.Items[1].Alignment     := taLeftJustify;


        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[2].Title.Caption := 'Vlr.Custo';
        Columns.Items[2].FieldName     := 'VALOR';
        Columns.Items[2].Width         := 80;
        Columns.Items[2].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[3].Title.Caption := 'Qtde.';
        Columns.Items[3].FieldName     := 'QTDE';
        Columns.Items[3].Width         := 80;
        Columns.Items[3].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Total';
        Columns.Items[4].FieldName     := 'VLRTOTAL';
        Columns.Items[4].Width         := 80;
        Columns.Items[4].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with}

////////////////////////////////////////////////////////////////////////////////


  end;//with

end;

procedure TfrmPedidodeCompra.cboFornecedoresChange(Sender: TObject);

{var

i : Integer;
IDFornCons,IDClassProdutos : TClasseCombo;
StringFornCons : String; }

begin

{ with dmModule do begin

    if cboFornecedores.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      IDFornCons         := TClasseCombo( cboFornecedores.Items.Objects[cboFornecedores.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringFornCons     := ' IDCAD=''' + InttoStr( IDFornCons.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.
   end;

      Commit(ibCadastro);
      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,CONDICOESPAGAMENTO.IDCONDPAGTO,CONDICOESPAGAMENTO.DESCRICAO FROM TBLCADASTRO '
      + 'LEFT OUTER JOIN CONDICOESPAGAMENTO ON TBLCADASTRO.IDCONDPAGTO=CONDICOESPAGAMENTO.IDCONDPAGTO '
      + 'WHERE TBLCADASTRO.IDCAD=''' + IntToStr(IDFornCons.ID) + '''');
      ibCadastro.Open;

      Commit(ibTempProdNome);
      ibTempProdNome.Close;
      ibTempProdNome.SQL.Clear;
      ibTempProdNome.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CADPRODUTOS.FORNECEDOR=''' + IntToStr(IDFornCons.ID) + ''' ORDER BY CADPRODUTOS.NOME');
      ibTempProdNome.Open;

      cboProduto.Clear;

      while not ibTempProdNome.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

        IDClassProdutos := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
        IDClassProdutos.ID := ibTempProdNome.FieldByName('IDPROD').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
        cboProduto.Items.AddObject(ibTempProdNome.FieldByName('NOME').AsString,IDClassProdutos);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
        ibTempProdNome.Next;

      end;

  end;//with  }


end;

procedure TfrmPedidodeCompra.lbl_edtCodBarrasChange(Sender: TObject);

var

i : Integer;

//OleGraphic: TOleGraphic;
//fs: TFileStream;

begin

  with dmModule do begin

  if lbl_edtCodBarras.Text <> '' Then begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
    + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
    + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarras.Text + '''');
    ibProdutos.Open;

    lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
    lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
    lbl_TipoPreco.Caption := 'Preço de Venda(A)';
    lbl_edtQtde.Text := '1';
    lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
    lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;
    lbl_edtRef.Text       := ibProdutos.FieldByName('REF').AsString;
    lbl_edtCodInterno.Text := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);
   { if lbl_TipoPreco.Caption = '' Then begin

      TipoPreco := 'A';

    end; }


 //  lbl_edtCodProd.Text := ibProdutos.FieldByName('IDPROD').AsString;
  //  lbl_edtEstoque.Text := ibProdutos.FieldByName('Estoque').AsString;


    //   if (lbl_TipoPreco.Caption = '') or (lbl_TipoPreco.Caption = 'Preço de Venda(A)') Then begin

     //  TipoPreco := 'A';

       lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);

     //  end;


    //   if lbl_TipoPreco.Caption = 'Preço de Venda(B)' Then begin

     //  TipoPreco := 'B';
    //  lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);

    //   end;

     //  if lbl_TipoPreco.Caption = 'Preço de Venda(C)' Then begin

       //TipoPreco := 'C';
    //   lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);

  //     end;

  {  if  (TipoPreco = 'A') Then begin

    lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

    end else if  (TipoPreco = 'B') Then begin

    lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);

    end else if  (TipoPreco = 'C') Then begin

    lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);

    end;  }

    for i:=0 to cboProduto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboProduto.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboProduto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboProduto.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}

    for i:=0 to cboFornecedores.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboFornecedores.Items.Objects[i]).ID = ibProdutos.FieldByName('FORNECEDOR').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboFornecedores.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboFornecedores.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}



   { if lbl_edtQtde.Text = '0' then begin

     lbl_edtQtde.Text := '1';

    end; }

  //   lbl_edtQtdeExit(Sender);
  end;//if cod barras <> ''
  
  end;{with}


end;

procedure TfrmPedidodeCompra.lbl_edtCodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtQtde.SetFocus;

  end;//if
  
end;

procedure TfrmPedidodeCompra.lbl_edtRefExit(Sender: TObject);

var

i : Integer;

begin

  with dmModule do begin

  if lbl_edtRef.Text <> '' Then begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
    + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
    + 'WHERE CADPRODUTOS.REF=''' + lbl_edtRef.Text + '''');
    ibProdutos.Open;

    lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
    lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
    lbl_TipoPreco.Caption := 'Preço de Venda(A)';
    lbl_edtQtde.Text := '1';
    lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
    lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;
    lbl_edtCodInterno.Text := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);

   { if lbl_TipoPreco.Caption = '' Then begin

      TipoPreco := 'A'

    end;}

  //  if TipoPreco = 'A' Then begin

     { lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_TipoPreco.Caption := 'Preço de Venda(A)';
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString; }
     //lbl_edtTotalGeral
  //  end;

   { if TipoPreco = 'B' Then begin

      lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;

    end;

    if TipoPreco = 'C' Then begin

      lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;

    end; }

    lbl_edtQtde.SetFocus;

    for i:=0 to cboProduto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboProduto.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboProduto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboProduto.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}


    for i:=0 to cboFornecedores.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboFornecedores.Items.Objects[i]).ID = ibProdutos.FieldByName('FORNECEDOR').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboFornecedores.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboFornecedores.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}

  end;//if ref <> ''
  
  end;//with


end;

procedure TfrmPedidodeCompra.lbl_edtRefKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtQtde.SetFocus;

  end;//if

end;

procedure TfrmPedidodeCompra.cboProdutoClick(Sender: TObject);

var

i : Integer;
IDDadosProd : TClasseCombo;
StringDadosProd : String;
begin

  with dmModule do begin

    if cboProduto.ItemIndex <> - 1 Then begin

      IDDadosProd := TClasseCombo(cboProduto.Items.Objects[cboProduto.ItemIndex]);
      StringDadosProd := ' IDPROD=''' + IntToStr(IDDadosProd.ID) + '''';

    end;{if}

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,TBLCADASTRO.NOME As NomeFornecedor,'
      + 'TBLCADASTRO.IDCAD,CONDICOESPAGAMENTO.IDCONDPAGTO,CONDICOESPAGAMENTO.DESCRICAO FROM CADPRODUTOS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON CADPRODUTOS.FORNECEDOR=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN CONDICOESPAGAMENTO ON TBLCADASTRO.IDCONDPAGTO=CONDICOESPAGAMENTO.IDCONDPAGTO WHERE CADPRODUTOS.IDPROD=''' + IntToStr(IDDadosProd.ID) + '''');
    ibProdutos.Open;

    (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibProdutos.FieldByName('VALORVENDAB') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
    (ibProdutos.FieldByName('VALORVENDAC') as TFloatField).DisplayFormat := CasasDecimais('Produtos');


    lbl_edtRef.Text := ibProdutos.FieldByName('REF').asString;


      for i:=0 to cboFornecedores.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboFornecedores.Items.Objects[i]).ID = ibProdutos.FieldByName('FORNECEDOR').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboFornecedores.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboFornecedores.ClearSelection;//LIMPA A SELECAO.
        end;{if}
      end;{for}

  {  if lbl_TipoPreco.Caption = '' Then begin

      TipoPreco := 'A'

    end; }

   // if TipoPreco = 'A' Then begin

      lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_TipoPreco.Caption := 'Preço de Venda(A)';
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;

  //  end;

   { if TipoPreco = 'B' Then begin

      lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;

    end;

    if TipoPreco = 'C' Then begin

      lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;

    end; }

    lbl_edtQtde.SetFocus;

  end;{with}


end;

procedure TfrmPedidodeCompra.lbl_edtQtdeExit(Sender: TObject);

var

Valor1,Valor2,Valor3,Valor4 : Real;

begin

  if (lbl_edtNumPedido.Text <> '')or(lbl_edtVizualizarPed.Text <> '') Then begin

    if (lbl_edtQtde.Text <> '')and(lbl_edtVlrProd.Text <> '') Then begin// se for em branco executa rotina abaixo.

      if (Pos(',',lbl_edtQtde.Text)>0) and (lbl_edtQtde.Text <> '') Then begin

        Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtVlrProd.Text,ThousandSeparator,'',[rfReplaceAll]));

        lbl_edtTotalProd.Text := FormatFloat(',0.00',(Valor2 * Valor1));

      end else begin

        Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtVlrProd.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtTotalProd.Text := FormatFloat(',0.00',(Valor2 * Valor1));

      end;{if}

    end;{if}

  end;//if lbl_numpedido

end;

procedure TfrmPedidodeCompra.lbl_edtQtdeKeyPress(Sender: TObject;
  var Key: Char);

var

Aviso : Integer;
  
begin

  if Key = #13 Then begin

    if (lbl_edtNumPedido.Text = '')and(lbl_edtVizualizarPed.Text = '') Then begin

      Aviso := Application.MessageBox('É necessário gerar um novo pedido','Pedido não gerado',+MB_OK+MB_DEFBUTTON1+MB_ICONINFORMATION);

    end else begin


      lbl_edtTotalProd.SetFocus;

    end;//if

  end;{if}

end;

procedure TfrmPedidodeCompra.lbl_edtTotalProdKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key =#13 Then begin

   lbl_edtDesc.SetFocus;
   
  end;//if
  
end;

procedure TfrmPedidodeCompra.lbl_edtDescExit(Sender: TObject);

var

Valor1,Valor2 : Real;


begin

  with dmModule do begin

     if lbl_edtDesc.Text <> '' Then begin

       if lbl_edtTotalProd.Text <> '' Then begin //se for diferente de branco executa rotina abaixo.

          if (Pos(',',lbl_edtTotalProd.Text)>0) and (lbl_edtTotalProd.Text <> '') Then begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotalProd.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtDesc.Text,ThousandSeparator,'',[rfReplaceAll]));
            lbl_edtTotalPed.Text := FormatFloat(',0.00',(Valor1 - Valor2));


          end else begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotalProd.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtDesc.Text,ThousandSeparator,'',[rfReplaceAll]));
            lbl_edtTotalPed.Text := FormatFloat(',0.00',(Valor1 - Valor2));


          end;{if}

        end;{if}

       lbl_edtDesc.Text := FormatFloat(CasasDecimais('Produtos'),StrToFloat(lbl_edtDesc.Text)); //FormatFloat(casa',0.00',StrToFloat(lbl_edtValor.Text));

     end;//if label desc

  end;{with}


end;

procedure TfrmPedidodeCompra.lbl_edtDescKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key =#13 Then begin

   lbl_edtAcresc.SetFocus;

  end;//if
  
end;

procedure TfrmPedidodeCompra.lbl_edtAcrescExit(Sender: TObject);

var

Valor1,Valor2 : Real;


begin

  with dmModule do begin

    if lbl_edtAcresc.Text <> '' Then begin

       if lbl_edtTotalProd.Text <> '' Then begin //se for diferente de branco executa rotina abaixo.

          if (Pos(',',lbl_edtTotalProd.Text)>0) and (lbl_edtTotalProd.Text <> '') Then begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotalProd.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtAcresc.Text,ThousandSeparator,'',[rfReplaceAll]));
            lbl_edtTotalPed.Text := FormatFloat(',0.00',(Valor1 + Valor2));


          end else begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotalProd.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtAcresc.Text,ThousandSeparator,'',[rfReplaceAll]));
            lbl_edtTotalPed.Text := FormatFloat(',0.00',(Valor1 + Valor2));


          end;{if}

        end;{if}

      lbl_edtAcresc.Text := FormatFloat(CasasDecimais('Produtos'),StrToFloat(lbl_edtAcresc.Text)); //FormatFloat(casa',0.00',StrToFloat(lbl_edtValor.Text));

    end;//if label acrescimo

    if (lbl_edtTotalPed.Text = '')and(lbl_edtDesc.Text = '') Then begin

      lbl_edtTotalPed.Text := lbl_edtTotalProd.Text;

    end;

  end;{with}


end;

procedure TfrmPedidodeCompra.lbl_edtAcrescKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key =#13 Then begin

   lbl_edtTotalPed.SetFocus;

  end;//if

end;

procedure TfrmPedidodeCompra.ibeaNovoClick(Sender: TObject);

var
TotalCompra : String;
begin

  with dmModule do begin

    TotalCompra := StringReplace(lbl_edtTotalGeral.Text,ThousandSeparator,'',[rfReplaceAll]);
    TotalCompra := StringReplace(TotalCompra,DecimalSeparator,'.',[rfReplaceAll]);
    if TotalCompra = '' Then
    TotalCompra := '0';

    if ibeaNovo.Caption = '&Gravar' Then begin


      ibDetalhePedCompra.Close;
      ibDetalhePedCompra.SQL.Clear;
      ibDetalhePedCompra.SQL.Add('INSERT INTO TBLDETALHEPEDCOMPRA'
      + '(DATA,HORA,TOTALCOMPRA) values '
      + '(''' + FormatDateTime('mm-dd-yyyy',dtpDataCompra.Date) + ''','
      + ' ''' + FormatDateTime('hh:mm:ss',Now) + ''','
      + ' ''' + TotalCompra + ''')');
      ibDetalhePedCompra.ExecSQL;
      Commit(ibDetalhePedCompra);

      ibeaNovo.Caption := '&Novo';
      lbl_edtNumPedido.Clear;
      lbl_edtTotalPed.Clear;
      lbl_edtTotalGeral.Clear;
      lbl_edtVlrProd.Clear;
      lbl_edtQtde.Clear;
      lbl_edtTotalProd.Clear;
      lbl_edtDesc.Clear;
      lbl_edtAcresc.Clear;
      lbl_edtTotalPed.Clear;
      lbl_CodBarras.Caption := '';
      lbl_NomeProd.Caption := '';
      lbl_Valor.Caption := '';
      lbl_edtVizualizarPed.Clear;

      end else begin

      ibeaNovo.Caption := '&Gravar';
      lbl_edtTotalPed.Clear;

      ibDetalhePedCompra.Close;
      ibDetalhePedCompra.SQL.Clear;
      ibDetalhePedCompra.SQL.Add('SELECT * FROM TBLDETALHEPEDCOMPRA ORDER BY IDDETALHE DESC');
      ibDetalhePedCompra.Open;

      lbl_edtNumPedido.Text := IntToStr(ibDetalhePedCompra.FieldByName('IDDETALHE').AsInteger + 1);


    end;//if botaO GRAVAR
    ibPedCompra.Close;
  end;{with}

end;

procedure TfrmPedidodeCompra.ibeaIncluirClick(Sender: TObject);

var

Valor1,Valor2,Valor3,QtdeVendida : Real;
NumPedido : Integer;
Desconto,Acrescimo, StringGravaProd, TotalProd, QtdeGravaProd, VlrGravaProd : String;
IDClassGravaProd, IDClassGravaForn   : TClasseCombo;
StringGravaForn : String;
begin

  with dmModule do begin

    If cboProduto.ItemIndex = -1 Then begin

      StringGravaProd := ' '' 0 '',';

    end else begin

      IDClassGravaProd   := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
      StringGravaProd          := ' ''' + InttoStr( IDClassGravaProd.ID ) + ''',';

    end;

      If cboFornecedores.ItemIndex = -1 Then begin

        StringGravaForn := ' ''0'',';

      end else begin

        IDClassGravaForn   := TClasseCombo( cboFornecedores.Items.Objects[cboFornecedores.ItemIndex] );
        StringGravaForn  := ' ''' + InttoStr( IDClassGravaForn.ID ) + ''',';

      end;{ifcbotipopagto}



      TotalProd := StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]);
      TotalProd := StringReplace(TotalProd,DecimalSeparator,'.',[rfReplaceAll]);
      if TotalProd = '' Then
         TotalProd := '0';

      QtdeGravaProd := StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]);
      QtdeGravaProd := StringReplace(QtdeGravaProd,DecimalSeparator,'.',[rfReplaceAll]);
      if QtdeGravaProd = '' Then
      QtdeGravaProd := '0';

      VlrGravaProd := StringReplace(lbl_edtVlrProd.Text,ThousandSeparator,'',[rfReplaceAll]);
      VlrGravaProd := StringReplace(VlrGravaProd,DecimalSeparator,'.',[rfReplaceAll]);
      if VlrGravaProd = '' Then
      VlrGravaProd := '0';

      Desconto := StringReplace(lbl_edtDesc.Text,ThousandSeparator,'',[rfReplaceAll]);
      Desconto := StringReplace(Desconto,DecimalSeparator,'.',[rfReplaceAll]);
      if Desconto = '' Then
      Desconto := '0';

      Acrescimo := StringReplace(lbl_edtAcresc.Text,ThousandSeparator,'',[rfReplaceAll]);
      Acrescimo := StringReplace(Acrescimo,DecimalSeparator,'.',[rfReplaceAll]);
      if Acrescimo = '' Then
      Acrescimo := '0';


      if lbl_edtNumPedido.Text <> '' Then begin

        NumPedido := StrToInt(lbl_edtNumPedido.Text);

      end;

////////////////////////////////////////////////////////////////////////////////

         { if TipoPreco = '' Then begin

          TipoPreco := 'A';

          end; }

        //  if TipoPreco = 'A' Then begin

          TotalProd := StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]);
          TotalProd := StringReplace(TotalProd,DecimalSeparator,'.',[rfReplaceAll]);

        //  end else begin

       //      TotalProd := '0';

       //  end;

        {  if TipoPreco = 'B' Then begin

          ValorB := StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]);
          ValorB := StringReplace(ValorB,DecimalSeparator,'.',[rfReplaceAll]);
         // if ValorB  = '' Then
          end else begin
             ValorB := '0';
          end;

         if TipoPreco = 'C' Then begin

          ValorC := StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]);
          ValorC := StringReplace(ValorC,DecimalSeparator,'.',[rfReplaceAll]);
        //  if ValorC  = '' Then
         end else begin
             ValorC := '0';

         end;

         SituacaoPedido := 'Pendente';   }

////////////////////////////////////////////////////////////////////////////////

      ibPedCompra.Close;
      ibPedCompra.SQL.Clear;
      ibPedCompra.SQL.Add('INSERT INTO TBLPEDIDODECOMPRA'
      + '(IDDETALHEPCOMPRA,DATA,HORA,DESCONTO,ACRESCIMO,IDPROD,QTDE,VALOR,'
      + 'VLRTOTAL,IDFORNECEDOR,CODBARRASPED,REF) values '
      + '(''' + IntToStr(NumPedido) + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataCompra.Date) + ''','
      + ' ''' + FormatDateTime('hh:mm:ss',Now) + ''','
      + ' ''' + Desconto + ''','
      + ' ''' + Acrescimo + ''','
      + StringGravaProd
      + ' ''' + QtdeGravaProd + ''',''' + VlrGravaProd + ''','
      + ' ''' + TotalProd + ''','
      + StringGravaForn
      + ' ''' + lbl_edtCodBarras.Text + ''','
      + ' ''' + lbl_edtRef.Text + ''')');
      ibPedCompra.ExecSQL;
      Commit(ibPedCompra);

/////////////////////////////////////////////////////////////////////////////////
      if lbl_edtTotalPed.Text <> '' Then begin// se for em branco executa rotina abaixo.

        if (Pos(',',lbl_edtTotalPed.Text)>0) and (lbl_edtTotalPed.Text <> '') Then begin

          Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));

          if lbl_edtTotalGeral.Text = '' Then begin

            lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor1));

          end else begin

            //Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtTotalGeral.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor3 := (Valor2 + Valor1);

            lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor3));

          end;

          end else begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));

          if lbl_edtTotalGeral.Text = '' Then begin

            lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor1));

          end else begin

            //Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtTotalGeral.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor3 := (Valor2 + Valor1);

            lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor3));

          end;

        end;{if}

      end;
////////////////////////////////////////////////////////////////////////////////

    Commit(ibPedCompra);
    ibPedCompra.Close;
    ibPedCompra.SQL.Clear;
    ibPedCompra.SQL.Add('SELECT TBLPEDIDODECOMPRA.*,'
    + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.REF FROM TBLPEDIDODECOMPRA '
    + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODECOMPRA.IDPROD=CADPRODUTOS.IDPROD '
    + 'WHERE TBLPEDIDODECOMPRA.IDDETALHEPCOMPRA =''' + lbl_edtNumPedido.Text + '''');
    ibPedCompra.Open;

    (ibPedCompra.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibPedCompra.FieldByName('VALOR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    FormatFloat('0',ibPedCompra.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }
    (ibPedCompra.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibPedCompra.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO



////////////////////////////////////////////////////////////////////////////////
      lbl_edtTotalPed.Clear;
      lbl_edtVlrProd.Clear;
      lbl_edtRef.Clear;
      lbl_edtQtde.Clear;
      lbl_edtTotalProd.Clear;
      lbl_edtDesc.Clear;
      lbl_edtAcresc.Clear;
      lbl_edtTotalPed.Clear;
      lbl_edtCodBarras.Clear;
      lbl_CodBarras.Caption := '';
      lbl_NomeProd.Caption := '';
      lbl_Valor.Caption := '';
      lbl_edtVizualizarPed.Clear;
      lbl_edtCodInterno.Clear;
      cboFornecedores.ClearSelection;
      cboProduto.ClearSelection;

  end;{with}

end;

procedure TfrmPedidodeCompra.ibeaAbreRelatorioClick(Sender: TObject);

var

NumPedidoRelatorio : Integer;

begin
  with dmModule do begin

    if lbl_edtVizualizarPed.Text <> '' Then begin

      NumPedidoRelatorio := StrToInt(lbl_edtVizualizarPed.Text);


      Commit(ibTempPedCompra);
      ibTempPedCompra.Close;
      ibTempPedCompra.SQL.Clear;
      ibTempPedCompra.SQL.Add('SELECT TBLPEDIDODECOMPRA.*,'
      + 'CADPRODUTOS.NOME As Produto,CADPRODUTOS.NOMEUNIDVENDA,CADPRODUTOS.REF,TBLCADASTRO.NOME As Fornecedor FROM TBLPEDIDODECOMPRA '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLPEDIDODECOMPRA.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLPEDIDODECOMPRA.IDFORNECEDOR=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLPEDIDODECOMPRA.IDFORNECEDOR=TBLCADASTRO.IDCAD '
      + 'WHERE TBLPEDIDODECOMPRA.IDDETALHEPCOMPRA =''' + lbl_edtVizualizarPed.Text + '''');
      ibTempPedCompra.Open;

      (ibTempPedCompra.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempPedCompra.FieldByName('VALOR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibTempPedCompra.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }
      (ibTempPedCompra.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempPedCompra.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO



      Application.CreateForm(TfrmRelPedCompra, frmRelPedCompra);

      TRY

        with frmRelPedCompra do begin

          frmRelPedCompra.qrpPedCompra.dataset := ibTempPedCompra;

      //  frmRelPedOrcamento.qrpPedOrcamento.DataSet := ibPedVenda;

        qrdbNumPedido.DataSet          := ibTempPedCompra;
        qrdbNumPedido.DataField        := ibTempPedCompra.FieldByName('IDDETALHEPCOMPRA').FieldName;

      //  qrdbNomeCliente.DataSet        := ibPedVenda;
      //  qrdbNomeCliente.DataField      := ibPedVenda.FieldByName('Fornecedor').FieldName;


        qrdbProduto.DataSet            := ibTempPedCompra;
        qrdbProduto.DataField          := ibTempPedCompra.FieldByName('Produto').FieldName;

        qrdbUnit.DataSet            := ibTempPedCompra;
        qrdbUnit.DataField          := ibTempPedCompra.FieldByName('VALOR').FieldName;


        qrdbQtde.DataSet               := ibTempPedCompra;
        qrdbQtde.DataField             := ibTempPedCompra.FieldByName('QTDE').FieldName;

        qrdbTotal.DataSet           := ibTempPedCompra;
        qrdbTotal.DataField         := ibTempPedCompra.FieldByName('VLRTOTAL').FieldName;

        qrdbRef.DataSet           := ibTempPedCompra;
        qrdbRef.DataField         := ibTempPedCompra.FieldByName('REF').FieldName;

        qrdbForn.DataSet           := ibTempPedCompra;
        qrdbForn.DataField         := ibTempPedCompra.FieldByName('Fornecedor').FieldName;

        qrdbUnidV.DataSet           := ibTempPedCompra;
        qrdbUnidV.DataField         := ibTempPedCompra.FieldByName('NOMEUNIDVENDA').FieldName;

        qrdbData.DataSet           := ibTempPedCompra;
        qrdbData.DataField         := ibTempPedCompra.FieldByName('DATA').FieldName;

        qrdbDesc.DataSet           := ibTempPedCompra;
        qrdbDesc.DataField         := ibTempPedCompra.FieldByName('DESCONTO').FieldName;

        qrdbAcresc.DataSet           := ibTempPedCompra;
        qrdbAcresc.DataField         := ibTempPedCompra.FieldByName('ACRESCIMO').FieldName;


       // qrl_DatadeEmissao.Caption := FormatDateTime('dd/mm/yyyy',Now);

        ibDadosEmpresa.Close;
        ibDadosEmpresa.SQL.Clear;
        ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
        ibDadosEmpresa.Open;

        qrlEmpresa.Caption := ibDadosEmpresa.FieldByName('NOME').AsString;
        qrlEndereco.Caption := ibDadosEmpresa.FieldByName('ENDERECO').AsString;
        qrlNum.Caption := ibDadosEmpresa.FieldByName('NUMERO').AsString;
        qrlBairro.Caption := ibDadosEmpresa.FieldByName('BAIRRO').AsString;
        qrlEstado.Caption := ibDadosEmpresa.FieldByName('ESTADO').AsString;
        qrlDDDEmpresa.Caption := ibDadosEmpresa.FieldByName('DDD').AsString;
        qrlTelefoneEmpresa.Caption := ibDadosEmpresa.FieldByName('TELEFONE').AsString;

  ////////////////////////////////////////////////////////////////////////////////

  //ConfirmaRelatorio := Application.MessageBox('Deseja Emitir Relatório para e-mail?','relatório para email',+MB_YESNO+MB_ICONQUESTION);

  //if ConfirmaRelatorio = 6 Then begin
  { Exemplo 1 }

  {qrpPedOrcamento.ExportToFilter(TQRHTMLDocumentFilter.Create(

  'C:\ORÇAMENTO.HTML'));}



  { Exemplo 2 }



  {qrpPedOrcamento.ExportToFilter(TQRHTMLDocumentFilter.Create(

  'C:\ORÇAMENTO.xls'));

  qrpPedOrcamento.ExportFilter.Free;

  end;//if  }

  ////////////////////////////////////////////////////////////////////////////////





        qrpPedCompra.Preview;
      //  qrpPedOrcamento.Preview;


        end; {if}


      EXCEPT
        on E : Exception do begin
          frmRelPedCompra.Release; //frmRelPedOrcamento.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////
    end;//if visualizar pedido
////////////////////////////////////////////////////////////////////////////////


 { MSWord:= CreateOleObject ('Word.Basic');
  MSWord.AppShow;//mostra o word
  MSWord.FileNew;//inicia um novo documento
  MSWord.insert('RELATÓRIO'); //Escreve algo
  MSWord.insert(#13+'');//Pula uma linha e escreve
  MSWord.FontSize(24);//muda o tamanho da fonte
  MSWord.italic;//coloca italico
  MSWord.bold;//coloca negrito
  MSWord.underline;//sublina
  MSWord.insert(#13+'');//pula a linha e escreve novamente
  MSWord.FontSize(12);//muda o tamanho da fonte
  MSWord.Font('Arial');//muda a fonte usada
  MSWord.underline(false);//retira o sublinhado
  MSWord.italic(false);//retira o italico
  MSWord.bold(false);//retira o bold
  MSWord.insert(ibeaVisualizarpedidoClick(Sender)).value;
 // MSWord.insert(#13+#9 +'teste');//nova linha e um TAB
 // MSWord.insert(#13+ibeaVisualizarpedidoClick(Sender));//insere algo de uma tabela
  MSWord.LineUp(2, 1); //seleciona uma parte do texto
  MSWord.TextToTable(ConvertFrom := 2, NumColumns := 1);// monta uma tabela com o texto selecionado
  MSWord.FileSaveAs('d:\test.txt', 3); //Salva o arquivo  }



////////////////////////////////////////////////////////////////////////////////

      lbl_edtTotalPed.Clear;
      lbl_edtVlrProd.Clear;
      lbl_edtRef.Clear;
      lbl_edtQtde.Clear;
      lbl_edtTotalProd.Clear;
      lbl_edtDesc.Clear;
      lbl_edtAcresc.Clear;
      lbl_edtTotalPed.Clear;
      lbl_CodBarras.Caption := '';
      lbl_NomeProd.Caption := '';
      lbl_Valor.Caption := '';
      cboFornecedores.ClearSelection;
      cboProduto.ClearSelection;


  end;{with}


end;

procedure TfrmPedidodeCompra.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmPedidodeCompra.dbgPedComprasCellClick(Column: TColumn);

var

i : Integer;

begin

  with dmModule do begin

  IDPedCompra := ibPedCompra.FieldByName('IDPEDCOMPRA').AsInteger;

    if ibPedCompra.RecordCount > 0 Then begin

      lbl_edtRef.Text       := ibPedCompra.FieldByName('REF').AsString;
      lbl_edtCodBarras.Text := ibPedCompra.FieldByName('CODBARRASPED').AsString;
      lbl_edtVlrProd.Text   := FormatFloat(CasasDecimais('Produtos'),ibPedCompra.FieldByName('VALOR').AsFloat);
      lbl_edtQtde.Text      := FormatFloat(CasasDecimais('Produtos'),ibPedCompra.FieldByName('QTDE').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibPedCompra.FieldByName('VLRTOTAL').AsFloat);

      for i:=0 to cboFornecedores.Items.Count -1 do begin
        if TClasseCombo( cboFornecedores.Items.Objects[i]).ID = ibPedCompra.FieldByName('IDFORNECEDOR').AsInteger then begin
          cboFornecedores.ItemIndex:= i;
          Break;
        end else begin
          cboFornecedores.ClearSelection;
        end;
      end;//for

      for i:=0 to cboProduto.Items.Count -1 do begin
        if TClasseCombo( cboProduto.Items.Objects[i]).ID = ibPedCompra.FieldByName('IDPROD').AsInteger then begin
          cboProduto.ItemIndex:= i;
          Break;
        end else begin
          cboProduto.ClearSelection;
        end;
      end;//for

    end;//if recordcount

  end;//with

end;

procedure TfrmPedidodeCompra.lbl_edtVizualizarPedExit(Sender: TObject);

var

TotalProd : Real;
VlrTotal : String;

begin

  if TotalProd > 0 Then begin

    TotalProd := 0;

  end;

  if VlrTotal > '0' Then begin

    VlrTotal := '0';

  end;

  with dmModule do begin

    if lbl_edtVizualizarPed.Text <> '' Then begin

      Commit(ibPedCompra);
      ibPedCompra.Close;
      ibPedCompra.SQL.Clear;
      ibPedCompra.SQL.Add('SELECT TBLPEDIDODECOMPRA.*,'
      + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.REF FROM TBLPEDIDODECOMPRA '
      + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODECOMPRA.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE TBLPEDIDODECOMPRA.IDDETALHEPCOMPRA =''' + lbl_edtVizualizarPed.Text + '''');
      ibPedCompra.Open;

      (ibPedCompra.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedCompra.FieldByName('VALOR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibPedCompra.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }
      (ibPedCompra.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedCompra.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      while not ibPedCompra.Eof do begin

        if (TotalProd = 0)Then begin

          TotalProd := StrtoFloat(StringReplace(FloattoStr(ibPedCompra.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

        end else begin

          VlrTotal := StringReplace(FloattoStr(ibPedCompra.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

          TotalProd := TotalProd + StrtoFloat(StringReplace(VlrTotal,ThousandSeparator,'',[rfReplaceAll]));

        end;//if

      ibPedCompra.Next;

      end;//while

      lbl_edtTotalGeral.Text := FormatFloat(CasasDecimais('Produtos'),TotalProd);

    end;//if

  end;//with

end;

procedure TfrmPedidodeCompra.lbl_edtVizualizarPedKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtRef.SetFocus;

  end;

end;

procedure TfrmPedidodeCompra.ibeaAlterarClick(Sender: TObject);

var

ConfirmaAlteracao : Integer;

begin

  with dmModule do begin

  ConfirmaAlteracao := Application.MessageBox('confirma a Alteração','Alteração de Registro',MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaAlteracao = 6 Then begin

      AlterarPedido;

    end;

  end;//with

end;

procedure TfrmPedidodeCompra.ibeaExcluirClick(Sender: TObject);

var

ConfirmaExclusao : Integer;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Confirma a Exclusão?','Exclusão de Registro',+MB_YESNO+MB_ICONQUESTION+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      ibPedCompra.Close;
      ibPedCompra.SQL.Clear;
      ibPedCompra.SQL.Add('DELETE FROM TBLPEDIDODECOMPRA WHERE IDPEDCOMPRA=''' + IntToStr(IDPedCompra) + '''');
      ibPedCompra.ExecSQL;

    end;//if

  end;//with

end;

procedure TfrmPedidodeCompra.ibeaBuscaProdClick(Sender: TObject);
begin
frmBuscaProdutos.ShowModal;
end;

procedure TfrmPedidodeCompra.ibeaLimparCamposClick(Sender: TObject);
begin
LimpaCamposPedido;
end;

procedure TfrmPedidodeCompra.ibeaIncluirItensClick(Sender: TObject);

var

Valor1,Valor2,Valor3,QtdeVendida : Real;
NumPedido : Integer;
Desconto,Acrescimo, StringGravaProd, TotalProd, QtdeGravaProd, VlrGravaProd : String;
IDClassGravaProd, IDClassGravaForn   : TClasseCombo;
StringGravaForn : String;
ConfirmaPedido : Integer;

begin

  with dmModule do begin

  ConfirmaPedido := Application.MessageBox('Atenção este recurso permite incluir itens em um pedido já lançado, deseja continuar?','Inclusão de itens',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaPedido = 6 Then begin

      If cboProduto.ItemIndex = -1 Then begin

        StringGravaProd := ' '' 0 '',';

      end else begin

        IDClassGravaProd   := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
        StringGravaProd          := ' ''' + InttoStr( IDClassGravaProd.ID ) + ''',';

      end;

        If cboFornecedores.ItemIndex = -1 Then begin

          StringGravaForn := ' ''0'',';

        end else begin

          IDClassGravaForn   := TClasseCombo( cboFornecedores.Items.Objects[cboFornecedores.ItemIndex] );
          StringGravaForn  := ' ''' + InttoStr( IDClassGravaForn.ID ) + ''',';

        end;{ifcbotipopagto}



        TotalProd := StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]);
        TotalProd := StringReplace(TotalProd,DecimalSeparator,'.',[rfReplaceAll]);
        if TotalProd = '' Then
           TotalProd := '0';

        QtdeGravaProd := StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]);
        QtdeGravaProd := StringReplace(QtdeGravaProd,DecimalSeparator,'.',[rfReplaceAll]);
        if QtdeGravaProd = '' Then
        QtdeGravaProd := '0';

        VlrGravaProd := StringReplace(lbl_edtVlrProd.Text,ThousandSeparator,'',[rfReplaceAll]);
        VlrGravaProd := StringReplace(VlrGravaProd,DecimalSeparator,'.',[rfReplaceAll]);
        if VlrGravaProd = '' Then
        VlrGravaProd := '0';

        Desconto := StringReplace(lbl_edtDesc.Text,ThousandSeparator,'',[rfReplaceAll]);
        Desconto := StringReplace(Desconto,DecimalSeparator,'.',[rfReplaceAll]);
        if Desconto = '' Then
        Desconto := '0';

        Acrescimo := StringReplace(lbl_edtAcresc.Text,ThousandSeparator,'',[rfReplaceAll]);
        Acrescimo := StringReplace(Acrescimo,DecimalSeparator,'.',[rfReplaceAll]);
        if Acrescimo = '' Then
        Acrescimo := '0';


        if lbl_edtVizualizarPed.Text <> '' Then begin

          NumPedido := StrToInt(lbl_edtVizualizarPed.Text);

        end;

////////////////////////////////////////////////////////////////////////////////

            TotalProd := StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]);
            TotalProd := StringReplace(TotalProd,DecimalSeparator,'.',[rfReplaceAll]);

////////////////////////////////////////////////////////////////////////////////

        ibPedCompra.Close;
        ibPedCompra.SQL.Clear;
        ibPedCompra.SQL.Add('INSERT INTO TBLPEDIDODECOMPRA'
        + '(IDDETALHEPCOMPRA,DATA,HORA,DESCONTO,ACRESCIMO,IDPROD,QTDE,VALOR,'
        + 'VLRTOTAL,IDFORNECEDOR,CODBARRASPED,REF) values '
        + '(''' + IntToStr(NumPedido) + ''','
        + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataCompra.Date) + ''','
        + ' ''' + FormatDateTime('hh:mm:ss',Now) + ''','
        + ' ''' + Desconto + ''','
        + ' ''' + Acrescimo + ''','
        + StringGravaProd
        + ' ''' + QtdeGravaProd + ''',''' + VlrGravaProd + ''','
        + ' ''' + TotalProd + ''','
        + StringGravaForn
        + ' ''' + lbl_edtCodBarras.Text + ''','
        + ' ''' + lbl_edtRef.Text + ''')');
        ibPedCompra.ExecSQL;
        Commit(ibPedCompra);

////////////////////////////////////////////////////////////////////////////////
        if lbl_edtTotalPed.Text <> '' Then begin// se for em branco executa rotina abaixo.

          if (Pos(',',lbl_edtTotalPed.Text)>0) and (lbl_edtTotalPed.Text <> '') Then begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));

            if lbl_edtTotalGeral.Text = '' Then begin

              lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor1));

            end else begin

              //Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));
              Valor2 := StrToFloat(StringReplace(lbl_edtTotalGeral.Text,ThousandSeparator,'',[rfReplaceAll]));
              Valor3 := (Valor2 + Valor1);

              lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor3));

            end;

            end else begin

              Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));

            if lbl_edtTotalGeral.Text = '' Then begin

              lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor1));

            end else begin

              //Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));
              Valor2 := StrToFloat(StringReplace(lbl_edtTotalGeral.Text,ThousandSeparator,'',[rfReplaceAll]));
              Valor3 := (Valor2 + Valor1);

              lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor3));

            end;

          end;{if}

        end;
////////////////////////////////////////////////////////////////////////////////

      if lbl_edtNumPedido.Text <> '' Then begin

        Commit(ibPedCompra);
        ibPedCompra.Close;
        ibPedCompra.SQL.Clear;
        ibPedCompra.SQL.Add('SELECT TBLPEDIDODECOMPRA.*,'
        + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.REF FROM TBLPEDIDODECOMPRA '
        + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODECOMPRA.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE TBLPEDIDODECOMPRA.IDDETALHEPCOMPRA =''' + lbl_edtNumPedido.Text + '''');
        ibPedCompra.Open;

        (ibPedCompra.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        (ibPedCompra.FieldByName('VALOR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        FormatFloat('0',ibPedCompra.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }
        (ibPedCompra.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        (ibPedCompra.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      end;//if

      if lbl_edtVizualizarPed.Text <> '' Then begin

        Commit(ibPedCompra);
        ibPedCompra.Close;
        ibPedCompra.SQL.Clear;
        ibPedCompra.SQL.Add('SELECT TBLPEDIDODECOMPRA.*,'
        + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.REF FROM TBLPEDIDODECOMPRA '
        + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODECOMPRA.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE TBLPEDIDODECOMPRA.IDDETALHEPCOMPRA =''' + lbl_edtVizualizarPed.Text + '''');
        ibPedCompra.Open;

        (ibPedCompra.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        (ibPedCompra.FieldByName('VALOR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        FormatFloat('0',ibPedCompra.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }
        (ibPedCompra.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        (ibPedCompra.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      end;//if

////////////////////////////////////////////////////////////////////////////////
        lbl_edtTotalPed.Clear;
        lbl_edtVlrProd.Clear;
        lbl_edtRef.Clear;
        lbl_edtQtde.Clear;
        lbl_edtTotalProd.Clear;
        lbl_edtDesc.Clear;
        lbl_edtAcresc.Clear;
        lbl_edtTotalPed.Clear;
        lbl_edtCodBarras.Clear;
        lbl_CodBarras.Caption := '';
        lbl_NomeProd.Caption := '';
        lbl_Valor.Caption := '';
        lbl_edtVizualizarPed.Clear;
        cboFornecedores.ClearSelection;
        cboProduto.ClearSelection;


    end;//if confirma pedido

  end;{with}

end;

procedure TfrmPedidodeCompra.lbl_edtCodInternoExit(Sender: TObject);

var

i : Integer;

begin

  with dmModule do begin

  if lbl_edtCodInterno.Text <> '' Then begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
    + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
    + 'WHERE CADPRODUTOS.IDPROD=''' + lbl_edtCodInterno.Text + '''');
    ibProdutos.Open;

    lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
    lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
    lbl_TipoPreco.Caption := 'Preço de Venda(A)';
    lbl_edtQtde.Text := '1';
    lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
    lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;
    lbl_edtRef.Text       := ibProdutos.FieldByName('REF').AsString;
    lbl_edtCodInterno.Text := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);

   { if lbl_TipoPreco.Caption = '' Then begin

      TipoPreco := 'A'

    end;}

  //  if TipoPreco = 'A' Then begin

     { lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORCUSTO').AsFloat);
      lbl_TipoPreco.Caption := 'Preço de Venda(A)';
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString; }
     //lbl_edtTotalGeral
  //  end;

   { if TipoPreco = 'B' Then begin

      lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;

    end;

    if TipoPreco = 'C' Then begin

      lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
      lbl_edtQtde.Text := '1';
      lbl_CodBarras.Caption := ibProdutos.FieldByName('CODBARRAS').AsString;
      lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;

    end; }

    lbl_edtQtde.SetFocus;

    for i:=0 to cboProduto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboProduto.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboProduto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboProduto.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}


    for i:=0 to cboFornecedores.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboFornecedores.Items.Objects[i]).ID = ibProdutos.FieldByName('FORNECEDOR').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboFornecedores.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboFornecedores.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}

  end;//if codinterno <> ''
  
  end;//with


end;

procedure TfrmPedidodeCompra.lbl_edtCodInternoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtVlrProd.SetFocus;

  end;//if
  
end;

procedure TfrmPedidodeCompra.lbl_edtVlrProdKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 Then begin

    lbl_edtQtde.SetFocus;

  end;

end;

procedure TfrmPedidodeCompra.ibeaEstoquePedidoClick(Sender: TObject);

var

IDProdutoEstoque : Integer;
QtdePedEstoque, QtdeEstoque, VlrProdutoEstoque, ValorCustoEstoque : Real;
EstoqueFinal, TotalProdEstoque, TotalCustoEstoque :String;

begin

  with dmModule do begin

////////////////////////////////////////////////////////////////////////////////
      Commit(ibPedCompra);
      ibPedCompra.Close;
      ibPedCompra.SQL.Clear;
      ibPedCompra.SQL.Add('SELECT TBLPEDIDODECOMPRA.*,'
      + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.REF FROM TBLPEDIDODECOMPRA '
      + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODECOMPRA.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE TBLPEDIDODECOMPRA.IDDETALHEPCOMPRA =''' + lbl_edtVizualizarPed.Text + '''');
      ibPedCompra.Open;

      (ibPedCompra.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedCompra.FieldByName('VALOR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibPedCompra.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }

            while not ibPedCompra.Eof do begin

            IDProdutoEstoque := ibPedCompra.FieldByName('IDPROD').AsInteger;

            QtdePedEstoque   := StrtoFloat(StringReplace(FloattoStr(ibPedCompra.FieldByName('QTDE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            ibEntrProdEstoque.Close;
            ibEntrProdEstoque.SQL.Clear;
            ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
            + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
            + 'CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD FROM TBLENTRADAESTOQUEPROD '
            + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
            + 'WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + IntToStr(IDProdutoEstoque) + '''');
            ibEntrProdEstoque.Open;

          //ROTINA ABAIXO PARA SOMAR TOTAL DO ESTQUE E QUANTIDADE DO ESTOQUE

          //traz na variavel a qtde conf. prod da select identificado por id.
           QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
         // QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),DecimalSeparator,',',[rfReplaceAll]));

         // QtdeVendaDevolve   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

           QtdeEstoque := QtdeEstoque + QtdePedEstoque;

           EstoqueFinal := StringReplace(FloattoStr(QtdeEstoque),ThousandSeparator,'',[rfReplaceAll]);
           EstoqueFinal := StringReplace(EstoqueFinal,DecimalSeparator,'.',[rfReplaceAll]);

          //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
           VlrProdutoEstoque  := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           VlrProdutoEstoque  := QtdeEstoque * VlrProdutoEstoque;

           TotalProdEstoque := StringReplace(FloattoStr(VlrProdutoEstoque),ThousandSeparator,'',[rfReplaceAll]);
           TotalProdEstoque := StringReplace(TotalProdEstoque,DecimalSeparator,'.',[rfReplaceAll]);


           ValorCustoEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           ValorCustoEstoque := QtdeEstoque * ValorCustoEstoque;

           TotalCustoEstoque := StringReplace(FloattoStr(ValorCustoEstoque),ThousandSeparator,'',[rfReplaceAll]);
           TotalCustoEstoque := StringReplace(TotalCustoEstoque,DecimalSeparator,'.',[rfReplaceAll]);

           //ROTINA PARA O ESTOQUE MINIMO
           if ibEntrProdEstoque.RecordCount > 0 Then begin

             ibEntrProdEstoque.Close;
             ibEntrProdEstoque.SQL.Clear;
             ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
             +'TOTALCUSTO=''' + TotalCustoEstoque + ''','
             +'VLRTOTAL=''' + (TotalProdEstoque) +  ''','
             +'QUANTIDADE=''' + (EstoqueFinal) + ''' WHERE IDPROD=''' + IntToStr(IDProdutoEstoque) + '''');
             ibEntrProdEstoque.ExecSQL;
             Commit(ibEntrProdEstoque);

           end;//if recordcount

           ibPedCompra.Next;

           end;//while
////////////////////////////////////////////////////////////////////////////////


  end;//with

end;

end.
