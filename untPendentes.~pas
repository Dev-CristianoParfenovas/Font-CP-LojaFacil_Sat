unit untPendentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, IBEAntialiasButton, StdCtrls,
  ComCtrls, mxFlatControls, IBQuery, DB, classComboBox;

type
  TfrmLanctoPendentes = class(TForm)
    lbl_DTInicio: TLabel;
    lbl_DtFinal: TLabel;
    dtpDataIni: TmxFlatDateTimePicker;
    dtpDataFinal: TmxFlatDateTimePicker;
    ibeaAlterar: TIBEAntialiasButton;
    lbl_Cupom: TLabel;
    imgBarraSist: TImage;
    dbgPendentes: TDBGrid;
    ibeaSair: TIBEAntialiasButton;
    ibeaCancelaprod: TIBEAntialiasButton;
    lbl_edtTotalPendente: TLabeledEdit;
    lbl_edtVlrPago: TLabeledEdit;
    Bevel1: TBevel;
    cboCliente: TComboBox;
    lbl_Cliente: TLabel;
    lbl_edtTotalemAver: TLabeledEdit;
    lbl_edtNumCupom: TLabeledEdit;
    dtpDataPagtoP: TmxFlatDateTimePicker;
    Label1: TLabel;
    ibeaRetorna: TIBEAntialiasButton;
    ckRetorno: TCheckBox;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTCliente;
    procedure lbl_edtNumCupomExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure ibeaCancelaprodClick(Sender: TObject);
    procedure dtpDataFinalChange(Sender: TObject);
    procedure lbl_edtNumCupomKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure lbl_edtVlrParcialExit(Sender: TObject);
    procedure lbl_edtVlrParcialKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtVlrPagoExit(Sender: TObject);
    procedure lbl_edtVlrPagoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPendentesCellClick(Column: TColumn);
    procedure ibeaRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLanctoPendentes: TfrmLanctoPendentes;
  MontaCol : Boolean;
  ConfirmaMSG : Integer;
  ValorGeralCX : Real;
  ValorB : Real;
  ValorC : Real;
  ValorTotalCX : String;
  TotalB : String;
  TotalC : String;
  TotalBC: Real;
  ValorGeral: Real;
  ValorParcial : String;
  TotalParcial : String;

  ValorParcialSomado : Real;
  TotalParcialSomado : String;

  TotalParcialRestante : String;
  VlrTotalParcialRestante : Real;

  IDClass : Integer;
  IDCliente : TClasseCombo;
  IDClassClienteConvenio : TClasseCombo;
  IDVenda : Integer;
  IDCupom : Integer;
  PagtoParcial : Real;
  VlrPendenteAberto : String;
  VlrCupomCx : Real;
  VlrCaixa : Real;
  TotalCaixa : Real;
  VlrCxEntrada : String;
  IDServicos : Integer;
  IDRecVendas : Integer;

implementation

uses untdmModule, funcPosto, unClientes;

{$R *.dfm}

procedure TfrmLanctoPendentes.Commit(IBQueryExec : TIBQuery);

begin

  with dmModule do begin

    with IBQueryExec do begin

      SQL.Clear;
      SQL.Add('Commit');
      Open;
      Close;

    end;{with query exec}

  end;{with}

end;

procedure TfrmLanctoPendentes.ExecSELECTCliente;

begin

  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.

    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClass) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboCliente.Clear;

    while not ibCadastro.Eof do begin

      IDCliente := TClasseCombo.Create;
      IDCliente.ID := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboCliente.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,IDCliente);
      ibCadastro.Next;

    end;{while}

  end;{whit}

end;


procedure TfrmLanctoPendentes.lbl_edtNumCupomExit(Sender: TObject);

//var

//TipoPendente : String;

begin

{  with dmModule do begin

    if (ValorParcialSomado > 0) Then begin

      ValorParcialSomado := 0;

    end;

    if (TotalParcialSomado > '0') Then begin

      TotalParcialSomado :='0';

    end;

    if ValorGeralCX > 0 Then begin

    ValorGeralCX := 0;

    end;




    Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
    + 'TBLCADASTRO.NOME As Cliente, TBLRECEBEVENDAS.VLRPAGO FROM TBLSERVICOSVENDAS '
    + 'INNER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
    + 'INNER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA '
    + 'WHERE TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + ''' and TBLSERVICOSVENDAS.TIPOVENDA=''Pendente''');
    ibServsVenda.Open;

    (ibServsVenda.FieldByName('TOTALAPAGAR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos');} //CRIA UMA MASCARA PARA O CAMPO


    { if (ibServsVenda.FieldByName('VLRPARCIAL').AsFloat > 0) and (ibServsVenda.FieldByName('TOTALPARCIAL').AsFloat > 0) Then begin

     lbl_edtVlrParcial.Text := FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRPARCIAL').AsFloat);

     end; }
////////////////////////////////////////////////////////////////////////////////

   { while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

          if (ValorGeralCX = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeralCX := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalCX := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);


            //atribui a variavel o valor separando por ponto
            ValorGeralCX := ValorGeralCX + StrtoFloat(StringReplace(ValorTotalCX,ThousandSeparator,'',[rfReplaceAll]));


           end;{if}
///////////////////////////////////////////////////////////////////////////////////
      {     if ibServsVenda.FieldByName('TOTALPARCIAL').AsFloat > 0 Then begin

             ValorGeral := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('TOTALPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             ValorGeral :=  ValorGeralCX;

           end;
////////////////////////////////////////////////////////////////////////////////
           if (ValorParcialSomado = 0) Then begin

             ValorParcialSomado := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

              TotalParcialSomado := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

              ValorParcialSomado := ValorParcialSomado + StrtoFloat(StringReplace(TotalParcialSomado,ThousandSeparator,'',[rfReplaceAll]));

           end;{if}
////////////////////////////////////////////////////////////////////////////////

        {   if (VlrTotalParcialRestante = 0) Then begin

             VlrTotalParcialRestante := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('TOTALPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

              TotalParcialRestante := StringReplace(FloattoStr(ibServsVenda.FieldByName('TOTALPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

              VlrTotalParcialRestante :=  StrtoFloat(StringReplace(TotalParcialRestante,ThousandSeparator,'',[rfReplaceAll])); }

         //  end;{if}

////////////////////////////////////////////////////////////////////////////////

       //   ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.

       // end;{while}
////////////////////////////////////////////////////////////////////////////////


    //   if lbl_edtTotalCupom.Text = '0,00' Then begin
   {     lbl_edtVlrPago.Text             := FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRPAGO').AsFloat);
        lbl_edtTotalCupom.Text          := FormatFloat(CasasDecimais('Produtos'),ValorGeral);
        lbl_edtVlrParcial.Text          := '0,00';//FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRPARCIAL').AsFloat);
        lbl_edtTotalParcial.Text        := '0,00';//FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('TOTALPARCIAL').AsFloat);
        lbl_edtVlrParcialLancto.Text    := FormatFloat(CasasDecimais('Produtos'),ValorParcialSomado); //FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRPARCIAL').AsFloat);
        lbl_edtTotalParcialLancto.Text  := FormatFloat(CasasDecimais('Produtos'),VlrTotalParcialRestante);
        lbl_edtTotalCupomVendido.Text   := FormatFloat(CasasDecimais('Produtos'),ValorGeralCX); }


//  end;{with}

end;

procedure TfrmLanctoPendentes.FormShow(Sender: TObject);

begin

  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFinal.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataPagtoP.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  lbl_edtNumCupom.Text    := '';
  lbl_edtTotalPendente.Text := '';
  lbl_edtVlrPago.Text := '';
  lbl_edtTotalemAver.Text := '';

  with dmModule do begin


// if frmClientes.lbl_edtNomeCliH.Text <> '' Then begin

//  cboCliente.Text := frmClientes.lbl_edtNomeCliH.Text;
// end;//if

  ExecSELECTCliente;

  ibServsVenda.Close;


    //Adiciona as Colunas com os dados do Clientes
    with dbgPendentes do begin

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
        Columns.Insert(7);
     //   Columns.Insert(8);
     //   Columns.Insert(9);
     //   Columns.Insert(10);
        //Parametros da Coluna que exibe o Nome do cliente.

        Columns.Items[0].Title.Caption := 'NºCupom ';
        Columns.Items[0].FieldName     := 'IDSERVSVENDA';
        Columns.Items[0].Width         := 50;
        Columns.Items[0].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[1].Title.Caption := 'Nome do Produto';
        Columns.Items[1].FieldName     := 'NOMEPROD';
        Columns.Items[1].Width         := 170;
        Columns.Items[1].Alignment     := taLeftJustify;

        Columns.Items[2].Title.Caption := 'Qtde';
        Columns.Items[2].FieldName     := 'QTDE';
        Columns.Items[2].Width         := 45;
        Columns.Items[2].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[3].Title.Caption := 'Valor Venda';
        Columns.Items[3].FieldName     := 'VLRTOTAL';
        Columns.Items[3].Width         := 75;
        Columns.Items[3].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[4].Title.Caption := 'Valor Pago';
        Columns.Items[4].FieldName     := 'PAGTOPARCIAL';
        Columns.Items[4].Width         := 75;
        Columns.Items[4].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[5].Title.Caption := 'Total Pagar';
        Columns.Items[5].FieldName     := 'VLRPENDENTE';
        Columns.Items[5].Width         := 80;
        Columns.Items[5].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[6].Title.Caption := 'Data da Compra';
        Columns.Items[6].FieldName     := 'DATA';
        Columns.Items[6].Width         := 83;
        Columns.Items[6].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[7].Title.Caption := 'Data Pagto.';
        Columns.Items[7].FieldName     := 'DATAPAGTOPENDENTE';
        Columns.Items[7].Width         := 70;
        Columns.Items[7].Alignment     := taLeftJustify;

        MontaCol := False;

      end; {if}

    end; {with do db grid}
////////////////////////////////////////////////////////////////////////////////


  end;{with}

end;

procedure TfrmLanctoPendentes.FormCreate(Sender: TObject);
begin
 MontaCol := True;
end;

procedure TfrmLanctoPendentes.ibeaSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmLanctoPendentes.ibeaAlterarClick(Sender: TObject);

var

PagtoPendente,PendenteRestante : String;
ValorPendente,ValorPago, ValorRestante : Real;
TipoPendente,Pagto,Historico,TipoVenda,CodCli,VlraPagar,VlrPendente : String;
IDClienteP : Integer;
TotalPago,PagoPendente,VlrPagoPendente,VlrPagoP : Real;
VlrPendentePago,TotalVlrPagoPendente,VlrLanctoPago : String;
VlrParcial,VlrPP : Real;
TotalPagtoParcial : String;
ParcialPago, Situacao : String;

begin

  if ValorPendente > 0 Then begin

    ValorPendente := 0;

  end;//if

  if ValorPago > 0 Then begin

    ValorPago := 0;

  end;//if valorpago

  if PendenteRestante > '0' Then begin

    PendenteRestante := '0';

  end;//if PendenteRestante

  if VlrPagoP > 0 Then begin

    VlrPagoP := 0;

  end;

  if VlrPagoPendente > 0 Then begin

    VlrPagoPendente := 0;

  end;//if VlrPagoPendente

  if VlrLanctoPago > '0' Then begin

    VlrLanctoPago := '0';

  end;//if

  with dmModule do begin

    ConfirmaMSG := Application.MessageBox('Confirma o lançamento','Notificação Lançamento de Pendencia',+MB_YESNO+MB_ICONQUESTION);

    if ConfirmaMSG = 6 then begin


      if cboCliente.ItemIndex > - 1 Then begin

        IDClassClienteConvenio := TClasseCombo( cboCliente.Items.Objects[cboCliente.ItemIndex] );

      end;
////////////////////////////////////////////////////////////////////////////////

      if PagtoParcial > 0 Then begin

        TotalPago   := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));
        PagoPendente := PagtoParcial + TotalPago;

        VlrPendentePago := StringReplace(FloatToStr(PagoPendente),ThousandSeparator,'',[rfReplaceAll]);
        VlrPendentePago := StringReplace(VlrPendentePago,DecimalSeparator,'.',[rfReplaceAll]);

      end else begin

        VlrPendentePago := StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]);
        VlrPendentePago := StringReplace(VlrPendentePago,DecimalSeparator,'.',[rfReplaceAll]);

      end;

      VlrPendente := StringReplace(lbl_edtTotalemAver.Text,ThousandSeparator,'',[rfReplaceAll]);
      VlrPendente := StringReplace(VlrPendente,DecimalSeparator,'.',[rfReplaceAll]);
      if VlrPendente  = '' Then
         VlrPendente := '0';

////////////////////////////////////////////////////////////////////////////////

   { if VlrCupomCx > 0 Then begin

    VlrCaixa := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));
    TotalCaixa := VlrCupomCx + VlrCaixa;

    VlrCxEntrada := StringReplace(FloatToStr(TotalCaixa),ThousandSeparator,'',[rfReplaceAll]);
    VlrCxEntrada := StringReplace(VlrCxEntrada,DecimalSeparator,'.',[rfReplaceAll]);

    end else begin

    VlrCxEntrada := StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]);
    VlrCxEntrada := StringReplace(VlrCxEntrada,DecimalSeparator,'.',[rfReplaceAll]);

    end; }

    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE IDVENDA=''' + IntToStr(IDCupom) + '''');
    ibRecVendas.Open;

    if IDCupom > 0 Then begin


    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('INSERT INTO TBLRECEBEVENDAS'
    + '(IDVENDA,VLRPAGO,PAGTOPENDENTE,IDCLI,DATA,DATAEMISSAO,DATAPAGTOPENDENTE,HORA) values '
    + '(''' + IntToStr(IDCupom) + ''','
    + ' ''' + VlrPendentePago + ''','
    + ' ''' + VlrPendentePago + ''','
    + ' ''' + InttoStr(IDClassClienteConvenio.ID) + ''','
    + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataIni.Date) + ''','
    + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataIni.Date) + ''','
    + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
    + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
    ibRecVendas.ExecSQL;
    Commit(ibRecVendas);

    end;

////////////////////////////////////////////////////////////////////////////////
   if lbl_edtVlrPago.Text <> '' Then begin

    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE IDSERVSVENDA=''' + IntToStr(IDCupom) + ''' and IDSERVS=''' + IntToStr(IDServicos) + '''');
    ibServsVenda.Open;

    VlrParcial := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('PAGTOPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

    VlrPP      := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));

    VlrParcial := VlrParcial + VlrPP;

    TotalPagtoParcial := StringReplace(FloattoStr(VlrParcial),ThousandSeparator,'',[rfReplaceAll]);
    TotalPagtoParcial := StringReplace(TotalPagtoParcial,DecimalSeparator,'.',[rfReplaceAll]);

    end;

    

    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE IDSERVSVENDA=''' + IntToStr(IDCupom) + ''' and IDSERVS=''' + IntToStr(IDServicos) + '''');
    ibServsVenda.Open;

    if (lbl_edtTotalemAver.Text = '') or (lbl_edtTotalemAver.Text = '0,00')  Then begin

    Situacao := 'Pago';

    end else begin

    Situacao := 'Pendente';

    end;


    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
    +'PAGTOPARCIAL=''' + TotalPagtoParcial + ''','
    + 'DATAPAGTOPENDENTE = ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
    + 'DATAEMISSAO = ''' + FormatDateTime('mm-dd-yyyy',dtpDataIni.Date) + ''','
    + 'DATA=''' + FormatDateTime('mm-dd-yyyy',dtpDataIni.Date) + ''','
    + 'PENDENTEPAGO = ''' + Situacao + ''','
    + 'VLRPENDENTE=''' + VlrPendente + ''' WHERE IDCLIENTE=''' + IntToStr(IDClassClienteConvenio.ID) + ''' and IDSERVSVENDA=''' + IntToStr(IDCupom) + ''' and IDSERVS=''' + IntToStr(IDServicos) + '''');
    ibServsVenda.ExecSQL;
    Commit(ibServsVenda);



////////////////////////////////////////////////////////////////////////////////
                                //    or lbl_edtVlrPago.Text > '0'
   {   if (lbl_edtVlrPago.Text <> '') and (lbl_edtTotalemAver.Text = '0,00') or (lbl_edtTotalemAver.Text = '') Then begin

        PagtoPendente := 'Pago';

        ibServsVenda.Close;
        ibServsVenda.SQL.Clear;
        ibServsVenda.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
        + 'DATAPAGTOPENDENTE = ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
        + 'PENDENTEPAGO = ''' + PagtoPendente + ''' WHERE IDSERVSVENDA = ''' + IntToStr(IDCupom) + ''' and IDSERVS=''' + IntToStr(IDServicos) + '''');
        ibServsVenda.ExecSQL;
        Commit(ibServsVenda);

        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE IDVENDA= ''' + IntToStr(IDCupom) + '''');
        ibRecVendas.Open;

        if ValorPendente = 0 Then begin

          ValorPendente :=  StrtoFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRPENDENTE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          ValorPago     := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));

          if ValorPendente > ValorPago Then begin

            ValorRestante := ValorPendente - ValorPago;

          end else begin

            ValorRestante := ValorPago - ValorPendente  ;

          end;

          PendenteRestante := StringReplace(FloatToStr(ValorRestante),ThousandSeparator,'',[rfReplaceAll]);
          PendenteRestante := StringReplace(PendenteRestante,DecimalSeparator,'.',[rfReplaceAll]);

        end;//if

        if VlrPagoP = 0 Then begin

          VlrPagoP := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          VlrPagoPendente := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));

          VlrPagoP := VlrPagoP + VlrPagoPendente;

          VlrLanctoPago := StringReplace(FloatToStr(VlrPagoP),ThousandSeparator,'',[rfReplaceAll]);
          VlrLanctoPago := StringReplace(VlrLanctoPago,DecimalSeparator,'.',[rfReplaceAll]);

        end;//if vlrpagopendente

        if PendenteRestante = '0' Then begin

        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('UPDATE TBLRECEBEVENDAS SET '
        + 'VLRPENDENTE = ''' + PendenteRestante + ''','
        + 'VLRPAGO = ''' + VlrLanctoPago + ''','
       // + 'TOTALVENDA = ''' + VlrLanctoPago + ''','
        + 'SITUACAOVENDA = ''' + PagtoPendente + ''' WHERE IDVENDA = ''' + IntToStr(IDCupom) + '''');
        ibRecVendas.ExecSQL;
        Commit(ibRecVendas);

        end else begin

        PagtoPendente := 'Pendente';

        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('UPDATE TBLRECEBEVENDAS SET '
        + 'VLRPENDENTE = ''' + PendenteRestante + ''','
        + 'VLRPAGO = ''' + VlrLanctoPago + ''','
     //   + 'TOTALVENDA = ''' + VlrLanctoPago + ''','
        + 'SITUACAOVENDA = ''' + PagtoPendente + ''' WHERE IDVENDA = ''' + IntToStr(IDCupom) + '''');
        ibRecVendas.ExecSQL;
        Commit(ibRecVendas);

        end;//if

      end;}//if

////////////////////////////////////////////////////////////////////////////////

     { if (lbl_edtVlrPago.Text <> '') and (lbl_edtTotalemAver.Text > '0,00') Then begin

        PagtoPendente := 'Pendente';

        ibServsVenda.Close;
        ibServsVenda.SQL.Clear;
        ibServsVenda.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
        + 'DATAPAGTOPENDENTE = ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
        + 'PAGTOPARCIAL = ''' +  + ''','
        + 'PENDENTEPAGO = ''' + PagtoPendente + ''' WHERE IDSERVSVENDA = ''' + IntToStr(IDCupom) + ''' and IDSERVS=''' + IntToStr(IDServicos) + '''');
        ibServsVenda.ExecSQL;
        Commit(ibServsVenda);

        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE IDVENDA= ''' + IntToStr(IDCupom) + '''');
        ibRecVendas.Open;

        if ValorPendente = 0 Then begin

          ValorPendente :=  StrtoFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRPENDENTE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          ValorPago     := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));

          if ValorPendente > ValorPago Then begin

            ValorRestante := ValorPendente - ValorPago;

          end else begin

            ValorRestante := ValorPago - ValorPendente  ;

          end;

          PendenteRestante := StringReplace(FloatToStr(ValorRestante),ThousandSeparator,'',[rfReplaceAll]);
          PendenteRestante := StringReplace(PendenteRestante,DecimalSeparator,'.',[rfReplaceAll]);

        end;//if

        if VlrPagoP = 0 Then begin

          VlrPagoP := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          VlrPagoPendente := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));

          VlrPagoP := VlrPagoP + VlrPagoPendente;

          VlrLanctoPago := StringReplace(FloatToStr(VlrPagoP),ThousandSeparator,'',[rfReplaceAll]);
          VlrLanctoPago := StringReplace(VlrLanctoPago,DecimalSeparator,'.',[rfReplaceAll]);

        end;//if vlrpagopendente

        if PendenteRestante = '0' Then begin

        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('UPDATE TBLRECEBEVENDAS SET '
        + 'VLRPENDENTE = ''' + PendenteRestante + ''','
        + 'VLRPAGO = ''' + VlrLanctoPago + ''','
       // + 'TOTALVENDA = ''' + VlrLanctoPago + ''','
        + 'SITUACAOVENDA = ''' + PagtoPendente + ''' WHERE IDVENDA = ''' + IntToStr(IDCupom) + '''');
        ibRecVendas.ExecSQL;
        Commit(ibRecVendas);

        end else begin

        PagtoPendente := 'Pendente';

        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('UPDATE TBLRECEBEVENDAS SET '
        + 'VLRPENDENTE = ''' + PendenteRestante + ''','
        + 'VLRPAGO = ''' + VlrLanctoPago + ''','
     //   + 'TOTALVENDA = ''' + VlrLanctoPago + ''','
        + 'SITUACAOVENDA = ''' + PagtoPendente + ''' WHERE IDVENDA = ''' + IntToStr(IDCupom) + '''');
        ibRecVendas.ExecSQL;
        Commit(ibRecVendas); }

     //   end;//if

  //    end;//if



////////////////////////////////////////////////////////////////////////////////



    end;//if confirmamsg

   {   if PagtoParcial > 0 Then begin

        TotalPago   := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));
        PagoPendente := PagtoParcial + TotalPago;

        VlrPendentePago := StringReplace(FloatToStr(PagoPendente),ThousandSeparator,'',[rfReplaceAll]);
        VlrPendentePago := StringReplace(VlrPendentePago,DecimalSeparator,'.',[rfReplaceAll]);

      end else begin

        VlrPendentePago := StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]);
        VlrPendentePago := StringReplace(VlrPendentePago,DecimalSeparator,'.',[rfReplaceAll]);

      end;

      VlrPendente := StringReplace(lbl_edtTotalemAver.Text,ThousandSeparator,'',[rfReplaceAll]);
      VlrPendente := StringReplace(VlrPendente,DecimalSeparator,'.',[rfReplaceAll]);
      if VlrPendente  = '' Then
         VlrPendente := '0';  }

////////////////////////////////////////////////////////////////////////////////

 {   if VlrCupomCx > 0 Then begin

    VlrCaixa := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));
    TotalCaixa := VlrCupomCx + VlrCaixa;

    VlrCxEntrada := StringReplace(FloatToStr(TotalCaixa),ThousandSeparator,'',[rfReplaceAll]);
    VlrCxEntrada := StringReplace(VlrCxEntrada,DecimalSeparator,'.',[rfReplaceAll]);

    end else begin

    VlrCxEntrada := StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]);
    VlrCxEntrada := StringReplace(VlrCxEntrada,DecimalSeparator,'.',[rfReplaceAll]);

    end;

    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE IDVENDA=''' + IntToStr(IDCupom) + '''');
    ibRecVendas.Open;

    if IDCupom > 0 Then begin


    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('INSERT INTO TBLRECEBEVENDAS'
    + '(IDVENDA,VLRPAGO,PAGTOPENDENTE,IDCLI,DATA,DATAEMISSAO,DATAPAGTOPENDENTE,HORA) values '
    + '(''' + IntToStr(IDCupom) + ''','
    + ' ''' + VlrCxEntrada + ''','
    + ' ''' + VlrCxEntrada + ''','
    + ' ''' + InttoStr(IDClassClienteConvenio.ID) + ''','
    + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
    + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataIni.Date) + ''','
    + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
    + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
    ibRecVendas.ExecSQL;
    Commit(ibRecVendas);

    end; }

////////////////////////////////////////////////////////////////////////////////
 {  if lbl_edtVlrPago.Text <> '' Then begin

    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE IDSERVSVENDA=''' + IntToStr(IDCupom) + ''' and IDSERVS=''' + IntToStr(IDServicos) + '''');
    ibServsVenda.Open;

    VlrParcial := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('PAGTOPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

    VlrPP      := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));

    VlrParcial := VlrParcial + VlrPP;

    TotalPagtoParcial := StringReplace(FloattoStr(VlrParcial),ThousandSeparator,'',[rfReplaceAll]);
    TotalPagtoParcial := StringReplace(TotalPagtoParcial,DecimalSeparator,'.',[rfReplaceAll]);

    end;

    Situacao := 'Pago';

    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
    +'PAGTOPARCIAL=''' + TotalPagtoParcial + ''','
    + 'DATAPAGTOPENDENTE = ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
    + 'DATAEMISSAO = ''' + FormatDateTime('mm-dd-yyyy',dtpDataIni.Date) + ''','
    + 'DATA=''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
    + 'TIPOVENDA = ''' + Situacao + ''','
    +'VLRPENDENTE=''' + VlrPendente + ''' WHERE IDCLIENTE=''' + IntToStr(IDClassClienteConvenio.ID) + ''' and IDSERVSVENDA=''' + IntToStr(IDCupom) + ''' and IDSERVS=''' + IntToStr(IDServicos) + '''');
    ibServsVenda.ExecSQL;
    Commit(ibServsVenda);



    Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.CONDICOESPAGTOSERV,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
    + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.NUMEROCUPOM,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
    + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VLRPENDENTE,TBLSERVICOSVENDAS.PAGTOPARCIAL,'
    + 'TBLSERVICOSVENDAS.VLRPARCIAL,TBLSERVICOSVENDAS.TOTALPARCIAL,TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.IDSERVS,'
    + 'TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSVENDAS.NOMESERVICO,TBLRECEBEVENDAS.VLRPAGO,'
    + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
    + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
    + 'WHERE TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''' + TipoPendente + ''' and (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) and TBLSERVICOSVENDAS.IDCLIENTE=''' + IntToStr(IDClassClienteConvenio.ID) + '''ORDER BY TBLSERVICOSVENDAS.IDSERVS');// and TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + '''');//(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
    ibServsVenda.Open;

    ibServsVenda.Close;
    ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
    ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
    ibServsVenda.Open;

    (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('TOTALPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRPENDENTE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('PAGTOPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO }


   // end;{if confirmamsg}

  {  lbl_edtNumCupom.Text    := '';
    lbl_edtTotalPendente.Text := '';
    lbl_edtVlrPago.Text := '';
    lbl_edtTotalemAver.Text := '';  }

  end;{with}

end;

procedure TfrmLanctoPendentes.ibeaCancelaprodClick(Sender: TObject);

begin

  cboCliente.ClearSelection;
  lbl_edtNumCupom.Text    := '';
  lbl_edtTotalPendente.Text := '';
  lbl_edtVlrPago.Text := '';
  lbl_edtTotalemAver.Text := '';

  with dmModule do begin

    ibServsVenda.Close;

  end;{with}

end;

procedure TfrmLanctoPendentes.dtpDataFinalChange(Sender: TObject);
var

ValorPendente, ValorParcial, TotaldoPendente : Real;
ValorTotalPen, ValorParcialPago : String;
TotalPendente : Real;

begin

  with dmModule do begin

  if ValorPendente > 0 Then begin

  ValorPendente := 0;

  end;

    if ValorTotalPen > '0' Then begin

      ValorTotalPen :='0';

    end;

    if (ValorParcialSomado > 0) Then begin

      ValorParcialSomado := 0;

    end;

  if ValorGeralCX > 0 Then begin

  ValorGeralCX := 0;

  end;
 //   if lbl_edtNumCupom.Text <> '' Then begin

   //   TipoPendente:= 'Pagto Retirada';
////////////////////////////////////////////////////////////////////////////////

    if cboCliente.ItemIndex > - 1 Then begin

      IDClassClienteConvenio := TClasseCombo( cboCliente.Items.Objects[cboCliente.ItemIndex] );

    end;

//,TBLRECEBEVENDAS.VLRPAGO,'
//    + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
//    + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDRECEBEVENDAS


    Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE TBLSERVICOSVENDAS.PENDENTEPAGO=''Pendente'' and (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) and TBLSERVICOSVENDAS.IDCLIENTE=''' + IntToStr(IDClassClienteConvenio.ID) + '''ORDER BY TBLSERVICOSVENDAS.IDSERVS');// and TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + '''');//(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
    ibServsVenda.Open;

    ibServsVenda.Close;
    ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
    ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
    ibServsVenda.Open;


     (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
   //  (ibServsVenda.FieldByName('VLRPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
  //   (ibServsVenda.FieldByName('TOTALPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('TOTALCUSTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
  //   (ibServsVenda.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VLRPENDENTE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('PAGTOPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO



////////////////////////////////////////////////////////////////////////////////

       while not ibServsVenda.Eof do begin//enquanto nao for fim de registro


          if (ValorPendente = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorPendente := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalPen := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorPendente := ValorPendente + StrtoFloat(StringReplace(ValorTotalPen,ThousandSeparator,'',[rfReplaceAll]));

           end;{if}

////////////////////////////////////////////////////////////////////////////////

           if (ValorParcial = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorParcial := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('PAGTOPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorParcialPago := StringReplace(FloattoStr(ibServsVenda.FieldByName('PAGTOPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorParcial := ValorParcial + StrtoFloat(StringReplace(ValorParcialPago,ThousandSeparator,'',[rfReplaceAll]));

           end;{if}


          if ValorParcial > 0 Then begin

          TotaldoPendente := ValorPendente - ValorParcial;

          end else begin

          TotaldoPendente := ValorPendente;

          end;//if



////////////////////////////////////////////////////////////////////////////////





          ibServsVenda.Next;

       end;{while}

       lbl_edtTotalPendente.Text := FormatFloat(CasasDecimais('Produtos'),TotaldoPendente);

////////////////////////////////////////////////////////////////////////////////



  {  if cboCliente.ItemIndex > - 1 Then begin

      IDClassClienteConvenio := TClasseCombo( cboCliente.Items.Objects[cboCliente.ItemIndex] );



    Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
    + 'TBLCADASTRO.NOME As Cliente, TBLRECEBEVENDAS.VLRPAGO,TBLRECEBEVENDAS.TOTALAPAGAR FROM TBLSERVICOSVENDAS '                                                                          // and TBLSERVICOSVENDAS.TIPOVENDA=''A Vista'' and TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''Pagto Retirada''
    + 'INNER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
    + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA '
    + 'WHERE TBLSERVICOSVENDAS.IDCLIENTE=''' + IntToStr(IDClassClienteConvenio.ID) + '''  and(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and TBLSERVICOSVENDAS.TIPOVENDA=''A Vista'' and TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''Pagto Retirada''');
    ibServsVenda.Open;

    ibServsVenda.Close;
    ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
    ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
    ibServsVenda.Open;

    (ibServsVenda.FieldByName('TOTALAPAGAR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos');} //CRIA UMA MASCARA PARA O CAMPO


////////////////////////////////////////////////////////////////////////////////

  {  while not ibServsVenda.Eof do begin//enquanto nao for fim de registro


          if (ValorGeralCX = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeralCX := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalCX := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorGeralCX := ValorGeralCX + StrtoFloat(StringReplace(ValorTotalCX,ThousandSeparator,'',[rfReplaceAll]));

           end;{if}

         //  ibServsVenda.Next; }

  // end;{while}



////////////////////////////////////////////////////////////////////////////////



  {  Commit(ibRecVendas);
    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.*,TBLSERVICOSVENDAS.IDCLIENTE '
    + 'FROM TBLRECEBEVENDAS INNER JOIN TBLSERVICOSVENDAS ON TBLRECEBEVENDAS.IDRECEBEVENDAS=TBLSERVICOSVENDAS.IDSERVS '
    + 'WHERE TBLRECEBEVENDAS.IDCLI=''' + IntToStr(IDClassClienteConvenio.ID) + ''' and(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) and TBLSERVICOSVENDAS.TIPOVENDA=''Pendente'' and TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''Pagto Retirada''');
    ibRecVendas.Open;

    ibRecVendas.Close;
    ibRecVendas.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
    ibRecVendas.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
    ibRecVendas.Open;

    IDVenda := ibRecVendas.FieldByName('IDRECEBEVENDAS').AsInteger;

    (ibRecVendas.FieldByName('TOTALAPAGAR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibRecVendas.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos');}//CRIA UMA MASCARA PARA O CAMPO
  // (ibRecVendas.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO



     {   while not ibRecVendas.Eof do begin//enquanto nao for fim de registro

          if ValorGeral = 0 Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeral := StrtoFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('TOTALAPAGAR').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotal := StringReplace(FloattoStr(ibRecVendas.FieldByName('TOTALAPAGAR').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorGeral := ValorGeral + StrtoFloat(StringReplace(ValorTotal,ThousandSeparator,'',[rfReplaceAll]));  }

        //  end;{if}

       //   ibRecVendas.Next;//vai para o pproximo registro pro looping nao ficar infinito.

      //  end;{while}







         { if (ValorParcialSomado = 0) Then begin

             ValorParcialSomado := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin }

           //   TotalParcialSomado := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //  ValorParcialSomado := ValorParcialSomado + StrtoFloat(StringReplace(TotalParcialSomado,ThousandSeparator,'',[rfReplaceAll]));

         //  end;}{if}
////////////////////////////////////////////////////////////////////////////////

         {  if ValorParcialSomado > 0 Then begin

           ValorGeralCX := ValorGeralCX - ValorParcialSomado;
           lbl_edtVlrParcialLancto.Text    := FormatFloat(CasasDecimais('Produtos'),ValorParcialSomado);

           end else begin

           ValorGeralCX := ValorGeralCX;
           lbl_edtVlrParcialLancto.Text    := '0,00';

           end; }


      //    ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.


   //     end;{while}

    //   if lbl_edtTotalCupom.Text = '0,00' Then begin

     //   lbl_edtTotalCuponsPeriodo.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeralCX);
     //   lbl_edtVlrParcialLancto.Text    := FormatFloat(CasasDecimais('Produtos'),ValorParcialSomado);

     //  end;

  //  end; {uf cbocliente}
////////////////////////////////////////////////////////////////////////////////

 {   if cboCliente.ItemIndex = - 1 Then begin

    Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
    + 'TBLCADASTRO.NOME As Cliente, TBLRECEBEVENDAS.VLRPAGO FROM TBLSERVICOSVENDAS '
    + 'INNER JOIN TBLCADASTRO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADASTRO.IDCAD '
    + 'INNER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA '
    + 'WHERE TBLSERVICOSVENDAS.TIPOVENDA=''Pendente'' and(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)');
    ibServsVenda.Open;

    ibServsVenda.Close;
    ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
    ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
    ibServsVenda.Open;

    (ibServsVenda.FieldByName('TOTALAPAGAR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


        while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

          if ValorGeral = 0 Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeral := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('TOTALAPAGAR').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotal := StringReplace(FloattoStr(ibServsVenda.FieldByName('TOTALAPAGAR').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorGeral := ValorGeral + StrtoFloat(StringReplace(ValorTotal,ThousandSeparator,'',[rfReplaceAll]));

          end;{if}

      //    ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.

    //    end;{while}

    //   lbl_edtVlrParcialLancto.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeral);  }

////////////////////////////////////////////////////////////////////////////////

  {  while not ibServsVenda.Eof do begin//enquanto nao for fim de registro


          if (ValorGeralCX = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeralCX := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalCX := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorGeralCX := ValorGeralCX + StrtoFloat(StringReplace(ValorTotalCX,ThousandSeparator,'',[rfReplaceAll]));

           end;{if}

////////////////////////////////////////////////////////////////////////////////
         { if (ValorParcialSomado = 0) Then begin

             ValorParcialSomado := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin }

           //   TotalParcialSomado := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //  ValorParcialSomado := ValorParcialSomado + StrtoFloat(StringReplace(TotalParcialSomado,ThousandSeparator,'',[rfReplaceAll]));

         //  end;}{if}
////////////////////////////////////////////////////////////////////////////////

         {  if ValorParcialSomado > 0 Then begin

           ValorGeralCX := ValorGeralCX - ValorParcialSomado;
           lbl_edtVlrParcialLancto.Text    := FormatFloat(CasasDecimais('Produtos'),ValorParcialSomado);

           end else begin

           ValorGeralCX := ValorGeralCX;
           lbl_edtVlrParcialLancto.Text    := '0,00';

           end; }


     //    ibServsVenda.Next;//vai para o pproximo registro pro looping nao ficar infinito.


     //   end;{while}

 //      if lbl_edtTotalCupom.Text = '0,00' Then begin

     //   lbl_edtTotalCuponsPeriodo.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeralCX);
  //      lbl_edtVlrParcialLancto.Text    := FormatFloat(CasasDecimais('Produtos'),ValorParcialSomado);

  //     end;


       {    if ( ValorGeralCX > 0 ) and ( ValorGeral > 0 ) Then begin

           TotalPendente := ValorGeralCX + ValorGeral;

           end;

           if (ValorGeralCX > 0) and (ValorGeral = 0) Then begin

           TotalPendente := ValorGeralCX;

           end;

           if (ValorGeral > 0) and (ValorGeralCX  = 0) Then begin

           TotalPendente := ValorGeral;

           end;


           lbl_edtVlrParcialLancto.Text := FormatFloat(CasasDecimais('Produtos'),TotalPendente);  }



  end;{with}

end;

procedure TfrmLanctoPendentes.lbl_edtNumCupomKeyPress(Sender: TObject;
  var Key: Char);
begin

//  if key =#13 Then begin

//    lbl_edtTotalCupom.SetFocus;

//  end;

end;

procedure TfrmLanctoPendentes.ibeaExcluirClick(Sender: TObject);
var

TipoPendente,Pagto : String;

begin


  with dmModule do begin

 //   if lbl_edtNumCupom.Text <> '' Then begin

  //    TipoPendente:= 'Pagto Retirada';

 //  end;

   { Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.CONDICOESPAGTOSERV,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
    + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.NUMEROCUPOM,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
    + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,'
    + 'TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSLAV.NOMESERVICO,TBLRECEBEVENDAS.VLRPAGO,'
    + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
    + 'LEFT OUTER JOIN TBLSERVICOSLAV ON TBLSERVICOSVENDAS.IDPROD=TBLSERVICOSLAV.IDTIPOSERVICO '
    + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
    + 'WHERE TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''' + TipoPendente + '''and TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + '''');//(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
    ibServsVenda.Open;
     (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO }

 +   ConfirmaMSG := Application.MessageBox('Confirma a exclusão','Notificação Lançamento de Pendencia',+MB_YESNO+MB_ICONINFORMATION);

  {  if ConfirmaMSG = 6 then begin
       Pagto := 'Pagto Entrega';
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
      + 'CONDICOESPAGTOSERV=''' + Pagto + ''' WHERE IDSERVSVENDA=''' + (lbl_edtNumCupom.Text) + '''');
      ibServsVenda.ExecSQL;
      Commit(ibServsVenda);

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.CONDICOESPAGTOSERV,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.NUMEROCUPOM,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,'
      + 'TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSLAV.NOMESERVICO,TBLRECEBEVENDAS.VLRPAGO,'
      + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLSERVICOSLAV ON TBLSERVICOSVENDAS.IDPROD=TBLSERVICOSLAV.IDTIPOSERVICO '
      + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
      + 'WHERE TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''' + TipoPendente + '''and TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + '''');//(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
      ibServsVenda.Open;

     (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     lbl_edtNumCupom.Text := '';
     lbl_edtTotalCupom.Text := '0,00';   }

 //   end;{if confirma msg}


  end;{with}


end;

procedure TfrmLanctoPendentes.lbl_edtVlrParcialExit(Sender: TObject);

//var

//Valor1,Valor2 : Real;

begin

{ if lbl_edtVlrParcial.Text <> '' Then begin

  if lbl_edtTotalCupom.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtTotalCupom.Text)>0) and (lbl_edtTotalCupom.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtTotalCupom.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrParcial.Text,ThousandSeparator,'',[rfReplaceAll]));

      lbl_edtTotalParcial.Text := FormatFloat(',0.00',(Valor1 - Valor2));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtTotalCupom.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrParcial.Text,ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtTotalParcial.Text := FormatFloat(',0.00',(Valor1 - Valor2));  }

 //   end;{if}

 // end;{if}

// end;{if lbl vlrparcial}

end;

procedure TfrmLanctoPendentes.lbl_edtVlrParcialKeyPress(Sender: TObject;
  var Key: Char);
begin

//  if key=#13 Then begin

 //   lbl_edtTotalParcial.SetFocus;

//  end;

end;

procedure TfrmLanctoPendentes.lbl_edtVlrPagoExit(Sender: TObject);
var

Valor1,Valor2 : Real;

begin

// if lbl_edtVlrPago.Text <> '' Then begin

  if lbl_edtVlrPago.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtVlrPago.Text)>0) and (lbl_edtVlrPago.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtTotalPendente.Text,ThousandSeparator,'',[rfReplaceAll]));

      lbl_edtTotalemAver.Text := FormatFloat(',0.00',(Valor2 - Valor1));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtTotalPendente.Text,ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtTotalemAver.Text := FormatFloat(',0.00',(Valor2 - Valor1));

    end;{if}

   end;{if}

   lbl_edtVlrPago.Text := FormatFloat(CasasDecimais('Produtos'),StrToFloat(lbl_edtVlrPago.Text)); 

// end;{if lbl vlrparcial}


end;

procedure TfrmLanctoPendentes.lbl_edtVlrPagoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 Then begin

    lbl_edtTotalemAver.SetFocus;

  end;

end;

procedure TfrmLanctoPendentes.dbgPendentesCellClick(Column: TColumn);
begin

  with dmModule do begin


  {  Commit(ibServsVenda);
    ibServsVenda.Close;
    ibServsVenda.SQL.Clear;
    ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.CONDICOESPAGTOSERV,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
    + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.NUMEROCUPOM,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
    + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VLRPENDENTE,TBLSERVICOSVENDAS.PAGTOPARCIAL,'
    + 'TBLSERVICOSVENDAS.VLRPARCIAL,TBLSERVICOSVENDAS.TOTALPARCIAL,TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.IDSERVS,'
    + 'TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSVENDAS.NOMESERVICO,TBLRECEBEVENDAS.VLRPAGO,'
    + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
    + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
    + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVS');// and TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + '''');//(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
    ibServsVenda.Open;

    ibServsVenda.Close;
    ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
    ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
    ibServsVenda.Open; }

    IDCupom    := ibServsVenda.FieldByName('IDSERVSVENDA').AsInteger;
    IDServicos := ibServsVenda.FieldByName('IDSERVS').AsInteger;
                                                                                                          // and IDSERVS=''' + IntToStr(IDServicos) + '''

   //   PagtoParcial := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('PAGTOPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));


    if ibServsVenda.RecordCount > 0 Then begin

      lbl_edtNumCupom.Text       := IntToStr(ibServsVenda.FieldByName('IDSERVSVENDA').AsInteger);

      if ibServsVenda.FieldByName('VLRPENDENTE').AsFloat = 0 Then begin

        lbl_edtTotalPendente.Text  := FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRTOTAL').AsFloat);

      end else begin

        lbl_edtTotalPendente.Text  := FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRPENDENTE').AsFloat);

      end;//if

      dtpDataIni.Date            := ibServsVenda.FieldByName('DATA').AsDateTime;

    end;{if recordcount}

////////////////////////////////////////////////////////////////////////////////

    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE IDVENDA=''' + IntToStr(IDCupom) + '''');
    ibRecVendas.Open;

    VlrCupomCx := StrtoFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

    while not ibRecVendas.Eof do begin

      IDRecVendas := ibRecVendas.FieldByName('IDRECEBEVENDAS').AsInteger;

      ibRecVendas.Next;

    end;//while



    {  Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE IDSERVSVENDA=''' + IntToStr(IDCupom) + ''' and IDSERVS''' + IntToStr(IDServicos) + '''');
      ibServsVenda.Open; }

  end;{with}

end;

procedure TfrmLanctoPendentes.ibeaRetornaClick(Sender: TObject);

var

TipoPendente,Pagto,Historico,TipoVenda,CodCli,VlraPagar,VlrPendente : String;
IDClienteP : Integer;
TotalPago,PagoPendente : Real;
VlrPendentePago : String;
VlrParcial,VlrPP : Real;
TotalPagtoParcial : String;
ParcialPago : String;
PendenteAtual, PendenteRetorno : Real;
PendenteAtuallizado : String;

begin

  with dmModule do begin


    ConfirmaMSG := Application.MessageBox('Retorna o lançamento','Notificação Retorno de Pendencia',+MB_YESNO+MB_ICONQUESTION);

    if ConfirmaMSG = 6 then begin


      if cboCliente.ItemIndex > - 1 Then begin

        IDClassClienteConvenio := TClasseCombo( cboCliente.Items.Objects[cboCliente.ItemIndex] );

      end;


     { VlraPagar := StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]);
      VlraPagar := StringReplace(VlraPagar,DecimalSeparator,'.',[rfReplaceAll]);
      if VlraPagar  = '' Then
         VlraPagar := '0'; }

  {  if ckRetorno.Checked Then begin

      if PagtoParcial > 0 Then begin

        TotalPago    := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));
        PagoPendente := PagtoParcial - TotalPago;

        VlrPendentePago := StringReplace(FloatToStr(PagoPendente),ThousandSeparator,'',[rfReplaceAll]);
        VlrPendentePago := StringReplace(VlrPendentePago,DecimalSeparator,'.',[rfReplaceAll]);

      end else begin

        VlrPendentePago := StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]);
        VlrPendentePago := StringReplace(VlrPendentePago,DecimalSeparator,'.',[rfReplaceAll]);

      end;

      VlrPendente := StringReplace(lbl_edtTotalemAver.Text,ThousandSeparator,'',[rfReplaceAll]);
      VlrPendente := StringReplace(VlrPendente,DecimalSeparator,'.',[rfReplaceAll]);
      if VlrPendente  = '' Then
         VlrPendente := '0'; }

////////////////////////////////////////////////////////////////////////////////

 {   if VlrCupomCx > 0 Then begin

    VlrCaixa := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));
    TotalCaixa := VlrCupomCx - VlrCaixa;

    VlrCxEntrada := StringReplace(FloatToStr(TotalCaixa),ThousandSeparator,'',[rfReplaceAll]);
    VlrCxEntrada := StringReplace(VlrCxEntrada,DecimalSeparator,'.',[rfReplaceAll]);

    end else begin

    VlrCxEntrada := StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]);
    VlrCxEntrada := StringReplace(VlrCxEntrada,DecimalSeparator,'.',[rfReplaceAll]);

    end;

    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE IDVENDA=''' + IntToStr(IDCupom) + '''');
    ibRecVendas.Open;

    if ibRecVendas.FieldByName('IDVENDA').AsInteger > 0 Then begin  }

   { ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('UPDATE TBLRECEBEVENDAS SET '
    +'DATAPAGTOPENDENTE=''' + FormatDateTime('mm/dd/yyyy',dtpDataPagtoP.Date) + ''','
     +'PAGTOPENDENTE=''' + VlrCxEntrada + ''','
    +'VLRPAGO=''' + VlrCxEntrada + ''' WHERE IDCLI=''' + IntToStr(IDClassClienteConvenio.ID) + ''' and IDVENDA=''' + IntToStr(IDCupom) + '''');
    ibRecVendas.ExecSQL;
    Commit(ibRecVendas);

    end else begin  }

    ibRecVendas.Close;
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('DELETE FROM TBLRECEBEVENDAS WHERE IDRECEBEVENDAS=''' + IntToStr(IDRecVendas) + '''');
    ibRecVendas.ExecSQL;
    Commit(ibRecVendas);

    //end;

////////////////////////////////////////////////////////////////////////////////

    if ckRetorno.Checked Then begin

     if lbl_edtVlrPago.Text <> '' Then begin

      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE IDSERVSVENDA=''' + IntToStr(IDCupom) + '''');
      ibServsVenda.Open;

      VlrParcial := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('PAGTOPARCIAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

      VlrPP      := StrToFloat(StringReplace(lbl_edtVlrPago.Text,ThousandSeparator,'',[rfReplaceAll]));

      VlrParcial := VlrParcial - VlrPP;

      TotalPagtoParcial := StringReplace(FloattoStr(VlrParcial),ThousandSeparator,'',[rfReplaceAll]);
      TotalPagtoParcial := StringReplace(TotalPagtoParcial,DecimalSeparator,'.',[rfReplaceAll]);
////////////////////////////////////////////////////////////////////////////////

      PendenteAtual := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRPENDENTE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

      PendenteRetorno := PendenteAtual + VlrPP;

      PendenteAtuallizado := StringReplace(FloattoStr(PendenteRetorno),ThousandSeparator,'',[rfReplaceAll]);
      PendenteAtuallizado := StringReplace(PendenteAtuallizado,DecimalSeparator,'.',[rfReplaceAll]);


      end;

      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
      +'PAGTOPARCIAL=''' + TotalPagtoParcial + ''','
      + 'DATA=''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
      +'VLRPENDENTE=''' + PendenteAtuallizado + ''' WHERE IDCLIENTE=''' + IntToStr(IDClassClienteConvenio.ID) + ''' and IDSERVSVENDA=''' + IntToStr(IDCupom) + ''' and IDSERVS=''' + IntToStr(IDServicos) + '''');
      ibServsVenda.ExecSQL;
      Commit(ibServsVenda);

    {  ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('INSERT INTO TBLSERVICOSVENDAS'
      +'(PAGTOPARCIAL,VLRPENDENTE,IDSERVSVENDA,DATA,IDCLIENTE) values '
      + '(''' + TotalPagtoParcial + ''','
      + ' ''' + VlrPendente + ''','
      + ' ''' + IntToStr(IDCupom) + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy',dtpDataPagtoP.Date) + ''','
      + ' ''' + IntToStr(IDClassClienteConvenio.ID) + ''')');
      ibServsVenda.ExecSQL; }

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.CONDICOESPAGTOSERV,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.NUMEROCUPOM,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VLRPENDENTE,TBLSERVICOSVENDAS.PAGTOPARCIAL,'
      + 'TBLSERVICOSVENDAS.VLRPARCIAL,TBLSERVICOSVENDAS.TOTALPARCIAL,TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.IDSERVS,'
      + 'TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSVENDAS.NOMESERVICO,TBLRECEBEVENDAS.VLRPAGO,'
      + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
      + 'WHERE TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''' + TipoPendente + ''' and (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) and TBLSERVICOSVENDAS.IDCLIENTE=''' + IntToStr(IDClassClienteConvenio.ID) + '''ORDER BY TBLSERVICOSVENDAS.IDSERVS');// and TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + '''');//(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
      ibServsVenda.Open;

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
      ibServsVenda.Open;

      (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('VLRPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('TOTALPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('VLRPENDENTE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('PAGTOPARCIAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


     { Commit(ibRecVendas);
      ibRecVendas.Close;
      ibRecVendas.SQL.Clear;
      ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.*,TBLSERVICOSVENDAS.IDCLIENTE '
      + 'FROM TBLRECEBEVENDAS INNER JOIN TBLSERVICOSVENDAS ON TBLRECEBEVENDAS.IDRECEBEVENDAS=TBLSERVICOSVENDAS.IDSERVS '
      + 'WHERE TBLRECEBEVENDAS.IDCLI=''' + IntToStr(IDClassClienteConvenio.ID) + ''' and TBLSERVICOSVENDAS.TIPOVENDA=''Pendente'' and(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)');
      ibRecVendas.Open;

      ibRecVendas.Close;
      ibRecVendas.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibRecVendas.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
      ibRecVendas.Open;   }


    //  (ibRecVendas.FieldByName('TOTALAPAGAR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    //  (ibRecVendas.FieldByName('VLRPAGO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


      //   Pagto := 'Pagto Entrega';

     {   if lbl_edtVlrParcial.Text = '' Then begin

          ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
          + 'CONDICOESPAGTOSERV=''' + Pagto + ''' WHERE IDSERVSVENDA=''' + (lbl_edtNumCupom.Text) + '''');
          ibServsVenda.ExecSQL;
          Commit(ibServsVenda);

        end;}{if lblvlrparcial}

     //   if (lbl_edtVlrParcial.Text <> '') and (lbl_edtTotalParcial.Text <> '') Then begin

         {   Pagto     := 'Pagto Retirada';
            Historico := 'Pagto Parcial';
            TipoVenda := 'A Vista';

            ValorParcial := StringReplace(lbl_edtVlrParcial.Text,ThousandSeparator,'',[rfReplaceAll]);
            ValorParcial := StringReplace(ValorParcial,DecimalSeparator,'.',[rfReplaceAll]);
            if ValorParcial  = '' Then
               ValorParcial := '0';

            TotalParcial := StringReplace(lbl_edtTotalParcial.Text,ThousandSeparator,'',[rfReplaceAll]);
            TotalParcial := StringReplace(TotalParcial,DecimalSeparator,'.',[rfReplaceAll]);
            if TotalParcial  = '' Then
               TotalParcial := '0';

          ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('INSERT INTO TBLSERVICOSVENDAS'
          + '(IDSERVSVENDA,IDCLIENTE,CONDICOESPAGTOSERV,HISTORICO,DATA,TIPOVENDA,'
          + 'CODCLI,NUMEROCUPOM,VLRPARCIAL,TOTALPARCIAL) values '
          + '(''' + lbl_edtNumCupom.Text + ''','
          + ' ''' + IntToStr(IDClienteP) + ''','
          + ' ''' + Pagto + ''','
          + ' ''' + Historico + ''','
          + ' ''' + FormatDateTime('mm-dd-yyyy',Now) + ''','
          + ' ''' + TipoVenda + ''','
          + ' ''' + CodCli + ''','
          + ' ''' + lbl_edtNumCupom.Text + ''','
          + ' ''' + ValorParcial + ''','
          + ' ''' + TotalParcial + ''')');
          ibServsVenda.Open;
          Commit(ibServsVenda);   }

      end;{if confirmamsg}

      lbl_edtNumCupom.Text    := '';
      lbl_edtTotalPendente.Text := '';
      lbl_edtVlrPago.Text := '';
      lbl_edtTotalemAver.Text := '';


      {  Commit(ibServsVenda);
        ibServsVenda.Close;
        ibServsVenda.SQL.Clear;
        ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.CONDICOESPAGTOSERV,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
        + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.NUMEROCUPOM,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
        + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.NOMEPROD,'
        + 'TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSVENDAS.NOMESERVICO,TBLRECEBEVENDAS.VLRPAGO,'
        + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA,TBLCADDOCUMENTACAO.CODIGO As CodCli FROM TBLSERVICOSVENDAS '
        + 'LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADDOCUMENTACAO.IDCAD '
        + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
        + 'WHERE TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''' + TipoPendente + '''and TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + '''');//(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
        ibServsVenda.Open;  }

  //     (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
  //     (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


   //    lbl_edtNumCupom.Text := '';
    //   lbl_edtTotalCupom.Text := '0,00';

    //  end;{if confirma msg}

    end;//if ckretorno

  end;{with}

end;

end.
