unit untRelCRCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, classComboBox, IBQuery,
  ComCtrls;

type
  TfrmRelCRCartao = class(TForm)
    lbl_Cartao: TLabel;
    lbl_De: TLabel;
    lbl_Ate: TLabel;
    cboCartao: TComboBox;
    dtpDataIni: TDateTimePicker;
    dtpDataF: TDateTimePicker;
    ckGeral: TCheckBox;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTOperadora;
    procedure FormShow(Sender: TObject);
    procedure ibeaRelatorioClick(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure BmsXPButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCRCartao: TfrmRelCRCartao;
  IDTipoPagto : TClasseCombo;

implementation

uses untdmModule, untRelContasaReceber, funcPosto, DB;

{$R *.dfm}

procedure TfrmRelCRCartao.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmRelCRCartao.ExecSELECTOperadora;

begin

  with dmModule do begin

    ibTipoPagtoF.Close;
    ibTipoPagtoF.SQL.Clear;
    ibTipoPagtoF.SQL.Add('SELECT * FROM TBLTIPOPAGTOAVULSO WHERE OPERADORA=''VISA'' OR OPERADORA=''MASTERCARD''');
    ibTipoPagtoF.Open;

    cboCartao.Clear;

    while not ibTipoPagtoF.Eof do begin

      IDTipoPagto    := TClasseCombo.Create;
      IDTipoPagto.ID := ibTipoPagtoF.FieldByName('IDTIPO').AsInteger;
      cboCartao.Items.AddObject(ibTipoPagtoF.FieldByName('DESCRICAO').AsString,IDTipoPagto);
      ibTipoPagtoF.Next;

    end;{while}  

  end;{with}

end;


procedure TfrmRelCRCartao.FormShow(Sender: TObject);
begin

  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataF.DateTime   := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin

    ExecSELECTOperadora;

  end;//with

end;

procedure TfrmRelCRCartao.ibeaRelatorioClick(Sender: TObject);

var

IDClassTelcom, Aviso : Integer;
IDOperadora : TClasseCombo;

begin

  with dmModule do begin


    if ckGeral.Checked Then begin

        //LOCALIZA O TELEFONE COMERCIAl
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
        ibClassificacao.Open;
        IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

        Commit(ibAReceber);
        ibAReceber.Close;                         //
        ibAReceber.SQL.Clear;
        ibAReceber.SQL.Add('SELECT TBLCONTASARECEBER.*,TBLCADASTRO.NOME,'
        + ' TBLCONTATO.CONTATO As Fone,TBLCONTATO.TIPO,TBLTIPODOCUMENTO.TIPO As TipoDoc,'
        + ' TBLTIPOPAGTOAVULSO.DESCRICAO As NomePagto,TBLTIPOPAGTOAVULSO.TIPOPAGTO As Cartao FROM TBLCONTASARECEBER '
        + ' LEFT OUTER JOIN TBLCONTATO ON TBLCONTASARECEBER.IDCLI=TBLCONTATO.IDCAD '
        + ' LEFT OUTER JOIN TBLTIPODOCUMENTO ON TBLCONTASARECEBER.IDTIPODOC=TBLTIPODOCUMENTO.IDTIPODOC '
        + ' LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASARECEBER.IDCLI=TBLCADASTRO.IDCAD '
        + ' LEFT OUTER JOIN TBLTIPOPAGTOAVULSO ON TBLCONTASARECEBER.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
        + ' WHERE TBLTIPOPAGTOAVULSO.TIPOPAGTO=''CARTAO'' and (TBLCONTASARECEBER.VCTO between :ParamDataInicial and :ParamDataF) and (TBLCONTATO.TIPO=''' + IntToStr(IDClassTelcom) + '''or TBLCONTATO.TIPO is null)');
        ibAReceber.Open;

        ibAReceber.Close;
        ibAReceber.ParamByName('ParamDataInicial').Value  := dtpDataIni.DateTime;
        ibAReceber.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
        ibAReceber.Open;

        // and (TBLCONTATO.TIPO=''' + IntToStr(IDClassTelcom) + '''or TBLCONTATO.TIPO is null)  and TBLCONTASARECEBER.IDCLI>0 or TBLCONTASARECEBER.IDCLI=0
        Application.CreateForm(TfrmRelContasaReceber, frmRelContasaReceber);

        TRY

          with frmRelContasaReceber do begin

            frmRelContasaReceber.qrpContasaReceber.DataSet := ibAReceber;

            //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
            qrdbNumCheque.DataSet     := ibAReceber;
            qrdbNumCheque.DataField   := ibAReceber.FieldByName('NUMCHEQUE').FieldName;

            qrdbDescricao.DataSet     := ibAReceber;
            qrdbDescricao.DataField   := ibAReceber.FieldByName('NOME').FieldName;

        //   qrdbTel.DataSet     := ibAReceber;
        //   qrdbTel.DataField   := ibAReceber.FieldByName('Fone').FieldName;

           qrdbTipoPagto.DataSet     := ibAReceber;
           qrdbTipoPagto.DataField   := ibAReceber.FieldByName('NomePagto').FieldName;


            qrdbTipoDoc.DataSet       := ibAReceber;
            qrdbTipoDoc.DataField     := ibAReceber.FieldByName('TipoDoc').FieldName;

            qrdbVcto.DataSet          := ibAReceber;
            qrdbVcto.DataField        := ibAReceber.FieldByName('VCTO').FieldName;

        //    qrdbNBoleto.DataSet       := ibAReceber;
        //    qrdbNBoleto.DataField     := ibAReceber.FieldByName('NUMBOLETO').FieldName;

            qrdbValor.DataSet         := ibAReceber;
            qrdbValor.DataField       := ibAReceber.FieldByName('VLREMITIDO').FieldName;
            (ibAReceber.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO

            qrpContasaReceber.Preview;

          end; {if}


        EXCEPT
          on E : Exception do begin
             frmRelContasaReceber.Release;
             MessageDlg('Ocorreu um erro ao tentar mostrar o Formul�rio: ' + E.Message,mtError,[mbOk],0);
          end;
        END;



    end else begin

      if cboCartao.ItemIndex <> -1 Then begin

        IDOperadora := TClasseCombo(cboCartao.Items.Objects[cboCartao.ItemIndex]);

        //LOCALIZA O TELEFONE COMERCIAl
        ibClassificacao.Close;
        ibClassificacao.SQL.Clear;
        ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
        ibClassificacao.Open;
        IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

        Commit(ibAReceber);
        ibAReceber.Close;                         //
        ibAReceber.SQL.Clear;
        ibAReceber.SQL.Add('SELECT TBLCONTASARECEBER.*,TBLCADASTRO.NOME,'
        + ' TBLCONTATO.CONTATO As Fone,TBLCONTATO.TIPO,TBLTIPODOCUMENTO.TIPO As TipoDoc,'
        + ' TBLTIPOPAGTOAVULSO.DESCRICAO As NomePagto FROM TBLCONTASARECEBER '
        + ' LEFT OUTER JOIN TBLCONTATO ON TBLCONTASARECEBER.IDCLI=TBLCONTATO.IDCAD '
        + ' LEFT OUTER JOIN TBLTIPODOCUMENTO ON TBLCONTASARECEBER.IDTIPODOC=TBLTIPODOCUMENTO.IDTIPODOC '
        + ' LEFT OUTER JOIN TBLCADASTRO ON TBLCONTASARECEBER.IDCLI=TBLCADASTRO.IDCAD '
        + ' LEFT OUTER JOIN TBLTIPOPAGTOAVULSO ON TBLCONTASARECEBER.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
        + ' WHERE (TBLCONTASARECEBER.VCTO between :ParamDataInicial and :ParamDataF)and TBLCONTASARECEBER.IDTIPOPAGTO=''' + IntToStr(IDOperadora.ID) + '''and (TBLCONTATO.TIPO=''' + IntToStr(IDClassTelcom) + '''or TBLCONTATO.TIPO is null)');
        ibAReceber.Open;

        ibAReceber.Close;
        ibAReceber.ParamByName('ParamDataInicial').Value  := dtpDataIni.DateTime;
        ibAReceber.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
        ibAReceber.Open;

        // and (TBLCONTATO.TIPO=''' + IntToStr(IDClassTelcom) + '''or TBLCONTATO.TIPO is null)  and TBLCONTASARECEBER.IDCLI>0 or TBLCONTASARECEBER.IDCLI=0
        Application.CreateForm(TfrmRelContasaReceber, frmRelContasaReceber);

        TRY

          with frmRelContasaReceber do begin

            frmRelContasaReceber.qrpContasaReceber.DataSet := ibAReceber;

            //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
            qrdbNumCheque.DataSet     := ibAReceber;
            qrdbNumCheque.DataField   := ibAReceber.FieldByName('NUMCHEQUE').FieldName;

            qrdbDescricao.DataSet     := ibAReceber;
            qrdbDescricao.DataField   := ibAReceber.FieldByName('NOME').FieldName;

         //  qrdbTel.DataSet     := ibAReceber;
        //   qrdbTel.DataField   := ibAReceber.FieldByName('Fone').FieldName;

           qrdbTipoPagto.DataSet     := ibAReceber;
           qrdbTipoPagto.DataField   := ibAReceber.FieldByName('NomePagto').FieldName;


            qrdbTipoDoc.DataSet       := ibAReceber;
            qrdbTipoDoc.DataField     := ibAReceber.FieldByName('TipoDoc').FieldName;

            qrdbVcto.DataSet          := ibAReceber;
            qrdbVcto.DataField        := ibAReceber.FieldByName('VCTO').FieldName;

        //    qrdbNBoleto.DataSet       := ibAReceber;
        //    qrdbNBoleto.DataField     := ibAReceber.FieldByName('NUMBOLETO').FieldName;

            qrdbValor.DataSet         := ibAReceber;
            qrdbValor.DataField       := ibAReceber.FieldByName('VLREMITIDO').FieldName;
            (ibAReceber.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO

            qrpContasaReceber.Preview;

          end; {if}


        EXCEPT
          on E : Exception do begin
             frmRelContasaReceber.Release;
             MessageDlg('Ocorreu um erro ao tentar mostrar o Formul�rio: ' + E.Message,mtError,[mbOk],0);
          end;
        END;

      end else begin

        Aviso := Application.MessageBox('� necess�rio Selecionar um tipo de cart�o','Cart�o n�o selecionado',+ MB_OK+MB_DEFBUTTON1+MB_ICONINFORMATION);

      end;//if cbocartao

    end;//if ckgeral

    //////////////////////////////////////////////////////////////

  end;{with}

end;

procedure TfrmRelCRCartao.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRelCRCartao.BmsXPButton1Click(Sender: TObject);

var

ConfirmaExclusao : Integer;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Aten��o este procedimento exclui todos os cart�es do per�odo determinado, deseja continuar??','Exclus�o dos registros de cart�es',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

    ibAReceber.Close;
    ibAReceber.SQL.Clear;
    ibAReceber.SQL.Add('DELETE FROM TBLCONTASARECEBER WHERE (TBLCONTASARECEBER.VCTO between :ParamDataInicial and :ParamDataF) and CARTAO=''CARTAO''');
    ibAReceber.ExecSQL;

    ibAReceber.Close;
    ibAReceber.ParamByName('ParamDataInicial').Value  := dtpDataIni.DateTime;
    ibAReceber.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
    ibAReceber.Open;


    end;//if

  end;//with

end;

end.
