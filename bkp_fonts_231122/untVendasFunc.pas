unit untVendasFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, classComboBox,
  IBQuery, Buttons;

type
  TfrmVendasFunc = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lbl_Func: TLabel;
    cboFuncionario: TComboBox;
    dtpDataIniGeral: TDateTimePicker;
    dtpDataFimGeral: TDateTimePicker;
    ibeaVisualizar: TSpeedButton;
    ibeaSair: TSpeedButton;
    procedure ibeaSairClick(Sender: TObject);
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
  frmVendasFunc     : TfrmVendasFunc;
  ClassFuncionario  : TClasseCombo;

implementation

uses untdmModule, untRelFluxoCx, funcPosto, DB;

{$R *.dfm}

procedure TfrmVendasFunc.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmVendasFunc.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmVendasFunc.ExecSELECTFuncionario;

begin

  with dmModule do begin

    //BUSCA TODOS OS FUNCIONARIOS QUE ESTEJAM NA CLASSIFICAÇÃO DE FUNCIONARIOS
    Commit(ibUser);
    ibUser.Open;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE(TIPOUSUARIO=''Vendedor'')or(TIPOUSUARIO=''Funcionario'')');// WHERE IDCLASS=''' + InttoStr(IDClassfunc) + ''' ORDER BY NOME');
    ibUser.Open;

    //traz dados do funcionario no combo
    cboFuncionario.Clear; //LIMPA O COMBOBOX
    while not ibUser.Eof do begin

      ClassFuncionario     := TClasseCombo.Create;//ATRIBUI A CLASSE CRIADA NA VARIAVEL
      ClassFuncionario.ID  := ibUser.FieldByName('IDUSER').AsInteger;//ATRIBUI A IDENTIFICACAO DO FUNCIONARIO ATRAVES DO ID NA VARIAVEL.
      cboFuncionario.Items.AddObject(ibUser.FieldByName('NOME').AsString,ClassFuncionario);//TRAZ OS ITENS ADICIONADOS AO OBJETO SELECIONADO NO COMBO E A DESCRICAO DO FUNCIONARIO.
      ibUser.Next;

    end;{while}

  end;{with}

end;


procedure TfrmVendasFunc.FormShow(Sender: TObject);
begin

dtpDataIniGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
dtpDataFimGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin

    ExecSELECTFuncionario;

  end;//with

end;

procedure TfrmVendasFunc.ibeaVisualizarClick(Sender: TObject);

var

IDClassFuncComissao : TClasseCombo;
ValorC,QtdeProd,VlrProd,TotalComissao : Real;
StrValorC,strQtdeProd,StrVlrProd,strTotalComissao : String;
IDProdC : Integer;
begin

  with dmModule do begin

    if cboFuncionario.ItemIndex <> - 1 Then begin

      IDClassFuncComissao := TClasseCombo(cboFuncionario.Items.Objects[cboFuncionario.ItemIndex]);

   //   Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,'
      + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.VLRSANGRIA,'
      + 'TBLSERVICOSVENDAS.IDFUNCCOMISSAO,CADPRODUTOS.NOME As Produto,CADPRODUTOS.COMISSAOPROD,CADPRODUTOS.COMISSAOPRECOC,CADPRODUTOS.VALORVENDAC FROM TBLSERVICOSVENDAS '
      + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE TBLSERVICOSVENDAS.IDFUNC=''' + IntToStr(IDClassFuncComissao.ID) + ''' and(DATA between :ParamDataInicial and :ParamDataFinal)');
      ibServsVenda.Open;

      //(ibServsVenda.FieldByName('COMISSAOPROD') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibServsVenda.Open;


          while not ibServsVenda.Eof do begin

             { IDProdC := ibServsVenda.FieldByName('IDPROD').AsInteger;
              
              ibServsVenda.Close;
              ibServsVenda.SQL.Clear;
              ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
              + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
              + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,'
              + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.VLRSANGRIA,'
              + 'TBLSERVICOSVENDAS.IDFUNCCOMISSAO,CADPRODUTOS.NOME As Produto,CADPRODUTOS.COMISSAOPROD FROM TBLSERVICOSVENDAS '
              + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
              + 'WHERE(TBLSERVICOSVENDAS.IDPROD=''' + IntToStr(IDProdC) + ''')and TBLSERVICOSVENDAS.IDFUNC=''' + IntToStr(IDClassFuncComissao.ID) + ''' and(DATA between :ParamDataInicial and :ParamDataFinal)');
              ibServsVenda.Open;

              ibServsVenda.Close;
              ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
              ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
              ibServsVenda.Open;
              }

              //(ibServsVenda.FieldByName('COMISSAOPROD') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

              if ibServsVenda.FieldByName('VALORVENDAC').AsFloat > 0 Then begin



              ValorC   := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('COMISSAOPRECOC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
              //QtdeProd := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('QTDE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
              VlrProd  := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              TotalComissao := ValorC * VlrProd/100; //QtdeProd * VlrProd / ValorC;

              end;

            ibServsVenda.Next;  
                                 
          end;//while



   //   (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     Application.CreateForm(TfrmRelFluxoCx, frmRelFluxoCx);

      TRY

        with frmRelFluxoCx do begin

          frmRelFluxoCx.qrpFluxoCx.DataSet := ibServsVenda;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbNCupom.DataSet    := ibServsVenda;
          qrdbNCupom.DataField  := ibServsVenda.FieldByName('IDSERVSVENDA').FieldName;

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

          qrdbDesc.DataSet    := ibServsVenda;
          qrdbDesc.DataField  := ibServsVenda.FieldByName('DESCONTO').FieldName;
          (ibServsVenda.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbComissao.DataSet     := ibServsVenda;
          qrdbComissao.DataField  := ibServsVenda.FieldByName('COMISSAOPROD').FieldName;
          (ibServsVenda.FieldByName('COMISSAOPROD') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbComissaoC.DataSet     := ibServsVenda;
          qrdbComissaoC.DataField  := ibServsVenda.FieldByName('COMISSAOPRECOC').FieldName;
          (ibServsVenda.FieldByName('COMISSAOPRECOC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrlFuncionarioComissao.Caption :='Funcionário: '+ cboFuncionario.Text;
          qrl_DataIni.Caption := DateToStr(dtpDataIniGeral.Date);
          qrl_DataF.Caption := DateToStr(dtpDataFimGeral.Date);
         // QRChart1.da

        //  qrl_ComissaoC.Caption := FloatToStr(TotalComissao);

          qrpFluxoCx.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelFluxoCx.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

    end;//if cbocombofuncionario

  end;//with

end;

end.
