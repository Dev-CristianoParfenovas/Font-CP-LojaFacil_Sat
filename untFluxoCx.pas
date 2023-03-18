unit untFluxoCx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IBEAntialiasButton, ExtCtrls, Grids, DBGrids,
  classComboBox, IBQuery, DB, Mask, mxFlatControls, RxGIF;

type
  TfrmFluxoCx = class(TForm)
    dbgLoja: TDBGrid;
    ibeabSair: TIBEAntialiasButton;
    lbl_edtTotalLoja: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    dtpDataIniLoja: TDateTimePicker;
    dtpDataFimLoja: TDateTimePicker;
    dtpDataIniGeral: TDateTimePicker;
    Label5: TLabel;
    dtpDataFimGeral: TDateTimePicker;
    Label6: TLabel;
    lbl_edtTotalCx: TLabeledEdit;
    lbl_edtTotalTroco: TLabeledEdit;
    lbl_edtSubTotal: TLabeledEdit;
    lbl_Igual: TLabel;
    lbl_Menos: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_edtVendaConvenio: TLabeledEdit;
    dtpDataIniConvenio: TDateTimePicker;
    dtpDataFimConvenio: TDateTimePicker;
    dtpDataIniProd: TDateTimePicker;
    dtpDataFimProd: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    lbl_edtTotalCusto: TLabeledEdit;
    Label9: TLabel;
    lbl_edtTotalVenda: TLabeledEdit;
    Label10: TLabel;
    lbl_edtTotalLucro: TLabeledEdit;
    mxFlatFormTitle1: TmxFlatFormTitle;
    mxFlatFormTitle2: TmxFlatFormTitle;
    lbl_edtSangria: TLabeledEdit;
    Label11: TLabel;
    lbl_edtTotalPeriodo: TLabeledEdit;
    Label12: TLabel;
    Bevel1: TBevel;
    cboEstoque: TComboBox;
    lbl_Estoque: TLabel;
    lbl_edtTotalAPagar: TLabeledEdit;
    lbl_edtTotalLiq: TLabeledEdit;
    Label13: TLabel;
    Label14: TLabel;
    lbl_Sair: TLabel;
    cboFuncionario: TComboBox;
    lbl_Func: TLabel;
    ibeaLimparCampo: TIBEAntialiasButton;
    Bevel2: TBevel;
    mxFlatFormTitle3: TmxFlatFormTitle;
    imgFundoFluxoCx: TImage;

    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTEstoque;
    procedure ExecSELECTTProd;
    procedure ExecSELECTTipoPagto;
    procedure ibeabSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpDataFimLojaChange(Sender: TObject);
    procedure dtpDataFimGeralChange(Sender: TObject);
    procedure dbgLojaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dtpDataFimConvenioChange(Sender: TObject);
    procedure dtpDataFimProdChange(Sender: TObject);
    procedure ibeaLimparCampoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  frmFluxoCx: TfrmFluxoCx;
  ClassTipoProd : TClasseCombo;//para select do tipo de produto
  IDTipoPagto : TClasseCombo;//para select do tipo de pagto.
  MontaCol : Boolean;//para montar o grid do servico de loja.
//  ibTempVendaLoja : TIBQuery;
  ibTempProd : TIBQuery;
  ClassEstoque : TClasseCombo;//paraselect do estoque.

  //variaveis para o fluxo de cx
  NomeEstoque : String;
  PathSistema : String;

  ValorB : Real;
  TotalB : String;
  ValorC : Real;
  TotalC : String;
  ValorGeral : Real;

  ValorB1 : Real;
  TotalB1 : String;
  ValorC1 : Real;
  TotalC1 : String;
  ValorGeral1 : Real;

  ValorB2 : Real;
  TotalB2 : String;
  ValorC2 : Real;
  TotalC2 : String;
  ValorGeral2 : Real;

  TotalBC : Real;
  TotalB1C1 : Real;
  TotalB2C2 : Real;

  ValorGeralLoja : Real;
  ValorTotalLoja : String;

implementation

uses untdmModule, funcPosto;

{$R *.dfm}

procedure TfrmFluxoCx.Commit(IBQueryExec : TIBQuery);

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


procedure TfrmFluxoCx.ExecSELECTEstoque;

begin

  with dmModule do begin

    ibEstoque.Close;
    ibEstoque.SQL.Clear;
    ibEstoque.SQL.Add('SELECT * FROM LOCALESTOCAGEM');
    ibEstoque.Open;

    cboEstoque.Clear;

    while not ibEstoque.Eof do begin

      ClassEstoque := TClasseCombo.Create;
      ClassEstoque.ID := ibEstoque.FieldByName('IDESTOQUE').AsInteger;
      cboEstoque.Items.AddObject(ibEstoque.FieldByName('NOME').AsString,ClassEstoque);
      ibEstoque.Next;

    end;{while}


  end;{with}


end;

procedure TfrmFluxoCx.ExecSELECTTProd;
begin

{  with dmModule do begin

    ibTipoProd.Close;
    ibTipoProd.SQL.Clear;
    ibTipoProd.SQL.Add('SELECT * FROM TBLTIPOPRODUTO');
    ibTipoProd.Open;

    //traz dados do funcionario no combo
    cboTipoProduto.Clear; //LIMPA O COMBOBOX

    while not ibTipoProd.Eof do begin

      ClassTipoProd    := TClasseCombo.Create;
      ClassTipoProd.ID  := ibTipoProd.FieldByName('IDTIPOPROD').AsInteger;
      cboTipoProduto.Items.AddObject(ibTipoProd.FieldByName('NOME').AsString,ClassTipoProd);
      ibTipoProd.Next;  }

  //  end; {while}

//  end; {with}

end;

procedure TfrmFluxoCx.ExecSELECTTipoPagto;

begin

{jk  with dmModule do begin

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

  //  end;{while}

 // end;{with}

end;

procedure TfrmFluxoCx.ibeabSairClick(Sender: TObject);

begin
  Close;
end;

procedure TfrmFluxoCx.FormShow(Sender: TObject);
begin

  //dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
//  dtpDataFim.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataIniLoja.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFimLoja.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataIniGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFimGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataIniConvenio.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFimConvenio.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataIniProd.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFimProd.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  lbl_edtTotalLoja.Text := '0,00';
  ValorGeralLoja := 0;
  ValorB := 0;
  ValorC := 0;

  with dmModule do begin

    ExecSELECTTProd;
    ExecSELECTTipoPagto;
    ExecSELECTEstoque;

    //Adiciona as Colunas com os dados do Clientes
    with dbgLoja do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaCol Then begin

         DataSource := dmModule.dtsServsVenda;

        //determina as colunas a serem montadas 0 codigo cliente, 1 razao Social, 2 endereço numero...
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);
        Columns.Insert(5);
        Columns.Insert(6);
       // Columns.Insert(7);

        //Parametros da Coluna que exibe o Nome do cliente.
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'Produto';
        Columns.Items[0].Width         := 180;
        Columns.Items[0].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[1].Title.Caption := 'Vlr.Pago';
        Columns.Items[1].FieldName     := 'VLRPAGO';
        Columns.Items[1].Width         := 80;
        Columns.Items[1].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[2].Title.Caption := 'Troco';
        Columns.Items[2].FieldName     := 'TROCO';
        Columns.Items[2].Width         := 80;
        Columns.Items[2].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[3].Title.Caption := 'Vlr.Total';
        Columns.Items[3].FieldName     := 'TOTALVENDA';
        Columns.Items[3].Width         := 80;
        Columns.Items[3].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
     {   Columns.Items[5].Title.Caption := 'Tipo Pagto.';
        Columns.Items[5].FieldName     := 'DESCRICAO';
        Columns.Items[5].Width         := 150;
        Columns.Items[5].Alignment     := taLeftJustify;  }

       // Parametros que exibe o compl. do cliente
        Columns.Items[4].Title.Caption := 'Data';
        Columns.Items[4].FieldName     := 'DATA';
        Columns.Items[4].Width         := 70;
        Columns.Items[4].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[5].Title.Caption := 'Hora';
        Columns.Items[5].FieldName     := 'HORA';
        Columns.Items[5].Width         := 70;
        Columns.Items[5].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do cliente.
        Columns.Items[6].Title.Caption := 'Tipo de Compromisso';
        Columns.Items[6].FieldName     := 'Compromisso';
        Columns.Items[6].Width         := 150;
        Columns.Items[6].Alignment     := taLeftJustify;


        MontaCol := False;

      end; {if}

    end; {with do db grid}
////////////////////////////////////////////////////////////////////////////////


  end;{with}

end;

procedure TfrmFluxoCx.FormCreate(Sender: TObject);
begin

  MontaCol := True;

  // PathSistema := ExtractFilePath(ParamStr(0));

//  if FileExists(PathSistema + 'Data\RunTime\imagens\FundoFluxoCx.gif') Then
//    imgFundoFluxoCx.Picture.LoadFromFile(PathSistema + 'Data\RunTime\imagens\FundoFluxoCx.gif');

end;

procedure TfrmFluxoCx.dtpDataFimLojaChange(Sender: TObject);

begin

  with dmModule do begin

  //  ibTempVendaLoja := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL
   //   with ibTempVendaLoja do begin

        //BUSCA TODOS OS PRODUTOS QUE ESTEJAM NA CLASSIFICAÇÃO DE PRODUTOS
    //    ibTempVendaLoja.Database := IBDGeral; //ATRIBUI O DATABASE DO IBGERAL PRA LOCALIZAR O BANCO DE DADOS

       if cboEstoque.ItemIndex = - 1 Then begin

         Application.MessageBox('Atenção, é necessário selecionar um estoque?','Notificação:Selecionar Estoque',MB_OK+MB_ICONQUESTION);

       end else begin

        // IDClassEstoque := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
         NomeEstoque := cboEstoque.Text;


     //  end;{if}

        Commit(ibTempVendaLoja);
        ibTempVendaLoja.Close;
        ibTempVendaLoja.SQL.Clear;
        ibTempVendaLoja.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE ESTOQUE='''+ NomeEstoque + ''' and TIPOVENDA=''A Vista''and(DATA between :ParamDataInicial and :ParamDataFinal)');
        ibTempVendaLoja.Open;


        ibTempVendaLoja.Close;
        ibTempVendaLoja.ParamByName('ParamDataInicial').Value := dtpDataIniLoja.DateTime;
        ibTempVendaLoja.ParamByName('ParamDataFinal').Value := dtpDataFimLoja.DateTime;
        ibTempVendaLoja.Open;

       (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       end;{if}

      //  if ibTempVendaLoja.RecordCount > 0 Then begin

      //

      //  end;{if}

     // end;{with temporario}
/////////////////////////////////////////////////////////////////////////////////

    while not ibTempVendaLoja.Eof do begin//enquanto nao for fim de registro

          if (ValorGeralLoja = 0) and (ValorB = 0) and (ValorC = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeralLoja := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            ValorB := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            ValorC := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalLoja := StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            TotalB := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            TotalC := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]);


            //atribui a variavel o valor separando por ponto
            ValorGeralLoja := ValorGeralLoja + StrtoFloat(StringReplace(ValorTotalLoja,ThousandSeparator,'',[rfReplaceAll]));

            ValorB := ValorB + StrToFloat(StringReplace(TotalB,ThousandSeparator,'',[rfReplaceAll]));

            ValorC := ValorC + StrToFloat(StringReplace(TotalC,ThousandSeparator,'',[rfReplaceAll]));

           end;{if}

           TotalBC := ValorB + ValorC;

            if (TotalBC = 0)  Then begin

              ValorGeral :=  ValorGeralLoja;

            end else begin

              ValorGeral := TotalBC + ValorGeralLoja;


            end;


          ibTempVendaLoja.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}

       if lbl_edtTotalLoja.Text = '0,00' Then begin

       lbl_edtTotalLoja.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeral);

      end;
/////////////////////////////////////////////////////////////////////////////////

  end;{with}

end;

procedure TfrmFluxoCx.dtpDataFimGeralChange(Sender: TObject);

var

//ibTempVendas : TIBQuery;

ValorCx    : Real;
ValorTroco : Real;
ValorVenda : Real;
ValorSangria,VlrSubTotal : Real;
GeralCx :  String;
GeralTroco : String;
GeralVenda : String;
GeralSangria, TipoSaida : String;
LocalEstoque : String;

begin

  with dmModule do begin

    Commit(ibRecVendas);
    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS');
    ibRecVendas.Open;


    if cboEstoque.ItemIndex = - 1 Then begin

     Application.MessageBox('Atenção, é necessário selecionar um estoque?','Notificação:Selecionar Estoque',MB_OK+MB_ICONQUESTION);

    end else begin

    // IDClassEstoque := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
     NomeEstoque := cboEstoque.Text;

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.IDAGCOMPR,TBLTIPOCOMPROMISSO.NOME As Compromisso,'
      + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,'
      + 'CADPRODUTOS.NOME As Produto,TBLRECEBEVENDAS.VLRPAGO,'
      + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDRECEBEVENDAS '
      + 'WHERE(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) and  TBLSERVICOSVENDAS.ESTOQUE=''' + NomeEstoque + '''');
      ibServsVenda.Open;   // TBLSERVICOSVENDAS.ESTOQUE=''' + LocalEstoque + ''' OR

                                                             //   OR TBLSERVICOSVENDAS.TIPOVENDA=''A Vista''
      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibServsVenda.Open;

     (ibServsVenda.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('TOTALVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('TROCO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VLRSANGRIA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

    end;{if}

////////////////////////////////////////////////////////////////////////////////

      while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

        if (ValorCx = 0) and (ValorTroco = 0) and (ValorVenda = 0) and (ValorSangria = 0) Then begin//se variavel for igual a zero

          //atribui o vlr do campo abaixo na variavel
          ValorCx    := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
          ValorTroco := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('TROCO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
          ValorVenda := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          ValorSangria := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRSANGRIA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

        end else begin

          //atribui na variavel substituindo o ponto para vlr em branco
          GeralCx := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
          GeralTroco := StringReplace(FloattoStr(ibServsVenda.FieldByName('TROCO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
          GeralVenda := StringReplace(FloattoStr(ibServsVenda.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]);


          //atribui a variavel o valor separando por ponto
          ValorCx := ValorCx + StrtoFloat(StringReplace(GeralCx,ThousandSeparator,'',[rfReplaceAll]));
          ValorTroco := ValorTroco + StrtoFloat(StringReplace(GeralTroco,ThousandSeparator,'',[rfReplaceAll]));
          ValorVenda := ValorVenda + StrtoFloat(StringReplace(GeralVenda,ThousandSeparator,'',[rfReplaceAll]));


        GeralSangria := StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRSANGRIA').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
        ValorSangria := ValorSangria + StrToFloat(StringReplace(GeralSangria,ThousandSeparator,'',[rfReplaceAll]));
        VlrSubTotal  :=   ValorVenda - ValorSangria;
      //  end;


        end;{if}

        ibServsVenda.Next;//vai para o proximo registro pro looping nao ficar infinito.

      end;{while}

     lbl_edtTotalCx.Text := FormatFloat(CasasDecimais('Produtos'),ValorCx);
     lbl_edtTotalTroco.Text := FormatFloat(CasasDecimais('Produtos'),ValorTroco);
     lbl_edtSubTotal.Text := FormatFloat(CasasDecimais('Produtos'),ValorVenda);
     lbl_edtSangria.Text := FormatFloat(CasasDecimais('Produtos'),ValorSangria);
     lbl_edtTotalPeriodo.Text := FormatFloat(CasasDecimais('Produtos'),VlrSubTotal);

  end;{with}

end;

procedure TfrmFluxoCx.dbgLojaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

{  with dmModule do begin
    //SEGUNDA FORMA DE FAZER UMA DBGRID FICAR COLOCRIDA
    If (dbgLoja.DataSource.DataSet.RecNo div 2) =
  (dbgLoja.DataSource.DataSet.RecNo/2) Then begin

      dbgLoja.Canvas.Font.Color:= clBlack;
      dbgLoja.Canvas.Brush.Color:= clskyBlue;

    end else begin

      dbgLoja.Canvas.Font.Color:= clBlack;
      dbgLoja.Canvas.Brush.Color:= clWhite;

    end;

        dbgLoja.Canvas.FillRect(Rect);

  //    if Column.Field.DataType = ftFloat  Then begin


  //dbgConsultaAg.Canvas.TextOut(Rect.Left+2,Rect.Top,FormatFloat(CasasDecimais('Produtos'), Column.Field.AsFloat));
  //    end else begin


  dbgLoja.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString); }

    //  end;{if}
//  end;{with}

end;


procedure TfrmFluxoCx.dtpDataFimConvenioChange(Sender: TObject);

var

ValorGeralLoja : Real;
ValorTotalLoja : String;

begin

  with dmModule do begin

  //  ibTempVendaLoja := TIBQuery.Create(Self); //CRIA O COMPONENTE NO FORMULARIO ATUAL
   //   with ibTempVendaLoja do begin

        //BUSCA TODOS OS PRODUTOS QUE ESTEJAM NA CLASSIFICAÇÃO DE PRODUTOS
    //    ibTempVendaLoja.Database := IBDGeral; //ATRIBUI O DATABASE DO IBGERAL PRA LOCALIZAR O BANCO DE DADOS


        Commit(ibTempVendaLoja);
        ibTempVendaLoja.Close;
        ibTempVendaLoja.SQL.Clear;
        ibTempVendaLoja.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE TIPOVENDA=''Convenio'' and (DATA between :ParamDataInicial and :ParamDataFinal)');
        ibTempVendaLoja.Open;                      


        ibTempVendaLoja.Close;
        ibTempVendaLoja.ParamByName('ParamDataInicial').Value := dtpDataIniConvenio.DateTime;
        ibTempVendaLoja.ParamByName('ParamDataFinal').Value := dtpDataFimConvenio.DateTime;
        ibTempVendaLoja.Open;

       (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      //  if ibTempVendaLoja.RecordCount > 0 Then begin

      //

      //  end;{if}

     // end;{with temporario}
/////////////////////////////////////////////////////////////////////////////////

    while not ibTempVendaLoja.Eof do begin//enquanto nao for fim de registro

          if (ValorGeralLoja = 0) and (ValorB1 = 0) and (ValorC1 = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeralLoja := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            ValorB1 := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            ValorC1 := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalLoja := StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            TotalB1 := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            TotalC1 := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]);


            //atribui a variavel o valor separando por ponto
            ValorGeralLoja := ValorGeralLoja + StrtoFloat(StringReplace(ValorTotalLoja,ThousandSeparator,'',[rfReplaceAll]));

            ValorB1 := ValorB1 + StrToFloat(StringReplace(TotalB1,ThousandSeparator,'',[rfReplaceAll]));

            ValorC1 := ValorC1 + StrToFloat(StringReplace(TotalC1,ThousandSeparator,'',[rfReplaceAll]));

          end;{if}


           TotalB1C1 := ValorB1 + ValorC1;

            if (TotalB1C1 = 0)  Then begin

              ValorGeral1 :=  ValorGeralLoja;

            end else begin

              ValorGeral1 := TotalB1C1 + ValorGeralLoja;


            end;


          ibTempVendaLoja.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}

       lbl_edtVendaConvenio.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeral1);

/////////////////////////////////////////////////////////////////////////////////

  end;{with}


end;

procedure TfrmFluxoCx.dtpDataFimProdChange(Sender: TObject);

var

ibTempProdValor : TIBQuery;
ValorGeralLoja,ValorGeralCusto,ValorGeralAPagar : Real;
ValorTotalLoja,ValorTotalCusto,Lucro,TotalAPagar,TotalLiq : String;


begin

  with dmModule do begin

    ibTempProdValor := TIBQuery.Create(Self);

    with ibTempProdValor do begin

      ibTempProdValor.Database := IBDGERAL;

     if cboEstoque.ItemIndex = - 1 Then begin

       Application.MessageBox('Atenção, é necessário selecionar um estoque?','Notificação:Selecionar Estoque',MB_OK+MB_ICONQUESTION);

     end else begin

        // IDClassEstoque := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
       NomeEstoque := cboEstoque.Text;


      ibTempProdValor.SQL.CLear;
      ibTempProdValor.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE ESTOQUE='''+ NomeEstoque + ''' and (DATA between :ParamDataInicial and :ParamDataFinal)');
      ibTempProdValor.Open;


      ibTempProdValor.Close;
      ibTempProdValor.ParamByName('ParamDataInicial').Value := dtpDataIniProd.DateTime;
      ibTempProdValor.ParamByName('ParamDataFinal').Value := dtpDataFimProd.DateTime;
      ibTempProdValor.Open;

      (ibTempProdValor.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempProdValor.FieldByName('TOTALCUSTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempProdValor.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempProdValor.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     end;{if}

    end;{with temporario}

    ibAPagar.Close;
    ibAPagar.SQL.Clear;
    ibAPagar.SQL.Add('SELECT * FROM TBLCONTASAPAGAR WHERE (DTVENCTO between :ParamDataInicial and :ParamDataFinal)');
    ibAPagar.Open;

    ibAPagar.Close;
    ibAPagar.ParamByName('ParamDataInicial').Value := dtpDataIniProd.DateTime;
    ibAPagar.ParamByName('ParamDataFinal').Value := dtpDataFimProd.DateTime;
    ibAPagar.Open;


    while not ibTempProdValor.Eof do begin//enquanto nao for fim de registro
////////////////////////////////////////////////////////////////////////////////

          if (ValorGeralLoja = 0) and (ValorB2 = 0) and (ValorC2 = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeralLoja := StrtoFloat(StringReplace(FloattoStr(ibTempProdValor.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            ValorB2 := StrToFloat(StringReplace(FloatToStr(ibTempProdValor.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            ValorC2 := StrToFloat(StringReplace(FloatToStr(ibTempProdValor.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalLoja := StringReplace(FloattoStr(ibTempProdValor.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            TotalB2 := StringReplace(FloatToStr(ibTempProdValor.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            TotalC2 := StringReplace(FloatToStr(ibTempProdValor.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]);


            //atribui a variavel o valor separando por ponto
            ValorGeralLoja := ValorGeralLoja + StrtoFloat(StringReplace(ValorTotalLoja,ThousandSeparator,'',[rfReplaceAll]));

            ValorB2 := ValorB2 + StrToFloat(StringReplace(TotalB2,ThousandSeparator,'',[rfReplaceAll]));

            ValorC2 := ValorC2 + StrToFloat(StringReplace(TotalC2,ThousandSeparator,'',[rfReplaceAll]));

          end;{if}


           TotalB2C2 := ValorB2 + ValorC2;

            if (TotalB2C2 = 0)  Then begin

              ValorGeral2 :=  ValorGeralLoja;

            end else begin

              ValorGeral2 := TotalB2C2 + ValorGeralLoja;


            end;

/////////////////////////////////////////////////////////////////////////////////

          if ValorGeralCusto = 0 Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeralCusto := StrtoFloat(StringReplace(FloattoStr(ibTempProdValor.FieldByName('TOTALCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalCusto := StringReplace(FloattoStr(ibTempProdValor.FieldByName('TOTALCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorGeralCusto := ValorGeralCusto + StrtoFloat(StringReplace(ValorTotalCusto,ThousandSeparator,'',[rfReplaceAll]));

          end;{if}

           Lucro := FormatFloat(Casasdecimais('Produtos'),ValorGeral2 - ValorGeralCusto);
////////////////////////////////////////////////////////////////////////////////
          ibTempProdValor.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}

       lbl_edtTotalVenda.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeral2);
       lbl_edtTotalCusto.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeralCusto);
       lbl_edtTotalLucro.Text := Lucro;

    while not ibAPagar.Eof do begin

    if ValorGeralAPagar = 0 Then begin

    ValorGeralAPagar := StrtoFloat(StringReplace(FloattoStr(ibAPagar.FieldByName('VLREMITIDO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

    end else begin

    TotalAPagar := StringReplace(FloattoStr(ibAPagar.FieldByName('VLREMITIDO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

    ValorGeralAPagar := ValorGeralAPagar + StrtoFloat(StringReplace(TotalAPagar,ThousandSeparator,'',[rfReplaceAll]));

    end;{if}

    TotalLiq := FormatFloat(Casasdecimais('Produtos'),StrtoFloat(StringReplace(Lucro,ThousandSeparator,'',[rfReplaceAll])) - ValorGeralAPagar);

    ibAPagar.Next;

    end;{while}

    lbl_edtTotalAPagar.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeralAPagar);
    lbl_edtTotalLiq.Text    := TotalLiq;

  end;{with}

end;

procedure TfrmFluxoCx.ibeaLimparCampoClick(Sender: TObject);
begin
  cboFuncionario.ClearSelection;
end;

end.
