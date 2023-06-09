unit untPedidosLoja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, IBQuery,
  Buttons, ComCtrls, Data.DB;

type
  TfrmPedidosLoja = class(TForm)
    dbgPedidoLoja: TDBGrid;
    lbl_edtNomerazao: TLabeledEdit;
    lbl_edtNumPedido: TLabeledEdit;
    lbl_edtCodCli: TLabeledEdit;
    lbl_F2: TLabel;
    lbl_F3: TLabel;
    lbl_edtIDVenda: TLabeledEdit;
    lbl_F4: TLabel;
    ibeaIncluir: TSpeedButton;
    ibeaSair: TSpeedButton;
    dtpDataIni: TDateTimePicker;
    dtpDataF: TDateTimePicker;
    lbl_DataIni: TLabel;
    lbl_DataF: TLabel;
    lbl_IDFunc: TLabel;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTPedidos;
    procedure DeletarPedido;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_edtNomerazaoKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtNumPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtNumPedidoExit(Sender: TObject);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure lbl_edtNomerazaoExit(Sender: TObject);
    procedure dbgPedidoLojaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPedidoLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPedidoLojaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl_edtIDVendaKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDataFChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidosLoja: TfrmPedidosLoja;
  MontaColunas : Boolean;
  CodigoCliente : Integer;
implementation

uses untdmModule, untServicos, funcPosto;

{$R *.dfm}

procedure TfrmPedidosLoja.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPedidosLoja.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmPedidosLoja.ExecSELECTPedidos;

begin

  with dmModule do begin


    Commit(ibDetalhePosVenda);
    ibDetalhePosVenda.Close;
    ibDetalhePosVenda.SQL.Clear;
    ibDetalhePosVenda.SQL.Add('SELECT * FROM TBLDETALHEPOSVENDA WHERE(TBLDETALHEPOSVENDA.DATA between :ParamDataIni and :ParamDataF)AND TBLDETALHEPOSVENDA.PAGTO=''0'' ORDER BY IDDETALHEPOSVENDA DESC');
    ibDetalhePosVenda.Open;

    ibDetalhePosVenda.Close;
    ibDetalhePosVenda.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
    ibDetalhePosVenda.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
    ibDetalhePosVenda.Open;

    (ibDetalhePosVenda.FieldByName('TOTALVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

    {Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,'
    + 'TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,'
    + 'TBLUSER.NOME As Vendedor FROM TBLSERVICOSVENDAS '
   // + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
    //+ 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
    + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOSVENDAS.IDVENDEDOR=TBLUSER.IDUSER '
    + 'WHERE TBLSERVICOSVENDAS.POSVENDA=''Pendente''');
    ibServsVenda.Open;  }

  end;//with TBLCADASTRO.NOME As Cliente,

end;

procedure TfrmPedidosLoja.DeletarPedido;

var
ConfirmaExclusao,IDProdutoDevolucao : Integer;
VlrProdutoDevolve,QtdeEstoqueDevolve,QtdeVendaDevolve,ValorCustoDevolve : Real;
EstoqueFinalDevolve,TotalProdEstoqueDevolve,TotalCustoDevolve : String;

begin

  with dmModule do begin

    ConfirmaExclusao := Application.MessageBox('Confirma e Exclus�o do Pedido?','Excluir Pedido',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 then begin

////////////////////////////////////////////////////////////////////////////////
  //ROTINA PARA CONTROLE DE ESTOQUE

////////////////////////////////////////////////////////////////////////////////
        Commit(ibServsVenda);
        ibServsVenda.Close;
        ibServsVenda.SQL.Clear;
        ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE IDSERVSVENDA=''' + lbl_edtIDVenda.Text + '''');
        ibServsVenda.Open;

        while not ibServsVenda.Eof do begin

        IDProdutoDevolucao := ibServsVenda.FieldByName('IDPROD').AsInteger;

        QtdeVendaDevolve   := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('QTDE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
        + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
        + 'CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD FROM TBLENTRADAESTOQUEPROD '
        + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + IntToStr(IDProdutoDevolucao) + '''');
        ibEntrProdEstoque.Open;

      //ROTINA ABAIXO PARA SOMAR TOTAL DO ESTQUE E QUANTIDADE DO ESTOQUE

      //traz na variavel a qtde conf. prod da select identificado por id.
       QtdeEstoqueDevolve := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
     // QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),DecimalSeparator,',',[rfReplaceAll]));

     // QtdeVendaDevolve   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

       QtdeEstoqueDevolve := QtdeEstoqueDevolve + QtdeVendaDevolve;

       EstoqueFinalDevolve := StringReplace(FloattoStr(QtdeEstoqueDevolve),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
       EstoqueFinalDevolve := StringReplace(EstoqueFinalDevolve,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

      //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
       VlrProdutoDevolve  := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

       VlrProdutoDevolve  := QtdeEstoqueDevolve * VlrProdutoDevolve;

       TotalProdEstoqueDevolve := StringReplace(FloattoStr(VlrProdutoDevolve),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
       TotalProdEstoqueDevolve := StringReplace(TotalProdEstoqueDevolve,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);


       ValorCustoDevolve := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

       ValorCustoDevolve := QtdeEstoqueDevolve * ValorCustoDevolve;

       TotalCustoDevolve := StringReplace(FloattoStr(ValorCustoDevolve),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
       TotalCustoDevolve := StringReplace(TotalCustoDevolve,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

       //ROTINA PARA O ESTOQUE MINIMO
       if ibEntrProdEstoque.RecordCount > 0 Then begin

         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
         +'TOTALCUSTO=''' + TotalCustoDevolve + ''','
         +'VLRTOTAL=''' + (TotalProdEstoqueDevolve) +  ''','
         +'QUANTIDADE=''' + (EstoqueFinalDevolve) + ''' WHERE IDPROD=''' + IntToStr(IDProdutoDevolucao) + '''');
         ibEntrProdEstoque.ExecSQL;
         Commit(ibEntrProdEstoque);

       end;//if recordcount

       ibServsVenda.Next;

       end;//while
////////////////////////////////////////////////////////////////////////////////


      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('DELETE FROM TBLSERVICOSVENDAS WHERE IDSERVSVENDA=''' + lbl_edtIDVenda.Text + '''');
      ibServsVenda.Open;

      Commit(ibDetalhePosVenda);
      ibDetalhePosVenda.Close;
      ibDetalhePosVenda.SQL.Clear;
      ibDetalhePosVenda.SQL.Add('DELETE FROM TBLDETALHEPOSVENDA WHERE IDVENDA=''' + lbl_edtIDVenda.Text + '''');
      ibDetalhePosVenda.Open;

    end;//if confirma exclusao

      Commit(ibDetalhePosVenda);
      ibDetalhePosVenda.Close;
      ibDetalhePosVenda.SQL.Clear;
      ibDetalhePosVenda.SQL.Add('SELECT * FROM TBLDETALHEPOSVENDA WHERE(TBLDETALHEPOSVENDA.DATA between :ParamDataIni and :ParamDataF)AND TBLDETALHEPOSVENDA.PAGTO=''0'' ORDER BY IDDETALHEPOSVENDA DESC');
      ibDetalhePosVenda.Open;

      ibDetalhePosVenda.Close;
      ibDetalhePosVenda.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibDetalhePosVenda.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibDetalhePosVenda.Open;


      lbl_edtNumPedido.Clear;
      lbl_edtNomerazao.Clear;
      lbl_edtCodCli.Clear;
      lbl_edtIDVenda.Clear;

  end;//with

end;

procedure TfrmPedidosLoja.FormShow(Sender: TObject);
begin

  lbl_edtNumPedido.SetFocus;
  lbl_edtNumPedido.Clear;
  lbl_edtNomerazao.Clear;
  lbl_edtCodCli.Clear;
  lbl_edtIDVenda.Clear;
  lbl_IDFunc.Caption := '';
  
  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataF.DateTime    := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin
    Commit(ibServsVenda);
    Commit(ibDetalhePosVenda);
    ExecSELECTPedidos;

    with dbgPedidoLoja do begin

          // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

        DataSource := dtsDetalhePosVenda;
        
        //determina as colunas a serem montadas 0 codigo cliente, 1 razao Social, 2 endere�o numero...
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);


        // Parametros que exibe o endere�o do cliente
        Columns.Items[0].Title.Caption := 'C�d.Venda';
        Columns.Items[0].FieldName     := 'IDVENDA';
        Columns.Items[0].Width         := 180;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do cliente.
        Columns.Items[1].Title.Caption := 'Cliente';
        Columns.Items[1].FieldName     := 'NOMECLIENTE';
        Columns.Items[1].Width         := 280;
        Columns.Items[1].Alignment     := taLeftJustify;

        // Parametros que exibe o endere�o do cliente
        Columns.Items[2].Title.Caption := 'Vendedor';
        Columns.Items[2].FieldName     := 'NOMEVENDEDOR';
        Columns.Items[2].Width         := 170;
        Columns.Items[2].Alignment     := taLeftJustify;

        // Parametros que exibe o endere�o do cliente
        Columns.Items[3].Title.Caption := 'Vlr.Venda';
        Columns.Items[3].FieldName     := 'TOTALVENDA';
        Columns.Items[3].Width         := 170;
        Columns.Items[3].Alignment     := taLeftJustify;

        // Parametros que exibe o endere�o do cliente
        Columns.Items[4].Title.Caption := 'Data';
        Columns.Items[4].FieldName     := 'DATA';
        Columns.Items[4].Width         := 170;
        Columns.Items[4].Alignment     := taLeftJustify;

        MontaColunas := False;

     end;{if}

    end;{with dbgrid}


  end;//with

end;

procedure TfrmPedidosLoja.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;
procedure TfrmPedidosLoja.lbl_edtNomerazaoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin
   lbl_edtIDVenda.SetFocus;
   // ibeaSairClick(Sender);

   { if (lbl_edtNomerazao.Text <> '')and(lbl_edtIDVenda.Text <> '') Then begin

    lbl_edtIDVenda.SetFocus;

    end; }
    
  end;//if

end;

procedure TfrmPedidosLoja.lbl_edtNumPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin

 { if key=#13 then begin

    dbgPedidoLoja.SetFocus;

  end; }

end;

procedure TfrmPedidosLoja.lbl_edtNumPedidoExit(Sender: TObject);
begin

  with dmModule do begin

   { if lbl_edtNumPedido.Text <> '' Then begin

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
      + 'TBLCADASTRO.NOME As Cliente,TBLUSER.NOME As Vendedor FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOSVENDAS.IDVENDEDOR=TBLUSER.IDUSER '
      + 'WHERE  TBLSERVICOSVENDAS.CODPOSVENDA=''' + lbl_edtNumPedido.Text + '''');
      ibServsVenda.Open;

      if ibServsVenda.RecordCount > 0 Then begin

        lbl_edtNomerazao.Text := ibServsVenda.FieldByName('Cliente').AsString;
        lbl_edtCodCli.Text    := IntToStr(ibServsVenda.FieldByName('IDCLIENTE').AsInteger);

      end;//if ibservsvenda

    end;//if label numpedido}

  end;//with

end;

procedure TfrmPedidosLoja.ibeaIncluirClick(Sender: TObject);

var

ValorPosVenda, ValorPosVendaB, ValorPosVendaC : Real;
TotalPosVenda,TotalPosVendaB, TotalPosVendaC, VlrTotalPosVenda, VlrTotalPosVendaB, VlrTotalPosVendaC : String;
Produto : Array[0..10]of String;
begin

  with dmModule do begin


  if(lbl_edtIDVenda.Text <> '') Then begin

//  CodigoCliente := StrToInt(lbl_edtCodCli.Text);

   { Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLDETALHEPOSVENDA.*,'
    + 'TBLSERVICOSVENDAS.IDCLIENTE,TBLSERVICOSVENDAS.IDVENDEDOR,'
    + 'TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.IDPROD,'
    + 'TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.NOMECLI as NomeCliente,'
    + 'TBLSERVICOSVENDAS.NOMEPROD as NomeProduto,TBLUSER.NOME As NomeVendedor FROM TBLDETALHEPOSVENDA '
    + 'LEFT OUTER JOIN TBLSERVICOSVENDAS ON TBLDETALHEPOSVENDA.IDDETALHEPOSVENDA=TBLSERVICOSVENDAS.IDPOSVENDA '
    + 'LEFT OUTER JOIN TBLUSER ON TBLDETALHEPOSVENDA.IDVENDEDOR=TBLUSER.IDUSER WHERE TBLSERVICOSVENDAS.POSVENDA=''Pendente''');
    ibServsVenda.Open; }


    Commit(ibServsVenda);                                                           
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE TBLSERVICOSVENDAS.POSVENDA=''Pendente''and IDPOSVENDA=''' + lbl_edtIDVenda.Text + '''');
    ibServsVenda.Open;

  end;

 { if(lbl_edtCodCli.Text = '') Then begin

   { Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLDETALHEPOSVENDA.*,'
    + 'TBLSERVICOSVENDAS.IDCLIENTE,TBLSERVICOSVENDAS.IDVENDEDOR,'
    + 'TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.IDPROD,'
    + 'TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.NOMECLI as NomeCliente,'
    + 'TBLSERVICOSVENDAS.NOMEPROD as NomeProduto,TBLUSER.NOME As NomeVendedor FROM TBLDETALHEPOSVENDA '
    + 'LEFT OUTER JOIN TBLSERVICOSVENDAS ON TBLDETALHEPOSVENDA.IDDETALHEPOSVENDA=TBLSERVICOSVENDAS.IDPOSVENDA '
    + 'LEFT OUTER JOIN TBLUSER ON TBLDETALHEPOSVENDA.IDVENDEDOR=TBLUSER.IDUSER WHERE TBLSERVICOSVENDAS.POSVENDA=''Pendente''');
    ibServsVenda.Open; }

   { Commit(ibDetalhePosVenda);
    ibDetalhePosVenda.Close;
    ibDetalhePosVenda.SQL.Clear;
    ibDetalhePosVenda.SQL.Add('SELECT TBLDETALHEPOSVENDA.*,TBLSERVICOSVENDAS.IDPROD,'
    + 'TBLSERVICOSVENDAS.IDCLIENTE,TBLSERVICOSVENDAS.IDVENDEDOR,'
    + 'TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.QTDE,'
    + 'TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.NOMECLI as NomeCliente,'
    + 'TBLSERVICOSVENDAS.NOMEPROD as NomeProduto,TBLUSER.NOME As NomeVendedor FROM TBLDETALHEPOSVENDA '
    + 'LEFT OUTER JOIN TBLSERVICOSVENDAS ON TBLDETALHEPOSVENDA.IDDETALHEPOSVENDA=TBLSERVICOSVENDAS.IDPOSVENDA '
    + 'LEFT OUTER JOIN TBLUSER ON TBLDETALHEPOSVENDA.IDVENDEDOR=TBLUSER.IDUSER WHERE TBLSERVICOSVENDAS.POSVENDA=''Pendente''');
    ibDetalhePosVenda.Open; }


   { Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE TBLSERVICOSVENDAS.POSVENDA=''Pendente'' and IDPOSVENDA=''' + lbl_edtIDVenda.Text + '''');//.IDPROD,TBLSERVICOSVENDAS.VLRUNIT,'
    //+ 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.ESTOQUE,'
   // + 'TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.IDSERVSVENDA,'
   // + 'TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.POSVENDA,TBLSERVICOSVENDAS.IDCLIENTE,'
   // + 'CADPRODUTOS.NOME As PRODUTO FROM TBLSERVICOSVENDAS '
   // + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
   // + 'WHERE TBLSERVICOSVENDAS.IDCLIENTE=''' + lbl_edtCodCli.Text + ''' and TBLSERVICOSVENDAS.POSVENDA=''''');
    ibServsVenda.Open;  }

//  end;   
    while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

      if ValorPosVenda = 0 Then begin//se variavel for igual a zero

        //atribui o vlr do campo abaixo na variavel
        ValorPosVenda := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end else begin

        //atribui na variavel substituindo o ponto para vlr em branco
        TotalPosVenda := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        //atribui a variavel o valor separando por ponto
        ValorPosVenda := ValorPosVenda + StrtoFloat(StringReplace(TotalPosVenda,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end;{if}

      //VALORB

      if ValorPosVendaB = 0 Then begin//se variavel for igual a zero

        //atribui o vlr do campo abaixo na variavel
        ValorPosVendaB := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end else begin

        //atribui na variavel substituindo o ponto para vlr em branco
        TotalPosVendaB := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        //atribui a variavel o valor separando por ponto
        ValorPosVendaB := ValorPosVendaB + StrtoFloat(StringReplace(TotalPosVendaB,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end;{if}

      //VALORC

      if ValorPosVendaC = 0 Then begin//se variavel for igual a zero

        //atribui o vlr do campo abaixo na variavel
        ValorPosVendaC := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end else begin

        //atribui na variavel substituindo o ponto para vlr em branco
        TotalPosVendaC := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        //atribui a variavel o valor separando por ponto
        ValorPosVendaC := ValorPosVendaC + StrtoFloat(StringReplace(TotalPosVendaC,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end;{if}
////////////////////////////////////////////////////////////////////////////////

        Produto[0]:=IntToStr(ibServsVenda.FieldByName('IDPROD').AsInteger);
        Produto[1]:=ibServsVenda.FieldByName('NOMEPROD').AsString;
        Produto[3]:=ibServsVenda.FieldByName('QTDE').AsString;
  ///      Produto[4]:=frmVendasLoja.lbl_X.Caption;
        Produto[5]:=FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRUNIT').AsFloat);
   ///     Produto[6]:=frmVendasLoja.lbl_edtIgual.Caption;
        Produto[7]:=FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRTOTAL').AsFloat + ibServsVenda.FieldByName('VALORB').AsFloat + ibServsVenda.FieldByName('VALORC').AsFloat);

    ///    frmVendasLoja.listboxCupom.Items.Add(Produto[0] + ' ' + '-' + ' ' + Produto[1]);
   ///     frmVendasLoja.listboxCupom.Items.Add(Produto[3] + ' ' + ' ' + ' ' + Produto[4] + ' ' + ' ' + ' ' + Produto[5] + ' ' + ' ' + ' ' + Produto[6]  + ' ' + ' ' + ' ' + Produto[7]);

  ////////////////////////////////////////////////////////////////////////////////


     ibServsVenda.Next;

    end;//while

     frmVendasLoja.lbl_edtSubTotal.Caption := FormatFloat(',0.00',ValorPosVenda + ValorPosVendaB + ValorPosVendaC);
     frmVendasLoja.lbl_Cliente.Caption := lbl_edtNomerazao.Text;
     if lbl_edtCodCli.Text <> '' Then begin
     frmVendasLoja.lbl_CodCliente.Caption := lbl_edtCodCli.Text;
     end;
     frmVendasLoja.lbl_edtInformacao.Caption := '';
     frmVendasLoja.lbl_CodPosVenda.Caption := lbl_edtIDVenda.Text;
 // end;//if label numpedido e label nome razao

  end;//with


end;

procedure TfrmPedidosLoja.lbl_edtNomerazaoExit(Sender: TObject);
begin

  with dmModule do begin

 // if (lbl_edtNomerazao.Text <> '')and(lbl_edtIDVenda.Text <> '') Then begin
 // ibeaIncluirClick(Sender);
// ibeaSairClick(Sender);
  
//  end;//if
   { if lbl_edtNomerazao.Text <> '' Then begin

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
      + 'TBLCADASTRO.NOME As Cliente,TBLUSER.NOME As Vendedor FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOSVENDAS.IDVENDEDOR=TBLUSER.IDUSER '
      + 'WHERE  TBLSERVICOSVENDAS.IDPOSVENDA=''' + lbl_edtIDVenda.Text + '''');
      ibServsVenda.Open; }

      {ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,CADPRODUTOS.NOME As PRODUTO,'
      + 'TBLCADASTRO.NOME As Cliente,TBLUSER.NOME As Vendedor FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOSVENDAS.IDVENDEDOR=TBLUSER.IDUSER '
      + 'WHERE  TBLSERVICOSVENDAS.CODPOSVENDA=''' + lbl_edtNumPedido.Text + '''');
      ibServsVenda.Open;}

    {  if ibServsVenda.RecordCount > 0 Then begin

        lbl_edtNomerazao.Text := ibServsVenda.FieldByName('Cliente').AsString;
        lbl_edtCodCli.Text    := IntToStr(ibServsVenda.FieldByName('IDCLIENTE').AsInteger);

      end;//if ibservsvenda

    end;//if label numpedido   }

  end;//with

end;

procedure TfrmPedidosLoja.dbgPedidoLojaKeyPress(Sender: TObject;
  var Key: Char);

var
IDCadCli,IDPosVenda : Integer;
VlrTotal, VlrTotalB, VlrTotalC : Real;
strVlrTotalVenda, strVlrTotalVendaB, strVlrTotalVendaC : String;

begin

  if key=#13 Then begin

    with dmModule do begin
  IDPosVenda := ibDetalhePosVenda.FieldByName('IDVENDA').AsInteger;

  lbl_IDFunc.Caption := IntToStr(ibDetalhePosVenda.FieldByName('IDVENDEDOR').AsInteger);
    if lbl_edtCodCli.Text <> '' Then begin

      IDCadCli := ibDetalhePosVenda.FieldByName('IDCLIENTE').AsInteger;

      if ibDetalhePosVenda.RecordCount > 0 Then begin

        lbl_edtCodCli.Text    := IntToStr(IDCadCli);
        lbl_edtNomerazao.Text := ibDetalhePosVenda.FieldByName('NOMECLIENTE').AsString;

      end;//if

    end else begin

      IDCadCli := 0;

      if ibDetalhePosVenda.RecordCount > 0 Then begin

        lbl_edtCodCli.Text    := IntToStr(IDCadCli);
        lbl_edtNomerazao.Text := ibDetalhePosVenda.FieldByName('NOMECLIENTE').AsString;

      end;//if

    end;

    lbl_edtIDVenda.Text := IntToStr(IDPosVenda);

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
      + 'TBLCADASTRO.NOME As Cliente,TBLUSER.NOME As Vendedor FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOSVENDAS.IDVENDEDOR=TBLUSER.IDUSER '
      + 'WHERE  TBLSERVICOSVENDAS.IDSERVSVENDA=''' + lbl_edtIDVenda.Text + '''');
      ibServsVenda.Open;

      (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
      (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
      (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


      frmVendasLoja.lbl_edtCodBarras.Enabled := True;
      frmVendasLoja.lbl_edtCodProd.Enabled := True;
      frmVendasLoja.lbl_edtCodBarras.SetFocus;
      frmVendasLoja.lbl_CodVenda.Caption := IntToStr(IDPosVenda);

        Commit(ibTempCadastro);
        ibTempCadastro.Close;
        ibTempCadastro.SQL.Clear;
        ibTempCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE TBLCADASTRO.IDCAD=''' + InttoStr(IDCadCli) + '''');
        ibTempCadastro.Open;

        frmVendasLoja.lbl_CodCliente.Caption   := IntToStr(ibTempCadastro.FieldByName('IDCAD').AsInteger);
        frmVendasLoja.lbl_Cliente.Caption   := ibTempCadastro.FieldByName('NOME').AsString;

      while not ibServsVenda.Eof do begin

        if VlrTotal = 0 Then begin

          VlrTotal := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfreplaceAll]));

        end else begin

          strVlrTotalVenda := StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

          VlrTotal := VlrTotal + StrtoFloat(StringReplace(strVlrTotalVenda,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        end;//if

        //VENDAB
        if VlrTotalB = 0 Then begin

          VlrTotalB := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfreplaceAll]));

        end else begin

          strVlrTotalVendaB := StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

          VlrTotalB := VlrTotalB + StrtoFloat(StringReplace(strVlrTotalVendaB,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        end;//if

        //VENDAC
        if VlrTotalC = 0 Then begin

          VlrTotalC := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfreplaceAll]));

        end else begin

          strVlrTotalVendaC := StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

          VlrTotalC := VlrTotalC + StrtoFloat(StringReplace(strVlrTotalVendaC,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        end;//if

         ibServsVenda.Next;

      end;//while

      frmVendasLoja.lbl_edtSubTotal.Caption := FormatFloat(CasasDecimais('Produtos'),VlrTotal + VlrTotalB + VlrTotalC);
      frmVendasLoja.lbl_IDFuncComissao.Caption := lbl_IDFunc.Caption;
    {  ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
      + 'TBLCADASTRO.NOME As Cliente,TBLUSER.NOME As Vendedor FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOSVENDAS.IDVENDEDOR=TBLUSER.IDUSER '
      + 'WHERE  TBLSERVICOSVENDAS.POSVENDA=''Pendente''');
      ibServsVenda.Open;

      if ibServsVenda.RecordCount > 0 Then begin

        lbl_edtNomerazao.Text := ibServsVenda.FieldByName('Cliente').AsString;
        lbl_edtCodCli.Text    := IntToStr(ibServsVenda.FieldByName('IDCLIENTE').AsInteger);

      end;//if ibservsvenda }
      //lbl_edtNomerazao.SetFocus;
     // ibeaIncluirClick(Sender);
    //  ibeaSairClick(Sender);
    ibeaSairClick(Sender);
    end;//with

  end;//if

end;

procedure TfrmPedidosLoja.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  with dmModule do begin

    case key of

      VK_F2 :begin

        ibeaSairClick(Sender);

      end;//begin

      VK_F3 :begin

        dbgPedidoLoja.SetFocus;

      end;//begin

      VK_F4 :begin

        if lbl_edtIDVenda.Text <> '' Then begin

        DeletarPedido;

        end;

      end;//begin

    end;//case

  end;//with

end;

procedure TfrmPedidosLoja.dbgPedidoLojaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

var
IDCadCli,IDPosVenda : Integer;
begin

  with dmModule do begin

  IDPosVenda := ibDetalhePosVenda.FieldByName('IDVENDA').AsInteger;

    if lbl_edtCodCli.Text <> '' Then begin

      IDCadCli := ibDetalhePosVenda.FieldByName('IDCLIENTE').AsInteger;

      if ibDetalhePosVenda.RecordCount > 0 Then begin

        lbl_edtCodCli.Text    := IntToStr(IDCadCli);
        lbl_edtNomerazao.Text := ibDetalhePosVenda.FieldByName('NOMECLIENTE').AsString;

      end;//if

    end else begin

      IDCadCli := 0;

      if ibDetalhePosVenda.RecordCount > 0 Then begin

        lbl_edtCodCli.Text    := IntToStr(IDCadCli);
        lbl_edtNomerazao.Text := ibDetalhePosVenda.FieldByName('NOMECLIENTE').AsString;

      end;//if

    end;

    lbl_edtIDVenda.Text := IntToStr(IDPosVenda);

  end;//with

end;

procedure TfrmPedidosLoja.dbgPedidoLojaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);

var
IDCadCli,IDPosVenda : Integer;
begin

  with dmModule do begin

  IDPosVenda := ibDetalhePosVenda.FieldByName('IDVENDA').AsInteger;

    if lbl_edtCodCli.Text <> '' Then begin

      IDCadCli := ibDetalhePosVenda.FieldByName('IDCLIENTE').AsInteger;

      if ibDetalhePosVenda.RecordCount > 0 Then begin

        lbl_edtCodCli.Text    := IntToStr(IDCadCli);
        lbl_edtNomerazao.Text := ibDetalhePosVenda.FieldByName('NOMECLIENTE').AsString;

      end;//if

    end else begin

      IDCadCli := 0;

      if ibDetalhePosVenda.RecordCount > 0 Then begin

        lbl_edtCodCli.Text    := IntToStr(IDCadCli);
        lbl_edtNomerazao.Text := ibDetalhePosVenda.FieldByName('NOMECLIENTE').AsString;

      end;//if
            
    end;

    lbl_edtIDVenda.Text := IntToStr(IDPosVenda);

  end;//with

end;

procedure TfrmPedidosLoja.lbl_edtIDVendaKeyPress(Sender: TObject;
  var Key: Char);
begin

if key =#13 Then begin
ibeaIncluirClick(Sender);
ibeaSairClick(Sender);

end;

end;

procedure TfrmPedidosLoja.dtpDataFChange(Sender: TObject);
begin

  with dmModule do begin

   ExecSELECTPedidos;
   
  end;//with

end;

end.
