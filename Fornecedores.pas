unit Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, classComboBox,
  IBDatabase, IBQuery, ComCtrls,
  Buttons;


type
  TfrmFornecedores = class(TForm)
    grpbDadosfornec: TGroupBox;
    lbl_edtCodigo: TLabeledEdit;
    lbl_edtNome: TLabeledEdit;
    lbl_edtNomefantasia: TLabeledEdit;
    lbl_edtEndereco: TLabeledEdit;
    lbl_edtBairro: TLabeledEdit;
    lbl_edtCidade: TLabeledEdit;
    lbl_edtEstado: TLabeledEdit;
    lbl_edtCep: TLabeledEdit;
    lbl_edtTelcom: TLabeledEdit;
    lbl_edtCnpj: TLabeledEdit;
    lbl_edtIE: TLabeledEdit;
    lbl_edtEmail: TLabeledEdit;
    lbl_edtCelular: TLabeledEdit;
    GroupBox1: TGroupBox;
    lbl_edtPesquisa: TLabeledEdit;
    dbgFornecedor: TDBGrid;
    lbl_edtSite: TLabeledEdit;
    lbl_edtContato: TLabeledEdit;
    lbl_edtNumero: TLabeledEdit;
    lbl_edtCompl: TLabeledEdit;
    lbl_edtDDD: TLabeledEdit;
    lbl_edtDDDFax: TLabeledEdit;
    lbl_edtTelFax: TLabeledEdit;
    lbl_edtPontoreferencia: TLabeledEdit;
    lbl_edtObs: TLabeledEdit;
    lblData: TLabel;
    sb_ord_nome: TSpeedButton;
    sb_ord_cod: TSpeedButton;
    lblDadoscliente: TLabel;
    lbl_edtDesconto: TLabeledEdit;
    lbl_CondPagto: TLabel;
    dtpDataForn: TDateTimePicker;
    cboCondPagto: TComboBox;
    ibeaNovo: TSpeedButton;
    ibeaAlterar: TSpeedButton;
    ibeaExcluir: TSpeedButton;
    ibeaSair: TSpeedButton;

    procedure Commit(IBQueryExec : TIBQuery);
    procedure DesabilitaCampos(opcao:Boolean);
    procedure AlteraCadastro;//serve para dar update na tblcadastro.
    procedure AlteraDocumentacao;//serve para dar update na tblcaddocumentacao.
    procedure AlteraLogradouro;//serve para dar update na tbllogradouro.
    procedure AlteraContato;//serve para dar update na tblcontato
    procedure LimpaCampo;
    procedure ExibeDadosFornecedor;
    procedure ExecSELECT;
    procedure ExecSELECTCondPagto;
    procedure ibeaNovoClick(Sender: TObject);
    procedure dbgFornecedorCellClick(Column: TColumn);
    procedure ibeaSairClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_edtCepChange(Sender: TObject);
    procedure lbl_edtCepExit(Sender: TObject);
    procedure lbl_edtEnderecoExit(Sender: TObject);
    procedure lbl_edtCnpjExit(Sender: TObject);
    procedure lbl_edtPesquisaChange(Sender: TObject);
    procedure sb_ord_nomeClick(Sender: TObject);
    procedure sb_ord_codClick(Sender: TObject);
    procedure lbl_edtTelcomExit(Sender: TObject);
    procedure lbl_edtCelularExit(Sender: TObject);
    procedure dbgFornecedorDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);





  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedores: TfrmFornecedores;
  ConfirmaMSG : Integer;
  IDCad : Integer;
  IDCadNovo : Integer;
  IDClass : Integer; // variavel para trazer dados da tbl de classificacao
  Cep : Integer; //variavel para atribuir o vlr do cep.
  MontaColunas : Boolean; //VARIAVEL USADA PARA DETERMINAR SE A COLUNA JÀ FOI CRIADA OU NÃO
  AlteraCep : Boolean;
  AlteraEnd : Boolean;
  IDClassTelcom : Integer;//variavel para armazenar a classificação do campo telcoml
  IDClassCelular: Integer;// variavel para armazenar a classificacao do campo celular.
  IDClassTelfax: Integer; //variavel para armazenar a classificação do campo telfax
  IDClassEmail: Integer;//variavel para armazenar a classificação do campo email
  IDClassSite: Integer;// variavel para armazenar a classificação do campo site.
  IDClassContato: Integer;// variavel para armazenar a classificação do campo contato

  CepTemp : String;
  ibTempCep  : TIBQuery;//atribui valor a componente criado
  IDClassCondPagto : TClasseCombo;
  StringGravaCondPagto : String;
  IDGravaCondPagto : TClasseCombo;
  StringAltCondPagto : String;
  IDAltCondPagto : TClasseCombo;


  implementation

uses  DB, untdmModule, funcPosto;

{$R *.dfm}


////////////////////////////////////////////////////////////////////////////////
Function CGC(CGC : string): string;
beginResult := Copy(CGC,1,2)+'.'+Copy(CGC,3,3)+'.'+Copy(CGC,6,3)+'/'+Copy(CGC,9,4)+'-'+Copy(CGC,13,2);end;
////////////////////////////////////////////////////////////////////////////////


procedure TfrmFornecedores.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmFornecedores.DesabilitaCampos(opcao:boolean);
begin
  lbl_edtCodigo.Enabled := opcao;
  lbl_edtNome.Enabled := opcao;
  lbl_edtNomefantasia.Enabled := opcao;
  dtpDataForn.Enabled := opcao;
  lbl_edtSite.Enabled := opcao;
  lbl_edtEndereco.Enabled := opcao;
  lbl_edtBairro.Enabled := opcao;
  lbl_edtCep.Enabled := opcao;
  lbl_edtTelcom.Enabled := opcao;
  lbl_edtTelFax.Enabled := opcao;
  lbl_edtDDD.Enabled := opcao;
  lbl_edtDDDFax.Enabled := opcao;
  lbl_edtCelular.Enabled := opcao;
  lbl_edtCidade.Enabled := opcao;
  lbl_edtEstado.Enabled := opcao;
  lbl_edtCnpj.Enabled := opcao;
  lbl_edtIE.Enabled := opcao;
  lbl_edtEmail.Enabled := opcao;
  lbl_edtContato.Enabled := opcao;
  lbl_edtPontoreferencia.Enabled := opcao;
  lbl_edtObs.Enabled := opcao;
  lbl_edtNumero.Enabled := opcao;
  lbl_edtCompl.Enabled := opcao;
  cboCondPagto.Enabled := opcao;
  lbl_edtDesconto.Enabled := opcao;

end;

procedure TfrmFornecedores.AlteraCadastro;
begin
  with dmModule do begin


    If cboCondPagto.ItemIndex = -1 Then begin

      StringAltCondPagto     := ' IDCONDPAGTO= ''0'',';

    end else begin

      IDAltCondPagto      := TClasseCombo( cboCondPagto.Items.Objects[cboCondPagto.ItemIndex] );
      StringAltCondPagto        := ' IDCONDPAGTO=''' + InttoStr( IDAltCondPagto.ID ) + ''',';

    end;//if


    //GRAVA AS ALTERACOES NA TBL DE CADASTRO
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('UPDATE TBLCADASTRO SET '
    + StringAltCondPagto
    + 'NOME = ''' + lbl_edtNome.Text + ''','
    + 'NUMERO = ''' + lbl_edtNumero.Text + ''','
    + 'COMPL = ''' + lbl_edtCompl.Text + ''','
    + 'CEP = ''' + InttoStr(Cep) + ''','
    + 'PONTOREFERENCIA = ''' + lbl_edtPontoreferencia.Text + ''','
    + 'DESCONTO = ''' + lbl_edtDesconto.Text + ''','
    + 'OBS = ''' + lbl_edtObs.Text + ''' WHERE IDCad=''' + InttoStr(IDCad) + '''');
    ibCadastro.ExecSQL;
    TRCadastro.Commit;

  end;
end;

procedure TfrmFornecedores.AlteraDocumentacao;
begin
  with dmModule do begin

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
      + 'CNPJ_CPF = ''' + lbl_edtCnpj.Text + ''''
      + ',IE_RG = ''' + lbl_edtIE.Text + ''''
      + ',CODIGO = ''' + lbl_edtCodigo.Text + ''''
      + ',NOMEFANTASIA = ''' + lbl_edtNomefantasia.Text + ''' WHERE IDCad=''' + InttoStr(IDCad) + '''');
      ibDocumentacao.ExecSQL;
      TRDocumentacao.Commit;

    end else begin//senao grava os registros

        //insere dados na tblcaddocumentacao
        ibDocumentacao.Close;
        ibDocumentacao.SQL.Clear;
        ibDocumentacao.SQL.Add('INSERT INTO TBLCADDOCUMENTACAO '
        + ' (IDCAD,NOMEFANTASIA,IE_RG,CODIGO,CNPJ_CPF) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + lbl_edtNomefantasia.Text + ''','
        + ' ''' + lbl_edtIE.Text + ''','
        + ' ''' + lbl_edtCodigo.Text + ''','
        + ' ''' + lbl_edtCnpj.Text + ''')');
        ibDocumentacao.ExecSQL;

    end;{if}

  end;{with}

end;

procedure TfrmFornecedores.AlteraLogradouro;
begin

{  if ((lbl_edtCep.Text = '') and (lbl_edtEndereco.Text <> '')) Or
     ((lbl_edtCep.Text = '00000-000') and (lbl_edtEndereco.Text <> ''))  Then begin  }

  if lbl_edtEndereco.Text <> '' Then begin

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

      end; {if}

    end; {with}

  end; {if}

end;

procedure TfrmFornecedores.AlteraContato;
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
      IDClassCelular := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone fax. na variavel.

      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassCelular) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtCelular.Text +  ''''
        + ',DDD = ''' + IntToStr(IDClassCelular) + ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassCelular) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;
      end else begin

        //inicio de rotina para gravação de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassCelular) + ''',''' + IntToStr(IDClassCelular) + ''','
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

procedure TfrmFornecedores.LimpaCampo;//limpa os campos ao abrir o formulario.
begin
  lbl_edtCodigo.Clear;
  lbl_edtNome.Clear;
  lbl_edtNomefantasia.Clear;
  lbl_edtSite.Clear;
  lbl_edtEndereco.Clear;
  lbl_edtBairro.Clear;
  lbl_edtCep.Clear;
  lbl_edtTelcom.Clear;
  lbl_edtTelFax.Clear;
  lbl_edtDDD.Clear;
  lbl_edtDDDFax.Clear;
  lbl_edtCelular.Clear;
  lbl_edtCidade.Clear;
  lbl_edtEstado.Clear;
  lbl_edtCnpj.Clear;
  lbl_edtIE.Clear;
  lbl_edtEmail.Clear;
  lbl_edtContato.Clear;
  lbl_edtPontoreferencia.Clear;
  lbl_edtObs.Clear;
  lbl_edtNumero.Clear;
  lbl_edtCompl.Clear;
  cboCondPagto.ClearSelection;
  lbl_edtDesconto.Clear;
end;


procedure TfrmFornecedores.ExecSELECT;  //procedimento para seletar sql
begin
  with dmModule do begin

    //LOCALIZA E ABRE SOMENTE O CADASTRO DO FORNECEDOR PELA IDENTIFICAÇÃO.
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCADDOCUMENTACAO.NOMEFANTASIA As NomeFantasia,'
    + ' TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.CNPJ_CPF,TBLCADDOCUMENTACAO.IE_RG,'
    + ' TBLLOGRADOURO.ENDERECO,TBLLOGRADOURO.BAIRRO,TBLLOGRADOURO.CIDADE,TBLLOGRADOURO.ESTADO FROM TBLCADASTRO '
    + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
    + ' LEFT OUTER JOIN TBLLOGRADOURO ON TBLCADASTRO.IDCAD = TBLLOGRADOURO.IDCAD '
    + ' WHERE (TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''') ORDER BY TBLCADASTRO.NOME');
    ibCadastro.Open;

   { //BUSCA TODOS OS FORNECEDORES QUE ESTEJAM NA CLASSIFICAÇÃO DE FORNECEDORES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    //seleciona tudo da tblcadastro e da tblcaddocumentacao o codigo o cpf_cnpj o rg e a ie pra tbl de cadastro relacionar com a tbl documentacao onde o id cad da tbl cadastro é igual a da tbl documentacao onde a variavel vai retornar um valor.
    //ibCadastro.SQL.Add('SELECT TBLCADASTRO.*, TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.cnpj_cpf,TBLCADDOCUMENTACAO.rg_ie  FROM TBLCADASTRO INNER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD'
    //+ ' WHERE TBLCADASTRO.IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY TBLCADASTRO.NOME');
    ibCadastro.Open;}

   { ibContato.Close;
    ibContato.SQL.Clear;
    ibContato.SQL.Add('SELECT * FROM TBLCONTATO');
    ibContato.Open;}

  {  ibDocumentacao.Close;
    ibDocumentacao.SQL.Clear;
    ibDocumentacao.SQL.Add('SELECT * FROM TBLCADDOCUMENTACAO');
    ibDocumentacao.Open; }

   { ibLogradouro.Close;
    ibLogradouro.SQL.Clear;
    ibLogradouro.SQL.Add('SELECT * FROM TBLLOGRADOURO');
    ibLogradouro.Open;}
  end;
end;

procedure TfrmFornecedores.ExecSELECTCondPagto;

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

procedure TfrmFornecedores.ExibeDadosFornecedor; //procedimento criado para exibir os dados da tbl nos campos

var

i : Integer;

begin
  with dmModule do begin

    IDCad := ibCadastro.FieldByName('IDCAD').AsInteger; //ATRIBUI O IDCAD DO CADASTRO A VARIAVEL

////////////////////////////////////////////////////////////////////////////////


    for i:=0 to cboCondPagto.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboCondPagto.Items.Objects[i]).ID = ibCadastro.FieldByName('IDCONDPAGTO').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboCondPagto.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboCondPagto.ClearSelection;//LIMPA A SELECAO.
      end;{if}
    end;{for}

////////////////////////////////////////////////////////////////////////////////



    //traz os dados nos campos se houver registro
    if ibCadastro.RecordCount > 0  Then begin
      lbl_edtNome.Text               := ibCadastro.FieldByName('NOME').AsString;
      lbl_edtCep.Text                := FormatFloat('00000-000',ibCadastro.FieldByName('CEP').AsInteger);
      lbl_edtNumero.Text             := ibCadastro.FieldByName('NUMERO').AsString;
      lbl_edtCompl.Text              := ibCadastro.FieldByName('COMPL').AsString;
      lbl_edtPontoreferencia.Text    := ibCadastro.FieldByName('PONTOREFERENCIA').AsString;
      lbl_edtObs.Text                := ibCadastro.FieldByName('OBS').AsString;
      dtpDataForn.Date               := ibCadastro.FieldByName('DATA').AsDateTime;
      lbl_edtDesconto.Text           := ibCadastro.FieldByName('DESCONTO').AsString;
    //limpa os campos se nao houver registro.
    end else begin
      lbl_edtNome.Clear;
      lbl_edtCep.Clear;
      lbl_edtNumero.Clear;
      lbl_edtCompl.Clear;
      lbl_edtPontoreferencia.Clear;
      lbl_edtObs.Clear;
    end;
      // ROTINA PARA TRAZER OS DADOS DO CONTATO DO FORNECEDOR

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

    //traz os dados nos campos se houver registro
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

      //traz os dados nos campos se houver registro
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
      IDClassCelular := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone celular na variavel.

      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassCelular) + ''')');
      ibContato.Open;

    //traz os dados nos campos se houver registro
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

    //traz os dados nos campos se houver registro
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

    //traz os dados no campos se houver registro
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
      IDClassContato := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identificacao do email na variavel.

      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD=''' + IntToStr(IDCad) + ''') And (Tipo=''' + IntToStr(IDClassContato) + ''')');
      ibContato.Open;

     //traz os dados nos campos se houver registro
    if ibContato.RecordCount > 0 Then begin
      lbl_edtContato.Text        := ibContato.FieldByName('CONTATO').AsString;//TRAZ O CONTATO.
    // limpa os campos se nao houver registro.
    end else begin
      lbl_edtContato.Clear;
    end;

      //LOCALIZA OS DADOS DA TBLCADDOCUMENTACAO.
      ibDocumentacao.Close;
      ibDocumentacao.SQL.Clear;
      ibDocumentacao.SQL.Add('SELECT NOMEFANTASIA,CNPJ_CPF,CODIGO,IE_RG FROM TBLCADDOCUMENTACAO WHERE'
      + ' IDCAD=''' + IntToStr(IDCad) + '''');
      ibDocumentacao.Open;

      //traz os dados no campo se houver registro
      if ibDocumentacao.RecordCount > 0 Then begin

        lbl_edtCodigo.Text              := ibDocumentacao.FieldByName('CODIGO').AsString;
        lbl_edtNomefantasia.Text        := ibDocumentacao.FieldByName('NOMEFANTASIA').AsString;//TRAZ O NOME FANTASIA.
        lbl_edtCnpj.Text                := ibDocumentacao.FieldByName('CNPJ_CPF').AsString;//TRAZ O CNPJ DO FORNECEDOR.
        lbl_edtIE.Text                  := ibDocumentacao.FieldByName('IE_RG').AsString;//TRAZ A IE E O RG DO FORNECEDOR

      // limpa os campos se nao houver registro.
      end else begin
        lbl_edtNomefantasia.Clear;
        lbl_edtCnpj.Clear;
        lbl_edtIE.Clear;
      end;

 ////////////////////////////////////////////////////////////////////////////////////////////////

      // se o cep da tbl cadastro for diferente de branco
    {    if ibCadastro.FieldByName('CEP').AsInteger <> 0 Then begin

          CEPTemp := StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]);//atribui o traco na variavel cep

          ibTempCep := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL

        with ibTempCep do begin

          //faz select da tbl cep atraves do componente criado
          ibTempCep.Database := IBDCep;
          ibTempCep.SQL.Clear;
          ibTempCep.SQL.Add('SELECT LOCAL,BAIRRO,CIDADE,UF,CEP FROM TBLCEP WHERE CEP=''' + CEPTemp + '''');
          ibTempCep.Open;

        end;{with}
          //traz os dados da tbl no campo.
       {   lbl_edtEndereco.Text := ibTempCep.FieldByName('LOCAL').AsString;
          lbl_edtBairro.Text   := ibTempCep.FieldByName('BAIRRO').AsString;
          lbl_edtCidade.Text   := ibTempCep.FieldByName('CIDADE').AsString;
          lbl_edtEstado.Text   := ibTempCep.FieldByName('UF').AsString; }
        //  lbl_edtCep.Text      := FormatFloat('00000-000',ibTempCep.FieldByName('CEP').AsInteger);

       // end else begin  }


      //LOCALIZA OS DADOS DA TBLLOGRADOURO.
      ibLogradouro.Close;
      ibLogradouro.SQL.Clear;
      ibLogradouro.SQL.Add('SELECT ENDERECO,BAIRRO,CIDADE,ESTADO FROM TBLLOGRADOURO WHERE'
      + ' IDCAD=''' + IntToStr(IDCad) + '''');
      ibLogradouro.Open;

     //traz os dados no campo se houver registro
      if ibLogradouro.RecordCount > 0 Then begin

        lbl_edtEndereco.Text           := ibLogradouro.FieldByName('ENDERECO').AsString;//TRAZ O ENDERECO.
        lbl_edtBairro.Text             := ibLogradouro.FieldByName('BAIRRO').AsString;//TRAZ O BAIRRO.
        lbl_edtCidade.Text             := ibLogradouro.FieldByName('CIDADE').AsString;//TRAZ A CIDADE
        lbl_edtEstado.Text             := ibLogradouro.FieldByName('ESTADO').AsString;//TRAZ O ETADO

      //limpa os campos se nao houver registro.
      end else begin

        lbl_edtEndereco.Clear;
        lbl_edtBairro.Clear;
        lbl_edtCidade.Clear;
        lbl_edtEstado.Clear;

      end;

  //  end;

  end;

end;

procedure TfrmFornecedores.ibeaNovoClick(Sender: TObject);
begin

// ibeaAlterar.Enabled := False;
// ibeaExcluir.Enabled := False;
// ibeaConsultar.Enabled := False;

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
        DesabilitaCampos(False);
        LimpaCampo;

      end;{if}

    end else begin



/////////////////////////////////////////////////////////////////////////////////

    if ibeaNovo.Caption = '&Gravar' Then begin

    if lbl_edtCep.Text = '' Then begin  {atribui  vlr 0 a variavel cep}
      Cep := 0;
    end else begin // caso esteja em branco atribui o vlr do campo na variavel cep
      Cep := strtoint( StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]) );
    end;

      //insere na tabela os dados digitados nos campos determinados abaixo.

      //traz a identificacao do item do objeto selecionado
      if cboCondPagto.ItemIndex = - 1 Then begin

        StringGravaCondPagto    := ' ''0'',';

      end else begin

        IDGravaCondPagto        := TClasseCombo(cboCondPagto.Items.Objects[cboCondPagto.ItemIndex]);
        StringGravaCondPagto    := ' ''' + IntToStr(IDGravaCondPagto.ID) + ''',';

      end;

      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('INSERT INTO TBLCADASTRO '
      + ' (IDCLASS,NOME,NUMERO,COMPL,PONTOREFERENCIA,OBS,DATA,IDCONDPAGTO,DESCONTO,CEP) values '
      + ' (''' + IntToStr(IDClass) + ''',''' + lbl_edtNome.Text + ''','
      + ' ''' + lbl_edtNumero.Text + ''',''' + lbl_edtCompl.Text + ''', '
      + ' ''' + lbl_edtPontoreferencia.Text + ''',''' + lbl_edtObs.Text + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy', dtpDataForn.Date) + ''','
      + StringGravaCondPagto
      + ' ''' + lbl_edtDesconto.Text + ''','
      + ' ''' + IntToStr(Cep) + ''')');
      ibCadastro.ExecSQL;

      //select para trazer o nome do fornecedor no campo abaixo atraves do id
      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('SELECT IDCAD FROM TBLCADASTRO WHERE NOME=''' + lbl_edtNome.Text + '''');
      ibCadastro.Open;
      IDCadNovo := ibCadastro.FieldByName('IDCAD').AsInteger;//atribui o id do nome a variavel.

      //grava dados na tbllogradouro se cep nao for preenchido
   {  if ((lbl_edtCep.Text = '') and (lbl_edtEndereco.Text <> '')) Or
        ((lbl_edtCep.Text = '00000-000') and (lbl_edtEndereco.Text <> ''))  Then begin  }

     if lbl_edtEndereco.Text <> '' Then begin

        ibLogradouro.Close;
        ibLogradouro.SQL.Clear;
        ibLogradouro.SQL.Add('INSERT INTO TBLLOGRADOURO '
        + ' (IDCAD,ENDERECO,BAIRRO,ESTADO,CIDADE) values '
        + ' (''' + IntToStr(IDCadNovo) + ''',''' + lbl_edtEndereco.Text + ''',''' + lbl_edtBairro.Text + ''','
        + ' ''' + lbl_edtEstado.Text + ''','
        + ' ''' + lbl_edtCidade.Text + ''')');
        ibLogradouro.ExecSQL;
      end;

    // if lbl_edtTelcom.Text <> '' Then begin
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
        + ' (''' + IntToStr(IDCadNovo) + ''',''' + inttostr(IDClassTelcom) + ''',''' + lbl_edtDDD.Text + ''','
        + ' ''' + lbl_edtTelcom.Text + ''')');
        ibContato.ExecSQL;
     // end;

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
        + ' (IDCAD,TIPO,CONTATO) values '
        + ' (''' + IntToStr(IDCadNovo) + ''',''' + inttostr(IDClassTelfax) + ''','
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
        IDClassCelular := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identificacao do contato de celular na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,CONTATO) values '
        + ' (''' + IntToStr(IDCadNovo) + ''',''' + inttostr(IDClassCelular) + ''','
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
        + ' (''' + IntToStr(IDCadNovo) + ''',''' + inttostr(IDClassEmail) + ''',''0'','
        + ' ''' + lbl_edtEmail.Text + ''')');
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
        + ' (''' + IntToStr(IDCadNovo) + ''',''' + inttostr(IDClassSite) + ''',''0'','
        + ' ''' + lbl_edtSite.Text + ''')');
        ibContato.ExecSQL;
      end;

      if lbl_edtContato.Text <> '' Then begin

        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Contato''');
        ibClassificacao.Open;
        IDClassContato := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do site na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + '(IDCAD,TIPO,DDD,CONTATO) values '
        + '(''' + IntToStr(IDCadNovo) + ''',''' + IntToStr(IDClassContato) + ''',''0'','
        + ' ''' + lbl_edtContato.Text + ''')');
        ibContato.ExecSQL;

      end;

        //insere dados na tblcaddocumentacao
        ibDocumentacao.Close;
        ibDocumentacao.SQL.Clear;
        ibDocumentacao.SQL.Add('INSERT INTO TBLCADDOCUMENTACAO '
        + ' (IDCAD,NOMEFANTASIA,IE_RG,CODIGO,CNPJ_CPF) values '
        + ' (''' + IntToStr(IDCadNovo) + ''',''' + lbl_edtNomefantasia.Text + ''','
        + ' ''' + lbl_edtIE.Text + ''','
        + ' ''' + lbl_edtCodigo.Text + ''','
        + ' ''' + lbl_edtCnpj.Text + ''')');
        ibDocumentacao.ExecSQL;


        Commit(ibDocumentacao);
        Commit(ibContato);
        Commit(ibCadastro);

        ExecSELECT;

        ibeaNovo.Caption := '&Novo';
        DesabilitaCampos(False);
        ibeaAlterar.Enabled := True;
        ibeaExcluir.Enabled := True;
      //  ibeaConsultar.Enabled := True;

      end else begin
        ibeaNovo.Caption := '&Gravar';
        DesabilitaCampos(True);
        lbl_edtCodigo.SetFocus;
        LimpaCampo;
        lbl_edtCep.Text := '0';
        lbl_edtCep.Text := FormatFloat('00000-000',StrToFloat(lbl_edtCep.Text));

      end;
end;{if}

  end;
end;

procedure TfrmFornecedores.dbgFornecedorCellClick(Column: TColumn);
begin
  ExibeDadosFornecedor;
  AlteraCep := False;
  AlteraEnd := False;
end;

procedure TfrmFornecedores.ibeaSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmFornecedores.ibeaAlterarClick(Sender: TObject);
begin

  with dmModule do begin

  if ibeaNovo.Caption = '&Gravar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar esta operação?'
              + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

    if ConfirmaMSG = 6 Then begin

      ibeaNovo.Caption := '&Novo';
      DesabilitaCampos(False);

    end;{if}

    end else begin





        if (ibCadastro.RecordCount < 1)  And (ibContato.RecordCount < 1) And
          (ibLogradouro.RecordCount < 1) And (ibDocumentacao.RecordCount < 1) Then begin

          ConfirmaMSG := Application.MessageBox('Não existe registro para ser alterado!!'
                  + #13 + 'Clique em Ok para Retornar a operação normal.','Notificação: Cancelar Operação', MB_OK + MB_ICONWARNING);

          ibeaNovo.Caption := '&Novo';
          DesabilitaCampos(False);
          lbl_edtCep.Text := '';
          lbl_edtCodigo.Text := '';

        end else begin

//////////////////////////////////////////////////////////////////////////////

     if lbl_edtNome.Text = '' Then begin
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

            AlteraCadastro;//procedimento para alteracao dos campos na tblcadastro
            AlteraDocumentacao;//procedimento para alteracao dos campos na tblcaddocumentacao
            AlteraLogradouro;//procedimento para alteracao dos campos na tbllogradouro
            AlteraContato;//procedimento para alteracao dos campos na tblcontato.

            Commit(ibDocumentacao);
            Commit(ibContato);
            Commit(ibCadastro);

            ExecSELECT;

          end;

            ibeaAlterar.Caption := '&Alterar';
            DesabilitaCampos(False);
            ibeaNovo.Enabled := True;
            ibeaExcluir.Enabled := True;
          //  ibeaConsultar.Enabled := True;

          end else begin

          //  AlteraEnd := True;
          //  AlteraCep := True;

            ibeaAlterar.Caption := '&Atualizar';
            DesabilitaCampos(True);

          end;
        end;{if}
      end;{if}
    end;
  end;
end;


procedure TfrmFornecedores.ibeaExcluirClick(Sender: TObject);
begin

  with dmModule do begin

    ConfirmaMSG := Application.MessageBox('Deseja Excluir o registro?','Notificação:Exclusão de Registro.',+ MB_YESNO + MB_ICONQUESTION);

    if ConfirmaMSG = 6 Then begin

      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('DELETE FROM TBLCADASTRO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
      ibCadastro.Open;

      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('DELETE FROM TBLCONTATO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
      ibContato.Open;

      ibDocumentacao.Close;
      ibDocumentacao.SQL.Clear;
      ibDocumentacao.SQL.Add('DELETE FROM TBLCADDOCUMENTACAO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
      ibDocumentacao.Open;

      ibLogradouro.Close;
      ibLogradouro.SQL.Clear;
      ibLogradouro.SQL.Add('DELETE FROM TBLLOGRADOURO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
      ibLogradouro.Open;


      ExecSELECT;

      LimpaCampo;

    end;{confirmamsg}

  end;{with}

end;

procedure TfrmFornecedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key); //Deixa todos os textos em maiusculo
    if Key = #13 Then begin
      //Desabilita o processamento posterior da tecla
      Key := #0;
      //Simula o envio da Tab
      Perform(WM_NEXTDLGCTL,0,0);

    end;
  end;

procedure TfrmFornecedores.FormShow(Sender: TObject);
begin

 //atribui data atual ao abrir o modulo.
 dtpDataForn.Date := Date;

 AlteraCep := False;
 AlteraEnd := False;

 DesabilitaCampos(False);
  with dmModule do begin

  ibeaNovo.Caption := '&Novo';
    LimpaCampo;//limpa os campos ao abrir o formulario.

   ExecSELECT;
   ExecSELECTCondPagto;
   
    //Adiciona as Colunas com os dados do Fornecedor
    with dbgFornecedor do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

        //determina as colunas a serem montadas 0 codigo fornecedor, 1 razao Social, 2 endereço numero...
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);
        Columns.Insert(5);

        //Parametros da Coluna que exibe o Código do Cadastro
        Columns.Items[0].Title.Caption := 'Código';
        Columns.Items[0].FieldName     := 'CODIGO';
        Columns.Items[0].Width         := 77;
        Columns.Items[0].Alignment     := taCenter;

        //Parametros da Coluna que exibe o Nome do cliente.
        Columns.Items[1].Title.Caption := 'Razão Social';
        Columns.Items[1].FieldName     := 'NOME';
        Columns.Items[1].Width         := 240;

        // Parametros que exibe o nome fantasia do cliente
        Columns.Items[2].Title.Caption := 'Nome Fantasia';
        Columns.Items[2].FieldName     := 'NomeFantasia';
        Columns.Items[2].Width         := 130;

        // Parametros que exibe o nome fantasia do cliente
        Columns.Items[3].Title.Caption := 'Cnpj';
        Columns.Items[3].FieldName     := 'CNPJ_CPF';
        Columns.Items[3].Width         := 105;

        // Parametros que exibe o numero do cliente
        Columns.Items[4].Title.Caption := 'Inscrição';
        Columns.Items[4].FieldName     := 'IE_RG';
        Columns.Items[4].Width         := 111;
       // Columns.Items[5].Alignment     := taCenter;

        // Parametros que exibe o numero do cliente
        Columns.Items[5].Title.Caption := 'Data do Cadastro';
        Columns.Items[5].FieldName     := 'DATA';
        Columns.Items[5].Width         := 102;
        Columns.Items[5].Alignment     := taCenter;

        MontaColunas := False;
      end;
    end;
  end;
end;

procedure TfrmFornecedores.FormCreate(Sender: TObject);
begin
  MontaColunas := True;
end;

procedure TfrmFornecedores.lbl_edtCepChange(Sender: TObject);
begin
  //with dmModule do begin
    //se os campos abaixo for diferente de branco altera o cep
   { if (lbl_edtEndereco.Text <> '') and (lbl_edtCep.Text <> '00000-000') and (AlteraCep) Then begin
      AlteraCep := False;//variavel para atribuir vlr boleano no cep
      ConfirmaMSG := Application.MessageBox('Ao alterar o Cep o Endereço será excluído, deseja continuar?','Notificação: Alteração de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);}

     { lbl_edtEndereco.Clear;
      lbl_edtBairro.Clear;
      lbl_edtCidade.Clear;
      lbl_edtEstado.Clear;

      ibLogradouro.Close;
      ibLogradouro.SQL.Clear;
      ibLogradouro.SQL.Add('DELETE FROM TBLLOGRADOURO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
      ibLogradouro.Open;
      ExecSELECT; }

    //end;{if}
 // end;{with}
end;

procedure TfrmFornecedores.lbl_edtCepExit(Sender: TObject);
begin

 with dmModule do begin

  {  if (lbl_edtCep.Text <> '00000-000') Then begin //se for diferente de branco

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

            lbl_edtEndereco.Text := FieldByName('LOCAL').AsString;
            lbl_edtBairro.Text   := FieldByName('BAIRRO').AsString;
            lbl_edtCidade.Text   := FieldByName('CIDADE').AsString;
            lbl_edtEstado.Text   := FieldByName('UF').AsString;
            lbl_edtCep.Text      := FieldByName('CEP').AsString;

         if ibeaAlterar.Caption = '&Atualizar' Then begin


            ConfirmaMSG := Application.MessageBox('Você está alterando o CEP e o Endereço informado será excluido. Deseja continuar?','Notificação: Alteração de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
            if ConfirmaMSG = 6 Then begin

              lbl_edtEndereco.Text := FieldByName('LOCAL').AsString;
              lbl_edtBairro.Text   := FieldByName('BAIRRO').AsString;
              lbl_edtCidade.Text   := FieldByName('CIDADE').AsString;
              lbl_edtEstado.Text   := FieldByName('UF').AsString;
              lbl_edtCep.Text      := FieldByName('CEP').AsString;  }
     //
       //     end; {if}
      //   end;{if}
      //    end;{with}

     //    end;{if}

    //   end;{if}

      //DEFINE O FORMATO PARA O CAMPO DO CEP
      lbl_edtCep.Text := StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]);
      lbl_edtCep.Text := FormatFloat('00000-000',StrToFloat(lbl_edtCep.Text));

    //  AlteraEnd := False;//variavel para atribuir vlr boleano no cep

  //  end; {if}

  end;{with}



end;

procedure TfrmFornecedores.lbl_edtEnderecoExit(Sender: TObject);
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

procedure TfrmFornecedores.lbl_edtCnpjExit(Sender: TObject);
begin

  if lbl_edtCnpj.Text <> '' Then begin

    lbl_edtCnpj.Text := CGC(lbl_edtCnpj.Text);

  end;

end;

procedure TfrmFornecedores.lbl_edtPesquisaChange(Sender: TObject);
begin

  with dmModule do begin

    //LOCALIZA E ABRE SOMENTE O CADASTRO DO FORNECEDOR PELA IDENTIFICAÇÃO.
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCADDOCUMENTACAO.NOMEFANTASIA As NomeFantasia,'
    + ' TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.CNPJ_CPF,TBLCADDOCUMENTACAO.IE_RG FROM TBLCADASTRO '
    + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
    + ' WHERE (TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''') and TBLCADASTRO.NOME LIKE '+''''+'%'+lbl_edtPesquisa.text+'%'+'''');
    ibCadastro.Open;

  end;{WITH}

end;

procedure TfrmFornecedores.sb_ord_nomeClick(Sender: TObject);
begin

  with dmModule do begin

    //LOCALIZA E ABRE SOMENTE O CADASTRO DO FORNECEDOR PELA IDENTIFICAÇÃO.
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCADDOCUMENTACAO.NOMEFANTASIA As NomeFantasia,'
    + ' TBLLOGRADOURO.ENDERECO,TBLLOGRADOURO.BAIRRO,TBLLOGRADOURO.ESTADO FROM TBLCADASTRO '
    + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
    + ' LEFT OUTER JOIN TBLLOGRADOURO ON TBLCADASTRO.IDCAD = TBLLOGRADOURO.IDCAD '
    + ' WHERE (TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''') ORDER BY TBLCADASTRO.NOME');
    ibCadastro.Open;

    lbl_edtPesquisa.Text := '';

  end;{WITH}

end;

procedure TfrmFornecedores.sb_ord_codClick(Sender: TObject);
begin

  with dmModule do begin

    //LOCALIZA E ABRE SOMENTE O CADASTRO DO FORNECEDOR PELA IDENTIFICAÇÃO.
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCADDOCUMENTACAO.NOMEFANTASIA As NomeFantasia,'
    + ' TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.CNPJ_CPF,TBLCADDOCUMENTACAO.IE_RG,'
    + ' TBLLOGRADOURO.ENDERECO,TBLLOGRADOURO.BAIRRO,TBLLOGRADOURO.ESTADO FROM TBLCADASTRO '
    + ' LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD '
    + ' LEFT OUTER JOIN TBLLOGRADOURO ON TBLCADASTRO.IDCAD = TBLLOGRADOURO.IDCAD '
    + ' WHERE (TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''') ORDER BY TBLCADDOCUMENTACAO.CODIGO');
    ibCadastro.Open;

    lbl_edtPesquisa.Text := '';

  end;{WITH}

end;

procedure TfrmFornecedores.lbl_edtTelcomExit(Sender: TObject);
begin

  if lbl_edtTelCom.Text <> '' Then begin

    lbl_edtTelCom.Text := StringReplace(lbl_edtTelCom.Text,'-','',[rfReplaceAll]);
    lbl_edtTelCom.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtTelCom.Text));

  end;
  
end;

procedure TfrmFornecedores.lbl_edtCelularExit(Sender: TObject);
begin

  if lbl_edtCelular.Text <> '' Then begin

    lbl_edtCelular.Text := StringReplace(lbl_edtCelular.Text,'-','',[rfReplaceAll]);
    lbl_edtCelular.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtCelular.Text));

  end;

end;

procedure TfrmFornecedores.dbgFornecedorDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

{  with dmModule do begin

    If (dbgFornecedor.DataSource.DataSet.RecNo div 2) =  (dbgFornecedor.DataSource.DataSet.RecNo/2) Then begin

    dbgFornecedor.Canvas.Font.Color:= clBlack;
    dbgFornecedor.Canvas.Brush.Color:= clskyBlue;

  end else begin

    dbgFornecedor.Canvas.Font.Color:= clBlack;
    dbgFornecedor.Canvas.Brush.Color:= clWhite;

  end;

      dbgFornecedor.Canvas.FillRect(Rect);

    if Column.Field.DataType = ftFloat  Then begin

      dbgFornecedor.Canvas.TextOut(Rect.Left+2,Rect.Top,FormatFloat(CasasDecimais('Produtos'), Column.Field.AsFloat));

    end else begin

      dbgFornecedor.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);

   end;{if}

//  end;//with  }

end;

end.
