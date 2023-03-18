unit Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, IBEAntialiasButton, Grids, DBGrids,
  mxFlatControls, classComboBox,ADOdb,IBDatabase, IBCustomDataSet, IBQuery,
  IBStoredProc, Menus, RxGIF, Buttons, DB;

type
  TfrmClientes = class(TForm)
    pcCadastrodeclientes: TPageControl;
    tbsDadoscadastrais: TTabSheet;
    tbsAdicionaispista: TTabSheet;
    tbsCobrancafinanceiro: TTabSheet;
    tbsHistorico: TTabSheet;
    lbl_edtCodCliente: TLabeledEdit;
    lblData: TLabel;
    lbl_edtNomerazao: TLabeledEdit;
    lbl_edtNomeusual: TLabeledEdit;
    lbl_edtCnpj_cpf: TLabeledEdit;
    lblRAtividade: TLabel;
    lbl_edtIE_rg: TLabeledEdit;
    lbl_edtContato: TLabeledEdit;
    lbl_edtSite: TLabeledEdit;
    lbl_edtEmail: TLabeledEdit;
    Image1: TImage;
    lblDadoscliente: TLabel;
    Image2: TImage;
    lblEndereco: TLabel;
    lbl_edtEndereco: TLabeledEdit;
    lbl_edtBairro: TLabeledEdit;
    lbl_edtCep: TLabeledEdit;
    lbl_edtCidade: TLabeledEdit;
    lbl_edtEstado: TLabeledEdit;
    lbl_edtTelCom: TLabeledEdit;
    lbl_edtTelFax: TLabeledEdit;
    lbl_edtCelular: TLabeledEdit;
    lbl_edtIcm: TLabeledEdit;
    ibeaNovo: TIBEAntialiasButton;
    ibeaAlterar: TIBEAntialiasButton;
    ibeaExcluir: TIBEAntialiasButton;
    ibeaPrimeiro: TIBEAntialiasButton;
    ibeaAnterior: TIBEAntialiasButton;
    ibeaProximo: TIBEAntialiasButton;
    ibeaUltimo: TIBEAntialiasButton;
    ibeaSair: TIBEAntialiasButton;
    GroupBox1: TGroupBox;
    lbl_edtPesquisaCli: TLabeledEdit;
    dbgClientes: TDBGrid;
    Label3: TLabel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    lbl_Produto: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbl_edtVeiculo: TLabeledEdit;
    lbl_edtPlaca: TLabeledEdit;
    lbl_edtCidadecliente: TLabeledEdit;
    lbl_edtEstadocliente: TLabeledEdit;
    ibeaIncluir: TIBEAntialiasButton;
    cboCondpagto: TComboBox;
    dbgDetalheprod: TDBGrid;
    Image5: TImage;
    Label2: TLabel;
    cboBlocCred: TComboBox;
    Label4: TLabel;
    lbl_edtLimite: TLabeledEdit;
    Label14: TLabel;
    cboMotivo: TComboBox;
    GroupBox3: TGroupBox;
    lbl_edtEnd: TLabeledEdit;
    lbl_edtBairrocobr: TLabeledEdit;
    lbl_edtCepcobr: TLabeledEdit;
    lbl_edtCidadecobr: TLabeledEdit;
    lbl_edtEstCobr: TLabeledEdit;
    lbl_edtTelcobr: TLabeledEdit;
    lbl_edtEmailcobr: TLabeledEdit;
    Image6: TImage;
    Label15: TLabel;
    GroupBox4: TGroupBox;
    lbl_edtBco1cobr: TLabeledEdit;
    lbl_edtAg1cobr: TLabeledEdit;
    lbl_edtCccobr: TLabeledEdit;
    lbl_edtBco2cobr: TLabeledEdit;
    lbl_edtAg2cobr: TLabeledEdit;
    lbl_edtCc2cobr: TLabeledEdit;
    Label5: TLabel;
    dbgHistorico: TDBGrid;
    dtpDataCli: TmxFlatDateTimePicker;
    rdgrTipodecliente: TRadioGroup;
    ibeaConsultar: TIBEAntialiasButton;
    lblFuncionario: TLabel;
    lbl_edtNumero: TLabeledEdit;
    lbl_edtComplemento: TLabeledEdit;
    lbl_edtPontoreferencia: TLabeledEdit;
    lbl_edtObs: TLabeledEdit;
    lbl_edtDDD: TLabeledEdit;
    lbl_edtDDDFax: TLabeledEdit;
    cboProduto: TComboBox;
    cboRamoativ: TComboBox;
    dtpDataAd: TmxFlatDateTimePicker;
    Label6: TLabel;
    mxFlatPanel1: TmxFlatPanel;
    lblTracoAP: TLabel;
    lblClienteAP: TLabel;
    lblCodCli: TLabel;
    cboTipoProd: TComboBox;
    lbl_TipoProd: TLabel;
    lbl_edtQtde: TLabeledEdit;
    popmnuAdPista: TPopupMenu;
    AlterarAdicionalPista1: TMenuItem;
    cboFuncionario: TComboBox;
    sb_ord_cod: TSpeedButton;
    sb_ord_nome: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    Image7: TImage;
    mxFlatPanel2: TmxFlatPanel;
    lbl_TracoHistorico: TLabel;
    lbl_edtCliHistorico: TLabel;
    Label9: TLabel;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECT;
    procedure ExecSELECTTProd;
    procedure ExecCpagto;
    procedure ExecProd;
    procedure ExecFunc;
    procedure ExecSELECTAP;

    procedure AlteraCadastro;//serve para dar update na tblcadastro.
    procedure AlteraDocumentacao;//serve para dar update na tblcaddocumentacao.
    procedure AlteraLogradouro;//serva para dar update na tbllogradouro.
    procedure AlteraContato;//serva para dar update na tblcontato.
    procedure ExibeDadosCliente;
    procedure ExibeDadosAdicionalPista;

    procedure LimpaCampo;
    procedure LimpaAP;

    procedure DesabilitaCamposCli(opcao:Boolean);
    procedure DesabilitaCamposAP(opcao:Boolean);
    procedure DesabilitaCamposCf(opcao:Boolean);

    procedure FormShow(Sender: TObject);
    procedure ibeaNovoClick(Sender: TObject);
    procedure rdgrTipodeclienteClick(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure pcCadastrodeclientesChange(Sender: TObject);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgClientesCellClick(Column: TColumn);
    procedure ibeaPrimeiroClick(Sender: TObject);
    procedure ibeaAnteriorClick(Sender: TObject);
    procedure ibeaProximoClick(Sender: TObject);
    procedure ibeaUltimoClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure dbgDetalheprodCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure ibeaConsultarClick(Sender: TObject);
    procedure lbl_edtCepChange(Sender: TObject);
    procedure cboTipoProdClick(Sender: TObject);
    procedure lbl_edtPesquisaCliChange(Sender: TObject);
    procedure lbl_edtCepExit(Sender: TObject);
    procedure lbl_edtEnderecoExit(Sender: TObject);
    procedure AlterarAdicionalPista1Click(Sender: TObject);
    procedure lbl_edtCnpj_cpfExit(Sender: TObject);
    procedure lbl_edtTelComExit(Sender: TObject);
    procedure lbl_edtTelFaxExit(Sender: TObject);
    procedure lbl_edtCelularExit(Sender: TObject);
    procedure sb_ord_codClick(Sender: TObject);
    procedure sb_ord_nomeClick(Sender: TObject);
   
  private
    { Private declarations }
    FRamoAtividade : Boolean;
  public
    { Public declarations }
    property LimparRamoAtividade : Boolean Read FRamoAtividade Write FRamoAtividade;
  end;

var
  frmClientes: TfrmClientes;
  CancelaOp : Integer;
  ConfirmaMSG : Integer;

  IDCad : Integer;//variavel para armazenar o codigo do do cliente na alteracao de dados.
  IDCadAP : Integer;
  IDCadnovo : Integer;
  IDadpista : Integer;
  IDClass : Integer; // variavel para trazer dados da tbl de classificacao
  Icms : Integer;//atribui valor ao vlr de icm
  Cep : Integer; //variavel para atribuir o vlr do cep.
  AlteraCep : Boolean;
  AlteraEnd : Boolean;
  MontaColunas : Boolean; //VARIAVEL USADA PARA DETERMINAR SE A COLUNA JÀ FOI CRIADA OU NÃO
  MontaColAP : Boolean;
  IDClassTelcom : Integer;//variavel para armazenar a classificação do campo telcoml
  IDClassTelfax: Integer; //variavel para armazenar a classificação do campo telfax
  IDClassTelCel: Integer;//variável para armazenar a classificacao do campo celular.
  IDClassEmail: Integer;//variavel para armazenar a classificação do campo email
  IDClassSite: Integer;//variavel para armazenar a classificação do campo site
  IDClassContato: Integer;// variavel para armazenar a classificação do campo contato
  IDClassNomeFantasia: Integer;//variavel para atribuir o nome fantasia.
  IDClassCnpj: Integer;//variavel para atribuir o cnpj_cpf.
  IDClassPagto : Integer;
  ClassCli : TClasseCombo;
  ClassCliAP : TClasseCombo;
  ClassFunc : TClasseCombo;
  ClassProd : TClasseCombo;
  ClassRamoAtiv : TClasseCombo;
  ClassPagto : TClasseCombo;
  ClassTipoProd : TClasseCombo;
  IDTipoProd : TClasseCombo;
  IDProduto : TClasseCombo;
  StringFunc : String;
  StringProd : String;
  StringRamoAtiv : String;
  StringPagto : String;
  StringTipoProd : String;
  StringCliAP : String;
  CEPTemp : String;
  IDClassfunc : integer;
  IDClassRamoAtiv : Integer;
  IDClassProd : Integer;
  TipoPessoa : Integer;
  LimpaDadosAP : Integer;

  ibTempCep  : TIBQuery;//atribui valor a componente criado

  MontaColHistorico : Boolean;

  implementation

uses dataModule, BuscaClientes, funcPosto;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
Function CGC(CGC : string): string;
beginResult := Copy(CGC,1,2)+'.'+Copy(CGC,3,3)+'.'+Copy(CGC,6,3)+'/'+Copy(CGC,9,4)+'-'+Copy(CGC,13,2);end;
////////////////////////////////////////////////////////////////////////////////
Function CPF(CPF : string): string;
beginResult := Copy(CPF,1,3)+'.'+Copy(CPF,4,3)+'.'+Copy(CPF,7,3)+'-'+Copy(CPF,10,2);end;////////////////////////////////////////////////////////////////////////////////

procedure TfrmClientes.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmClientes.ExecCpagto;
begin

  with dmModule do begin

    //TRAZ OS COND. DE PAGTO NO COMBO
    ibCondicoesPagto.Close;
    ibCondicoesPagto.SQL.Clear;
    ibCondicoesPagto.SQL.Add('SELECT *  FROM CONDICOESPAGAMENTO');
    ibCondicoesPagto.Open;

    cboCondpagto.Clear; //LIMPA O COMBOBOX COND. PAGTO.
    while not ibCondicoesPagto.Eof do begin
      ClassPagto    := TClasseCombo.Create;
      ClassPagto.ID  := ibCondicoesPagto.FieldByName('IDCONDPAGTO').AsInteger;
      cboCondpagto.Items.AddObject(ibCondicoesPagto.FieldByName('DESCRICAO').AsString,ClassPagto);
      ibCondicoesPagto.Next;
    end; {while}

  end; {with}

end;

procedure TfrmClientes.ExecProd;
begin
  with dmModule do begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS');
    ibProdutos.Open;

    cboProduto.Clear; //LIMPA O COMBOBOX DE PRODUTO
    while not ibProdutos.Eof do begin
      ClassProd    := TClasseCombo.Create;
      ClassProd.ID  := ibProdutos.FieldByName('IDPROD').AsInteger;
      cboProduto.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,ClassProd);
      ibProdutos.Next;
    end;
  end;
end;

procedure TfrmClientes.ExecFunc;
begin
  with dmModule do begin

    ibClassificacao.Open;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Funcionario''');
    ibClassificacao.Open;
    IDClassfunc := ibClassificacao.FieldByName('IDCLASS').AsInteger;


    //BUSCA TODOS OS FUNCIONARIOS QUE ESTEJAM NA CLASSIFICAÇÃO DE FUNCIONARIOS
    ibFuncionario.Open;
    ibFuncionario.SQL.Clear;
    ibFuncionario.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClassfunc) + ''' ORDER BY NOME');
    ibFuncionario.Open;

    //traz dados do funcionario no combo
    cboFuncionario.Clear; //LIMPA O COMBOBOX
    while not ibFuncionario.Eof do begin
      ClassFunc    := TClasseCombo.Create;//ATRIBUI A CLASSE CRIADA NA VARIAVEL
      ClassFunc.ID  := ibFuncionario.FieldByName('IDCAD').AsInteger;//ATRIBUI A IDENTIFICACAO DO FUNCIONARIO ATRAVES DO ID NA VARIAVEL.
      cboFuncionario.Items.AddObject(ibFuncionario.FieldByName('NOME').AsString,ClassFunc);//TRAZ OS ITENS ADICIONADOS AO OBJETO SELECIONADO NO COMBO E A DESCRICAO DO FUNCIONARIO.
      ibFuncionario.Next;
    end;
  end;
end;

procedure TfrmClientes.ExecSELECT;  //procedimento para executar (abrir) a sql
begin
  with dmModule do begin

    //SE FOR VERDADEIRO OU SEJA SE ESTIVER NA PRIMEIRA PAGINA ABRE O CADASTRO DE CLIENTE.
      if pcCadastrodeclientes.ActivePage.TabIndex = 0 Then begin
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
        ibClassificacao.Open;
        IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.

        //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
        ibCadastro.Close;
        ibCadastro.SQL.Clear;
        ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLRAMOATIV.NOME As RamoAtividade,'
        + ' TBLCADDOCUMENTACAO.NOMEFANTASIA As NomeFantasia,TBLCADDOCUMENTACAO.CODIGO FROM TBLCADASTRO '
        + ' LEFT OUTER JOIN tblcaddesativados ON TBLCADASTRO.IDCAD=tblcaddesativados.idcad '
        + ' LEFT OUTER JOIN TBLRAMOATIV ON TBLCADASTRO.IDRAMOATIV = TBLRAMOATIV.IDRAMO '
        + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
        + ' WHERE (TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''') ORDER BY TBLCADASTRO.IDCAD DESC');
        ibCadastro.Open;

        if LimparRamoAtividade Then begin //CASO A VAR ESTEJA SEJA COMO TRUE, IRÁ LIMPAR E ADICIONAR OS REGISTROS

          ibRativ.Close;
          ibRativ.SQL.Clear;
          ibRativ.SQL.Add('SELECT * FROM TBLRAMOATIV');
          ibRativ.Open;

          cboRamoativ.Clear; //LIMPA O COMBOBOX DE RAMO ATIVIDADE
          while not ibRativ.Eof do begin
            ClassRamoAtiv     := TClasseCombo.Create;
            ClassRamoAtiv.ID  := ibRativ.FieldByName('IDRAMO').AsInteger;
            cboRamoativ.Items.AddObject(ibRativ.FieldByName('NOME').AsString,ClassRamoAtiv);
            ibRativ.Next;
          end; {while}

        end; {if}

     end; {if}

  end; {with}

end;

procedure TfrmClientes.ExecSELECTAP;
begin

  with dmModule do begin

    ibAdicionalpista.Close;
    ibAdicionalpista.SQL.Clear;
    ibAdicionalpista.SQL.Add('SELECT ADICIONALPISTA.*,TBLCADASTRO.NOME, CADPRODUTOS.NOME As Produto '
    + ' FROM ADICIONALPISTA LEFT OUTER JOIN TBLCADASTRO ON ADICIONALPISTA.IDCAD = TBLCADASTRO.IDCAD '
    + ' LEFT OUTER JOIN CADPRODUTOS ON ADICIONALPISTA.IDPROD = CADPRODUTOS.IDPROD'
    + ' WHERE (ADICIONALPISTA.IDCAD=''' + IntToStr(IDCad) + ''')');
    ibAdicionalpista.Open;

  end;
end;

procedure TfrmClientes.ExecSELECTTProd;
begin
  with dmModule do begin

      ibTipoProd.Close;
      ibTipoProd.SQL.Clear;
      ibTipoProd.SQL.Add('SELECT * FROM TBLTIPOPRODUTO');
      ibTipoProd.Open;

    //traz dados do funcionario no combo
    cboTipoProd.Clear; //LIMPA O COMBOBOX

    while not ibTipoProd.Eof do begin

   //   cboTipoProd.Items.Add(ibTipoProd.FieldByName('NOME').AsString);
      ClassTipoProd    := TClasseCombo.Create;
      ClassTipoProd.ID  := ibTipoProd.FieldByName('IDTIPOPROD').AsInteger;
      cboTipoProd.Items.AddObject(ibTipoProd.FieldByName('NOME').AsString,ClassTipoProd);
      ibTipoProd.Next;

    end;
  end;
end;

procedure TfrmClientes.DesabilitaCamposCli(opcao:Boolean);
begin
  lbl_edtCodCliente.Enabled := opcao;
  rdgrTipodecliente.Enabled := opcao;
  dtpDataCli.Enabled := opcao;
  lbl_edtIcm.Enabled := opcao;
  lbl_edtNomerazao.Enabled := opcao;
  lbl_edtNomeusual.Enabled := opcao;
  cboRamoativ.Enabled := opcao;
  lbl_edtEndereco.Enabled := opcao;
  lbl_edtBairro.Enabled := opcao;
  lbl_edtCidade.Enabled := opcao;
  lbl_edtCep.Enabled := opcao;
  lbl_edtTelCom.Enabled := opcao;
  lbl_edtTelFax.Enabled := opcao;
  lbl_edtCelular.Enabled := opcao;
  lbl_edtCnpj_cpf.Enabled := opcao;
  lbl_edtContato.Enabled := opcao;
  lbl_edtSite.Enabled := opcao;
  lbl_edtIE_rg.Enabled := opcao;
  lbl_edtEmail.Enabled := opcao;
  lbl_edtEstado.Enabled := opcao;
  lbl_edtDDD.Enabled := opcao;
  lbl_edtDDDFax.Enabled := opcao;
  lbl_edtNumero.Enabled := opcao;
  lbl_edtComplemento.Enabled := opcao;
  lbl_edtPontoreferencia.Enabled := opcao;
  lbl_edtObs.Enabled := opcao;
end;

procedure TfrmClientes.DesabilitaCamposAP(opcao:Boolean);
begin
  cboTipoProd.Enabled := opcao;
  cboFuncionario.Enabled := opcao;
  lbl_edtVeiculo.Enabled := opcao;
  lbl_edtPlaca.Enabled := opcao;
  lbl_edtCidadecliente.Enabled := opcao;
  lbl_edtEstadocliente.Enabled := opcao;
  dtpDataAd.Enabled := opcao;
  lbl_edtQtde.Enabled := opcao;
  cboCondpagto.Enabled := opcao;
end;

procedure TfrmClientes.DesabilitaCamposCf(opcao:Boolean);
begin
{  cboBlocCred.Enabled := opcao;
  lbl_edtLimite.Enabled := opcao;
  cboMotivo.Enabled := opcao;
  lbl_edtEnd.Enabled := opcao;
  lbl_edtBairrocobr.Enabled := opcao;
  lbl_edtCepcobr.Enabled := opcao;
  lbl_edtCidadecobr.Enabled := opcao;
  lbl_edtEstCobr.Enabled := opcao;
  lbl_edtTelcobr.Enabled := opcao;
  lbl_edtEmailcobr.Enabled := opcao;
  lbl_edtBco1cobr.Enabled := opcao;
  lbl_edtAg1cobr.Enabled := opcao;
  lbl_edtCccobr.Enabled := opcao;
  lbl_edtBco2cobr.Enabled := opcao;
  lbl_edtAg2cobr.Enabled := opcao;
  lbl_edtCc2cobr.Enabled := opcao;}
end;

procedure TfrmClientes.LimpaAP;
begin

  lbl_edtVeiculo.Clear;
  lbl_edtPlaca.Clear;
  lbl_edtCidadecliente.Clear;
  lbl_edtEstadocliente.Clear;
  lbl_edtQtde.Clear;
  cboFuncionario.ClearSelection;
  cboProduto.ClearSelection;
  cboCondpagto.ClearSelection;
  cboTipoProd.ClearSelection;

end;

procedure TfrmClientes.AlteraCadastro;
begin

  with dmModule do begin


  If cboRamoativ.ItemIndex = -1 Then begin
      StringRamoAtiv       := ',IDRAMOATIV = ''0''';
    end else begin
      ClassRamoAtiv         := TClasseCombo( cboRamoativ.Items.Objects[cboRamoativ.ItemIndex] );
      StringRamoAtiv        := ',IDRAMOATIV = ''' + InttoStr( ClassRamoAtiv.ID ) + '''';
    end;

      //GRAVA AS ALTERACOES NA TBL DE CADASTRO
      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('UPDATE TBLCADASTRO SET '
      + 'NOME = ''' + lbl_edtNomerazao.Text + ''''
      + StringRamoAtiv
      + ',NUMERO = ''' + lbl_edtNumero.Text + ''''
      + ',DATA = ''' + FormatDateTime('mm-dd-yyyy', dtpDataCli.Date) + ''''
      + ',COMPL = ''' + lbl_edtComplemento.Text + ''''
      + ',CEP = ''' + InttoStr(Cep) + ''''
      + ',PONTOREFERENCIA = ''' + lbl_edtPontoreferencia.Text + ''''
      + ',OBS = ''' + lbl_edtObs.Text + ''' WHERE IDCAD=''' + InttoStr(IDCad) + '''');

      ibCadastro.ExecSQL;
      TRCadastro.Commit;

  end;{with}
end;

procedure TfrmClientes.AlteraDocumentacao;
begin
  with dmModule do begin

    //SE O FIELD TIPO PESSOA FOR 1 ALTERA CPF
    if (rdgrTipodecliente.ItemIndex = 0) Then begin
      TipoPessoa := 1;
    end else if (rdgrTipodecliente.ItemIndex = 1) Then begin //SE FOR 2 ALTERA CNPJ
      TipoPessoa := 2;
    end;
    
   //////////////////////////////////////////////////////////////////////////////////////////

    //select para trazer registro dos campos
    ibDocumentacao.Close;
    ibDocumentacao.SQL.Clear;
    ibDocumentacao.SQL.Add('SELECT * FROM TBLCADDOCUMENTACAO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
    ibDocumentacao.Open;

    //faz alteracao se houver registro
    if ibDocumentacao.RecordCount > 0 Then begin

      //GRAVA AS ALTERACOES NA TBL DE DOCUMENTACAO
      ibDocumentacao.Close;
      ibDocumentacao.SQL.Clear;
      ibDocumentacao.SQL.Add('UPDATE TBLCADDOCUMENTACAO SET '
      + 'CNPJ_CPF = ''' + lbl_edtCnpj_cpf.Text + ''''
      + ',IE_RG = ''' + lbl_edtIE_rg.Text + ''''
      + ',TIPOPESSOA = ''' + IntToStr(TipoPessoa) + ''''
      + ',CODIGO = ''' + lbl_edtCodCliente.Text + ''''
      + ',NOMEFANTASIA = ''' + lbl_edtNomeusual.Text + ''' WHERE IDCad=''' + InttoStr(IDCad) + '''');
      ibDocumentacao.ExecSQL;
      TRDocumentacao.Commit;
      
    end else begin

      //insere dados na tblcaddocumentacao
      ibDocumentacao.Close;
      ibDocumentacao.SQL.Clear;
      ibDocumentacao.SQL.Add('INSERT INTO TBLCADDOCUMENTACAO '
      + ' (IDCAD,NOMEFANTASIA,IE_RG,CNPJ_CPF,CODIGO,TIPOPESSOA) values '
      + ' (''' + IntToStr(IDCad) + ''',''' + lbl_edtNomeusual.Text + ''','
      + ' ''' + lbl_edtIE_rg.Text + ''','
      + ' ''' + lbl_edtCnpj_cpf.Text + ''','
      + ' ''' + lbl_edtCodCliente.Text + ''','
      + ' ''' + IntToStr(TipoPessoa) +  ''')');
      ibDocumentacao.ExecSQL;
      TRDocumentacao.Commit;

    end;{if}

  end;{with}
  
end;

procedure TfrmClientes.AlteraLogradouro;
begin

  if ((lbl_edtCep.Text = '') and (lbl_edtEndereco.Text <> '')) Or
     ((lbl_edtCep.Text = '00000-000') and (lbl_edtEndereco.Text <> ''))  Then begin

    with dmModule do begin

      //select para trazer registro dos campos
      ibLogradouro.Close;
      ibLogradouro.SQL.Clear;
      ibLogradouro.SQL.Add('SELECT * FROM TBLLOGRADOURO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
      ibLogradouro.Open;

      //faz alteracao se houver registro
      if ibLogradouro.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE LOGRADOURO
        ibLogradouro.Close;
        ibLogradouro.SQL.Clear;
        ibLogradouro.SQL.Add('UPDATE TBLLOGRADOURO SET '
        + 'ENDERECO = ''' + lbl_edtEndereco.Text + ''''
        + ',BAIRRO = ''' + lbl_edtBairro.Text + ''''
        + ',CIDADE = ''' + lbl_edtCidade.Text + ''''
        + ',ESTADO = ''' + lbl_edtEstado.Text + ''' WHERE IDCad=''' + InttoStr(IDCad) + '''');
        ibLogradouro.ExecSQL;
        TRLogradouro.Commit;

      end else begin// senao houver registro grava na tabela

        ibLogradouro.Close;
        ibLogradouro.SQL.Clear;
        ibLogradouro.SQL.Add('INSERT INTO TBLLOGRADOURO '
        + ' (IDCAD,ENDERECO,BAIRRO,ESTADO,CIDADE) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + lbl_edtEndereco.Text + ''',''' + lbl_edtBairro.Text + ''','
        + ' ''' + lbl_edtEstado.Text + ''','
        + ' ''' + lbl_edtCidade.Text + ''')');
        ibLogradouro.ExecSQL;
        TRLogradouro.Commit;

      end; {if}

    end; {with}

  end; {if}

end;

procedure TfrmClientes.AlteraContato;
var
DDDCom : Integer;
DDDFax : Integer;
begin
 with dmModule do begin
    //ROTINA PARA ALTERAR O TELEFONE COMERCIAL E O DDD
    if lbl_edtTelCom.Text <> '' Then begin

      if lbl_edtDDD.Text = '' Then begin
        DDDCom := 11;
      end else begin
        DDDCom := StrtoInt(lbl_edtDDD.Text);
      end;{if}

        //localiza e abre somente o cadastro de contato pela identificação do telefone coml.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
        ibClassificacao.Open;
        IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

        //localiza o ddd e o contato atraves da classe
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
        + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassTelcom) + ''')');
        ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtTelCom.Text +  ''''
        + ',DDD = ''' + IntToStr(DDDCom) + ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassTelcom) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;

      end else begin

        //inicio de rotina para gravação de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassTelcom) + ''',''' + IntToStr(DDDCom) + ''','
        + ' ''' + lbl_edtTelcom.Text + ''')');
        ibContato.ExecSQL;

      end;{if}

    end;{if}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

    //ROTINA PARA ALTERAR O TELEFONE DE FAX E O DDD
    if lbl_edtTelFax.Text <> '' Then begin

      if lbl_edtDDDFax.Text = '' Then begin
        DDDFax := 11;
      end else begin
        DDDFax := StrtoInt(lbl_edtDDDFax.Text);
      end;{if}

      //localiza e abre somente o cadastro de contato pela identificação do telefone fax.
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Fax''');
      ibClassificacao.Open;
      IDClassTelfax := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone fax. na variavel.

      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassTelfax) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtTelFax.Text +  ''''
        + ',DDD = ''' + IntToStr(DDDFax) + ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassTelfax) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;

      end else begin

        //inicio de rotina para gravação de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassTelfax) + ''',''' + IntToStr(DDDFax) + ''','
        + ' ''' + lbl_edtTelFax.Text + ''')');
        ibContato.ExecSQL;

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O TELEFONE CELULAR
    if lbl_edtCelular.Text <> '' Then begin

      //localiza e abre somente o cadastro de contato pela identificação do telefone fax.
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Cel''');
      ibClassificacao.Open;
      IDClassTelCel := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone fax. na variavel.

      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassTelCel) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtCelular.Text +  ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassTelCel) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;

      end else begin

        //inicio de rotina para gravação de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassTelCel) + ''','
        + ' ''' + lbl_edtCelular.Text + ''')');
        ibContato.ExecSQL;

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O SITE
    if lbl_edtSite.Text <> '' Then begin

      //localiza e abre somente o cadastro de contato pela identificação do site.
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''WebSite''');
      ibClassificacao.Open;
      IDClassSite := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone fax. na variavel.

      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassSite) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtSite.Text +  ''''
        + ',DDD = ''' + IntToStr(IDClassSite) + ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassSite) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;

      end else begin

        //inicio de rotina para gravação de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassSite) + ''',''' + IntToStr(IDClassSite) + ''','
        + ' ''' + lbl_edtSite.Text + ''')');
        ibContato.ExecSQL;

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O EMAIL
    if lbl_edtEmail.Text <> '' Then begin

      //localiza e abre somente o cadastro de contato pela identificação do site.
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Email''');
      ibClassificacao.Open;
      IDClassEmail := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de email. na variavel.

      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassEmail) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtEmail.Text +  ''''
        + ',DDD = ''' + IntToStr(IDClassEmail) + ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassEmail) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;

      end else begin

        //inicio de rotina para gravação de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassEmail) + ''',''' + IntToStr(IDClassEmail) + ''','
        + ' ''' + lbl_edtEmail.Text + ''')');
        ibContato.ExecSQL;

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O CONTATO
    if lbl_edtContato.Text <> '' Then begin

     //localiza e abre somente o cadastro de contato pela identificação do contato.
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Contato''');
      ibClassificacao.Open;
      IDClassContato := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de email. na variavel.


      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassContato) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtContato.Text +  ''''
        + ',DDD = ''' + IntToStr(IDClassContato) + ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassContato) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;
        
      end else begin

        //inicio de rotina para gravação de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassContato) + ''',''' + IntToStr(IDClassContato) + ''','
        + ' ''' + lbl_edtContato.Text + ''')');
        ibContato.ExecSQL;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmClientes.ExibeDadosCliente; //procedimento criado para exibir os dados da tbl nos campos
var
i : Integer;
begin
  with dmModule do begin

    IDCad := ibCadastro.FieldByName('IDCAD').AsInteger; //ATRIBUI O IDCAD DO CADASTRO A VARIAVEL
    IDadpista := 0;//limpa a variavel

    //se tiver registro traz no campo
    if ibCadastro.RecordCount > 0  Then begin
     lbl_edtNomeRazao.Text       := ibCadastro.FieldByName('NOME').AsString;
    end else begin  //senao limpa o campo
      lbl_edtNomerazao.Clear;
    end;

    for i:=0 to cboRamoativ.Items.Count -1 do begin
    if TClasseCombo( cboRamoativ.Items.Objects[i]).ID = ibCadastro.FieldByName('IDRAMOATIV').AsInteger then begin
      cboRamoativ.ItemIndex:= i;
      Break;
    end else begin
      cboRamoativ.ClearSelection;
    end;
    end;

    // ROTINA PARA TRAZER OS DADOS DE CONTATO DO CLIENTE
    lbl_edtCep.Text             := FormatFloat('00000-000',ibCadastro.FieldByName('CEP').AsInteger);
    lbl_edtPontoreferencia.Text := ibCadastro.FieldByName('PONTOREFERENCIA').AsString;
    lbl_edtObs.Text             := ibCadastro.FieldByName('OBS').AsString;
    lbl_edtNumero.Text          := ibCadastro.FieldByName('NUMERO').AsString;
    lbl_edtComplemento.Text     := ibCadastro.FieldByName('COMPL').AsString;
    lbl_edtIcm.Text             := ibCadastro.FieldByName('ICMS').AsString;
    dtpDataCli.Date             := ibCadastro.FieldByName('DATA').AsDateTime;

    //LOCALIZA O TELEFONE COMERCIAl
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
    ibClassificacao.Open;
    IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

    ibContato.Close;
    ibContato.SQL.Clear;
    ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
    + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassTelcom) + ''')');
    ibContato.Open;

      //se tiver registro traz no campo
      if ibContato.RecordCount > 0 Then begin
         lbl_edtDDD.Text          := ibContato.FieldByName('DDD').AsString; //TRAZ O DDD DO TELEFONE COMERCIAL
         lbl_edtTelCom.Text       := ibContato.FieldByName('CONTATO').AsString; //TRAZ O CONTATO (TELEFONE) COMERCIAL
      // limpa os campos se nao houver registro.
      end else begin
        lbl_edtDDD.Clear;
        lbl_edtTelcom.Clear;
      end;

      //LOCALIZA O TELEFONE FAX
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Fax''');
      ibClassificacao.Open;
      IDClassTelfax := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassTelfax) + ''')');
      ibContato.Open;

      //se tiver registro traz no campo
      if ibContato.RecordCount > 0 Then begin
         lbl_edtDDDFax.Text       := ibContato.FieldByName('DDD').AsString; //TRAZ O DDD DO TELEFONE FAX
         lbl_edtTelFax.Text       := ibContato.FieldByName('CONTATO').AsString; //TRAZ O CONTATO (TELEFONE) FAX
       // limpa os campos se nao houver registro.
     end else begin
       lbl_edtDDDFax.Clear;
       lbl_edtTelFax.Clear;
      end;

      //LOCALIZA O TELEFONE CELULAR
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Cel''');
      ibClassificacao.Open;
      IDClassTelCel := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone celular na variavel.

      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassTelCel) + ''')');
      ibContato.Open;

      //se tiver registro traz no campo
      if ibContato.RecordCount > 0 Then begin
         lbl_edtCelular.Text       := ibContato.FieldByName('CONTATO').AsString; //TRAZ O CONTATO (TELEFONE) CELULAR
       // limpa os campos se nao houver registro.
      end else begin
        lbl_edtCelular.Clear;
      end;

          //LOCALIZA O SITE DO CLIENTE
          ibClassificacao.Close;
          ibClassificacao.SQL.Clear;
          ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''WebSite''');
          ibClassificacao.Open;
          IDClassSite := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do site na variavel.

          ibContato.Close;
          ibContato.SQL.Clear;
          ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
          + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassSite) + ''')');
          ibContato.Open;

        //se tiver registro traz no campo
        if ibContato.RecordCount > 0 Then begin
           lbl_edtSite.Text       := ibContato.FieldByName('CONTATO').AsString; //TRAZ O SITE.
         // limpa os campos se nao houver registro.
        end else begin
          lbl_edtSite.Clear;
        end;

        //LOCALIZA O EMAIL DO CLIENTE
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Email''');
        ibClassificacao.Open;
        IDClassEmail := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identificacao do email na variavel.

        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
        + ' (IDCAD='''+ IntToStr(IDCad) + ''') And (Tipo=''' + IntToStr(IDClassEmail) + ''')');
        ibContato.Open;

      //se tiver registro traz no campo
      if ibContato.RecordCount > 0 Then begin
        lbl_edtEmail.Text         := ibContato.FieldByName('CONTATO').AsString;//TRAZ O EMAIL.
      // limpa os campos se nao houver registro.
      end else begin
        lbl_edtEmail.Clear;
      end;


       // LOCALIZA O CONTATO DO CLIENTE.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Contato''');
        ibClassificacao.Open;
        IDClassContato := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do site na variavel.

        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
        + ' (IDCAD=''' + IntToStr(IDCad) + ''') And (Tipo=''' + IntToStr(IDClassContato) + ''')');
        ibContato.Open;

      //se tiver registro traz no campo
      if ibContato.RecordCount > 0 Then begin
        lbl_edtContato.Text        := ibContato.FieldByName('CONTATO').AsString;//TRAZ O CONTATO.
      // limpa os campos se nao houver registro.
      end else begin
        lbl_edtContato.Clear;
     end;

       //LOCALIZA OS DADOS DA TBLCADDOCUMENTACAO DO CLIENTE.
        ibDocumentacao.Close;
        ibDocumentacao.SQL.Clear;
        ibDocumentacao.SQL.Add('SELECT NOMEFANTASIA,CNPJ_CPF,IE_RG,CODIGO,TIPOPESSOA FROM TBLCADDOCUMENTACAO WHERE'
        + ' IDCAD=''' + IntToStr(IDCad) + '''');
        ibDocumentacao.Open;


      //se tiver registro traz no campo
      if ibDocumentacao.RecordCount > 0 Then begin
        lbl_edtNomeusual.Text        := ibDocumentacao.FieldByName('NOMEFANTASIA').AsString;//TRAZ O NOME FANTASIA.

       //SE FOR PESSOA FISICA ELE EXIBE E OS DADOS NOS CAMPOS
        if ibDocumentacao.FieldByName('TIPOPESSOA').AsInteger = 1  Then begin
         rdgrTipodecliente.ItemIndex := 0;
         lbl_edtCnpj_cpf.Text := '&CPF';
         lbl_edtIE_rg.Text := '&RG';
         lbl_edtCnpj_cpf.Text         := ibDocumentacao.FieldByName('CNPJ_CPF').AsString;//TRAZ O CNPJ DO CLIENTE.
         lbl_edtIE_rg.Text            := ibDocumentacao.FieldByName('IE_RG').AsString;//TRAZ A IE OU  O RG DO CLIENTE.
         lbl_edtCodCliente.Text       := ibDocumentacao.FieldByName('CODIGO').AsString;
       //SE FOR PESSOA JURIDICA ELE EXIBE E OS DADOS NOS CAMPOS
       end else if ibDocumentacao.FieldByName('TIPOPESSOA').AsInteger = 2 Then begin
         rdgrTipodecliente.ItemIndex := 1;
         lbl_edtCnpj_cpf.Text := '&CNPJ';
         lbl_edtIE_rg.Text := '&IE';
         lbl_edtCnpj_cpf.Text         := ibDocumentacao.FieldByName('CNPJ_CPF').AsString;//TRAZ O CNPJ DO CLIENTE.
         lbl_edtIE_rg.Text            := ibDocumentacao.FieldByName('IE_RG').AsString;//TRAZ A IE OU  O RG DO CLIENTE.
         lbl_edtCodCliente.Text       := ibDocumentacao.FieldByName('CODIGO').AsString;
       end;


      // limpa os campos se nao houver registro.
      end else begin
        lbl_edtNomeusual.Clear;
        lbl_edtCnpj_cpf.Clear;
        lbl_edtIE_rg.Clear;
      end;

        // se o cep da tbl cadastro for diferente de branco
        if ibCadastro.FieldByName('CEP').AsInteger <> 0 Then begin

    {      CEPTemp := StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]);//atribui o traco na variavel cep

          ibTempCep := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL

        with ibTempCep do begin

          //faz select da tbl cep atraves do componente criado
          ibTempCep.Database := IBDCep;
          ibTempCep.SQL.Clear;
          ibTempCep.SQL.Add('SELECT LOCAL,BAIRRO,CIDADE,UF,CEP FROM TBLCEP WHERE CEP=''' + CEPTemp + '''');
          ibTempCep.Open; }

      //  end;{with}
          //traz os dados da tbl no campo.
        {  lbl_edtEndereco.Text := ibTempCep.FieldByName('LOCAL').AsString;
          lbl_edtBairro.Text   := ibTempCep.FieldByName('BAIRRO').AsString;
          lbl_edtCidade.Text   := ibTempCep.FieldByName('CIDADE').AsString;
          lbl_edtEstado.Text   := ibTempCep.FieldByName('UF').AsString;
          lbl_edtCep.Text      := FormatFloat('00000-000',ibTempCep.FieldByName('CEP').AsInteger); }

        end else begin

        //LOCALIZA OS DADOS DA TBLLOGRADOURO DO CLIENTE.
        ibLogradouro.Close;
        ibLogradouro.SQL.Clear;
        ibLogradouro.SQL.Add('SELECT ENDERECO,BAIRRO,CIDADE,ESTADO FROM TBLLOGRADOURO WHERE'
        + ' IDCAD=''' + IntToStr(IDCad) + '''');
        ibLogradouro.Open;

         //se tiver registro traz no campo
        if ibLogradouro.RecordCount > 0 Then begin
          lbl_edtEndereco.Text        := ibLogradouro.FieldByName('ENDERECO').AsString;//TRAZ O ENDERECO.
          lbl_edtBairro.Text          := ibLogradouro.FieldByName('BAIRRO').AsString;//TRAZ O BAIRRO.
          lbl_edtCidade.Text          := ibLogradouro.FieldByName('CIDADE').AsString;//TRAZ A CIDADE.
          lbl_edtEstado.Text          := ibLogradouro.FieldByName('ESTADO').AsString;//TRAZ O ESTADO.
        //limpa os campos se nao houver registro.
        end else begin
          lbl_edtEndereco.Clear;
          lbl_edtBairro.Clear;
          lbl_edtCidade.Clear;
          lbl_edtEstado.Clear;
        end;

     end;


  end;
  
end;

procedure TfrmClientes.ExibeDadosAdicionalPista;  //abaixo vai exibir dados de dicional pista
var
i : Integer;
begin

  with dmModule do begin

    if (IDadpista = 0) Then begin //se a variavel nao conter registro executa abaixo
      ExecSELECTAP;
    end;

    IDadpista := ibAdicionalpista.FieldByName('IDADI').AsInteger;//atribui o id na variavel.

    for i:=0 to cboTipoProd.Items.Count -1 do begin
      if TClasseCombo( cboTipoProd.Items.Objects[i]).ID = ibAdicionalpista.FieldByName('IDTIPOPROD').AsInteger then begin
        cboTipoProd.ItemIndex:= i;
        Break;
      end else begin
        cboTipoProd.ClearSelection;
      end;
    end;

    //////////////////////////////////////////////////////////////////////////////////////////

    for i:=0 to cboFuncionario.Items.Count - 1 do begin
      if TClasseCombo(cboFuncionario.Items.Objects[i]).ID = ibAdicionalpista.FieldByName('IDFUNC').AsInteger Then begin
       cboFuncionario.ItemIndex := i;
       Break;
      end else begin
       cboFuncionario.ClearSelection;
      end;
    end;

    /////////////////////////////////////////////////////////////////////////////////////////////

    for i:=0 to cboProduto.Items.Count -1 do begin
      if TClasseCombo( cboProduto.Items.Objects[i]).ID = ibAdicionalpista.FieldByName('IDPROD').AsInteger then begin
        cboProduto.ItemIndex:= i;
        Break;
      end else begin
        cboProduto.ClearSelection;
      end;
    end;

    //////////////////////////////////////////////////////////////////////////////////////////////////

    for i:=0 to cboCondpagto.Items.Count -1 do begin
      if TClasseCombo( cboCondpagto.Items.Objects[i]).ID = ibAdicionalpista.FieldByName('IDPAGTO').AsInteger then begin
        cboCondpagto.ItemIndex:= i;
        Break;
      end else begin
        cboCondpagto.ClearSelection;
      end;
    end;

    lbl_edtVeiculo.Text         := ibAdicionalpista.FieldByName('VEICULO').AsString;
    lbl_edtPlaca.Text           := ibAdicionalpista.FieldByName('PLACA').AsString;
    lbl_edtCidadecliente.Text   := ibAdicionalpista.FieldByName('CIDADE').AsString;
    lbl_edtEstadocliente.Text   := ibAdicionalpista.FieldByName('ESTADO').AsString;
    lbl_edtQtde.Text            := ibAdicionalpista.FieldByName('QTDE').AsString;

    if ibAdicionalpista.FieldByName('DATA').AsDateTime > 0  Then begin

      dtpDataAd.Date              := ibAdicionalpista.FieldByName('DATA').AsDateTime;

    end else begin

      dtpDataAd.DateTime         := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

    end;

  end;{WITH}
  
end;

procedure TfrmClientes.LimpaCampo;  // limpa os campos determinados abaixo
begin
  IDCad := 0;

  lbl_edtCodCliente.Clear;
  lbl_edtIcm.Clear;
  lbl_edtNomerazao.Clear;
  //cboRamoativ.Clear;
  lbl_edtNomeusual.Clear;
  lbl_edtEndereco.Clear;
  lbl_edtBairro.Clear;
  lbl_edtCidade.Clear;
  lbl_edtCep.Clear;
  lbl_edtTelCom.Clear;
  lbl_edtTelFax.Clear;
  lbl_edtCelular.Clear;
  lbl_edtCnpj_cpf.Clear;
  lbl_edtContato.Clear;
  lbl_edtSite.Clear;
  lbl_edtIE_rg.Clear;
  lbl_edtEmail.Clear;
  lbl_edtEstado.Clear;
  lbl_edtDDD.Clear;
  lbl_edtDDDFax.Clear;
  lbl_edtNumero.Clear;
  lbl_edtComplemento.Clear;
  lbl_edtPontoreferencia.Clear;
  lbl_edtObs.Clear;

end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin

 // ibeaNovo.Enabled := False;

 //atribui data atual ao abrir o modulo.
  dtpDataCli.Date  := Date;
  dtpDataAd.Date   := Date;

  cboProduto.Enabled := False;//mantem desabilitado.

  AlteraCep := False;//variavel para atribuir vlr boleano no cep
  AlteraEnd := False;//variavel para atribuir vlr boleano no cep

  //DEFINE COM QUE A PAGEINDEX FIQUE COMO 0
  pcCadastrodeclientes.ActivePageIndex := 0;

  DesabilitaCamposCli(False);//desabilita os campos
  ibeaNovo.Caption := '&Novo';
  ibeaAlterar.Caption := '&Alterar';

  //habilita os botes ao abrir o form
  ibeaNovo.Enabled := True;
  ibeaAlterar.Enabled := True;
  ibeaExcluir.Enabled := True;
  ibeaConsultar.Enabled := True;
  LimpaCampo;
  LimpaAP;

  dbgClientes.Enabled := True;

  with dmModule do begin

    LimparRamoAtividade := True; //SETA A VARIAVEL COMO TRUE PARA LIMPAR O COMBO E ADICIONAR OS REGISTROS

    ExecSELECT;
    ExecSELECTTProd;
    ExecProd;
    ExecFunc;
    ExecCpagto;

    // ibAdicionalpista.Close;
    rdgrTipodecliente.ItemIndex:=0;//vai habilitar o tipo de pessoa fisica ao abrir o formulario.

    //Adiciona as Colunas com os dados do Clientes
    with dbgClientes do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

        //determina as colunas a serem montadas 0 codigo cliente, 1 razao Social, 2 endereço numero...
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o Código do Cadastro
        Columns.Items[0].Title.Caption := 'Código';
        Columns.Items[0].FieldName     := 'CODIGO';
        Columns.Items[0].Width         := 77;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do cliente.
        Columns.Items[1].Title.Caption := 'Razão Social';
        Columns.Items[1].FieldName     := 'NOME';
        Columns.Items[1].Width         := 280;
        Columns.Items[1].Alignment     := taLeftJustify;

        // Parametros que exibe o nome fantasia do cliente
        Columns.Items[2].Title.Caption := 'Nome Fantasia';
        Columns.Items[2].FieldName     := 'NomeFantasia';
        Columns.Items[2].Width         := 220;
        Columns.Items[2].Alignment     := taLeftJustify;

        // Parametros que exibe o numero do cliente
        Columns.Items[3].Title.Caption := 'Ramo de Atividade';
        Columns.Items[3].FieldName     := 'RamoAtividade';
        Columns.Items[3].Width         := 117;
        Columns.Items[3].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[4].Title.Caption := 'Data Cadastro.';
        Columns.Items[4].FieldName     := 'DATA';
        Columns.Items[4].Width         := 83;
        Columns.Items[4].Alignment     := taLeftJustify;

        MontaColunas := False;

      end; {if}

      ibAdicionalpista.Close;
////////////////////////////////////////////////////////////////////////////////

    with dbgHistorico do begin//MONTA AS COLUNAS DO ADICIONAL PISTA

        if MontaColHistorico Then begin

         DataSource := dtsVPistaProd;

          //determina as colunas a serem montadas 0 codigo cliente, 1 razao Social, 2 endereço numero...
          Columns.Insert(0);
          Columns.Insert(1);
          Columns.Insert(2);
          Columns.Insert(3);
          Columns.Insert(4);
          Columns.Insert(5);
          Columns.Insert(6);
          Columns.Insert(7);
       //   Columns.Insert(8);

          Columns.Items[0].Title.Caption := 'Nº Cupom';
          Columns.Items[0].FieldName     := 'IDPRODPISTA';
          Columns.Items[0].Width         := 80;
          Columns.Items[0].Alignment     := taLeftJustify;

          Columns.Items[1].Title.Caption := 'Produto/Serviço';
          Columns.Items[1].FieldName     := 'Produto';
          Columns.Items[1].Width         := 180;
          Columns.Items[1].Alignment     := taLeftJustify;

          //Parametros da Coluna que exibe o Nome do cliente.
          Columns.Items[2].Title.Caption := 'VlrUnit';
          Columns.Items[2].FieldName     := 'VLRUNIT';
          Columns.Items[2].Width         := 70;
          Columns.Items[2].Alignment     := taLeftJustify;

          // Parametros que exibe o veiculo
          Columns.Items[3].Title.Caption := 'Qtde';
          Columns.Items[3].FieldName     := 'QTDELITROS';
          Columns.Items[3].Width         := 70;
          Columns.Items[3].Alignment     := taLeftJustify;

          // Parametros que exibe a placa
          Columns.Items[4].Title.Caption := 'Total';
          Columns.Items[4].FieldName     := 'VLRVENDAA';
          Columns.Items[4].Width         := 80;
          Columns.Items[4].Alignment     := taLeftJustify;

          // Parametros que exibe o nome do produto
          Columns.Items[5].Title.Caption := 'Vlr.Convenio/Nota';
          Columns.Items[5].FieldName     := 'VLRCONVENIO';
          Columns.Items[5].Width         := 96;
          Columns.Items[5].Alignment     := taLeftJustify;

          // Parametros que exibe a cidade
          Columns.Items[6].Title.Caption := 'Data';
          Columns.Items[6].FieldName     := 'DATA';
          Columns.Items[6].Width         := 55;
          Columns.Items[6].Alignment     := taLeftJustify;

          // Parametros que exibe o Estado
          Columns.Items[7].Title.Caption := 'Funcionario';
          Columns.Items[7].FieldName     := 'NOMEFUNC';
          Columns.Items[7].Width         := 110;
          Columns.Items[7].Alignment     := taLeftJustify;

          // Parametros que exibe a condicao de pagto
       {   Columns.Items[7].Title.Caption := 'Cond.Pagto.';
          Columns.Items[7].FieldName     := 'CONDPAGTO';
          Columns.Items[7].Width         := 100;

          // Parametros que exibe o nome do funcionario
          Columns.Items[8].Title.Caption := 'Funcionário';
          Columns.Items[8].FieldName     := 'IDFUNC';
          Columns.Items[8].Width         := 220; }

          MontaColHistorico := False;

        end;//if monta colap

      end;//with dggrid

////////////////////////////////////////////////////////////////////////////////

    end; {with}

  end;

end;

procedure TfrmClientes.ibeaNovoClick(Sender: TObject);

begin

  with dmModule do begin

    //rotina para cancelar ou nao a operacao

    if ibeaAlterar.Caption = '&Atualizar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
              + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        ibeaNovo.Enabled := True;
        ibeaNovo.Caption := '&Novo';
        ibeaExcluir.Enabled := True;
        DesabilitaCamposCli(False);
        lbl_edtCodCliente.Clear;
        LimpaCampo;
        cboRamoativ.ClearSelection;

      end;{if}

    end else begin


////////////////////////////////////////////////////////////////////////////////


    if ibeaNovo.Caption = '&Gravar' Then begin

      if lbl_edtCep.Text = '' Then begin  //atribui  vlr 0 a variavel cep
        Cep := 0;
      end else begin // caso esteja em branco atribui o vlr do campo na variavel cep
        Cep := strtoint( StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]) );
      end;

      if lbl_edtIcm.Text = '' Then begin //atribui vlr 0 a variavel icms
        Icms := 0;
      end else begin
        Icms := StrToInt(lbl_edtIcm.Text);//senao atribui o numero digitado no campo
      end;

      If cboRamoativ.ItemIndex = -1 Then begin
        StringRamoAtiv     := ' ''0'',';
        //    Application.MessageBox('Informe o Ramo de Atividade','Notificação: Ramo de Atividade não especificado',MB_OK+MB_ICONERROR);
      end else begin
        ClassRamoAtiv      := TClasseCombo( cboRamoativ.Items.Objects[cboRamoativ.ItemIndex] );
        StringRamoAtiv     := ' ''' + InttoStr( ClassRamoAtiv.ID ) + ''',';
      end;

       if lbl_edtCodCliente.Text = '' Then begin
         Application.MessageBox('Por Favor Digite o cógido do Cliente','Notificação: Código não especificado', MB_YESNO + MB_ICONERROR);
       end else begin


      //insere na tabela os dados digitados nos campos determinados abaixo.
      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('INSERT INTO TBLCADASTRO '
      + ' (IDCLASS,NOME,IDRAMOATIV,NUMERO,COMPL,PONTOREFERENCIA,OBS,ICMS,DATA,CEP) values '
      + ' (''' + IntToStr(IDClass) + ''',''' + lbl_edtNomerazao.Text + ''','
      + StringRamoAtiv
      + ' ''' + lbl_edtNumero.Text + ''',''' + lbl_edtComplemento.Text + ''','
      + ' ''' + lbl_edtPontoreferencia.Text + ''',''' + lbl_edtObs.Text + ''','
      + ' ''' + IntToStr(Icms) + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy', dtpDataCli.Date) + ''','
      + ' ''' + IntToStr(Cep) + ''')');
      ibCadastro.ExecSQL;


      //select para trazer o nome do cliente no campo abaixo atraves do id
      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('SELECT IDCAD FROM TBLCADASTRO ORDER BY TBLCADASTRO.IDCAD DESC');
      ibCadastro.Open;

      IDCadnovo := ibCadastro.FieldByName('IDCAD').AsInteger;//atribui o id do nome a variavel.

      //grava dados na tbllogradouro se cep nao for preenchido
      if lbl_edtEndereco.Text <> '' Then begin

        ibLogradouro.Close;
        ibLogradouro.SQL.Clear;
        ibLogradouro.SQL.Add('INSERT INTO TBLLOGRADOURO '
        + ' (IDCAD,ENDERECO,BAIRRO,ESTADO,CIDADE) values '
        + ' (''' + IntToStr(IDCadnovo) + ''',''' + lbl_edtEndereco.Text + ''',''' + lbl_edtBairro.Text + ''','
        + ' ''' + lbl_edtEstado.Text + ''','
        + ' ''' + lbl_edtCidade.Text + ''')');
        ibLogradouro.ExecSQL;

      end;

      if lbl_edtTelcom.Text <> '' Then begin
        //inicio de rotina para gravação de contato
        //localiza e abre somente o cadastro de contato pela identificação do telefone coml.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
        ibClassificacao.Open;
        IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCadnovo) + ''',''' + inttostr(IDClassTelcom) + ''',''' + lbl_edtDDD.Text + ''','
        + ' ''' + lbl_edtTelcom.Text + ''')');
        ibContato.ExecSQL;
      end;


      if lbl_edtTelFax.Text <> '' Then begin
        //inicio de rotina para gravação de contato
        //localiza e abre somente o cadastro de contato pela identificação do fax.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Fax''');
        ibClassificacao.Open;
        IDClassTelfax := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identificacao do contato de fax na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCadnovo) + ''',''' + inttostr(IDClassTelfax) + ''',''' + lbl_edtDDDFax.Text + ''','
        + ' ''' + lbl_edtTelFax.Text + ''')');
        ibContato.ExecSQL;
      end;

      if lbl_edtCelular.Text <> '' Then begin
        //inicio de rotina para gravação de contato
        //localiza e abre somente o cadastro de contato pela identificação do celular.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Cel''');
        ibClassificacao.Open;
        IDClassTelCel := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identificacao do contato de celular na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,CONTATO) values '
        + ' (''' + IntToStr(IDCadnovo) + ''',''' + inttostr(IDClassTelCel) + ''','
        + ' ''' + lbl_edtCelular.Text + ''')');
        ibContato.ExecSQL;
      end;

      if lbl_edtEmail.Text <> '' Then begin
        //inicio de rotina para gravação de contato
        //localiza e abre somente o cadastro de contato pela identificação do email.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Email''');
        ibClassificacao.Open;
        IDClassEmail := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do email na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCadnovo) + ''',''' + inttostr(IDClassEmail) + ''',''0'','
        + ' ''' + lbl_edtEmail.Text + ''')');
        ibContato.ExecSQL;
      end;

      if lbl_edtContato.Text <> '' Then begin

        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Contato''');
        ibClassificacao.Open;
        IDClassContato := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + '(IDCAD,TIPO,DDD,CONTATO) values '
        + '(''' + IntToStr(IDCadnovo) + ''',''' + IntToStr(IDClassContato) + ''',''0'','
        + ' ''' + lbl_edtContato.Text + ''')');
        ibContato.ExecSQL;
      end;

      if lbl_edtSite.Text <> '' Then begin
        //inicio de rotina para gravação de contato
        //localiza e abre somente o cadastro de contato pela identificação do email.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''WebSite''');
        ibClassificacao.Open;
        IDClassSite := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do site na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCadnovo) + ''',''' + inttostr(IDClassSite) + ''',''0'','
        + ' ''' + lbl_edtSite.Text + ''')');
        ibContato.ExecSQL;
      end;

        //SE TIPO CLIENTE FOR FISICA GRAVA TIPO PESSOA 1
        if (rdgrTipodecliente.ItemIndex = 0) Then begin
           TipoPessoa := 1;
        //SE TIPO CLIENE FOR JURIDICA GRAVA TIPO PEEOSA 2
        end else if (rdgrTipodecliente.ItemIndex = 1) Then begin
          TipoPessoa := 2;
        end;

        //insere dados na tblcaddocumentacao
        ibDocumentacao.Close;
        ibDocumentacao.SQL.Clear;
        ibDocumentacao.SQL.Add('INSERT INTO TBLCADDOCUMENTACAO '
        + ' (IDCAD,NOMEFANTASIA,IE_RG,CNPJ_CPF,CODIGO,TIPOPESSOA) values '
        + ' (''' + IntToStr(IDCadnovo) + ''',''' + lbl_edtNomeusual.Text + ''','
        + ' ''' + lbl_edtIE_rg.Text + ''','
        + ' ''' + lbl_edtCnpj_cpf.Text + ''','
        + ' ''' + lbl_edtCodCliente.Text + ''','
        + ' ''' + IntToStr(TipoPessoa) +  ''')');
        ibDocumentacao.ExecSQL;

        Commit(ibDocumentacao);
        Commit(ibRativ);
        Commit(ibContato);
        Commit(ibCadastro);

        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
        ibClassificacao.Open;
        IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.

        //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
        ibCadastro.Close;
        ibCadastro.SQL.Clear;
        ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLRAMOATIV.NOME As RamoAtividade,'
        + ' TBLCADDOCUMENTACAO.NOMEFANTASIA As NomeFantasia,TBLCADDOCUMENTACAO.CODIGO FROM TBLCADASTRO '
        + ' LEFT OUTER JOIN tblcaddesativados ON TBLCADASTRO.IDCAD=tblcaddesativados.idcad '
        + ' LEFT OUTER JOIN TBLRAMOATIV ON TBLCADASTRO.IDRAMOATIV = TBLRAMOATIV.IDRAMO '
        + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
        + ' WHERE (TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''')ORDER BY TBLCADASTRO.IDCAD DESC');
        ibCadastro.Open;

        // apos gravar na tabela os campos acima volta o titulo novo pro botao e limpa os campos
        ibeaNovo.Caption := '&Novo';
        ibeaAlterar.Enabled := True;
        ibeaExcluir.Enabled := True;
        ibeaConsultar.Enabled := True;
        DesabilitaCamposCli(False);
        
       end;{if condicao do codigo cliente}

      end else begin

        ibeaNovo.Caption := '&Gravar';
        DesabilitaCamposCli(True);
        LimpaCampo;
        cboRamoativ.Text := '';
        lbl_edtCodCliente.SetFocus;
        lbl_edtCep.Text := '0';
        lbl_edtCep.Text := FormatFloat('00000-000',StrToFloat(lbl_edtCep.Text));

    end;

    end;{if}

  end;{with}

end;

procedure TfrmClientes.rdgrTipodeclienteClick(Sender: TObject);
begin

  if (rdgrTipodecliente.ItemIndex = 0) Then begin

    lbl_edtCnpj_cpf.EditLabel.Caption := 'CPF:';
    lbl_edtCnpj_cpf.Clear;
    lbl_edtIE_rg.EditLabel.Caption := 'RG:' ;

  end else begin

    lbl_edtCnpj_cpf.EditLabel.Caption := 'CNPJ:';
    lbl_edtCnpj_cpf.Clear;
    lbl_edtIE_rg.EditLabel.Caption := 'IE:'

  end;

end;

procedure TfrmClientes.ibeaSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClientes.pcCadastrodeclientesChange(Sender: TObject);

var
NomeCli : String;

begin
   ibeaNovo.Caption := '&Novo';
   ibeaAlterar.Caption := '&Alterar';
  // dtpDataAd.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  //habilita os botes ao abrir o form
  ibeaNovo.Enabled := True;
  ibeaAlterar.Enabled := True;
  ibeaExcluir.Enabled := True;
  ibeaConsultar.Enabled := True;

  with dmModule do begin

    if pcCadastrodeclientes.ActivePage.TabIndex = 0 then  begin

      lbl_edtCliHistorico.Caption        := '';
      ibVPistaProd.Close;

    //  ExibeDadosCliente;//exibe dados do cliente ao voltar de adicional pista para cliente qdo clicar no grid


      ibeaNovo.Enabled := True;
      ibeaAlterar.Enabled := True;
      ibeaExcluir.Enabled := True;

      DesabilitaCamposCli(False);//deixa os campos desabilitados
      lbl_edtPesquisacli.Enabled := True;
      dbgClientes.Enabled := True;//habilita grid cliente

      //atribui o caption
      ibeaNovo.Caption := '&Novo';
      ibeaAlterar.Caption := '&Alterar';

    end else if pcCadastrodeclientes.ActivePage.TabIndex = 1 Then begin

     ibeaNovo.Enabled := False;
     ibeaAlterar.Enabled := False;
     ibeaExcluir.Enabled := False;


      if IDCad <> 0 Then begin//se clicar na grid na parte do cliente ao mudar pro ad pista tras os dados

        lbl_TracoHistorico.Caption      := ' - ';
        lbl_edtCliHistorico.Caption        := lbl_edtNomerazao.Text;
        NomeCli := lbl_edtNomerazao.Text;

      end;

    ibVPistaProd.Close;
    ibVPistaProd.SQL.Clear;
    ibVPistaProd.SQL.Add('SELECT TBLVENDAPISTAPROD.*,TBLCADASTRO.nome As Cliente,'
    + 'CADPRODUTOS.NOME As Produto FROM TBLVENDAPISTAPROD '
    + 'INNER JOIN TBLCADASTRO ON TBLVENDAPISTAPROD.IDCLI=TBLCADASTRO.IDCAD '
    + 'INNER JOIN CADPRODUTOS ON  TBLVENDAPISTAPROD.IDPROD=CADPRODUTOS.IDPROD WHERE TBLCADASTRO.NOME=''' + NomeCli + '''');
    ibVPistaProd.Open;

    (ibVPistaProd.FieldByName('VLRCONVENIO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibVPistaProd.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibVPistaProd.FieldByName('VLRVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibVPistaProd.FieldByName('QTDELITROS') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


    end else if pcCadastrodeclientes.ActivePage.TabIndex = 2 Then begin

      lbl_edtCliHistorico.Caption        := '';
      ibVPistaProd.Close;

      if IDCad <> 0 Then begin//se clicar na grid na parte do cliente ao mudar pro ad pista tras os dados
        ExibeDadosAdicionalPista;
       // lblCodCli.Caption           := ibDocumentacao.FieldByName('CODIGO').AsString;
        lblTracoAP.Caption          := ' - ';
        lblClienteAP.Caption        := ibCadastro.FieldByName('NOME').AsString;

      end;

      lbl_edtPesquisacli.Enabled := True;
      ibeaNovo.Enabled := False;
      DesabilitaCamposAP(False);//desabilita os campos
      ibeaIncluir.Caption := '&Novo';


    with dbgDetalheprod do begin//MONTA AS COLUNAS DO ADICIONAL PISTA

        if MontaColAP Then begin
          //determina as colunas a serem montadas 0 codigo cliente, 1 razao Social, 2 endereço numero...
          Columns.Insert(0);
          Columns.Insert(1);
          Columns.Insert(2);
          Columns.Insert(3);
          Columns.Insert(4);
          Columns.Insert(5);
          Columns.Insert(6);
          Columns.Insert(7);
          Columns.Insert(8);

          //Parametro para exibir A DATA.
          Columns.Items[0].Title.Caption := 'Data';
          Columns.Items[0].FieldName     := 'DATA';
          Columns.Items[0].Width         := 75;

          //Parametros da Coluna que exibe o Nome do cliente.
          Columns.Items[1].Title.Caption := 'Cliente';
          Columns.Items[1].FieldName     := 'NOME';
          Columns.Items[1].Width         := 280;

          // Parametros que exibe o veiculo
          Columns.Items[2].Title.Caption := 'Veículo';
          Columns.Items[2].FieldName     := 'VEICULO';
          Columns.Items[2].Width         := 180;

          // Parametros que exibe a placa
          Columns.Items[3].Title.Caption := 'Placa';
          Columns.Items[3].FieldName     := 'PLACA';
          Columns.Items[3].Width         := 100;

          // Parametros que exibe a cidade
          Columns.Items[4].Title.Caption := 'Cidade';
          Columns.Items[4].FieldName     := 'CIDADE';
          Columns.Items[4].Width         := 140;
          //Columns.Items[4].Alignment     := taCenter;

          // Parametros que exibe o Estado
          Columns.Items[5].Title.Caption := 'Estado';
          Columns.Items[5].FieldName     := 'ESTADO';
          Columns.Items[5].Width         := 70;

          // Parametros que exibe o nome do produto
          Columns.Items[6].Title.Caption := 'Produto';
          Columns.Items[6].FieldName     := 'Produto';
          Columns.Items[6].Width         := 250;

          // Parametros que exibe a condicao de pagto
          Columns.Items[7].Title.Caption := 'Cond.Pagto.';
          Columns.Items[7].FieldName     := 'CONDPAGTO';
          Columns.Items[7].Width         := 100;

          // Parametros que exibe o nome do funcionario
          Columns.Items[8].Title.Caption := 'Funcionário';
          Columns.Items[8].FieldName     := 'IDFUNC';
          Columns.Items[8].Width         := 220;

          MontaColAP := False;

        end;//if monta colap

      end;//with dggrid
////////////////////////////////////////////////////////////////////////////////
    end;
  end;
end;

procedure TfrmClientes.ibeaIncluirClick(Sender: TObject);

begin
  with dmModule do begin
 //   ibeaAlterar.Enabled := False;
 //   ibeaExcluir.Enabled := False;
 //   ibeaConsultar.Enabled := False;

    if ibeaAlterar.Caption = '&Atualizar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
              + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        ibeaIncluir.Enabled := True;
        ibeaNovo.Caption := '&Incluir';
        ibeaExcluir.Enabled := True;
        cboProduto.Enabled := False;
        LimpaAP;
        DesabilitaCamposAP(False);
        dbgClientes.Enabled := True;

      end;{if}

    end else begin


////////////////////////////////////////////////////////////////////////////////

    if ibeaIncluir.Caption = '&Gravar' Then begin

    //traz a identificacao do funcionario do item do objeto selecionado.

      If cboFuncionario.ItemIndex = -1 Then begin
        StringFunc     := ' ''0'',';
        Application.MessageBox('Informe o Funcionário','Notificação: Funcionário não especificado',MB_OK+MB_ICONERROR);
      end else begin
        ClassFunc      := TClasseCombo( cboFuncionario.Items.Objects[cboFuncionario.ItemIndex] );
        StringFunc     := ' ''' + InttoStr( ClassFunc.ID ) + ''',';
      end;

      If cboProduto.ItemIndex = -1 Then begin
        StringProd     := ' ''0'',';
        Application.MessageBox('Informe o Produto','Notificação: Produto não especificado',MB_OK+MB_ICONERROR);
      end else begin
        ClassProd      := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
        StringProd     := ' ''' + InttoStr( ClassProd.ID ) + ''',';
      end;

      If cboCondpagto.ItemIndex = -1 Then begin
        StringPagto     := ' ''0'',';
        Application.MessageBox('Informe as Condições de Pagamento','Notificação: Cond Pagto não especificado',MB_OK+MB_ICONERROR);
      end else begin
        ClassPagto      := TClasseCombo( cboCondpagto.Items.Objects[cboCondpagto.ItemIndex] );
        StringPagto     := ' ''' + InttoStr( ClassPagto.ID ) + ''',';
      end;


      //traz a identificacao do produto do item do objeto selecionado.
      If cboTipoProd.ItemIndex = -1 Then begin

     //   Erro := True;
        StringTipoProd     := ' ''0'',';
        Application.MessageBox('Informe o Tipo de Produto','Notificação:Produto não especificado',MB_OK+MB_ICONERROR);
      end else begin
        ClassTipoProd      := TClasseCombo(cboTipoProd.Items.Objects[cboTipoProd.ItemIndex] );        StringTipoProd        := ' ''' + InttoStr( ClassTipoProd.ID ) + ''',';

      end;


        ibAdicionalpista.Close;
        ibAdicionalpista.SQL.Clear;
        ibAdicionalpista.SQL.Add('INSERT INTO ADICIONALPISTA'
        + ' (IDCAD,VEICULO,PLACA,CIDADE,ESTADO,IDFUNC,IDPROD,IDPAGTO,IDTIPOPROD,IDCOD,QTDE,DATA) values '
        + ' (''' + IntToStr(IDCad) + ''','
        + ' ''' + lbl_edtVeiculo.Text + ''','
        + ' ''' + lbl_edtPlaca.Text + ''',''' + lbl_edtCidadecliente.Text + ''','
        + ' ''' + lbl_edtEstadocliente.Text + ''','
        + StringFunc
        + StringProd
        + StringPagto
        + StringTipoProd
        + ' ''' + lblCodCli.Caption + ''','
        + ' ''' + lbl_edtQtde.Text + ''','
        + ' ''' + FormatDateTime('mm-dd-yyyy', dtpDataAd.Date) + ''')');
        ibAdicionalpista.ExecSQL;
        Commit(ibAdicionalpista);

        ExecSELECTAP;

        

      {  cboFuncionario.ClearSelection;
        cboProduto.ClearSelection;
        cboCondpagto.ClearSelection;
        cboTipoProd.ClearSelection; }

        ibeaIncluir.Caption := '&Novo';
        DesabilitaCamposAP(False);
        ibeaAlterar.Enabled := True;
        ibeaExcluir.Enabled := True;
        ibeaConsultar.Enabled := True;
        cboProduto.Enabled := False;
        dbgClientes.Enabled := True;
   //  end;
  //  end;

    end else begin

      ibeaIncluir.Caption := '&Gravar';
      ExecFunc;
      LimpaAP;
      cboFuncionario.Text := '';
      cboProduto.Text := '';
      DesabilitaCamposAP(True);
      dbgClientes.Enabled := False;
      lbl_edtQtde.Text := '';

    end;

    end;{if primeira condicao}

  end;{with}
  
end;

procedure TfrmClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key); //Deixa todos os textos em maiusculo

  if Key = #13 Then begin //Desabilita o processamento posterior da tecla
    key := #0;
    Perform(WM_NEXTDLGCTL,0,0); //Simula o envio da tab
  end;
end;


procedure TfrmClientes.dbgClientesCellClick(Column: TColumn);
begin

  with dmModule do begin

    ExibeDadosCliente;//exibe os dados nos campos de formulario


     //se for inicio da pagina exibe dados nos campos
    if pcCadastrodeclientes.ActivePage.TabIndex = 0 Then begin
      


      AlteraEnd := False;
      AlteraCep := False;

    // senao exibe nome do cliente no campo
    end else if pcCadastrodeclientes.ActivePage.TabIndex = 1 Then begin

      ExibeDadosAdicionalPista;//exibe os dados nos campos do formulario

      AlteraEnd := False;
      AlteraCep := False;

      lblCodCli.Caption           := ibDocumentacao.FieldByName('CODIGO').AsString;
      lblTracoAP.Caption          := ' - ';
      lblClienteAP.Caption        := ibCadastro.FieldByName('NOME').AsString;

   end;{if}
  end;{with}
end;

procedure TfrmClientes.ibeaPrimeiroClick(Sender: TObject);
begin

  with dmModule do begin


    if (ibeaAlterar.Caption = '&Atualizar') Or (ibeaNovo.Caption = '&Gravar') Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                            + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        DesabilitaCamposCli(False);
        DesabilitaCamposAP(False);
        LimpaAP;
        cboProduto.Enabled := False;


        ibeaAlterar.Caption     := '&Alterar';

        ibeaNovo.Caption        := '&Novo';

        ibeaNovo.Enabled        := True;
        ibeaAlterar.Enabled     := True;
        ibeaExcluir.Enabled     := True;
        ibeaConsultar.Enabled   := True;
        LimpaCampo;
        cboRamoAtiv.ClearSelection;

      end;

    end else begin

      //exibe dados do cliente em dados do cliente se for verdadeiro
      if pcCadastrodeclientes.ActivePage.TabIndex = 0 Then begin

        if (ibCadastro.Active) and (ibContato.Active) and (ibDocumentacao.Active) Then begin
          ibCadastro.First;
          ibContato.First;
          ibDocumentacao.First;
        end;
        ExibeDadosCliente;

      end else if pcCadastrodeclientes.ActivePage.TabIndex = 1 Then begin//exibe dados do adicional pista em dados do adicional pista se for verdadeiro

        if ibAdicionalpista.Active Then begin
          ibAdicionalpista.First;
        end;

        ExibeDadosAdicionalPista;

      end;{if pc cadclientes}

    end;{if}

  end;{with}

end;

procedure TfrmClientes.ibeaAnteriorClick(Sender: TObject);
begin

  with dmModule do begin

    if (ibeaAlterar.Caption = '&Atualizar') Or (ibeaNovo.Caption = '&Gravar') Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                            + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        DesabilitaCamposCli(False);
        DesabilitaCamposAP(False);
        LimpaAP;
        cboProduto.Enabled := False;


        ibeaAlterar.Caption     := '&Alterar';

        ibeaNovo.Caption        := '&Novo';

        ibeaNovo.Enabled        := True;
        ibeaAlterar.Enabled     := True;
        ibeaExcluir.Enabled     := True;
        ibeaConsultar.Enabled   := True;
        LimpaCampo;
        cboRamoAtiv.ClearSelection;

      end;

    end else begin

      //exibe dados do cliente em dados do cliente se for verdadeiro
      if pcCadastrodeclientes.ActivePage.TabIndex = 0 Then begin

        if (ibCadastro.Active) and (ibContato.Active) and (ibDocumentacao.Active) Then begin
          ibCadastro.Prior;
          ibContato.Prior;
          ibDocumentacao.Prior;
        end;
        ExibeDadosCliente;

      end else if pcCadastrodeclientes.ActivePage.TabIndex = 1 Then begin//exibe dados do adicional pista em dados do adicional pista se for verdadeiro

        if ibAdicionalpista.Active Then begin
          ibAdicionalpista.Prior;
        end;
        ExibeDadosAdicionalPista;

      end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmClientes.ibeaProximoClick(Sender: TObject);
begin

  with dmModule do begin

    if (ibeaAlterar.Caption = '&Atualizar') Or (ibeaNovo.Caption = '&Gravar') Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                            + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        DesabilitaCamposCli(False);
        DesabilitaCamposAP(False);
        LimpaAP;
        cboProduto.Enabled := False;

        ibeaAlterar.Caption     := '&Alterar';

        ibeaNovo.Caption        := '&Novo';

        ibeaNovo.Enabled        := True;
        ibeaAlterar.Enabled     := True;
        ibeaExcluir.Enabled     := True;
        ibeaConsultar.Enabled   := True;
        LimpaCampo;
        cboRamoAtiv.ClearSelection;

      end;

    end else begin

      //exibe dados do cliente em dados do cliente se for verdadeiro
      if pcCadastrodeclientes.ActivePage.TabIndex = 0 Then begin

        if (ibCadastro.Active) and (ibContato.Active) and (ibDocumentacao.Active) Then begin
          ibCadastro.Next;
          ibContato.Next;
          ibDocumentacao.Next;
        end;
        ExibeDadosCliente;

      end else if pcCadastrodeclientes.ActivePage.TabIndex = 1 Then begin//exibe dados do adicional pista em dados do adicional pista se for verdadeiro

        if ibAdicionalpista.Active Then begin
          ibAdicionalpista.Next;
        end;
        ExibeDadosAdicionalPista;

      end; {if}

    end; {if}

  end; {with}

end;

procedure TfrmClientes.ibeaUltimoClick(Sender: TObject);
begin

  with dmModule do begin

    if (ibeaAlterar.Caption = '&Atualizar') Or (ibeaNovo.Caption = '&Gravar') Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                            + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        DesabilitaCamposCli(False);
        DesabilitaCamposAP(False);
        LimpaAP;
        cboProduto.Enabled := False;
        
        ibeaAlterar.Caption     := '&Alterar';

        ibeaNovo.Caption        := '&Novo';

        ibeaNovo.Enabled        := True;
        ibeaAlterar.Enabled     := True;
        ibeaExcluir.Enabled     := True;
        ibeaConsultar.Enabled   := True;
        LimpaCampo;
        cboRamoAtiv.ClearSelection;

      end;

    end else begin

      //exibe dados do cliente em dados do cliente se for verdadeiro
      if pcCadastrodeclientes.ActivePage.TabIndex = 0 Then begin

        if (ibCadastro.Active) and (ibContato.Active) and (ibDocumentacao.Active) Then begin
          ibCadastro.Last;
          ibContato.Last;
          ibDocumentacao.Last;
        end; {if}
        ExibeDadosCliente;

      end else if pcCadastrodeclientes.ActivePage.TabIndex = 1 Then begin//exibe dados do adicional pista em dados do adicional pista se for verdadeiro

        if ibAdicionalpista.Active Then begin
          ibAdicionalpista.Last;
        end;
        ExibeDadosAdicionalPista;

      end; {if}

    end; {if}

  end; {with}
  
end;

procedure TfrmClientes.ibeaExcluirClick(Sender: TObject);
begin

  with dmModule do begin

   if (ibeaAlterar.Caption = '&Atualizar') Or (ibeaNovo.Caption = '&Gravar') Then begin

      
         ConfirmaMSG := Application.MessageBox('Deseja cancelar esta operação?'
                            + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        DesabilitaCamposCli(False);
        DesabilitaCamposAP(False);
        LimpaAP;
        cboProduto.Enabled := False;


        ibeaAlterar.Caption     := '&Alterar';

        ibeaNovo.Caption        := '&Novo';

        ibeaNovo.Enabled        := True;
        ibeaAlterar.Enabled     := True;
        ibeaExcluir.Enabled     := True;
        ibeaConsultar.Enabled   := True;
        LimpaCampo;
        cboRamoAtiv.ClearSelection;

      end;

    end else begin 


////////////////////////////////////////////////////////////////////////////////

      ConfirmaMSG := Application.MessageBox('Você deseja Excluir esse Registro?','Notificação: Exclusão de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
      if ConfirmaMSG = 6 Then begin

        //ADICIONA O IDCAD DO CADASTRO NA TABELA DE CADDESATIVADOS PARA NÃO EXCLUIR FISICAMENTE O REGISTRO
        ibCadastro.Close;
        ibCadastro.SQL.Clear;
        ibCadastro.SQL.Add('DELETE FROM TBLCADASTRO WHERE IDCAD=''' + InttoStr(IDCad) + '''');
        ibCadastro.Open;

        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('DELETE FROM TBLCONTATO WHERE IDCAD=''' + InttoStr(IDCad) + '''');
        ibContato.Open;

        ibLogradouro.Close;
        ibLogradouro.SQL.Clear;
        ibLogradouro.SQL.Add('DELETE FROM TBLLOGRADOURO WHERE IDCAD=''' + InttoStr(IDCad) + '''');
        ibLogradouro.Open;

        ibDocumentacao.Close;
        ibDocumentacao.SQL.Clear;
        ibDocumentacao.SQL.Add('DELETE FROM TBLCADDOCUMENTACAO WHERE IDCAD=''' + InttoStr(IDCad) + '''');
        ibDocumentacao.Open;

        ExecSELECT;

      end; {if}

    end;{if}

  end; {with}

end;

procedure TfrmClientes.ibeaAlterarClick(Sender: TObject);
var
RegAtual : Integer;
begin


  with dmModule do begin

    if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        ibeaNovo.Caption := '&Novo';
        DesabilitaCamposCli(False);

      end;{if}

      end else begin

////////////////////////////////////////////////////////////////////////////////

      if pcCadastrodeclientes.ActivePage.TabIndex = 0 then  begin // altera dados do primeiro tbs

        if (ibCadastro.RecordCount < 1)  And (ibContato.RecordCount < 1) And
           (ibLogradouro.RecordCount < 1) And (ibDocumentacao.RecordCount < 1) Then begin

           ConfirmaMSG := Application.MessageBox('Não existe registro para ser alterado!!'
                      + #13 + 'Clique em Ok para Retornar a operação normal.','Notificação: Cancelar Operação', MB_OK + MB_ICONWARNING);

        ibeaNovo.Caption := '&Novo';
        DesabilitaCamposCli(False);
        lbl_edtCep.Text := '';
        dbgClientes.Enabled := True;

        end else begin

        if lbl_edtNomerazao.Text = '' Then begin
           ConfirmaMSG := Application.MessageBox('É necessário selecionar um registro abaixo para ser alterado!!'
                      + #13 + 'Clique em Ok para Retornar a operação normal.','Notificação: Cancelar Operação', MB_OK + MB_ICONWARNING);
          ibeaAlterar.Caption := '&Alterar';

        end else begin


////////////////////////////////////////////////////////////////////////////////

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      if lbl_edtCep.Text = '' Then begin  {atribui  vlr 0 a variavel cep}
        Cep := 0;
      end else begin // caso esteja em branco atribui o vlr do campo na variavel cep
        Cep := strtoint( StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]) ); //SUBSTITUI REMOVENDO O -
      end;

      ConfirmaMSG := Application.MessageBox('Alterar esse Registro?','Notificação: Exclusão de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);

        if ConfirmaMSG = 6 Then begin

          RegAtual := ibCadastro.RecNo; //ATRIBUI O REGISTRO ATUAL, PARA QDO ALTERA-LO FIQUE SETADO NELE MESMO

          AlteraCadastro;//procedimento para alterar o cadastro
          AlteraDocumentacao;//procedimento para alterar a documentacao
          AlteraLogradouro;//procedimento para alterar o logradouro
          AlteraContato;//procedimento para alterar o contato

          LimparRamoAtividade := False;

          Commit(ibDocumentacao);
          Commit(ibRativ);
          Commit(ibContato);
          Commit(ibCadastro);

          ExecSELECT;

          ibCadastro.RecNo := RegAtual;

        end;

          ibeaAlterar.Caption := '&Alterar';
          ibeaNovo.Enabled := True;
          ibeaExcluir.Enabled := True;
          ibeaConsultar.Enabled := True;
          DesabilitaCamposCli(False);

        end else begin

          AlteraCep := True;//variavel para atribuir vlr boleano no cep
          AlteraEnd := True;//variavel para atribuir vlr boleano no cep

          ibeaAlterar.Caption := '&Atualizar';
          DesabilitaCamposCli(True);
          dbgClientes.Enabled := True;

        end;{if}

      end;{if}

    end;{if}

////////////////////////////////////////////////////////////////////////////////

    end else if pcCadastrodeclientes.ActivePage.TabIndex = 1  Then begin // se nao altera os dados do segundo tbs


    if ibAdicionalPista.RecordCount < 1 Then begin

      ConfirmaMSG := Application.MessageBox('Não existe registro para ser alterado em Adicional Pista!!'
              + #13 + 'Clique em Ok para Retornar a operação normal.','Notificação: Cancelar Operação', MB_OK + MB_ICONWARNING);

      ibeaIncluir.Caption := '&Incluir';
      DesabilitaCamposAP(False);
      dbgClientes.Enabled := True;

    end else begin

    ////////////////////////////////////////////////////////////////////////////////

      if ibeaAlterar.Caption = '&Atualizar' Then begin

        ConfirmaMSG := Application.MessageBox('Alterar esse Registro?','Notificação: Exclusão de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
        if ConfirmaMSG = 6 Then begin

        //traz a identificacao do funcionario do item do objeto selecionado.

        If cboFuncionario.ItemIndex = -1 Then begin

          StringFunc    := ', IDFUNC=''0''';

        end else begin

          ClassFunc      := TClasseCombo( cboFuncionario.Items.Objects[cboFuncionario.ItemIndex] );
          StringFunc     := ', IDFUNC=''' + InttoStr( ClassFunc.ID ) + '''';

        end;

        //////////////////////////////////////////////////////////////////////////////

          If cboProduto.ItemIndex = -1 Then begin

            StringProd    := ', IDPROD=''0''';

          end else begin

            ClassProd      := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
            StringProd     := ', IDPROD=''' + InttoStr( ClassProd.ID ) + '''';

          end;

            /////////////////////////////////////////////////////////////////////////////////

          If cboCondpagto.ItemIndex = -1 Then begin

            StringPagto    := ', IDPAGTO=''0''';

          end else begin

            ClassPagto      := TClasseCombo( cboCondpagto.Items.Objects[cboCondpagto.ItemIndex] );
            StringPagto     := ', IDPAGTO=''' + InttoStr( ClassPagto.ID ) + '''';

          end;

          //////////////////////////////////////////////////////////////////////////////////////////

          If cboTipoProd.ItemIndex = -1 Then begin

            StringTipoProd    := ', IDTIPOPROD=''0''';

          end else begin

            ClassTipoProd     := TClasseCombo( cboTipoProd.Items.Objects[cboTipoProd.ItemIndex] );
            StringTipoProd    := ', IDTIPOPROD=''' + InttoStr( ClassTipoProd.ID ) + '''';

          end;

          /////////////////////////////////////////////////////////////////////////////////////

            ibAdicionalPista.Close;
            ibAdicionalPista.SQL.Clear;
            ibAdicionalPista.SQL.Add('UPDATE ADICIONALPISTA SET '
            + 'VEICULO=''' + lbl_edtVeiculo.Text + ''''
            + StringFunc
            + StringProd
            + StringPagto
            + StringTipoProd
            + ',PLACA=''' + lbl_edtPlaca.Text + ''''
            + ',DATA = ''' + FormatDateTime('mm-dd-yyyy', dtpDataAd.Date) + ''''
            + ',CIDADE=''' + lbl_edtCidadecliente.Text + ''''
            + ',QTDE=''' + lbl_edtQtde.Text + ''''
            + ',ESTADO=''' + lbl_edtEstadocliente.Text + ''' WHERE IDADI=''' + InttoStr(IDadpista) + '''');

            ibAdicionalPista.ExecSQL;
            Commit(ibAdicionalPista);



          end;

            ExecSELECTAP; //traz os dados somente de adicional pista.
            ibeaAlterar.Caption     := '&Alterar';
            DesabilitaCamposAP(False);
            ibeaIncluir.Enabled     := True;
            cboProduto.Enabled      := False;//desabilita assim que grava

          end else begin

            cboProduto.Enabled      := True;
            ibeaAlterar.Caption     := '&Atualizar';
            DesabilitaCamposAP(True);
            //  ibeaIncluir.Enabled     := False;

          end;{if}

        end;{if}

      end;{if}


    end;{if}

  end; {with}

end;

procedure TfrmClientes.dbgDetalheprodCellClick(Column: TColumn);
begin

  with dmModule do begin
    ExibeDadosAdicionalPista;
  end; {with}

end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  MontaColunas := True;
  MontaColAP := True;
  MontaColHistorico := True;
end;

procedure TfrmClientes.ibeaConsultarClick(Sender: TObject);
begin
  frmBuscaClientes.ShowModal;
end;

procedure TfrmClientes.lbl_edtCepChange(Sender: TObject);
begin
  //se os campos abaixo for diferente de branco altera o endereco
{  if (lbl_edtCep.Text <> '00000-000') and (lbl_edtEndereco.Text <> '') and (AlteraCep) Then begin
    AlteraCep := False;//variavel para atribuir vlr boleano no cep
    ConfirmaMSG := Application.MessageBox('Ao alterar o Cep o sistema fará a busca do Endereço , deseja continuar?','Notificação: Alteração de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
    lbl_edtCep.Text := ibTempCep.FieldByName('CEP').AsString;
  end;}


  {  with dmModule do begin
    //se os campos abaixo for diferente de branco altera o cep
    if (lbl_edtEndereco.Text <> '') and (lbl_edtCep.Text <> '00000-000') and (AlteraCep) Then begin
      AlteraCep := False;//variavel para atribuir vlr boleano no cep
      ConfirmaMSG := Application.MessageBox('Ao alterar o Cep o Endereço será excluído, deseja continuar?','Notificação: Alteração de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);

      lbl_edtEndereco.Clear;
      lbl_edtBairro.Clear;
      lbl_edtCidade.Clear;
      lbl_edtEstado.Clear;

      ibLogradouro.Close;
      ibLogradouro.SQL.Clear;
      ibLogradouro.SQL.Add('DELETE  FROM TBLLOGRADOURO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
      ibLogradouro.Open;
      ExecSELECT;

    end;{if}
  //end;{with}
end;

procedure TfrmClientes.cboTipoProdClick(Sender: TObject);
begin
 cboProduto.Enabled := True;

 with dmModule do begin

    if cboTipoProd.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      IDTipoProd          := TClasseCombo( cboTipoProd.Items.Objects[cboTipoProd.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringTipoProd      := ' TIPOPROD=''' + InttoStr( IDTipoProd.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.

      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE ' + StringTipoProd);
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

procedure TfrmClientes.lbl_edtPesquisaCliChange(Sender: TObject);
begin

  with dmModule do begin

    //LOCALIZA E ABRE SOMENTE O CADASTRO DO CLIENTE PELA IDENTIFICAÇÃO.
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.


    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;    // TBLCONTATO.CONTATO As Telefone,TBLCONTATO.TIPO
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.IE_RG,TBLCADDOCUMENTACAO.CNPJ_CPF FROM TBLCADASTRO '
  //  + ' LEFT OUTER JOIN TBLCONTATO ON TBLCADASTRO.IDCAD = TBLCONTATO.IDCAD '
    + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
    + ' WHERE TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''' and TBLCADASTRO.NOME LIKE '+''''+'%'+lbl_edtPesquisaCli.text+'%'+'''');
    ibCadastro.Open;

   end; {with}

end;

procedure TfrmClientes.lbl_edtCepExit(Sender: TObject);

begin

  with dmModule do begin


   { if (lbl_edtCep.Text <> '00000-000') Then begin //se for diferente de branco

      if (lbl_edtCep.Text = '00000-000') and (lbl_edtEndereco.Text <> '') and (AlteraCep) Then begin

        AlteraCep := False;

      end else begin

        if (lbl_edtCep.Text <> '00000-000') Then begin

          CEPTemp := StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]);

          ibTempCep := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL

          with ibTempCep do begin

            ibTempCep.Database := IBDCep;
            ibTempCep.SQL.Clear;
            ibTempCep.SQL.Add('SELECT LOCAL,BAIRRO,CIDADE,UF,CEP FROM TBLCEP WHERE CEP=''' + CEPTemp + '''');
            ibTempCep.Open;

         if ibeaAlterar.Caption = '&Atualizar' Then begin


            ConfirmaMSG := Application.MessageBox('Você esta alterando o CEP e o Endereço informado será excluido. Deseja continuar?','Notificação: Alteração de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
            if ConfirmaMSG = 6 Then begin

              lbl_edtEndereco.Text := FieldByName('LOCAL').AsString;
              lbl_edtBairro.Text   := FieldByName('BAIRRO').AsString;
              lbl_edtCidade.Text   := FieldByName('CIDADE').AsString;
              lbl_edtEstado.Text   := FieldByName('UF').AsString;
              lbl_edtCep.Text      := FieldByName('CEP').AsString;  }

        //    end; {if}
      //   end;{if}
       //   end;{with}

      //   end;{if}

    //   end;{if}

      //DEFINE O FORMATO PARA O CAMPO DO CEP
      if lbl_edtCep.Text <> '' Then begin

        lbl_edtCep.Text := StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]);
        lbl_edtCep.Text := FormatFloat('00000-000',StrToFloat(lbl_edtCep.Text));

      end;
   //   AlteraEnd := False;//variavel para atribuir vlr boleano no cep

   // end; {if}

  end;{with}


end;


procedure TfrmClientes.lbl_edtEnderecoExit(Sender: TObject);
begin
  AlteraEnd := True;
  //se os campos abaixo for diferente de branco altera o endereco
  if (lbl_edtCep.Text <> '00000-000') And (lbl_edtEndereco.Text <> '') And AlteraEnd Then begin

    ConfirmaMSG := Application.MessageBox('Você está alterando o Endereço e o CEP informado será excluido. Deseja continuar?','Notificação: Alteração de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
    if ConfirmaMSG = 6 Then begin
      lbl_edtCep.Text := '00000-000';
    end; {if}

  end; {if}

end;

procedure TfrmClientes.AlterarAdicionalPista1Click(Sender: TObject);

begin

 with dmModule do begin



    if pcCadastrodeclientes.ActivePage.TabIndex = 1 then  begin

      ConfirmaMSG := Application.MessageBox('Você deseja Excluir esse Registro?','Notificação: Exclusão de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
      if ConfirmaMSG = 6 Then begin

        //ADICIONA O IDCAD DO CADASTRO NA TABELA DE CADDESATIVADOS PARA NÃO EXCLUIR FISICAMENTE O REGISTRO
        ibAdicionalpista.Close;
        ibAdicionalpista.SQL.Clear;
        ibAdicionalpista.SQL.Add('INSERT INTO TBLCADDESATIVADOS (IDCAD) values (''' + InttoStr(IDCad) + ''')');
        ibAdicionalpista.Open;

        ExecSELECTAP;

      end{if}

    end;{if}  

  end;{with}

end;

procedure TfrmClientes.lbl_edtCnpj_cpfExit(Sender: TObject);
begin

  if (rdgrTipodecliente.ItemIndex = 0) Then begin

    lbl_edtCnpj_cpf.Text := CPF(lbl_edtCnpj_cpf.Text);

  end else begin

    lbl_edtCnpj_cpf.Text := CGC(lbl_edtCnpj_cpf.Text);

  end;{if}

end;

procedure TfrmClientes.lbl_edtTelComExit(Sender: TObject);
begin

  if lbl_edtTelCom.Text <> '' Then begin

    lbl_edtTelCom.Text := StringReplace(lbl_edtTelCom.Text,'-','',[rfReplaceAll]);
    lbl_edtTelCom.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtTelCom.Text));

  end;

end;

procedure TfrmClientes.lbl_edtTelFaxExit(Sender: TObject);
begin

  if lbl_edtTelFax.Text <> '' Then begin

    lbl_edtTelFax.Text := StringReplace(lbl_edtTelFax.Text,'-','',[rfReplaceAll]);
    lbl_edtTelFax.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtTelFax.Text));

  end;

end;

procedure TfrmClientes.lbl_edtCelularExit(Sender: TObject);
begin

  if lbl_edtCelular.Text <> '' Then begin

    lbl_edtCelular.Text := StringReplace(lbl_edtCelular.Text,'-','',[rfReplaceAll]);
    lbl_edtCelular.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtCelular.Text));

  end;

end;

procedure TfrmClientes.sb_ord_codClick(Sender: TObject);
begin



  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.


    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;   // TBLCONTATO.CONTATO As Telefone,TBLCONTATO.TIPO
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.IE_RG,TBLCADDOCUMENTACAO.CNPJ_CPF FROM TBLCADASTRO '
 //   + ' LEFT OUTER JOIN TBLCONTATO ON TBLCADASTRO.IDCAD = TBLCONTATO.IDCAD '
    + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
    + ' WHERE TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''' ORDER BY TBLCADDOCUMENTACAO.CODIGO');
    ibCadastro.Open;

   end; {with}

end;

procedure TfrmClientes.sb_ord_nomeClick(Sender: TObject);
begin

  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.

    //LOCALIZA O TELEFONE COMERCIAl
  {  ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
    ibClassificacao.Open;
    IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;}//atribui a identiicacao do contato de telefone coml. na variavel.

    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;   //  TBLCONTATO.CONTATO As Telefone,TBLCONTATO.TIPO
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.IE_RG,TBLCADDOCUMENTACAO.CNPJ_CPF FROM TBLCADASTRO '
 //   + ' LEFT OUTER JOIN TBLCONTATO ON TBLCADASTRO.IDCAD = TBLCONTATO.IDCAD '
    + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
    + ' WHERE TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''' ORDER BY TBLCADASTRO.NOME');
    ibCadastro.Open;

   end; {with}

end;

end.






