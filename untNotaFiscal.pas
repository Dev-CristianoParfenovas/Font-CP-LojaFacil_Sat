unit untNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BmsXPCheckBox, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, classComboBox, IBQuery,
  Buttons,WinTypes,WinProcs,Printers;

type
  TfrmNotaFiscal = class(TForm)
    lbl_edtNumeroNF: TLabeledEdit;
    GroupBox1: TGroupBox;
    lbl_edtCodCliente: TLabeledEdit;
    lbl_edtCnpjCpf: TLabeledEdit;
    lbl_edtIE: TLabeledEdit;
    lbl_edtEnd: TLabeledEdit;
    lbl_edtNumero: TLabeledEdit;
    lbl_edtUF: TLabeledEdit;
    lbl_edtBairro: TLabeledEdit;
    lbl_edtCep: TLabeledEdit;
    cboCliente: TComboBox;
    lbl_Cliente: TLabel;
    lbl_edtDDD: TLabeledEdit;
    lbl_edtTelefone: TLabeledEdit;
    GroupBox2: TGroupBox;
    lbl_Prod: TLabel;
    lbl_edtCodBarras: TLabeledEdit;
    lbl_edtQtde: TLabeledEdit;
    lbl_edtVlrUnitario: TLabeledEdit;
    cboProd: TComboBox;
    lbl_edtRef: TLabeledEdit;
    cboNatureza: TComboBox;
    lbl_Natureza: TLabel;
    cboCondPagto: TComboBox;
    lbl_CondPagto: TLabel;
    lbl_edtDesc: TLabeledEdit;
    lbl_edtAcrescimo: TLabeledEdit;
    lbl_edtTotal: TLabeledEdit;
    cboTransportadora: TComboBox;
    lbl_Transp: TLabel;
    dbgNotaFiscal: TDBGrid;
    dtpDataEmissao: TDateTimePicker;
    lbl_edtFrete: TLabeledEdit;
    lbl_CodNatureza: TLabel;
    lbl_Emissao: TLabel;
    lbl_edtPeso: TLabeledEdit;
    lbl_edtICMS: TLabeledEdit;
    lbl_edtIPI: TLabeledEdit;
    ckSaida: TCheckBox;
    ckEntrada: TCheckBox;
    Label1: TLabel;
    memoObs: TMemo;
    lbl_Obs: TLabel;
    lbl_edtEspecie: TLabeledEdit;
    lbl_edtTotalGeral: TLabeledEdit;
    lbl_edtTrazerNota: TLabeledEdit;
    dtpVcto: TDateTimePicker;
    lbl_Vcto: TLabel;
    lbl_edtClassifFiscal: TLabeledEdit;
    lbl_edtVlrFrete: TLabeledEdit;
    lbl_edtPesoBruto: TLabeledEdit;
    lbl_edtQtdeItens: TLabeledEdit;
    lbl_edtNNotaImprimir: TLabeledEdit;
    ibeaNovo: TSpeedButton;
    ibeaExcluir: TSpeedButton;
    ibeaBuscaCli: TSpeedButton;
    ibeaSair: TSpeedButton;
    ibeaIncluir: TSpeedButton;
    ibeaImprimirNF: TSpeedButton;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure LimpaNotaFiscal;
    procedure ExecSELECTNota;
    procedure ExecSELECTNatureza;
    procedure ExecSELECTTransportadora;
    procedure ExecSELECTCliente;
    procedure ExecSELECTCondPagto;
    procedure ExecSELECTProdutos;
    procedure FormShow(Sender: TObject);
    procedure cboNaturezaClick(Sender: TObject);
    procedure ibeaBuscaCliClick(Sender: TObject);
    procedure ibeaNovoClick(Sender: TObject);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckSaidaClick(Sender: TObject);
    procedure ckEntradaClick(Sender: TObject);
    procedure lbl_edtCodBarrasChange(Sender: TObject);
    procedure lbl_edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtQtdeExit(Sender: TObject);
    procedure lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtTelefoneExit(Sender: TObject);
    procedure lbl_edtTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaImprimirNFClick(Sender: TObject);
    procedure dbgNotaFiscalCellClick(Column: TColumn);
    procedure cboClienteClick(Sender: TObject);
    procedure lbl_edtRefExit(Sender: TObject);
    procedure lbl_edtRefKeyPress(Sender: TObject; var Key: Char);
    procedure cboProdClick(Sender: TObject);
    procedure lbl_edtTrazerNotaKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure lbl_edtDescExit(Sender: TObject);
    procedure lbl_edtAcrescimoExit(Sender: TObject);
    procedure lbl_edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtAcrescimoKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtVlrUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotaFiscal: TfrmNotaFiscal;
  MontaColunas : Boolean;
  IDDetalheNota,IDAltDetalheNota, IDNota : Integer;
implementation

uses untdmModule, DB, BuscaClientes, funcPosto,
  uBuscaProdutos;

{$R *.dfm}

Function LimparCampos(J:String):String; Export; 
Begin
While J[Length(J)]=#32 do Dec(J[1]);
If Length(J)>1 then
While (J[1]=' ') do
Begin
Delete(J,1,1);
If Length(J)<=1 then J:='';
end;
Result:=J;
end;


procedure TfrmNotaFiscal.ibeaSairClick(Sender: TObject);
begin

  if (lbl_edtNumeroNF.Text <> '')Then begin

    Application.MessageBox('É necessário finalizar a nota clicando no botão gravar','Nota não finalizada',+MB_OK+MB_DEFBUTTON1+MB_ICONINFORMATION);

  end else begin

    Close;

  end;

end;

procedure TfrmNotaFiscal.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmNotaFiscal.LimpaNotaFiscal;

begin

lbl_edtNumeroNF.Clear;
lbl_edtCodCliente.Clear;
lbl_edtDDD.Clear;
lbl_edtTelefone.Clear;
cboCliente.ClearSelection;
lbl_edtCnpjCpf.Clear;
lbl_edtIE.Clear;
lbl_edtEnd.Clear;
lbl_edtNumero.Clear;
lbl_edtCep.Clear;
lbl_edtBairro.Clear;
lbl_edtUF.Clear;
lbl_CodNatureza.Caption := '';
cboNatureza.ClearSelection;
cboCondPagto.ClearSelection;
cboTransportadora.ClearSelection;
lbl_edtFrete.Clear;
lbl_edtEspecie.Clear;
ckSaida.Checked := True;
ckEntrada.Checked := False;
lbl_edtCodBarras.Clear;
lbl_edtRef.Clear;
cboProd.ClearSelection;
lbl_edtQtde.Text := '1';
lbl_edtVlrUnitario.Text := '0,00';
lbl_edtDesc.Clear;
lbl_edtAcrescimo.Clear;
lbl_edtTotal.Text := '0,00';
lbl_edtTotalGeral.Text := '0,00';
memoObs.Clear;
lbl_edtClassifFiscal.Clear;
lbl_edtPeso.Clear;
lbl_edtPesoBruto.Clear;
lbl_edtVlrFrete.Clear;
lbl_edtICMS.Clear;
lbl_edtIPI.Clear;
lbl_edtQtdeItens.Clear;

end;

procedure TfrmNotaFiscal.ExecSELECTNota;

begin

  with dmModule do begin

    Commit(ibNotaFiscal);
    ibNotaFiscal.Close;
    ibNotaFiscal.SQL.Clear;
    ibNotaFiscal.SQL.Add('SELECT TBLNOTAFISCAL.*,TBLCADASTRO.NOME As Cliente,'
    + 'CADPRODUTOS.NOME As Produto,NATUREZA.DESCRICAO As TipoNatureza,'
    + 'CONDICOESPAGAMENTO.DESCRICAO As CondPagto FROM TBLNOTAFISCAL '
    + 'INNER JOIN TBLCADASTRO ON TBLNOTAFISCAL.IDCLINOTA=TBLCADASTRO.IDCAD '
    + 'INNER JOIN CADPRODUTOS ON TBLNOTAFISCAL.IDPRODNOTA=CADPRODUTOS.IDPROD '
    + 'INNER JOIN NATUREZA ON TBLNOTAFISCAL.IDNATUREZA=NATUREZA.IDNATUREZA '
    + 'INNER JOIN CONDICOESPAGAMENTO ON TBLNOTAFISCAL.IDCONDPAGTO=CONDICOESPAGAMENTO.IDCONDPAGTO');
    ibNotaFiscal.Open;

  end;//with

end;

procedure TfrmNotaFiscal.ExecSELECTNatureza;

var
  IDClassNatureza    : TClasseCombo;

begin

  with dmModule do begin

     //SELECT PARA TRAZER OS DADOS DA TABELA
      ibNatureza.Close;
      ibNatureza.SQL.Clear;
      ibNatureza.SQL.Add('SELECT * FROM NATUREZA');
      ibNatureza.Open;

      cboNatureza.Clear;//LIMPA A SELECAO DO COMBO

    while not ibNatureza.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDClassNatureza    := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDClassNatureza.ID := ibNatureza.FieldByName('IDNATUREZA').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboNatureza.Items.AddObject(ibNatureza.FieldByName('DESCRICAO').AsString,IDClassNatureza);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibNatureza.Next;

    end;{while}

  end;{with}

end;

procedure TfrmNotaFiscal.ExecSELECTTransportadora;

var

IDClassTransp : TClasseCombo;
ClassTransportadora : Integer;

begin

  with dmModule do begin

    //LOCALIZA E ABRE SOMENTE O CADASTRO DA TRANSPORTADORA PELA IDENTIFICAÇÃO.
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Transportadora''');
    ibClassificacao.Open;
    ClassTransportadora := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DA TRANSPORTADORA NA VARIAVEL.


    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE(TBLCADASTRO.IDCLASS=''' + InttoStr(ClassTransportadora) + ''')ORDER BY TBLCADASTRO.NOME');
    ibCadastro.Open;

      cboTransportadora.Clear;//LIMPA A SELECAO DO COMBO

    while not ibCadastro.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDClassTransp    := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDClassTransp.ID := ibCadastro.FieldByName('IDCAD').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboTransportadora.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,IDClassTransp);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibCadastro.Next;

    end;{while}

  end;//with

end;


procedure TfrmNotaFiscal.ExecSELECTCliente;

var
  IDClassCliente : TClasseCombo;
  IDClassCli : Integer;

begin

  with dmModule do begin

     //SELECT PARA TRAZER OS DADOS DA TABELA
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT * FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
      ibClassificacao.Open;
      IDClassCli := ibClassificacao.FieldByName('IDCLASS').AsInteger;

      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClassCli) + '''');
      ibCadastro.Open;

      cboCliente.Clear;//LIMPA A SELECAO DO COMBO

    while not ibCadastro.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDClassCliente    := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDClassCliente.ID := ibCadastro.FieldByName('IDCAD').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboCliente.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,IDClassCliente);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibCadastro.Next;

    end;{while}

  end;{with}

end;

procedure TfrmNotaFiscal.ExecSELECTCondPagto;

var
IDClassCondPagto : TClasseCombo;

begin

  with dmModule do begin

    //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS.
    ibCondicoesPagto.Close;
    ibCondicoesPagto.SQL.Clear;
    ibCondicoesPagto.SQL.Add('SELECT * FROM CONDICOESPAGAMENTO');
    ibCondicoesPagto.Open;

    cboCondPagto.Clear;

    while not ibCondicoesPagto.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDClassCondPagto := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDClassCondPagto.ID := ibCondicoesPagto.FieldByName('IDCONDPAGTO').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboCondPagto.Items.AddObject(ibCondicoesPagto.FieldByName('DESCRICAO').AsString,IDClassCondPagto);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibCondicoesPagto.Next;

    end;

  end;{with}

end;

procedure TfrmNotaFiscal.ExecSELECTProdutos;

var

IDClassProd : TClasseCombo;

begin

  with dmModule do begin

     //SELECT PARA TRAZER OS DADOS DA TABELA
      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS');
      ibProdutos.Open;

      cboProd.Clear;//LIMPA A SELECAO DO COMBO

    while not ibProdutos.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDClassProd    := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDClassProd.ID := ibProdutos.FieldByName('IDPROD').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboProd.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDClassProd);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibProdutos.Next;

    end;{while}

  end;{with}

end;

procedure TfrmNotaFiscal.FormShow(Sender: TObject);
begin

dtpDataEmissao.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
dtpVcto.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
ckSaida.Checked := True;

  with dmModule do begin

    ExecSELECTCliente;
    ExecSELECTProdutos;
    ExecSELECTNatureza;
    ExecSELECTCondPagto;
    ExecSELECTTransportadora;
    
    with dbgNotaFiscal do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

         DataSource := dtsNotaFiscal;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'Produto';
        Columns.Items[0].Width         := 170;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Valor';
        Columns.Items[1].FieldName     := 'VLRUNIT';
        Columns.Items[1].Width         := 70;
        Columns.Items[1].Alignment     := taLeftJustify;


        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[2].Title.Caption := 'Qtde.';
        Columns.Items[2].FieldName     := 'QTDE';
        Columns.Items[2].Width         := 50;
        Columns.Items[2].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[3].Title.Caption := 'Total';
        Columns.Items[3].FieldName     := 'VLRTOTAL';
        Columns.Items[3].Width         := 70;
        Columns.Items[3].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with dbg nota fiscal}

  end;//with

end;

procedure TfrmNotaFiscal.cboNaturezaClick(Sender: TObject);

var

IDClassNaturezaCod : TClasseCombo;
StringNatureza : String;

begin

with dmModule do begin

    if cboNatureza.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      IDClassNaturezaCod     := TClasseCombo( cboNatureza.Items.Objects[cboNatureza.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringNatureza    := ' IDNATUREZA=''' + InttoStr( IDClassNaturezaCod.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.

      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      ibNatureza.Close;
      ibNatureza.SQL.Clear;
      ibNatureza.SQL.Add('SELECT * FROM NATUREZA WHERE ' + StringNatureza);
      ibNatureza.Open;

      lbl_CodNatureza.Caption := ibNatureza.FieldByName('NATUREZA_COD').AsString;

    end;{if}

  end;{with}

end;

procedure TfrmNotaFiscal.ibeaBuscaCliClick(Sender: TObject);
begin
frmBuscaClientes.ShowModal;
end;

procedure TfrmNotaFiscal.ibeaNovoClick(Sender: TObject);

var

IDClassGravaCli : TClasseCombo;
StringGravaCli : String;
Saida,Entrada,TotaldaNota,VlrFrete : String;
  A : TStrArray;
  CountIDUsuarios : longint;
  Dia,Mes,Ano : Word;
  DataInicial,DataFinal,DataPagto: TDate;
  TotalData,str,DataEmissao,CondPagto,VlrTotalParc,ValorParcelado : String;
  i,IDNota : Integer;
begin

  with dmModule do begin

  if ibeaNovo.Caption = '&Gravar' Then begin

    if cboCliente.ItemIndex = -1 Then begin

    StringGravaCli  := ' ''0'',';

    end else begin

    IDClassGravaCli := TClasseCombo(cboCliente.Items.Objects[cboCliente.ItemIndex]);
    StringGravaCli  := ' ''' + IntToStr(IDClassGravaCli.ID) + ''',';

    end;

    if ckSaida.Checked Then begin

      Saida := 'XX';

    end else begin

      Saida := '';

    end;

    if ckEntrada.Checked Then begin

      Entrada := 'XX';

    end else begin

      Entrada := '';

    end;

    TotaldaNota := StringReplace(lbl_edtTotalGeral.Text,ThousandSeparator,'',[rfReplaceAll]);
    TotaldaNota := StringReplace(TotaldaNota,DecimalSeparator,'.',[rfReplaceAll]);
    if TotaldaNota = '' Then
    TotaldaNota := '0';

    VlrFrete := StringReplace(lbl_edtVlrFrete.Text,ThousandSeparator,'',[rfReplaceAll]);
    VlrFrete := StringReplace(VlrFrete,DecimalSeparator,'.',[rfReplaceAll]);
    if VlrFrete = '' Then
    VlrFrete := '0';

    IDNota := StrToInt(lbl_edtNumeroNF.Text);

    if cboCondPagto.Text = '' Then begin

      ibDetalheNota.Close;
      ibDetalheNota.SQL.Clear;
      ibDetalheNota.SQL.Add('INSERT INTO TBLDETALHENOTA'
      + '(DATA,IDNOTA,IDCLIDETALHE,OBS,FRETE,ESPECIE,SAIDA,ENTRADA,TOTALNOTA,VCTO,PESO,'
      + 'CLASSIFFISCAL,TELEFONE,VLRFRETE,PESOBRUTO,QTDEITENS,HORA) values '
      + '(''' + FormatDateTime('mm-dd-yyyy',Now) + ''',''' + IntToStr(IDNota) + ''','
      +StringGravaCli
      + ' ''' + memoObs.Text + ''','
      + ' ''' + lbl_edtFrete.Text + ''','
      + ' ''' + lbl_edtEspecie.Text + ''','
      + ' ''' + Saida + ''','
      + ' ''' + Entrada + ''','
      + ' ''' + TotaldaNota + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy',dtpVcto.Date) + ''','
      + ' ''' + lbl_edtPeso.Text + ''','
      + ' ''' + lbl_edtClassifFiscal.Text + ''','
      + ' ''' + lbl_edtTelefone.Text + ''','
      + ' ''' + VlrFrete + ''','
      + ' ''' + lbl_edtPesoBruto.Text + ''','
      + ' ''' + lbl_edtQtdeItens.Text + ''','
      + ' ''' + FormatDateTime('hh:mm:ss',Now) + ''')');
      ibDetalheNota.ExecSQL;
      Commit(ibDetalheNota);

    end;//if cbocondpagto=''

    {lbl_edtNumPedido.Clear;
    cboTipoPagto.ClearSelection;
    cboCliente.ClearSelection;
    lbl_edtTotalPed.Clear;
    lbl_edtTotalGeral.Clear;
    lbl_edtTelefone.Clear;
    lbl_edtCpf.Clear;
    lbl_edtRg.Clear;
  //  cboProduto.Clear;
    lbl_edtVlrProd.Clear;
    lbl_edtQtde.Clear;
    lbl_edtTotalProd.Clear;
    lbl_edtDesc.Clear;
    lbl_edtAcresc.Clear;
    lbl_edtTotalPed.Clear;
    lbl_CodBarras.Caption := '';
    lbl_NomeProd.Caption := '';
    lbl_Valor.Caption := '';
    lbl_edtEndereco.Clear;
    lbl_edtNumero.Clear;
    lbl_edtCompl.Clear;
    lbl_edtBairro.Clear;
    lbl_edtCidade.Clear;}

////////////////////////////////////////////////////////////////////////////////

        if cboCondPagto.Text <> '' Then begin

          if cboCondpagto.ItemIndex <> - 1 Then begin


            str := cboCondpagto.Text;//atribui o conteudo na variavel
            CountIDUsuarios := Explode(A, '/', str); //a tribuia funcao na variavel pegando os dados separados pela /

            VlrTotalParc   := StringReplace(TotaldaNota,'.',',',[rfReplaceAll]);
            ValorParcelado := FloatToStr(StrtoFloat(VlrTotalParc) / CountIDUsuarios);
            ValorParcelado := StringReplace(ValorParcelado,DecimalSeparator,'.',[rfReplaceAll]);

            for i := 0 to CountIDUsuarios -1 do begin //busca pelo primeiro registro antes da barra

             decodedaTe(dtpDataEmissao.Date,ano,mes,dia);//decodifica a data do combo
             DataInicial := StrToInt(A[i]);//atribui na variavel os valores sem a barra da condicao de pagto
             DataEmissao := FormatDateTime('DD/MM/YYYY',dtpDataEmissao.Date);//atribui na variavel a data formatada
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

            IDNota := StrToInt(lbl_edtNumeroNF.Text);

            ibDetalheNota.Close;
            ibDetalheNota.SQL.Clear;
            ibDetalheNota.SQL.Add('INSERT INTO TBLDETALHENOTA'
            + '(IDNOTA,OBS,QTDEITENS,PESO,PESOBRUTO,SAIDA,ENTRADA,VALORPARCELADO,'
            + 'VCTOPARCELADO) values '
            + '(''' + IntToStr(IDNota) + ''',''' + memoObs.Text + ''','
            + ' ''' + lbl_edtQtdeItens.Text + ''',''' + lbl_edtPeso.Text + ''','
            + ' ''' + lbl_edtPesoBruto.Text + ''',''' + Saida + ''','
            + ' ''' + Entrada + ''',' 
            + ' ''' + ValorParcelado + ''',''' + FormatDateTime('mm-dd-yyyy',DataPagto) + ''')');
            ibDetalheNota.Open;

          end;{if cond pagto}
              end;{if}

        end;//if cbocondpagto ''
        
    ibeaNovo.Caption := '&Novo';
    LimpaNotaFiscal;


////////////////////////////////////////////////////////////////////////////////


    end else begin

    ibeaNovo.Caption := '&Gravar';
   // cboTipoPagto.ClearSelection;
    cboCliente.ClearSelection;
   { lbl_edtComissao.Clear;
    lbl_edtTelefone.Clear;
    lbl_edtCpf.Clear;
    lbl_edtRg.Clear;
    lbl_edtTotalPed.Clear;
    lbl_edtTelefone.SetFocus; }

    ibDetalheNota.Close;
    ibDetalheNota.SQL.Clear;
    ibDetalheNota.SQL.Add('SELECT * FROM TBLDETALHENOTA ORDER BY IDDETALHE DESC');
    ibDetalheNota.Open;

    lbl_edtNumeroNF.Text := IntToStr(ibDetalheNota.FieldByName('IDDETALHE').AsInteger + 1);

    end;

  end;{with}

end;

procedure TfrmNotaFiscal.ibeaIncluirClick(Sender: TObject);

var

StringGravaCondPagto,StringGravaCli : String;
IDClassGravaCondPagto,IDClassGravaCli : TClasseCombo;
StringGravaProd,StringGravaNatureza,StringGravaTransp : String;
IDClassGravaProd,IDClassGravaNatureza,IDClassGravaTransp : TClasseCombo;
StringGravaEsp : String;
IDClassGravaEsp : TClasseCombo;
TipoSaidaEntrada,IDDetalheNota,IDFrete,IDCodCli : Integer;
Qtde,VlrUnit,VlrTotal,Desconto,Acrescimo : String;
Valor1,Valor2,Valor3 : Real;
begin

  with dmModule do begin

  if (lbl_edtNumeroNF.Text <> '')and(cboCliente.Text <> '')Then begin

   IDDetalheNota := StrToInt(lbl_edtNumeroNF.Text);
////////////////////////////////////////////////////////////////////////////////

    if cboCliente.ItemIndex = -1 Then begin

      StringGravaCli  := ' ''0'',';

    end else begin

      IDClassGravaCli := TClasseCombo(cboCliente.Items.Objects[cboCliente.ItemIndex]);
      StringGravaCli  := ' ''' + IntToStr(IDClassGravaCli.ID) + ''',';

    end;{ifcbocliente}

    if cboProd.ItemIndex = -1 Then begin

      StringGravaProd := ' '' 0 '',';

    end else begin

      IDClassGravaProd   := TClasseCombo( cboProd.Items.Objects[cboProd.ItemIndex] );
      StringGravaProd          := ' ''' + InttoStr( IDClassGravaProd.ID ) + ''',';

    end;//cboprod

    if cboCondPagto.ItemIndex = -1 Then begin

      StringGravaCondPagto := ' ''0'',';

    end else begin

      IDClassGravaCondPagto   := TClasseCombo( cboCondPagto.Items.Objects[cboCondPagto.ItemIndex] );
      StringGravaCondPagto  := ' ''' + InttoStr( IDClassGravaCondPagto.ID ) + ''',';

    end;{ifcbotipopagto}

    if cboNatureza.ItemIndex = -1 Then begin

      StringGravaNatureza := ' ''0'',';

    end else begin

      IDClassGravaNatureza   := TClasseCombo( cboNatureza.Items.Objects[cboNatureza.ItemIndex] );
      StringGravaNatureza  := ' ''' + InttoStr( IDClassGravaNatureza.ID ) + ''',';

    end;{ifcbotipopagto}

    if cboTransportadora.ItemIndex = -1 Then begin

      StringGravaTransp := ' ''0'',';

    end else begin

      IDClassGravaTransp   := TClasseCombo( cboTransportadora.Items.Objects[cboTransportadora.ItemIndex] );
      StringGravaTransp  := ' ''' + InttoStr( IDClassGravaTransp.ID ) + ''',';

    end;{ifcbotipopagto}

   { if cboEspecie.ItemIndex = -1 Then begin

      StringGravaEsp := ' ''0'',';

    end else begin

      IDClassGravaEsp   := TClasseCombo( cboEspecie.Items.Objects[cboEspecie.ItemIndex] );
      StringGravaEsp  := ' ''' + InttoStr( IDClassGravaEsp.ID ) + ''',';

    end;}

    if ckSaida.Checked Then begin

      TipoSaidaEntrada := StrToInt('1');

    end;

    if ckEntrada.Checked Then begin

      TipoSaidaEntrada := StrToInt('2');

    end;

    Qtde := StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]);
    Qtde := StringReplace(Qtde,DecimalSeparator,'.',[rfReplaceAll]);
    if Qtde = '' Then
    Qtde := '0';

    VlrUnit := StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]);
    VlrUnit := StringReplace(VlrUnit,DecimalSeparator,'.',[rfReplaceAll]);
    if VlrUnit = '' Then
       VlrUnit := '0';

    VlrTotal := StringReplace(lbl_edtTotal.Text,ThousandSeparator,'',[rfReplaceAll]);
    VlrTotal := StringReplace(VlrTotal,DecimalSeparator,'.',[rfReplaceAll]);
    if VlrTotal = '' Then
    VlrTotal := '0';

    Desconto := StringReplace(lbl_edtDesc.Text,ThousandSeparator,'',[rfReplaceAll]);
    Desconto := StringReplace(Desconto,DecimalSeparator,'.',[rfReplaceAll]);
    if Desconto = '' Then
       Desconto := '0';

    Acrescimo := StringReplace(lbl_edtAcrescimo.Text,ThousandSeparator,'',[rfReplaceAll]);
    Acrescimo := StringReplace(Acrescimo,DecimalSeparator,'.',[rfReplaceAll]);
    if Acrescimo = '' Then
    Acrescimo := '0';

    if lbl_edtFrete.Text <> '' Then begin

      IDFrete := StrToInt(lbl_edtFrete.Text);

    end else begin

      IDFrete := StrToInt('0');

    end;

    if lbl_edtCodCliente.Text <> '' Then begin

      IDCodCli := StrToInt(lbl_edtCodCliente.Text);

    end else begin

      IDCodCli := StrToInt('0');

    end;

    ibNotaFiscal.Close;
    ibNotaFiscal.SQL.Clear;
    ibNotaFiscal.SQL.Add('INSERT INTO TBLNOTAFISCAL'
    + '(CODCLI,IDCLINOTA,IDPRODNOTA,IDCONDPAGTO,IDNATUREZA,IDTRANSPORTADORA,'
    + 'IDDETALHENOTA,QTDE,VLRUNIT,DESCONTO,ACRESCIMO,'
    + 'VLRTOTAL) values '
    + '(''' + IntToStr(IDCodCli) + ''','
    +StringGravaCli
    +StringGravaProd
    +StringGravaCondPagto
    +StringGravaNatureza
    +StringGravaTransp
    + ' ''' + IntToStr(IDDetalheNota) + ''','
    + ' ''' + Qtde + ''','
    + ' ''' + VlrUnit + ''','
    + ' ''' + Desconto + ''','
    + ' ''' + Acrescimo + ''','
    + ' ''' + VlrTotal + ''')');
    ibNotaFiscal.ExecSQL;
    Commit(ibNotaFiscal);

/////////////////////////////////////////////////////////////////////////////////
      if lbl_edtTotal.Text <> '' Then begin// se for em branco executa rotina abaixo.

        if (Pos(',',lbl_edtTotal.Text)>0) and (lbl_edtTotal.Text <> '') Then begin

          Valor1 := StrToFloat(StringReplace(lbl_edtTotal.Text,ThousandSeparator,'',[rfReplaceAll]));

          if lbl_edtTotalGeral.Text = '' Then begin

          lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor1));

          end else begin

          //Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));
          Valor2 := StrToFloat(StringReplace(lbl_edtTotalGeral.Text,ThousandSeparator,'',[rfReplaceAll]));
          Valor3 := (Valor2 + Valor1);

          lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor3));

          end;

          end else begin

          Valor1 := StrToFloat(StringReplace(lbl_edtTotal.Text,ThousandSeparator,'',[rfReplaceAll]));

          if lbl_edtTotalGeral.Text = '' Then begin

          lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor1));

          end else begin

          //Valor1 := StrToFloat(StringReplace(lbl_edtTotalPed.Text,ThousandSeparator,'',[rfReplaceAll]));
          Valor2 := StrToFloat(StringReplace(lbl_edtTotalGeral.Text,ThousandSeparator,'',[rfReplaceAll]));
          Valor3 := (Valor2 + Valor1);

          lbl_edtTotalGeral.Text := FormatFloat(',0.00',(Valor3));

          end;

        end;{if}
        
      end;//if
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////

    Commit(ibNotaFiscal);
    ibNotaFiscal.Close;
    ibNotaFiscal.SQL.Clear;
    ibNotaFiscal.SQL.Add('SELECT TBLNOTAFISCAL.*,TBLCADASTRO.NOME As Cliente,'
    + 'CADPRODUTOS.NOME As Produto,CADPRODUTOS.REF,CADPRODUTOS.CODBARRAS,NATUREZA.DESCRICAO As TipoNatureza,'
    + 'CONDICOESPAGAMENTO.DESCRICAO As CondPagto FROM TBLNOTAFISCAL '
    + 'INNER JOIN TBLCADASTRO ON TBLNOTAFISCAL.IDCLINOTA=TBLCADASTRO.IDCAD '
    + 'INNER JOIN CADPRODUTOS ON TBLNOTAFISCAL.IDPRODNOTA=CADPRODUTOS.IDPROD '
    + 'INNER JOIN NATUREZA ON TBLNOTAFISCAL.IDNATUREZA=NATUREZA.IDNATUREZA '
    + 'LEFT OUTER JOIN CONDICOESPAGAMENTO ON TBLNOTAFISCAL.IDCONDPAGTO=CONDICOESPAGAMENTO.IDCONDPAGTO WHERE TBLNOTAFISCAL.IDDETALHENOTA=''' + IntToStr(IDDetalheNota) + '''');
    ibNotaFiscal.Open;

    (ibNotaFiscal.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibNotaFiscal.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
//    (ibNotaFiscal.FieldByName('TOTALNOTA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

////////////////////////////////////////////////////////////////////////////////

  end;//if labelnota e cbocliente em branco


  end;//with

end;

procedure TfrmNotaFiscal.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmNotaFiscal.ckSaidaClick(Sender: TObject);
begin

  if ckSaida.Checked Then begin

    ckEntrada.Checked := False;

  end;//if

end;

procedure TfrmNotaFiscal.ckEntradaClick(Sender: TObject);
begin

  if ckEntrada.Checked Then begin

    ckSaida.Checked := False;

  end;

end;

procedure TfrmNotaFiscal.lbl_edtCodBarrasChange(Sender: TObject);

var

i : Integer;

begin

  with dmModule do begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
    + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
    + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarras.Text + '''');
    ibProdutos.Open;


    lbl_edtVlrUnitario.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);


      { if lbl_TipoPreco.Caption = 'Preço de Venda(B)' Then begin

     //  TipoPreco := 'B';
       lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);

       end;

       if lbl_TipoPreco.Caption = 'Preço de Venda(C)' Then begin

       //TipoPreco := 'C';
       lbl_edtVlrProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);

       end; }


    for i:=0 to cboProd.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboProd.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboProd.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboProd.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}

  end;{with}


end;

procedure TfrmNotaFiscal.lbl_edtCodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtQtde.SetFocus;

  end;//if
  
end;

procedure TfrmNotaFiscal.lbl_edtQtdeExit(Sender: TObject);

var

Valor1,Valor2,Valor3,Valor4 : Real;

begin
  if lbl_edtQtde.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQtde.Text)>0) and (lbl_edtQtde.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]));

      lbl_edtTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));


    end;{if}

  end;{if}

end;

procedure TfrmNotaFiscal.lbl_edtQtdeKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 Then begin

    lbl_edtVlrUnitario.SetFocus;

  end;{if}

end;

procedure TfrmNotaFiscal.lbl_edtTelefoneExit(Sender: TObject);

var

i : Integer;
IDClassCli : Integer;

begin

  with dmModule do begin


    if lbl_edtTelefone.Text <> '' Then begin

      lbl_edtTelefone.Text := StringReplace(lbl_edtTelefone.Text,'-','',[rfReplaceAll]);
      lbl_edtTelefone.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtTelefone.Text));

    end;{if}


    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClassCli := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    ibCadastro.Close;                                                                                    //  and TBLCADASTRO.NOME LIKE '+''''+'%'+lbl_edtNome.text+'%'+'''
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCONTATO.CONTATO,TBLLOGRADOURO.ENDERECO,'
    +'TBLLOGRADOURO.BAIRRO,TBLLOGRADOURO.CIDADE,TBLLOGRADOURO.ESTADO FROM TBLCADASTRO '
    +'LEFT OUTER JOIN TBLCONTATO ON TBLCADASTRO.IDCAD=TBLCONTATO.IDCAD '
    +'LEFT OUTER JOIN TBLLOGRADOURO ON TBLCADASTRO.IDCAD=TBLLOGRADOURO.IDCAD '
    +'WHERE IDCLASS=''' + InttoStr(IDClassCli) + ''' and TBLCONTATO.CONTATO=''' + lbl_edtTelefone.Text + '''');
    ibCadastro.Open;


      for i:=0 to cboCliente.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboCliente.Items.Objects[i]).ID = ibCadastro.FieldByName('IDCAD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboCliente.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboCliente.ClearSelection;//LIMPA A SELECAO.
        end;{if}
      end;{for}

     if ibCadastro.RecordCount > 0 Then begin

       lbl_edtEnd.Text      := ibCadastro.FieldByName('ENDERECO').AsString;
       lbl_edtNumero.Text        := ibCadastro.FieldByName('NUMERO').AsString;
       lbl_edtBairro.Text        := ibCadastro.FieldByName('BAIRRO').AsString;
       lbl_edtUF.Text        := ibCadastro.FieldByName('ESTADO').AsString;

     end;//if record count


    end;{with}


end;

procedure TfrmNotaFiscal.lbl_edtTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 Then begin

lbl_edtCnpjCpf.SetFocus;

end;

end;

procedure TfrmNotaFiscal.ibeaImprimirNFClick(Sender: TObject);

var
Arquivo : TextFile;
SaidaNF,EntradaNF,NumeroNota: String;
Contador,IDTransp,IDNumeroNota,T : Integer;
Texto1 : string;

//VARIAVEIS DE CONFIGURACAO DA NOTA FISCAL
NumeroNotaFiscal,NomeNatureza,CodNatureza,NSaida,NEntrada : String;
NCliente,NCnpj,NDataNota,NEndCliente,NBairroCliente,NCepCliente : String;
NDataNotaSaidaEntrada,NMunicipioCliente,NFoneCliente,NUFCliente : String;
NIERGCliente,NumeroNotaCli,NDataNotaCli,NTotalNotaCli : String;
NRef,NProduto,NSitTrib,NClassFisc,NUnid,NQtde,NVlrUnit,NVlrTotal : String;
NICMS,NIPI,NVlrIPI,NVlrTotalProd,NVlrTotalNota,NNomeTransp,NFreteConta : String;
NEndTransp,NQtdeItens,NTipoEspecie,NPesoLiq,NPesoBruto,NClassFiscal : String;
NObs,NumeroNotaRodape : String;
IndiceHorizontal,IndiceVertical  :Real;
NumeroNotaFiscalH,NumeroNotaFiscalV,Saidahoriz,Saidavert,Entradahoriz,EntradaVert : Integer;
Linhanumeronf,Colunanumeronf,Lsaidanf,Colsaidanf,Lentradanf,Colentradanf : Integer;
Linhanomenatnf,Colnomenatnf,NomeNaturezaHoriz,NomeNaturezaVert : Integer;
Linhacodnatnf,Colcodnatnf,CodNaturezaHoriz,CodNaturezaVert : Integer;
NomeCliHoriz,NomeCliVert,ColNomeCli,LinhNomeCli : Integer;
CnpjHoriz,CnpjVert,ColCnpj,LinhCnpj : Integer;
DataEmissaoHoriz,DataEmissaoVert,ColDataEmissao,LinhDataEmissao : Integer;
EndCliHoriz,EndCliVert,ColEndCli,LinhEndCli,BairroCliHoriz,BairroCliVert : Integer;
ColBairroCli,LinhBairroCli,DataSEHoriz,DataSEVert,ColDataSE,LinhDataSE : Integer;
CepHoriz,CepVert,ColCep,LinhCep : Integer;
MunicipioHoriz,MunicipioVert,ColMunicipio,LinhMunicipio : Integer;
FoneCliHoriz,FoneCliVert,ColFoneCli,LinhFoneCli,UFHoriz,UFVert : Integer;
ColUF,LinhUF,IEHoriz,IEVert,ColIE,LinhIE : Integer;
NFaturaHoriz,NFaturaVert,ColNFatura,LinhNFatura : Integer;
VctoFaturaHoriz,VctoFaturaVert,ColVctoFatura,LinhVctoFatura : Integer;
ValorFaturaHoriz,ValorFaturaVert,ColValorFatura,LinhValorFatura : Integer;
CodProdHoriz,CodProdVert,ColCodProd,LinhCodProd,NomeProdHoriz,NomeProdVert : Integer;
ColNomeProd,LinhNomeProd,QtdeHoriz,QtdeVert,ColQtde,LinhQtde,VlrUnitHoriz : Integer;
VlrUnitVert,ColVlrUnit,LinhVlrUnit,VlrTotalHoriz,VlrTotalVert,ColVlrTotal : Integer;
LinhVlrTotal : Integer;
LinhaCodAd,LinhaProdAd,LinhaQtdeAd,LinhaVlrUnitAd,LinhaVlrTotalAd : Integer;
TotalProdutosHoriz,TotalProdutosVert,ColTotalProdutos,LinhTotalProdutos : Integer;
TotalVlrNotaHoriz,TotalVlrNotaVert,ColTotalVlrNota,LinhTotalVlrNota : Integer;
NomeTranspHoriz,NomeTranspVert,ColNomeTransp,LinhNomeTransp : Integer;
FreteContaHoriz,FreteContaVert,ColFreteConta,LinhFreteConta : Integer;
EndTranspHoriz,EndTranspVert,ColEndTransP,LinhEndTransp : Integer;
QuantidadeHoriz,QuantidadeVert,ColQuantidade,LinhQuantidade : Integer;
EspecieHoriz,EspecieVert,ColEspecie,LinhEspecie,PBrutoHoriz,PBrutoVert : Integer;
ColPBruto,LinhPBruto,PLiqHoriz,PLiqVert,ColPLiq,LinhPLiq : Integer;
DadosAdHoriz,DadosAdVert,ColDadosAd,LinhDadosAd : Integer;
NNotaCanhotoHoriz,NNotaCanhotoVert,ColNNotaCanhotoHoriz : Integer;
LinhNNotaCanhotoVert : Integer;
coluna,linha : String;
i,ColunaMemo,LinhaMemo : Integer;
VctoParcHoriz,VctoParcVert,VlrParcHoriz,VlrParcVert : Integer;
ColVctoParc,LinhVctoParc,ColVlrParc,LinhVlrParc : Integer;

DataConvertida,Total : String;


begin

  with dmModule do begin

    if lbl_edtTrazerNota.Text <> '' Then begin


      Commit(ibTempNF);
      ibTempNF.Close;
      ibTempNF.SQL.Clear;
      ibTempNF.SQL.Add('SELECT TBLNOTAFISCAL.*,CADPRODUTOS.NOME As Produto,'
      + 'CADPRODUTOS.REF,TBLCADASTRO.NOME As Cliente,TBLCADASTRO.CEP,'
      + 'TBLCADASTRO.TELEFONE,'
      + 'NATUREZA.DESCRICAO As NomeNat,NATUREZA.NATUREZA_COD,TBLCADDOCUMENTACAO.CNPJ_CPF,'
      + 'TBLCADDOCUMENTACAO.IE_RG,TBLLOGRADOURO.ENDERECO As EndCliForn,TBLLOGRADOURO.BAIRRO As BairroCliForn,'
      + 'TBLLOGRADOURO.CIDADE As Municipio,TBLLOGRADOURO.ESTADO As UF,'
      + 'TBLDETALHENOTA.ESPECIE As TipoEspecie,TBLDETALHENOTA.FRETE as FreteConta,TBLDETALHENOTA.SAIDA As SaidaNF,'
      + 'TBLDETALHENOTA.ENTRADA As EntradaNF,TBLDETALHENOTA.TOTALNOTA,TBLDETALHENOTA.VCTO As Vencimento,'
      + 'TBLDETALHENOTA.OBS As Observacao,TBLDETALHENOTA.DATA As DtNota,TBLDETALHENOTA.QTDEITENS,'
      + 'TBLDETALHENOTA.PESO As PesoNota,TBLDETALHENOTA.PESOBRUTO,TBLDETALHENOTA.CLASSIFFISCAL,'
      + 'TBLDETALHENOTA.TELEFONE As FoneCliente,TBLDETALHENOTA.VLRFRETE,'
      + 'TBLDETALHENOTA.VALORPARCELADO,TBLDETALHENOTA.VCTOPARCELADO FROM TBLNOTAFISCAL '
      + 'INNER JOIN CADPRODUTOS ON TBLNOTAFISCAL.IDPRODNOTA=CADPRODUTOS.IDPROD '
      + 'INNER JOIN TBLCADASTRO ON TBLNOTAFISCAL.IDCLINOTA=TBLCADASTRO.IDCAD '
      + 'INNER JOIN TBLCADDOCUMENTACAO ON TBLNOTAFISCAL.IDCLINOTA=TBLCADDOCUMENTACAO.IDCAD '
      + 'INNER JOIN TBLDETALHENOTA ON TBLNOTAFISCAL.IDDETALHENOTA=TBLDETALHENOTA.IDDETALHE '                                                       //  and TBLCONTATO.CONTATO=''8''
      + 'LEFT OUTER JOIN TBLLOGRADOURO ON TBLNOTAFISCAL.IDCLINOTA=TBLLOGRADOURO.IDCAD '
      + 'INNER JOIN NATUREZA ON TBLNOTAFISCAL.IDNATUREZA=NATUREZA.IDNATUREZA WHERE TBLNOTAFISCAL.IDDETALHENOTA='''+ lbl_edtTrazerNota.Text +'''');
      ibTempNF.Open;

      IDTransp := ibTempNF.FieldByName('IDTRANSPORTADORA').AsInteger;
      (ibTempNF.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempNF.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempNF.FieldByName('TOTALNOTA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      if lbl_edtNNotaImprimir.Text <> '' Then begin

      IDNumeroNota := StrToInt(lbl_edtNNotaImprimir.Text);
      NumeroNota := FormatFloat('000000',IDNumeroNota);

      end;

      SaidaNF   := ibTempNF.FieldByName('SaidaNF').AsString;
      EntradaNF := ibTempNF.FieldByName('EntradaNF').AsString;
////////////////////////////////////////////////////////////////////////////////

    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    Commit(ibCadastro);
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE(TBLCADASTRO.IDCAD=''' + InttoStr(IDTransp) + ''')');
    ibCadastro.Open;

    Commit(ibLogradouro);
    ibLogradouro.Close;
    ibLogradouro.SQL.Clear;
    ibLogradouro.SQL.Add('SELECT * FROM TBLLOGRADOURO WHERE IDCAD=''' + IntToStr(IDTransp) + '''');
    ibLogradouro.Open;

////////////////////////////////////////////////////////////////////////////////

    ibConfigNota.Close;
    ibConfigNota.SQL.Clear;
    ibConfigNota.SQL.Add('SELECT * FROM TBLCONFIGNOTA');
    ibConfigNota.Open;

    NumeroNotaFiscalH            := (ibConfigNota.FieldByName('NUMERONOTAFISCALHORIZ').AsInteger);
    NumeroNotaFiscalV            := (ibConfigNota.FieldByName('NUMERONOTAFISCALVERT').AsInteger);
    Entradahoriz                 := (ibConfigNota.FieldByName('ENTRADANFHORIZ').AsInteger);
    EntradaVert                  := (ibConfigNota.FieldByName('ENTRADANFVERT').AsInteger);
    Saidahoriz                   := (ibConfigNota.FieldByName('SAIDANFHORIZ').AsInteger);
    Saidavert                    := (ibConfigNota.FieldByName('SAIDANFVERT').AsInteger);
    NomeNaturezaHoriz            := (ibConfigNota.FieldByName('NOMENATUREZAHORIZ').AsInteger);
    NomeNaturezaVert             := (ibConfigNota.FieldByName('NOMENATUREZAVERT').AsInteger);
    CodNaturezaHoriz             := (ibConfigNota.FieldByName('NATUREZACODHORIZ').AsInteger);
    CodNaturezaVert              := (ibConfigNota.FieldByName('NATUREZACODVERT').AsInteger);
    NomeCliHoriz                 := (ibConfigNota.FieldByName('CLIENTEHORIZ').AsInteger);
    NomeCliVert                  := (ibConfigNota.FieldByName('CLIENTEVERT').AsInteger);
    CnpjHoriz                    := (ibConfigNota.FieldByName('CNPJHORIZ').AsInteger);
    CnpjVert                     := (ibConfigNota.FieldByName('CNPJVERT').AsInteger);
    DataEmissaoHoriz             := (ibConfigNota.FieldByName('DATAEMISSAOHORIZ').AsInteger);
    DataEmissaoVert              := (ibConfigNota.FieldByName('DATAEMISSAOVERT').AsInteger);
    EndCliHoriz                  := (ibConfigNota.FieldByName('ENDCLIENTEHORIZ').AsInteger);
    EndCliVert                   := (ibConfigNota.FieldByName('ENDCLIENTEVERT').AsInteger);
    BairroCliHoriz               := (ibConfigNota.FieldByName('BAIRROCLIENTEHORIZ').AsInteger);
    BairroCliVert                := (ibConfigNota.FieldByName('BAIRROCLIENTEVERT').AsInteger);
    CepHoriz                     := (ibConfigNota.FieldByName('CEPCLIENTEHORIZ').AsInteger);
    CepVert                      := (ibConfigNota.FieldByName('CEPCLIENTEVERT').AsInteger);
    DataSEHoriz                  := (ibConfigNota.FieldByName('DATANFSAIDAENTRADAHORIZ').AsInteger);
    DataSEVert                   := (ibConfigNota.FieldByName('DATANFSAIDAENTRADAVERT').AsInteger);
    MunicipioHoriz               := (ibConfigNota.FieldByName('MUNICIPIOCLIENTEHORIZ').AsInteger);
    MunicipioVert                := (ibConfigNota.FieldByName('MUNICIPIOCLIENTEVERT').AsInteger);
    FoneCliHoriz                 := (ibConfigNota.FieldByName('FONECLIENTEHORIZ').AsInteger);
    FoneCliVert                  := (ibConfigNota.FieldByName('FONECLIENTEVERT').AsInteger);
    UFHoriz                      := (ibConfigNota.FieldByName('UFCLIENTEHORIZ').AsInteger);
    UFVert                       := (ibConfigNota.FieldByName('UFCLIENTEVERT').AsInteger);
    IEHoriz                      := (ibConfigNota.FieldByName('IECLIENTEHORIZ').AsInteger);
    IEVert                       := (ibConfigNota.FieldByName('IECLIENTEVERT').AsInteger);
    NFaturaHoriz                 := (ibConfigNota.FieldByName('NUMEROFATURAHORIZ').AsInteger);
    NFaturaVert                  := (ibConfigNota.FieldByName('NUMEROFATURAVERT').AsInteger);
    VctoFaturaHoriz              := (ibConfigNota.FieldByName('DATAFATURAHORIZ').AsInteger);
    VctoFaturaVert               := (ibConfigNota.FieldByName('DATAFATURAVERT').AsInteger);
    ValorFaturaHoriz             := (ibConfigNota.FieldByName('VLRFATURAHORIZ').AsInteger);
    ValorFaturaVert              := (ibConfigNota.FieldByName('VLRFATURAVERT').AsInteger);
    CodProdHoriz                 := (ibConfigNota.FieldByName('CODPRODHORIZ').AsInteger);
    CodProdVert                  := (ibConfigNota.FieldByName('CODPRODVERT').AsInteger);
    NomeProdHoriz                := (ibConfigNota.FieldByName('NOMEPRODHORIZ').AsInteger);
    NomeProdVert                 := (ibConfigNota.FieldByName('NOMEPRODVERT').AsInteger);
    QtdeHoriz                    := (ibConfigNota.FieldByName('QTDEHORIZ').AsInteger);
    QtdeVert                     := (ibConfigNota.FieldByName('QTDEVERT').AsInteger);
    VlrUnitHoriz                 := (ibConfigNota.FieldByName('VLRUNITHORIZ').AsInteger);
    VlrUnitVert                  := (ibConfigNota.FieldByName('VLRUNITVERT').AsInteger);
    VlrTotalHoriz                := (ibConfigNota.FieldByName('VLRTOTALHORIZ').AsInteger);
    VlrTotalVert                 := (ibConfigNota.FieldByName('VLRTOTALVERT').AsInteger);
    TotalProdutosHoriz           := (ibConfigNota.FieldByName('VLRTOTALPRODHORIZ').AsInteger);
    TotalProdutosVert            := (ibConfigNota.FieldByName('VLRTOTALPRODVERT').AsInteger);
    TotalVlrNotaHoriz            := (ibConfigNota.FieldByName('VLRTOTALNOTAHORIZ').AsInteger);
    TotalVlrNotaVert             := (ibConfigNota.FieldByName('VLRTOTALNOTAVERT').AsInteger);
    NomeTranspHoriz              := (ibConfigNota.FieldByName('NOMETRANSPHORIZ').AsInteger);
    NomeTranspVert               := (ibConfigNota.FieldByName('NOMETRANSPVERT').AsInteger);
    FreteContaHoriz              := (ibConfigNota.FieldByName('FRETECONTAHORIZ').AsInteger);
    FreteContaVert               := (ibConfigNota.FieldByName('FRETECONTAVERT').AsInteger);
    EndTranspHoriz               := (ibConfigNota.FieldByName('ENDTRANSPHORIZ').AsInteger);
    EndTranspVert                := (ibConfigNota.FieldByName('ENDTRANSPVERT').AsInteger);
    QuantidadeHoriz              := (ibConfigNota.FieldByName('QTDEITENSHORIZ').AsInteger);
    QuantidadeVert               := (ibConfigNota.FieldByName('QTDEITENSVERT').AsInteger);
    EspecieHoriz                 := (ibConfigNota.FieldByName('ESPECIEHORIZ').AsInteger);
    EspecieVert                  := (ibConfigNota.FieldByName('ESPECIEVERT').AsInteger);
    PBrutoHoriz                  := (ibConfigNota.FieldByName('PESOBRUTOHORIZ').AsInteger);
    PBrutoVert                   := (ibConfigNota.FieldByName('PESOBRUTOVERT').AsInteger);
    PLiqHoriz                    := (ibConfigNota.FieldByName('PESOLIQHORIZ').AsInteger);
    PLiqVert                     := (ibConfigNota.FieldByName('PESOLIQVERT').AsInteger);
    DadosAdHoriz                 := (ibConfigNota.FieldByName('DADOSADHORIZ').AsInteger);
    DadosAdVert                  := (ibConfigNota.FieldByName('DADOSADVERT').AsInteger);
    NNotaCanhotoHoriz            := (ibConfigNota.FieldByName('NUMERONOTACANHOTOCOL').AsInteger);
    NNotaCanhotoVert             := (ibConfigNota.FieldByName('NUMERONOTACANHOTOLINH').AsInteger);
    VlrParcHoriz                 := (ibConfigNota.FieldByName('VLRPARCELADOCOL').AsInteger);
    VlrParcVert                  := (ibConfigNota.FieldByName('VLRPARCELADOLINH').AsInteger);
    VctoParcHoriz                := (ibConfigNota.FieldByName('VCTOPARCELADOCOL').AsInteger);
    VctoParcVert                 := (ibConfigNota.FieldByName('VCTOPARCELADOLINH').AsInteger);

////////////////////////////////////////////////////////////////////////////////

  IndiceHorizontal := Printer.PageWidth / 960;
  IndiceVertical := Printer.PageHeight / 792;
  Printer.BeginDoc;

  with Printer.Canvas do begin

    Colunanumeronf  := Round(NumeroNotaFiscalH * IndiceHorizontal);
    Linhanumeronf   := Round(NumeroNotaFiscalV * IndiceVertical);
    Colsaidanf      := Round(Saidahoriz * IndiceHorizontal);
    Lsaidanf        := Round(Saidavert * IndiceVertical);
    Colentradanf    := Round(Entradahoriz * IndiceHorizontal);
    Lentradanf      := Round(EntradaVert * IndiceVertical);
    Colnomenatnf    := Round(NomeNaturezaHoriz * IndiceHorizontal);
    Linhanomenatnf  := Round(NomeNaturezaVert * IndiceVertical);
    Colcodnatnf     := Round(CodNaturezaHoriz * IndiceHorizontal);
    Linhacodnatnf   := Round(CodNaturezaVert * IndiceVertical);
    ColNomeCli      := Round(NomeCliHoriz * IndiceHorizontal);
    LinhNomeCli     := Round(NomeCliVert * IndiceVertical);
    ColCnpj         := Round(CnpjHoriz * IndiceHorizontal);
    LinhCnpj        := Round(CnpjVert * IndiceVertical);
    ColDataEmissao  := Round(DataEmissaoHoriz * IndiceHorizontal);
    LinhDataEmissao := Round(DataEmissaoVert * IndiceVertical);
    ColEndCli       := Round(EndCliHoriz * IndiceHorizontal);
    LinhEndCli      := Round(EndCliVert * IndiceVertical);
    ColBairroCli    := Round(BairroCliHoriz * IndiceHorizontal);
    LinhBairroCli   := Round(BairroCliVert * IndiceVertical);
    ColCep          := Round(CepHoriz * IndiceHorizontal);
    LinhCep         := Round(CepVert * IndiceVertical);
    ColDataSE       := Round(DataSEHoriz * IndiceHorizontal);
    LinhDataSE      := Round(DataSEVert * IndiceVertical);
    ColMunicipio    := Round(MunicipioHoriz * IndiceHorizontal);
    LinhMunicipio   := Round(MunicipioVert * IndiceVertical);
    ColFoneCli      := Round(FoneCliHoriz * IndiceHorizontal);
    LinhFoneCli     := Round(FoneCliVert * IndiceVertical);
    ColUF           := Round(UFHoriz * IndiceHorizontal);
    LinhUF          := Round(UFVert * IndiceVertical);
    ColIE           := Round(IEHoriz * IndiceHorizontal);
    LinhIE          := Round(IEVert * IndiceVertical);
    ColNFatura      := Round(NFaturaHoriz * IndiceHorizontal);
    LinhNFatura     := Round(NFaturaVert * IndiceVertical);
    ColVctoFatura   := Round(VctoFaturaHoriz * IndiceHorizontal);
    LinhVctoFatura  := Round(VctoFaturaVert * IndiceVertical);
    ColValorFatura  := Round(ValorFaturaHoriz * IndiceHorizontal);
    LinhValorFatura := Round(ValorFaturaVert * IndiceVertical);
    ColCodProd      := Round(CodProdHoriz * IndiceHorizontal);
    LinhCodProd     := Round(CodProdVert * IndiceVertical);
    LinhaCodAd      := Round(CodProdVert+8 * IndiceVertical);
    ColNomeProd     := Round(NomeProdHoriz * IndiceHorizontal);
    LinhNomeProd    := Round(NomeProdVert * IndiceVertical);
    LinhaProdAd     := Round(NomeProdVert+8 * IndiceVertical);
    ColQtde         := Round(QtdeHoriz * IndiceHorizontal);
    LinhQtde        := Round(QtdeVert * IndiceVertical);
    LinhaQtdeAd     := Round(QtdeVert+8 * IndiceVertical);
    ColVlrUnit      := Round(VlrUnitHoriz * IndiceHorizontal);
    LinhVlrUnit     := Round(VlrUnitVert * IndiceVertical);
    LinhaVlrUnitAd  := Round(VlrUnitVert+8 * IndiceVertical);
    ColVlrTotal     := Round(VlrTotalHoriz * IndiceHorizontal);
    LinhVlrTotal    := Round(VlrTotalVert * IndiceVertical);
    LinhaVlrTotalAd := Round(VlrTotalVert+8 * IndiceVertical);
    ColTotalProdutos   := Round(TotalProdutosHoriz * IndiceHorizontal);
    LinhTotalProdutos  := Round(TotalProdutosVert * IndiceVertical);
    ColTotalVlrNota    := Round(TotalVlrNotaHoriz * IndiceHorizontal);
    LinhTotalVlrNota   := Round(TotalVlrNotaVert * IndiceVertical);
    ColNomeTransp      := Round(NomeTranspHoriz * IndiceHorizontal);
    LinhNomeTransp     := Round(NomeTranspVert * IndiceVertical);
    ColFreteConta      := Round(FreteContaHoriz * IndiceHorizontal);
    LinhFreteConta     := Round(FreteContaVert * IndiceVertical);
    ColEndTransp    := Round(EndTranspHoriz * IndiceHorizontal);
    LinhEndTransp   := Round(EndTranspVert * IndiceVertical);
    ColQuantidade   := Round(QuantidadeHoriz * IndiceHorizontal);
    LinhQuantidade  := Round(QuantidadeVert * IndiceVertical);
    ColEspecie      := Round(EspecieHoriz * IndiceHorizontal);
    LinhEspecie     := Round(EspecieVert * IndiceVertical);
    ColPBruto       := Round(PBrutoHoriz * IndiceHorizontal);
    LinhPBruto      := Round(PBrutoVert * IndiceVertical);
    ColPLiq         := Round(PLiqHoriz * IndiceHorizontal);
    LinhPLiq        := Round(PLiqVert * IndiceVertical);
    ColDadosAd      := Round(DadosAdHoriz * IndiceHorizontal);
    LinhDadosAd     := Round(DadosAdVert * IndiceVertical);
    ColNNotaCanhotoHoriz := Round(NNotaCanhotoHoriz * IndiceHorizontal);
    LinhNNotaCanhotoVert := Round(NNotaCanhotoVert * IndiceVertical);
    ColVctoParc          := Round(VctoParcHoriz * IndiceHorizontal);
    LinhVctoParc         := Round(VctoParcVert * IndiceVertical);
    ColVlrParc           := Round(VlrParcHoriz * IndiceHorizontal);
    LinhVlrParc          := Round(VlrParcVert * IndiceVertical);

    TextOut(colunanumeronf, linhanumeronf, NumeroNota);

    if ibTempNF.FieldByName('SaidaNF').AsString <> '' Then begin
    TextOut(Colsaidanf, Lsaidanf,ibTempNF.FieldByName('SaidaNF').AsString);
    end;
    if ibTempNF.FieldByName('EntradaNF').AsString <> '' Then begin
    TextOut(Colentradanf, Lentradanf,ibTempNF.FieldByName('EntradaNF').AsString);
    end;

    TextOut(Colnomenatnf, Linhanomenatnf,ibTempNF.FieldByName('NomeNat').AsString);
    TextOut(Colcodnatnf, Linhacodnatnf,ibTempNF.FieldByName('NATUREZA_COD').AsString);
    TextOut(ColNomeCli, LinhNomeCli,ibTempNF.FieldByName('Cliente').AsString);
    TextOut(ColCnpj, LinhCnpj,ibTempNF.FieldByName('CNPJ_CPF').AsString);
    TextOut(ColDataEmissao, LinhDataEmissao,ibTempNF.FieldByName('DtNota').AsString);

    TextOut(ColEndCli, LinhEndCli,ibTempNF.FieldByName('EndCliForn').AsString);
    TextOut(ColBairroCli, LinhBairroCli,ibTempNF.FieldByName('BairroCliForn').AsString);
    TextOut(ColCep, LinhCep,ibTempNF.FieldByName('CEP').AsString);
    TextOut(ColDataSE, LinhDataSE,ibTempNF.FieldByName('DtNota').AsString);

    TextOut(ColMunicipio, LinhMunicipio,ibTempNF.FieldByName('Municipio').AsString);
    TextOut(ColFoneCli, LinhFoneCli,ibTempNF.FieldByName('TELEFONE').AsString);
    TextOut(ColUF, LinhUF,ibTempNF.FieldByName('UF').AsString);
    TextOut(ColIE, LinhIE,ibTempNF.FieldByName('IE_RG').AsString);

    TextOut(ColNFatura, LinhNFatura,NumeroNota);
    TextOut(ColVctoFatura, LinhVctoFatura,ibTempNF.FieldByName('DtNota').AsString);
    TextOut(ColValorFatura, LinhValorFatura,FormatFloat(CasasDecimais('Produtos'),ibTempNF.FieldByName('TOTALNOTA').AsFloat)); 
////////////////////////////////////////////////////////////////////////////////

              {  AssignFile(Arquivo,'LPT1');
                Rewrite(Arquivo);
                T := 0;

               // DataConvertida := FormatDateTime('DD/MM/YYYY',Now); }

    Commit(ibDetalheNota);
    ibDetalheNota.Close;
    ibDetalheNota.SQL.Clear;
    ibDetalheNota.SQL.Add('SELECT * FROM TBLDETALHENOTA WHERE IDNOTA=''' + lbl_edtTrazerNota.Text + '''');
    ibDetalheNota.Open;

    while not ibDetalheNota.Eof do begin

  //  Total     := FormatFloat(CasasDecimais('Produtos'),ibDetalheNota.FieldByName('VALORPARCELADO').AsFloat);
  //  DataConvertida := FormatDateTime('DD/MM/YYYY',ibDetalheNota.FieldByName('VCTOPARCELADO').AsDateTime);
  //  Writeln(Arquivo,('Vlr.: '+Total+'  Data:'+DataConvertida));

      TextOut(ColVctoParc, LinhVctoParc,ibDetalheNota.FieldByName('VCTOPARCELADO').AsString);
      TextOut(ColVlrParc, LinhVlrParc,FormatFloat(CasasDecimais('Produtos'),ibDetalheNota.FieldByName('VALORPARCELADO').AsFloat));

      ibDetalheNota.Next;

    end;//while

    //CloseFile(Arquivo);
////////////////////////////////////////////////////////////////////////////////

    while not ibTempNF.Eof do begin


      TextOut(ColCodProd, LinhCodProd,ibTempNF.FieldByName('REF').AsString);
      TextOut(ColNomeProd, LinhNomeProd,ibTempNF.FieldByName('Produto').AsString);
      TextOut(ColQtde,LinhQtde,FormatFloat('0',ibTempNF.FieldByName('QTDE').AsFloat));
      TextOut(ColVlrUnit, LinhVlrUnit,FormatFloat(CasasDecimais('Produtos'),ibTempNF.FieldByName('VLRUNIT').AsFloat));
      TextOut(ColVlrTotal,LinhVlrTotal,FormatFloat(CasasDecimais('Produtos'),ibTempNF.FieldByName('VLRTOTAL').AsFloat));

     LinhCodProd  := LinhCodProd + Round(10 * IndiceVertical);
     LinhNomeProd := LinhNomeProd + Round(10 * IndiceVertical);
     LinhQtde     := LinhQtde + Round(10 * IndiceVertical);
     LinhVlrUnit  := LinhVlrUnit + Round(10 * IndiceVertical);
     LinhVlrTotal := LinhVlrTotal + Round(10 * IndiceVertical);

      ibTempNF.Next;

    end;//while

    For Contador:= 1 to (20- ibTempNF.recordCount)do

      TextOut(ColTotalProdutos, LinhTotalProdutos,FormatFloat(CasasDecimais('Produtos'),ibTempNF.FieldByName('TOTALNOTA').AsFloat));
      TextOut(ColTotalVlrNota, LinhTotalVlrNota,FormatFloat(CasasDecimais('Produtos'),ibTempNF.FieldByName('TOTALNOTA').AsFloat));

      TextOut(ColNomeTransp, LinhNomeTransp,ibCadastro.FieldByName('NOME').AsString);
      TextOut(ColFreteConta, LinhFreteConta,ibTempNF.FieldByName('FreteConta').AsString);
      TextOut(ColEndTransP, LinhEndTransp,ibLogradouro.FieldByName('ENDERECO').AsString);
      TextOut(ColQuantidade, LinhQuantidade,ibTempNF.FieldByName('QTDEITENS').AsString);
      TextOut(ColEspecie, LinhEspecie,ibTempNF.FieldByName('TipoEspecie').AsString);
      TextOut(ColPBruto, LinhPBruto,ibTempNF.FieldByName('PesoNota').AsString);
      TextOut(ColPLiq, LinhPLiq,ibTempNF.FieldByName('PESOBRUTO').AsString);

      for i:=0 to memoObs.Lines.Count -1 do begin

      TextOut(ColDadosAd,LinhDadosAd,memoObs.Lines[i]);

      LinhDadosAd := LinhDadosAd + 20;

      if

      LinhDadosAd >LinhDadosAd Then begin

      TextOut(ColDadosAd,LinhDadosAd,memoObs.Lines[i]);

      end;
      end; 

      TextOut(ColNNotaCanhotoHoriz, LinhNNotaCanhotoVert,lbl_edtNNotaImprimir.Text); 

    Printer.EndDoc;

  end;//with printer


    end;//lbltrazer nota

  end;//with

end;

procedure TfrmNotaFiscal.dbgNotaFiscalCellClick(Column: TColumn);

var
i : Integer;
begin

  with dmModule do begin

    IDNota := ibNotaFiscal.FieldByName('IDNOTA').AsInteger;

    if ibNotaFiscal.RecordCount > 0 Then begin

      lbl_edtRef.Text       := ibNotaFiscal.FieldByName('REF').AsString;
      lbl_edtCodBarras.Text := ibNotaFiscal.FieldByName('CODBARRAS').AsString;
      lbl_edtVlrUnitario.Text   := FormatFloat(CasasDecimais('Produtos'),ibNotaFiscal.FieldByName('VLRUNIT').AsFloat);
      lbl_edtQtde.Text      := FormatFloat(CasasDecimais('Produtos'),ibNotaFiscal.FieldByName('QTDE').AsFloat);
      lbl_edtTotal.Text := FormatFloat(CasasDecimais('Produtos'),ibNotaFiscal.FieldByName('VLRTOTAL').AsFloat);

      for i:=0 to cboProd.Items.Count -1 do begin
        if TClasseCombo( cboProd.Items.Objects[i]).ID = ibNotaFiscal.FieldByName('IDPRODNOTA').AsInteger then begin
          cboProd.ItemIndex:= i;
          Break;
        end else begin
          cboProd.ClearSelection;
        end;
      end;//for

    end;//if recordcount


  end;//with

end;

procedure TfrmNotaFiscal.cboClienteClick(Sender: TObject);
var

i : Integer;
IDDadosCliente : TClasseCombo;
StringDadosCliente : String;
begin

  with dmModule do begin

    if cboCliente.ItemIndex <> - 1 Then begin

      IDDadosCliente := TClasseCombo(cboCliente.Items.Objects[cboCliente.ItemIndex]);
      StringDadosCliente := ' IDCAD=''' + IntToStr(IDDadosCliente.ID) + '''';

    end;{if}

    Commit(ibCadastro);
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,CONDICOESPAGAMENTO.DESCRICAO FROM TBLCADASTRO '
    + 'LEFT OUTER JOIN CONDICOESPAGAMENTO ON TBLCADASTRO.IDCONDPAGTO=CONDICOESPAGAMENTO.IDCONDPAGTO  WHERE ' + StringDadosCliente);
    ibCadastro.Open;

    lbl_edtNumero.Text  := ibCadastro.FieldByName('NUMERO').AsString;
    lbl_edtCep.Text     := FormatFloat('00000-000',ibCadastro.FieldByName('CEP').AsInteger);

    Commit(ibLogradouro);
    ibLogradouro.Close;
    ibLogradouro.SQL.Clear;
    ibLogradouro.SQL.Add('SELECT * FROM TBLLOGRADOURO WHERE ' + StringDadosCliente);
    ibLogradouro.Open;

    lbl_edtEnd.Text     := ibLogradouro.FieldByName('ENDERECO').AsString;
    lbl_edtBairro.Text  := ibLogradouro.FieldByName('BAIRRO').AsString;
    lbl_edtUF.Text      := ibLogradouro.FieldByName('ESTADO').AsString;

    Commit(ibDocumentacao);
    ibDocumentacao.Close;
    ibDocumentacao.SQL.Clear;
    ibDocumentacao.SQL.Add('SELECT * FROM TBLCADDOCUMENTACAO WHERE ' + StringDadosCliente);
    ibDocumentacao.Open;

    Commit(ibContato);
    ibContato.Close;
    ibContato.SQL.Clear;
    ibContato.SQL.Add('SELECT * FROM TBLCONTATO WHERE ' + StringDadosCliente);
    ibContato.Open;

//    lbl_edtCod.Text        := IntToStr(ibCadastro.FieldByName('IDCAD').AsInteger);
//    lbl_edtDDD.Text        := ibContato.FieldByName('DDD').AsString;
    lbl_edtTelefone.Text   := ibContato.FieldByName('CONTATO').AsString;
    lbl_edtCnpjCpf.Text    := ibDocumentacao.FieldByName('CNPJ_CPF').AsString;
    lbl_edtIE.Text         := ibDocumentacao.FieldByName('IE_RG').AsString;

    for i:=0 to cboCondPagto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboCondPagto.Items.Objects[i]).ID = ibCadastro.FieldByName('IDCONDPAGTO').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboCondPagto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboCondPagto.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}


  end;{with}


end;

procedure TfrmNotaFiscal.lbl_edtRefExit(Sender: TObject);

var

i : Integer;

begin

  with dmModule do begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
    + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
    + 'WHERE CADPRODUTOS.REF=''' + lbl_edtRef.Text + '''');
    ibProdutos.Open;

   { if lbl_TipoPreco.Caption = '' Then begin

      TipoPreco := 'A'

    end;}

   // if TipoPreco = 'A' Then begin

     if ibProdutos.RecordCount > 0 Then begin

      lbl_edtVlrUnitario.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
     // lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
    //  lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
     // lbl_TipoPreco.Caption := 'Preço de Venda(A)';
      lbl_edtQtde.Text := '1';
      lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRAS').AsString;
    //  lbl_NomeProd.Caption  := ibProdutos.FieldByName('NOME').AsString;

   // end;

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

      //lbl_edtQtde.SetFocus;

      for i:=0 to cboProd.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboProd.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboProd.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboProd.ClearSelection;//LIMPA A SELECAO. }
        end;{if}
      end;{for}


     { for i:=0 to cboFornecedores.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboFornecedores.Items.Objects[i]).ID = ibProdutos.FieldByName('FORNECEDOR').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboFornecedores.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboFornecedores.ClearSelection;//LIMPA A SELECAO. }
      //  end;{if}
     // end;{for}

     end;//if recordcount

  end;//with

end;

procedure TfrmNotaFiscal.lbl_edtRefKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtQtde.SetFocus;

  end;//if

end;

procedure TfrmNotaFiscal.cboProdClick(Sender: TObject);

var

i : Integer;
IDDadosProd : TClasseCombo;
StringDadosProd : String;

begin

  with dmModule do begin

    if cboProd.ItemIndex <> - 1 Then begin

      IDDadosProd := TClasseCombo(cboProd.Items.Objects[cboProd.ItemIndex]);
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

      if ibProdutos.RecordCount > 0 Then begin

       { for i:=0 to cboCondPagto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
          if TClasseCombo( cboCondPagto.Items.Objects[i]).ID = ibProdutos.FieldByName('IDCONDPAGTO').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
            cboCondPagto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
            Break;
          end else begin
            cboCondPagto.ClearSelection;}//LIMPA A SELECAO.
       //   end;{if}
       // end;{for}

       { for i:=0 to cboFornecedores.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
          if TClasseCombo( cboFornecedores.Items.Objects[i]).ID = ibProdutos.FieldByName('FORNECEDOR').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
            cboFornecedores.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
            Break;
          end else begin
            cboFornecedores.ClearSelection;}//LIMPA A SELECAO.
         // end;{if}
      //  end;{for}

     {if lbl_TipoPreco.Caption = '' Then begin

        TipoPreco := 'A'

      end; }

      //if TipoPreco = 'A' Then begin

      lbl_edtVlrUnitario.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
     // lbl_edtTotalProd.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
    //  lbl_Valor.Caption := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
     // lbl_TipoPreco.Caption := 'Preço de Venda(A)';
      lbl_edtQtde.Text := '1';
      lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRAS').AsString;

   // end;

  {  if TipoPreco = 'B' Then begin

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

    end;}

    lbl_edtQtde.SetFocus;
    
      end;//if recordcount

  end;{with}


end;

procedure TfrmNotaFiscal.lbl_edtTrazerNotaKeyPress(Sender: TObject;
  var Key: Char);
begin

  with dmModule do begin

    if key =#13 Then begin

      if lbl_edtTrazerNota.Text <> '' Then begin

        Commit(ibNotaFiscal);
        ibNotaFiscal.Close;
        ibNotaFiscal.SQL.Clear;
        ibNotaFiscal.SQL.Add('SELECT TBLNOTAFISCAL.*,TBLCADASTRO.NOME As Cliente,'
        + 'CADPRODUTOS.NOME As Produto,CADPRODUTOS.REF,CADPRODUTOS.CODBARRAS,NATUREZA.DESCRICAO As TipoNatureza,'
        + 'CONDICOESPAGAMENTO.DESCRICAO As CondPagto,TBLDETALHENOTA.OBS FROM TBLNOTAFISCAL '
        + 'INNER JOIN TBLCADASTRO ON TBLNOTAFISCAL.IDCLINOTA=TBLCADASTRO.IDCAD '
        + 'INNER JOIN CADPRODUTOS ON TBLNOTAFISCAL.IDPRODNOTA=CADPRODUTOS.IDPROD '
        + 'INNER JOIN NATUREZA ON TBLNOTAFISCAL.IDNATUREZA=NATUREZA.IDNATUREZA '
        + 'INNER JOIN TBLDETALHENOTA ON TBLNOTAFISCAL.IDDETALHENOTA=TBLDETALHENOTA.IDDETALHE '
        + 'LEFT OUTER JOIN CONDICOESPAGAMENTO ON TBLNOTAFISCAL.IDCONDPAGTO=CONDICOESPAGAMENTO.IDCONDPAGTO WHERE TBLNOTAFISCAL.IDDETALHENOTA=''' + lbl_edtTrazerNota.Text + '''');
        ibNotaFiscal.Open;

        (ibNotaFiscal.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        (ibNotaFiscal.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

        memoObs.Text := ibNotaFiscal.FieldByName('OBS').AsString;

      end;//if

    end;//if

  end;//with

end;

procedure TfrmNotaFiscal.ibeaExcluirClick(Sender: TObject);

var
ConfirmaExclusao : Integer;
begin

  with dmModule do begin

    if cboProd.Text <> '' Then begin

    ConfirmaExclusao := Application.MessageBox('Confirma a exclusão do item?','Exclusão de registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

      if ConfirmaExclusao = 6 Then begin

        ibNotaFiscal.Close;
        ibNotaFiscal.SQL.Clear;
        ibNotaFiscal.SQL.Add('DELETE FROM TBLNOTAFISCAL WHERE IDNOTA=''' + IntToStr(IDNota) + '''');
        ibNotaFiscal.ExecSQL;

        Commit(ibNotaFiscal);
        ibNotaFiscal.Close;
        ibNotaFiscal.SQL.Clear;
        ibNotaFiscal.SQL.Add('SELECT TBLNOTAFISCAL.*,TBLCADASTRO.NOME As Cliente,'
        + 'CADPRODUTOS.NOME As Produto,NATUREZA.DESCRICAO As TipoNatureza,'
        + 'CONDICOESPAGAMENTO.DESCRICAO As CondPagto FROM TBLNOTAFISCAL '
        + 'INNER JOIN TBLCADASTRO ON TBLNOTAFISCAL.IDCLINOTA=TBLCADASTRO.IDCAD '
        + 'INNER JOIN CADPRODUTOS ON TBLNOTAFISCAL.IDPRODNOTA=CADPRODUTOS.IDPROD '
        + 'INNER JOIN NATUREZA ON TBLNOTAFISCAL.IDNATUREZA=NATUREZA.IDNATUREZA '
        + 'LEFT OUTER JOIN CONDICOESPAGAMENTO ON TBLNOTAFISCAL.IDCONDPAGTO=CONDICOESPAGAMENTO.IDCONDPAGTO WHERE TBLNOTAFISCAL.IDDETALHENOTA=''' + lbl_edtTrazerNota.Text + '''');
        ibNotaFiscal.Open;

        (ibNotaFiscal.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        (ibNotaFiscal.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


      end;//if confirma exclusao

    end;//if

  end;//with

end;

procedure TfrmNotaFiscal.lbl_edtDescExit(Sender: TObject);

var

Valor1,Valor2 : Real;


begin

  with dmModule do begin

     if lbl_edtDesc.Text <> '' Then begin

       if lbl_edtVlrUnitario.Text <> '' Then begin //se for diferente de branco executa rotina abaixo.

          if (Pos(',',lbl_edtVlrUnitario.Text)>0) and (lbl_edtVlrUnitario.Text <> '') Then begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtDesc.Text,ThousandSeparator,'',[rfReplaceAll]));
            lbl_edtTotal.Text := FormatFloat(',0.00',(Valor1 - Valor2));


          end else begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtDesc.Text,ThousandSeparator,'',[rfReplaceAll]));
            lbl_edtTotal.Text := FormatFloat(',0.00',(Valor1 - Valor2));


          end;{if}

        end;{if}

       lbl_edtDesc.Text := FormatFloat(CasasDecimais('Produtos'),StrToFloat(lbl_edtDesc.Text)); //FormatFloat(casa',0.00',StrToFloat(lbl_edtValor.Text));

     end;//if label desc

  end;{with}


end;

procedure TfrmNotaFiscal.lbl_edtAcrescimoExit(Sender: TObject);

var

Valor1,Valor2 : Real;


begin

  with dmModule do begin

    if lbl_edtAcrescimo.Text <> '' Then begin

       if lbl_edtVlrUnitario.Text <> '' Then begin //se for diferente de branco executa rotina abaixo.

          if (Pos(',',lbl_edtVlrUnitario.Text)>0) and (lbl_edtVlrUnitario.Text <> '') Then begin

            Valor1 := StrToFloat(StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtAcrescimo.Text,ThousandSeparator,'',[rfReplaceAll]));
            lbl_edtTotal.Text := FormatFloat(',0.00',(Valor1 + Valor2));


          end else begin

            Valor1 := StrToFloat(StringReplace(lbl_edtVlrUnitario.Text,ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtAcrescimo.Text,ThousandSeparator,'',[rfReplaceAll]));
            lbl_edtTotal.Text := FormatFloat(',0.00',(Valor1 + Valor2));


          end;{if}

        end;{if}

      lbl_edtAcrescimo.Text := FormatFloat(CasasDecimais('Produtos'),StrToFloat(lbl_edtAcrescimo.Text)); //FormatFloat(casa',0.00',StrToFloat(lbl_edtValor.Text));

    end;//if label acrescimo

    if (lbl_edtTotal.Text = '')and(lbl_edtDesc.Text = '') Then begin

      lbl_edtTotal.Text := lbl_edtVlrUnitario.Text;

    end;

  end;{with}


end;

procedure TfrmNotaFiscal.lbl_edtDescKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 Then begin

lbl_edtAcrescimo.SetFocus;

end; 

end;

procedure TfrmNotaFiscal.lbl_edtAcrescimoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 Then begin

lbl_edtTotal.SetFocus;

end;

end;

procedure TfrmNotaFiscal.lbl_edtVlrUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 Then begin

lbl_edtDesc.SetFocus;

end;

end;

procedure TfrmNotaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  with dmModule do begin

    case Key of

       VK_F7 :begin

         frmBuscaProdutos.ShowModal;

       end;//begin

    end;//case

  end;//with

end;

end.
