unit untOSPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BmsXPButton, ComCtrls, mxFlatControls, StdCtrls, IBQuery,
  classComboBox, BmsXPCheckBox;

type
  TfrmOSPeriodo = class(TForm)
    ibeSair: TBmsXPButton;
    ibeaVisualizar: TBmsXPButton;
    cboFuncionario: TmxFlatComboBox;
    dtpDataIni: TmxFlatDateTimePicker;
    dtpDataF: TmxFlatDateTimePicker;
    lbl_Func: TLabel;
    lbl_DataIni: TLabel;
    lbl_DataF: TLabel;
    ckAberto: TBmsXPCheckBox;
    ckBaixado: TBmsXPCheckBox;
    procedure ibeSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure SelectFuncionario;
    procedure FormShow(Sender: TObject);
    procedure ibeaVisualizarClick(Sender: TObject);
    procedure ckAbertoCheck(Sender: TObject);
    procedure ckBaixadoCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOSPeriodo: TfrmOSPeriodo;

implementation

uses funcPosto, DB, untdmModule, untRelatOS;

{$R *.dfm}

procedure TfrmOSPeriodo.ibeSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmOSPeriodo.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmOSPeriodo.SelectFuncionario;

var

IDCLassFunc : TClasseCombo;

begin

  with dmModule do begin

    Commit(ibUser);
    ibUser.Close;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE TIPOUSUARIO=''Funcionario''');
    ibUser.Open;

    cboFuncionario.Clear;

    while not ibUser.Eof do begin

      IDCLassFunc := TClasseCombo.Create;
      IDCLassFunc.ID := ibUser.FieldByName('IDUSER').AsInteger;
      cboFuncionario.Items.AddObject(ibUser.FieldByName('NOME').AsString,IDCLassFunc);
      ibUser.Next;

    end;//while

  end;//with

end;

procedure TfrmOSPeriodo.FormShow(Sender: TObject);
begin

  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataF.DateTime    := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin

    SelectFuncionario;

  end;//with

end;

procedure TfrmOSPeriodo.ibeaVisualizarClick(Sender: TObject);

var
IDClassFunc : TClasseCombo;

begin

  with dmModule do begin

    if (ckAberto.Checked)and(cboFuncionario.ItemIndex <> -1) Then begin

      IDClassFunc := TClasseCombo(cboFuncionario.Items.Objects[cboFuncionario.ItemIndex]);

      Commit(ibTempServicos);
      ibTempServicos.Close;
      ibTempServicos.SQL.Clear;
      ibTempServicos.SQL.Add('SELECT TBLSERVICOS.*,TBLCADASTRO.NOME As Cliente,'
      + 'TBLCADASTRO.TELEFONE As FoneCli, TBLCADASTRO.CELULAR As CelularCli,TBLUSER.NOME As NomeFunc,'
      + 'TBLCONTROLESERVICOS.DATA  As DataServico,TBLCONTROLESERVICOS.OBS As Observacao FROM TBLSERVICOS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOS.IDFUNC=TBLUSER.IDUSER '
      + 'LEFT OUTER JOIN TBLCONTROLESERVICOS ON TBLSERVICOS.IDNUMEROSERVICO=TBLCONTROLESERVICOS.CODIGOSERVICO WHERE(TBLSERVICOS.DATA between :ParamDataIni and :ParamDataF)and(TBLSERVICOS.IDFUNC=''' + IntToStr(IDClassFunc.ID) + ''')and(TBLSERVICOS.SITUACAO=''Pendente'')ORDER BY TBLSERVICOS.IDNUMEROSERVICO ASC');
      ibTempServicos.Open;

      ibTempServicos.Close;
      ibTempServicos.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibTempServicos.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibTempServicos.Open;

      Application.CreateForm(TfrmRelatOS, frmRelatOS);

    TRY

     with frmRelatOS do begin

       frmRelatOS.qrpOS.DataSet := ibTempServicos;


      //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT

       qrdbNServico.DataSet     := ibTempServicos;
       qrdbNServico.DataField   := ibTempServicos.FieldByName('IDNUMEROSERVICO').FieldName;

       qrdbServico.DataSet     := ibTempServicos;
       qrdbServico.DataField   := ibTempServicos.FieldByName('NOMESERVICO').FieldName;

       qrdbServicoAvulso.DataSet     := ibTempServicos;
       qrdbServicoAvulso.DataField   := ibTempServicos.FieldByName('SERVICOAVULSO').FieldName;


       qrdbVlrUnit.DataSet       := ibTempServicos;
       qrdbVlrUnit.DataField     := ibTempServicos.FieldByName('VLRA').FieldName;
       (ibTempServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       qrdbTotal.DataSet       := ibTempServicos;
       qrdbTotal.DataField     := ibTempServicos.FieldByName('VLRTOTAL').FieldName;
       (ibTempServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

         qrl_DataInicial.Caption := DateToStr(dtpDataIni.Date);
         qrl_DataF.Caption  := DateToStr(dtpDataF.Date);

         qrl_Situacao.Caption := 'Em Aberto';

        if cboFuncionario.Text <> '' Then begin

          qrl_Funcionario.Caption := cboFuncionario.Text;

        end else begin

          qrl_Funcionario.Caption := '';

        end;

       qrpOS.Preview;

     end;

    EXCEPT
      on E : Exception do begin
         frmRelatOS.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;

    end;//if cbo func <> ''
////////////////////////////////////////////////////////////////////////////////

    if (ckBaixado.Checked)and(cboFuncionario.ItemIndex <> -1) Then begin

      IDClassFunc := TClasseCombo(cboFuncionario.Items.Objects[cboFuncionario.ItemIndex]);

      Commit(ibTempServicos);
      ibTempServicos.Close;
      ibTempServicos.SQL.Clear;
      ibTempServicos.SQL.Add('SELECT TBLSERVICOS.*,TBLCADASTRO.NOME As Cliente,'
      + 'TBLCADASTRO.TELEFONE As FoneCli, TBLCADASTRO.CELULAR As CelularCli,TBLUSER.NOME As NomeFunc,'
      + 'TBLCONTROLESERVICOS.DATA  As DataServico,TBLCONTROLESERVICOS.OBS As Observacao FROM TBLSERVICOS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOS.IDFUNC=TBLUSER.IDUSER '
      + 'LEFT OUTER JOIN TBLCONTROLESERVICOS ON TBLSERVICOS.IDNUMEROSERVICO=TBLCONTROLESERVICOS.CODIGOSERVICO WHERE(TBLSERVICOS.DATA between :ParamDataIni and :ParamDataF)and(TBLSERVICOS.IDFUNC=''' + IntToStr(IDClassFunc.ID) + ''')and(TBLSERVICOS.SITUACAO=''Baixado'')ORDER BY TBLSERVICOS.IDNUMEROSERVICO ASC');
      ibTempServicos.Open;

      ibTempServicos.Close;
      ibTempServicos.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibTempServicos.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibTempServicos.Open;

      Application.CreateForm(TfrmRelatOS, frmRelatOS);

    TRY

     with frmRelatOS do begin

       frmRelatOS.qrpOS.DataSet := ibTempServicos;


      //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT

       qrdbNServico.DataSet     := ibTempServicos;
       qrdbNServico.DataField   := ibTempServicos.FieldByName('IDNUMEROSERVICO').FieldName;

       qrdbServico.DataSet     := ibTempServicos;
       qrdbServico.DataField   := ibTempServicos.FieldByName('NOMESERVICO').FieldName;

       qrdbServicoAvulso.DataSet     := ibTempServicos;
       qrdbServicoAvulso.DataField   := ibTempServicos.FieldByName('SERVICOAVULSO').FieldName;


       qrdbVlrUnit.DataSet       := ibTempServicos;
       qrdbVlrUnit.DataField     := ibTempServicos.FieldByName('VLRA').FieldName;
       (ibTempServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       qrdbTotal.DataSet       := ibTempServicos;
       qrdbTotal.DataField     := ibTempServicos.FieldByName('VLRTOTAL').FieldName;
       (ibTempServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

         qrl_DataInicial.Caption := DateToStr(dtpDataIni.Date);
         qrl_DataF.Caption  := DateToStr(dtpDataF.Date);

         qrl_Situacao.Caption := 'Baixados';

        if cboFuncionario.Text <> '' Then begin

          qrl_Funcionario.Caption := cboFuncionario.Text;

        end else begin

          qrl_Funcionario.Caption := '';

        end;

       qrpOS.Preview;

     end;

    EXCEPT
      on E : Exception do begin
         frmRelatOS.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;

    end;//if cbo func <> ''
////////////////////////////////////////////////////////////////////////////////

    if (ckAberto.Checked)and(cboFuncionario.Text = '') Then begin

      Commit(ibTempServicos);
      ibTempServicos.Close;
      ibTempServicos.SQL.Clear;
      ibTempServicos.SQL.Add('SELECT TBLSERVICOS.*,TBLCADASTRO.NOME As Cliente,'
      + 'TBLCADASTRO.TELEFONE As FoneCli, TBLCADASTRO.CELULAR As CelularCli,TBLUSER.NOME As NomeFunc,'
      + 'TBLCONTROLESERVICOS.DATA  As DataServico,TBLCONTROLESERVICOS.OBS As Observacao FROM TBLSERVICOS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOS.IDFUNC=TBLUSER.IDUSER '
      + 'LEFT OUTER JOIN TBLCONTROLESERVICOS ON TBLSERVICOS.IDNUMEROSERVICO=TBLCONTROLESERVICOS.CODIGOSERVICO WHERE(TBLSERVICOS.DATA between :ParamDataIni and :ParamDataF)and(TBLSERVICOS.SITUACAO=''Pendente'')ORDER BY TBLSERVICOS.IDNUMEROSERVICO ASC');
      ibTempServicos.Open;

      ibTempServicos.Close;
      ibTempServicos.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibTempServicos.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibTempServicos.Open;

      Application.CreateForm(TfrmRelatOS, frmRelatOS);

    TRY

     with frmRelatOS do begin

       frmRelatOS.qrpOS.DataSet := ibTempServicos;


      //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT

       qrdbNServico.DataSet     := ibTempServicos;
       qrdbNServico.DataField   := ibTempServicos.FieldByName('IDNUMEROSERVICO').FieldName;

       qrdbServico.DataSet     := ibTempServicos;
       qrdbServico.DataField   := ibTempServicos.FieldByName('NOMESERVICO').FieldName;

       qrdbServicoAvulso.DataSet     := ibTempServicos;
       qrdbServicoAvulso.DataField   := ibTempServicos.FieldByName('SERVICOAVULSO').FieldName;


       qrdbVlrUnit.DataSet       := ibTempServicos;
       qrdbVlrUnit.DataField     := ibTempServicos.FieldByName('VLRA').FieldName;
       (ibTempServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       qrdbTotal.DataSet       := ibTempServicos;
       qrdbTotal.DataField     := ibTempServicos.FieldByName('VLRTOTAL').FieldName;
       (ibTempServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

         qrl_DataInicial.Caption := DateToStr(dtpDataIni.Date);
         qrl_DataF.Caption  := DateToStr(dtpDataF.Date);

         qrl_Situacao.Caption := 'Em Aberto';

        if cboFuncionario.Text <> '' Then begin

          qrl_Funcionario.Caption := cboFuncionario.Text;

        end else begin

          qrl_Funcionario.Caption := '';

        end;

       qrpOS.Preview;

     end;

    EXCEPT
      on E : Exception do begin
         frmRelatOS.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;

    end;//if cbo func <> ''
////////////////////////////////////////////////////////////////////////////////

    if (ckBaixado.Checked)and(cboFuncionario.Text = '') Then begin

      Commit(ibTempServicos);
      ibTempServicos.Close;
      ibTempServicos.SQL.Clear;
      ibTempServicos.SQL.Add('SELECT TBLSERVICOS.*,TBLCADASTRO.NOME As Cliente,'
      + 'TBLCADASTRO.TELEFONE As FoneCli, TBLCADASTRO.CELULAR As CelularCli,TBLUSER.NOME As NomeFunc,'
      + 'TBLCONTROLESERVICOS.DATA  As DataServico,TBLCONTROLESERVICOS.OBS As Observacao FROM TBLSERVICOS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOS.IDFUNC=TBLUSER.IDUSER '
      + 'LEFT OUTER JOIN TBLCONTROLESERVICOS ON TBLSERVICOS.IDNUMEROSERVICO=TBLCONTROLESERVICOS.CODIGOSERVICO WHERE(TBLSERVICOS.DATA between :ParamDataIni and :ParamDataF)and(TBLSERVICOS.SITUACAO=''Baixado'')ORDER BY TBLSERVICOS.IDNUMEROSERVICO ASC');
      ibTempServicos.Open;

      ibTempServicos.Close;
      ibTempServicos.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibTempServicos.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibTempServicos.Open;

      Application.CreateForm(TfrmRelatOS, frmRelatOS);

    TRY

     with frmRelatOS do begin

       frmRelatOS.qrpOS.DataSet := ibTempServicos;


      //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT

       qrdbNServico.DataSet     := ibTempServicos;
       qrdbNServico.DataField   := ibTempServicos.FieldByName('IDNUMEROSERVICO').FieldName;

       qrdbServico.DataSet     := ibTempServicos;
       qrdbServico.DataField   := ibTempServicos.FieldByName('NOMESERVICO').FieldName;

       qrdbServicoAvulso.DataSet     := ibTempServicos;
       qrdbServicoAvulso.DataField   := ibTempServicos.FieldByName('SERVICOAVULSO').FieldName;


       qrdbVlrUnit.DataSet       := ibTempServicos;
       qrdbVlrUnit.DataField     := ibTempServicos.FieldByName('VLRA').FieldName;
       (ibTempServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       qrdbTotal.DataSet       := ibTempServicos;
       qrdbTotal.DataField     := ibTempServicos.FieldByName('VLRTOTAL').FieldName;
       (ibTempServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

         qrl_DataInicial.Caption := DateToStr(dtpDataIni.Date);
         qrl_DataF.Caption  := DateToStr(dtpDataF.Date);

         qrl_Situacao.Caption := 'Baixado';

        if cboFuncionario.Text <> '' Then begin

          qrl_Funcionario.Caption := cboFuncionario.Text;

        end else begin

          qrl_Funcionario.Caption := '';

        end;

       qrpOS.Preview;

     end;

    EXCEPT
      on E : Exception do begin
         frmRelatOS.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;

    end;//if cbo func <> ''
////////////////////////////////////////////////////////////////////////////////

  end;//with

end;

procedure TfrmOSPeriodo.ckAbertoCheck(Sender: TObject);
begin

  if ckAberto.Checked Then begin

    ckBaixado.Checked := False;

  end;

end;

procedure TfrmOSPeriodo.ckBaixadoCheck(Sender: TObject);
begin

  if ckBaixado.Checked Then begin

    ckAberto.Checked := False;

  end;

end;

end.
