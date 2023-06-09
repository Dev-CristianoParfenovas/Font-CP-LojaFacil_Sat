unit Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBEAntialiasButton, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls,
  mxFlatControls, classComboBox, IniFiles, IBQuery, DBTables, DB;

type
  TfrmEstoque = class(TForm)
    pcEstoque: TPageControl;
    TabSheet1: TTabSheet;
    lbl_edtEntrada: TLabeledEdit;
    lbl_edtPedidocompra: TLabeledEdit;
    lbl_edtNumnf: TLabeledEdit;
    lbl_edtSerie: TLabeledEdit;
    lbl_edtDesc: TLabeledEdit;
    lbl_edtEncfinan: TLabeledEdit;
    dbgEntradaestoque: TDBGrid;
    lbl_edtTnf: TLabeledEdit;
    lblEmissao: TLabel;
    lbl_Entrega: TLabel;
    lbl_edtTotalNF: TLabeledEdit;
    lblCondpag: TLabel;
    Image1: TImage;
    lbl_Detalhenf: TLabel;
    lbl_edtCodbarra: TLabeledEdit;
    lbl_edtQuantidade: TLabeledEdit;
    lbl_edtEstoquemin: TLabeledEdit;
    lbl_edtVlrunit: TLabeledEdit;
    lbl_edtVlrtotal: TLabeledEdit;
    cboProduto: TComboBox;
    lblProduto: TLabel;
    ibeaIncluiprod: TIBEAntialiasButton;
    ibeaNovo: TIBEAntialiasButton;
    ibeaAlterar: TIBEAntialiasButton;
    ibeaPrimeiro: TIBEAntialiasButton;
    ibeaAnterior: TIBEAntialiasButton;
    ibeaProximo: TIBEAntialiasButton;
    ibeaUltimo: TIBEAntialiasButton;
    ibeaSair: TIBEAntialiasButton;
    cboEstoque: TComboBox;
    Label1: TLabel;
    dtpEmissao: TmxFlatDateTimePicker;
    dtpEntrega: TmxFlatDateTimePicker;
    lbl_edtQtdeitens: TLabeledEdit;
    Bevel1: TBevel;
    cboFornecedor: TComboBox;
    lbl_Fornecedor: TLabel;
    cboNatureza: TComboBox;
    lbl_Natureza: TLabel;
    lbl_NaturezaCod: TLabel;
    lbl_Cod: TLabel;
    Image13: TImage;
    lbl_edtQtdeProd: TLabeledEdit;
    lbl_edtEstMin: TLabeledEdit;
    lbl_edtTotalEstoque: TLabeledEdit;
    Label2: TLabel;
    dtpVctoNota: TmxFlatDateTimePicker;
    tbsConsultaEstoque: TTabSheet;
    cboConsEstoque: TComboBox;
    Label3: TLabel;
    cboConsProd: TComboBox;
    Label6: TLabel;
    lbl_edtQtdeEs: TLabeledEdit;
    lbl_edtQtdeESMin: TLabeledEdit;
    lbl_edtVlrUnitEs: TLabeledEdit;
    lbl_edtTotalEs: TLabeledEdit;
    dbgConsEstoque: TDBGrid;
    ibeaExcluir: TIBEAntialiasButton;
    Bevel2: TBevel;
    ibeaSairCons: TIBEAntialiasButton;

    procedure Commit(IBQueryExec : TIBQuery);

    procedure CalculaContasaPagar;
    procedure AlteraEstoque;
    procedure DesabilitaCamposNF(opcao:Boolean);
    procedure DesabilitaCamposProd(opcao:Boolean);
    procedure LimpaCampo;
    procedure ExecSELECTNatureza;
    procedure ExecSELECTFornecedor;
    procedure ExecSELECTEntrProd;
    procedure ExecSELECT;
    procedure ExecSELECTConsProd;
    procedure ExecSELECTConsEstoque;
    procedure ExecSELECTEstnf;
    procedure ExibeDados;
    procedure FormShow(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure ibeaNovoClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure ibeaPrimeiroClick(Sender: TObject);
    procedure ibeaAnteriorClick(Sender: TObject);
    procedure ibeaProximoClick(Sender: TObject);
    procedure ibeaUltimoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cboProdutoChange(Sender: TObject);
    procedure ibeaIncluiprodClick(Sender: TObject);
    procedure cboEstoqueClick(Sender: TObject);
    procedure lbl_edtQuantidadeExit(Sender: TObject);
    procedure lbl_edtVlrtotalExit(Sender: TObject);
    procedure cboNaturezaClick(Sender: TObject);
    procedure cboCondpagtoChange(Sender: TObject);
    procedure cboProdutoClick(Sender: TObject);
    procedure lbl_edtEstoqueminExit(Sender: TObject);
    procedure cboConsEstoqueClick(Sender: TObject);
    procedure lbl_edtCodbarraChange(Sender: TObject);
    procedure cboConsProdChange(Sender: TObject);
    procedure dbgConsEstoqueCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstoque: TfrmEstoque;
  ConfirmaMSG: Integer;
  Qtde : Integer;
  IDEntrada : Integer;
  EstMin : Integer;
  IDEntrProd : Integer;
  IDProd : Integer;
  IDClass : Integer;
  IDClassEstoque : Integer;
  IDClassProd : Integer;
  IDEntrEstoqueProd : Integer;
  IDClassCondPagto : Integer;
  EstoqueNf : Integer;
  ClassEstoque : TClasseCombo;
  ClassProd : TClasseCombo;
  ClassConsultaProd : TClasseCombo;
  ClassCondPagto : TClasseCombo;
  IDEstoque : TClasseCombo;
  IDProduto : TClasseCombo;
  IDCondPagto : TClasseCombo;
  StringProd : String;
  StringEstoque : String;
  StringCondpagto : String;
  StringIDProd : String;
  StringSomaProd : String;//variavel pra somar os produtos
  QtdeItens : String;
  MontaColunas : Boolean;
  IncluiProd : Boolean;
  ClassForn : TClasseCombo;//pra trazer o fornecedor no combo
  IDClassForn : Integer;//pra trazer o fornecedor
  //variaveis pra gravar na tabela
  IDFornecedor : TClasseCombo;
  StringFornecedor : String;
  IDNatureza : TClasseCombo;//variavel pra trazer natureza de operacao.
  IDNaturezaCod : TClasseCombo;
  StringNatureza : String;
  //VARIAVEIS PARA AS CASAS DECIMAIS
  ConfigSiS : TIniFile;
  FormatoMoeda : String;
  Casas : Longint;
  ValorCusto : String;
  ValorVendaa : String;
  ValorVendab : String;
  ValorVendac : String;
  Erro : Boolean;

  VlrTotalNF : String;//variavel para gravar total da nota em contas a pagar
  IDCod : Integer;//variavel pra gravar codigo na tbl contas a pagar.
  IDTipoServico : Integer;//variavel pragravar o tipo de fornecedor na tbl contas a pagar


  // variaveis para calcular total,qtde e estoque minimo
  ValorEstoque : Real;
  Total : Real;
  Quantidade : Real;
  QtdeLancada : Real;
  TotalQtde : Real;         
  EstoqueMinimo : Real;
  ValorEstMinimo : Real;
  TotalEstMinimo : Real;


  ClassProdEstoque    : TClasseCombo;
  StringProdEstoque   : String;

  IDConsEstoque : TClasseCombo;
  IDConsProduto : TClasseCombo;


  IDEstoqueCons : TClasseCombo;
  StringEstoqueCons : String;
  IDProdutoCons : TClasseCombo;

  MontaColConsEstoque : boolean;

  IDProdutodoEstoque : Integer;

  //variaveis para somar o custo do produto  x a qtde. na entrada do estoque.
  ValorCustoProduto : Real;
  TotalCustoProduto : Real;
  ValorCustoEstoque : Real;
  

implementation

uses  funcPosto, untdmModule;

{$R *.dfm}


function CasasDecimais: String;
begin

  with ConfigSiS do begin

    ConfigSiS := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\RunTime\sis.ini'); //Cria o vinculo com o Arquivo ini
    Casas := ReadInteger('Formatacoes','FormatoMoedaCasas',2);//atribui as chaves do arquivo ini na variavel

    if Casas = 2 Then begin
      Result := ',0.00';
    end else begin
      Result := ',0.000';
    end; {if}

  end; {if}

end;

procedure TfrmEstoque.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmEstoque.CalculaContasaPagar;

var
 { str : String;
  A : TStrArray;
  CountIDUsuarios : longint;
  i: integer;
  TotalData : String;  }
  Dia,Mes,Ano : Word;
  DataInicial,DataFinal: TDate;

begin

// if cboCondpagto.ItemIndex <> - 1 Then begin


 { decodedaTe(dtpEntrega.Date,ano,mes,dia);
  Dia:=5;
  DataInicial:=encodeDate(Ano,Mes,Dia);
  if Mes=12 Then
    begin
      Mes:=1;
      Ano:=Ano+1;
    end
  else
    Mes:=Mes+1;
  DataFinal:=encodeDate(Ano,Mes,Dia);
 Showmessage(Datetostr(DataInicial));
 Showmessage(DateTostr(DataFinal));
end; }


////////////////////////////////////////////////////////////////////////////////
{      str := cboCondpagto.Text;//atribui o conteudo na variavel
      CountIDUsuarios := Explode(A, '/', str); //a tribuia funcao na variavel pegando os dados separados pela /
    for i := 0 to CountIDUsuarios -1 do begin //busca pelo primeiro registro antes da barra

     // EncodeDate(DateToStr('mm-dd-yyyy',dtpEmissao.Date),Dia,Mes,Ano);

    // EncodeDate(DateToStr(dtpEmissao.Date),Ano,Mes,Dia));

     Dia := StrToInt(cboCondpagto.Text); }

   // end; {for}

   { for i:=1 to Datetoint(dtpEmissao.Date) do
      begin
        Mes:=Mes+1;
        if Mes > 12 then
        begin
          Mes:=1;
          Ano:=ano+1;
        end;
        data:=EncodeDate(Ano,Mes,Dia);
      end;}

  //end;{if}
///////////////////////////////////////////////////////////////////////////////
end;

procedure TfrmEstoque.AlteraEstoque;
begin

  with dmModule do begin

   if cboEstoque.ItemIndex = -1 Then begin

     StringEstoque := ', IDLOCAL=''0''';

   end else begin

     IDEstoque := TClasseCombo(cboEstoque.Items.Objects[cboEstoque.ItemIndex]);
     StringEstoque := ', IDLOCAL=''' + IntToStr(IDEstoque.ID) + '''';

/////////////////////////////////////////////////////////////////////////

   {  if cboCondpagto.ItemIndex = -1 Then begin

     StringCondpagto   := ', IDCONDPAGTO=''0''';

     end else begin

       IDCondPagto     := TClasseCombo(cboCondpagto.Items.Objects[cboCondpagto.ItemIndex]);
       StringCondpagto := ', IDCONDPAGTO=''' + IntToStr(IDCondPagto.ID) + '''';  }

/////////////////////////////////////////////////////////////////////////////

        if lbl_edtQtdeitens.Text = '' Then begin
          QtdeItens := '0';
        end else begin
          QtdeItens := lbl_edtQtdeitens.Text;
        end;

//////////////////////////////////////////////////////////////////////////

      ibEntradamercadoria.Close;
      ibEntradamercadoria.SQL.Clear;
      ibEntradamercadoria.SQL.Add('UPDATE ENTRADAESTOQUE SET '
      +'PEDIDOCOMPRA=''' + lbl_edtPedidocompra.Text + ''''
      + StringEstoque
    //  + StringCondpagto
      + ',DATAEMISSAO = ''' + FormatDateTime('mm-dd-yyyy', dtpEmissao.Date) + ''''
      + ',DATAENTREGA = ''' + FormatDateTime('mm-dd-yyyy', dtpEntrega.Date) + ''''
      + ',NUMERONF=''' + lbl_edtNumnf.Text + ''''
      + ',SERIE=''' + lbl_edtSerie.Text + ''''
      + ',QTDEITENS=''' + QtdeItens + ''''
    //  + ',NATUREZA=''' + lbl_edtNatureza.Text + ''''
      + ',TIPONF=''' + lbl_edtTnf.Text + ''''
      + ',DESCONTO=''' + lbl_edtDesc.Text + ''''
      + ',ENCARGOS=''' + lbl_edtEncfinan.Text + ''''
      + ',TOTALNF=''' + lbl_edtTotalnf.Text + ''' WHERE IDENTRNFEST=''' + IntToStr(EstoqueNf) + '''');
      ibEntradamercadoria.ExecSQL;
      TREntradamercadoria.Commit;
   //  end{if}

   end{if}

  end;{with}

end;

procedure TfrmEstoque.DesabilitaCamposNF(opcao:Boolean);
begin
  cboEstoque.Enabled := opcao;
  cboFornecedor.Enabled := opcao;
  cboNatureza.Enabled := opcao;
  lbl_NaturezaCod.Enabled := opcao;
  lbl_edtEntrada.Enabled := opcao;
  lbl_edtPedidocompra.Enabled := opcao;
  lbl_edtNumnf.Enabled := opcao;
  lbl_edtSerie.Enabled := opcao;
  lbl_edtQtdeitens.Enabled := opcao;
 // lbl_edtQtdeitensestoque.Enabled := opcao;
  lbl_edtDesc.Enabled := opcao;
 // cboCondpagto.Enabled := opcao;
 // lbl_edtTotalLancto.Enabled := opcao;
  lbl_edtTnf.Enabled := opcao;
  lbl_edtTotalnf.Enabled := opcao;
  lbl_edtEncfinan.Enabled := opcao;
  dtpEmissao.Enabled := opcao;
  dtpEntrega.Enabled := opcao;

end;

procedure TfrmEstoque.DesabilitaCamposProd(opcao:Boolean);
begin
  lbl_edtCodbarra.Enabled := opcao;
  cboProduto.Enabled := opcao;
  lbl_edtQuantidade.Enabled := opcao;
  lbl_edtEstoquemin.Enabled := opcao;
  lbl_edtVlrunit.Enabled := opcao;
  lbl_edtVlrtotal.Enabled := opcao;
  lbl_edtQtdeProd.Enabled := opcao;
  lbl_edtEstMin.Enabled := opcao;
  lbl_edtTotalEstoque.Enabled := opcao;
end;

procedure TfrmEstoque.LimpaCampo;
begin
  cboEstoque.ClearSelection;
  cboFornecedor.ClearSelection;
  lbl_NaturezaCod.Caption := '';
  lbl_edtQuantidade.Text := '0,00';
  cboProduto.ClearSelection;
  lbl_edtEntrada.Clear;
  cboNatureza.ClearSelection;
  lbl_edtPedidocompra.Clear;
  lbl_edtNumnf.Clear;
  lbl_edtSerie.Clear;
  lbl_edtQtdeitens.Clear;
  lbl_edtDesc.Clear;
  lbl_edtEstoquemin.Text := '0';
 // cboCondpagto.ClearSelection;
  lbl_edtCodbarra.Clear;
  lbl_edtVlrunit.Clear;
  lbl_edtVlrtotal.Clear;
  lbl_edtEncfinan.Clear;
  lbl_edtTnf.Clear;
  lbl_edtTotalnf.Clear;
  lbl_edtQtdeProd.Clear;
  lbl_edtEstMin.Text := '0';
  lbl_edtTotalEstoque.Clear;
end;

procedure TfrmEstoque.ExecSELECTNatureza;

begin

  with dmModule do begin

     //SELECT PARA TRAZER OS DADOS DA TABELA
      ibNatureza.Close;
      ibNatureza.SQL.Clear;
      ibNatureza.SQL.Add('SELECT * FROM NATUREZA');
      ibNatureza.Open;

      cboNatureza.Clear;//LIMPA A SELECAO DO COMBO

    while not ibNatureza.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDNatureza    := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDNatureza.ID := ibNatureza.FieldByName('IDNATUREZA').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboNatureza.Items.AddObject(ibNatureza.FieldByName('DESCRICAO').AsString,IDNatureza);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibNatureza.Next;

    end;{while}

  end;{with}

end;

procedure TfrmEstoque.ExecSELECTFornecedor;

begin

  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClassForn := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICA��O DO FORNECEDOR NA VARIAVEL.

    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=' + IntToStr(IDClassForn));//('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboFornecedor.Clear; //LIMPA O COMBOBOX

    while not ibCadastro.Eof do begin

      ClassForn    := TClasseCombo.Create;
      ClassForn.ID  := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboFornecedor.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,ClassForn);
      ibCadastro.Next;

    end;{WHILE}

  end;{WITH}

end;

procedure TfrmEstoque.ExecSELECTEntrProd;
begin
  with dmModule do begin

    //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS.
    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS');
    ibProdutos.Open;

    cboProduto.Clear;

    while not ibProdutos.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDProduto := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDProduto.ID := ibProdutos.FieldByName('IDPROD').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboProduto.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDProduto);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibProdutos.Next;

    end;

  end;

end;

procedure TfrmEstoque.ExecSELECT;
begin
  with dmModule do begin

     //SELECT PARA TRAZER OS DADOS DA TABELA
      ibEstoque.Close;
      ibEstoque.SQL.Clear;
      ibEstoque.SQL.Add('SELECT * FROM LOCALESTOCAGEM');
      ibEstoque.Open;

      cboEstoque.Clear;//LIMPA A SELECAO DO COMBO

    while not ibEstoque.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS
      IDEstoque := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDEstoque.ID := ibEstoque.FieldByName('IDESTOQUE').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboEstoque.Items.AddObject(ibEstoque.FieldByName('NOME').AsString,IDEstoque);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibEstoque.Next;
    end;

        //SELECT PARA TRAZER OS DADOS DA TABELA
      {  ibCondicoesPagto.Close;
        ibCondicoesPagto.SQL.Clear;
        ibCondicoesPagto.SQL.Add('SELECT * FROM CONDICOESPAGAMENTO');
        ibCondicoesPagto.Open;

        cboCondpagto.Clear;//LIMPA A SELECAO DO COMBO
      while not ibCondicoesPagto.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS
        IDCondPagto := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
        IDCondPagto.ID := ibCondicoesPagto.FieldByName('IDCONDPAGTO').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
        cboCondpagto.Items.AddObject(ibCondicoesPagto.FieldByName('DESCRICAO').AsString,IDCondPagto);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
        ibCondicoesPagto.Next;
      end;  }

  end;

end;

procedure TfrmEstoque.ExecSELECTConsProd;

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

procedure TfrmEstoque.ExecSELECTConsEstoque;

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

procedure TfrmEstoque.ExecSELECTEstnf;
begin
  with dmModule do begin

    ibEntradamercadoria.Close;
    ibEntradamercadoria.SQL.Clear;
    ibEntradamercadoria.SQL.Add('SELECT * FROM ENTRADAESTOQUE');
    ibEntradamercadoria.Open;

  end;{with}
end;


procedure TfrmEstoque.ExibeDados;
var
i : Integer;
begin
  with dmModule do begin

  EstoqueNf := ibEntradamercadoria.FieldByName('IDENTRNFEST').AsInteger;//ATRIBUI NA VARIAVEL O VALOR DO CAMPO.

    for i:=0 to cboEstoque.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboEstoque.Items.Objects[i]).ID = ibEntradamercadoria.FieldByName('IDLOCAL').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboEstoque.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboEstoque.ClearSelection;//LIMPA A SELECAO.
      end;{if}
    end;{for}

///////////////////////////////////////////////////////////////////////////////////////////

  {  for i:=0 to cboCondpagto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboCondpagto.Items.Objects[i]).ID = ibEntradamercadoria.FieldByName('IDCONDPAGTO').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboCondpagto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboCondpagto.ClearSelection;//LIMPA A SELECAO.   }
  //    end;{if}
  //  end;{for}
////////////////////////////////////////////////////////////////////////////////


    for i:=0 to cboFornecedor.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboFornecedor.Items.Objects[i]).ID = ibEntradamercadoria.FieldByName('IDFORN').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboFornecedor.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboFornecedor.ClearSelection;//LIMPA A SELECAO.
      end;{if}
    end;{for}

////////////////////////////////////////////////////////////////////////////////

    for i:=0 to cboNatureza.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboNatureza.Items.Objects[i]).ID = ibEntradamercadoria.FieldByName('IDNATUREZA').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboNatureza.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboNatureza.ClearSelection;//LIMPA A SELECAO.
      end;{if}
    end;{for}



////////////////////////////////////////////////////////////////////////////////

    if ibEntradamercadoria.RecordCount > 0 Then begin
     lbl_edtPedidocompra.Text     := ibEntradamercadoria.FieldByName('PEDIDOCOMPRA').AsString;
    // cboNatureza.Text             := ibEntradamercadoria.FieldByName('NATUREZA').AsString;
     lbl_edtNumnf.Text            := ibEntradamercadoria.FieldByName('NUMERONF').AsString;
     lbl_edtSerie.Text            := ibEntradamercadoria.FieldByName('SERIE').AsString;
     lbl_edtTnf.Text              := ibEntradamercadoria.FieldByName('TIPONF').AsString;
     dtpEmissao.Date              := ibEntradamercadoria.FieldByName('DATAEMISSAO').AsDateTime;
     dtpEntrega.Date              := ibEntradamercadoria.FieldByName('DATAENTREGA').AsDateTime;
     lbl_edtQtdeitens.Text        := ibEntradamercadoria.FieldByName('QTDEITENS').AsString;
     lbl_edtDesc.Text             := ibEntradamercadoria.FieldByName('DESCONTO').AsString;
     lbl_edtEncfinan.Text         := ibEntradamercadoria.FieldByName('ENCARGOS').AsString;
     lbl_edtTotalnf.Text          := ibEntradamercadoria.FieldByName('TOTALNF').AsString;
     lbl_edtEntrada.Text          := IntToStr(ibEntradamercadoria.FieldByName('IDENTRNFEST').AsInteger);
     end else begin

     lbl_edtPedidocompra.Clear;
  //   lbl_edtNatureza.Clear;
     lbl_edtNumnf.Clear;
     lbl_edtSerie.Clear;
     lbl_edtTnf.Clear;
     lbl_edtQtdeitens.Clear;
     lbl_edtDesc.Clear;
     lbl_edtEncfinan.Clear;
     lbl_edtTotalnf.Clear;
   //  cboCondpagto.Clear;

    end;
  end;
end;

procedure TfrmEstoque.FormShow(Sender: TObject);
begin

   pcEstoque.ActivePageIndex := 0;
//atribui data atual ao abrir o modulo.
  dtpEmissao.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpEntrega.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpVctoNota.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  ibeaNovo.Caption := '&Novo';//deixa o caption do botao como novo ao abrir o form.
  ibeaAlterar.Caption := '&Alterar';//mantem o caption ao abrir o form
  ibeaIncluiprod.Caption := '&Incluir';//mantem o caption ao abrir o form
  ibeaIncluiprod.Enabled := False;//desabilita o botao

  //habilita os botes ao abrir o form
  ibeaNovo.Enabled := True;
  ibeaAlterar.Enabled := True;
  ibeaExcluir.Enabled := True;
 // ibeaConsultar.Enabled := True;

  DesabilitaCamposNF(False);
  DesabilitaCamposProd(False);
  LimpaCampo;
  dbgEntradaestoque.Enabled := False;

  cboConsProd.Enabled := False;

  dbgConsEstoque.Enabled := False;

  with dmModule do begin
  
    ExecSELECTNatureza;
    ExecSELECTFornecedor;
    ExecSELECTEstnf;
    ExecSELECT;
    ExecSELECTEntrProd;
    ExecSELECTConsProd;
    ExecSELECTConsEstoque;
    ibEntrProdEstoque.Close;
    
    with dbgEntradaestoque do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin
        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o C�digo da entrada no estoque
        Columns.Items[0].Title.Caption := 'C�digo de Barras';
        Columns.Items[0].FieldName     := 'CODBARRAS';
        Columns.Items[0].Width         := 170;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Descri��o do Produto';
        Columns.Items[1].FieldName     := 'Produto';
        Columns.Items[1].Width         := 280;
        Columns.Items[1].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[2].Title.Caption := 'Qtde.';
        Columns.Items[2].FieldName     := 'QUANTIDADE';
        Columns.Items[2].Width         := 100;
        Columns.Items[2].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[3].Title.Caption := 'Estoque M�nimo';
        Columns.Items[3].FieldName     := 'ESTOQUEMIN';
        Columns.Items[3].Width         := 150;
        Columns.Items[3].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Total';
        Columns.Items[4].FieldName     := 'VLRTOTAL';
        Columns.Items[4].Width         := 100;
        Columns.Items[4].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with}
////////////////////////////////////////////////////////////////////////////////

   with dbgConsEstoque do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColConsEstoque Then begin

      DataSource := dmModule.dtsTempProd;
      
        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o C�digo da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'NOME';
        Columns.Items[0].Width         := 200;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Local de Estoque';
        Columns.Items[1].FieldName     := 'Estoque';
        Columns.Items[1].Width         := 130;
        Columns.Items[1].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[2].Title.Caption := 'Qtde.';
        Columns.Items[2].FieldName     := 'QUANTIDADE';
        Columns.Items[2].Width         := 100;
        Columns.Items[2].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[3].Title.Caption := 'Estoque M�nimo';
        Columns.Items[3].FieldName     := 'ESTOQUEMIN';
        Columns.Items[3].Width         := 150;
        Columns.Items[3].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Total';
        Columns.Items[4].FieldName     := 'VLRTOTAL';
        Columns.Items[4].Width         := 100;
        Columns.Items[4].Alignment     := taLeftJustify;

        MontaColConsEstoque := False;

      end;{if}

    end;{with}
////////////////////////////////////////////////////////////////////////////////
  end;{with}

end;

procedure TfrmEstoque.ibeaSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEstoque.ibeaNovoClick(Sender: TObject);
var
  Erro : Boolean;
  A : TStrArray;
  CountIDUsuarios : longint;
  Dia,Mes,Ano : Word;
  DataInicial,DataFinal,DataPagto: TDate;
  TotalData,str,DataEmissao,CondPagto : String;
  i,SomaDia: integer;
  ValorParcelado : String;
  VlrTotalParc : String;

begin

    Erro := False;

    ibeaExcluir.Enabled := False;
   // ibeaConsultar.Enabled := False;

  with dmModule do begin

      //rotina para cancelar ou nao a operacao

    if ibeaAlterar.Caption = '&Atualizar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar esta opera��o?'
              + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        ibeaNovo.Enabled := True;
        ibeaNovo.Caption := '&Novo';
        ibeaExcluir.Enabled := True;
        DesabilitaCamposNF(False);
        DesabilitaCamposProd(False);
        lbl_edtEntrada.Clear;
        LimpaCampo;

      end;{if}

    end else begin

////////////////////////////////////////////////////////////////////////////////

      if ibeaNovo.Caption = '&Gravar'Then begin

        //traz a identificacao do funcionario do item do objeto selecionado.
        If cboEstoque.ItemIndex = -1 Then begin

           Erro := True;

           Application.MessageBox('Informe o Estoque','Notifica��o: Estoque n�o especificado',MB_OK+MB_ICONERROR);
           StringEstoque    := ' ''0'',';

        end else begin

          IDEstoque         := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );
          StringEstoque     := ' ''' + InttoStr( IDEstoque.ID ) + ''',';

        end;


          If cboFornecedor.ItemIndex = -1 Then begin

             //Erro := True;

          //   Application.MessageBox('Gravar sem o Fornecedor?','Notifica��o: Fornecedor n�o especificado',MB_YESNO + MB_ICONQUESTION);
             StringFornecedor    := ' ''0'',';

          end else begin

            IDFornecedor      := TClasseCombo( cboFornecedor.Items.Objects[cboFornecedor.ItemIndex] );
            StringFornecedor  := ' ''' + InttoStr( IDFornecedor.ID ) + ''',';

          end;{IF STRING FORNECEDOR}


          If cboNatureza.ItemIndex = -1 Then begin

             //Erro := True;

          //   Application.MessageBox('Informe o Fornecedor','Notifica��o: Fornecedor n�o especificado',MB_YESNO + MB_ICONERROR);
             StringNatureza    := ' ''0'',';

          end else begin

            IDNatureza      := TClasseCombo( cboNatureza.Items.Objects[cboNatureza.ItemIndex] );
            StringNatureza  := ' ''' + InttoStr( IDNatureza.ID ) + ''',';

          end;


          if lbl_edtQtdeitens.Text = '' Then begin //atribui vlr 0 a variavel icms
            QtdeItens := '0';
          end else begin
            QtdeItens := lbl_edtQtdeitens.Text;
          end;

          //traz a identificacao do funcionario do item do objeto selecionado.
      {  If cboCondpagto.ItemIndex = -1 Then begin

          //Erro := True;
        //  Application.MessageBox('Informe a Condi��o de Pagamento','Notifica��o: Produto n�o especificado', MB_OK + MB_ICONQUESTION);
          StringCondpagto     := ' ''0'',';

        end else begin

          IDCondPagto         := TClasseCombo( cboCondpagto.Items.Objects[cboCondpagto.ItemIndex] );
          StringCondpagto     := ' ''' + InttoStr( IDCondPagto.ID ) + ''','; }


         if Not Erro Then begin
           //grava os dados na tbl entrada de estoque.
            ibEntradamercadoria.Close;
            ibEntradamercadoria.SQL.Clear;
            ibEntradamercadoria.SQL.Add('INSERT INTO ENTRADAESTOQUE '
            + '(PEDIDOCOMPRA,NUMERONF,SERIE,QTDEITENS,DESCONTO,IDLOCAL,IDFORN,DATAEMISSAO,DATAENTREGA,TIPONF,IDNATUREZA,VCTONOTA,ENCARGOS,TOTALNF) values '
            + '(''' + lbl_edtPedidocompra.Text + ''','                        // IDCONDPAGTO,
            + ' ''' + lbl_edtNumnf.Text + ''',''' + lbl_edtSerie.Text + ''','
            + ' ''' + QtdeItens + ''',''' + lbl_edtDesc.Text + ''','
            + StringEstoque
            + StringFornecedor
         //   + StringCondpagto
            + ' ''' + FormatDateTime('mm-dd-yyyy', dtpEmissao.Date) + ''','
            + ' ''' + FormatDateTime('mm-dd-yyyy', dtpEntrega.Date) + ''','
            + ' ''' + lbl_edtTnf.Text + ''','
            + StringNatureza
            + ' ''' + FormatDateTime('mm-dd-yyyy', dtpVctoNota.Date) + ''','
            + ' ''' + lbl_edtEncfinan.Text + ''',''' + lbl_edtTotalnf.Text + ''')');
            ibEntradamercadoria.ExecSQL;

            Commit(ibEntradamercadoria);


          //atribui na variavel substituindo o ponto para vlr em branco
          VlrTotalNF := StringReplace(lbl_edtTotalnf.Text,ThousandSeparator,'',[rfReplaceAll]);
          //atribui a variavel o valor separando por ponto
          VlrTotalNF := StringReplace(VlrTotalNF,DecimalSeparator,'.',[rfReplaceAll]);
          if VlrTotalNF = '' Then
            VlrTotalNF := '0';

          if lbl_edtEntrada.Text <> '' Then begin

            IDCod := StrToInt(lbl_edtEntrada.Text);

          end;

////////////////////////////////////////////////////////////////////////////////
        //  if cboCondpagto.ItemIndex <> - 1 Then begin


          {  str := cboCondpagto.Text;//atribui o conteudo na variavel
            CountIDUsuarios := Explode(A, '/', str); //a tribuia funcao na variavel pegando os dados separados pela /

            VlrTotalParc   := StringReplace(VlrTotalNF,'.',',',[rfReplaceAll]);
            ValorParcelado := FloatToStr(StrtoFloat(VlrTotalParc) / CountIDUsuarios);
            ValorParcelado := StringReplace(ValorParcelado,DecimalSeparator,'.',[rfReplaceAll]);

            for i := 0 to CountIDUsuarios -1 do begin //busca pelo primeiro registro antes da barra

             decodedaTe(dtpEmissao.Date,ano,mes,dia);//decodifica a data do combo
             DataInicial := StrToInt(A[i]);//atribui na variavel os valores sem a barra da condicao de pagto
             DataEmissao := FormatDateTime('DD/MM/YYYY',dtpEmissao.Date);//atribui na variavel a data formatada
             DataPagto   := (DataInicial) + StrToDate(DataEmissao);//atribui na variavel a soma da data com a condicao de pagto.

              if Mes=12 Then //se mes for igual a 12
                begin
                  Mes:=+1;//no mes atribui 1
                  Ano:=Ano+1;//no ano atribui 1
                end
              else

                Mes:=Mes+1;//senao soma mais um no mes
                DataFinal:=encodeDate(Ano,Mes,Dia);//atribui na varival a data codificada
                DataInicial:=DataFinal;//atribui na varivel a data ja codificada  }
      //    end;{if cond pagto}
             // end;{if}

              //traz a identificacao do produto do item do objeto selecionado.
            {   If cboProduto.ItemIndex = -1 Then begin

                 Application.MessageBox('Informe o Produto','Notifica��o: Produto n�o especificado',MB_OK+MB_ICONERROR);

               end else begin

                 IDProduto         := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
                 StringProd        := ' ''' + InttoStr( IDProduto.ID ) + ''',';  }
              // end;{if produto}

              { if cboFornecedor.ItemIndex <> - 1 Then begin

               IDTipoServico := 1;

               end; }

              { ibCPagar.Close;
               ibCPagar.SQL.Clear;
               ibCPagar.SQL.Add('INSERT INTO TBLCONTASAPAGAR '
               + '(IDCOD,EMISSAOCONTA,TIPOSERVICO,IDFORNECEDOR,CONDPAGTO,IDPROD,CODBARRAS,DTVENCTO,DTPAGTO,EMISSAO,VCTO,NUMERONF,DESCONTO,ENCARGOS,TOTALNF) values '
               + '(''' + IntToStr(IDCod) + ''','
               + ' ''' + FormatDateTime('mm/dd/yyyy', dtpEmissao.Date) + ''','
               + ' ''' + IntToStr(IDTipoServico) + ''','
               + StringFornecedor
               + StringCondpagto
               + StringProd
               + ' ''' + lbl_edtCodbarra.Text + ''','
               + ' ''' + FormatDateTime('mm/dd/yyyy',DataPagto) + ''','
               + ' ''' + FormatDateTime('mm/dd/yyyy',now) + ''','
               + ' ''' + FormatDateTime('mm/dd/yyyy',now) + ''','
               + ' ''' + FormatDateTime('mm/dd/yyyy',now) + ''','
               + ' ''' + lbl_edtNumnf.Text + ''','
               + ' ''' + lbl_edtDesc.Text + ''',''' + lbl_edtEncfinan.Text + ''','
               + ' ''' + ValorParcelado + ''')');
               ibCPagar.Open;
               Commit(ibCPagar); }
            //   end;{if condicao do produto}

           //   end;{if}

         //   end;{for}

         // end;{if cond pagto}

////////////////////////////////////////////////////////////////////////////////


         end;

          ibeaNovo.Caption := '&Novo';
          ibeaAlterar.Enabled := True;
          ibeaExcluir.Enabled := True;
        //  ibeaConsultar.Enabled := True;
          ibeaIncluiprod.Enabled := False;
          DesabilitaCamposNF(False);
          DesabilitaCamposProd(False);

      //   end;{IF STRING FORNECEDOR}

      //  end;{if cond pagto}

         end else begin

          ibeaNovo.Caption := '&Gravar';
          DesabilitaCamposNF(True);
          ibeaIncluiprod.Enabled := True;
          dbgEntradaestoque.Enabled := True;

          LimpaCampo;

          //SELECT PARA TRAZER O CODIGO EM ORDEM CRESCENTE.
          ibEntradamercadoria.Close;
          ibEntradamercadoria.SQL.Clear;
          ibEntradamercadoria.SQL.Add('SELECT * FROM ENTRADAESTOQUE ORDER BY IDENTRNFEST DESC');
          ibEntradamercadoria.Open;

          lbl_edtEntrada.Text := IntToStr(ibEntradamercadoria.FieldByName('IDENTRNFEST').AsInteger + 1);

        end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmEstoque.ibeaAlterarClick(Sender: TObject);
begin

  ibeaExcluir.Enabled := False;
 // ibeaConsultar.Enabled := False;

  with dmModule do begin

    if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar esta opera��o?'
                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        lbl_edtEntrada.Text := '';
        ibeaNovo.Caption := '&Novo';
        DesabilitaCamposNF(False);
        DesabilitaCamposProd(False);

      end;{if}

      end else begin

    ////////////////////////////////////////////////////////////////////////////////

     if ibEntradamercadoria.RecordCount < 1 Then begin

      ConfirmaMSG := Application.MessageBox('N�o existe registro para ser alterado!!'
                        + #13 + 'Clique em Ok para Retornar a opera��o normal.','Notifica��o: Cancelar Opera��o', MB_OK + MB_ICONWARNING);

          ibeaNovo.Caption := '&Novo';
          DesabilitaCamposNF(False);
          lbl_edtEntrada.Text := '';

      end else begin

      if cboEstoque.Text = '' Then begin
         ConfirmaMSG := Application.MessageBox('� necess�rio selecionar um registro para ser alterado!!'
                    + #13 + 'Clique em Ok para Retornar a opera��o normal.','Notifica��o: Cancelar Opera��o', MB_OK + MB_ICONWARNING);
        ibeaAlterar.Caption := '&Alterar';

      end else begin


      ////////////////////////////////////////////////////////////////////////////////

        if ibeaAlterar.Caption = '&Atualizar' Then begin

          ConfirmaMSG := Application.MessageBox('Alterar esse Registro?','Notifica��o: Exclus�o de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
          if ConfirmaMSG = 6 Then begin

            AlteraEstoque;

            Commit(ibEntradamercadoria);

            ExecSELECTEstnf

          end;{if}

            ibeaAlterar.Caption := '&Alterar';
            ibeaNovo.Enabled := True;
            ibeaExcluir.Enabled := True;
        //    ibeaConsultar.Enabled := True;
            DesabilitaCamposNF(False);

        end else begin

            ibeaAlterar.Caption := '&Atualizar';
            DesabilitaCamposNF(True);

        end;{if}

      end; {if}

    end; {if}
    end;
  end;{with}
end;

procedure TfrmEstoque.ibeaExcluirClick(Sender: TObject);

var

ibTempProdEst : TIBQuery;

begin
  with dmModule do begin
    ConfirmaMSG := Application.MessageBox('Voc� deseja Excluir esse Registro?','Notifica��o: Exclus�o de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
    if ConfirmaMSG = 6 Then begin

      ibEntrProdEstoque.Close;
      ibEntrProdEstoque.SQL.Clear;
      ibEntrProdEstoque.SQL.Add('DELETE FROM TBLENTRADAESTOQUEPROD WHERE IDPROD=''' + InttoStr(IDProdutodoEstoque) + '''');
      ibEntrProdEstoque.Open;

     // ibTempProdEst := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL
     //   with ibTempProdEst do begin

          //BUSCA TODOS OS PRODUTOS QUE ESTEJAM NA CLASSIFICA��O DE PRODUTOS
       //   ibTempProdEst.Database := IBDGeral; //ATRIBUI O DATABASE DO IBGERAL PRA LOCALIZAR O BANCO DE DADOS
      {  ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT CADPRODUTOS.NOME, CADPRODUTOS.IDPROD,'
      + 'CADPRODUTOS.IDLOCAL,CADPRODUTOS.VALORVENDAA,TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.VLRTOTAL,'
      + 'LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
      + 'INNER JOIN TBLENTRADAESTOQUEPROD ON CADPRODUTOS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
      + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
        + ' WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + IntTostr(IDProdutodoEstoque) + '''');
        ibEntrProdEstoque.Open; }

       { ibTempProdEst.Close;
        ibTempProdEst.SQL.Clear;
        ibTempProdEst.SQL.Add('SELECT * FROM TBLENTRADAESTOQUEPROD WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + InttoStr(IDProdutodoEstoque) + '''');
        ibTempProdEst.Open; }

      //  (ibTempProdEst.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00'; //CRIA UMA MASCARA PARA O CAMPO
      //  (ibTempProdEst.FieldByName('QUANTIDADE') as TFloatField).DisplayFormat := ',0.00';
     // end;
    end;
  end;
end;

procedure TfrmEstoque.ibeaPrimeiroClick(Sender: TObject);
begin
  with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar esta opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCamposNF(False);
      end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////

     end else begin

         if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

        if ConfirmaMSG = 6 Then begin

          //RESTAURAR OS CAMPOS
          ibeaNovo.Caption := '&Novo';
          ibeaAlterar.Enabled := True;
     //     ibeaConsultar.Enabled := True;
          ibeaExcluir.Enabled := True;
          DesabilitaCamposNF(False);

        end;


         end else begin

          if ibEntradamercadoria.Active Then begin

            ibEntradamercadoria.First;

          end;

            ExibeDados;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmEstoque.ibeaAnteriorClick(Sender: TObject);
begin

  with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCamposNF(False);
      end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////

     end else begin

         if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

        if ConfirmaMSG = 6 Then begin

          //RESTAURAR OS CAMPOS
          ibeaNovo.Caption := '&Novo';
          ibeaAlterar.Enabled := True;
        //  ibeaConsultar.Enabled := True;
          ibeaExcluir.Enabled := True;
          DesabilitaCamposNF(False);

        end;


         end else begin

          if ibEntradamercadoria.Active Then begin

            ibEntradamercadoria.Prior;

          end;

            ExibeDados;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmEstoque.ibeaProximoClick(Sender: TObject);
begin

  with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCamposNF(False);
      end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////

     end else begin

         if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

        if ConfirmaMSG = 6 Then begin

          //RESTAURAR OS CAMPOS
          ibeaNovo.Caption := '&Novo';
          ibeaAlterar.Enabled := True;
       //   ibeaConsultar.Enabled := True;
          ibeaExcluir.Enabled := True;
          DesabilitaCamposNF(False);

        end;


         end else begin

          if ibEntradamercadoria.Active Then begin

            ibEntradamercadoria.Next;

          end;

            ExibeDados;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmEstoque.ibeaUltimoClick(Sender: TObject);
begin

  with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCamposNF(False);
      end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////

     end else begin

         if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

        if ConfirmaMSG = 6 Then begin

          //RESTAURAR OS CAMPOS
          ibeaNovo.Caption := '&Novo';
          ibeaAlterar.Enabled := True;
    //      ibeaConsultar.Enabled := True;
          ibeaExcluir.Enabled := True;
          DesabilitaCamposNF(False);

        end;


         end else begin

          if ibEntradamercadoria.Active Then begin

            ibEntradamercadoria.Last;

          end;

            ExibeDados;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmEstoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key); //Deixa todos os textos em maiusculo
  if Key = #13 Then begin //Desabilita o processamento posterior da tecla
    key := #0;
    Perform(WM_NEXTDLGCTL,0,0); //Simula o envio da tab
  end;
end;

procedure TfrmEstoque.FormCreate(Sender: TObject);
begin
  MontaColunas := True;
  MontaColConsEstoque := True;
end;

procedure TfrmEstoque.cboProdutoChange(Sender: TObject);

begin

  //INSTANCIA O DATAMODUlE PARA TRABALHAR COM AS TABELAS
  with dmModule do begin

    if cboProduto.ItemIndex <> -1 Then begin

      //DEFINE QUAL SER� O C�DIGO DO PRODUTO SELECIONADO
      ClassConsultaProd      := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );

       //FAZ A BUSCA PELO PRODUTO SELECIONADO NO COMBOBOX.
      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE IDProd=''' + InttoStr(ClassConsultaProd.ID) + '''');
      ibProdutos.Open;

      //EXIBE O VALOR DE VENDA DO PRODUTO SELECIONADO

      lbl_edtVlrunit.Text := FormatFloat(CasasDecimais,ibProdutos.FieldByName('VALORVENDAA').AsFloat);


     //EXIBE O CODIGO DE BARRAS DO PRODUTO SLECIONADO
      lbl_edtCodbarra.Text := ibProdutos.FieldByName('CODBARRAS').AsString;

      //ENVIA O FOCO PARA O LABEL QTDE.
      lbl_edtQuantidade.SetFocus;

    end;{IF}

  end;{WITH}
  
end;

procedure TfrmEstoque.ibeaIncluiprodClick(Sender: TObject);

var
ValorTotal : String;
QtdeMovEstoque : String;
QtdeProdEstoque : String;
AlteraQtde : String;
AlteraEstoqueMin : String;
EstoqueMin : String;
AlteraTotal : String;
ibTempProduto : TIBQuery;
IDEntrada : Integer;
TotalNf : Real;
VlrEstoqueProd : Real;
VlrQtdeProd : Real;
VlrEstoqueM : Real;
VlrTotalEstoque : Real;
VlrEntradaProd : Real;
EstoqueMinimo : Real;
TotalEstoque : Real;
QtdeProd : Real;
c : Real;
ValorNf : String;
TotalCusto : String;

begin

  with dmModule do begin

    if cboProduto.ItemIndex = - 1 Then begin

      Application.MessageBox('Informe o Produto','Notifica��o: Produto n�o especificado',MB_OK+MB_ICONERROR);

    end else begin

      ClassProd   := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
      StringProd  := ' ''' + InttoStr( ClassProd.ID ) + ''',';

       //select para trazer os produtos se o cliente for alterar
        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT IDENTRADAPROD,IDPROD,ESTOQUEMIN,VLRTOTAL,QUANTIDADE FROM TBLENTRADAESTOQUEPROD WHERE IDPROD=''' + IntToStr(ClassProd.ID) + '''');
      //  +'and IDENTRADAPROD=''' + lbl_edtEntrada.Text + '''');
        ibEntrProdEstoque.Open;

        QtdeProd := StrToFloat(StringReplace(lbl_edtQtdeProd.Text,ThousandSeparator,'',[rfReplaceAll]));

        EstoqueMinimo  := StrToFloat(StringReplace(lbl_edtEstMin.Text,ThousandSeparator,'',[rfReplaceAll]));

        TotalEstoque    := StrToFloat(StringReplace(lbl_edtTotalEstoque.Text,ThousandSeparator,'',[rfReplaceAll]));

      //  IncluiProd := False;

        AlteraQtde := StringReplace(FloatToStr(QtdeProd),ThousandSeparator,'',[rfReplaceAll]);
        AlteraQtde := StringReplace(AlteraQtde,DecimalSeparator,'.',[rfReplaceAll]);
        if AlteraQtde = '' Then
        AlteraQtde := '0';

        AlteraEstoqueMin := StringReplace(FloatToStr(EstoqueMinimo),ThousandSeparator,'',[rfReplaceAll]);
        AlteraEstoqueMin := StringReplace(AlteraEstoqueMin,DecimalSeparator,'.',[rfReplaceAll]);
        if AlteraEstoqueMin = '' Then
        AlteraEstoqueMin := '0';

        AlteraTotal := StringReplace(FloatToStr(TotalEstoque),ThousandSeparator,'',[rfReplaceAll]);
        AlteraTotal := StringReplace(AlteraTotal,DecimalSeparator,'.',[rfReplaceAll]);
        if AlteraTotal = '' Then
        AlteraTotal := '0';

        if ValorCustoEstoque > 0 Then begin

        ValorCustoEstoque := ValorCustoEstoque + TotalCustoProduto;

        end else begin

        ValorCustoEstoque :=  TotalCustoProduto;

        end;


        TotalCusto      := Stringreplace(FloatToStr(ValorCustoEstoque),ThousandSeparator,'',[rfReplaceAll]);
        TotalCusto      := Stringreplace(TotalCusto,DecimalSeparator,'.',[rfReplaceAll]);
        if TotalCusto = '' Then
        TotalCusto := '0';



      //faz alteracao se houver registro
      if ibEntrProdEstoque.RecordCount > 0 Then begin

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET'
        +' ESTOQUEMIN=''' + AlteraEstoqueMin + ''''
        +',VLRTOTAL=''' + AlteraTotal + ''''
        +',TOTALCUSTO = ''' + TotalCusto + ''''
        +',QUANTIDADE=''' + AlteraQtde + ''' WHERE IDPROD=''' + IntTostr(ClassProd.ID) + ''''); //IDENTRADAPROD=''' +  lbl_edtEntrada.Text  + ''''
        ibEntrProdEstoque.ExecSQL;
        Commit(ibEntrProdEstoque);

      end else begin

      //  IncluiProd := True;

        ValorTotal := StringReplace(lbl_edtTotalEstoque.Text,ThousandSeparator,'',[rfReplaceAll]);
        ValorTotal := StringReplace(ValorTotal,DecimalSeparator,'.',[rfReplaceAll]);
        if ValorTotal = '' Then
        ValorTotal := '0';

        QtdeProdEstoque := StringReplace(lbl_edtQtdeProd.Text,ThousandSeparator,'',[rfReplaceAll]);
        QtdeProdEstoque := StringReplace(QtdeProdEstoque,DecimalSeparator,'.',[rfReplaceAll]);
        if QtdeProdEstoque = '' Then
        QtdeProdEstoque := '0';

        EstoqueMin := StringReplace(lbl_edtEstoquemin.Text,ThousandSeparator,'',[rfReplaceAll]);
        EstoqueMin := StringReplace(EstoqueMin,DecimalSeparator,'.',[rfReplaceAll]);
        if EstoqueMin = '' Then
        EstoqueMin := '0';


         If cboEstoque.ItemIndex = -1 Then begin

           StringEstoque    := ' ''0'',';

        end else begin

          IDEstoque         := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );
          StringEstoque     := ' ''' + InttoStr( IDEstoque.ID ) + ''',';

        end;



        //grava os dados na tbl entrada de estoque de produtos.
        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('INSERT INTO TBLENTRADAESTOQUEPROD '
        + '(IDENTRADAPROD,QUANTIDADE,ESTOQUEMIN,IDPROD,VLRTOTAL,IDLOCAL,'
        + 'TOTALCUSTO,CODBARRAS) values '
        + '(''' + lbl_edtEntrada.Text + ''',''' + QtdeProdEstoque + ''','
        + ' ''' + EstoqueMin + ''','
        + StringProd
        + ' ''' + ValorTotal + ''','
        + StringEstoque
        + ' ''' + TotalCusto + ''','
        + ' ''' + lbl_edtCodbarra.Text + ''')');
        ibEntrProdEstoque.ExecSQL;

        Commit(ibEntrProdEstoque);

      //  IncluiProd := True;

      end;{if record count}

     end;{if combo produto}

      ///////////////////////////////////////////////////////////////////////////////////

      //traz a identificacao do produto do item do objeto selecionado.
      If cboProduto.ItemIndex = -1 Then begin

        Application.MessageBox('Informe o Produto','Notifica��o: Produto n�o especificado',MB_OK+MB_ICONERROR);

      end else begin

        IDProduto         := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
        StringProd        := ' ''' + InttoStr( IDProduto.ID ) + ''',';

        QtdeMovEstoque := StringReplace(lbl_edtQtdeProd.Text,ThousandSeparator,'',[rfReplaceAll]);
        QtdeMovEstoque := StringReplace(QtdeMovEstoque,DecimalSeparator,'.',[rfReplaceAll]);
        if QtdeMovEstoque = '' Then
        QtdeMovEstoque := '0';

        ibMovEst.Close;
        ibMovEst.SQL.Clear;
        ibMovEst.SQL.Add('INSERT INTO TBLMOVESTOQUE '
        + '(IDPROD,ENTRADA,DATA,HORA) values ('
        + StringProd
        + ' ''' + QtdeMovEstoque + ''','
        + ' ''' + FormatDateTime('mm-dd-yyyy', dtpEmissao.Date) + ''','
        + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
        ibMovEst.ExecSQL;

        Commit(ibMovEst);

      //  IncluiProd := true;

      end;{if}

    //  if IncluiProd Then begin

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.IDPROD,'
        + ' TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.QUANTIDADE,'
        + ' TBLENTRADAESTOQUEPROD.IDENTRADAPROD,'
        + ' TBLENTRADAESTOQUEPROD.ESTOQUEMIN,CADPRODUTOS.NOME As Produto,'
        + ' CADPRODUTOS.CODBARRAS FROM TBLENTRADAESTOQUEPROD '
        + ' LEFT OUTER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD'
        + ' WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + IntTostr(ClassProd.ID) + '''');
        ibEntrProdEstoque.Open;

    //  end; {if}

        (ibEntrProdEstoque.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00'; //CRIA UMA MASCARA PARA O CAMPO
        (ibEntrProdEstoque.FieldByName('QUANTIDADE') as TFloatField).DisplayFormat := ',0.00';
////////////////////////////////////////////////////////////////////////////////

        //rotina para calcular total de produtos na entrada do estoque

      {   ibTempProduto := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL

        with ibTempProduto do begin

          ibTempProduto.Database := IBDGeral; //ATRIBUI O DATABASE DO IBGERAL PRA LOCALIZAR O BANCO DE DADOS

          //atribui o id entradaprod na variavel string
         // IDProduto         := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
         // StringSomaProd    := ' IDENTRADAPROD=''' + InttoStr( IDProduto.ID ) + '''';

      //    if lbl_edtEntrada.Text <> '' Then begin

      //    IDEntrada := StrToInt(lbl_edtEntrada.Text);

      //    end;

          ibTempProduto.SQL.Clear;
          ibTempProduto.SQL.Add('SELECT SUM(TBLENTRADAESTOQUEPROD.VLRTOTAL) As VlrTotalGeral FROM TBLENTRADAESTOQUEPROD WHERE IDENTRADAPROD=''' + lbl_edtEntrada.Text + '''');
          ibTempProduto.Open;

          lbl_edtTotalNF.Text := FormatFloat('0.00',ibTempProduto.FieldByName('VlrTotalGeral').AsFloat);

        end;}{with temporario}

        //rotina pra dar o total da nota
        while not ibEntrProdEstoque.Eof do begin//enquanto nao for fim de registro

          if TotalNf = 0 Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            TotalNf := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorNf := StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
            //atribui a variavel o valor separando por ponto
            TotalNf := TotalNf + StrtoFloat(StringReplace(ValorNf,ThousandSeparator,'',[rfReplaceAll]));

          end;{if}

          ibEntrProdEstoque.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}

////////////////////////////////////////////////////////////////////////////////
  end;{with}

          lbl_edtTotalNF.Text := FormatFloat('0.00',TotalNf);
end;

procedure TfrmEstoque.cboEstoqueClick(Sender: TObject);
begin

  DesabilitaCamposProd(True);
  ibeaIncluiprod.Enabled := True;
  lbl_edtPedidocompra.SetFocus;

  with dmModule do begin

    if cboEstoque.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      IDEstoque         := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringEstoque     := ' IDLOCAL=''' + InttoStr( IDEstoque.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.

      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE ' + StringEstoque + 'ORDER BY NOME');
      ibProdutos.Open;


      cboProduto.Clear;// LIMPA O COMBO
      while not ibProdutos.Eof do begin
        IDProduto := TClasseCombo.Create;
        IDProduto.ID := ibProdutos.FieldByName('IDPROD').AsInteger;
        cboProduto.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDProduto);
        ibProdutos.Next;

      end;{while}

    end;{if}
    
  end;{with}

end;

procedure TfrmEstoque.lbl_edtQuantidadeExit(Sender: TObject);

var
Valor1 : Real;
Valor2 : Real;
Valor3 : Real;
Valor4 : Real;
TotalEst : Real;
begin


  if (lbl_edtQuantidade.Text <> '') Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQuantidade.Text)>0) and (lbl_edtQuantidade.Text <> '') Then begin
      
      Valor1 := StrToFloat(StringReplace(lbl_edtQuantidade.Text,ThousandSeparator,'',[rfReplaceAll]));

      Valor2 := StrToFloat(StringReplace(lbl_edtVlrunit.Text,ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtVlrtotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

      TotalCustoProduto := Valor1 * ValorCustoProduto;

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQuantidade.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrunit.Text,ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtVlrtotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));


      TotalCustoProduto := Valor1 * ValorCustoProduto;

      if (lbl_edtQuantidade.Text <> '') and (lbl_edtQtdeProd.Text <> '') Then begin// se for diferente de branco executa rotina abaixo.

       Valor1 := StrToFloat(StringReplace(lbl_edtQuantidade.Text,ThousandSeparator,'',[rfReplaceAll]));
       Valor2 := StrToFloat(StringReplace(lbl_edtVlrunit.Text,ThousandSeparator,'',[rfReplaceAll]));
       Valor3 := StrToFloat(StringReplace(lbl_edtQtdeProd.Text,ThousandSeparator,'',[rfReplaceAll]));

       Valor4 := (Valor1 + Valor3);

       lbl_edtQtdeProd.Text := FormatFloat(',0.00',(Valor4));

       lbl_edtTotalEstoque.Text := FormatFloat(',0.00',(Valor4 * Valor2));

      end;

    end;{if}

  end;{if}

     // lbl_edtTotalNF.Text := lbl_edtVlrtotal.Text;

 if   (lbl_edtQuantidade.Text <> '') and (lbl_edtQtdeProd.Text = '') and (lbl_edtVlrtotal.Text <> '') and (lbl_edtTotalEstoque.Text = '') Then begin

   TotalEst := StrToFloat(StringReplace(lbl_edtVlrtotal.Text,ThousandSeparator,'',[rfReplaceAll]));
   lbl_edtQtdeProd.Text     := FormatFloat(',0',Valor1);
   lbl_edtTotalEstoque.Text := FormatFloat(',0.00',TotalEst);

 end;

end;

procedure TfrmEstoque.lbl_edtVlrtotalExit(Sender: TObject);
   var
    Valor1 : Real;
    Valor2 : Real;
    Qtde : Real;
    Total : Real;
    ibTempProd : TIBQuery;
begin

  with dmModule do begin


   if (lbl_edtVlrTotal.Text <> '')  Then begin //se for em branco executa rotina abaixo.

      if (Pos(',',lbl_edtVlrTotal.Text)>0) and (lbl_edtVlrTotal.Text <> '') Then begin

        Valor1 := StrToFloat(StringReplace(lbl_edtVlrTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
        Valor2 := StrToFloat(StringReplace(lbl_edtVlrunit.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtQuantidade.Text := FormatFloat(',0.00',(Valor1 / Valor2));

      end else begin

         Valor1 := StrToFloat(StringReplace(lbl_edtVlrTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
         Valor2 := StrToFloat(StringReplace(lbl_edtVlrunit.Text,ThousandSeparator,'',[rfReplaceAll]));
         lbl_edtQuantidade.Text := FormatFloat(',0.00',(Valor1 / Valor2));

      end;{if}

    end;{if}


     ibTempProd := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL
    with ibTempProd do begin

      //BUSCA TODOS OS PRODUTOS QUE ESTEJAM NA CLASSIFICA��O DE PRODUTOS
      ibTempProd.Database := IBDGeral; //ATRIBUI O DATABASE DO IBGERAL PRA LOCALIZAR O BANCO DE DADOS


       if cboProduto.ItemIndex <> - 1 Then begin

        ClassProdEstoque    := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
        StringProdEstoque   := ' ''' + InttoStr( ClassProdEstoque.ID ) + ''',';

        ibTempProd.SQL.Clear;
        ibTempProd.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
        + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,CADPRODUTOS.VALORVENDAA FROM TBLENTRADAESTOQUEPROD '
        + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + IntToStr(ClassProdEstoque.ID) + '''');
        ibTempProd.Open;

     if ibTempProd.RecordCount > 0 Then begin

        // traz na variavel o estoque minimo
        EstoqueMinimo      := StrToFloat(Stringreplace(FloatToStr(ibTempProd.FieldByName('ESTOQUEMIN').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

       if (lbl_edtEstMin.Text <> '') Then begin

        lbl_edtEstoquemin.Text := FormatFloat(',0',EstoqueMinimo);

       end;

        //traz o total e calcula
        Total        := StrtoFloat(StringReplace(FloattoStr(ibTempProd.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
        ValorEstoque := (Total + Valor1);
        lbl_edtTotalEstoque.Text := FormatFloat(',0.00',ValorEstoque);

        //Traz a qtde e calcula
        Quantidade  := StrtoFloat(StringReplace(FloattoStr(ibTempProd.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
        QtdeLancada := StrToFloat(StringReplace(lbl_edtQuantidade.Text,ThousandSeparator,'',[rfReplaceAll]));
        TotalQtde   := (Quantidade + QtdeLancada);
        lbl_edtQtdeProd.Text  := FormatFloat(',0',TotalQtde);

       end; {if}

     end;{if record count}

    end;{with temporario}

    if (lbl_edtVlrtotal.Text <> '') and (lbl_edtTotalEstoque.Text = '') and (lbl_edtQuantidade.Text <> '') and (lbl_edtQtdeProd.Text = '') Then begin

     Total := StrToFloat(StringReplace(lbl_edtVlrTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
     lbl_edtTotalEstoque.Text := FormatFloat(',0.00',Total);

     Qtde := StrToFloat(StringReplace(lbl_edtQuantidade.Text,ThousandSeparator,'',[rfReplaceAll]));
     lbl_edtQtdeProd.Text     := FormatFloat(',0',Qtde);

    end;

  end;{with}

end;

procedure TfrmEstoque.cboNaturezaClick(Sender: TObject);

begin

with dmModule do begin

    if cboNatureza.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      IDNaturezaCod     := TClasseCombo( cboNatureza.Items.Objects[cboNatureza.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringNatureza    := ' IDNATUREZA=''' + InttoStr( IDNaturezaCod.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.

      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      ibNatureza.Close;
      ibNatureza.SQL.Clear;
      ibNatureza.SQL.Add('SELECT * FROM NATUREZA WHERE ' + StringNatureza);
      ibNatureza.Open;

      lbl_NaturezaCod.Caption := ibNatureza.FieldByName('NATUREZA_COD').AsString;

    end;{if}

  end;{with}

end;

procedure TfrmEstoque.cboCondpagtoChange(Sender: TObject);

//var

 { A : TStrArray;
  CountIDUsuarios : longint;
  Dia,Mes,Ano : Word;
  DataInicial,DataFinal,DataPagto: TDate;
  TotalData,str,DataEmissao,CondPagto : String;
  i,SomaDia: integer; }

begin

{  if cboCondpagto.ItemIndex <> - 1 Then begin

    str := cboCondpagto.Text;//atribui o conteudo na variavel
    CountIDUsuarios := Explode(A, '/', str); //a tribuia funcao na variavel pegando os dados separados pela /

    for i := 0 to CountIDUsuarios -1 do begin //busca pelo primeiro registro antes da barra

     decodedaTe(dtpEmissao.Date,ano,mes,dia);//decodifica a data do combo
     DataInicial := StrToInt(A[i]);//atribui na variavel os valores sem a barra da condicao de pagto
     DataEmissao := FormatDateTime('DD/MM/YYYY',dtpEmissao.Date);//atribui na variavel a data formatada
     DataPagto   := (DataInicial) + StrToDate(DataEmissao);//atribui na variavel a soma da data com a condicao de pagto.

      if Mes=12 Then //se mes for igual a 12
        begin
          Mes:=+1;//no mes atribui 1
          Ano:=Ano+1;//no ano atribui 1
        end
      else
        Mes:=Mes+1;//senao soma mais um no mes
        DataFinal:=encodeDate(Ano,Mes,Dia);//atribui na varival a data codificada
        DataInicial:=DataFinal;//atribui na varivel a data ja codificada
        Showmessage(Datetostr(DataPagto)); }

    //  end;{if}

   // end;{for}

 end;{if}

procedure TfrmEstoque.cboProdutoClick(Sender: TObject);

var

ibTempProd : TIBQuery;

begin

  with dmModule do begin


      ibTempProd := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL

    with ibTempProd do begin

      ibTempProd.Database := IBDGeral; //ATRIBUI O DATABASE DO IBGERAL PRA LOCALIZAR O BANCO DE DADOS

      if cboProduto.ItemIndex <> - 1 Then begin

        IDProduto         := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );

        //select para trazer os produtos se o cliente for alterar
        ibTempProd.SQL.Clear;
        ibTempProd.SQL.Add('SELECT * FROM TBLENTRADAESTOQUEPROD WHERE IDPROD=''' + IntToStr(IDProduto.ID) + '''');
        ibTempProd.Open;

        if ibTempProd.FieldByName('TOTALCUSTO').AsFloat <> 0  Then begin

        ValorCustoEstoque := StrToFloat(StringReplace(FloatToStr(ibTempProd.FieldByName('TOTALCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

       end;

       if ibTempProd.RecordCount > 0 Then begin

        lbl_edtQtdeProd.Text     := FormatFloat('0,00',ibTempProd.FieldByName('QUANTIDADE').AsFloat);
        lbl_edtEstMin.Text       := ibTempProd.FieldByName('ESTOQUEMIN').AsString;
        lbl_edtTotalEstoque.Text := FormatFloat(CasasDecimais,ibTempProd.FieldByName('VLRTOTAL').AsFloat);

       end;

     end;

         ibProdutos.Close;
         ibProdutos.SQL.Clear;
         ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE IDPROD=''' + IntToStr(IDProduto.ID) + '''');
         ibProdutos.Open;

         ValorCustoProduto := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

    end{with temporario}

  end;{with}

end;

procedure TfrmEstoque.lbl_edtEstoqueminExit(Sender: TObject);

var

VlrEstMinimo : Real;
VlrEstoque   : Real;
ValorEstoqueM : Real;
TotalEstMinimo : Real;

begin

   if (lbl_edtEstoquemin.Text <> '') and (lbl_edtEstMin.Text = '') Then begin

   ValorEstoqueM := StrToFloat(StringReplace(lbl_edtEstoquemin.Text,ThousandSeparator,'',[rfReplaceAll]));

   lbl_edtEstMin.Text := FormatFloat(',0',ValorEstoqueM);

   end else 

   if (lbl_edtEstoquemin.Text <> '') and (lbl_edtEstMin.Text <> '') Then begin

    VlrEstMinimo     := StrToFloat(StringReplace(lbl_edtEstoquemin.Text,ThousandSeparator,'',[rfReplaceAll]));
    VlrEstoque       := StrToFloat(StringReplace(lbl_edtEstMin.Text,ThousandSeparator,'',[rfReplaceAll]));
    TotalEstMinimo   := (VlrEstMinimo + VlrEstoque);

    lbl_edtEstMin.Text := FormatFloat(',0',TotalEstMinimo);

   end;

end;

procedure TfrmEstoque.cboConsEstoqueClick(Sender: TObject);


begin
    dbgConsEstoque.Enabled := True;
  with dmModule do begin

    if cboConsEstoque.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      IDEstoqueCons         := TClasseCombo( cboConsEstoque.Items.Objects[cboConsEstoque.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringEstoqueCons     := ' IDLOCAL=''' + InttoStr( IDEstoqueCons.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.

      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      Commit(ibTempProd);
      ibTempProd.Close;
      ibTempProd.SQL.Clear;
      ibTempProd.SQL.Add('SELECT CADPRODUTOS.NOME, CADPRODUTOS.IDPROD,'
      + 'CADPRODUTOS.IDLOCAL,CADPRODUTOS.VALORVENDAA,TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.VLRTOTAL,'
      + 'LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
      + 'INNER JOIN TBLENTRADAESTOQUEPROD ON CADPRODUTOS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
      + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
      + 'WHERE CADPRODUTOS.IDLOCAL=''' + IntToStr(IDEstoqueCons.ID) + '''');
      //      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE ' + StringEstoqueCons);
      ibTempProd.Open;

     (ibTempProd.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';

      cboConsProd.Clear;// LIMPA O COMBO
      while not ibTempProd.Eof do begin
        IDProdutoCons := TClasseCombo.Create;
        IDProdutoCons.ID := ibTempProd.FieldByName('IDPROD').AsInteger;
        cboConsProd.Items.AddObject(ibTempProd.FieldByName('NOME').AsString,IDProdutoCons);
        ibTempProd.Next;

      end;{while}

      cboConsProd.Enabled := True;

    end;{if}



  end;{with}

end;

procedure TfrmEstoque.lbl_edtCodbarraChange(Sender: TObject);

var

i : Integer;

begin

  with dmModule do begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CODBARRAS=''' + lbl_edtCodBarra.Text + '''');
    ibProdutos.Open;


  //  lbl_edtCodProd.Text := ibProdutos.FieldByName('IDPROD').AsString;
    lbl_edtVlrunit.Text := FormatFloat(CasasDecimais,ibProdutos.FieldByName('VALORVENDAA').AsFloat);

    for i:=0 to cboProduto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboProduto.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboProduto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboProduto.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}

   // lbl_edtQuantidade.SetFocus;

  end;{with}

end;

procedure TfrmEstoque.cboConsProdChange(Sender: TObject);
begin

  with dmModule do begin

    if cboConsProd.ItemIndex <> - 1 Then begin

      IDProdutoCons  := TClasseCombo( cboConsProd.Items.Objects[cboConsProd.ItemIndex] );


      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      ibTempProd.Close;
      ibTempProd.SQL.Clear;
      ibTempProd.SQL.Add('SELECT CADPRODUTOS.NOME, CADPRODUTOS.IDPROD,'
      + 'CADPRODUTOS.IDLOCAL,CADPRODUTOS.VALORVENDAA,TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.VLRTOTAL,'
      + 'LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
      + 'INNER JOIN TBLENTRADAESTOQUEPROD ON CADPRODUTOS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
      + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
      + 'WHERE CADPRODUTOS.IDPROD=''' + IntToStr(IDProdutoCons.ID) + '''');
      //      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE ' + StringEstoqueCons);
      ibTempProd.Open;

      (ibTempProd.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';

   end;{if}

  end;{with}

end;

procedure TfrmEstoque.dbgConsEstoqueCellClick(Column: TColumn);

var

i : Integer;


begin

  with dmModule do begin

    IDProdutodoEstoque := ibTempProd.FieldByName('IDPROD').AsInteger;

    lbl_edtQtdeEs.Text      := FormatFloat(',0.00',ibTempProd.FieldByName('QUANTIDADE').AsFloat);
    lbl_edtQtdeESMin.Text   := FormatFloat(',0.00',ibTempProd.FieldByName('ESTOQUEMIN').AsFloat);
    lbl_edtVlrUnitEs.Text   := FormatFloat(',0.00',ibTempProd.FieldByName('VALORVENDAA').AsFloat);

    for i:=0 to cboConsProd.Items.Count -1 do begin
      if TClasseCombo( cboConsProd.Items.Objects[i]).ID = ibTempProd.FieldByName('IDPROD').AsInteger then begin
        cboConsProd.ItemIndex:= i;
        Break;
      end else begin
        cboConsProd.ClearSelection;
      end;
    end;

  end;{with}

end;

end.
