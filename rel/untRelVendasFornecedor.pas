unit untRelVendasFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IBQuery,
  classComboBox, Buttons;

type
  TfrmVendasFornecedor = class(TForm)
    Label1: TLabel;
    lbl_DTIni: TLabel;
    lbl_DTF: TLabel;
    dtpDataIni: TDateTimePicker;
    dtpDataF: TDateTimePicker;
    cboFornecedores: TComboBox;
    ibeaVisualizar: TSpeedButton;
    ibeaSair: TSpeedButton;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTFornecedor;
    procedure FormShow(Sender: TObject);
    procedure ibeaVisualizarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendasFornecedor: TfrmVendasFornecedor;

implementation

uses untdmModule, untRelFluxoCx, funcPosto, DB;

{$R *.dfm}

procedure TfrmVendasFornecedor.ibeaSairClick(Sender: TObject);
begin
Close;

end;

procedure TfrmVendasFornecedor.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmVendasFornecedor.ExecSELECTFornecedor;

var

IDClassForn : Integer;
ClassForn : TClasseCombo;

begin
  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClassForn := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClassForn) + '''ORDER BY NOME');//('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboFornecedores.Clear; //LIMPA O COMBOBOX
    while not ibCadastro.Eof do begin
      ClassForn    := TClasseCombo.Create;
      ClassForn.ID  := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboFornecedores.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,ClassForn);
      ibCadastro.Next;
    end;
  end;
end;

procedure TfrmVendasFornecedor.FormShow(Sender: TObject);
begin

  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataF.DateTime    := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  cboFornecedores.ClearSelection;
  
  with dmModule do begin

    ExecSELECTFornecedor;

  end;//with

end;

procedure TfrmVendasFornecedor.ibeaVisualizarClick(Sender: TObject);

var
IDFornecedor : TClasseCombo;
begin

  with dmModule do begin

    if cboFornecedores.ItemIndex <> -1 Then begin

    IDFornecedor := TClasseCombo(cboFornecedores.Items.Objects[cboFornecedores.ItemIndex]);

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,TBLSERVICOSVENDAS.POSVENDA,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.VLRTROCA,'
      + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLTIPOCOMPROMISSO.NOME As Compromisso,'
      + 'CADPRODUTOS.NOME As Produto,CADPRODUTOS.FORNECEDOR As NomeFornecedor FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA=''Pago'')and CADPRODUTOS.FORNECEDOR=''' + IntToStr(IDFornecedor.ID) + '''');
      ibServsVenda.Open;

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataF.DateTime;
      ibServsVenda.Open;


   //   (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     Application.CreateForm(TfrmRelFluxoCx, frmRelFluxoCx);

      TRY

        with frmRelFluxoCx do begin

          frmRelFluxoCx.qrpFluxoCx.DataSet := ibServsVenda;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbProd.DataSet    := ibServsVenda;
          qrdbProd.DataField  := ibServsVenda.FieldByName('Produto').FieldName;

          qrdbVlrUnit.DataSet     := ibServsVenda;
          qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
         (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbQtde.DataSet        := ibServsVenda;
          qrdbQtde.DataField      := ibServsVenda.FieldByName('QTDE').FieldName;
          (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbVlrA.DataSet       := ibServsVenda;
          qrdbVlrA.DataField     := ibServsVenda.FieldByName('VLRTOTAL').FieldName;
          (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet    := ibServsVenda;
          qrdbData.DataField  := ibServsVenda.FieldByName('DATA').FieldName;

          qrdbVlrB.DataSet    := ibServsVenda;
          qrdbVlrB.DataField  := ibServsVenda.FieldByName('VALORB').FieldName;
          (ibServsVenda.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbVlrC.DataSet    := ibServsVenda;
          qrdbVlrC.DataField  := ibServsVenda.FieldByName('VALORC').FieldName;
          (ibServsVenda.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

        //  qrdbVlrD.DataSet    := ibServsVenda;
        //  qrdbVlrD.DataField  := ibServsVenda.FieldByName('VALORD').FieldName;
         // (ibServsVenda.FieldByName('VALORD') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


          qrdbDesc.DataSet    := ibServsVenda;
          qrdbDesc.DataField  := ibServsVenda.FieldByName('DESCONTO').FieldName;
          (ibServsVenda.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

         // qrdbAcrescimo.DataSet    := ibServsVenda;
       //   qrdbAcrescimo.DataField  := ibServsVenda.FieldByName('ACRESCIMO').FieldName;
        //  (ibServsVenda.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrlFuncionarioComissao.Caption := '';

          qrl_DataIni.Caption := DateToStr(dtpDataIni.Date);
          qrl_DataF.Caption  := DateToStr(dtpDataF.Date);

          qrpFluxoCx.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelFluxoCx.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
      //////////////////////////////////////////////////////////////

    end;//if cbofornecedores

  end;//with

end;

end.
