unit untProdutoVendidoP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, classComboBox,
  IBQuery, Buttons;

type
  TfrmProdutosVendidos = class(TForm)
    Label3: TLabel;
    dtpDataIniGeral: TDateTimePicker;
    dtpDataFimGeral: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    lbl_edtCodBarra: TLabeledEdit;
    lbl_edtNome: TLabeledEdit;
    lbl_edtNomeOrdem: TLabeledEdit;
    cboFornecedores: TComboBox;
    lbl_Forn: TLabel;
    ibeaOk: TSpeedButton;
    ibeaLimpar: TSpeedButton;
    ibeaSair: TSpeedButton;
    ckPorQtde: TCheckBox;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTFornecedor;
    procedure ibeaOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure ibeaLimparClick(Sender: TObject);
    procedure lbl_edtCodBarraChange(Sender: TObject);
    procedure lbl_edtNomeExit(Sender: TObject);
    procedure lbl_edtCodBarraKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutosVendidos: TfrmProdutosVendidos;

implementation

uses untdmModule, untRelQtdeVendida, funcPosto, untRProdutos;

{$R *.dfm}

procedure TfrmProdutosVendidos.Commit(IBQueryExec : TIBQuery);

begin

  with dmModule do begin

    with IBQueryExec do begin

      SQL.Clear;
      SQL.Add('Commit');
      Open;
      Close;

    end;//with ibqueryExec

  end;//with

end;

procedure TfrmProdutosVendidos.ExecSELECTFornecedor;

var
IDClassFornecedor : Integer;
ClassForn : TClasseCombo;

begin
  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClassFornecedor := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=' + IntToStr(IDClassFornecedor));//('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
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


procedure TfrmProdutosVendidos.ibeaOkClick(Sender: TObject);

var

Qtde : Real;
TotalQtde : String;
DataVenda : TDate;
Data : String;
ClassFornecedor : TClasseCombo;

begin


  with dmModule do begin

    if (ckPorQtde.Checked = False)Then begin

      if  (lbl_edtNomeOrdem.Text <> '') and (lbl_edtNome.Text = '')and(cboFornecedores.Text = '') Then begin

          Commit(ibServsVenda);
          ibServsVenda.Close;                                                              //    ,VLRTOTAL   , SUM(QTDE)As QtdeProd                                              //
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT DISTINCT TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA As DataVenda,'
          + 'SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd,SUM(TBLSERVICOSVENDAS.VLRTOTAL) As TotalVenda,'
          + 'CADPRODUTOS.NOME As NomeProduto,TBLENTRADAESTOQUEPROD.QUANTIDADE FROM TBLSERVICOSVENDAS '
          + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
          + 'INNER JOIN TBLENTRADAESTOQUEPROD ON TBLSERVICOSVENDAS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and CADPRODUTOS.NOME LIKE '+''''+'%'+lbl_edtNomeOrdem.text+'%'+''' GROUP BY TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.VLRUNIT,CADPRODUTOS.NOME,TBLENTRADAESTOQUEPROD.QUANTIDADE ORDER BY CADPRODUTOS.NOME');
          ibServsVenda.Open;

          ibServsVenda.Close;
          ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
          ibServsVenda.ParamByName('ParamDataFinal').Value   := dtpDataFimGeral.DateTime;
          ibServsVenda.Open;


            while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

              if (Qtde = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
               Qtde := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                //atribui na variavel substituindo o ponto para vlr em branco
                TotalQtde := StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                //atribui a variavel o valor separando por ponto
                Qtde := Qtde + StrtoFloat(StringReplace(TotalQtde,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end;{if}


              ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.

            end;{while}



         Application.CreateForm(TfrmRelQtdeVendida, frmRelQtdeVendida);

          TRY

            with frmRelQtdeVendida do begin

              frmRelQtdeVendida.qrpRelQtdeVendida.DataSet := ibServsVenda;


              //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
              qrdbProd.DataSet    := ibServsVenda;
              qrdbProd.DataField  := ibServsVenda.FieldByName('NomeProduto').FieldName;

              qrdbVlrUnit.DataSet     := ibServsVenda;
              qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
             (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtde.DataSet        := ibServsVenda;
            qrdbQtde.DataField      := ibServsVenda.FieldByName('QtdeProd').FieldName;
            (ibServsVenda.FieldByName('QtdeProd') as TFloatField).DisplayFormat := '0'; //CRIA UMA MASCARA PARA O CAMPO

            qrdbVlrA.DataSet       := ibServsVenda;
            qrdbVlrA.DataField     := ibServsVenda.FieldByName('TotalVenda').FieldName;
            (ibServsVenda.FieldByName('TotalVenda') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtdeEstoque.DataSet  := ibServsVenda;
            qrdbQtdeEstoque.DataField := ibServsVenda.FieldByName('QUANTIDADE').FieldName;

              while not ibServsVenda.Eof do begin

              qrdbData.DataSet    := ibServsVenda;
              qrdbData.DataField  := ibServsVenda.FieldByName('DataVenda').FieldName;
              ibServsVenda.Next;

              end;

              qrlDataIni.Caption := DateToStr(frmProdutosVendidos.dtpDataIniGeral.Date);
              qrlDataF.Caption   := DateToStr(frmProdutosVendidos.dtpDataFimGeral.Date);

              qrl_QtdeTotalItens.Caption := FormatFloat('0',Qtde);

              qrpRelQtdeVendida.Preview;

            end; {if}


          EXCEPT
            on E : Exception do begin
               frmRelQtdeVendida.Release;
               MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
            end;
          END;

      end;//if

    ////////////////////////////////////////////////////////////////////////////////

      if  (lbl_edtNome.Text <> '')and(cboFornecedores.Text = '') Then begin

          Commit(ibServsVenda);
          ibServsVenda.Close;                                                              //    ,VLRTOTAL   , SUM(QTDE)As QtdeProd                                              //
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT DISTINCT TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA As DataVenda,'
          + 'SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd,SUM(TBLSERVICOSVENDAS.VLRTOTAL) As TotalVenda,'
          + 'CADPRODUTOS.NOME As NomeProduto,TBLENTRADAESTOQUEPROD.QUANTIDADE FROM TBLSERVICOSVENDAS '
          + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
          + 'INNER JOIN TBLENTRADAESTOQUEPROD ON TBLSERVICOSVENDAS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and CADPRODUTOS.NOME=''' + lbl_edtNome.Text + ''' GROUP BY TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.VLRUNIT,CADPRODUTOS.NOME,TBLENTRADAESTOQUEPROD.QUANTIDADE ORDER BY CADPRODUTOS.NOME');
          ibServsVenda.Open;

          ibServsVenda.Close;
          ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
          ibServsVenda.ParamByName('ParamDataFinal').Value   := dtpDataFimGeral.DateTime;
          ibServsVenda.Open;


       while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

              if (Qtde = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
               Qtde := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                //atribui na variavel substituindo o ponto para vlr em branco
                TotalQtde := StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                //atribui a variavel o valor separando por ponto
                Qtde := Qtde + StrtoFloat(StringReplace(TotalQtde,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end;{if}


              ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.

            end;{while}



         Application.CreateForm(TfrmRelQtdeVendida, frmRelQtdeVendida);

          TRY

            with frmRelQtdeVendida do begin

              frmRelQtdeVendida.qrpRelQtdeVendida.DataSet := ibServsVenda;


              //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
              qrdbProd.DataSet    := ibServsVenda;
              qrdbProd.DataField  := ibServsVenda.FieldByName('NomeProduto').FieldName;

              qrdbVlrUnit.DataSet     := ibServsVenda;
              qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
             (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtde.DataSet        := ibServsVenda;
            qrdbQtde.DataField      := ibServsVenda.FieldByName('QtdeProd').FieldName;
            (ibServsVenda.FieldByName('QtdeProd') as TFloatField).DisplayFormat := '0'; //CRIA UMA MASCARA PARA O CAMPO

            qrdbVlrA.DataSet       := ibServsVenda;
            qrdbVlrA.DataField     := ibServsVenda.FieldByName('TotalVenda').FieldName;
            (ibServsVenda.FieldByName('TotalVenda') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtdeEstoque.DataSet  := ibServsVenda;
            qrdbQtdeEstoque.DataField := ibServsVenda.FieldByName('QUANTIDADE').FieldName;


              while not ibServsVenda.Eof do begin

              qrdbData.DataSet    := ibServsVenda;
              qrdbData.DataField  := ibServsVenda.FieldByName('DataVenda').FieldName;
              ibServsVenda.Next;

              end;


              qrlDataIni.Caption := DateToStr(frmProdutosVendidos.dtpDataIniGeral.Date);
              qrlDataF.Caption   := DateToStr(frmProdutosVendidos.dtpDataFimGeral.Date);

              qrl_QtdeTotalItens.Caption := FormatFloat('0',Qtde);

              qrpRelQtdeVendida.Preview;

            end; {if}


          EXCEPT
            on E : Exception do begin
               frmRelQtdeVendida.Release;
               MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
            end;
          END;

      end;//if

    /////////////////////////////////////////////////////////////////////////////////                                                                                                                                                              // WHERE (DATA between :ParamDataInicial and :ParamDataFinal)

       if (lbl_edtNome.Text = '') and (lbl_edtNomeOrdem.Text = '')and(cboFornecedores.Text = '') Then begin

          Commit(ibServsVenda);
          ibServsVenda.Close;                                                              //    ,VLRTOTAL   , SUM(QTDE)As QtdeProd                                              //
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT DISTINCT TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA As DataVenda,'
          + 'SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd,SUM(TBLSERVICOSVENDAS.VLRTOTAL) As TotalVenda,'
          + 'CADPRODUTOS.NOME As NomeProduto,TBLENTRADAESTOQUEPROD.QUANTIDADE FROM TBLSERVICOSVENDAS '
          + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
          + 'LEFT OUTER JOIN TBLENTRADAESTOQUEPROD ON TBLSERVICOSVENDAS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) GROUP BY TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.VLRUNIT,CADPRODUTOS.NOME,TBLENTRADAESTOQUEPROD.QUANTIDADE ORDER BY CADPRODUTOS.NOME');
          ibServsVenda.Open;


         { ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT DISTINCT TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.NOMEPROD,'
          +'TBLSERVICOSVENDAS.VLRUNIT,SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd,'
          +'SUM(TBLSERVICOSVENDAS.VLRTOTAL) As TotalVenda,TBLSERVICOSVENDAS.IDPROD,'
          +'CADPRODUTOS.NOME As NomeProduto from tblservicosvendas '
          +'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
          +'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)GROUP BY TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.IDPROD,CADPRODUTOS.NOME ORDER BY CADPRODUTOS.NOME');
          ibServsVenda.Open; }

         { ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd FROM TBLSERVICOSVENDAS '
          +'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)');//GROUP BY TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.IDPROD,CADPRODUTOS.NOME ORDER BY CADPRODUTOS.NOME');
          ibServsVenda.Open; }



          ibServsVenda.Close;
          ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
          ibServsVenda.ParamByName('ParamDataFinal').Value   := dtpDataFimGeral.DateTime;
          ibServsVenda.Open;

       while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

              if (Qtde = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
               Qtde := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                //atribui na variavel substituindo o ponto para vlr em branco
                TotalQtde := StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                //atribui a variavel o valor separando por ponto
                Qtde := Qtde + StrtoFloat(StringReplace(TotalQtde,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end;{if}


              ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.

            end;{while}


        // while not ibServsVenda.Eof do begin



        //  end;{while}





     //  end;//if fields

         Application.CreateForm(TfrmRelQtdeVendida, frmRelQtdeVendida);

          TRY

            with frmRelQtdeVendida do begin

              frmRelQtdeVendida.qrpRelQtdeVendida.DataSet := ibServsVenda;


              //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
              qrdbProd.DataSet    := ibServsVenda;
              qrdbProd.DataField  := ibServsVenda.FieldByName('NomeProduto').FieldName;

              qrdbVlrUnit.DataSet     := ibServsVenda;
              qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
             (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtde.DataSet        := ibServsVenda;
            qrdbQtde.DataField      := ibServsVenda.FieldByName('QtdeProd').FieldName;
            (ibServsVenda.FieldByName('QtdeProd') as TFloatField).DisplayFormat := '0'; //CRIA UMA MASCARA PARA O CAMPO

            qrdbVlrA.DataSet       := ibServsVenda;
            qrdbVlrA.DataField     := ibServsVenda.FieldByName('TotalVenda').FieldName;
            (ibServsVenda.FieldByName('TotalVenda') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtdeEstoque.DataSet  := ibServsVenda;
            qrdbQtdeEstoque.DataField := ibServsVenda.FieldByName('QUANTIDADE').FieldName;


          //    while not ibServsVenda.Eof do begin

              qrdbData.DataSet    := ibServsVenda;
              qrdbData.DataField  := ibServsVenda.FieldByName('DataVenda').FieldName;
           //   ibServsVenda.Next;

           //   end;

              qrlDataIni.Caption := DateToStr(frmProdutosVendidos.dtpDataIniGeral.Date);
              qrlDataF.Caption   := DateToStr(frmProdutosVendidos.dtpDataFimGeral.Date);

              qrl_QtdeTotalItens.Caption := FormatFloat('0',Qtde);

              qrpRelQtdeVendida.Preview;

            end; {if}


          EXCEPT
            on E : Exception do begin
               frmRelQtdeVendida.Release;
               MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
            end;
          END;

       end;//if
    ////////////////////////////////////////////////////////////////////////////////

       if (cboFornecedores.ItemIndex <> -1) Then begin

         ClassFornecedor := TClasseCombo(cboFornecedores.Items.Objects[cboFornecedores.ItemIndex]);

          Commit(ibServsVenda);
          ibServsVenda.Close;                                                              //    ,VLRTOTAL   , SUM(QTDE)As QtdeProd                                              //
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT DISTINCT TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA As DataVenda,'
          + 'SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd,SUM(TBLSERVICOSVENDAS.VLRTOTAL) As TotalVenda,'
          + 'CADPRODUTOS.NOME As NomeProduto,CADPRODUTOS.FORNECEDOR As NomeFornecedor,TBLENTRADAESTOQUEPROD.QUANTIDADE FROM TBLSERVICOSVENDAS '
          + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
          + 'INNER JOIN TBLENTRADAESTOQUEPROD ON TBLSERVICOSVENDAS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and CADPRODUTOS.FORNECEDOR=''' + IntToStr(ClassFornecedor.ID) + ''' GROUP BY TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.VLRUNIT,CADPRODUTOS.NOME,CADPRODUTOS.FORNECEDOR,TBLENTRADAESTOQUEPROD.QUANTIDADE ORDER BY CADPRODUTOS.NOME');
          ibServsVenda.Open;


         { ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT DISTINCT TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.NOMEPROD,'
          +'TBLSERVICOSVENDAS.VLRUNIT,SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd,'
          +'SUM(TBLSERVICOSVENDAS.VLRTOTAL) As TotalVenda,TBLSERVICOSVENDAS.IDPROD,'
          +'CADPRODUTOS.NOME As NomeProduto from tblservicosvendas '
          +'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
          +'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)GROUP BY TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.IDPROD,CADPRODUTOS.NOME ORDER BY CADPRODUTOS.NOME');
          ibServsVenda.Open; }

         { ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd FROM TBLSERVICOSVENDAS '
          +'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)');//GROUP BY TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.IDPROD,CADPRODUTOS.NOME ORDER BY CADPRODUTOS.NOME');
          ibServsVenda.Open; }



          ibServsVenda.Close;
          ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
          ibServsVenda.ParamByName('ParamDataFinal').Value   := dtpDataFimGeral.DateTime;
          ibServsVenda.Open;

       while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

              if (Qtde = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
               Qtde := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                //atribui na variavel substituindo o ponto para vlr em branco
                TotalQtde := StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                //atribui a variavel o valor separando por ponto
                Qtde := Qtde + StrtoFloat(StringReplace(TotalQtde,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end;{if}


              ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.

            end;{while}


         Application.CreateForm(TfrmRelQtdeVendida, frmRelQtdeVendida);

          TRY

            with frmRelQtdeVendida do begin

              frmRelQtdeVendida.qrpRelQtdeVendida.DataSet := ibServsVenda;


              //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
              qrdbProd.DataSet    := ibServsVenda;
              qrdbProd.DataField  := ibServsVenda.FieldByName('NomeProduto').FieldName;

              qrdbVlrUnit.DataSet     := ibServsVenda;
              qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
             (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtde.DataSet        := ibServsVenda;
            qrdbQtde.DataField      := ibServsVenda.FieldByName('QtdeProd').FieldName;
            (ibServsVenda.FieldByName('QtdeProd') as TFloatField).DisplayFormat := '0'; //CRIA UMA MASCARA PARA O CAMPO

            qrdbVlrA.DataSet       := ibServsVenda;
            qrdbVlrA.DataField     := ibServsVenda.FieldByName('TotalVenda').FieldName;
            (ibServsVenda.FieldByName('TotalVenda') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          //    while not ibServsVenda.Eof do begin

              qrdbData.DataSet    := ibServsVenda;
              qrdbData.DataField  := ibServsVenda.FieldByName('DataVenda').FieldName;
           //   ibServsVenda.Next;

           //   end;

              qrdbQtdeEstoque.DataSet  := ibServsVenda;
              qrdbQtdeEstoque.DataField := ibServsVenda.FieldByName('QUANTIDADE').FieldName;

              qrlDataIni.Caption := DateToStr(frmProdutosVendidos.dtpDataIniGeral.Date);
              qrlDataF.Caption   := DateToStr(frmProdutosVendidos.dtpDataFimGeral.Date);

              qrl_QtdeTotalItens.Caption := FormatFloat('0',Qtde);

              qrpRelQtdeVendida.Preview;

            end; {if}


          EXCEPT
            on E : Exception do begin
               frmRelQtdeVendida.Release;
               MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
            end;
          END;

       end;//if
    ////////////////////////////////////////////////////////////////////////////////

     end;// ckqtde cheqked false

       if ckPorQtde.Checked Then begin

          Commit(ibServsVenda);
          ibServsVenda.Close;                                                              //    ,VLRTOTAL   , SUM(QTDE)As QtdeProd                                              //
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT DISTINCT TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.DATA As DataVenda,'
          + 'SUM(TBLSERVICOSVENDAS.QTDE)As QtdeProd,SUM(TBLSERVICOSVENDAS.VLRTOTAL) As TotalVenda,'
          + 'CADPRODUTOS.NOME As NomeProduto,TBLENTRADAESTOQUEPROD.QUANTIDADE FROM TBLSERVICOSVENDAS '
          + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
          + 'INNER JOIN TBLENTRADAESTOQUEPROD ON TBLSERVICOSVENDAS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and CADPRODUTOS.NOME LIKE '+''''+'%'+lbl_edtNomeOrdem.text+'%'+''' GROUP BY TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.VLRUNIT,CADPRODUTOS.NOME,TBLENTRADAESTOQUEPROD.QUANTIDADE ORDER BY TBLSERVICOSVENDAS.QTDE DESC');
          ibServsVenda.Open;

          ibServsVenda.Close;
          ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
          ibServsVenda.ParamByName('ParamDataFinal').Value   := dtpDataFimGeral.DateTime;
          ibServsVenda.Open;


            while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

              if (Qtde = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
               Qtde := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                //atribui na variavel substituindo o ponto para vlr em branco
                TotalQtde := StringReplace(FloattoStr(ibServsVenda.FieldByName('QtdeProd').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                //atribui a variavel o valor separando por ponto
                Qtde := Qtde + StrtoFloat(StringReplace(TotalQtde,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end;//if


              ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.

            end;//while



         Application.CreateForm(TfrmRelQtdeVendida, frmRelQtdeVendida);

          TRY

            with frmRelQtdeVendida do begin

              frmRelQtdeVendida.qrpRelQtdeVendida.DataSet := ibServsVenda;


              //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
              qrdbProd.DataSet    := ibServsVenda;
              qrdbProd.DataField  := ibServsVenda.FieldByName('NomeProduto').FieldName;

              qrdbVlrUnit.DataSet     := ibServsVenda;
              qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
             (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtde.DataSet        := ibServsVenda;
            qrdbQtde.DataField      := ibServsVenda.FieldByName('QtdeProd').FieldName;
            (ibServsVenda.FieldByName('QtdeProd') as TFloatField).DisplayFormat := '0'; //CRIA UMA MASCARA PARA O CAMPO

            qrdbVlrA.DataSet       := ibServsVenda;
            qrdbVlrA.DataField     := ibServsVenda.FieldByName('TotalVenda').FieldName;
            (ibServsVenda.FieldByName('TotalVenda') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbQtdeEstoque.DataSet  := ibServsVenda;
            qrdbQtdeEstoque.DataField := ibServsVenda.FieldByName('QUANTIDADE').FieldName;

              while not ibServsVenda.Eof do begin

              qrdbData.DataSet    := ibServsVenda;
              qrdbData.DataField  := ibServsVenda.FieldByName('DataVenda').FieldName;
              ibServsVenda.Next;

              end;

              qrlDataIni.Caption := DateToStr(frmProdutosVendidos.dtpDataIniGeral.Date);
              qrlDataF.Caption   := DateToStr(frmProdutosVendidos.dtpDataFimGeral.Date);

              qrl_QtdeTotalItens.Caption := FormatFloat('0',Qtde);

              qrpRelQtdeVendida.Preview;

            end; //if


          EXCEPT
            on E : Exception do begin
               frmRelQtdeVendida.Release;
               MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
            end;
          END;

      //end;//if

    ////////////////////////////////////////////////////////////////////////////////


     end;// if ckqtde cheked true


  end;{with}

end;

procedure TfrmProdutosVendidos.FormShow(Sender: TObject);
begin

  dtpDataIniGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFimGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  lbl_edtCodBarra.Text := '';
  lbl_edtNome.Text := '';
  ckPorQtde.Checked := False;
  
  with dmModule do begin

    ExecSELECTFornecedor;

  end;//with

end;

procedure TfrmProdutosVendidos.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmProdutosVendidos.ibeaLimparClick(Sender: TObject);
begin
lbl_edtCodBarra.Text := '';
lbl_edtNome.Text := '';
lbl_edtNomeOrdem.Text := '';
cboFornecedores.ClearSelection;
ckPorQtde.Checked := False;

end;

procedure TfrmProdutosVendidos.lbl_edtCodBarraChange(Sender: TObject);
begin

  with dmModule do begin

    if lbl_edtCodBarra.Text <> '' Then begin

      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CODBARRAS=''' + lbl_edtCodBarra.Text + '''');
      ibProdutos.Open;

      if ibProdutos.RecordCount > 0 Then begin

        lbl_edtNome.Text := ibProdutos.FieldByName('NOME').AsString;

      end;//if recordcount

    end;//if

  end;//with

end;

procedure TfrmProdutosVendidos.lbl_edtNomeExit(Sender: TObject);
begin

  with dmModule do begin

    if lbl_edtNome.Text <> '' Then begin

      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CADPRODUTOS.NOME LIKE '+''''+'%'+lbl_edtNome.text+'%'+''' ORDER BY NOME');
      ibProdutos.Open;

      if ibProdutos.RecordCount > 0 Then begin

        lbl_edtCodBarra.Text := ibProdutos.FieldByName('CODBARRAS').AsString;

      end;//if recordcount

    end;//if

  end;//with

end;

procedure TfrmProdutosVendidos.lbl_edtCodBarraKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 Then begin

    lbl_edtNome.SetFocus;

  end;

end;

procedure TfrmProdutosVendidos.lbl_edtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 Then begin

    lbl_edtCodBarra.SetFocus;

  end;
  
end;

procedure TfrmProdutosVendidos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
 Key := UpCase(Key); //Deixa todos os textos em maiusculo
  if Key = #13 Then begin
     Key := #0; //Desabilita processamento posterior da tecla
     Perform(WM_NEXTDLGCTL,0,0);//Simula o envio de Tab
  end;
end;

end.
