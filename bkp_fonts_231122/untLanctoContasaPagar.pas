unit untLanctoContasaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ComCtrls,
  Grids, DBGrids, classComboBox, DB, IBQuery, ExtCtrls;

type
  TfrmContasaPagar = class(TForm)
    lbl_TipoDoc: TLabel;
    Label3: TLabel;
    lbl_edtBco: TLabel;
    Label2: TLabel;
    lbl_DataPagto: TLabel;
    lbl_Obs: TLabel;
    dbgContasaPagar: TDBGrid;
    lbl_DTIni: TLabel;
    lbl_DTF: TLabel;
    lbl_Inf: TLabel;
    Image1: TImage;
    lbl_TotalGeral: TLabel;
    Image2: TImage;
    lbl_BxIndividual: TLabel;
    Image3: TImage;
    lbl_RetornoP: TLabel;
    Image4: TImage;
    lbl_RetornoInd: TLabel;
    lbl_edtCodigo: TLabeledEdit;
    cboFornecedorServicos: TComboBox;
    cboTipoDoc: TComboBox;
    lbl_edtNumDoc: TLabeledEdit;
    cboBco: TComboBox;
    lbl_edtLocalizacao: TLabeledEdit;
    lbl_edtVlrEmitidoCli: TLabeledEdit;
    dtpEmissao: TDateTimePicker;
    dtpVcto: TDateTimePicker;
    lbl_edtVlrAmor: TLabeledEdit;
    dtpDataPagto: TDateTimePicker;
    memoObs: TMemo;
    dtpDataIni: TDateTimePicker;
    dtpDataF: TDateTimePicker;
    lbl_edtTotalGeral: TLabeledEdit;
    ckFornecedor: TCheckBox;
    ckServicos: TCheckBox;
    ckCustoDiario: TCheckBox;
    ckAberto: TCheckBox;
    ckBaixado: TCheckBox;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure LimparCampos;
    procedure CalculoTotalCP;
    procedure GravarCP;
    procedure AlterarCP;
    procedure DeletarCP;
    procedure ExecSELECT;
    procedure ExecSELECTTipoDoc;
    procedure ExecSELECTBancos;
    procedure ExecSELECTFornecedor;
    procedure ExecSELECTServicos;
    procedure ExecSELECTCustoDiario;
    procedure ckFornecedorCheck(Sender: TObject);
    procedure ckServicosCheck(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibeaIncluirCPClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure dbgContasaPagarCellClick(Column: TColumn);
    procedure ibeaAlterarCPClick(Sender: TObject);
    procedure ibeaExcluirCPClick(Sender: TObject);
    procedure dtpDataFChange(Sender: TObject);
    procedure ibeaLimparClick(Sender: TObject);
    procedure lbl_edtCodigoExit(Sender: TObject);
    procedure lbl_edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaBxCPClick(Sender: TObject);
    procedure ckCustoDiarioCheck(Sender: TObject);
    procedure ckAbertoCheck(Sender: TObject);
    procedure ckBaixadoCheck(Sender: TObject);
    procedure ibeaRetornoClick(Sender: TObject);
    procedure ibeaRelatorioClick(Sender: TObject);
    procedure ibeaBxIndividualClick(Sender: TObject);
    procedure ibeaRetornoIndClick(Sender: TObject);
    procedure bmxAbaterValorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasaPagar: TfrmContasaPagar;
  IDTipoDoc,IDTipoBancos,ClassServicos,ClassForn : TClasseCombo;
  IDClassForn : Integer;
  MontaColunas : Boolean;
  IDCPagar,IDContasaPagar : Integer;
  
implementation

uses untdmModule, funcPosto, untContasaPagarP;

{$R *.dfm}

procedure TfrmContasaPagar.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmContasaPagar.LimparCampos;

begin

cboFornecedorServicos.ClearSelection;
cboTipoDoc.ClearSelection;
lbl_edtNumDoc.Clear;
cboBco.ClearSelection;
lbl_edtVlrEmitidoCli.Clear;
memoObs.Clear;
//ckFornecedor.Checked := False;
//ckServicos.Checked := False;
//ckCustoDiario.Checked := False;
lbl_edtLocalizacao.Clear;

end;

procedure TfrmContasaPagar.CalculoTotalCP;

var

TotalTbl : Real;
TotalCP : String;

begin

  with dmModule do begin

////////////////////////////////////////////////////////////////////////////////

      if TotalTbl > 0 then begin

        TotalTbl := 0;

      end;

      if TotalCP > '0' Then begin

        TotalCP := '0';

      end;

      Commit(ibCPagar);
      ibCPagar.Close;
      ibCPagar.SQL.Clear;
      ibCPagar.SQL.Add('SELECT * FROM TBLCONTASAPAGAR WHERE (TBLCONTASAPAGAR.BAIXADO is null)or(TBLCONTASAPAGAR.BAIXADO ='''')');
      ibCPagar.Open;

      (ibCPagar.FieldByName('VLREMITIDO')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
      (ibCPagar.FieldByName('VALORABATER')as TFloatField).DisplayFormat := CasasDecimais('Produtos');

      while not ibCPagar.Eof do begin

        if TotalTbl = 0 Then begin

          TotalTbl := StrToFloat(StringReplace(FloatToStr(ibCPagar.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfreplaceAll]));

        end else begin

          TotalCP := StringReplace(FloatToStr(ibCPagar.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

          TotalTbl := TotalTbl + StrtoFloat(StringReplace(TotalCP,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        end;//if

         ibCPagar.Next;

      end;//while

      lbl_edtTotalGeral.Text := FormatFloat(CasasDecimais('Produtos'),TotalTbl);
////////////////////////////////////////////////////////////////////////////////

  end;//with

end;


procedure TfrmContasaPagar.GravarCP;

var

StringFornecedor, StringServicos, StringTipoDoc, StringBanco, ValorEmitido : String;
IDGravaServicosForn, IDGravaServicos, IDGravaTipoDoc, IDGravaBanco : TClasseCombo;
Custodiario, Baixado : String;

begin

  with dmModule do begin

    if ckFornecedor.Checked Then begin

      IDGravaServicosForn     := TClasseCombo( cboFornecedorServicos.Items.Objects[cboFornecedorServicos.ItemIndex] );
      StringFornecedor  := ' ''' + InttoStr( IDGravaServicosForn.ID ) + ''',';

    end else begin

      StringFornecedor     := ' ''0'',';

    end;

    if (ckServicos.Checked = True)or(ckCustoDiario.Checked = True) Then begin

      IDGravaServicos     := TClasseCombo( cboFornecedorServicos.Items.Objects[cboFornecedorServicos.ItemIndex] );
      StringServicos  := ' ''' + InttoStr( IDGravaServicos.ID ) + ''',';

    end else begin

      StringServicos     := ' ''0'',';

    end;

   { if ckCustoDiario.Checked Then begin

      IDGravaServicos     := TClasseCombo( cboFornecedorServicos.Items.Objects[cboFornecedorServicos.ItemIndex] );
      StringServicos  := ' ''' + InttoStr( IDGravaServicos.ID ) + ''',';

    end else begin

      StringServicos     := ' ''0'',';

    end; }

    if cboTipodoc.ItemIndex = -1 Then begin

      StringTipoDoc     := ' ''0'',';

    end else begin

      IDGravaTipoDoc     := TClasseCombo( cboTipodoc.Items.Objects[cboTipodoc.ItemIndex] );
      StringTipoDoc := ' ''' + InttoStr( IDGravaTipoDoc.ID ) + ''',';

    end;

    if cboBco.ItemIndex = -1 Then begin

      StringBanco     := ' ''0'',';

    end else begin
      IDGravaBanco     := TClasseCombo( cboBco.Items.Objects[cboBco.ItemIndex] );
      StringBanco := ' ''' + InttoStr( IDGravaBanco.ID ) + ''',';

    end;

    ValorEmitido := StringReplace(lbl_edtVlrEmitidoCli.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    ValorEmitido := StringReplace(ValorEmitido,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if ValorEmitido = '' Then
      ValorEmitido := '0';

    Baixado := '';

    if ckCustoDiario.Checked Then begin

      Custodiario := 'Sim';

      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('INSERT INTO TBLCONTASAPAGAR'
      + '(VLREMITIDO,IDFORNECEDOR,IDSERVICOS,IDTIPODOC,IDBANCO,NUMDOC,OBS,'
      + 'CUSTODIARIO,LOCALIZACAO,BAIXADO,EMISSAO,VCTO) values '
      + ' (''' + ValorEmitido + ''','
      + StringFornecedor
      + StringServicos
      + StringTipoDoc
      + StringBanco
      + ' ''' + lbl_edtNumDoc.Text + ''','
      + ' ''' + memoObs.Text + ''','
      + ' ''' + Custodiario + ''','
      + ' ''' + lbl_edtLocalizacao.Text + ''','
      + ' ''' + Baixado + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy',dtpEmissao.Date) + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy',dtpVcto.Date) + ''')');
      ibAPagar.ExecSQL;
      Commit(ibAPagar);

     { Commit(ibAPagar);
      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
      + 'TBLSERVICOSAPAGAR.TIPO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
      + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
      + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD ORDER BY TBLCONTASAPAGAR.IDCPAGAR DESC');
      ibAPagar.Open;  //(TBLCONTASAPAGAR.VCTO between:ParamDataInicial and:ParamDataF)and(TBLCONTASAPAGAR.CUSTODIARIO=''Sim'')and(TBLCONTASAPAGAR.BAIXADO is null)or(TBLCONTASAPAGAR.BAIXADO= '''')

      (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      LimparCampos;}


    end else begin

      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('INSERT INTO TBLCONTASAPAGAR'
      + '(VLREMITIDO,IDFORNECEDOR,IDSERVICOS,IDTIPODOC,IDBANCO,NUMDOC,OBS,'
      + 'LOCALIZACAO,BAIXADO,EMISSAO,VCTO) values '
      + ' (''' + ValorEmitido + ''','
      + StringFornecedor
      + StringServicos
      + StringTipoDoc
      + StringBanco
      + ' ''' + lbl_edtNumDoc.Text + ''','
      + ' ''' + memoObs.Text + ''','
      + ' ''' + lbl_edtLocalizacao.Text + ''','
      + ' ''' + Baixado + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy',dtpEmissao.Date) + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy',dtpVcto.Date) + ''')');
      ibAPagar.ExecSQL;
      Commit(ibAPagar);

    end;//if custo diario

      Commit(ibAPagar);
      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
      + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
      + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
      + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE(TBLCONTASAPAGAR.VCTO between:ParamDataInicial and:ParamDataF)ORDER BY TBLCONTASAPAGAR.IDCPAGAR DESC');
      ibAPagar.Open; //WHERE(TBLCONTASAPAGAR.VCTO between:ParamDataInicial and:ParamDataF)and(TBLCONTASAPAGAR.CUSTODIARIO=''Sim'')and(TBLCONTASAPAGAR.BAIXADO is null)or(TBLCONTASAPAGAR.BAIXADO= '''')

      ibAPagar.Close;
      ibAPagar.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibAPagar.ParamByName('ParamDataF').Value := dtpDataF.DateTime;
      ibAPagar.Open;

      (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      
      LimparCampos;


  end;//with

end;

procedure TfrmContasaPagar.AlterarCP;

var

StringAltFornecedor, StringAltServicos, StringAltTipoDoc, StringAltBanco : String;
IDAltFornecedor, IDAltServicos, IDAltTipoDoc, IDAltBanco : TClasseCombo;
ValorEmitido, CustoDiario : String;

begin


  with dmModule do begin

    if (ckFornecedor.checked) Then begin

      //traz a identificacao do funcionario do item do objeto selecionado.
      if cboFornecedorServicos.ItemIndex = -1 Then begin

        StringAltFornecedor     := ' IDFORNECEDOR=''0'',';
        //Application.MessageBox('Informe o Tanque','Notifica��o: Tanque n�o especificado',MB_OK+MB_ICONERROR);

      end else begin
        IDAltFornecedor     := TClasseCombo( cboFornecedorServicos.Items.Objects[cboFornecedorServicos.ItemIndex] );
        StringAltFornecedor := ' IDFORNECEDOR=''' + InttoStr( IDAltFornecedor.ID ) + ''',';

      end;
    end;
    //SE TIPO CLIENE FOR JURIDICA GRAVA TIPO PEEOSA 2
    if (ckServicos.checked = True)or(ckCustoDiario.checked = True) Then begin

      //traz a identificacao do funcionario do item do objeto selecionado.
      if cboFornecedorServicos.ItemIndex = -1 Then begin

        StringAltServicos     := ' IDSERVICOS=''0'',';
        //Application.MessageBox('Informe o Tanque','Notifica��o: Tanque n�o especificado',MB_OK+MB_ICONERROR);

      end else begin
        IDAltServicos     := TClasseCombo( cboFornecedorServicos.Items.Objects[cboFornecedorServicos.ItemIndex] );
        StringAltServicos := ' IDSERVICOS=''' + InttoStr( IDAltServicos.ID ) + ''',';

      end;
    end;
    {end else if (ckCustoDiario.checked) Then begin

      //traz a identificacao do funcionario do item do objeto selecionado.
      if cboFornecedorServicos.ItemIndex = -1 Then begin

        StringAltServicos     := ' IDSERVICOS=''0'',';
        //Application.MessageBox('Informe o Tanque','Notifica��o: Tanque n�o especificado',MB_OK+MB_ICONERROR);

      end else begin
        IDAltServicos     := TClasseCombo( cboFornecedorServicos.Items.Objects[cboFornecedorServicos.ItemIndex] );
        StringAltServicos := ' IDSERVICOS=''' + InttoStr( IDAltServicos.ID ) + ''',';

      end;

     end; }

////////////////////////////////////////////////////////////////////////////////

        if cboTipodoc.ItemIndex = -1 Then begin

          StringAltTipoDoc     := ' IDTIPODOC=''0'',';
          //Application.MessageBox('Informe o Tanque','Notifica��o: Tanque n�o especificado',MB_OK+MB_ICONERROR);

        end else begin
          IDAltTipoDoc     := TClasseCombo( cboTipodoc.Items.Objects[cboTipodoc.ItemIndex] );
          StringAltTipoDoc := ' IDTIPODOC=''' + InttoStr( IDAltTipoDoc.ID ) + ''',';

        end;

////////////////////////////////////////////////////////////////////////////////

      if cboBco.ItemIndex = -1 Then begin

        StringAltBanco     := ' IDBANCO=''0'',';
        //Application.MessageBox('Informe o Tanque','Notifica��o: Tanque n�o especificado',MB_OK+MB_ICONERROR);

      end else begin
        IDAltBanco     := TClasseCombo( cboBco.Items.Objects[cboBco.ItemIndex] );
        StringAltBanco := ' IDBANCO=''' + InttoStr( IDAltBanco.ID ) + ''',';

      end;

////////////////////////////////////////////////////////////////////////////////

    ValorEmitido := StringReplace(lbl_edtVlrEmitidoCli.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    ValorEmitido := StringReplace(ValorEmitido,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if ValorEmitido = '' Then
      ValorEmitido := '0';


    if ckCustoDiario.Checked Then begin

    CustoDiario := 'Sim';

    ibAPagar.Close;
    ibAPagar.SQL.Clear;
    ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
    + 'VLREMITIDO = ''' + ValorEmitido + ''','
    + 'LOCALIZACAO = ''' + lbl_edtLocalizacao.Text + ''','
    + StringAltBanco
    + StringAltTipoDoc
    + StringAltServicos
    + StringAltFornecedor
    + 'CUSTODIARIO = ''' + CustoDiario + ''','
    + 'OBS = ''' + memoObs.Text  + ''','
    + 'NUMDOC = ''' + lbl_edtNumDoc.Text + ''','
    + 'VCTO = ''' + FormatDateTime('mm-dd-yyyy',dtpVcto.Date) + ''' WHERE IDCPAGAR = ''' + InttoStr(IDCPagar) + '''');
    ibAPagar.ExecSQL;
    Commit(ibAPagar);

    ibAPagar.Close;
    ibAPagar.SQL.Clear;
    ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
    + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
    + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
    + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
    + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE TBLCONTASAPAGAR.CUSTODIARIO=''Sim'' and(IDCPAGAR = ''' + InttoStr(IDCPagar) + ''')');
    ibAPagar.Open;

    (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    
    cboFornecedorServicos.ClearSelection;
    cboTipoDoc.ClearSelection;
    lbl_edtNumDoc.Clear;
    cboBco.ClearSelection;
    lbl_edtVlrEmitidoCli.Clear;
    memoObs.Clear;
    ckFornecedor.Checked := False;
    ckServicos.Checked := False;
    lbl_edtLocalizacao.Clear;
    
    end else begin

    ibAPagar.Close;
    ibAPagar.SQL.Clear;
    ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
    + 'VLREMITIDO = ''' + ValorEmitido + ''','
    + 'LOCALIZACAO = ''' + lbl_edtLocalizacao.Text + ''','
    + StringAltBanco
    + StringAltTipoDoc
    + StringAltServicos
    + StringAltFornecedor
    + 'OBS = ''' + memoObs.Text  + ''','
    + 'NUMDOC = ''' + lbl_edtNumDoc.Text + ''','
    + 'VCTO = ''' + FormatDateTime('mm-dd-yyyy',dtpVcto.Date) + ''' WHERE IDCPAGAR = ''' + InttoStr(IDCPagar) + '''');
    ibAPagar.ExecSQL;
    Commit(ibAPagar);

    Commit(ibAPagar);
    ibAPagar.Close;
    ibAPagar.SQL.Clear;
    ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
    + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
    + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
    + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
    + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE TBLCONTASAPAGAR.CUSTODIARIO is null and(IDCPAGAR = ''' + InttoStr(IDCPagar) + ''')');
    ibAPagar.Open;

    (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    
    cboFornecedorServicos.ClearSelection;
    cboTipoDoc.ClearSelection;
    lbl_edtNumDoc.Clear;
    cboBco.ClearSelection;
    lbl_edtVlrEmitidoCli.Clear;
    memoObs.Clear;
    ckFornecedor.Checked := False;
    ckServicos.Checked := False;
    ckCustoDiario.Checked := False;
    lbl_edtLocalizacao.Clear;

    end;//if ck custodiario

  end;//with

end;

procedure TfrmContasaPagar.DeletarCP;

var
ConfirmaExclusao : Integer;

begin

  with dmModule do begin

    ConfirmaExclusao := Application.MessageBox('Confirma a Exclus�o do registro','Exclus�o de registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('DELETE FROM TBLCONTASAPAGAR WHERE IDCPAGAR=''' + IntToStr(IDCPagar) + '''');
      ibAPagar.ExecSQL;
      Commit(ibAPagar);

      ExecSELECT;

    end;//if cofirma exclusao

  end;//with

end;

procedure TfrmContasaPagar.ExecSELECT;

begin

  with dmModule do begin

    Commit(ibAPagar);
    ibAPagar.Close;
    ibAPagar.SQL.Clear;
    ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
    + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
    + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
    + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
    + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE(VCTO between :ParamDataIni and :ParamDataF) and (TBLCONTASAPAGAR.BAIXADO is null)or (TBLCONTASAPAGAR.BAIXADO = '''')');
    ibAPagar.Open;

    ibAPagar.Close;
    ibAPagar.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
    ibAPagar.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
    ibAPagar.Open;

    (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    
  end;//with

end;

procedure TfrmContasaPagar.ExecSELECTTipoDoc;

begin

  with dmModule do begin

    ibTipodoc.Close;
    ibTipodoc.SQL.Clear;
    ibTipodoc.SQL.Add('SELECT * FROM TBLTIPODOCUMENTO');
    ibTipodoc.Open;

    cboTipodoc.Clear;// LIMPA O COMBO

    while not ibTipodoc.Eof do begin//enquanto nao for fim do registro

      IDTipoDoc := TClasseCombo.Create;//ATRIBUI A CLASSE COMBO NA VARIAVEL
      IDTipoDoc.ID := ibTipodoc.FieldByName('IDTIPODOC').AsInteger;//O FIELD ATRIBUI NA VARIAVEL
      cboTipodoc.Items.AddObject(ibTipodoc.FieldByName('TIPO').AsString,IDTipoDoc);//TRAZ NO COMBO OS DADOS ARMAZENADOS NA VARIAVEL
      ibTipodoc.Next;//VAI PRO PROXIMO REGISTRO PARA O LOOPING NAO FICAR INFINITO.

    end;{while}

  end;{with}

end;

procedure TfrmContasaPagar.ExecSELECTBancos;

begin

  with dmModule do begin

    Commit(ibBancos);
    ibBancos.Close;
    ibBancos.SQL.Clear;
    ibBancos.SQL.Add('SELECT * FROM BANCOS');
    ibBancos.Open;

    cboBco.Clear;// LIMPA O COMBO

    while not ibBancos.Eof do begin//enquanto nao for fim do registro

      IDTipoBancos := TClasseCombo.Create;//ATRIBUI A CLASSE COMBO NA VARIAVEL
      IDTipoBancos.ID := ibBancos.FieldByName('IDBCO').AsInteger;//O FIELD ATRIBUI NA VARIAVEL
      cboBco.Items.AddObject(ibBancos.FieldByName('DESCRICAO').AsString,IDTipoBancos);//TRAZ NO COMBO OS DADOS ARMAZENADOS NA VARIAVEL
      ibBancos.Next;//VAI PRO PROXIMO REGISTRO PARA O LOOPING NAO FICAR INFINITO.

    end;{while}

  end;{with}

end;

procedure TfrmContasaPagar.ExecSELECTFornecedor;

begin

  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClassForn := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICA��O DO FORNECEDOR NA VARIAVEL.

    Commit(ibCadastro);
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClassForn)+'''ORDER BY NOME');//('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboFornecedorServicos.Clear; //LIMPA O COMBOBOX

    while not ibCadastro.Eof do begin

      ClassForn    := TClasseCombo.Create;
      ClassForn.ID  := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboFornecedorServicos.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,ClassForn);
      ibCadastro.Next;

    end;{WHILE}

  end;{WITH}

end;

procedure TfrmContasaPagar.ExecSELECTServicos;

begin

  with dmModule do begin

    Commit(ibServicos);
    ibServicos.Close;
    ibServicos.SQL.Clear;
    ibServicos.SQL.Add('SELECT * FROM TBLSERVICOSAPAGAR WHERE SERVICOS=''Sim''');
    ibServicos.Open;

    cboFornecedorServicos.Clear; //LIMPA O COMBOBOX

    while not ibServicos.Eof do begin

      ClassServicos     := TClasseCombo.Create;
      ClassServicos.ID  := ibServicos.FieldByName('IDSERVICO').AsInteger;
      cboFornecedorServicos.Items.AddObject(ibServicos.FieldByName('DESCRICAO').AsString,ClassServicos);
      ibServicos.Next;

    end;{WHILE}

  end;{with}

end;

procedure TfrmContasaPagar.ExecSELECTCustoDiario;

begin

  with dmModule do begin

    Commit(ibServicos);
    ibServicos.Close;
    ibServicos.SQL.Clear;
    ibServicos.SQL.Add('SELECT * FROM TBLSERVICOSAPAGAR WHERE CUSTODIARIO=''Sim''');
    ibServicos.Open;

    cboFornecedorServicos.Clear; //LIMPA O COMBOBOX

    while not ibServicos.Eof do begin

      ClassServicos     := TClasseCombo.Create;
      ClassServicos.ID  := ibServicos.FieldByName('IDSERVICO').AsInteger;
      cboFornecedorServicos.Items.AddObject(ibServicos.FieldByName('DESCRICAO').AsString,ClassServicos);
      ibServicos.Next;

    end;{WHILE}

  end;{with}

end;

procedure TfrmContasaPagar.ckFornecedorCheck(Sender: TObject);
begin

  if ckFornecedor.Checked Then begin

    ckServicos.Checked := False;
    ckCustoDiario.Checked := False;
    ExecSELECTFornecedor;

  end;

end;

procedure TfrmContasaPagar.ckServicosCheck(Sender: TObject);
begin

  if ckServicos.Checked Then begin

    ckFornecedor.Checked := False;
    ckCustoDiario.Checked := False;
    ExecSELECTServicos;

  end;

end;

procedure TfrmContasaPagar.FormShow(Sender: TObject);
begin

  dtpVcto.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpEmissao.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataPagto.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataF.DateTime    := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  ckAberto.Checked := True;

  with dmModule do begin

    ExecSELECT;
    ExecSELECTTipoDoc;
    ExecSELECTBancos;
    dtpDataFChange(Sender);
    CalculoTotalCP;
    
    with dbgContasaPagar do begin

      if MontaColunas Then begin

        DataSource := dmModule.dtsAPagar;

        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);
        Columns.Insert(5);
        Columns.Insert(6);
        Columns.Insert(7);
        Columns.Insert(8);

        //Parametros da Coluna que exibe o C�digo do Produto
        // Parametros que exibe o nome do produto
        Columns.Items[0].Title.Caption := 'Servi�os';
        Columns.Items[0].FieldName     := 'NomeServico';
        Columns.Items[0].Width         := 150;
        Columns.Items[0].Alignment     := taLeftJustify;


        // Parametros que exibe o Bico da Bomba
        Columns.Items[1].Title.Caption := 'Fornecedor';
        Columns.Items[1].FieldName     := 'Cliente';
        Columns.Items[1].Width         := 100;
        Columns.Items[1].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[2].Title.Caption := 'Banco';
        Columns.Items[2].FieldName     := 'Bco';
        Columns.Items[2].Width         := 100;
        Columns.Items[2].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[3].Title.Caption := 'N�Doc.';
        Columns.Items[3].FieldName     := 'NUMDOC';
        Columns.Items[3].Width         := 80;
        Columns.Items[3].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[4].Title.Caption := 'Valor';
        Columns.Items[4].FieldName     := 'VLREMITIDO';
        Columns.Items[4].Width         := 80;
        Columns.Items[4].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[5].Title.Caption := 'Emiss�o';
        Columns.Items[5].FieldName     := 'EMISSAO';
        Columns.Items[5].Width         := 80;
        Columns.Items[5].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[6].Title.Caption := 'Vcto.';
        Columns.Items[6].FieldName     := 'VCTO';
        Columns.Items[6].Width         := 80;
        Columns.Items[6].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[7].Title.Caption := 'Vlr.Amortizado';
        Columns.Items[7].FieldName     := 'VALORABATER';
        Columns.Items[7].Width         := 92;
        Columns.Items[7].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[8].Title.Caption := 'Data Amortizado';
        Columns.Items[8].FieldName     := 'DTPAGTOABAT';
        Columns.Items[8].Width         := 92;
        Columns.Items[8].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with monta colunas}

  end;//with

end;

procedure TfrmContasaPagar.ibeaIncluirCPClick(Sender: TObject);

var

ConfirmaGravacao : Integer;

begin

  with dmModule do begin

  ConfirmaGravacao := Application.MessageBox('Confirma o Registro?','Inclus�o de registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaGravacao = 6 Then begin

      GravarCP;
      CalculoTotalCP;
      
    end;//if


  end;//with

end;

procedure TfrmContasaPagar.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmContasaPagar.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmContasaPagar.dbgContasaPagarCellClick(Column: TColumn);

var

i : Integer;

begin

  with dmModule do begin

  IDCPagar := ibAPagar.FieldByName('IDCPAGAR').AsInteger;
  IDContasaPagar := ibAPagar.FieldByName('IDCPAGAR').AsInteger;

    if ibAPagar.RecordCount > 0 Then begin

      lbl_edtNumDoc.Text        := ibAPagar.FieldByName('NUMDOC').AsString;
      lbl_edtVlrEmitidoCli.Text := FormatFloat(CasasDecimais('Produtos'),ibAPagar.FieldByName('VLREMITIDO').AsFloat);
      lbl_edtVlrAmor.Text := FormatFloat(CasasDecimais('Produtos'),ibAPagar.FieldByName('VALORABATER').AsFloat);
      memoObs.Text              := ibAPagar.FieldByName('OBS').AsString;
      dtpEmissao.Date           := ibAPagar.FieldByName('EMISSAO').AsDateTime;
      dtpVcto.Date              := ibAPagar.FieldByName('VCTO').AsDateTime;
      lbl_edtLocalizacao.Text   := ibAPagar.FieldByName('LOCALIZACAO').AsString;
      
////////////////////////////////////////////////////////////////////////////////

    if ibAPagar.FieldByName('IDFORNECEDOR').AsInteger <> 0 Then begin

       ckFornecedor.Checked := True;
       ckServicos.Checked := False;

       ExecSELECTFornecedor;

      for i:=0 to cboFornecedorServicos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboFornecedorServicos.Items.Objects[i]).ID = ibAPagar.FieldByName('IDFORNECEDOR').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboFornecedorServicos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboFornecedorServicos.ClearSelection;//LIMPA A SELECAO.
        end;{if}
      end;{for}

    end;

    if (ibAPagar.FieldByName('CUSTODIARIO').AsString <> 'Sim')and(ibAPagar.FieldByName('IDSERVICOS').AsInteger > 0) Then begin
     //
         ckServicos.Checked := True;
         ckFornecedor.Checked := False;

         ExecSELECTServicos;

      for i:=0 to cboFornecedorServicos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboFornecedorServicos.Items.Objects[i]).ID = ibAPagar.FieldByName('IDSERVICOS').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboFornecedorServicos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboFornecedorServicos.ClearSelection;//LIMPA A SELECAO.
        end;{if}
      end;{for}

    end else if (ibAPagar.FieldByName('CUSTODIARIO').AsString='Sim')and(ibAPagar.FieldByName('IDSERVICOS').AsInteger > 0) Then begin

         ckCustoDiario.Checked := True;
         ckServicos.Checked := False;
         ckFornecedor.Checked := False;

         ExecSELECTCustoDiario;

      for i:=0 to cboFornecedorServicos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboFornecedorServicos.Items.Objects[i]).ID = ibAPagar.FieldByName('IDSERVICOS').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboFornecedorServicos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboFornecedorServicos.ClearSelection;//LIMPA A SELECAO.
        end;{if}
      end;{for}

    end;{if condicao}

////////////////////////////////////////////////////////////////////////////////


    for i:=0 to cboTipodoc.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboTipodoc.Items.Objects[i]).ID = ibAPagar.FieldByName('IDTIPODOC').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboTipodoc.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboTipodoc.ClearSelection;//LIMPA A SELECAO.
      end;{if}
    end;{for}

////////////////////////////////////////////////////////////////////////////////


    for i:=0 to cboBco.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboBco.Items.Objects[i]).ID = ibAPagar.FieldByName('IDBANCO').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboBco.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboBco.ClearSelection;//LIMPA A SELECAO.
      end;{if}
    end;{for}

////////////////////////////////////////////////////////////////////////////////



    end;//if recordcount

  end;//with

end;

procedure TfrmContasaPagar.ibeaAlterarCPClick(Sender: TObject);

var

ConfirmaAlteracao : Integer;

begin

  with dmModule do begin

    ConfirmaAlteracao := Application.MessageBox('Confirma a Altera��o','Altera��o de registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaAlteracao = 6 Then begin

      AlterarCP;
      CalculoTotalCP;
    //  ExecSELECT;
   //   LimparCampos;
      
    end;//if

  end;//with

end;

procedure TfrmContasaPagar.ibeaExcluirCPClick(Sender: TObject);
begin

  with dmModule do begin

    DeletarCP;
    CalculoTotalCP;
    LimparCampos;

  end;//with

end;

procedure TfrmContasaPagar.dtpDataFChange(Sender: TObject);
begin

  with dmModule do begin


    if (ckCustoDiario.Checked)and(ckAberto.Checked = False) Then begin

      Commit(ibAPagar);
      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
      + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
      + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
      + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE(TBLCONTASAPAGAR.VCTO between :ParamDataIni and :ParamDataF)and(TBLCONTASAPAGAR.CUSTODIARIO=''Sim'')and(TBLCONTASAPAGAR.BAIXADO = '''')ORDER BY TBLCONTASAPAGAR.VCTO ASC');
      ibAPagar.Open;

      ibAPagar.Close;
      ibAPagar.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibAPagar.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibAPagar.Open;

      (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

    end;

    if (ckAberto.Checked)and(ckCustoDiario.Checked = False) Then begin

      Commit(ibAPagar);
      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
      + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
      + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
      + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE(TBLCONTASAPAGAR.VCTO between :ParamDataIni and :ParamDataF)and(TBLCONTASAPAGAR.CUSTODIARIO is null)and(TBLCONTASAPAGAR.BAIXADO = '''')ORDER BY TBLCONTASAPAGAR.VCTO ASC');
      ibAPagar.Open;

      ibAPagar.Close;
      ibAPagar.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibAPagar.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibAPagar.Open;

      (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

    end;//if ckaberto

    if (ckBaixado.Checked)and(ckCustoDiario.Checked = False) Then begin

      Commit(ibAPagar);
      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
      + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
      + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
      + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE(TBLCONTASAPAGAR.VCTO between :ParamDataIni and :ParamDataF)and(TBLCONTASAPAGAR.BAIXADO = ''Sim'')and(TBLCONTASAPAGAR.CUSTODIARIO is null)ORDER BY TBLCONTASAPAGAR.VCTO ASC');
      ibAPagar.Open;

      ibAPagar.Close;
      ibAPagar.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibAPagar.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibAPagar.Open;

      (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

    end;//if ckbaixado

    if (ckBaixado.Checked)and(ckCustoDiario.Checked) Then begin

      Commit(ibAPagar);
      ibAPagar.Close;
      ibAPagar.SQL.Clear;
      ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
      + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
      + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
      + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE(TBLCONTASAPAGAR.VCTO between :ParamDataIni and :ParamDataF)and(TBLCONTASAPAGAR.BAIXADO = ''Sim'')and(TBLCONTASAPAGAR.CUSTODIARIO=''Sim'')ORDER BY TBLCONTASAPAGAR.VCTO ASC');
      ibAPagar.Open;

      ibAPagar.Close;
      ibAPagar.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibAPagar.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibAPagar.Open;

      (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      
    end;//if ckbaixado

  end;//with

end;

procedure TfrmContasaPagar.ibeaLimparClick(Sender: TObject);
begin
LimparCampos;
end;

procedure TfrmContasaPagar.lbl_edtCodigoExit(Sender: TObject);

var

i : Integer;

begin

  with dmModule do begin

    Commit(ibAPagar);
    ibAPagar.Close;
    ibAPagar.SQL.Clear;
    ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
    + 'TBLSERVICOSAPAGAR.TIPO As NomeServico,TBLCADASTRO.NOME As Cliente,'
    + 'TBLCADDOCUMENTACAO.CODIGO,TBLCADASTRO.NOME As Fornecedor FROM TBLCONTASAPAGAR '
    + 'LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADDOCUMENTACAO.IDCAD '
    + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD '
    + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
    + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
    + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE TBLCONTASAPAGAR.CUSTODIARIO is null and(VCTO between :ParamDataIni and :ParamDataF)and TBLCADDOCUMENTACAO.CODIGO=''' + lbl_edtCodigo.Text + '''');
    ibAPagar.Open;

   { ibAPagar.Close;
    ibAPagar.SQL.Clear;
    ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
    + 'TBLSERVICOSAPAGAR.TIPO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
    + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
    + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
    + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE TBLCONTASAPAGAR.CUSTODIARIO is null and(VCTO between :ParamDataIni and :ParamDataF)');
    ibAPagar.Open;}

    ibAPagar.Close;
    ibAPagar.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
    ibAPagar.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
    ibAPagar.Open;

    (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      for i:=0 to cboFornecedorServicos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
        if TClasseCombo( cboFornecedorServicos.Items.Objects[i]).ID = ibAPagar.FieldByName('IDCAD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
          cboFornecedorServicos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
          Break;
        end else begin
          cboFornecedorServicos.ClearSelection;//LIMPA A SELECAO.
        end;{if}
      end;{for}

  end;//with

end;

procedure TfrmContasaPagar.lbl_edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 Then begin

lbl_edtVlrEmitidoCli.SetFocus;

end;

end;

procedure TfrmContasaPagar.ibeaBxCPClick(Sender: TObject);

var

ConfirmaExclusao : Integer;
Baixado : String;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Aten��o este procedimento baixa o contas a pagar do per�odo determinado, deseja continuar??','Baixa do Contas a pagar',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      Baixado := 'Sim';

      while not ibAPagar.Eof do begin

        if (ckAberto.Checked)and(ckCustoDiario.Checked = False)Then begin

          ibAPagar.Close;
          ibAPagar.SQL.Clear;
          ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
          + 'BAIXADO = ''' + Baixado + ''','
          + 'DATADABAIXA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''' WHERE(TBLCONTASAPAGAR.CUSTODIARIO is null)and(TBLCONTASAPAGAR.BAIXADO ='''')and(TBLCONTASAPAGAR.VCTO between :ParamDataInicial and :ParamDataF)');
          ibAPagar.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
          ibAPagar.ParamByName('ParamDataF').Value := dtpDataF.DateTime;
          ibAPagar.ExecSQL;

          Commit(ibAPagar);

          dtpDataFChange(Sender);

        end;//if

        if (ckCustoDiario.Checked)and(ckAberto.Checked = False)Then begin

          ibAPagar.Close;
          ibAPagar.SQL.Clear;
          ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
          + 'BAIXADO = ''' + Baixado + ''','
          + 'DATADABAIXA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''' WHERE(TBLCONTASAPAGAR.CUSTODIARIO=''Sim'')and(TBLCONTASAPAGAR.BAIXADO ='''')and(TBLCONTASAPAGAR.VCTO between :ParamDataInicial and :ParamDataF)');
          ibAPagar.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
          ibAPagar.ParamByName('ParamDataF').Value := dtpDataF.DateTime;
          ibAPagar.ExecSQL;

          Commit(ibAPagar);

          dtpDataFChange(Sender);

        end;//if
          {ibAPagar.Close;
          ibAPagar.SQL.Clear;
          ibAPagar.SQL.Add('SELECT * FROM TBLCONTASAPAGAR WHERE (TBLCONTASAPAGAR.VCTO between :ParamDataInicial and :ParamDataF)and (TBLCONTASAPAGAR.BAIXADO is null)or(TBLCONTASAPAGAR.BAIXADO ='''')');
          ibAPagar.Open;

          ibAPagar.Close;
          ibAPagar.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
          ibAPagar.ParamByName('ParamDataF').Value := dtpDataF.DateTime;
          ibAPagar.Open;}

        ibAPagar.Next;

      end;//while

    end;//if confirmaexclusao

  end;//with

end;

procedure TfrmContasaPagar.ckCustoDiarioCheck(Sender: TObject);
begin

  if ckCustoDiario.Checked Then begin

    ckServicos.Checked := False;
    ckFornecedor.Checked := False;
    ckAberto.Checked  := False;
    ckBaixado.Checked := False;

  end;

  with dmModule do begin

    ExecSELECTCustoDiario;

  end;//with

end;

procedure TfrmContasaPagar.ckAbertoCheck(Sender: TObject);
begin

  if ckAberto.Checked Then begin

    ckBaixado.Checked := False;
   // ckCustoDiario.Checked := False;

  end;

  with dmModule do begin

    dtpDataFChange(Sender);

  end;//with

end;

procedure TfrmContasaPagar.ckBaixadoCheck(Sender: TObject);
begin

  if ckBaixado.Checked Then begin

    ckAberto.Checked := False;
   // ckCustoDiario.Checked := False;

  end;

  with dmModule do begin

    dtpDataFChange(Sender);

  end;//with

end;

procedure TfrmContasaPagar.ibeaRetornoClick(Sender: TObject);

var

ConfirmaExclusao : Integer;
Baixado : String;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Aten��o este procedimento retorna o contas a pagar do per�odo determinado, deseja continuar??','Retorno do Contas a Pagar',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      Baixado := '';



      while not ibAPagar.Eof do begin

        if (ckBaixado.Checked)and(ckCustoDiario.Checked = False)Then begin

          ibAPagar.Close;
          ibAPagar.SQL.Clear;
          ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
          + 'BAIXADO = ''' + Baixado + ''','
          + 'DATADABAIXA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''' WHERE(TBLCONTASAPAGAR.CUSTODIARIO is null)and(TBLCONTASAPAGAR.BAIXADO =''Sim'')and(TBLCONTASAPAGAR.VCTO between :ParamDataInicial and :ParamDataF)');
          ibAPagar.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
          ibAPagar.ParamByName('ParamDataF').Value := dtpDataF.DateTime;
          ibAPagar.ExecSQL;

          Commit(ibAPagar);

          dtpDataFChange(Sender);

        end;//if

        if (ckCustoDiario.Checked)and(ckBaixado.Checked)Then begin

          ibAPagar.Close;
          ibAPagar.SQL.Clear;
          ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
          + 'BAIXADO = ''' + Baixado + ''','
          + 'DATADABAIXA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''' WHERE(TBLCONTASAPAGAR.CUSTODIARIO=''Sim'')and(TBLCONTASAPAGAR.BAIXADO =''Sim'')and(TBLCONTASAPAGAR.VCTO between :ParamDataInicial and :ParamDataF)');
          ibAPagar.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
          ibAPagar.ParamByName('ParamDataF').Value := dtpDataF.DateTime;
          ibAPagar.ExecSQL;

          Commit(ibAPagar);

          dtpDataFChange(Sender);

        end;//if

        {ibAPagar.Close;
        ibAPagar.SQL.Clear;
        ibAPagar.SQL.Add('SELECT * FROM TBLCONTASAPAGAR WHERE(TBLCONTASAPAGAR.VCTO between :ParamDataInicial and :ParamDataF)and TBLCONTASAPAGAR.BAIXADO =''Sim''');
        ibAPagar.Open;

        ibAPagar.Close;
        ibAPagar.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
        ibAPagar.ParamByName('ParamDataF').Value := dtpDataF.DateTime;
        ibAPagar.Open;}


        ibAPagar.Next;

      end;//while

      CalculoTotalCP;

    end;//if confirmamsg

  end;//with

end;

procedure TfrmContasaPagar.ibeaRelatorioClick(Sender: TObject);
begin
frmContasaPagarP.ShowModal;
end;

procedure TfrmContasaPagar.ibeaBxIndividualClick(Sender: TObject);

var

ConfirmaExclusao : Integer;
Recebido : String;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Aten��o este procedimento baixa o contas a pagar selecionado, deseja continuar??','Baixa do Contas a pagar',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      Recebido := 'Sim';

        ibAPagar.Close;
        ibAPagar.SQL.Clear;
        ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
        + 'BAIXADO = ''' + Recebido + ''','
        + 'DATADABAIXA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''' WHERE IDCPAGAR=''' + IntToStr(IDContasaPagar) + '''');
        ibAPagar.ExecSQL;

    end;//if confirmaexclusao

    dtpDataFChange(Sender);
    IDContasaPagar := 0;

  end;//with

end;

procedure TfrmContasaPagar.ibeaRetornoIndClick(Sender: TObject);

var

ConfirmaExclusao : Integer;
Recebido : String;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Aten��o este procedimento retorna o contas a pagar selecionado, deseja continuar??','Retorno do Contas a pagar',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      Recebido := '';

        ibAPagar.Close;
        ibAPagar.SQL.Clear;
        ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
        + 'BAIXADO = ''' + Recebido + ''','
        + 'DATADABAIXA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''' WHERE IDCPAGAR=''' + IntToStr(IDContasaPagar) + '''');
        ibAPagar.ExecSQL;

    end;//if confirmaexclusao

    dtpDataFChange(Sender);
    IDContasaPagar := 0;

  end;//with


end;

procedure TfrmContasaPagar.bmxAbaterValorClick(Sender: TObject);

var
ValorDocumento, ValorAbater, Valor, ValorAmortizado : Real;
TotalDocumento, VlrAmor : String;
ConfirmaAbat : Integer;
begin

  with dmModule do begin

    if lbl_edtVlrAmor.Text <> '' Then begin

      if (IDContasaPagar > 0)and(lbl_edtVlrEmitidoCli.Text > '0,00')Then begin

        ConfirmaAbat := Application.MessageBox('Confirma o abatimento do Valor?','Abater Valor',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

        if ConfirmaAbat = 6 Then begin

          ValorDocumento := StrToFloat(StringReplace(lbl_edtVlrEmitidoCli.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
          ValorAbater    := StrToFloat(StringReplace(lbl_edtVlrAmor.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          if ValorDocumento > ValorAbater Then begin

            Valor := ValorDocumento - ValorAbater;

          end else if ValorDocumento < ValorAbater Then begin

            Valor := ValorAbater - ValorDocumento;

          end;

          ValorAmortizado := StrToFloat(StringReplace(FloatToStr(ibCPagar.FieldByName('VALORABATER').AsFloat),FormatSettings.ThousandSeparator,'',[rfreplaceAll]));

          TotalDocumento := StringReplace(FloatToStr(Valor),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
          TotalDocumento := StringReplace(TotalDocumento,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

          if ValorAbater > 0 Then begin

          VlrAmor        := StringReplace(FloatToStr(ValorAbater + ValorAmortizado),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
          VlrAmor := StringReplace(VlrAmor,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

          end;

          if (ValorAbater = 0)or(ValorAbater = 0)Then begin

            VlrAmor := FormatFloat(CasasDecimais('Produtos'),0);

          end;

        end;//if confirma abat

          ibAPagar.Close;
          ibAPagar.SQL.Clear;
          ibAPagar.SQL.Add('UPDATE TBLCONTASAPAGAR SET '
          +'VALORABATER = ''' + VlrAmor + ''','
          +'VLREMITIDO = ''' + TotalDocumento + ''','
          +'DTPAGTOABAT = ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagto.Date) + ''' WHERE IDCPAGAR=''' + IntToStr(IDContasaPagar) + '''');
          ibAPagar.ExecSQL;
          Commit(ibAPagar);

          ibAPagar.Close;
          ibAPagar.SQL.Clear;
          ibAPagar.SQL.Add('SELECT TBLCONTASAPAGAR.*,BANCOS.DESCRICAO As Bco,'
          + 'TBLSERVICOSAPAGAR.DESCRICAO As NomeServico,TBLCADASTRO.NOME As Cliente FROM TBLCONTASAPAGAR '
          + 'LEFT OUTER JOIN BANCOS ON TBLCONTASAPAGAR.IDBANCO=BANCOS.IDBCO '
          + 'LEFT OUTER JOIN  TBLSERVICOSAPAGAR ON TBLCONTASAPAGAR.IDSERVICOS=TBLSERVICOSAPAGAR.IDSERVICO '
          + 'LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASAPAGAR.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE TBLCONTASAPAGAR.CUSTODIARIO=''Sim'' and(IDCPAGAR = ''' + InttoStr(IDCPagar) + ''')');
          ibAPagar.Open;

          (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
          (ibAPagar.FieldByName('VALORABATER') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          cboFornecedorServicos.ClearSelection;
          cboTipoDoc.ClearSelection;
          lbl_edtNumDoc.Clear;
          cboBco.ClearSelection;
          lbl_edtVlrEmitidoCli.Clear;
          memoObs.Clear;
          ckFornecedor.Checked := False;
          ckServicos.Checked := False;
          lbl_edtLocalizacao.Clear;
          lbl_edtVlrAmor.Clear;


      end;//if contas a pagar e vlr <> ''

    end;//if vlr amor <> ''

  end;//with

end;

end.

