unit untMatPrima;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, mxFlatControls, Grids, DBGrids, IBEAntialiasButton,
  StdCtrls, CheckLst, ComCtrls, Barcode, classComboBox, IBQuery, DB, IniFiles;

type
  TfrmMateriaPrima = class(TForm)
    pcProdutosMP: TPageControl;
    tbsProdutoMP: TTabSheet;
    Shape1: TShape;
    Image9: TImage;
    Shape8: TShape;
    Image1: TImage;
    lblDadosprod: TLabel;
    lblDesc: TLabel;
    Label27: TLabel;
    imgCodigoBarras: TImage;
    Label15: TLabel;
    lbl_EntrEstoque: TLabel;
    Label14: TLabel;
    lbl_edtCodigo: TLabeledEdit;
    lbl_edtCodBarra: TLabeledEdit;
    lbl_edtCusto: TLabeledEdit;
    lbl_edtVendab: TLabeledEdit;
    lbl_edtVendaa: TLabeledEdit;
    lbl_edtVendac: TLabeledEdit;
    lbl_edtLucro: TLabeledEdit;
    lbl_edtComiss: TLabeledEdit;
    lbl_edtCodEcf: TLabeledEdit;
    lbl_edtVlrestoq: TLabeledEdit;
    lbl_edtEstoqgeral: TLabeledEdit;
    lbl_edtEstMin: TLabeledEdit;
    ListLocalEstocagem: TCheckListBox;
    btnGerarCodigo: TIBEAntialiasButton;
    btnImprimirCodigo: TIBEAntialiasButton;
    lbl_edtNomeProduto: TLabeledEdit;
    lbl_edtFabricante: TLabeledEdit;
    lbl_edtQtdeEstoque: TLabeledEdit;
    lbl_edtEstoqueM: TLabeledEdit;
    lbl_edtVlrEstoque: TLabeledEdit;
    tbsEstoqueMP: TTabSheet;
    Image16: TImage;
    Image14: TImage;
    lblLocaisestoq: TLabel;
    lblMovEstoq: TLabel;
    Label23: TLabel;
    Label30: TLabel;
    lblTotalRealizadaHoje: TLabel;
    lblTotalMovimentacao: TLabel;
    Label32: TLabel;
    Bevel1: TBevel;
    Label31: TLabel;
    lblEstadoEstoque: TLabel;
    Image19: TImage;
    Label24: TLabel;
    dbgLocalestocagemMP: TDBGrid;
    dbgMovEstMP: TDBGrid;
    mxFlatPanel1: TmxFlatPanel;
    lblEstoqueCodBarrasProd: TLabel;
    lblTracoEstoque: TLabel;
    lblEstoqueNomeProd: TLabel;
    ibeaNovo: TIBEAntialiasButton;
    ibeaAlterar: TIBEAntialiasButton;
    ibeaPrimeiro: TIBEAntialiasButton;
    ibeaAnterior: TIBEAntialiasButton;
    ibeaProximo: TIBEAntialiasButton;
    ibeaUltimo: TIBEAntialiasButton;
    ibeaExcluir: TIBEAntialiasButton;
    ibeaConsultar: TIBEAntialiasButton;
    ibeaSair: TIBEAntialiasButton;
    dbgProdutosMP: TDBGrid;
    Shape4: TShape;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image3: TImage;
    Shape2: TShape;
    GeraCodigoBarraMP: TBarcode;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExibeDados;
    procedure AlteraProduto;
    procedure LimpaCampo;
    procedure DesabilitaCampos(opcao:Boolean);
    procedure ExecSELECT;
    procedure ExecSELECTEstoque;
    procedure FormShow(Sender: TObject);
    procedure ibeaNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure lbl_edtCodBarraChange(Sender: TObject);
    procedure lbl_edtCustoExit(Sender: TObject);
    procedure lbl_edtVendaaExit(Sender: TObject);
    procedure lbl_edtVendabExit(Sender: TObject);
    procedure lbl_edtVendacExit(Sender: TObject);
    procedure lbl_edtLucroExit(Sender: TObject);
    procedure pcProdutosMPChange(Sender: TObject);
    procedure dbgProdutosMPCellClick(Column: TColumn);
    procedure ibeaPrimeiroClick(Sender: TObject);
    procedure ibeaAnteriorClick(Sender: TObject);
    procedure ibeaProximoClick(Sender: TObject);
    procedure ibeaUltimoClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMateriaPrima: TfrmMateriaPrima;

  IDProdEstoque : Integer;
  ConfirmaMSG : Integer;
  ClassNomeEst : TClasseCombo;//variavel para select do local de estoque
  i,LocalSelecionado : Integer;//variaveis para gravar local de estoque

  //variaveis para gravar o id do estoque
  ClassLocal : TClasseCombo;
  StringLocalEstoque : String;

  //variaveis para gravar os valores
  ValorCusto,ValorVendaa,Valorvendab,Valorvendac : String;

  MontaColunasMP : Boolean;

  //VARIAVEIS PARA AS CASAS DECIMAIS
  ConfigSiS : TIniFile;
  FormatoMoeda : String;
  Casas : Longint;

  IDProd : Integer;

  //para mostrar o estoque
  MontaColunasMovEst,MontaColunasLocalEst : Boolean;

  Erro : Boolean;

implementation

uses untdmModule, funcPosto;

{$R *.dfm}

procedure TfrmMateriaPrima.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmMateriaPrima.ExibeDados;

var
  i : Integer;

//  OleGraphic: TOleGraphic;
//  fs: TFileStream;
begin

  with dmModule do begin

    (ibMatPrima.FieldByName('IDPRODMP') as TIntegerField).DisplayFormat := '0000000000';
    IDProd := ibMatPrima.FieldByName('IDPRODMP').AsInteger;
    lbl_edtCodigo.Text     := FormatFloat('0000000000',ibMatPrima.FieldByName('IDPRODMP').AsInteger);

    //LIMPA O CAMPO
    for i:=0 to ListLocalEstocagem.Items.Count -1 do begin
        ListLocalEstocagem.Checked[i]:= False;
    end;
      //TRAZ O ESTOQUE DO PRODUTO
    for i:=0 to ListLocalEstocagem.Items.Count -1 do begin
      if TClasseCombo( ListLocalEstocagem.Items.Objects[i]).ID = ibMatPrima.FieldByName('IDLOCAL').AsInteger then begin
        ListLocalEstocagem.Checked[i]:= True;
        Break;
      end else begin
        ListLocalEstocagem.ClearSelection;
      end;
    end;

    lbl_edtNomeProduto.Text         := ibMatPrima.FieldByName('NOME').AsString;
    lbl_edtCusto.Text               := FormatFloat(CasasDecimais('Produtos'),ibMatPrima.FieldByName('VLRCUSTO').AsFloat);
    lbl_edtCodBarra.Text            := ibMatPrima.FieldByName('CODBARRASMP').AsString;
    lbl_edtCodigo.Text              := IntToStr(ibMatPrima.FieldByName('IDPRODMP').AsInteger);
    lbl_edtVendaa.Text              := FormatFloat(CasasDecimais('Produtos'),ibMatPrima.FieldByName('VLRVENDA').AsFloat);
    lbl_edtVendab.Text              := FormatFloat(CasasDecimais('Produtos'),ibMatPrima.FieldByName('VLRVENDAB').AsFloat);
    lbl_edtVendac.Text              := FormatFloat(CasasDecimais('Produtos'),ibMatPrima.FieldByName('VLRVENDAC').AsFloat);
    lbl_edtLucro.Text               := ibMatPrima.FieldByName('LUCRO').AsString;
    lbl_edtComiss.Text              := ibMatPrima.FieldByName('COMISSAO').AsString;
    lbl_edtCodEcf.Text              := ibMatPrima.FieldByName('ECF').AsString;
    lbl_edtFabricante.Text          := ibMatPrima.FieldByName('FABRFORN').AsString;
   // lbl_edtEstoqgeral.Text          := IntToStr( ibProdutos.FieldByName('ESTGERAL').AsInteger );
    //lbl_edtEstMin.Text              := IntToStr( ibProdutos.FieldByName('ESTMIN').AsInteger );
    //lbl_edtVlrestoq.Text            := ibProdutos.FieldByName('TOTALEST').AsString;
    //lbl_edtEstoqgeral.Text          :=  FormatFloat('###00,0',ibProdutos.FieldByName('QtdeEstoque').AsFloat);
    //lbl_edtEstMin.Text              :=  FormatFloat('0',ibProdutos.FieldByName('ESTOQUEMIN').AsFloat);

    ///////////////////////////////////////////////////////////////////////////////////////

    //ROTINA DE EXIBIÇÃO DA IMAGEM DO PRODUTO
  {  if lbl_edtCodBarra.Text <> '' Then begin
      imgAmpliar.Enabled        := True;
      lblAmpliarImagem.Enabled  := True;
      //HABILITA O BOTAO PROCURAR IMAGEM
      imgProcurarImagem.Enabled := True;
      lblProcurarImagem.Enabled := True;
    end else begin //CASO NÃO TENHA UM CÓDIGO DE BARRAS DO PRODUTO
      imgAmpliar.Enabled        := False;
      lblAmpliarImagem.Enabled  := False;
      //DESABILITE O BOTAO PROCURAR IMAGEM
      imgProcurarImagem.Enabled := False;
      lblProcurarImagem.Enabled := False;
    end;

    //ROTINA PARA EXIBIR A IMAGEM DO PRODUTO    
    if Not FileExists(ExtractFilePath(Application.ExeName) + 'Data\RunTime\ProdImagens\' + lbl_edtCodBarra.Text + '.jpg') Then begin

      imgProduto.Picture := Nil; //LIMPA A IMAGEM
      ImagemProduto := '';

    end else begin

      try
        OleGraphic := TOleGraphic.Create;
        fs         := TFileStream.Create(ExtractFilePath(Application.ExeName) //EXIBE A IMAGEM DO PRODUTO
                                        + 'Data\RunTime\ProdImagens\' + lbl_edtCodBarra.Text + '.jpg', fmOpenRead or fmSharedenyNone);
        OleGraphic.LoadFromStream(fs);
        imgProduto.Picture.Assign(OleGraphic);

        //imgProduto.Picture.LoadFromFile();

        ImagemProduto := ExtractFilePath(Application.ExeName) //EXIBE A IMAGEM DO PRODUTO
                                        + 'Data\RunTime\ProdImagens\' + lbl_edtCodBarra.Text + '.jpg';

      finally
        fs.Free;
        OleGraphic.Free
      end;


    end;  }
/////////////////////////////////////////////////////////////////////////////////////////////
    //MOSTRA OUTRAS OPÇÔES NO CADASTRO
    lblEstoqueCodBarrasProd.Caption    := ibMatPrima.FieldByName('CODBARRASMP').AsString;
    lblTracoEstoque.Caption            := ' - ';
    lblEstoqueNomeProd.Caption         := ibMatPrima.FieldByName('NOME').AsString;


    ibEntrProdEstoque.Close;
    ibEntrProdEstoque.SQL.Clear;
    ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.*, TBLMATERIAPRIMA.NOME, LOCALESTOCAGEM.NOME As LocalEstoque'
    + ' FROM TBLENTRADAESTOQUEPROD LEFT OUTER JOIN TBLMATERIAPRIMA '
    + ' ON TBLENTRADAESTOQUEPROD.IDPRODMP = TBLMATERIAPRIMA.IDPRODMP LEFT OUTER JOIN LOCALESTOCAGEM '
    + ' ON TBLMATERIAPRIMA.IDLOCAL = LOCALESTOCAGEM.IDESTOQUE '
    + ' WHERE TBLENTRADAESTOQUEPROD.IDPRODMP=''' + IntToStr(IDProd) + '''');
    ibEntrProdEstoque.Open;

    FormatFloat(CasasDecimais('Produtos'),ibEntrProdEstoque.FieldByName('QUANTIDADE').AsInteger);

    lbl_edtEstoqgeral.Text  := FormatFloat(CasasDecimais('Produtos'),ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat);
    lbl_edtVlrestoq.Text    := FormatFloat(CasasDecimais('Combustiveis'),ibEntrProdEstoque.FieldByName('VLRTOTAL').AsFloat);
    lbl_edtEstMin.Text      := ibEntrProdEstoque.FieldByName('ESTOQUEMIN').AsString;


    //VERIFICA SE O ESTADO ESTIVER EM BAIXA MUDA O TEXTO E A COR DO LABEL
    if ibEntrProdEstoque.RecordCount > 0 then begin

      if (ibEntrProdEstoque.FieldByName('QUANTIDADE').AsInteger < ibEntrProdEstoque.FieldByName('ESTOQUEMIN').AsInteger) then begin

        lblEstadoEstoque.Caption          := 'EM BAIXA';
        lblEstadoEstoque.Font.Color       := clRed;

      end else begin

        lblEstadoEstoque.Caption          := 'NORMAL';
        lblEstadoEstoque.Font.Color       := clBlue;

      end;

    end else begin

      lblEstadoEstoque.Caption          := 'INDISPONÍVEL';
      lblEstadoEstoque.Font.Color       := clBlue;

    end;

    ibMovEst.Close;
    ibMovEst.SQL.Clear;
    ibMovEst.SQL.Add('SELECT TBLMOVESTOQUE.DATA,TBLMOVESTOQUE.HORA,TBLMOVESTOQUE.SAIDA,'
    + ' TBLMOVESTOQUE.ENTRADA FROM TBLMOVESTOQUE '
    + ' LEFT OUTER JOIN TBLENTRADAESTOQUEPROD ON TBLMOVESTOQUE.IDPRODMP=TBLENTRADAESTOQUEPROD.IDPRODMP '
    + ' WHERE TBLMOVESTOQUE.IDPRODMP=''' + IntToStr(IDProd) + ''' ORDER BY TBLMOVESTOQUE.DATA DESC');
    ibMovEst.Open;


    (ibMovEst.FieldByName('SAIDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

  end; {with}

end;

procedure TfrmMateriaPrima.AlteraProduto;

begin

  Erro := False;

  with dmModule do begin


    LocalSelecionado := -1; //atribui -1 para a variavel

    for i:=0 to ListLocalEstocagem.Items.Count -1 do begin//para variavel i iniciar do zero os itens comecam no -1
      if ListLocalEstocagem.Checked[i] = True Then begin //se o checked for verdadeiro
        LocalSelecionado := i; //atribui o vlr da variavel i checada na variavel local selecionado
      end;{if}
    end;{for}

    If (LocalSelecionado = -1) Then begin
      Application.MessageBox('Desculpe mas é necessário selecionar um Local de Estocagem.','Notificação: Dados Incompletos', MB_OK + MB_ICONWARNING);
    end else begin

      if (LocalSelecionado < 0) Then begin
          StringLocalEstoque      := ' IDLOCAL = '''','
      end else begin
        ClassLocal       := TClasseCombo( ListLocalEstocagem.Items.Objects[LocalSelecionado] );
        StringLocalEstoque      := ' IDLOCAL=''' + InttoStr( ClassLocal.ID ) + ''','
      end;

      ////////////////////////////////////////////////////////////////////////////////////////////////


      //atribui na variavel substituindo o ponto para vlr em branco
      ValorCusto := StringReplace(lbl_edtCusto.Text,ThousandSeparator,'',[rfReplaceAll]);
      //atribui a variavel o valor separando por ponto
      ValorCusto := StringReplace(ValorCusto,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorCusto = '' Then
        ValorCusto := '0';

      ValorVendaa := StringReplace(lbl_edtVendaa.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorVendaa := StringReplace(ValorVendaa,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorVendaa = '' Then
        ValorVendaa := '0';

      ValorVendab := StringReplace(lbl_edtVendab.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorVendab := StringReplace(ValorVendab,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorVendab = '' Then
        ValorVendab := '0';

      ValorVendac := StringReplace(lbl_edtVendac.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorVendac := StringReplace(ValorVendac,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorVendac = '' Then
        ValorVendac := '0';


      if Not Erro Then begin
        //GRAVA AS ALTERACOES NA TABELA DE MATERIA PRIMA.
        ibMatPrima.Close;
        ibMatPrima.SQL.Clear;
        ibMatPrima.SQL.Add('UPDATE TBLMATERIAPRIMA SET '
        + ' NOME = ''' + lbl_edtNomeProduto.Text + ''','
        + ' CODBARRASMP = ''' + lbl_edtCodBarra.Text + ''','
        + ' VLRCUSTO = ''' + ValorCusto + ''','
        + ' VLRVENDA = ''' + ValorVendaa + ''','
        + ' VLRVENDAB = ''' + ValorVendab + ''','
        + ' VLRVENDAC = ''' + ValorVendac + ''','
        + ' LUCRO = ''' + lbl_edtLucro.Text + ''','
        + ' COMISSAO = ''' + lbl_edtComiss.Text + ''','
        + ' ECF = ''' + lbl_edtCodEcf.Text + ''' WHERE IDPRODMP=''' + InttoStr(IDProd) + '''');
        ibMatPrima.ExecSQL;

        Commit(ibMatPrima);

       end; {if}

    end;{if}

  end;{with}

end;

procedure TfrmMateriaPrima.DesabilitaCampos(opcao:Boolean);
begin
  lbl_edtNomeProduto.Enabled := opcao;
  lbl_edtCodigo.Enabled := opcao;
  lbl_edtCusto.Enabled := opcao;
  lbl_edtCodBarra.Enabled := opcao;
  lbl_edtVendaa.Enabled := opcao;
  lbl_edtVendab.Enabled := opcao;
  lbl_edtVendac.Enabled := opcao;
  lbl_edtLucro.Enabled := opcao;
  lbl_edtCodEcf.Enabled := opcao;
  lbl_edtComiss.Enabled := opcao;
  lbl_edtEstoqgeral.Enabled := opcao;
  lbl_edtEstMin.Enabled := opcao;
  lbl_edtVlrestoq.Enabled := opcao;
  ListLocalEstocagem.Enabled := opcao;
  lbl_edtFabricante.Enabled := opcao;

end;

procedure TfrmMateriaPrima.LimpaCampo;//procedimento para limpar os campos ao abrir o formulario.
begin

  lbl_edtNomeProduto.Clear;
 // lbl_edtCodigo.Clear;
  lbl_edtCusto.Clear;
  lbl_edtCodBarra.Clear;
  lbl_edtVendaa.Clear;
  lbl_edtVendab.Clear;
  lbl_edtVendac.Clear;
  lbl_edtEstoqgeral.Clear;
  lbl_edtEstMin.Clear;
  lbl_edtVlrestoq.Clear;
  lbl_edtFabricante.Clear;
  lbl_edtQtdeEstoque.Clear;
  lbl_edtEstoqueM.Clear;
  lbl_edtVlrEstoque.Clear;

end;

procedure TfrmMateriaPrima.ExecSELECT;

begin

  with dmModule do begin

    ibMatPrima.Close;
    ibMatPrima.SQL.Clear;
    ibMatPrima.SQL.Add('SELECT TBLMATERIAPRIMA.NOME,TBLMATERIAPRIMA.FABRFORN,'
    + 'TBLMATERIAPRIMA.CODBARRASMP,TBLMATERIAPRIMA.VLRCUSTO,TBLMATERIAPRIMA.VLRVENDA,'
    + 'TBLMATERIAPRIMA.VLRVENDAB,TBLMATERIAPRIMA.VLRVENDAC,TBLMATERIAPRIMA.ECF,'
    + 'TBLMATERIAPRIMA.COMISSAO,TBLMATERIAPRIMA.IDLOCAL,TBLMATERIAPRIMA.IDPRODMP,'
    + 'TBLMATERIAPRIMA.LUCRO,LOCALESTOCAGEM.NOME As Estoque FROM TBLMATERIAPRIMA '
    + 'INNER JOIN LOCALESTOCAGEM ON TBLMATERIAPRIMA.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE ORDER BY TBLMATERIAPRIMA.NOME');
    ibMatPrima.Open;

    (ibMatPrima.FieldByName('VLRCUSTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibMatPrima.FieldByName('VLRVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


  end;{with}

end;

procedure TfrmMateriaPrima.ExecSELECTEstoque;
begin

  with dmModule do begin

    ibEstoque.Close;
    ibEstoque.SQL.Clear;
    ibEstoque.SQL.Add('SELECT * FROM LOCALESTOCAGEM');
    ibEstoque.Open;

    ListLocalEstocagem.Clear;
    while not ibEstoque.Eof do begin
      ClassNomeEst    := TClasseCombo.Create;
      ClassNomeEst.ID  := ibEstoque.FieldByName('IDESTOQUE').AsInteger;
      ListLocalEstocagem.Items.AddObject(ibEstoque.FieldByName('NOME').AsString,ClassNomeEst);
      ibEstoque.Next;
    end; {while}

  end; {with}

end;

procedure TfrmMateriaPrima.FormShow(Sender: TObject);
begin

  ibeaNovo.Caption := '&Novo';
  pcProdutosMP.ActivePageIndex := 0;
  DesabilitaCampos(False);
  LimpaCampo;

  with dmModule do begin

    ExecSELECT;
    ExecSELECTEstoque;

    with dbgProdutosMP do begin

       DataSource := dmModule.dtsMatPrima;
      //determina as colunas a serem montadas 0 codigo cliente, 1 razao Social, 2 endereço numero...
      Columns.Insert(0);
      Columns.Insert(1);
      Columns.Insert(2);
      Columns.Insert(3);
      Columns.Insert(4);
      Columns.Insert(5);

      //Parametros da Coluna que exibe o Código do Produto
      Columns.Items[0].Title.Caption := 'Código Interno';
      Columns.Items[0].FieldName     := 'IDPRODMP';
      Columns.Items[0].Width         := 85;

      //Parametros da Coluna que exibe o código de barras do produto
      Columns.Items[1].Title.Caption := 'Código de Barras';
      Columns.Items[1].FieldName     := 'CODBARRASMP';
      Columns.Items[1].Width         := 130;

      // Parametros que exibe o nome do produto
      Columns.Items[2].Title.Caption := 'Descrição do Produto';
      Columns.Items[2].FieldName     := 'NOME';
      Columns.Items[2].Width         := 240;

      // Parametros que exibe o valor de venda (a)
      Columns.Items[3].Title.Caption := 'Valor de Custo';
      Columns.Items[3].FieldName     := 'VLRCUSTO';
      Columns.Items[3].Width         := 110;
      Columns.Items[3].Alignment     := taCenter;

     // Parametros que exibe o valor de venda (b)
      Columns.Items[4].Title.Caption := 'Valor de Venda (A)';
      Columns.Items[4].FieldName     := 'VLRVENDA';
      Columns.Items[4].Width         := 110;
      Columns.Items[4].Alignment     := taCenter;

      // Parametros que exibe o valor de venda (c)
      Columns.Items[5].Title.Caption := 'Local de Estoque';
      Columns.Items[5].FieldName     := 'Estoque';
      Columns.Items[5].Width         := 110;


      MontaColunasMP := False;

    end;{with monta colunasmp}

  end;{with}

end;

procedure TfrmMateriaPrima.ibeaNovoClick(Sender: TObject);
var
 NovaImagem: String;
 ImagemSalva : String;
begin

 // Erro := False;

  with dmModule do begin

  {  ibMatPrima.Close;
    ibMatPrima.SQL.Clear;
    ibMatPrima.SQL.Add('SELECT * FROM TBLMATERIAPRIMA ORDER BY IDPRODMP DESC');
    ibMatPrima.Open;

    while not ibMatPrima.Eof do begin

      lbl_edtCodigo.Text := IntToStr(ibProdutos.FieldByName('IDPRODMP').AsInteger + 1);
      IDProdEstoque :=  StrToInt(lbl_edtCodigo.Text);
      ibProdutos.Last;   }

 //   end;{while}

    //rotina para cancelar ou nao a operacao
 {   if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar esta operação?'
                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        ibeaNovo.Enabled := True;
        ibeaNovo.Caption := '&Novo';
        ibeaExcluir.Enabled := True;
        DesabilitaCampos(False);
     //   lbl_edtQtdeEstoque.Enabled := False;
     //   lbl_edtEstoqueM.Enabled := False;
     //   lbl_edtVlrEstoque.Enabled := False;

        LimpaCampo; }

   //   end;{if}

      if ibeaNovo.Caption = '&Gravar' Then begin
         DesabilitaCampos(True);
        //////////////////////////////////////////////////////////////////////////////////////////////////
        //rotina para gravação do local e estoque

        LocalSelecionado := -1; //atribui -1 para a variavel

        for i:=0 to ListLocalEstocagem.Items.Count -1 do begin//para variavel i iniciar do zero os itens comecam no -1
          if ListLocalEstocagem.Checked[i] = True Then begin //se o checked for verdadeiro
            LocalSelecionado := i; //atribui o vlr da variavel i checada na variavel local selecionado
          end;{if}
        end;{for}

        If (LocalSelecionado = -1) Then begin

           Application.MessageBox('Desculpe mas é necessário selecionar um Local de Estocagem.','Notificação: Dados Incompletos', MB_OK + MB_ICONWARNING);

        end else begin

          if (LocalSelecionado < 0) Then begin
              StringLocalEstoque      := ' '''','
          end else begin
            ClassLocal              := TClasseCombo( ListLocalEstocagem.Items.Objects[LocalSelecionado] );
            StringLocalEstoque      := ' ''' + InttoStr( ClassLocal.ID ) + ''','
          end;

          ///////////////////////////////////////////////////////////////////////////////////

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorCusto := StringReplace(lbl_edtCusto.Text,ThousandSeparator,'',[rfReplaceAll]);
            //atribui a variavel o valor separando por ponto
            ValorCusto := StringReplace(ValorCusto,DecimalSeparator,'.',[rfReplaceAll]);
            if ValorCusto = '' Then
              ValorCusto := '0';


            ValorVendaa := StringReplace(lbl_edtVendaa.Text,ThousandSeparator,'',[rfReplaceAll]);
            ValorVendaa := StringReplace(ValorVendaa,DecimalSeparator,'.',[rfReplaceAll]);
            if ValorVendaa = '' Then
              ValorVendaa := '0';

            ValorVendab := StringReplace(lbl_edtVendab.Text,ThousandSeparator,'',[rfReplaceAll]);
            ValorVendab := StringReplace(ValorVendab,DecimalSeparator,'.',[rfReplaceAll]);
            if ValorVendab = '' Then
              ValorVendab := '0';

            ValorVendac := StringReplace(lbl_edtVendac.Text,ThousandSeparator,'',[rfReplaceAll]);
            ValorVendac := StringReplace(ValorVendac,DecimalSeparator,'.',[rfReplaceAll]);
            if ValorVendac = '' Then
              ValorVendac := '0';

         ///////////////////////////////////////////////////////////////////////
          ibMatPrima.Close;
          ibMatPrima.SQL.Clear;
          ibMatPrima.SQL.Add('INSERT INTO TBLMATERIAPRIMA '
          + '(NOME,CODBARRASMP,IDLOCAL,FABRFORN,VLRCUSTO,VLRVENDA,VLRVENDAB,'
          + 'VLRVENDAC,COMISSAO,ECF,LUCRO) values '
          + '(''' + lbl_edtNomeProduto.Text + ''','
          + ' ''' + lbl_edtCodBarra.Text + ''','
          + StringLocalEstoque
          + ' ''' + lbl_edtFabricante.Text + ''','
          + ' ''' + ValorCusto + ''',''' + ValorVendaa + ''','
          + ' ''' + Valorvendab + ''',''' + Valorvendac + ''','
          + ' ''' + lbl_edtComiss.Text + ''','
          + ' ''' + lbl_edtCodEcf.Text + ''', '
          + ' ''' + lbl_edtLucro.Text + ''')');
          ibMatPrima.ExecSQL;
          Commit(ibMatPrima);

        end;

          ExecSELECT;

       //   end;{if tambem do tipo de produto}

          ibeaNovo.Caption := '&Novo';
          ibeaAlterar.Enabled := True;
          ibeaExcluir.Enabled := True;
          ibeaConsultar.Enabled := True;
          DesabilitaCampos(False);
          ListLocalEstocagem.Enabled := False;
          lbl_edtQtdeEstoque.Enabled := False;
          lbl_edtEstoqueM.Enabled := False;
          lbl_edtVlrEstoque.Enabled := False;

    //    end;{if tipo prod}

      end else begin

        ibeaNovo.Caption := '&Gravar';
        DesabilitaCampos(True);
        lbl_edtQtdeEstoque.Enabled := True;
        lbl_edtEstoqueM.Enabled := True;
        lbl_edtVlrEstoque.Enabled := True;
        ListLocalEstocagem.Enabled := True;
        lbl_edtCodBarra.SetFocus;
        LimpaCampo;

      end;{if botão novo}

        ibMatPrima.Close;
        ibMatPrima.SQL.Clear;
        ibMatPrima.SQL.Add('SELECT TBLMATERIAPRIMA.NOME,TBLMATERIAPRIMA.FABRFORN,'
        + 'TBLMATERIAPRIMA.CODBARRASMP,TBLMATERIAPRIMA.VLRCUSTO,TBLMATERIAPRIMA.VLRVENDA,'
        + 'TBLMATERIAPRIMA.VLRVENDAB,TBLMATERIAPRIMA.VLRVENDAC,TBLMATERIAPRIMA.ECF,'
        + 'TBLMATERIAPRIMA.COMISSAO,TBLMATERIAPRIMA.IDLOCAL,TBLMATERIAPRIMA.IDPRODMP,'
        + 'LOCALESTOCAGEM.NOME As Estoque FROM TBLMATERIAPRIMA '
        + 'INNER JOIN LOCALESTOCAGEM ON TBLMATERIAPRIMA.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE ORDER BY TBLMATERIAPRIMA.NOME');
        ibMatPrima.Open;

        (ibMatPrima.FieldByName('VLRCUSTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        (ibMatPrima.FieldByName('VLRVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

        lbl_edtCodigo.Text := IntToStr(ibMatPrima.FieldByName('IDPRODMP').AsInteger + 1);

  end;{with}

end;

procedure TfrmMateriaPrima.FormCreate(Sender: TObject);
begin
MontaColunasMP       := True;
MontaColunasMovEst   := True;
MontaColunasLocalEst := True;
end;

procedure TfrmMateriaPrima.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmMateriaPrima.lbl_edtCodBarraChange(Sender: TObject);
begin
  GeraCodigoBarraMP.Text        := lbl_edtCodBarra.Text;
  GeraCodigoBarraMP.Top         := 0;
  GeraCodigoBarraMP.Left        := 7;
  imgCodigoBarras.Picture     := nil;
  GeraCodigoBarraMP.DrawBarcode(imgCodigoBarras.Canvas);
end;

procedure TfrmMateriaPrima.lbl_edtCustoExit(Sender: TObject);
var
ConfigSiS : TIniFile;
FormatoMoeda : String;
Casas : Longint;
begin

  if lbl_edtCusto.Text <> '' Then begin

    with ConfigSiS do begin

    ConfigSiS := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\RunTime\sis.ini'); //Cria o vinculo com o Arquivo ini
    Casas := ReadInteger('Formatacoes','FormatoMoedaCasas',2);//atribui as chaves do arquivo ini na variavel

      if Casas = 2 Then begin
        FormatoMoeda := ',0.00';
      end else begin
        FormatoMoeda := ',0.000';
      end;

    lbl_edtCusto.Text := FormatFloat(FormatoMoeda,StrToFloat(lbl_edtCusto.Text));

    end;{with}
    
  end;{if}

end;

procedure TfrmMateriaPrima.lbl_edtVendaaExit(Sender: TObject);
var
ConfigSiS : TIniFile;
FormatoMoeda : String;
Casas : Longint;
begin

  if lbl_edtVendaa.Text <> '' Then begin

    with ConfigSiS do begin

    ConfigSiS := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\RunTime\sis.ini'); //Cria o vinculo com o Arquivo ini
    Casas := ReadInteger('Formatacoes','FormatoMoedaCasas',2);//atribui as chaves do arquivo ini na variavel

      if Casas = 2 Then begin
        FormatoMoeda := ',0.00';
      end else begin
        FormatoMoeda := ',0.000';
      end;

    lbl_edtVendaa.Text := FormatFloat(FormatoMoeda,StrToFloat(lbl_edtVendaa.Text));

    end;{with}

  end;{if}


end;

procedure TfrmMateriaPrima.lbl_edtVendabExit(Sender: TObject);
var
ConfigSiS : TIniFile;
FormatoMoeda : String;
Casas : Longint;
begin

  if lbl_edtVendab.Text <> '' Then begin

    with ConfigSiS do begin

    ConfigSiS := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\RunTime\sis.ini'); //Cria o vinculo com o Arquivo ini
    Casas := ReadInteger('Formatacoes','FormatoMoedaCasas',2);//atribui as chaves do arquivo ini na variavel

      if Casas = 2 Then begin
        FormatoMoeda := ',0.00';
      end else begin
        FormatoMoeda := ',0.000';
      end;

    lbl_edtVendab.Text := FormatFloat(FormatoMoeda,StrToFloat(lbl_edtVendab.Text));

    end;{with}

  end;{if}


end;

procedure TfrmMateriaPrima.lbl_edtVendacExit(Sender: TObject);
var
ConfigSiS : TIniFile;
FormatoMoeda : String;
Casas : Longint;
begin

  if lbl_edtVendac.Text <> '' Then begin

    with ConfigSiS do begin

    ConfigSiS := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\RunTime\sis.ini'); //Cria o vinculo com o Arquivo ini
    Casas := ReadInteger('Formatacoes','FormatoMoedaCasas',2);//atribui as chaves do arquivo ini na variavel

      if Casas = 2 Then begin
        FormatoMoeda := ',0.00';
      end else begin
        FormatoMoeda := ',0.000';
      end;

    lbl_edtVendac.Text := FormatFloat(FormatoMoeda,StrToFloat(lbl_edtVendac.Text));

    end;{with}

  end;{if}


end;

procedure TfrmMateriaPrima.lbl_edtLucroExit(Sender: TObject);
   var
    Valor1 :Real;
    Valor2 :Real;
    Valor3 :Real;
    Valor4 :Real;
begin

  if lbl_edtLucro.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtLucro.Text)>0) and (lbl_edtLucro.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtLucro.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtCusto.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor3 := Valor2 * Valor1;

      Valor4 := Valor3 /100;

      lbl_edtVendaa.Text := FormatFloat(',0.00',(Valor4 + Valor2));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtLucro.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtCusto.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor3 := Valor2 * Valor1;

      Valor4 := Valor3 /100;

      lbl_edtVendaa.Text := FormatFloat(',0.00',(Valor4 + Valor2));

    end;{if}

  end;{if}


end;

procedure TfrmMateriaPrima.pcProdutosMPChange(Sender: TObject);
begin
//desabilita os botoes na mudanca pro botao estoque
ibeaNovo.Enabled := False;
ibeaAlterar.Enabled := False;
ibeaExcluir.Enabled := False;

  with dmModule do begin

    if pcProdutosMP.ActivePage.TabIndex = 0 then begin
      //habilita os botoes ao voltar pro botao de produto
      ibeaNovo.Enabled := True;
      ibeaNovo.Caption := '&Novo';
      ibeaAlterar.Enabled := True;
      ibeaExcluir.Enabled := True;

    end else if pcProdutosMP.ActivePage.TabIndex = 1 Then begin

      ibeaNovo.Enabled := False;
      DesabilitaCampos(False);

     if (ibEntrProdEstoque.Active) and (ibMovEst.Active) Then begin

        ExibeDados;

     end else begin

        ibEntrProdEstoque.Close;
        ibMovEst.Close;
      end;

    with dbgLocalestocagemMP do begin
         // monta colunas do local estoque
          if MontaColunasLocalEst Then begin

            Columns.Insert(0);
            Columns.Insert(1);
            Columns.Insert(2);
            Columns.Insert(3);
            Columns.Insert(4);

            //Parametro para exibir o campo obs do cliente.
            Columns.Items[0].Title.Caption := 'Local de Estoque';
            Columns.Items[0].FieldName     := 'LocalEstoque';
            Columns.Items[0].Width         := 150;
            Columns.Items[0].Alignment     := taLeftJustify;

            Columns.Items[1].Title.Caption := 'Código de Barras';
            Columns.Items[1].FieldName     := 'CODBARRAS';
            Columns.Items[1].Width         := 150;
            Columns.Items[1].Alignment     := taLeftJustify;

            //Parametros da Coluna que exibe o Nome do cliente.
            Columns.Items[2].Title.Caption := 'Descrição do Produto';
            Columns.Items[2].FieldName     := 'NOME';
            Columns.Items[2].Width         := 320;
            Columns.Items[2].Alignment     := taLeftJustify;

            // Parametros que exibe o nome fantasia do cliente
            Columns.Items[3].Title.Caption := 'Qtde em Estoque';
            Columns.Items[3].FieldName     := 'QUANTIDADE';
            Columns.Items[3].Width         := 100;
            Columns.Items[3].Alignment     := taLeftJustify;

            // Parametros que exibe o endereço do cliente
            Columns.Items[4].Title.Caption := 'Estoque Mínimo';
            Columns.Items[4].FieldName     := 'ESTOQUEMIN';
            Columns.Items[4].Width         := 100;
            Columns.Items[4].Alignment     := taLeftJustify;

            MontaColunasLocalEst := False;

         end;{if}

  with dbgMovEstMP do begin
         // monta colunas do local estoque
          if MontaColunasMovEst Then begin

            Columns.Insert(0);
            Columns.Insert(1);
            Columns.Insert(2);
            Columns.Insert(3);

        //Parametro para exibir o campo obs do cliente.
            Columns.Items[0].Title.Caption := 'Data';
            Columns.Items[0].FieldName     := 'DATA';
            Columns.Items[0].Width         := 150;
            Columns.Items[0].Alignment     := taLeftJustify;

            //Parametros da Coluna que exibe o Nome do cliente.
            Columns.Items[1].Title.Caption := 'Entrada';
            Columns.Items[1].FieldName     := 'ENTRADA';
            Columns.Items[1].Width         := 100;
            Columns.Items[1].Alignment     := taLeftJustify;

            // Parametros que exibe o nome fantasia do cliente
            Columns.Items[2].Title.Caption := 'Saída';
            Columns.Items[2].FieldName     := 'SAIDA';
            Columns.Items[2].Width         := 100;
            Columns.Items[2].Alignment     := taLeftJustify;

            // Parametros que exibe o endereço do cliente
            Columns.Items[3].Title.Caption := 'Horário';
            Columns.Items[3].FieldName     := 'HORA';
            Columns.Items[3].Width         := 100;
            Columns.Items[3].Alignment     := taLeftJustify;

            MontaColunasMovEst := False;

            end;

         end;


      end;{with}

    end;{if}

  end;{with}

end;

procedure TfrmMateriaPrima.dbgProdutosMPCellClick(Column: TColumn);
begin
ExibeDados;
end;

procedure TfrmMateriaPrima.ibeaPrimeiroClick(Sender: TObject);
begin
  with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                      + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);
        lbl_edtQtdeEstoque.Enabled := False;
        lbl_edtEstoqueM.Enabled := False;
        lbl_edtVlrEstoque.Enabled := False;
      end;{if}

    //////////////////////////////////////////////////////////////////////////////////////////

      end else begin

        if ibeaNovo.Caption = '&Gravar' Then begin

          ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                          + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

          if ConfirmaMSG = 6 Then begin

            //RESTAURAR OS CAMPOS
            ibeaNovo.Caption := '&Novo';
            DesabilitaCampos(False);
            lbl_edtQtdeEstoque.Enabled := False;
            lbl_edtEstoqueM.Enabled := False;
            lbl_edtVlrEstoque.Enabled := False;
            ibeaAlterar.Enabled := True;
            ibeaExcluir.Enabled := True;
            ibeaConsultar.Enabled := True;

          end;

            end else begin

            if ibMatPrima.Active Then begin

              ibMatPrima.First;

            end;

          ExibeDados;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmMateriaPrima.ibeaAnteriorClick(Sender: TObject);
begin
 with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar esta operação?'
                      + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);
        lbl_edtQtdeEstoque.Enabled := False;
        lbl_edtEstoqueM.Enabled := False;
        lbl_edtVlrEstoque.Enabled := False;
      end;{if}

//////////////////////////////////////////////////////////////////////////////////////////

      end else begin

        if ibeaNovo.Caption = '&Gravar' Then begin

          ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                          + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

          if ConfirmaMSG = 6 Then begin

            //RESTAURAR OS CAMPOS
            ibeaNovo.Caption := '&Novo';
            DesabilitaCampos(False);
            lbl_edtQtdeEstoque.Enabled := False;
            lbl_edtEstoqueM.Enabled := False;
            lbl_edtVlrEstoque.Enabled := False;
            ibeaAlterar.Enabled := True;
            ibeaExcluir.Enabled := True;
            ibeaConsultar.Enabled := True;

          end;

            end else begin

            if ibMatPrima.Active Then begin

              ibMatPrima.Prior;

            end;

          ExibeDados;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmMateriaPrima.ibeaProximoClick(Sender: TObject);
begin
 with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                      + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);
        lbl_edtQtdeEstoque.Enabled := False;
        lbl_edtEstoqueM.Enabled := False;
        lbl_edtVlrEstoque.Enabled := False;
      end;{if}

    //////////////////////////////////////////////////////////////////////////////////////////

      end else begin

        if ibeaNovo.Caption = '&Gravar' Then begin

          ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                          + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

          if ConfirmaMSG = 6 Then begin

            //RESTAURAR OS CAMPOS
            ibeaNovo.Caption := '&Novo';
            DesabilitaCampos(False);
            lbl_edtQtdeEstoque.Enabled := False;
            lbl_edtEstoqueM.Enabled := False;
            lbl_edtVlrEstoque.Enabled := False;
            ibeaAlterar.Enabled := True;
            ibeaExcluir.Enabled := True;
            ibeaConsultar.Enabled := True;

          end;

            end else begin

            if ibMatPrima.Active Then begin

              ibMatPrima.Next;

            end;

          ExibeDados;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmMateriaPrima.ibeaUltimoClick(Sender: TObject);
begin
 with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                      + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);
        lbl_edtQtdeEstoque.Enabled := False;
        lbl_edtEstoqueM.Enabled := False;
        lbl_edtVlrEstoque.Enabled := False;

      end;{if}

    //////////////////////////////////////////////////////////////////////////////////////////

      end else begin

        if ibeaNovo.Caption = '&Gravar' Then begin

          ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                          + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

          if ConfirmaMSG = 6 Then begin

            //RESTAURAR OS CAMPOS
            ibeaNovo.Caption := '&Novo';
            DesabilitaCampos(False);
            lbl_edtQtdeEstoque.Enabled := False;
            lbl_edtEstoqueM.Enabled := False;
            lbl_edtVlrEstoque.Enabled := False;
            ibeaAlterar.Enabled := True;
            ibeaExcluir.Enabled := True;
            ibeaConsultar.Enabled := True;

          end;

            end else begin

            if ibMatPrima.Active Then begin

              ibMatPrima.Last;

            end;

          ExibeDados;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmMateriaPrima.ibeaAlterarClick(Sender: TObject);
var
 NovaImagem: String;
 ImagemSalva : String;
begin

  lbl_edtQtdeEstoque.Enabled := False;
  lbl_edtEstoqueM.Enabled := False;
  lbl_edtVlrEstoque.Enabled := False;

  with dmModule do begin


    if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar esta operação?'
                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        ibeaNovo.Caption := '&Novo';
        DesabilitaCampos(False);
        lbl_edtQtdeEstoque.Enabled := False;
        lbl_edtEstoqueM.Enabled := False;
        lbl_edtVlrEstoque.Enabled := False;

      end;{if}

      end else begin

      //////////////////////////////////////////////////////////////////////////


    if ibMatPrima.RecordCount < 1 Then begin

      ConfirmaMSG := Application.MessageBox('Não existe registro para ser alterado!!'
              + #13 + 'Clique em Ok para Retornar a operação normal.','Notificação: Cancelar Operação', MB_OK + MB_ICONWARNING);

      ibeaNovo.Caption := '&Novo';
      DesabilitaCampos(False);
      lbl_edtQtdeEstoque.Enabled := False;
      lbl_edtEstoqueM.Enabled := False;
      lbl_edtVlrEstoque.Enabled := False;

    end else begin

      if lbl_edtNomeProduto.Text = '' Then begin
         ConfirmaMSG := Application.MessageBox('É necessário selecionar um registro abaixo para ser alterado!!'
                    + #13 + 'Clique em Ok para Retornar a operação normal.','Notificação: Cancelar Operação', MB_OK + MB_ICONWARNING);
        ibeaAlterar.Caption := '&Alterar';

      end else begin

////////////////////////////////////////////////////////////////////////////////  

          if pcProdutosMP.ActivePage.TabIndex = 0 Then begin

            if ibeaAlterar.Caption = '&Atualizar' Then begin


              ConfirmaMSG := Application.MessageBox('Alterar esse Registro?','Notificação: Exclusão de Registro', MB_YESNO + mb_Defbutton1+MB_ICONQUESTION);
              if ConfirmaMSG = 6 Then begin

                AlteraProduto;

                //COPIA A IMAGEM DO PRODUTO PARA A PASTA DE IMAGENS
            {    if opDialogImagem.FileName <> '' Then begin

                  NovaImagem       := opDialogImagem.FileName;
                  ImagemSalva      := ExtractFilePath(Application.ExeName) + 'Data\RunTime\ProdImagens\' + lbl_edtCodBarra.Text + '.jpg' ;

                  if FileExists(ImagemSalva) Then begin //CASO JÁ EXISTA A IMAGEM
                    DeleteFile(ImagemSalva); //APAGA A MESMA PARA QUE SEJA COLOCADA UMA NOVA
                  end;

                  if Not CopyFile(PChar(NovaImagem), PChar(ImagemSalva),true) then
                    Application.MessageBox('Erro ao Copiar a Imagem do produto','Notificação: Erro ao copiar',MB_OK + MB_ICONERROR);

                  NovaImagem  := ''; //LIMPA A VARIAVEL NOVAIMAGEM
                  ImagemSalva := ''; //LIMPA A VARIAVEL IMAGEMSALVA

                end else begin

                  if ExtrairDirArquivoSalvo <> '' Then begin

                    NovaImagem       := ExtractFilePath(Application.ExeName) + 'Data\RunTime\ProdImagens\Scaneada.jpg';
                    ImagemSalva      := ExtractFilePath(Application.ExeName) + 'Data\RunTime\ProdImagens\' + lbl_edtCodBarra.Text + '.jpg';

                    if FileExists(ImagemSalva) Then begin //CASO JÁ EXISTA A IMAGEM
                      DeleteFile(ImagemSalva); //APAGA A MESMA PARA QUE SEJA COLOCADA UMA NOVA
                    end;

                    if Not CopyFile(PChar(NovaImagem), PChar(ImagemSalva),true) then
                      Application.MessageBox('Erro ao Copiar a Imagem do produto','Notificação: Erro ao copiar',MB_OK + MB_ICONERROR);

                    //DEPOIS QUE A IMAGEM É COPIADA IRÁ EXCLUI-LÁ
                    if FileExists(NovaImagem) Then begin
                      DeleteFile(NovaImagem);
                    end;

                    //DEPOIS QUE A IMAGEM É COPIADA IRÁ EXCLUI-LÁ
                    if FileExists(ExtrairDirArquivoSalvo) Then begin
                      DeleteFile(ExtrairDirArquivoSalvo);
                    end;

                  end;

                  NovaImagem  := ''; //LIMPA A VARIAVEL NOVAIMAGEM
                  ImagemSalva := ''; //LIMPA A VARIAVEL IMAGEMSALVA

                end; }

                Commit(ibMatPrima);

                ExecSELECT;

              end;

              ibeaAlterar.Caption := '&Alterar';
              ibeaNovo.Enabled := True;
              ibeaExcluir.Enabled := True;
              ibeaConsultar.Enabled := True;
              DesabilitaCampos(False);
              lbl_edtQtdeEstoque.Enabled := False;
              lbl_edtEstoqueM.Enabled := False;
              lbl_edtVlrEstoque.Enabled := False;

            end else begin

              ibeaAlterar.Caption := '&Atualizar';
              DesabilitaCampos(True);

            end; {if}

          end; {if}
          
       end;{if}

     end;{if}

    end;{if}

  end; {with}

end;

procedure TfrmMateriaPrima.ibeaExcluirClick(Sender: TObject);
begin

  with dmModule do begin

    ConfirmaMSG := Application.MessageBox('Confirma a exclusão do registro?','Notificação:Exclusão de registro',+MB_YESNO + MB_ICONQUESTION);

    if ConfirmaMSG = 6 Then begin

      ibMatPrima.Close;
      ibMatPrima.SQL.Clear;
      ibMatPrima.SQL.Add('DELETE FROM TBLMATERIAPRIMA WHERE IDPRODMP=''' +  IntToStr(IDProd)+ '''');
      ibMatPrima.Open;

      ExecSELECT;

   end;{if}

  end;{with}

end;

end.
