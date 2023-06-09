unit Transportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, IBEAntialiasButton, ExtCtrls,
  ADOdb, IBDatabase, IBCustomDataSet, IBQuery, IBStoredProc, ComCtrls,
  mxFlatControls, RxGIF, BmsXPButton;

type
  TfrmTransportadora = class(TForm)
    Label1: TLabel;
    lbl_edtCodigo: TLabeledEdit;
    lbl_edtNome: TLabeledEdit;
    lbl_edtEndereco: TLabeledEdit;
    lbl_edtBairro: TLabeledEdit;
    lbl_edtCep: TLabeledEdit;
    lbl_edtCidade: TLabeledEdit;
    lbl_edtEstado: TLabeledEdit;
    lbl_edtCnpj: TLabeledEdit;
    lbl_edtIe: TLabeledEdit;
    GroupBox1: TGroupBox;
    lbl_edtPesqtransp: TLabeledEdit;
    dbgTransportadora: TDBGrid;
    lbl_edtSite: TLabeledEdit;
    lbl_edtEmail: TLabeledEdit;
    lbl_edtContato: TLabeledEdit;
    lbl_edtNumero: TLabeledEdit;
    lbl_edtCompl: TLabeledEdit;
    lbl_edtDDD: TLabeledEdit;
    lbl_edtTelcom: TLabeledEdit;
    lbl_edtDDDFax: TLabeledEdit;
    lbl_edtTelFax: TLabeledEdit;
    lbl_edtCelular: TLabeledEdit;
    lbl_edtPontoreferencia: TLabeledEdit;
    lbl_edtObs: TLabeledEdit;
    lbl_edtNomefantasia: TLabeledEdit;
    lblData: TLabel;
    dtpDataTransp: TmxFlatDateTimePicker;
    ibeaNovo: TBmsXPButton;
    ibeaPrimeiro: TBmsXPButton;
    ibeaAnterior: TBmsXPButton;
    ibeaProximo: TBmsXPButton;
    ibeaUltimo: TBmsXPButton;
    ibeaAlterar: TBmsXPButton;
    ibeaExcluir: TBmsXPButton;
    ibeaSair: TBmsXPButton;

    procedure Commit(IBQueryExec : TIBQuery);

    procedure DesabilitaCampos(opcao:Boolean);
    procedure AlteraCadastro;//serve para dar update na tblcadastro.
    procedure AlteraDocumentacao;//serve para dar update na tblcaddocumentacao.
    procedure AlteraContato;//serve para dar update na tblcontato.
    procedure AlteraLogradouro;//serve para dar update na tbllogradouro.
    procedure LimpaCampo;
    procedure ExibeDados;
    procedure ExecSELECT;
    procedure ibeaNovoClick(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure dbgTransportadoraCellClick(Column: TColumn);
    procedure ibeaPrimeiroClick(Sender: TObject);
    procedure ibeaAnteriorClick(Sender: TObject);
    procedure ibeaProximoClick(Sender: TObject);
    procedure ibeaUltimoClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure lbl_edtCepChange(Sender: TObject);
    procedure lbl_edtCepExit(Sender: TObject);
    procedure lbl_edtEnderecoExit(Sender: TObject);
    procedure lbl_edtCnpjExit(Sender: TObject);
    procedure lbl_edtTelcomExit(Sender: TObject);
    procedure lbl_edtTelFaxExit(Sender: TObject);
    procedure lbl_edtCelularExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransportadora: TfrmTransportadora;
  IDCad : Integer;
  ConfirmaMSG : Integer;
  IDClass : Integer; // variavel para trazer dados da tbl de classificacao
  Cep : Integer; //variavel para atribuir o vlr do cep.
  MontaColunas : Boolean; //VARIAVEL USADA PARA DETERMINAR SE A COLUNA J� FOI CRIADA OU N�O
  AlteraCep : Boolean;
  AlteraEnd : Boolean;
  IDClassTelcom : Integer;//variavel para armazenar a classifica��o do campo telcoml
  IDClassTelfax: Integer; //variavel para armazenar a classifica��o do campo telfax
  IDClassEmail: Integer;//variavel para armazenar a classifica��o do campo email
//  IDClassCnpj: Integer;// variavel para armazenar a classifica��o do campo cnpj
  IDClassCelular: Integer;// variavel para armazenar a classifica��o do campo celular.
  IDClassSite: Integer;// variavel para armazenar a classifica��o do campo site.
  IDClassContato: Integer;// variavel para armazenar a classifica��o do campo contato.
  IDClassVeiculo: Integer;// variavel para armazenar a classifica��o do campo veiculo.
  IDClassPlaca: Integer;// variavel para armazenar a classifica��o do campo placa.

  CepTemp : String;
  ibTempCep  : TIBQuery;//atribui valor a componente criado




  implementation

uses untdmModule;


{$R *.dfm}


////////////////////////////////////////////////////////////////////////////////
Function CGC(CGC : string): string;
beginResult := Copy(CGC,1,2)+'.'+Copy(CGC,3,3)+'.'+Copy(CGC,6,3)+'/'+Copy(CGC,9,4)+'-'+Copy(CGC,13,2);end;
////////////////////////////////////////////////////////////////////////////////

procedure TfrmTransportadora.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmTransportadora.DesabilitaCampos(opcao:Boolean);
begin
  lbl_edtCodigo.Enabled := opcao;
  lbl_edtNome.Enabled := opcao;
  lbl_edtNomefantasia.Enabled := opcao;
  dtpDataTransp.Enabled := opcao;
  lbl_edtCnpj.Enabled := opcao;
  lbl_edtIe.Enabled := opcao;
  lbl_edtSite.Enabled := opcao;
  lbl_edtEmail.Enabled := opcao;
  lbl_edtContato.Enabled := opcao;
  lbl_edtEndereco.Enabled := opcao;
  lbl_edtNumero.Enabled := opcao;
  lbl_edtCompl.Enabled := opcao;
  lbl_edtBairro.Enabled := opcao;
  lbl_edtCep.Enabled := opcao;
  lbl_edtCidade.Enabled := opcao;
  lbl_edtEstado.Enabled := opcao;
  lbl_edtDDD.Enabled := opcao;
  lbl_edtTelcom.Enabled := opcao;
  lbl_edtDDDFax.Enabled := opcao;
  lbl_edtTelFax.Enabled := opcao;
  lbl_edtCelular.Enabled := opcao;
  lbl_edtPontoreferencia.Enabled := opcao;
  lbl_edtObs.Enabled := opcao;
end;

procedure TfrmTransportadora.AlteraCadastro;
begin
  with dmModule do begin

    //GRAVA AS ALTERACOES NA TBL DE CADASTRO
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('UPDATE TBLCADASTRO SET '
    + 'NOME = ''' + lbl_edtNome.Text + ''''
    + ',NUMERO = ''' + lbl_edtNumero.Text + ''''
    + ',COMPL = ''' + lbl_edtCompl.Text + ''''
    + ',CEP = ''' + IntToStr(Cep) + ''''
    + ',PONTOREFERENCIA = ''' + lbl_edtPontoreferencia.Text + ''''
    + ',OBS = ''' + lbl_edtObs.Text + ''' WHERE IDCad=''' + InttoStr(IDCad) + '''');
    ibCadastro.ExecSQL;
    Commit(ibCadastro);

  end;
end;

procedure TfrmTransportadora.AlteraDocumentacao;

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
      Commit(ibDocumentacao);

    end else begin//senao grava os registros

        //insere dados na tblcaddocumentacao
        ibDocumentacao.Close;
        ibDocumentacao.SQL.Clear;
        ibDocumentacao.SQL.Add('INSERT INTO TBLCADDOCUMENTACAO '
        + ' (IDCAD,NOMEFANTASIA,IE_RG,CNPJ_CPF) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + lbl_edtNomefantasia.Text + ''','
        + ' ''' + lbl_edtIE.Text + ''','
        + ' ''' + lbl_edtCnpj.Text + ''')');
        ibDocumentacao.ExecSQL;
        Commit(ibDocumentacao);

    end;{if}

  end;{with}

end;

procedure TfrmTransportadora.AlteraContato;
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

        //localiza e abre somente o cadastro de contato pela identifica��o do telefone coml.
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
        Commit(ibContato);

      end else begin

        //inicio de rotina para grava��o de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassTelcom) + ''',''' + IntToStr(DDDCom) + ''','
        + ' ''' + lbl_edtTelcom.Text + ''')');
        ibContato.ExecSQL;
        Commit(ibContato);

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

      //localiza e abre somente o cadastro de contato pela identifica��o do telefone fax.
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
        Commit(ibContato);

      end else begin

        //inicio de rotina para grava��o de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassTelfax) + ''',''' + IntToStr(DDDFax) + ''','
        + ' ''' + lbl_edtTelFax.Text + ''')');
        ibContato.ExecSQL;
        Commit(ibContato);

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O TELEFONE CELULAR
    if lbl_edtCelular.Text <> '' Then begin

      //localiza e abre somente o cadastro de contato pela identifica��o do telefone fax.
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Cel''');
      ibClassificacao.Open;
      IDClassCelular := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone fax. na variavel.

      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassCelular) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtCelular.Text +  ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassCelular) + '''');
        ibContato.ExecSQL;
        Commit(ibContato);

      end else begin

        //inicio de rotina para grava��o de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassCelular) + ''','
        + ' ''' + lbl_edtCelular.Text + ''')');
        ibContato.ExecSQL;
        Commit(ibContato);

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O SITE
    if lbl_edtSite.Text <> '' Then begin

      //localiza e abre somente o cadastro de contato pela identifica��o do site.
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
        Commit(ibContato);

      end else begin

        //inicio de rotina para grava��o de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassSite) + ''',''' + IntToStr(IDClassSite) + ''','
        + ' ''' + lbl_edtSite.Text + ''')');
        ibContato.ExecSQL;
        Commit(ibContato);

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O EMAIL
    if lbl_edtEmail.Text <> '' Then begin

      //localiza e abre somente o cadastro de contato pela identifica��o do site.
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
        Commit(ibContato);

      end else begin

        //inicio de rotina para grava��o de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassEmail) + ''',''' + IntToStr(IDClassEmail) + ''','
        + ' ''' + lbl_edtEmail.Text + ''')');
        ibContato.ExecSQL;
        Commit(ibContato);

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O CONTATO
    if lbl_edtContato.Text <> '' Then begin

     //localiza e abre somente o cadastro de contato pela identifica��o do contato.
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
        Commit(ibContato);

      end else begin

        //inicio de rotina para grava��o de contato
        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassContato) + ''',''' + IntToStr(IDClassContato) + ''','
        + ' ''' + lbl_edtContato.Text + ''')');
        ibContato.ExecSQL;
        Commit(ibContato);

      end;{if}

    end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR O VEICULO
   { if lbl_edtVeiculo.Text <> '' Then begin

     //inicio de rotina para grava��o de contato
    //localiza e abre somente o cadastro de contato pela identifica��o do veiculo
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Veiculo''');
      ibClassificacao.Open;
      IDClassVeiculo := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato do veiculo na variavel.

      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassVeiculo) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtVeiculo.Text +  ''''
        + ',DDD = ''' + IntToStr(IDClassVeiculo) + ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassVeiculo) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;
      end else begin

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassVeiculo) + ''',''' + IntToStr(IDClassVeiculo) + ''','
        + ' ''' + lbl_edtVeiculo.Text + ''')');
        ibContato.ExecSQL;}

     // end;{if}

   // end;{if}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //ROTINA PARA ALTERAR A PLACA
   { if lbl_edtPlaca.Text <> '' Then begin

     //inicio de rotina para grava��o de contato
      //localiza e abre somente o cadastro de contato pela identifica��o do telefone coml.
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Placa''');
      ibClassificacao.Open;
      IDClassPlaca := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao da placa na variavel.

      //localiza o ddd e o contato atraves da classe
      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCad) + ''') And (TIPO=''' + InttoStr(IDClassPlaca) + ''')');
      ibContato.Open;

      if ibContato.RecordCount > 0 Then begin

        //GRAVA AS ALTERACOES NA TBL DE CONTATO
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('UPDATE TBLCONTATO SET '
        + 'CONTATO =''' + lbl_edtPlaca.Text +  ''''
        + ',DDD = ''' + IntToStr(IDClassPlaca) + ''' WHERE IDCad=''' + InttoStr(IDCad) + ''' and TIPO=''' + IntToStr(IDClassPlaca) + '''');
        ibContato.ExecSQL;
        TRContato.Commit;
      end else begin

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassPlaca) + ''',''' + IntToStr(IDClassPlaca) + ''','
        + ' ''' + lbl_edtPlaca.Text + ''')');
        ibContato.ExecSQL;}

     // end;{if}

   // end;{if}

  end;{with}

end;

procedure TfrmTransportadora.AlteraLogradouro;
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
        Commit(ibLogradouro);

      end else begin // senao houver registro grava na tabela

        ibLogradouro.Close;
        ibLogradouro.SQL.Clear;
        ibLogradouro.SQL.Add('INSERT INTO TBLLOGRADOURO '
        + ' (IDCAD,ENDERECO,BAIRRO,ESTADO,CIDADE) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + lbl_edtEndereco.Text + ''',''' + lbl_edtBairro.Text + ''','
        + ' ''' + lbl_edtEstado.Text + ''','
        + ' ''' + lbl_edtCidade.Text + ''')');
        ibLogradouro.ExecSQL;
        Commit(ibLogradouro);

      end; {if}

    end; {with}

  end; {if}

end;

procedure TfrmTransportadora.LimpaCampo;//procedimento para limpar os campos ao abrir o formulario.
begin
  lbl_edtCodigo.Clear;
  lbl_edtNome.Clear;
  lbl_edtNomefantasia.Clear;
  lbl_edtCnpj.Clear;
  lbl_edtIe.Clear;
  lbl_edtSite.Clear;
  lbl_edtEmail.Clear;
  lbl_edtContato.Clear;
  lbl_edtEndereco.Clear;
  lbl_edtNumero.Clear;
  lbl_edtCompl.Clear;
  lbl_edtBairro.Clear;
  lbl_edtCep.Clear;
  lbl_edtCidade.Clear;
  lbl_edtEstado.Clear;
  lbl_edtDDD.Clear;
  lbl_edtTelcom.Clear;
  lbl_edtDDDFax.Clear;
  lbl_edtTelFax.Clear;
  lbl_edtCelular.Clear;
  lbl_edtPontoreferencia.Clear;
  lbl_edtObs.Clear;

end;


procedure TfrmTransportadora.ExecSELECT;  //procedimento para seletar sql
begin
  with dmModule do begin

    //LOCALIZA E ABRE SOMENTE O CADASTRO DA TRANSPORTADORA PELA IDENTIFICA��O.
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Transportadora''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICA��O DA TRANSPORTADORA NA VARIAVEL.


    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICA��O DE CLIENTES
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLCADDOCUMENTACAO.NOMEFANTASIA As NomeFantasia,'
    + ' TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.CNPJ_CPF,TBLCADDOCUMENTACAO.IE_RG FROM TBLCADASTRO '
    + ' INNER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD=TBLCADDOCUMENTACAO.IDCAD WHERE(TBLCADASTRO.IDCLASS=''' + InttoStr(IDClass) + ''')ORDER BY TBLCADASTRO.NOME');
    ibCadastro.Open;


    {    //BUSCA TODAS AS TRANSPORTADORAS QUE ESTEJAM NA CLASSIFICA��O DE TRANSPORTADORAS
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    //seleciona tudo da tblcadastro e da tblcaddocumentacao o codigo o cpf_cnpj o rg e a ie pra tbl de cadastro relacionar com a tbl documentacao onde o id cad da tbl cadastro � igual a da tbl documentacao onde a variavel vai retornar um valor.
    //ibCadastro.SQL.Add('SELECT TBLCADASTRO.*, TBLCADDOCUMENTACAO.CODIGO,TBLCADDOCUMENTACAO.cnpj_cpf,TBLCADDOCUMENTACAO.rg_ie  FROM TBLCADASTRO INNER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD = TBLCADDOCUMENTACAO.IDCAD'
    //+ ' WHERE TBLCADASTRO.IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY TBLCADASTRO.NOME');
    ibCadastro.Open;

    ibContato.Close;
    ibContato.SQL.Clear;
    ibContato.SQL.Add('SELECT * FROM TBLCONTATO');
    ibContato.Open;

    ibDocumentacao.Close;
    ibDocumentacao.SQL.Clear;
    ibDocumentacao.SQL.Add('SELECT * FROM TBLCADDOCUMENTACAO');
    ibDocumentacao.Open;

    ibLogradouro.Close;
    ibLogradouro.SQL.Clear;
    ibLogradouro.SQL.Add('SELECT * FROM TBLLOGRADOURO');
    ibLogradouro.Open; }
  end;
end;

procedure TfrmTransportadora.ExibeDados; //procedimento criado para exibir os dados da tbl nos campos
begin
   with dmModule do begin

    IDCad := ibCadastro.FieldByName('IDCAD').AsInteger; //ATRIBUI O IDCAD DO CADASTRO A VARIAVEL

    //traz os dados no campo se houver registro
    if ibCadastro.RecordCount > 0  Then begin
      lbl_edtNome.Text             := ibCadastro.FieldByName('NOME').AsString;
      lbl_edtNumero.Text           := ibCadastro.FieldByName('NUMERO').AsString;
      lbl_edtCompl.Text            := ibCadastro.FieldByName('COMPL').AsString;
      lbl_edtCep.Text              := FormatFloat('00000-000',ibCadastro.FieldByName('CEP').AsInteger);
      lbl_edtPontoreferencia.Text  := ibCadastro.FieldByName('PONTOREFERENCIA').AsString;
      lbl_edtObs.Text              := ibCadastro.FieldByName('OBS').AsString;
      dtpDataTransp.Date           := ibCadastro.FieldByName('DATA').AsDateTime;
     //limpa os campos se nao houver registro.
    end else begin
      lbl_edtCodigo.Clear;
      lbl_edtNome.Clear;
      lbl_edtCep.Clear;
      lbl_edtNumero.Clear;
      lbl_edtCompl.Clear;
      lbl_edtPontoreferencia.Clear;
      lbl_edtObs.Clear;
    end;

    // ROTINA PARA TRAZER OS DADOS DE CONTATO DO CLIENTE

    //LOCALIZA O VEICULO

   { ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Veiculo''');
    ibClassificacao.Open;
    IDClassVeiculo := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do veiculo na variavel.

    ibContato.Close;
    ibContato.SQL.Clear;
    ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
    + ' (IDCAD=''' + IntToStr(IDCad) + ''') And (TIPO=''' + IntToStr(IDClassVeiculo) + ''')');
    ibContato.Open;

     //traz os dados no campo se houver registro
      if ibContato.RecordCount > 0 Then begin;
         lbl_edtDDD.Text          := ibContato.FieldByName('DDD').AsString; //TRAZ O DDD DO TELEFONE COMERCIAL
         lbl_edtVeiculo.Text      := ibContato.FieldByName('CONTATO').AsString; //TRAZ O CONTATO (TELEFONE) COMERCIAL
      //limpa os campos se nao houver registro.
      end else begin
      lbl_edtDDD.Clear;
      lbl_edtVeiculo.Clear;
      end;}

       //LOCALIZA A PLACA

   {ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Placa''');
    ibClassificacao.Open;
    IDClassPlaca := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do veiculo na variavel.

    ibContato.Close;
    ibContato.SQL.Clear;
    ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
    + ' (IDCAD=''' + IntToStr(IDCad) + ''') And (TIPO=''' + IntToStr(IDClassPlaca) + ''')');
    ibContato.Open;

    //traz os dados no campo se houver registro
      if ibContato.RecordCount > 0 Then begin;
       lbl_edtDDD.Text          := ibContato.FieldByName('DDD').AsString; //TRAZ O DDD DO TELEFONE COMERCIAL
       lbl_edtPlaca.Text        := ibContato.FieldByName('CONTATO').AsString; //TRAZ O CONTATO (TELEFONE) COMERCIAL

      //limpa os campos se nao houver registro.
      end else begin
       lbl_edtDDD.Clear;
       lbl_edtPlaca.Clear;
      end;}
     
    //LOCALIZA O TELEFONE COMERCIAl

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
    ibClassificacao.Open;
    IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

    ibContato.Close;
    ibContato.SQL.Clear;
    ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
    + ' (IDCAD=''' + IntToStr(IDCad) + ''') And (TIPO=''' + IntToStr(IDClassTelcom) + ''')');
    ibContato.Open;

    //traz os dados no campo se houver registro
      if ibContato.RecordCount > 0 Then begin;
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

      //traz os dados no campo se houver registro
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

      //traz os dados no campo se houver registro
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

      //traz os dados no campo se houver registro
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

      //traz os dados no campo se houver registro
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

      //traz os dados no campo se houver registro
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
        lbl_edtNomefantasia.Text        := ibDocumentacao.FieldByName('NOMEFANTASIA').AsString;//TRAZ O NOME FANTASIA.
        lbl_edtCnpj.Text                := ibDocumentacao.FieldByName('CNPJ_CPF').AsString;//TRAZ O CNPJ DO FORNECEDOR.
        lbl_edtIe.Text                  := ibDocumentacao.FieldByName('IE_RG').AsString;//TRAZ A IE E O RG DO FORNECEDOR
        lbl_edtCodigo.Text              := ibDocumentacao.FieldByName('CODIGO').AsString;
      // limpa os campos se nao houver registro.
      end else begin
        lbl_edtNomefantasia.Clear;
        lbl_edtCnpj.Clear;
        lbl_edtIE.Clear;
      end;

////////////////////////////////////////////////////////////////////////////////////////////


      // se o cep da tbl cadastro for diferente de branco
      {  if ibCadastro.FieldByName('CEP').AsInteger <> 0 Then begin

          CEPTemp := StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]);//atribui o traco na variavel cep

          ibTempCep := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL

        with ibTempCep do begin

          //faz select da tbl cep atraves do componente criado
          ibTempCep.Database := IBDCep;
          ibTempCep.SQL.Clear;
          ibTempCep.SQL.Add('SELECT LOCAL,BAIRRO,CIDADE,UF,CEP FROM TBLCEP WHERE CEP=''' + CEPTemp + '''');
          ibTempCep.Open; }

     //  end;{with}
          //traz os dados da tbl no campo.
       {   lbl_edtEndereco.Text := ibTempCep.FieldByName('LOCAL').AsString;
          lbl_edtBairro.Text   := ibTempCep.FieldByName('BAIRRO').AsString;
          lbl_edtCidade.Text   := ibTempCep.FieldByName('CIDADE').AsString;
          lbl_edtEstado.Text   := ibTempCep.FieldByName('UF').AsString;
          lbl_edtCep.Text      := FormatFloat('00000-000',ibTempCep.FieldByName('CEP').AsInteger);

        end else begin }


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

    // end;

   end;

end;

procedure TfrmTransportadora.ibeaNovoClick(Sender: TObject);
begin

  with dmModule do begin

      //rotina para cancelar ou nao a operacao

    if ibeaAlterar.Caption = '&Atualizar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
              + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

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


////////////////////////////////////////////////////////////////////////////////

   if ibeaNovo.Caption = '&Gravar' Then begin
      

       if lbl_edtCep.Text = '' Then begin  {atribui  vlr 0 a variavel cep}
       Cep := 0;
     end else begin // caso esteja em branco atribui o vlr do campo na variavel cep
       Cep := strtoint( StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]) );
      end;

      //insere na tabela os dados digitados nos campos determinados abaixo.
      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('INSERT INTO TBLCADASTRO '
      + ' (IDCLASS,NOME,NUMERO,COMPL,PONTOREFERENCIA,OBS,DATA,CEP) values '
      + ' (''' + IntToStr(IDClass) + ''',''' + lbl_edtNome.Text + ''','
      + ' ''' + lbl_edtNumero.Text + ''',''' + lbl_edtCompl.Text + ''', '
      + ' ''' + lbl_edtPontoreferencia.Text + ''',''' + lbl_edtObs.Text + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy', dtpDataTransp.Date) + ''','
      + ' ''' + IntToStr(Cep) + ''')');
      ibCadastro.ExecSQL;

       //select para trazer o nome do cliente no campo abaixo atraves do id
      ibCadastro.Close;
      ibCadastro.SQL.Clear;
      ibCadastro.SQL.Add('SELECT IDCAD FROM TBLCADASTRO WHERE NOME=''' + lbl_edtNome.Text + '''');
      ibCadastro.Open;
      IDCad := ibCadastro.FieldByName('IDCAD').AsInteger;//atribui o id do nome a variavel.
     
      //grava dados na tbllogradouro se cep nao for preenchido
      if lbl_edtEndereco.Text <> ''  Then begin

        ibLogradouro.Close;
        ibLogradouro.SQL.Clear;
        ibLogradouro.SQL.Add('INSERT INTO TBLLOGRADOURO '
        + ' (IDCAD,ENDERECO,BAIRRO,ESTADO,CIDADE) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + lbl_edtEndereco.Text + ''',''' + lbl_edtBairro.Text + ''','
        + ' ''' + lbl_edtEstado.Text + ''','
        + ' ''' + lbl_edtCidade.Text + ''')');
        ibLogradouro.ExecSQL;

      end;

      {if lbl_edtVeiculo.Text <> '' Then begin
         //inicio de rotina para grava��o de contato
        //localiza e abre somente o cadastro de contato pela identifica��o do telefone coml.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Veiculo''');
        ibClassificacao.Open;
        IDClassVeiculo := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassVeiculo) + ''',''' + lbl_edtDDD.Text + ''','
        + ' ''' + lbl_edtVeiculo.Text + ''')');
        ibContato.ExecSQL;

      end;}

     { if lbl_edtPlaca.Text <> '' Then begin
         //inicio de rotina para grava��o de contato
        //localiza e abre somente o cadastro de contato pela identifica��o do telefone coml.
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Placa''');
        ibClassificacao.Open;
        IDClassPlaca := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

        //insere dados na tbl contato
        ibContato.Close;
        ibContato.SQL.Clear;
        ibContato.SQL.Add('INSERT INTO TBLCONTATO '
        + ' (IDCAD,TIPO,DDD,CONTATO) values '
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassPlaca) + ''',''' + lbl_edtDDD.Text + ''','
        + ' ''' + lbl_edtPlaca.Text + ''')');
        ibContato.ExecSQL;

      end;}

        if lbl_edtTelcom.Text <> '' Then begin
         //inicio de rotina para grava��o de contato
        //localiza e abre somente o cadastro de contato pela identifica��o do telefone coml.
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
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassTelcom) + ''',''' + lbl_edtDDD.Text + ''','
        + ' ''' + lbl_edtTelcom.Text + ''')');
        ibContato.ExecSQL;

      end;

       if lbl_edtTelFax.Text <> '' Then begin
        //inicio de rotina para grava��o de contato
        //localiza e abre somente o cadastro de contato pela identifica��o do fax.
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
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassTelfax) + ''',''' + lbl_edtDDDFax.Text + ''','
        + ' ''' + lbl_edtTelFax.Text + ''')');
        ibContato.ExecSQL;

      end;

      if lbl_edtCelular.Text <> '' Then begin
        //inicio de rotina para grava��o de contato
        //localiza e abre somente o cadastro de contato pela identifica��o do celular.
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
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassCelular) + ''','
        + ' ''' + lbl_edtCelular.Text + ''')');
        ibContato.ExecSQL;

        end;

        if lbl_edtSite.Text <> '' Then begin
          //inicio de rotina para grava��o de contato
          //localiza e abre somente o cadastro de contato pela identifica��o do email.
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
          + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassSite) + ''',''0'','
          + ' ''' + lbl_edtSite.Text + ''')');
          ibContato.ExecSQL;
        end;

      if lbl_edtEmail.Text <> '' Then begin
        //inicio de rotina para grava��o de contato
        //localiza e abre somente o cadastro de contato pela identifica��o do email.
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
        + ' (''' + IntToStr(IDCad) + ''',''' + inttostr(IDClassEmail) + ''',''0'','
        + ' ''' + lbl_edtEmail.Text + ''')');
        ibContato.ExecSQL;

      end;

         if lbl_edtContato.Text <> '' Then begin
          //insere dados na tbl contato
          ibContato.Close;
          ibContato.SQL.Clear;
          ibContato.SQL.Add('INSERT INTO TBLCONTATO '
          + '(IDCAD,TIPO,DDD,CONTATO) values '
          + '(''' + IntToStr(IDCad) + ''',''' + IntToStr(IDClassContato) + ''',''0'','
          + ' ''' + lbl_edtContato.Text + ''')');
          ibContato.ExecSQL;

        end;

          //insere dados na tbl caddocumentacao
          ibDocumentacao.Close;
          ibDocumentacao.SQL.Clear;
          ibDocumentacao.SQL.Add('INSERT INTO TBLCADDOCUMENTACAO '
          + ' (IDCAD,NOMEFANTASIA,IE_RG,CODIGO,CNPJ_CPF) values '
          + ' (''' + IntToStr(IDCad) + ''',''' + lbl_edtNomefantasia.Text + ''','
          + ' ''' + lbl_edtIe.Text + ''','
          + ' ''' + lbl_edtCodigo.Text + ''','
          + ' ''' + lbl_edtCnpj.Text + ''')');
          ibDocumentacao.ExecSQL;

        Commit(ibDocumentacao);
        Commit(ibContato);
        Commit(ibCadastro);


        ExecSELECT;

        ibeaNovo.Caption := '&Novo';
        ibeaAlterar.Enabled := True;
        ibeaExcluir.Enabled := True;
        DesabilitaCampos(False);
        LimpaCampo;

      end else begin

        ibeaNovo.Caption := '&Gravar';
        DesabilitaCampos(True);
        LimpaCampo;
        lbl_edtCodigo.SetFocus;

        lbl_edtCep.Text := '0';
        lbl_edtCep.Text := FormatFloat('00000-000',StrToFloat(lbl_edtCep.Text));

      end;{if}
    end;{if}
  end;{with}
end;

procedure TfrmTransportadora.ibeaSairClick(Sender: TObject);
begin
close;
end;

procedure TfrmTransportadora.dbgTransportadoraCellClick(Column: TColumn);
begin
 ExibeDados;
 AlteraCep := False;
 AlteraEnd := False;
end;

procedure TfrmTransportadora.ibeaPrimeiroClick(Sender: TObject);
begin
  with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;

      end else begin

//////////////////////////////////////////////////////////////////////////////////////////


         if ibeaNovo.Caption = '&Gravar' Then begin

            ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
            + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

          if ConfirmaMSG = 6 Then begin

            //RESTAURAR OS CAMPOS
            ibeaNovo.Caption := '&Novo';
            ibeaAlterar.Enabled := True;
            ibeaExcluir.Enabled := True;
            DesabilitaCampos(False);

            AlteraCep := False;
            AlteraEnd := False;

          end;

          end else begin

          AlteraCep := False;
          AlteraEnd := False;

          if (ibCadastro.Active) and (ibDocumentacao.Active) and (ibContato.Active) Then begin
            ibCadastro.First;
            ibDocumentacao.First;
            ibContato.First;
          end;
            ExibeDados;

    //  AlteraCep;
    //  AlteraEnd;

      end;
    end;{if}
  end;{with}
end;

procedure TfrmTransportadora.ibeaAnteriorClick(Sender: TObject);
begin
  with dmModule do begin


    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);
      end;

      end else begin

//////////////////////////////////////////////////////////////////////////////////////////


         if ibeaNovo.Caption = '&Gravar' Then begin

            ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
            + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

          if ConfirmaMSG = 6 Then begin

            //RESTAURAR OS CAMPOS
            ibeaNovo.Caption := '&Novo';
            ibeaAlterar.Enabled := True;
            ibeaExcluir.Enabled := True;
            DesabilitaCampos(False);

            AlteraCep := False;
            AlteraEnd := False;

          end;

          end else begin

          AlteraCep := False;
          AlteraEnd := False;

          if (ibCadastro.Active) and (ibDocumentacao.Active) and (ibContato.Active) Then begin
            ibCadastro.Prior;
            ibDocumentacao.Prior;
            ibContato.Prior;
          end;
            ExibeDados;

    //  AlteraCep;
    //  AlteraEnd;

      end;
    end;{if}
  end;{with}
end;

procedure TfrmTransportadora.ibeaProximoClick(Sender: TObject);
begin
  with dmModule do begin

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);
      end;

      end else begin

//////////////////////////////////////////////////////////////////////////////////////////


         if ibeaNovo.Caption = '&Gravar' Then begin

            ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
            + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

          if ConfirmaMSG = 6 Then begin

            //RESTAURAR OS CAMPOS
            ibeaNovo.Caption := '&Novo';
            ibeaAlterar.Enabled := True;
            ibeaExcluir.Enabled := True;
            DesabilitaCampos(False);

            AlteraCep := False;
            AlteraEnd := False;

          end;

          end else begin

          AlteraCep := False;
          AlteraEnd := False;

          if (ibCadastro.Active) and (ibDocumentacao.Active) and (ibContato.Active) Then begin
            ibCadastro.Next;
            ibDocumentacao.Next;
            ibContato.Next;
          end;
            ExibeDados;

    //  AlteraCep;
    //  AlteraEnd;

      end;
    end;{if}
  end;{with}
end;

procedure TfrmTransportadora.ibeaUltimoClick(Sender: TObject);
begin
  with dmModule do begin


    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
                                + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);
      end;
     end else begin

//////////////////////////////////////////////////////////////////////////////////////////


         if ibeaNovo.Caption = '&Gravar' Then begin

            ConfirmaMSG := Application.MessageBox('Deseja cancelar est� opera��o?'
            + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

          if ConfirmaMSG = 6 Then begin

            //RESTAURAR OS CAMPOS
            ibeaNovo.Caption := '&Novo';
            ibeaAlterar.Enabled := True;
            ibeaExcluir.Enabled := True;
            DesabilitaCampos(False);

            AlteraCep := False;
            AlteraEnd := False;

          end;

          end else begin

          AlteraCep := False;
          AlteraEnd := False;

          if (ibCadastro.Active) and (ibDocumentacao.Active) and (ibContato.Active) Then begin
            ibCadastro.Last;
            ibDocumentacao.Last;
            ibContato.Last;
          end;
            ExibeDados;

    //  AlteraCep;
    //  AlteraEnd;

      end;
    end;{if}
  end;{with}
end;


procedure TfrmTransportadora.ibeaAlterarClick(Sender: TObject);
begin

  with dmModule do begin

    if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar esta opera��o?'
        + #13 + 'Clique em Sim para cancelar e N�o para continuar.','Notifica��o: Cancelar Opera��o', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        ibeaNovo.Caption := '&Novo';
        DesabilitaCampos(False);

      end;{if}

    end else begin


////////////////////////////////////////////////////////////////////////////////

        if (ibCadastro.RecordCount < 1)  And (ibContato.RecordCount < 1) And
          (ibLogradouro.RecordCount < 1) And (ibDocumentacao.RecordCount < 1) Then begin

          ConfirmaMSG := Application.MessageBox('N�o existe registro para ser alterado!!'
          + #13 + 'Clique em Ok para Retornar a opera��o normal.','Notifica��o: Cancelar Opera��o', MB_OK + MB_ICONWARNING);

          ibeaNovo.Caption := '&Novo';
          DesabilitaCampos(False);
          lbl_edtCep.Text := '';
          lbl_edtCodigo.Text := '';

        end else begin

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtNome.Text = '' Then begin
       ConfirmaMSG := Application.MessageBox('� necess�rio selecionar um registro abaixo para ser alterado!!'
                  + #13 + 'Clique em Ok para Retornar a opera��o normal.','Notifica��o: Cancelar Opera��o', MB_OK + MB_ICONWARNING);
      ibeaAlterar.Caption := '&Alterar';

    end else begin

////////////////////////////////////////////////////////////////////////////////

          if ibeaAlterar.Caption = '&Atualizar' Then begin

            if lbl_edtCep.Text = '' Then begin  {atribui  vlr 0 a variavel cep}
              Cep := 0;
            end else begin // caso esteja em branco atribui o vlr do campo na variavel cep
              Cep := strtoint( StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]) ); //SUBSTITUI REMOVENDO O -
            end;


            ConfirmaMSG := Application.MessageBox('Alterar esse Registro?','Notifica��o: Exclus�o de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
            if ConfirmaMSG = 6 Then begin

              AlteraCadastro;//procedimento para alteracao na tblcadastro
              AlteraDocumentacao;//procedimento para alteracao na tblcaddocumentacao
              AlteraContato;//procedimento para alteracao da tblcontato.
              AlteraLogradouro;

              ExecSELECT;

            end;

              ibeaAlterar.Caption := '&Alterar';
              ibeaNovo.Enabled := True;
              ibeaExcluir.Enabled := True;
              DesabilitaCampos(False);


            end else begin

              AlteraCep := True;
              AlteraEnd := True;

              ibeaAlterar.Caption := '&Atualizar';
              DesabilitaCampos(True);
              dbgTransportadora.Enabled := True;

          end;
        end;{if}
      end;{if}
    end;{if}
 end;{with}
end;

procedure TfrmTransportadora.FormKeyPress(Sender: TObject; var Key: Char);
begin

 Key := UpCase(Key); //Deixa todos os textos em maiusculo
   if Key = #13 Then begin
      Key :=#0;  //Desabilita processamento posterior da tecla
      Perform(WM_NEXTDLGCTL,0,0); //Simula o envio de Tab
  end;

end;

procedure TfrmTransportadora.FormShow(Sender: TObject);
begin

 dtpDataTransp.Date := Date;

 AlteraCep := False;
 AlteraEnd := False;

  with dmModule do begin

     ExecSELECT;

    ibeaNovo.Caption := '&Novo';
    ibeaAlterar.Caption := '&Alterar';
    DesabilitaCampos(False);
    LimpaCampo;//procedimento para limpar os campos ao abrir o formulario.

    //habilita os botes ao abrir o form
    ibeaNovo.Enabled := True;
    ibeaAlterar.Enabled := True;
    ibeaExcluir.Enabled := True;


    //   TRCadastro.Commit;

    //Adiciona as Colunas com os dados da Transportadora
    with dbgTransportadora do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

        //determina as colunas a serem montadas 0 codigo fornecedor, 1 razao Social, 2 endere�o numero...
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);
        Columns.Insert(5);

        //Parametros da Coluna que exibe o C�digo do Cadastro
        Columns.Items[0].Title.Caption := 'C�digo';
        Columns.Items[0].FieldName     := 'CODIGO';
        Columns.Items[0].Width         := 77;
        Columns.Items[0].Alignment     := taCenter;

        //Parametros da Coluna que exibe o Nome do cliente.
        Columns.Items[1].Title.Caption := 'Raz�o Social';
        Columns.Items[1].FieldName     := 'NOME';
        Columns.Items[1].Width         := 240;

        // Parametros que exibe o nome fantasia do cliente
        Columns.Items[2].Title.Caption := 'Nome Fantasia';
        Columns.Items[2].FieldName     := 'NomeFantasia';
        Columns.Items[2].Width         := 130;

        // Parametros que exibe o nome fantasia do cliente
        Columns.Items[3].Title.Caption := 'Cnpj';
        Columns.Items[3].FieldName     := 'CNPJ_CPF';
        Columns.Items[3].Width         := 115;

        // Parametros que exibe o numero do cliente
        Columns.Items[4].Title.Caption := 'Inscri��o';
        Columns.Items[4].FieldName     := 'IE_RG';
        Columns.Items[4].Width         := 117;
       // Columns.Items[5].Alignment     := taCenter;

        // Parametros que exibe o numero do cliente
        Columns.Items[5].Title.Caption := 'Data do Cadastro';
        Columns.Items[5].FieldName     := 'DATA';
        Columns.Items[5].Width         := 102;
        Columns.Items[5].Alignment     := taCenter;


        MontaColunas := False;
      end;{if}
    end;{with}
  end;{with}
end;

procedure TfrmTransportadora.FormCreate(Sender: TObject);
begin
  MontaColunas := True;
end;

procedure TfrmTransportadora.ibeaExcluirClick(Sender: TObject);
begin

  with dmModule do begin

    ConfirmaMSG := Application.MessageBox('Deseja Excluir o registro?','Notifica��o:Exclus�o de Registro.',+ MB_YESNO + MB_ICONQUESTION);

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

procedure TfrmTransportadora.lbl_edtCepChange(Sender: TObject);
begin
 {with dmModule do begin
    //se os campos abaixo for diferente de branco altera o cep
    if (lbl_edtEndereco.Text <> '') and (lbl_edtCep.Text <> '00000-000') and (AlteraCep) Then begin
      AlteraCep := False;//variavel para atribuir vlr boleano no cep
      ConfirmaMSG := Application.MessageBox('Ao alterar o Cep o Endere�o ser� exclu�do, deseja continuar?','Notifica��o: Altera��o de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);

      lbl_edtEndereco.Clear;
      lbl_edtBairro.Clear;
      lbl_edtCidade.Clear;
      lbl_edtEstado.Clear;

      ibLogradouro.Close;
      ibLogradouro.SQL.Clear;
      ibLogradouro.SQL.Add('DELETE FROM TBLLOGRADOURO WHERE IDCAD=''' + IntToStr(IDCad) + '''');
      ibLogradouro.Open;
      ExecSELECT;}

  //  end;{if}
 // end;{with}
end;

procedure TfrmTransportadora.lbl_edtCepExit(Sender: TObject);
begin

{ with dmModule do begin

    if (lbl_edtCep.Text <> '00000-000') Then begin// And (lbl_edtCep.Text = '00000-000') Then begin //se for diferente de branco

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

            ConfirmaMSG := Application.MessageBox('Voc� est� alterando o CEP e o Endere�o informado ser� excluido. Deseja continuar?','Notifica��o: Altera��o de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
            if ConfirmaMSG = 6 Then begin

              lbl_edtEndereco.Text := FieldByName('LOCAL').AsString;
              lbl_edtBairro.Text   := FieldByName('BAIRRO').AsString;
              lbl_edtCidade.Text   := FieldByName('CIDADE').AsString;
              lbl_edtEstado.Text   := FieldByName('UF').AsString;
              lbl_edtCep.Text      := FieldByName('CEP').AsString; }

          //  end; {if}
        //  end;{if}
        //  end;{with}

       //  end;{if}

      // end;{if}

      //DEFINE O FORMATO PARA O CAMPO DO CEP
     if lbl_edtCep.Text <> '' Then begin

      lbl_edtCep.Text := StringReplace(lbl_edtCep.Text,'-','',[rfReplaceAll]);
      lbl_edtCep.Text := FormatFloat('00000-000',StrToFloat(lbl_edtCep.Text));

     end;
    //  AlteraEnd := False;//variavel para atribuir vlr boleano no cep

   // end; {if}

 // end;{with}



end;

procedure TfrmTransportadora.lbl_edtEnderecoExit(Sender: TObject);
begin
  AlteraEnd := True;
  //se os campos abaixo for diferente de branco altera o endereco
  if (lbl_edtCep.Text <> '00000-000') And (lbl_edtEndereco.Text <> '') And AlteraEnd Then begin

    ConfirmaMSG := Application.MessageBox('Voc� est� alterando o Endere�o e o CEP informado ser� excluido. Deseja continuar?','Notifica��o: Altera��o de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
    if ConfirmaMSG = 6 Then begin
      lbl_edtCep.Text := '00000-000';
    end; {if}

  end; {if}
end;

procedure TfrmTransportadora.lbl_edtCnpjExit(Sender: TObject);
begin 

  lbl_edtCnpj.Text := CGC(lbl_edtCnpj.Text);

end;

procedure TfrmTransportadora.lbl_edtTelcomExit(Sender: TObject);
begin

  if lbl_edtTelcom.Text <> '' Then begin

    lbl_edtTelcom.Text := StringReplace(lbl_edtTelcom.Text,'-','',[rfReplaceAll]);
    lbl_edtTelcom.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtTelcom.Text));

  end;

end;

procedure TfrmTransportadora.lbl_edtTelFaxExit(Sender: TObject);
begin

  if lbl_edtTelFax.Text <> '' Then begin

    lbl_edtTelFax.Text := StringReplace(lbl_edtTelFax.Text,'-','',[rfReplaceAll]);
    lbl_edtTelFax.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtTelFax.Text));

  end;

end;

procedure TfrmTransportadora.lbl_edtCelularExit(Sender: TObject);
begin

  if lbl_edtCelular.Text <> '' Then begin

    lbl_edtCelular.Text := StringReplace(lbl_edtCelular.Text,'-','',[rfReplaceAll]);
    lbl_edtCelular.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtCelular.Text));

  end;

end;

end.


