unit untFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, IBQuery;

type
  TfrmFluxoCaixa = class(TForm)
    dbgFluxoCaixa: TDBGrid;
    lbl_edtTotalFluxo: TLabeledEdit;
    dtpData: TDateTimePicker;
    lbl_F2: TLabel;
    lbl_Data: TLabel;
    Label1: TLabel;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECT;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoCaixa: TfrmFluxoCaixa;
  MontaColunas : Boolean;

implementation

uses untdmModule, funcPosto, DB, 
  Daruma_Framework_Autenticar, Daruma_Framework_Exemplo_Dual_01,
  Daruma_Framework_Exemplo_DUAL_02, Daruma_Framework_Impressora_Dual,
  Daruma_Framework_Looping_Verificacao_Status,
  Daruma_Framework_Looping_Verificacao_Status_Doc,
  Daruma_Framework_Variaveis_Globais, Daruma_Framework_DUAL_ImprimirTexto;
Function Daruma_DUAL_ImprimirTexto( TextoLivre: String; TamanhoTexto: Integer ): Integer; StdCall; External 'Daruma32.dll'
{$R *.dfm}

procedure TfrmFluxoCaixa.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmFluxoCaixa.ExecSELECT;

var

TotalFluxoCaixa : Real;
TotalFluxo : String;

begin

  if TotalFluxoCaixa > 0 then begin

    TotalFluxoCaixa := 0;

  end;

  if TotalFluxo > '0' Then begin

    TotalFluxo := '0';

  end;

  with dmModule do begin

    Commit(ibTempVendaLoja);
    ibTempVendaLoja.Close;
    ibTempVendaLoja.SQL.Clear;
    ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,TBLSERVICOSVENDAS.POSVENDA,TBLSERVICOSVENDAS.NOMEPROD,'
    + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.PENDENTEPAGO,'
    + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.VLRTROCA,TBLSERVICOSVENDAS.NOMEVENDA,'
    + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.TOTALVLRPROD,TBLSERVICOSVENDAS.VLRSANGRIA,'
    + 'TBLSERVICOSVENDAS.IDTIPOPAGTO,TBLTIPOCOMPROMISSO.NOME As Compromisso,CADPRODUTOS.NOME As Produto,'
    + 'TBLTIPOPAGTOAVULSO.TIPOPAGTO As TipodePagto,TBLTIPOPAGTOAVULSO.IDTIPO As TipodeID,'
    + 'TBLTIPOPAGTOAVULSO.DESCRICAO As NomedoCartao FROM TBLSERVICOSVENDAS '
    + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
    + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
    + 'LEFT OUTER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
    + 'WHERE(TBLSERVICOSVENDAS.DATA= ''' + FormatDateTime('mm-dd-yyyy',dtpData.Date) + ''')and(TBLSERVICOSVENDAS.POSVENDA=''Pago'')ORDER BY IDSERVSVENDA ASC');
    ibTempVendaLoja.Open;

    (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
    (ibTempVendaLoja.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
    (ibTempVendaLoja.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

      while not ibTempVendaLoja.Eof do begin

        if TotalFluxoCaixa = 0 Then begin

          TotalFluxoCaixa := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfreplaceAll]));

        end else begin

          TotalFluxo := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

          TotalFluxoCaixa := TotalFluxoCaixa + StrtoFloat(StringReplace(TotalFluxo,ThousandSeparator,'',[rfReplaceAll]));

        end;//if

         ibTempVendaLoja.Next;

      end;//while

      lbl_edtTotalFluxo.Text := FormatFloat(CasasDecimais('Produtos'),TotalFluxoCaixa);

  end;//with

end;

procedure TfrmFluxoCaixa.FormShow(Sender: TObject);
begin

  dtpData.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin

    ExecSELECT;
    
    with dbgFluxoCaixa do begin

      if MontaColunas Then begin

        DataSource := dmModule.dtsTempVendaLoja;

        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);
        Columns.Insert(5);

        //Parametros da Coluna que exibe o Código do Produto
        // Parametros que exibe o nome do produto
        Columns.Items[0].Title.Caption := 'Nº Cupom';
        Columns.Items[0].FieldName     := 'IDSERVSVENDA';
        Columns.Items[0].Width         := 70;
        Columns.Items[0].Alignment     := taLeftJustify;


        Columns.Items[1].Title.Caption := 'Produto';
        Columns.Items[1].FieldName     := 'NOMEPROD';
        Columns.Items[1].Width         := 250;
        Columns.Items[1].Alignment     := taLeftJustify;


        // Parametros que exibe o Bico da Bomba
        Columns.Items[2].Title.Caption := 'Vlr.Unit.';
        Columns.Items[2].FieldName     := 'VLRUNIT';
        Columns.Items[2].Width         := 80;
        Columns.Items[2].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[3].Title.Caption := 'Qtde.';
        Columns.Items[3].FieldName     := 'QTDE';
        Columns.Items[3].Width         := 70;
        Columns.Items[3].Alignment     := taLeftJustify;

        // Parametros que exibe o Bico da Bomba
        Columns.Items[4].Title.Caption := 'Total';
        Columns.Items[4].FieldName     := 'VLRTOTAL';
        Columns.Items[4].Width         := 80;
        Columns.Items[4].Alignment     := taLeftJustify;

        Columns.Items[5].Title.Caption := 'Data';
        Columns.Items[5].FieldName     := 'DATA';
        Columns.Items[5].Width         := 80;
        Columns.Items[5].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with monta colunas}

  end;//with
  
end;

procedure TfrmFluxoCaixa.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmFluxoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  var

VlrDinheiro,VlrCheque,VlrChequePre : String;
TotalDinheiro,TotalCheque,TotalChequePre,TotalPendente : Real;
VlrNota,VlrVisaCredito,VlrVisaDebito,VlrVisaParcelado,VlrMastercardCredito : String;
TotalNota,TotalVisaCredito,TotalVisaDebito,TotalVisaParcelado,TotalMastercardCredito : Real;
VlrMastercardDebito,VlrHipercard,VlrMastercardParcelado,VlrAmericanExpress : String;
TotalMastercardParcelado,TotalHipercard,TotalAmericanExpress : Real;
VlrGeral,VlrPendente,VlrCartao : String;
TotalGeral,TotalMastercardDebito, TotalVendido, TotalLiquido : Real;

IDDinheiro, IDCheque, IDChequePre,IDPendente, IDCartao : Integer;
IDVisaCredito, IDVisaDebito, IDVisaParcelado, IDMastercardCredito, IDMastercardDebito : Integer;
IDMastercardParcelado,IDHipercard, IDAmericanExpress, IDSoroCred: Integer;

VisaCredito1,VisaCredito2,VisaCredito3,VisaCredito4, TotalCartao : Real;
VisaDebito1,VisaDebito2,VisaDebito3,VisaDebito4 : Real;
VisaParcelado1,VisaParcelado2,VisaParcelado3,VisaParcelado4 : Real;

MastercardCredito1,MastercardCredito2,MastercardCredito3,MastercardCredito4 : Real;
MastercardDebito1,MastercardDebito2,MastercardDebito3,MastercardDebito4 : Real;
MastercardParcelado1,MastercardParcelado2,MastercardParcelado3,MastercardParcelado4 : Real;

TotalPagoPendente, TotalSoroCred : Real;
VlrPagoPendente, VlrSoroCred : String;

DadosCupom : Array[0..5] of String;
DataIni, DataFim : String;
IDSodex : Integer;
TotalSodex : Real;
ValorSodex : String;

TotalDesconto,TotalAcrescimo : Real;
VlrDesconto,VlrAcrescimo : String;

QtdedeSaltos : String;

ConfirmaImpressao : Integer;

begin

  with dmModule do begin

    case key of

       VK_f1:Begin

        Commit(ibConfig);
        ibConfig.Close;
        ibConfig.SQL.Clear;
        ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
        ibConfig.Open;

        QtdedeSaltos       := IntToStr(ibConfig.FieldByName('QTDESALTOS').AsInteger);

        ConfirmaImpressao := Application.MessageBox('Confirma a Impressão?','IMPRIMIR FLUXO',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);


        if ConfirmaImpressao = 6 Then begin

          Commit(ibTempServicosVendas);
          ibTempServicosVendas.Close;                                                ///  As TipodePagto                                          //  and SITUACAOVENDA<> ''Pendente''
          ibTempServicosVendas.SQL.Clear;
          ibTempServicosVendas.SQL.Add('SELECT TBLSERVICOSVENDAS.*,TBLTIPOPAGTOAVULSO.TIPOPAGTO FROM TBLSERVICOSVENDAS '
          + 'INNER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO WHERE(TBLSERVICOSVENDAS.DATA=''' + FormatDateTime('mm-dd-yyyy',Now) + ''') ');
          ibTempServicosVendas.Open;

          (ibTempServicosVendas.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := ',0.00';
          (ibTempServicosVendas.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';
          (ibTempServicosVendas.FieldByName('QTDE') as TFloatField).DisplayFormat := '0';

         { ibServsVenda.Close;
          ibServsVenda.ParamByName('ParamDataInicial').Value      := dtpDataCaixaIni.DateTime;
          ibServsVenda.ParamByName('ParamDataFinal').Value        := dtpDataCaixa.DateTime;
          ibServsVenda.Open; (DATA between :ParamDataInicial and :ParamDataFinal)}

          (ibTempServicosVendas.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          IDDinheiro            :=  1;
          IDCheque              :=  2;
          IDChequePre           :=  3;
          IDVisaCredito         :=  4;
          IDVisaDebito          :=  5;
          IDVisaParcelado       :=  6;
          IDMastercardCredito   :=  7;
          IDMastercardDebito    :=  8;
          IDMastercardParcelado :=  9;
          IDHipercard           := 10;
          IDAmericanExpress     := 11;
          IDPendente            := 12;
          IDSoroCred            := 14;
          IDSodex               := 15;
          IDCartao              := 16;
////////////////////////////////////////////////////////////////////////////////

          while not ibTempServicosVendas.Eof do begin


           if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('VLRTOTAL').AsInteger > 0 Then begin

               if TotalGeral = 0 Then begin

                 TotalGeral := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrGeral := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalGeral := TotalGeral + StrToFloat(StringReplace(VlrGeral,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

             end;//if

           end;

////////////////////////////////////////////////////////////////////////////////

          if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

            if ibTempServicosVendas.FieldByName('TIPOPAGTO').AsString = 'DINHEIRO' Then begin

              if TotalDinheiro = 0 Then begin

                TotalDinheiro := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                VlrDinheiro := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                TotalDinheiro := TotalDinheiro + StrToFloat(StringReplace(VlrDinheiro,ThousandSeparator,'',[rfReplaceAll]));

              end;//if

             end;//if tipopagto dinheiro

           end;

////////////////////////////////////////////////////////////////////////////////

           if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('TIPOPAGTO').AsString = 'CHEQUE' Then begin

               if TotalCheque = 0 Then begin

                 TotalCheque := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrCheque := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalCheque := TotalCheque + StrToFloat(StringReplace(VlrCheque,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

             //  lbl_edtCheque.Text   := FormatFloat(CasasDecimais('Produtos'),TotalCheque);

             end;//if tipopagto cheque

           end;

////////////////////////////////////////////////////////////////////////////////

           if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('TIPOPAGTO').AsString = 'CHEQUE PRE' Then begin

               if TotalChequePre = 0 Then begin

                 TotalChequePre := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrChequePre := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalChequePre := TotalChequePre + StrToFloat(StringReplace(VlrChequePre,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

             //  lbl_edtChequePre.Text   := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);

             end;//if tipopagto cheque

           end;

////////////////////////////////////////////////////////////////////////////////

           if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('TIPOPAGTO').AsString = 'CARTAO' Then begin

               if TotalCartao = 0 Then begin

                 TotalCartao := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrCartao := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalCartao := TotalCartao + StrToFloat(StringReplace(VlrCartao,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

            //   lbl_edtVisa.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisa);

             end;//if tipopagto cheque

           end;

////////////////////////////////////////////////////////////////////////////////

          { if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaCredito Then begin

               if TotalVisaCredito = 0 Then begin

                 TotalVisaCredito := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrVisaCredito := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalVisaCredito := TotalVisaCredito + StrToFloat(StringReplace(VlrVisaCredito,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

            //   lbl_edtVisa.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisa);

             end;//if tipopagto cheque

           end; }

////////////////////////////////////////////////////////////////////////////////

          { if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaDebito Then begin

               if TotalVisaDebito = 0 Then begin

                 TotalVisaDebito := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrVisaDebito := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalVisaDebito := TotalVisaDebito + StrToFloat(StringReplace(VlrVisaDebito,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

            //   lbl_edtVisaElectron.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisaElectron);

             end;//if tipopagto cheque

           end; }

////////////////////////////////////////////////////////////////////////////////

        {  if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaParcelado Then begin

               if TotalVisaParcelado = 0 Then begin

                 TotalVisaParcelado := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrVisaParcelado := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalVisaParcelado := TotalVisaParcelado + StrToFloat(StringReplace(VlrVisaParcelado,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

             //  lbl_edtVisaElectronPre.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisaElectronPre);

             end;//if tipopagto cheque

           end; }

////////////////////////////////////////////////////////////////////////////////

         {  if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardCredito Then begin

               if TotalMastercardCredito = 0 Then begin

                 TotalMastercardCredito := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrMastercardCredito := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalMastercardCredito := TotalMastercardCredito + StrToFloat(StringReplace(VlrMastercardCredito,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

             //  lbl_edtMastercard.Text   := FormatFloat(CasasDecimais('Produtos'),TotalMastercard);

             end;//if tipopagto cheque

           end; }

////////////////////////////////////////////////////////////////////////////////

       { if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

           if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardParcelado Then begin

               if TotalMastercardParcelado = 0 Then begin

                 TotalMastercardParcelado := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 VlrMastercardParcelado := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 TotalMastercardParcelado := TotalMastercardParcelado + StrToFloat(StringReplace(VlrMastercardParcelado,ThousandSeparator,'',[rfReplaceAll]));

               end;//if

            //   lbl_edtRedeShop.Text   := FormatFloat(CasasDecimais('Produtos'),TotalRedeShop);

             end;//if tipopagto cheque

           end; }

////////////////////////////////////////////////////////////////////////////////

          { if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

             if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardDebito Then begin

                 if TotalMastercardDebito = 0 Then begin

                   TotalMastercardDebito := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   VlrMastercardDebito := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                   TotalMastercardDebito := TotalMastercardDebito + StrToFloat(StringReplace(VlrMastercardDebito,ThousandSeparator,'',[rfReplaceAll]));

                 end;//if

               end;//if tipopagto cheque

             end; }

////////////////////////////////////////////////////////////////////////////////

            { if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

               if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDHipercard Then begin

                   if TotalHipercard = 0 Then begin

                     TotalHipercard := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                   end else begin

                     VlrHipercard := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                     TotalHipercard := TotalHipercard + StrToFloat(StringReplace(VlrHipercard,ThousandSeparator,'',[rfReplaceAll]));

                   end;//if

                 //  lbl_edtHipercard.Text   := FormatFloat(CasasDecimais('Produtos'),TotalHipercard);

                 end;//if tipopagto cheque

               end;}

////////////////////////////////////////////////////////////////////////////////

              { if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

                 if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDAmericanExpress Then begin

                     if TotalAmericanExpress = 0 Then begin

                       TotalAmericanExpress := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                     end else begin

                       VlrAmericanExpress := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                       TotalAmericanExpress := TotalAmericanExpress + StrToFloat(StringReplace(VlrAmericanExpress,ThousandSeparator,'',[rfReplaceAll]));

                     end;//if

                   //  lbl_edtAmericanExpress.Text   := FormatFloat(CasasDecimais('Produtos'),TotalAmericanExpress);

                   end;//if tipopagto cheque

                 end; }

////////////////////////////////////////////////////////////////////////////////

                { if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')Then begin

                   if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDSoroCred Then begin

                       if TotalSoroCred = 0 Then begin

                         TotalSoroCred := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                       end else begin

                         VlrSoroCred := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                         TotalSoroCred := TotalSoroCred + StrToFloat(StringReplace(VlrSoroCred,ThousandSeparator,'',[rfReplaceAll]));

                       end;//if

                     end;//if tipopagto cheque

                   end; }

////////////////////////////////////////////////////////////////////////////////

                  if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')or(ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pendente')Then begin

                   if TotalDesconto = 0 Then begin

                     TotalDesconto := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('DESCONTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                   end else begin

                     VlrDesconto := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('DESCONTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                     TotalDesconto := TotalDesconto + StrToFloat(StringReplace(VlrDesconto,ThousandSeparator,'',[rfReplaceAll]));

                   end;//if

                 end;

////////////////////////////////////////////////////////////////////////////////


                 if (ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pago')or(ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pendente')Then begin

                   if TotalAcrescimo = 0 Then begin

                     TotalAcrescimo := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('ACRESCIMO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                   end else begin

                     VlrAcrescimo := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('ACRESCIMO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                     TotalAcrescimo := TotalAcrescimo + StrToFloat(StringReplace(VlrAcrescimo,ThousandSeparator,'',[rfReplaceAll]));

                   end;//if

                 end;//if

////////////////////////////////////////////////////////////////////////////////

                 if ibTempServicosVendas.FieldByName('PENDENTEPAGO').AsString = 'Pendente' Then begin

                     if TotalPendente = 0 Then begin

                       TotalPendente := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                     end else begin

                       VlrPendente := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                       TotalPendente := TotalPendente + StrToFloat(StringReplace(VlrPendente,ThousandSeparator,'',[rfReplaceAll]));

                     end;//if

                  end;//if

     //  end;//if
////////////////////////////////////////////////////////////////////////////////


                 {  if ibTempServicosVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDSodex Then begin

                       if TotalSodex = 0 Then begin

                         TotalSodex := StrToFloat(StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                       end else begin

                         ValorSodex := (StringReplace(FloatToStr(ibTempServicosVendas.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                         TotalSodex := TotalSodex + StrToFloat(StringReplace(ValorSodex,ThousandSeparator,'',[rfReplaceAll]));

                       end;//if

                     end;//if tipopagto cheque   }


////////////////////////////////////////////////////////////////////////////////

                   // if TotalPendente <> 0 Then begin

                      if TotalPendente > TotalGeral Then begin

                      TotalLiquido := TotalPendente - TotalGeral;

                      end else begin

                      TotalLiquido := TotalGeral - TotalPendente;

                      end;//if

                   // end;//if

                      TotalVendido := TotalGeral + TotalPendente + TotalAcrescimo;
                      TotalLiquido := TotalDinheiro + TotalCheque + TotalPagoPendente - TotalDesconto;

                ibTempServicosVendas.Next;


                end;//while

                     Commit(ibPagtoPendente);
                     ibPagtoPendente.Close;
                     ibPagtoPendente.SQL.Clear;
                     ibPagtoPendente.SQL.Add('SELECT * FROM TBLPAGTOPENDENTE WHERE(DATAPAGTO=''' + FormatDateTime('mm-dd-yyyy',Now) + ''')');
                     ibPagtoPendente.Open;

                    { ibPagtoPendente.Close;
                     ibPagtoPendente.ParamByName('ParamDataInicial').Value      := dtpDataCaixaIni.DateTime;
                     ibPagtoPendente.ParamByName('ParamDataFinal').Value        := dtpDataCaixa.DateTime;
                     ibPagtoPendente.Open;  (TBLPAGTOPENDENTE.DATAPAGTO between :ParamDataInicial and :ParamDataFinal)}

                     if TotalPagoPendente = 0 Then begin

                       TotalPagoPendente := StrToFloat(StringReplace(FloattoStr(ibPagtoPendente.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                     end else begin

                       VlrPagoPendente    := (StringReplace(FloatToStr(ibPagtoPendente.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
                       TotalPagoPendente  := TotalPagoPendente + StrToFloat(StringReplace(VlrPagoPendente,ThousandSeparator,'',[rfReplaceAll]));

                     end;//if


                      DataIni := FormatDateTime('DD/MM/YYYY',Now);
                   ///   DataFim := FormatDateTime('DD/MM/YYYY',dtpDataCaixa.Date);
                      //Hora           := FormatDateTime('hh:mm:ss',Now);

                    ///  Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar(''+(ibTempServicosVendas.FieldByName('NOME').AsString)+''),0);
                   ///   Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar(FormatFloat('0',ibServsVenda.FieldByName('QTDE').AsFloat))+' X '+(FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRUNIT').AsFloat))+' = '+(FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRTOTAL').AsFloat)),0);
                  ///    Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<tc>_</tc>'),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<sp>1</sp><ce><e><b>*Fluxo Detalhado*</ce></e></b>'),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Data:<sp>1</sp>'+DataIni+''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<tc>_</tc>'),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Dinheiro  ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalDinheiro) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Cheque    ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalCheque) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Cheque Pre..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalChequePre) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Cartoes   ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalCartao) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Pendentes ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalPendente) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Taxas/Acrescimos ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalAcrescimo) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<tc>_</tc>'),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('TOTAL GERAL    ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalVendido) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('PAGTO.PENDENTES..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalPagoPendente) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('TOTAL LIQUIDO  ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalLiquido) + ''),0);
                      Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<sl>'+QtdedeSaltos+'</sl>'), 0);

                     // Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<tc>*</tc>'),0);
                      //IPRIMINDO A VIGÉSIMA PRIMEIRA LINHA
                      if Int_Retorno = 1 Then
                      begin
                        Application.MessageBox('Impressao Concluida!!!', 'CP SISTEMAS', mb_ok + 32);
                      end
                      else
                      begin
                        Application.MessageBox('Erro!', 'Daruma Framework', mb_ok + 16);
                      end;

                    end;//confirma impressão
                      
////////////////////////////////////////////////////////////////////////////////


       end;{begin}

       VK_f2:Begin

         frmFluxoCaixa.Close;

       end;{begin}

     end;

  end;//with

end;

end.
