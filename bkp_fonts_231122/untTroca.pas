unit untTroca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, IBQuery, untClasse.ImprimirCupom,
  classComboBox, Grids, DBGrids, Printers, Buttons, Data.DB;

type
  TfrmTrocaMercadoria = class(TForm)
    lbl_edtCodBarraTroca: TLabeledEdit;
    lbl_edtNomeProdTroca: TLabeledEdit;
    lbl_edtVlrVendaTroca: TLabeledEdit;
    lbl_ProdD: TLabel;
    lbl_edtQtde: TLabeledEdit;
    dbgEstoque: TDBGrid;
    lbl_edtCodProdTroca: TLabeledEdit;
    lbl_edtTotalDevolvido: TLabeledEdit;
    lbl_edtRefTroca: TLabeledEdit;
    cboFunc: TComboBox;
    lbl_Vendedor: TLabel;
    memoObsTroca: TMemo;
    lbl_ObsTroca: TLabel;
    lbl_F1: TLabel;
    lbl_F4: TLabel;
    lbl_F2: TLabel;
    lbl_edtCodBarras: TLabeledEdit;
    lbl_edtRef: TLabeledEdit;
    lbl_edtDescricao: TLabeledEdit;
    lbl_edtVlrVenda: TLabeledEdit;
    lbl_edtQtdeProd: TLabeledEdit;
    lbl_edtTotal: TLabeledEdit;
    lbl_edtIDProd: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    ibeaSair: TSpeedButton;

    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTFuncionario;
    procedure LimpaCampos;
    procedure ExecSELECTTipoPagto;
    procedure GravaTroca;
    procedure FormShow(Sender: TObject);
    procedure lbl_edtCodBarraTrocaChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure lbl_edtCodBarrasChange(Sender: TObject);
    procedure lbl_edtCodBarrasExit(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure lbl_edtQtdeRetiradaExit(Sender: TObject);
    procedure lbl_edtQtdeExit(Sender: TObject);
    procedure lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtTotalDevolvidoExit(Sender: TObject);
    procedure lbl_edtTotalDevolvidoKeyPress(Sender: TObject;
      var Key: Char);
    procedure lbl_edtCodBarraTrocaKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtTotalRetiradoExit(Sender: TObject);
    procedure lbl_edtTotalVendaExit(Sender: TObject);
    procedure cboTipoPagtoClick(Sender: TObject);
    procedure lbl_edtRefTrocaExit(Sender: TObject);
    procedure lbl_edtRefExit(Sender: TObject);
    procedure lbl_edtRefTrocaKeyPress(Sender: TObject; var Key: Char);
    procedure cboFuncKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrocaMercadoria: TfrmTrocaMercadoria;
  IDTipoPagto : TClasseCombo;
  MontaColunas,MontaColProd : Boolean;
  NovoCupom,InsereVenda : Boolean;
  IDVenda : Integer;

implementation

uses untdmModule, funcPosto, untServicos, uBuscaProdutos;

  function iImprimirTexto_DUAL_DarumaFramework(pszString: String; iTam: Integer): Integer; StdCall; External 'DarumaFrameWork.dll';
  function eBuscarPortaVelocidade_DUAL_DarumaFramework(): Integer; StdCall; External 'DarumaFrameWork.dll';

{$R *.dfm}

procedure TfrmTrocaMercadoria.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmTrocaMercadoria.ExecSELECTFuncionario;

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

procedure TfrmTrocaMercadoria.LimpaCampos;

begin

memoObsTroca.Clear;
lbl_edtCodBarraTroca.Clear;
//lbl_edtCodBarras.Clear;
lbl_edtRefTroca.Clear;
//lbl_edtRef.Clear;
//lbl_edtTotalRetirado.Text := '0,00';
lbl_edtNomeProdTroca.Clear;
lbl_edtVlrVendaTroca.Text := '0,00';
//lbl_edtCodProdTroca.Clear;
//lbl_edtCodProd.Clear;
//lbl_edtNomeProd.Clear;
//lbl_edtVlrVenda.Text := '0,00';
//lbl_edtVlrDiferenca.Text := '0,00';
lbl_edtQtde.Text := '1';
lbl_edtTotalDevolvido.Text := '0,00';
//lbl_edtTotalVenda.Text := '0,00';
//cboTipoPagto.ClearSelection;
//memoObs.Clear;

end;

procedure TfrmTrocaMercadoria.ExecSELECTTipoPagto;

begin

 { with dmModule do begin

    ibTipoPagtoF.Close;
    ibTipoPagtoF.SQL.Clear;
    ibTipoPagtoF.SQL.Add('SELECT * FROM TBLTIPOPAGTOAVULSO');
    ibTipoPagtoF.Open;

    cboTipoPagto.Clear;

    while not ibTipoPagtoF.Eof do begin

      IDTipoPagto    := TClasseCombo.Create;
      IDTipoPagto.ID := ibTipoPagtoF.FieldByName('IDTIPO').AsInteger;
      cboTipoPagto.Items.AddObject(ibTipoPagtoF.FieldByName('DESCRICAO').AsString,IDTipoPagto);
      ibTipoPagtoF.Next; }

   // end;{while}

 // end;{with}

end;

procedure TfrmTrocaMercadoria.GravaTroca;

{var

QtdeTotalEstoqueVenda,QtdeMinimaEstoque,EstoqueFinal,TrocaMercadoria : String;
TotalProdEstoque,TotalCusto,StringProd,TotalCustoProduto,InfoEstoqueMinimo : String;
LocalEstoque,NomeProduto,ValorDif,ValorUnit,SituacaoCliente : String;
QtdeEstoqueVenda,QtdeEstoque,QtdeVenda,VlrProduto,ValorCustoE,Custo : Real;
QtdeVendida : Real;
TotaldoEstoque,ConfirmaTroca,IDProd,TotaldoMinimo,IDFuncComissao : Integer; }

begin

 { with dmModule do begin

  ConfirmaTroca := Application.MessageBox('Confirma o Lançamento de Troca?','Troca de Mercadoria',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaTroca = 6 Then begin

      NovoCupom := True;

      ibEntrProdEstoque.Close;
      ibEntrProdEstoque.SQL.Clear;
      ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
      + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
      + 'CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD FROM TBLENTRADAESTOQUEPROD '
      + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + lbl_edtCodProd.Text + '''');
      ibEntrProdEstoque.Open;

       //ROTINA PARA O ESTOQUE MINIMO
       if ibEntrProdEstoque.RecordCount > 0 Then begin

         QtdeEstoqueVenda := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

         QtdeTotalEstoqueVenda := StringReplace(FloattoStr(QtdeEstoqueVenda),ThousandSeparator,'',[rfReplaceAll]);
         QtdeTotalEstoqueVenda := StringReplace(QtdeTotalEstoqueVenda,DecimalSeparator,'.',[rfReplaceAll]);

         TotaldoEstoque := StrToInt(QtdeTotalEstoqueVenda);

         QtdeMinimaEstoque := (ibEntrProdEstoque.FieldByName('ESTOQUEMIN').AsString);

        ibConfig.Close;
        ibConfig.SQL.Clear;
        ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
        ibConfig.Open;

        InfoEstoqueMinimo := ibConfig.FieldByName('ESTOQUEMINIMO').AsString;

        TotaldoMinimo := StrToInt(QtdeMinimaEstoque);

          if InfoEstoqueMinimo = 'Sim' Then begin

            if (TotaldoMinimo >= TotaldoEstoque) Then begin

              Application.MessageBox('Atenção o Estoque está em sua Quantidade Mínima!!!','Notificação: Estoque inferior ao mínimo.',+MB_OK+MB_ICONWARNING);

            end;//if

          end;//if  }

      // end;{if recordcount}



        //ROTINA ABAIXO PARA SOMAR TOTAL DO ESTQUE E QUANTIDADE DO ESTOQUE
     {  if lbl_edtCodProd.Text <> '' Then begin

         //traz na variavel a qtde conf. prod da select identificado por id.
         QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
         // QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),DecimalSeparator,',',[rfReplaceAll]));

         QtdeVenda   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

         QtdeEstoque := QtdeEstoque - QtdeVenda;

         EstoqueFinal := StringReplace(FloattoStr(QtdeEstoque),ThousandSeparator,'',[rfReplaceAll]);
         EstoqueFinal := StringReplace(EstoqueFinal,DecimalSeparator,'.',[rfReplaceAll]);

         //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
         VlrProduto  := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

         VlrProduto  := QtdeEstoque * VlrProduto;

         TotalProdEstoque := StringReplace(FloattoStr(VlrProduto),ThousandSeparator,'',[rfReplaceAll]);
         TotalProdEstoque := StringReplace(TotalProdEstoque,DecimalSeparator,'.',[rfReplaceAll]);

         ValorCustoE := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

         ValorCustoE := QtdeEstoque * ValorCustoE;

         TotalCusto := StringReplace(FloattoStr(ValorCustoE),ThousandSeparator,'',[rfReplaceAll]);
         TotalCusto := StringReplace(TotalCusto,DecimalSeparator,'.',[rfReplaceAll]);

         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
         +'TOTALCUSTO=''' + TotalCusto + ''','
         +'QUANTIDADE=''' + (EstoqueFinal) + ''','
         +'VLRTOTAL=''' + (TotalProdEstoque) +  ''' WHERE IDPROD=''' + lbl_edtCodProd.Text + '''');
         ibEntrProdEstoque.ExecSQL;
         Commit(ibEntrProdEstoque);

       end;//if label IDPRODCX  }

  ////////////////////////////////////////////////////////////////////////////////

  //ROTINA para CAlculo do custo vendido

  {   if lbl_edtNomeProd.Text = '' Then begin

        StringProd := ' '' 0 '',';
        TotalCusto := '0';

      end else begin

      //  ClassVendaProduto   := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
        StringProd          := lbl_edtCodProd.Text;

        ibProdutos.Close;
        ibProdutos.SQL.Clear;
        ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,'
        + 'LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
        + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
        + 'WHERE IDPROD=''' + StringProd + '''');
        ibProdutos.Open;

        LocalEstoque := ibProdutos.FieldByName('Estoque').AsString;
        NomeProduto  := ibProdutos.FieldByName('NOME').AsString;
        IDProd       := ibProdutos.FieldByName('IDPROD').AsInteger;

        Custo := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
        QtdeVendida := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
        Custo := QtdeVendida * Custo;

        TotalCustoProduto := StringReplace(FloattoStr(Custo),ThousandSeparator,'',[rfReplaceAll]);
        TotalCustoProduto := StringReplace(TotalCustoProduto,DecimalSeparator,'.',[rfReplaceAll]);


      end;

       if InsereVenda Then begin

         ibServsVendasCli.Close;
         ibServsVendasCli.SQL.Clear;
         ibServsVendasCli.SQL.Add('INSERT INTO TBLSERVICOSVENDASCLI '
         + '(IDPROD,DATA) values '
         + '(''' + StringProd + ''','
       //  + ' ''' + IntToStr(IDFuncCX) + ''',' IDFUNC,
         + ' ''' + FormatDateTime('mm-dd-yyyy',now) + ''')');
         ibServsVendasCli.ExecSQL;
         Commit(ibServsVendasCli);


         //select para trazer o ultimo id
         ibServsVendasCli.Close;
         ibServsVendasCli.SQL.Clear;
         ibServsVendasCli.SQL.Add('SELECT * FROM TBLSERVICOSVENDASCLI ORDER BY IDSERVSVENDA DESC');
         ibServsVendasCli.Open;


         IDVenda := ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger;

           if lbl_edtNumCupom.Text = '1' Then begin

            IDVenda := 1;

          end else begin

            IDVenda := ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger;

          end;

            InsereVenda := False;

       end;//if inserre venda

            if lbl_edtFuncComissao.Text <> '' Then begin

              IDFuncComissao := StrToInt(lbl_edtFuncComissao.Text);

            end;

            TrocaMercadoria := 'Sim';

            ibServsVenda.Close;
            ibServsVenda.SQL.Clear;
            ibServsVenda.SQL.Add('INSERT INTO TBLSERVICOSVENDAS '
            + ' (IDPROD,ESTOQUE,IDSERVSVENDA,'
            + 'NOMEPROD,OBS,IDFUNCCOMISSAO,TROCAMERCADORIA,DATA,HORA) values '
            + ' (''' + StringProd  + ''','
          //  + ' ''' + ValorUnit + ''','VLRUNIT,
           // + ' ''' + ValorDif + ''',' VLRTOTAL,
            + ' ''' + LocalEstoque + ''','
            + ' ''' + IntToStr(IDVenda) + ''','
          // + ' ''' + TotalCusto + ''',' TOTALCUSTO,
            + ' ''' + NomeProduto + ''','
            + ' ''' + memoObs.Text + ''','
            + ' ''' + IntToStr(IDFuncComissao) + ''','
            + ' ''' + TrocaMercadoria + ''','
            + ' ''' + FormatDateTime('mm-dd-yyyy',now) + ''','
            + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
            ibServsVenda.ExecSQL;

            Commit(ibServsVenda);

            ibServsVenda.Close;
            ibServsVenda.SQL.Clear;
            ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
            + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
            + 'WHERE TBLSERVICOSVENDAS.IDPROD=''' + lbl_edtCodProd.Text + '''and TBLSERVICOSVENDAS.IDSERVSVENDA=''' + IntToStr(IDVenda) + '''');
            ibServsVenda.Open;

////////////////////////////////////////////////////////////////////////////////

          TotalSaidaEstoque := StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]);
          TotalSaidaEstoque := StringReplace(TotalSaidaEstoque,DecimalSeparator,'.',[rfReplaceAll]);
          if TotalSaidaEstoque  = '' Then
           TotalSaidaEstoque := '0';

          ibMovEst.Close;
          ibMovEst.SQL.Clear;
          ibMovEst.SQL.Add('INSERT INTO TBLMOVESTOQUE '
          + '(IDPROD,DATA,HORA,IDVENDA,SAIDA) values '
          + ' (''' + IntToStr(IDProdMovEstoque) + ''','
          + ' ''' + FormatDateTime('mm-dd-yyyy',now) + ''','
          + ' ''' + FormatDateTime('hh:mm:ss',now) + ''','
          + ' ''' + IntToStr(IDVendasServs) + ''','
          + ' ''' + TotalSaidaEstoque + ''')');
          ibMovEst.ExecSQL;
          Commit(ibMovEst);

    end else begin

      NovoCupom := False;

    end;//if confirmatroca  }



 // end;//with

end;


procedure TfrmTrocaMercadoria.FormShow(Sender: TObject);
begin


    lbl_edtVlrVendaTroca.Text := '0,00';
    lbl_edtTotal.Text := '0,00';
    lbl_edtCodBarraTroca.SetFocus;
    cboFunc.ClearSelection;
    LimpaCampos;


  with dmModule do begin

    ExecSELECTFuncionario;
////////////////////////////////////////////////////////////////////////////////
    ibEntrProdEstoque.Close;

    {ibServsVendasCli.Close;
    ibServsVendasCli.SQL.Clear;
    ibServsVendasCli.SQL.Add('SELECT IDSERVSVENDA FROM TBLSERVICOSVENDASCLI ORDER BY IDSERVSVENDA DESC');
    ibServsVendasCli.Open; }

   { if (ibServsVendasCli.RecordCount = 0) Then begin

      lbl_edtNumCupom.Text := '1';

    end else begin

      lbl_edtNumCupom.Text := IntToStr(ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger + 1);

      IDVenda := (ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger + 1); }

   // end;{if}

  //  InsereVenda := True;

////////////////////////////////////////////////////////////////////////////////

   with dbgEstoque do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

      DataSource := dmModule.dtsEntrProdEstoque;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'NomeProd';
        Columns.Items[0].Width         := 230;
        Columns.Items[0].Alignment     := taLeftJustify;

       //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Vlr.Venda';
        Columns.Items[1].FieldName     := 'VALORVENDAA';
        Columns.Items[1].Width         := 100;
        Columns.Items[1].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[2].Title.Caption := 'Qtde.Estoque';
        Columns.Items[2].FieldName     := 'QUANTIDADE';
        Columns.Items[2].Width         := 110;
        Columns.Items[2].Alignment     := taLeftJustify;


        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[3].Title.Caption := 'Total';
        Columns.Items[3].FieldName     := 'VLRTOTAL';
        Columns.Items[3].Width         := 100;
        Columns.Items[3].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Estoque Mínimo';
        Columns.Items[4].FieldName     := 'ESTOQUEMIN';
        Columns.Items[4].Width         := 120;
        Columns.Items[4].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with}
////////////////////////////////////////////////////////////////////////////////

 {  with dbgProdTroca do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColProd Then begin

      DataSource := dmModule.dtsServsVenda;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'Produto';
        Columns.Items[0].Width         := 230;
        Columns.Items[0].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[1].Title.Caption := 'Vlr.Venda';
        Columns.Items[1].FieldName     := 'VLRUNIT';
        Columns.Items[1].Width         := 110;
        Columns.Items[1].Alignment     := taLeftJustify;

       //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[2].Title.Caption := 'Qtde.';
        Columns.Items[2].FieldName     := 'QTDE';
        Columns.Items[2].Width         := 80;
        Columns.Items[2].Alignment     := taLeftJustify;


        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[3].Title.Caption := 'Total';
        Columns.Items[3].FieldName     := 'VLRTOTAL';
        Columns.Items[3].Width         := 100;
        Columns.Items[3].Alignment     := taLeftJustify;

        MontaColProd := False; }

     // end;{if}

    //end;{with}
////////////////////////////////////////////////////////////////////////////////

  end;//with

end;

procedure TfrmTrocaMercadoria.lbl_edtCodBarraTrocaChange(Sender: TObject);

{var

QtdeEstoque,VlrProduto,ValorCustoE,QtdeVenda,QtdeVendaProd,ValorCustoProd  : Real;
VlrProdutoProd : Real;
TotalCustoProd : String;
EstoqueFinal,TotalProdEstoque,TotalCusto,EstoqueFinalProd,TotalProdEstoqueProd : String;
IDProdQtdeEstoque, IDLocalEstoque : Integer;}

begin

  with dmModule do begin


      if lbl_edtCodBarraTroca.Text <> '' Then begin

        ibProdutos.Close;
        ibProdutos.SQL.Clear;
        ibProdutos.SQL.Add('SELECT IDPROD,NOME,VALORVENDAA,VALORVENDAB,VALORVENDAC,REF,CODBARRAS FROM CADPRODUTOS WHERE CODBARRAS=''' + lbl_edtCodBarraTroca.Text + '''');
        ibProdutos.Open;

      //  IDProdQtdeEstoque := ibProdutos.FieldByName('IDPROD').AsInteger;
     //   IDLocalEstoque    := ibProdutos.FieldByName('IDLOCAL').AsInteger;

    // if lbl_edtCodBarraTroca.Text <> '' Then begin

        lbl_edtNomeProdTroca.Text := ibProdutos.FieldByName('NOME').AsString;
        lbl_edtVlrVendaTroca.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
        lbl_edtCodProdTroca.Text  := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);
        lbl_edtRefTroca.Text      := ibProdutos.FieldByName('REF').AsString;

        lbl_edtDescricao.Text := lbl_edtNomeProdTroca.Text;
        lbl_edtCodBarras.Text := lbl_edtCodBarraTroca.Text;

      end;  
    //  lbl_edtNomeProdTroca.SetFocus;
     // lbl_edtQtdeExit(Sender);

   // end;
    
    {if lbl_edtCodBarraTroca.Text <> '' Then begin

      ibEntrProdEstoque.Close;
      ibEntrProdEstoque.SQL.Clear;
      ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,TBLENTRADAESTOQUEPROD.IDLOCAL,'
      + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
      + 'CADPRODUTOS.IDLOCAL As Estoque,CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,'
      + 'CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS,CADPRODUTOS.CODBARRASAD FROM TBLENTRADAESTOQUEPROD '
      + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarraTroca.Text + ''' OR CADPRODUTOS.CODBARRASAD=''' + lbl_edtCodBarraTroca.Text + '''');
      ibEntrProdEstoque.Open;


      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CODBARRAS=''' + lbl_edtCodBarraTroca.Text + '''');
      ibProdutos.Open;

      IDProdQtdeEstoque := ibProdutos.FieldByName('IDPROD').AsInteger;
      IDLocalEstoque    := ibProdutos.FieldByName('IDLOCAL').AsInteger;

      lbl_edtNomeProdTroca.Text := ibEntrProdEstoque.FieldByName('NomeProd').AsString;
      lbl_edtVlrVendaTroca.Text := FormatFloat(CasasDecimais('Produtos'),ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat);
      lbl_edtCodProdTroca.Text  := IntToStr(ibEntrProdEstoque.FieldByName('IDPROD').AsInteger);

   // end;  //ROTINA ABAIXO PARA SOMAR TOTAL DO ESTQUE E QUANTIDADE DO ESTOQUE

      //traz na variavel a qtde conf. prod da select identificado por id.
      QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
     // QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),DecimalSeparator,',',[rfReplaceAll]));

      QtdeVenda   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

      QtdeEstoque := QtdeEstoque + QtdeVenda;

      EstoqueFinal := StringReplace(FloattoStr(QtdeEstoque),ThousandSeparator,'',[rfReplaceAll]);
      EstoqueFinal := StringReplace(EstoqueFinal,DecimalSeparator,'.',[rfReplaceAll]);

      //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
      VlrProduto  := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

      VlrProduto  := QtdeEstoque * VlrProduto;

      TotalProdEstoque := StringReplace(FloattoStr(VlrProduto),ThousandSeparator,'',[rfReplaceAll]);
      TotalProdEstoque := StringReplace(TotalProdEstoque,DecimalSeparator,'.',[rfReplaceAll]);


      ValorCustoE := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

      ValorCustoE := QtdeEstoque * ValorCustoE;

      TotalCusto := StringReplace(FloattoStr(ValorCustoE),ThousandSeparator,'',[rfReplaceAll]);
      TotalCusto := StringReplace(TotalCusto,DecimalSeparator,'.',[rfReplaceAll]);


       //se houver registro ele atribui na alteracao o vlr da variavel

       if ibEntrProdEstoque.RecordCount > 0 Then begin

         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
         +'QUANTIDADE=''' + (EstoqueFinal) + ''','
         +'TOTALCUSTO=''' + TotalCusto + ''','
         +'VLRTOTAL=''' + (TotalProdEstoque) +  ''' WHERE IDPROD=''' + IntToStr(IDProdQtdeEstoque) + '''');
         ibEntrProdEstoque.ExecSQL;


         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
         + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
         + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,'
         + 'CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS,CADPRODUTOS.CODBARRASAD FROM TBLENTRADAESTOQUEPROD '
         + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
         + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarraTroca.Text + '''OR CADPRODUTOS.CODBARRASAD=''' + lbl_edtCodBarraTroca.Text + '''');
         ibEntrProdEstoque.Open;

         (ibEntrProdEstoque.FieldByName('VLRTOTAL')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
         (ibEntrProdEstoque.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat := CasasDecimais('Produtos');



       // lbl_edtQtde.SetFocus;

         if lbl_edtQtde.Text <> '' Then begin

         lbl_edtQtde.SetFocus;
         //  lbl_edtCodBarras.SetFocus;
      //   lbl_edtCodBarraTroca.Clear;

         end;//if


       end else begin


         QtdeVendaProd   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

         EstoqueFinalProd := StringReplace(FloattoStr(QtdeVendaProd),ThousandSeparator,'',[rfReplaceAll]);
         EstoqueFinalProd := StringReplace(EstoqueFinalProd,DecimalSeparator,'.',[rfReplaceAll]);

         //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
         VlrProdutoProd  := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

         VlrProdutoProd  := QtdeVendaProd * VlrProdutoProd;

         TotalProdEstoqueProd := StringReplace(FloattoStr(VlrProdutoProd),ThousandSeparator,'',[rfReplaceAll]);
         TotalProdEstoqueProd := StringReplace(TotalProdEstoqueProd,DecimalSeparator,'.',[rfReplaceAll]);

         ValorCustoProd := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

         ValorCustoProd := QtdeVendaProd * ValorCustoProd;

         TotalCustoProd := StringReplace(FloattoStr(ValorCustoProd),ThousandSeparator,'',[rfReplaceAll]);
         TotalCustoProd := StringReplace(TotalCustoProd,DecimalSeparator,'.',[rfReplaceAll]);

         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('INSERT INTO TBLENTRADAESTOQUEPROD'
         + '(IDPROD,QUANTIDADE,TOTALCUSTO,VLRTOTAL,CODBARRAS,IDLOCAL) values '
         + '(''' + IntToStr(IDProdQtdeEstoque) + ''','
         + ' ''' + EstoqueFinalProd + ''','
         + ' ''' + TotalCustoProd + ''','
         + ' ''' + TotalProdEstoqueProd + ''','
         + ' ''' + lbl_edtCodBarraTroca.Text + ''','
         + ' ''' + IntToStr(IDLocalEstoque) + ''')');
         ibEntrProdEstoque.ExecSQL;


         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
         + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
         + 'CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS,CADPRODUTOS.CODBARRASAD,'
         + 'CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO FROM TBLENTRADAESTOQUEPROD '
         + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
         + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarraTroca.Text + '''OR CADPRODUTOS.CODBARRASAD=''' + lbl_edtCodBarraTroca.Text + '''');
         ibEntrProdEstoque.Open;

         (ibEntrProdEstoque.FieldByName('VLRTOTAL')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
         (ibEntrProdEstoque.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat := CasasDecimais('Produtos'); }


         //  lbl_edtCodBarras.Clear;


         {lbl_edtQtde.SetFocus;

         if lbl_edtQtde.Text <> '' Then begin

           lbl_edtCodBarras.SetFocus;

         end;}

    //  end;

  //  end;//if label codbarras

//  end;//with


////////////////////////////////////////////////////////////////////////////////
 { with dmModule do begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
    + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
    + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarraTroca.Text + ''' or CADPRODUTOS.CODBARRASAD=''' + lbl_edtCodBarraTroca.Text + '''');
    ibProdutos.Open;

    (ibProdutos.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat  := CasasDecimais('Produtos');

    lbl_edtNomeProdTroca.Text := ibProdutos.FieldByName('NOME').AsString;
    lbl_edtVlrVendaTroca.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

  end;}//with

  end;//with

end;

procedure TfrmTrocaMercadoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var

  strNomeEmpr, strEnderecoEmpr, strNumeroEmpr, strBairroEmpr, strTelefoneEmpr,Str_ParametroVenda : TImprimirCupom;
  intConfirmaImpressaoCupom : TImprimirCupom;
  strNomeProd, StrCodBarrasProd, StrVlrCredito : TDadosProduto;
  strDesenhoDivisao,StrData,StrHora : TConfiguracoes;
  //Str_ParametroVenda, strNomeCli : String;
  iRetorno, i : Integer;
  F : TextFile;
{SituacaoCliente,ValorDif : String;
IDTipoPagamento  : TClasseCombo;
StringTipoPagamento,TrocaMercadoria : String;
ConfirmaRecebimento,IDServs : Integer; }
var
ConfirmaDevolucao : Integer;
begin
 
  with dmModule do begin

    case Key of

      VK_F1 :begin

         cboFunc.DroppedDown := True;
         SendMessage(cboFunc.Handle,CB_SHOWDROPDOWN,1,0);
         cboFunc.SetFocus;


       { if NovoCupom Then begin

          ibServsVendasCli.Close;
          ibServsVendasCli.SQL.Clear;
          ibServsVendasCli.SQL.Add('SELECT IDSERVSVENDA FROM TBLSERVICOSVENDASCLI ORDER BY IDSERVSVENDA DESC');
          ibServsVendasCli.Open;

          frmVendasLoja.lbl_CodVenda.Caption := IntToStr(ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger + 1);

        end;//if novocupom }

      end;//begin

      VK_F2 :begin

      ibeaSairClick(Sender);

      end;//begin

      VK_F3 :begin

        strNomeEmpr := TImprimirCupom.Create();
        strEnderecoEmpr := TImprimirCupom.Create();
        strNumeroEmpr   := TImprimirCupom.Create();
        strBairroEmpr   := TImprimirCupom.Create();
        strTelefoneEmpr := TImprimirCupom.Create();
        Str_ParametroVenda := TImprimirCupom.Create();
        intConfirmaImpressaoCupom := TImprimirCupom.Create();
        
        strNomeProd := TDadosProduto.Create();
        StrCodBarrasProd := TDadosProduto.Create();
        StrVlrCredito  :=  TDadosProduto.Create();

        strDesenhoDivisao := TConfiguracoes.Create();
        StrData           := TConfiguracoes.Create();
        StrHora           := TConfiguracoes.Create();

        try

          Commit(ibDadosEmpresa);
          ibDadosEmpresa.Close;
          ibDadosEmpresa.SQL.Clear;
          ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
          ibDadosEmpresa.Open;

          strNomeEmpr.StrNomeEmpr     := ibDadosEmpresa.FieldByName('NOME').AsString;
          strEnderecoEmpr.StrEndEmpr  := ibDadosEmpresa.FieldByName('ENDERECO').AsString;
          strNumeroEmpr.StrNumEmpr    := ibDadosEmpresa.FieldByName('NUMERO').AsString;
          strBairroEmpr.StrBairroEmpr := ibDadosEmpresa.FieldByName('BAIRRO').AsString;
          strTelefoneEmpr.StrTelefoneEmpr := ibDadosEmpresa.FieldByName('TELEFONE').AsString;

          strNomeProd.StrNomeProd := lbl_edtDescricao.Text;
          StrVlrCredito.StrVlrCredito  := (lbl_edtTotal.Text);
          StrCodBarrasProd.StrcodBarrasProd := lbl_edtCodBarras.Text;

          Commit(ibConfig);
          ibConfig.Close;
          ibConfig.SQL.Clear;
          ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
          ibConfig.Open;

          strDesenhoDivisao.StrDesenhoDivisaoCupom   := ibConfig.FieldByName('DESENHODIVISAO').AsString;
          StrData.StrDataConvertida := FormatDateTime('DD/MM/YYYY',Now);
          StrHora.StrHoraConvertida := FormatDateTime('hh:mm:ss',Now);

          intConfirmaImpressaoCupom.intConfirmaImpressao := Application.MessageBox('Confirma a Impressão do Crédito','Cupom de Crédito',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

                  AssignPrn(F);
                  Rewrite(F);
                  i := 0;

          if intConfirmaImpressaoCupom.intConfirmaImpressao = 6 Then begin

           // Str_ParametroVenda.Str_ParametroVendaC := StringOFChar(#0,700);
           // Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+(strDesenhoDivisao.StrDesenhoDivisaoCupom)+'<l></l>';
            Writeln(F,(strDesenhoDivisao.StrDesenhoDivisaoCupom));
            //Str_ParametroVenda.Str_ParametroVendaC:= '<ce>'+strNomeEmpr.StrNomeEmpr+'</ce><l></l>';
            Writeln(F,(strNomeEmpr.StrNomeEmpr));
            if ibDadosEmpresa.FieldByName('ENDERECO').AsString <> '' Then begin

            //  Str_ParametroVenda.Str_ParametroVendaC:= Str_ParametroVenda.Str_ParametroVendaC+ strEnderecoEmpr.StrEndEmpr+' , '+strNumeroEmpr.StrNumEmpr+'<l></l>';
              Writeln(F,(strEnderecoEmpr.StrEndEmpr+' , '+strNumeroEmpr.StrNumEmpr));

            end;

            if ibDadosEmpresa.FieldByName('BAIRRO').AsString <> '' Then begin //begin

               //Str_ParametroVenda.Str_ParametroVendaC:= Str_ParametroVenda.Str_ParametroVendaC+ strBairroEmpr.StrBairroEmpr+'<l></l>';
               Writeln(F,(strBairroEmpr.StrBairroEmpr));

            end;

            if ibDadosEmpresa.FieldByName('TELEFONE').AsString <> '' Then begin //begin

              //Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+ strTelefoneEmpr.StrTelefoneEmpr+'<l></l>';
              Writeln(F,(strTelefoneEmpr.StrTelefoneEmpr));

            end;

              //Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+(strDesenhoDivisao.StrDesenhoDivisaoCupom)+'<l></l>';
              Writeln(F,(strDesenhoDivisao.StrDesenhoDivisaoCupom));
              //Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+'<ce>'+('**Cupom de Credito/Troca de Mercadoria**')+'<ce><l></l>';
              Writeln(F,('**Cupom de Credito/Troca de Mercadoria**'));
              //Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+('Data:'+StrData.StrDataConvertida+' '+'Hora:'+StrHora.StrHoraConvertida)+'<l></l>';//,0);
              Writeln(F,('Data: ' + StrData.StrDataConvertida+' '+'Hora:'+StrHora.StrHoraConvertida));
              //Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+'<ce>'+('**Produto Devolvido**')+'<ce><l></l>';
              Writeln(F,('**Produto Devolvido**'));
              //Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+(StrCodBarrasProd.StrcodBarrasProd+' '+strNomeProd.StrNomeProd)+'<l></l>';
              Writeln(F,(StrCodBarrasProd.StrcodBarrasProd+' '+strNomeProd.StrNomeProd));
              //Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+('Vlr. do Credito: R$'+StrVlrCredito.StrVlrCredito)+'<l></l>';
              Writeln(F,('Vlr. do Credito: R$'+StrVlrCredito.StrVlrCredito));
              //Str_ParametroVenda.Str_ParametroVendaC := Str_ParametroVenda.Str_ParametroVendaC+(strDesenhoDivisao.StrDesenhoDivisaoCupom)+'<l></l>';
              Writeln(F,(strDesenhoDivisao.StrDesenhoDivisaoCupom));

              CloseFile(F);
              
              //iRetorno:= iImprimirTexto_DUAL_DarumaFramework(Str_ParametroVenda.Str_ParametroVendaC+'<sl>05</sl><gui></gui>',0);

          end;//if confirma impressao

        finally

            lbl_edtCodBarras.Clear;
            lbl_edtDescricao.Clear;
            lbl_edtTotal.Text := '0,00';
            FreeAndNil(strNomeEmpr);
            FreeAndNil(strEnderecoEmpr);
            FreeAndNil(strNumeroEmpr);
            FreeAndNil(strBairroEmpr);
            FreeAndNil(strTelefoneEmpr);
            FreeAndNil(Str_ParametroVenda);
            FreeAndNil(strNomeProd);
            FreeAndNil(StrCodBarrasProd);
            FreeAndNil(StrVlrCredito);
            FreeAndNil(strDesenhoDivisao);
            FreeAndNil(StrData);
            FreeAndNil(StrHora);
            FreeAndNil(intConfirmaImpressaoCupom);
            ibDadosEmpresa.Close;
            ibConfig.Close;
            
        end;//try finally

      end;

      VK_F4 :begin

      frmBuscaProdutos.ShowModal;

      end;

      VK_F5 :begin

        frmVendasLoja.lbl_edtVlrUnit.Text := lbl_edtTotal.Text;
        frmVendasLoja.lbl_TrocaMercadoria.Caption := 'Troca';
        frmTrocaMercadoria.Close;

      end;

      //VK_F7 :begin

////////////////////////////////////////////////////////////////////////////////

    {  ConfirmaRecebimento := Application.MessageBox('Confirma o Recebimento','Recebimento de Troca',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

        if ConfirmaRecebimento = 6 Then begin

          SituacaoCliente := 'Pago';

          ValorDif := StringReplace(lbl_edtVlrDiferenca.Text,ThousandSeparator,'',[rfReplaceAll]);
          ValorDif := StringReplace(ValorDif,DecimalSeparator,'.',[rfReplaceAll]);
          if ValorDif  = '' Then
             ValorDif := '0';

////////////////////////////////////////////////////////////////////////////////

          if cboTipoPagto.ItemIndex = - 1 Then begin

            StringTipoPagamento        := ' ''0'',';

          end else begin

            IDTipoPagamento  := TClasseCombo( cboTipoPagto.Items.Objects[cboTipoPagto.ItemIndex] );
            StringTipoPagamento  := ' ''' + InttoStr( IDTipoPagamento.ID ) + ''',';

          end;

////////////////////////////////////////////////////////////////////////////////

          TrocaMercadoria := 'Sim';

          ibRecVendas.Close;
          ibRecVendas.SQL.Clear;
          ibRecVendas.SQL.Add('INSERT INTO TBLRECEBEVENDAS'
          + '(IDVENDA,TOTALVENDA,VLRPAGO,IDTIPOPAGTO,'
          + 'SITUACAOVENDA,TROCAMERCADORIA,DATA,HORA) values '
          + '(''' + IntToStr(IDVenda) + ''','
          + ' ''' + ValorDif + ''',''' + ValorDif + ''','
          + StringTipoPagamento
          + ' ''' + SituacaoCliente + ''','
          + ' ''' + TrocaMercadoria + ''','
          + ' ''' + FormatDateTime('mm-dd-yyyy',now) + ''','
          + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
          ibRecVendas.ExecSQL;
          Commit(ibRecVendas);

////////////////////////////////////////////////////////////////////////////////

          ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('SELECT IDSERVS FROM TBLSERVICOSVENDAS ORDER BY IDSERVS DESC');
          ibServsVenda.Open;

          IDServs := ibServsVenda.FieldByName('IDSERVS').AsInteger;

          ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
          + 'VLRTROCA = ''' + ValorDif + ''' WHERE IDSERVS=''' + IntToStr(IDServs) + '''');
          ibServsVenda.ExecSQL;
          Commit(ibServsVenda);
          
////////////////////////////////////////////////////////////////////////////////

          ibServsVendasCli.Close;
          ibServsVendasCli.SQL.Clear;
          ibServsVendasCli.SQL.Add('SELECT IDSERVSVENDA FROM TBLSERVICOSVENDASCLI ORDER BY IDSERVSVENDA DESC');
          ibServsVendasCli.Open;

          frmVendasLoja.lbl_CodVenda.Caption := IntToStr(ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger + 1);
          lbl_edtNumCupom.Text := IntToStr(ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger + 1);
          LimpaCampos;
          cboTipoPagto.ClearSelection;
          lbl_edtVlrDiferenca.Text  := '0,00';
          lbl_edtTotalRetirado.Text := '0,00';

          ibServsVenda.Close;

        end;//if confirma recebimento  }

////////////////////////////////////////////////////////////////////////////////

      //end;//begin

    end;//case

  end;//with

end;

procedure TfrmTrocaMercadoria.FormCreate(Sender: TObject);
begin
MontaColunas := True;
//MontaColProd := True;
end;

procedure TfrmTrocaMercadoria.lbl_edtCodBarrasChange(Sender: TObject);

begin

 { with dmModule do begin

    if lbl_edtCodBarras.Text <> '' Then begin

      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
      + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
      + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarras.Text + ''' or CADPRODUTOS.CODBARRASAD=''' + lbl_edtCodBarras.Text + '''');
      ibProdutos.Open;

      (ibProdutos.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat  := CasasDecimais('Produtos');

      lbl_edtNomeProd.Text := ibProdutos.FieldByName('NOME').AsString;
      lbl_edtVlrVenda.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
      lbl_edtCodProd.Text  := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);

    end;//if

  end;//with  }

end;

procedure TfrmTrocaMercadoria.lbl_edtCodBarrasExit(Sender: TObject);

//var

//Valor1,Valor2,Valor3 : Real;

begin

 { if lbl_edtVlrVendaTroca.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtVlrVendaTroca.Text)>0) and (lbl_edtVlrVendaTroca.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtVlrVendaTroca.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrVenda.Text,ThousandSeparator,'',[rfReplaceAll]));

      if Valor1 > Valor2 Then begin

        Valor3 := Valor1 - Valor2;

      end else begin

        Valor3 := Valor2 - Valor1;

      end;


      lbl_edtVlrDiferenca.Text := FormatFloat(',0.00',(Valor3));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtVlrVendaTroca.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrVenda.Text,ThousandSeparator,'',[rfReplaceAll]));

      if Valor1 > Valor2 Then begin

        Valor3 := Valor1 - Valor2;

      end else begin

        Valor3 := Valor2 - Valor1;

      end;

      lbl_edtVlrDiferenca.Text := FormatFloat(',0.00',(Valor3)); }

  //  end;{if}


//  end;{if}

end;

procedure TfrmTrocaMercadoria.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmTrocaMercadoria.lbl_edtQtdeRetiradaExit(Sender: TObject);

//var

//Valor1,Valor2,Valor3,Valor4,Valor5,ValorDiferenca :Real;

begin

{ if (lbl_edtNomeProd.Text <> '') Then begin

  if lbl_edtQtdeRetirada.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQtdeRetirada.Text)>0) and (lbl_edtQtdeRetirada.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtdeRetirada.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrVenda.Text,ThousandSeparator,'',[rfReplaceAll]));

      if lbl_edtTotalVenda.Text > '0,00' Then begin

        Valor3 := StrToFloat(StringReplace(lbl_edtTotalVenda.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtTotalVenda.Text := FormatFloat(',0.00',(Valor2 * Valor1 + Valor3));

      end else begin

        lbl_edtTotalVenda.Text := FormatFloat(',0.00',(Valor2 * Valor1));

      end; }
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////

    {end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtdeRetirada.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrVenda.Text,ThousandSeparator,'',[rfReplaceAll]));

      if lbl_edtTotalVenda.Text > '0,00' Then begin

        Valor3 := StrToFloat(StringReplace(lbl_edtTotalVenda.Text,ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtTotalVenda.Text := FormatFloat(',0.00',(Valor2 * Valor1 + Valor3));

      end else begin

        lbl_edtTotalVenda.Text := FormatFloat(',0.00',(Valor2 * Valor1));

      end; }

////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////


//    end;{if}

//  end;{if}

// end;{if cbo produto}


end;

procedure TfrmTrocaMercadoria.lbl_edtQtdeExit(Sender: TObject);

   var
    Valor1 :Real;
    Valor2 :Real;
    Valor3 :Real;
begin

 if (lbl_edtNomeProdTroca.Text <> '') Then begin

  if lbl_edtQtde.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQtde.Text)>0) and (lbl_edtQtde.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrVendaTroca.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      if lbl_edtTotalDevolvido.Text > '0,00' Then begin

        Valor3 := StrToFloat(StringReplace(lbl_edtTotalDevolvido.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtTotalDevolvido.Text := FormatFloat(',0.00',(Valor2 * Valor1 + Valor3));

      end else begin

        lbl_edtTotalDevolvido.Text := FormatFloat(',0.00',(Valor2 * Valor1));

      end;

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrVendaTroca.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      if lbl_edtTotalDevolvido.Text > '0,00' Then begin

        Valor3 := StrToFloat(StringReplace(lbl_edtTotalDevolvido.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
        lbl_edtTotalDevolvido.Text := FormatFloat(',0.00',(Valor2 * Valor1 + Valor3));

      end else begin

        lbl_edtTotalDevolvido.Text := FormatFloat(',0.00',(Valor2 * Valor1));

      end;
      
    end;{if}

  end;{if}

 end;{if cbo produto}


end;

procedure TfrmTrocaMercadoria.lbl_edtQtdeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 Then begin

lbl_edtTotalDevolvido.SetFocus;

end;

end;

procedure TfrmTrocaMercadoria.lbl_edtTotalDevolvidoExit(Sender: TObject);

var

QtdeEstoque,VlrProduto,ValorCustoE,QtdeVenda,QtdeVendaProd,ValorCustoProd  : Real;
VlrProdutoProd, Valor1, Valor2, Valor3 : Real;
TotalCustoProd,TrocaMercadoria,ValorTroca, strVendedor : String;
EstoqueFinal,TotalProdEstoque,TotalCusto,EstoqueFinalProd,TotalProdEstoqueProd : String;
IDProdQtdeEstoque, IDLocalEstoque : Integer;
ConfirmaDevolucao,IDProdTroca : Integer;
IDClassVendedor : TClasseCombo;

begin

  with dmModule do begin

  ConfirmaDevolucao := Application.MessageBox('Confirma a Devolução do Produto','Produto Devolvido para Troca',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaDevolucao = 6 Then begin

      if (lbl_edtCodProdTroca.Text <> '') Then begin

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,TBLENTRADAESTOQUEPROD.IDLOCAL,'
        + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
        + 'CADPRODUTOS.IDLOCAL As Estoque,CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.REF,'
        + 'CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS,CADPRODUTOS.CODBARRASAD FROM TBLENTRADAESTOQUEPROD '
        + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE CADPRODUTOS.IDPROD=''' + lbl_edtCodProdTroca.Text + '''');
        ibEntrProdEstoque.Open;


      {  ibProdutos.Close;
        ibProdutos.SQL.Clear;
        ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE IDPROD=''' + lbl_edtCodProdTroca.Text + '''');
        ibProdutos.Open;  }

        IDProdQtdeEstoque := ibEntrProdEstoque.FieldByName('IDPROD').AsInteger;
        //IDLocalEstoque    := ibProdutos.FieldByName('IDLOCAL').AsInteger;

        lbl_edtNomeProdTroca.Text := ibEntrProdEstoque.FieldByName('NomeProd').AsString;
        lbl_edtVlrVendaTroca.Text := FormatFloat(CasasDecimais('Produtos'),ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat);
        lbl_edtCodProdTroca.Text  := IntToStr(ibEntrProdEstoque.FieldByName('IDPROD').AsInteger);

     // end;  //ROTINA ABAIXO PARA SOMAR TOTAL DO ESTQUE E QUANTIDADE DO ESTOQUE

        //traz na variavel a qtde conf. prod da select identificado por id.
        QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
       // QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),DecimalSeparator,',',[rfReplaceAll]));

        QtdeVenda   := StrToFloat(StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        QtdeEstoque := QtdeEstoque + QtdeVenda;

        EstoqueFinal := StringReplace(FloattoStr(QtdeEstoque),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        EstoqueFinal := StringReplace(EstoqueFinal,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

        //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
        VlrProduto  := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        VlrProduto  := QtdeEstoque * VlrProduto;

        TotalProdEstoque := StringReplace(FloattoStr(VlrProduto),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        TotalProdEstoque := StringReplace(TotalProdEstoque,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);


        ValorCustoE := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        ValorCustoE := QtdeEstoque * ValorCustoE;

        TotalCusto := StringReplace(FloattoStr(ValorCustoE),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        TotalCusto := StringReplace(TotalCusto,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);


         //se houver registro ele atribui na alteracao o vlr da variavel

         if ibEntrProdEstoque.RecordCount > 0 Then begin

           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
           +'QUANTIDADE=''' + (EstoqueFinal) + ''','
           +'TOTALCUSTO=''' + TotalCusto + ''','
           +'VLRTOTAL=''' + (TotalProdEstoque) +  ''' WHERE IDPROD=''' + IntToStr(IDProdQtdeEstoque) + '''');
           ibEntrProdEstoque.ExecSQL;


           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,TBLENTRADAESTOQUEPROD.IDLOCAL,'
           + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
           + 'CADPRODUTOS.IDLOCAL As Estoque,CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.REF,'
           + 'CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS,CADPRODUTOS.CODBARRASAD FROM TBLENTRADAESTOQUEPROD '
           + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
           + 'WHERE CADPRODUTOS.IDPROD=''' + IntToStr(IDProdQtdeEstoque) + '''');
           ibEntrProdEstoque.Open;

           (ibEntrProdEstoque.FieldByName('VLRTOTAL')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
           (ibEntrProdEstoque.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat := CasasDecimais('Produtos');

         {end else begin


           QtdeVendaProd   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

           EstoqueFinalProd := StringReplace(FloattoStr(QtdeVendaProd),ThousandSeparator,'',[rfReplaceAll]);
           EstoqueFinalProd := StringReplace(EstoqueFinalProd,DecimalSeparator,'.',[rfReplaceAll]);

           //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
           VlrProdutoProd  := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           VlrProdutoProd  := QtdeVendaProd * VlrProdutoProd;

           TotalProdEstoqueProd := StringReplace(FloattoStr(VlrProdutoProd),ThousandSeparator,'',[rfReplaceAll]);
           TotalProdEstoqueProd := StringReplace(TotalProdEstoqueProd,DecimalSeparator,'.',[rfReplaceAll]);

           ValorCustoProd := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           ValorCustoProd := QtdeVendaProd * ValorCustoProd;

           TotalCustoProd := StringReplace(FloattoStr(ValorCustoProd),ThousandSeparator,'',[rfReplaceAll]);
           TotalCustoProd := StringReplace(TotalCustoProd,DecimalSeparator,'.',[rfReplaceAll]);

           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('INSERT INTO TBLENTRADAESTOQUEPROD'
           + '(IDPROD,QUANTIDADE,TOTALCUSTO,VLRTOTAL,CODBARRAS,IDLOCAL) values '
           + '(''' + IntToStr(IDProdQtdeEstoque) + ''','
           + ' ''' + EstoqueFinalProd + ''','
           + ' ''' + TotalCustoProd + ''','
           + ' ''' + TotalProdEstoqueProd + ''','
           + ' ''' + lbl_edtCodBarraTroca.Text + ''','
           + ' ''' + IntToStr(IDLocalEstoque) + ''')');
           ibEntrProdEstoque.ExecSQL;


           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,TBLENTRADAESTOQUEPROD.IDLOCAL,'
           + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
           + 'CADPRODUTOS.IDLOCAL As Estoque,CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.REF,'
           + 'CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO FROM TBLENTRADAESTOQUEPROD '
           + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
           + 'WHERE CADPRODUTOS.IDPROD=''' + lbl_edtCodProdTroca.Text + '''');
           ibEntrProdEstoque.Open;

           (ibEntrProdEstoque.FieldByName('VLRTOTAL')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
           (ibEntrProdEstoque.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat := CasasDecimais('Produtos');  }


         end;

////////////////////////////////////////////////////////////////////////////////

          if cboFunc.ItemIndex = -1 Then begin

            strVendedor     := ' ''0'',';

          end else begin
          
            IDClassVendedor := TClasseCombo(cboFunc.Items.Objects[cboFunc.ItemIndex]);
            strVendedor := ' ''' + InttoStr( IDClassVendedor.ID ) + ''',';

          end;

          ValorTroca := StringReplace(lbl_edtTotalDevolvido.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
          ValorTroca := StringReplace(ValorTroca,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
          if ValorTroca  = '' Then
             ValorTroca := '0';

          TrocaMercadoria := 'Sim';

          IDProdTroca := StrToInt(lbl_edtCodProdTroca.Text);


          ibRecVendas.Close;
          ibRecVendas.SQL.Clear;
          ibRecVendas.SQL.Add('INSERT INTO TBLRECEBEVENDAS'
          + '(VLRTROCA,OBSTROCA,IDVENDEDOR,IDPROD,'
          + 'TROCAMERCADORIA,DATA,HORA) values '
          + '(''' + ValorTroca + ''','
          + ' ''' + memoObsTroca.Text + ''','
          + strVendedor
          + ' ''' + IntToStr(IDProdTroca) + ''','
          + ' ''' + TrocaMercadoria + ''','
          + ' ''' + FormatDateTime('mm-dd-yyyy',now) + ''','
          + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
          ibRecVendas.ExecSQL;
          Commit(ibRecVendas);
          // + ' ''' + SituacaoCliente + ''','SituacaoCliente

         // lbl_edtTotal.Text := lbl_edtTotalDevolvido.Text;
////////////////////////////////////////////////////////////////////////////////

        if lbl_edtTotalDevolvido.Text <> '' Then begin// se for em branco executa rotina abaixo.

          if (Pos(',',lbl_edtTotalDevolvido.Text)>0) and (lbl_edtTotalDevolvido.Text <> '') Then begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotalDevolvido.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtTotal.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
            Valor3 := (Valor1)+(Valor2);

            lbl_edtTotal.Text := FormatFloat(',0.00',(Valor3));

          end else begin

            Valor1 := StrToFloat(StringReplace(lbl_edtTotalDevolvido.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
            Valor2 := StrToFloat(StringReplace(lbl_edtTotal.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
            Valor3 := (Valor1)+(Valor2);

            lbl_edtTotal.Text := FormatFloat(',0.00',(Valor3));

          end;

        end;//if

      end;//if label codprod

////////////////////////////////////////////////////////////////////////////////

    {  if lbl_edtRefTroca.Text <> '' Then begin

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,TBLENTRADAESTOQUEPROD.IDLOCAL,'
        + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
        + 'CADPRODUTOS.IDLOCAL As Estoque,CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.REF,'
        + 'CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS,CADPRODUTOS.CODBARRASAD FROM TBLENTRADAESTOQUEPROD '
        + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE CADPRODUTOS.REF=''' + lbl_edtRefTroca.Text + '''');
        ibEntrProdEstoque.Open;


        ibProdutos.Close;
        ibProdutos.SQL.Clear;
        ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE REF=''' + lbl_edtRefTroca.Text + '''');
        ibProdutos.Open;

        IDProdQtdeEstoque := ibProdutos.FieldByName('IDPROD').AsInteger;
        IDLocalEstoque    := ibProdutos.FieldByName('IDLOCAL').AsInteger;

        lbl_edtNomeProdTroca.Text := ibEntrProdEstoque.FieldByName('NomeProd').AsString;
        lbl_edtVlrVendaTroca.Text := FormatFloat(CasasDecimais('Produtos'),ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat);
        lbl_edtCodProdTroca.Text  := IntToStr(ibEntrProdEstoque.FieldByName('IDPROD').AsInteger);

     // end;  //ROTINA ABAIXO PARA SOMAR TOTAL DO ESTQUE E QUANTIDADE DO ESTOQUE

        //traz na variavel a qtde conf. prod da select identificado por id.
        QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
       // QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),DecimalSeparator,',',[rfReplaceAll]));

        QtdeVenda   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

        QtdeEstoque := QtdeEstoque + QtdeVenda;

        EstoqueFinal := StringReplace(FloattoStr(QtdeEstoque),ThousandSeparator,'',[rfReplaceAll]);
        EstoqueFinal := StringReplace(EstoqueFinal,DecimalSeparator,'.',[rfReplaceAll]);

        //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
        VlrProduto  := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

        VlrProduto  := QtdeEstoque * VlrProduto;

        TotalProdEstoque := StringReplace(FloattoStr(VlrProduto),ThousandSeparator,'',[rfReplaceAll]);
        TotalProdEstoque := StringReplace(TotalProdEstoque,DecimalSeparator,'.',[rfReplaceAll]);


        ValorCustoE := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

        ValorCustoE := QtdeEstoque * ValorCustoE;

        TotalCusto := StringReplace(FloattoStr(ValorCustoE),ThousandSeparator,'',[rfReplaceAll]);
        TotalCusto := StringReplace(TotalCusto,DecimalSeparator,'.',[rfReplaceAll]);


         //se houver registro ele atribui na alteracao o vlr da variavel

         if ibEntrProdEstoque.RecordCount > 0 Then begin

           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
           +'QUANTIDADE=''' + (EstoqueFinal) + ''','
           +'TOTALCUSTO=''' + TotalCusto + ''','
           +'VLRTOTAL=''' + (TotalProdEstoque) +  ''' WHERE IDPROD=''' + IntToStr(IDProdQtdeEstoque) + '''');
           ibEntrProdEstoque.ExecSQL;


           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
           + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
           + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,CADPRODUTOS.REF,'
           + 'CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS,CADPRODUTOS.CODBARRASAD FROM TBLENTRADAESTOQUEPROD '
           + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
           + 'WHERE CADPRODUTOS.REF=''' + lbl_edtRefTroca.Text + '''');
           ibEntrProdEstoque.Open;

           (ibEntrProdEstoque.FieldByName('VLRTOTAL')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
           (ibEntrProdEstoque.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat := CasasDecimais('Produtos');


         end else begin


           QtdeVendaProd   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

           EstoqueFinalProd := StringReplace(FloattoStr(QtdeVendaProd),ThousandSeparator,'',[rfReplaceAll]);
           EstoqueFinalProd := StringReplace(EstoqueFinalProd,DecimalSeparator,'.',[rfReplaceAll]);

           //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
           VlrProdutoProd  := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           VlrProdutoProd  := QtdeVendaProd * VlrProdutoProd;

           TotalProdEstoqueProd := StringReplace(FloattoStr(VlrProdutoProd),ThousandSeparator,'',[rfReplaceAll]);
           TotalProdEstoqueProd := StringReplace(TotalProdEstoqueProd,DecimalSeparator,'.',[rfReplaceAll]);

           ValorCustoProd := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           ValorCustoProd := QtdeVendaProd * ValorCustoProd;

           TotalCustoProd := StringReplace(FloattoStr(ValorCustoProd),ThousandSeparator,'',[rfReplaceAll]);
           TotalCustoProd := StringReplace(TotalCustoProd,DecimalSeparator,'.',[rfReplaceAll]);

           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('INSERT INTO TBLENTRADAESTOQUEPROD'
           + '(IDPROD,QUANTIDADE,TOTALCUSTO,VLRTOTAL,CODBARRAS,IDLOCAL) values '
           + '(''' + IntToStr(IDProdQtdeEstoque) + ''','
           + ' ''' + EstoqueFinalProd + ''','
           + ' ''' + TotalCustoProd + ''','
           + ' ''' + TotalProdEstoqueProd + ''','
           + ' ''' + lbl_edtCodBarraTroca.Text + ''','
           + ' ''' + IntToStr(IDLocalEstoque) + ''')');
           ibEntrProdEstoque.ExecSQL;


           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
           + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
           + 'CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS,CADPRODUTOS.CODBARRASAD,CADPRODUTOS.REF,'
           + 'CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO FROM TBLENTRADAESTOQUEPROD '
           + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
           + 'WHERE CADPRODUTOS.REF=''' + lbl_edtRefTroca.Text + '''');
           ibEntrProdEstoque.Open;

           (ibEntrProdEstoque.FieldByName('VLRTOTAL')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
           (ibEntrProdEstoque.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat := CasasDecimais('Produtos');


         end; }

    //  end;//if label codbarras

////////////////////////////////////////////////////////////////////////////////

    end else begin

  //  lbl_edtTotalDevolvido.Text := '0,00';

    end;//if confirma devolução

    LimpaCampos;

  end;//with

end;

procedure TfrmTrocaMercadoria.lbl_edtTotalDevolvidoKeyPress(
  Sender: TObject; var Key: Char);
begin

if key=#13 Then begin

//lbl_edtNomeProdTroca.Clear;
//lbl_edtQtde.Text := '1';
//lbl_edtCodBarraTroca.Clear;
//lbl_edtCodProdTroca.Clear;
//lbl_edtRefTroca.Clear;
//lbl_edtNomeProdTroca.Clear;
lbl_edtVlrVendaTroca.Text := '0,00';
lbl_edtCodBarraTroca.SetFocus;

end;

end;

procedure TfrmTrocaMercadoria.lbl_edtCodBarraTrocaKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 Then begin

lbl_edtQtde.SetFocus;
lbl_edtQtde.Text := '1';

end;

end;

procedure TfrmTrocaMercadoria.lbl_edtTotalRetiradoExit(Sender: TObject);

//var
//Valor1,Valor2,Valor3 : Real;

begin

{  if lbl_edtTotalRetirado.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtTotalRetirado.Text)>0) and (lbl_edtTotalRetirado.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtTotalRetirado.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtTotalDevolvido.Text,ThousandSeparator,'',[rfReplaceAll]));

      if Valor1 > Valor2 Then begin

        Valor3 := Valor1 - Valor2;

        lbl_edtVlrDiferenca.Text := FormatFloat(',0.00',(Valor3));

      end;


    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtTotalRetirado.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtTotalDevolvido.Text,ThousandSeparator,'',[rfReplaceAll]));

      if Valor1 > Valor2 Then begin

        Valor3 := Valor1 - Valor2;

        lbl_edtVlrDiferenca.Text := FormatFloat(',0.00',(Valor3));

      end; }

  // end;{if}

 // end;{if}

end;

procedure TfrmTrocaMercadoria.lbl_edtTotalVendaExit(Sender: TObject);

//var

//Valor1,Valor2,Valor3 : Real;

begin

{  if lbl_edtTotalVenda.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtTotalVenda.Text)>0) and (lbl_edtTotalVenda.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtTotalVenda.Text,ThousandSeparator,'',[rfReplaceAll]));

        if lbl_edtTotalRetirado.Text > '0,00' Then begin

          Valor2 := StrToFloat(StringReplace(lbl_edtTotalRetirado.Text,ThousandSeparator,'',[rfReplaceAll]));

          Valor3:= Valor1 + Valor2;

          lbl_edtTotalRetirado.Text := FormatFloat(',0.00',(Valor3));

        end else begin

          lbl_edtTotalRetirado.Text := FormatFloat(',0.00',(Valor1));

        end;//if

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtTotalVenda.Text,ThousandSeparator,'',[rfReplaceAll]));

        if lbl_edtTotalRetirado.Text > '0,00' Then begin

          Valor2 := StrToFloat(StringReplace(lbl_edtTotalRetirado.Text,ThousandSeparator,'',[rfReplaceAll]));

          Valor3:= Valor1 + Valor2;

          lbl_edtTotalRetirado.Text := FormatFloat(',0.00',(Valor3));

        end else begin

          lbl_edtTotalRetirado.Text := FormatFloat(',0.00',(Valor1));

        end;//if }

   // end;{if}

 // end;{if}

end;

procedure TfrmTrocaMercadoria.cboTipoPagtoClick(Sender: TObject);
begin
lbl_edtTotalRetiradoExit(Sender);
end;

procedure TfrmTrocaMercadoria.lbl_edtRefTrocaExit(Sender: TObject);
begin

  with dmModule do begin

      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE REF=''' + lbl_edtRefTroca.Text + '''');
      ibProdutos.Open;

      lbl_edtNomeProdTroca.Text := ibProdutos.FieldByName('NOME').AsString;
      lbl_edtVlrVendaTroca.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
      lbl_edtCodProdTroca.Text  := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);
      lbl_edtCodBarraTroca.Text := ibProdutos.FieldByName('CODBARRAS').AsString;
     // lbl_edtQtdeExit(Sender);

  end;//with

end;

procedure TfrmTrocaMercadoria.lbl_edtRefExit(Sender: TObject);
begin

 { with dmModule do begin

      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE REF=''' + lbl_edtRef.Text + '''');
      ibProdutos.Open;

      lbl_edtNomeProd.Text := ibProdutos.FieldByName('NOME').AsString;
      lbl_edtVlrVenda.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
      lbl_edtCodProd.Text  := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);

  end;//with  }
  
end;

procedure TfrmTrocaMercadoria.lbl_edtRefTrocaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtQtde.SetFocus;

  end;//if

end;

procedure TfrmTrocaMercadoria.cboFuncKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    memoObsTroca.SetFocus;

  end;

end;

end.
