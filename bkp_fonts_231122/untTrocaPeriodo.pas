unit untTrocaPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,IBQuery, classComboBox, Buttons;

type
  Tfrm_TrocaP = class(TForm)
    dtpDataIniGeral: TDateTimePicker;
    dtpDataFimGeral: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cboFunc: TComboBox;
    lbl_Vendedor: TLabel;
    ibeaVisualizar: TSpeedButton;
    ibeasair: TSpeedButton;
    procedure ibeasairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTFuncionario;
    procedure FormShow(Sender: TObject);
    procedure ibeaVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_TrocaP: Tfrm_TrocaP;

implementation

uses untdmModule, untRelFluxoTroca, funcPosto, DB;

{$R *.dfm}

procedure Tfrm_TrocaP.ibeasairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_TrocaP.Commit(IBQueryExec : TIBQuery);

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

procedure Tfrm_TrocaP.ExecSELECTFuncionario;

var
IDFuncionario      : TClasseCombo;
begin

  with dmModule do begin

    ibUser.Close;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE TIPOUSUARIO=''Vendedor''');
    ibUser.Open;

    cboFunc.Clear;

    while not ibUser.Eof do begin

      IDFuncionario      := TClasseCombo.Create;
      IDFuncionario.ID   := ibUser.FieldByName('IDUSER').AsInteger;
      cboFunc.Items.AddObject(ibUser.FieldByName('NOME').AsString,IDFuncionario);
      ibUser.Next;

    end;//WHILE

  end;//with

end;

procedure Tfrm_TrocaP.FormShow(Sender: TObject);
begin

  dtpDataIniGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFimGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  cboFunc.ClearSelection;
  
  with dmModule do begin

    ExecSELECTFuncionario;

  end;//with

end;

procedure Tfrm_TrocaP.ibeaVisualizarClick(Sender: TObject);

var
ClassVendedor : TClasseCombo;
begin

  with dmModule do begin

    if cboFunc.ItemIndex <> -1 Then begin

    ClassVendedor := TClasseCombo(cboFunc.Items.Objects[cboFunc.ItemIndex]);

      Commit(ibRecVendas);
      ibRecVendas.Close;                                                                                           //  and SITUACAOVENDA<> ''Pendente''
      ibRecVendas.SQL.Clear;
      ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.*,CADPRODUTOS.NOME As Produto,'
      + 'TBLUSER.NOME As Vendedor FROM TBLRECEBEVENDAS '
      + 'INNER JOIN CADPRODUTOS ON TBLRECEBEVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'INNER JOIN TBLUSER ON TBLRECEBEVENDAS.IDVENDEDOR=TBLUSER.IDUSER WHERE (DATA between :ParamDataInicial and :ParamDataFinal)and TROCAMERCADORIA=''Sim'' and TBLRECEBEVENDAS.IDVENDEDOR=''' + IntToStr(ClassVendedor.ID) + '''');
      ibRecVendas.Open;

      (ibRecVendas.FieldByName('VLRTROCA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      ibRecVendas.Close;
      ibRecVendas.ParamByName('ParamDataInicial').Value      := dtpDataIniGeral.DateTime;
      ibRecVendas.ParamByName('ParamDataFinal').Value        := dtpDataFimGeral.DateTime;
      ibRecVendas.Open;

     Application.CreateForm(TfrmRelatFluxoTroca, frmRelatFluxoTroca);

      TRY

        with frmRelatFluxoTroca do begin

          frmRelatFluxoTroca.qrpFluxoTroca.DataSet := ibRecVendas;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbProd.DataSet    := ibRecVendas;
          qrdbProd.DataField  := ibRecVendas.FieldByName('Produto').FieldName;

          qrdbVlrTroca.DataSet       := ibRecVendas;
          qrdbVlrTroca.DataField     := ibRecVendas.FieldByName('VLRTROCA').FieldName;
          (ibRecVendas.FieldByName('VLRTROCA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet    := ibRecVendas;
          qrdbData.DataField  := ibRecVendas.FieldByName('DATA').FieldName;

          qrdbObs.DataSet    := ibRecVendas;
          qrdbObs.DataField  := ibRecVendas.FieldByName('OBSTROCA').FieldName;

          qrdbVendedor.DataSet    := ibRecVendas;
          qrdbVendedor.DataField  := ibRecVendas.FieldByName('Vendedor').FieldName;


          qrl_DataIni.Caption := DateToStr(dtpDataIniGeral.Date);
          qrl_DataF.Caption  := DateToStr(dtpDataFimGeral.Date);

          qrpFluxoTroca.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelatFluxoTroca.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

    end;

    if cboFunc.Text = '' Then begin

      Commit(ibRecVendas);
      ibRecVendas.Close;                                                                                           //  and SITUACAOVENDA<> ''Pendente''
      ibRecVendas.SQL.Clear;
      ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.*,CADPRODUTOS.NOME As Produto,'
      + 'TBLUSER.NOME As Vendedor FROM TBLRECEBEVENDAS '
      + 'INNER JOIN CADPRODUTOS ON TBLRECEBEVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'INNER JOIN TBLUSER ON TBLRECEBEVENDAS.IDVENDEDOR=TBLUSER.IDUSER WHERE (DATA between :ParamDataInicial and :ParamDataFinal)and TROCAMERCADORIA=''Sim''');
      ibRecVendas.Open;

      (ibRecVendas.FieldByName('VLRTROCA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      ibRecVendas.Close;
      ibRecVendas.ParamByName('ParamDataInicial').Value      := dtpDataIniGeral.DateTime;
      ibRecVendas.ParamByName('ParamDataFinal').Value        := dtpDataFimGeral.DateTime;
      ibRecVendas.Open;

     Application.CreateForm(TfrmRelatFluxoTroca, frmRelatFluxoTroca);

      TRY

        with frmRelatFluxoTroca do begin

          frmRelatFluxoTroca.qrpFluxoTroca.DataSet := ibRecVendas;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbProd.DataSet    := ibRecVendas;
          qrdbProd.DataField  := ibRecVendas.FieldByName('Produto').FieldName;

          qrdbVlrTroca.DataSet       := ibRecVendas;
          qrdbVlrTroca.DataField     := ibRecVendas.FieldByName('VLRTROCA').FieldName;
          (ibRecVendas.FieldByName('VLRTROCA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet    := ibRecVendas;
          qrdbData.DataField  := ibRecVendas.FieldByName('DATA').FieldName;

          qrdbObs.DataSet    := ibRecVendas;
          qrdbObs.DataField  := ibRecVendas.FieldByName('OBSTROCA').FieldName;

          qrdbVendedor.DataSet    := ibRecVendas;
          qrdbVendedor.DataField  := ibRecVendas.FieldByName('Vendedor').FieldName;


          qrl_DataIni.Caption := DateToStr(dtpDataIniGeral.Date);
          qrl_DataF.Caption  := DateToStr(dtpDataFimGeral.Date);

          qrpFluxoTroca.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelatFluxoTroca.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////


    end;//if cbo func

  end;//with

end;

end.
