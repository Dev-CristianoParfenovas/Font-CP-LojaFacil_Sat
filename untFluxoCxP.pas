unit untFluxoCxP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, IBQuery, DB,
  Buttons, ComObj;

type
  TfrmFluxoCxP = class(TForm)
    Image1: TImage;
    dtpDataIniGeral: TDateTimePicker;
    dtpDataFimGeral: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    grbTipoPreco: TGroupBox;
    rbGeral: TRadioButton;
    rbPrecoA: TRadioButton;
    rbPrecoB: TRadioButton;
    rbPrecoC: TRadioButton;
    rbPrecoD: TRadioButton;
    ibeaOk: TSpeedButton;
    ibeaSair: TSpeedButton;
    ckXml_Sat: TCheckBox;
    ckRelatorioGeral: TCheckBox;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ibeaSairClick(Sender: TObject);
    procedure ibeaOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbPrecoAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoCxP: TfrmFluxoCxP;

implementation

uses untdmModule, untRelFluxoCx, funcPosto, untFluxoPrecoA, untFluxoPrecoB,
  untFluxoPrecoC, untRelTotalFluxo, untFluxoPrecoD, untRFluxoVendasCaixa;

{$R *.dfm}

procedure TfrmFluxoCxP.Commit(IBQueryExec : TIBQuery);

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


procedure TfrmFluxoCxP.ibeaSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFluxoCxP.ibeaOkClick(Sender: TObject);

var

VlrPendente, VlraPagar, VlraReceber, VlrCartoes, VlrChequePre : Real;
TotalPendente, TotalaPagar, TotalaReceber, TotalCartoes, TotalChequePre : String;
VlrTotalVenda,VlrTotalVendaB,VlrTotalVendaC, VlrTotalPagoPendente : Real;
TotalVenda,TotalVendaB,TotalVendaC, TotalPagoPendente, TotalSangria : String;
VlrGeralSaida,VlrGeralEntrada, VlrSangria : Real;
//VlrTotalVendaBCartoes,VlrTotalVendaCCartoes : Real;
VlrTotalVendaBP,VlrTotalVendaCP : Real;
//TotalVendaBCartoes,TotalVendaCCartoes : String;
TotalVendaBP,TotalVendaCP, TotalCheque, TotalCartaoCredB, TotalCartaoCredC, TotalCartaoDebB, TotalCartaoDebC : String;
TotalCartaoCredito,TotalCartaoDebito : String;
VlrTotalCartaoCredito,VlrTotalCartaoDebito, VlrCheque, VlrCartaoCredB, VlrCartaoCredC, VlrCartaoDebB, VlrCartaoDebC : Real;

//CARTOES NOVOS

rCartaoUnif,rCartaoCredito,rCartaoDeb, VlrUnit, VlrDesconto, VlrTroco : Real;
strCartaoUnif,strCartaoCredito,strCartaoDeb, TotalVlrUnit, TotalDesconto, TotalTroco : String;

ConfirmaRelatorioExcel : Integer;
Linha,Coluna:Integer;
Excel : Variant;

strDataInicial, strDataF : String;

begin

  with dmModule do begin

    if VlrCartaoCredB > 0 Then begin

      VlrCartaoCredB := 0;

    end;

    if TotalCartaoCredB > '0' Then begin

      TotalCartaoCredB := '0';

    end;

    if VlrCartaoCredC > 0 Then begin

      VlrCartaoCredC := 0;

    end;

    if TotalCartaoCredC > '0' Then begin

      TotalCartaoCredC := '0';

    end;

    if VlrCartaoDebB > 0 Then begin

      VlrCartaoDebB := 0;

    end;

    if TotalCartaoDebB > '0' Then begin

      TotalCartaoDebB := '0';

    end;

    if VlrCartaoDebC > 0 Then begin

      VlrCartaoDebC := 0;

    end;

    if TotalCartaoDebC > '0' Then begin

      TotalCartaoDebC := '0';

    end;
 
    if VlrTroco > 0 Then begin

      VlrTroco := 0;

    end;

    if TotalTroco > '0' Then begin

      TotalTroco := '0';

    end;
     
    if VlrSangria > 0 Then begin

      VlrSangria := 0;

    end;

    if TotalSangria > '0' Then begin

      TotalSangria := '0';

    end;

    if VlrTotalCartaoCredito > 0 Then begin

      VlrTotalCartaoCredito := 0;

    end;

    if TotalCartaoCredito > '0' Then begin

      TotalCartaoCredito := '0';

    end;

    if VlrTotalCartaoDebito > 0 Then begin

      VlrTotalCartaoDebito := 0;

    end;

    if TotalCartaoDebito > '0' Then begin

      TotalCartaoDebito := '0';

    end;

    if VlrPendente > 0 Then begin

      VlrPendente := 0;

    end;

    if TotalPendente > '0' Then begin

      TotalPendente := '0';

    end;

    if VlraPagar > 0 Then begin

      VlraPagar := 0;

    end;

    if TotalaPagar > '0' Then begin

      TotalaPagar := '0';

    end;

    if VlraReceber > 0 Then begin

      VlraReceber := 0;

    end;

    if TotalaReceber > '0' Then begin

      TotalaReceber := '0';

    end;

    if VlrTotalVenda > 0 Then begin

      VlrTotalVenda := 0;

    end;

    if TotalVenda > '0' Then begin

      TotalVenda := '0';

    end;

    if VlrTotalVendaB > 0 Then begin

      VlrTotalVendaB := 0;

    end;

    if TotalVendaB > '0' Then begin

      TotalVendaB := '0';

    end;

    if VlrTotalVendaC > 0 Then begin

      VlrTotalVendaC := 0;

    end;

    if TotalVendaC > '0' Then begin

      TotalVendaC := '0';

    end;


    if VlrTotalVendaBP > 0 Then begin

      VlrTotalVendaBP := 0;

    end;

    if TotalVendaBP > '0' Then begin

      TotalVendaBP := '0';

    end;

    if VlrTotalVendaCP > 0 Then begin

      VlrTotalVendaCP := 0;

    end;

    if TotalVendaCP > '0' Then begin

      TotalVendaCP := '0';

    end;


  { if VlrTotalVendaBCartoes > 0 Then begin

      VlrTotalVendaBCartoes := 0;

    end;

    if TotalVendaBCartoes > '0' Then begin

      TotalVendaBCartoes := '0';

    end;

    if VlrTotalVendaCCartoes > 0 Then begin

      VlrTotalVendaCCartoes := 0;

    end;

    if TotalVendaCCartoes > '0' Then begin

      TotalVendaCCartoes := '0';

    end; }

    if VlrTotalPagoPendente > 0 Then begin

      VlrTotalPagoPendente := 0;

    end;

    if TotalPagoPendente > '0' Then begin

      TotalPagoPendente := '0';

    end;

    if VlrCartoes > 0 Then begin

      VlrCartoes := 0;

    end;

    if TotalCartoes > '0' Then begin

      TotalCartoes := '0';

    end;

    if VlrChequePre > 0 Then begin

      VlrChequePre := 0;

    end;

    if TotalChequePre > '0' Then begin

      TotalChequePre := '0';

    end;

    if VlrCheque > 0 Then begin

      VlrCheque := 0;

    end;

    if TotalCheque > '0' Then begin

      TotalCheque := '0';

    end;

    if VlrGeralSaida > 0 Then begin

      VlrGeralSaida := 0;

    end;

    if VlrGeralEntrada > 0 Then begin

      VlrGeralEntrada := 0;

    end;

    if rbGeral.Checked Then begin

      if ckRelatorioGeral.Checked Then begin

        Commit(ibServsVenda);
        ibServsVenda.Close;
        ibServsVenda.SQL.Clear;
        ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,TBLSERVICOSVENDAS.POSVENDA,TBLSERVICOSVENDAS.IDTIPOPAGTO,'
        + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.PENDENTEPAGO,'
        + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.VLRTROCA,TBLSERVICOSVENDAS.NOMEVENDA,'
        + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.TOTALVLRPROD,TBLSERVICOSVENDAS.VLRSANGRIA,'
        + 'TBLSERVICOSVENDAS.NOMEPROD,TBLTIPOPAGTOAVULSO.TIPOPAGTO,CADPRODUTOS.NOME As Produto,'
        + 'TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.IDVENDA,TBLRECEBEVENDAS.IDTIPOPAGTO As idPagamento FROM TBLSERVICOSVENDAS '
       // + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
        + 'INNER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
        + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
        + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA '
        + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA=''Pago'')ORDER BY IDSERVSVENDA ASC');
        ibServsVenda.Open;

        ibServsVenda.Close;
        ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
        ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
        ibServsVenda.Open;

        Commit(ibRecVendas);
        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.IDVENDA,TBLRECEBEVENDAS.IDTIPOPAGTO,TBLRECEBEVENDAS.TOTALVENDA,TBLRECEBEVENDAS.DATA,'
        + 'TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.VLRACRESCIMO FROM TBLRECEBEVENDAS '
        +'WHERE(TBLRECEBEVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)');
        ibRecVendas.Open;

        ibRecVendas.Close;
        ibRecVendas.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
        ibRecVendas.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
        ibRecVendas.Open;

        while not ibRecVendas.Eof do begin

          if VlrDesconto = 0 Then begin

           VlrDesconto := StrtoFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRDESCONTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

           TotalDesconto := StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRDESCONTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

           VlrDesconto := VlrDesconto + StrtoFloat(StringReplace(TotalDesconto,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if vlrconsig

          ibRecVendas.Next;

        end;// while recebevendas
////////////////////////////////////////////////////////////////////////////////


          while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

////////////////////////////////////////////////////////////////////////////////

          if(ibServsVenda.FieldByName('IDTIPOPAGTO').AsInteger = 1)Then begin

           if VlrUnit = 0 Then begin

             VlrUnit := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             TotalVlrUnit := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

             VlrUnit := VlrUnit + StrtoFloat(StringReplace(TotalVlrUnit,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if vlrunit

           if VlrTotalVendaB = 0 Then begin

             VlrTotalVendaB := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             TotalVendaB := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

             VlrTotalVendaB := VlrTotalVendaB + StrtoFloat(StringReplace(TotalVendaB,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if vlrB

           if VlrTotalVendaC = 0 Then begin

             VlrTotalVendaC := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             TotalVendaC := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

             VlrTotalVendaC := VlrTotalVendaC + StrtoFloat(StringReplace(TotalVendaC,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if vlrB

          end;//if idtipopagto=1

                if(ibServsVenda.FieldByName('idPagamento').AsInteger = 2)or(ibServsVenda.FieldByName('idPagamento').AsInteger = 3) Then begin

                  if rCartaoUnif = 0 Then begin

                    rCartaoUnif := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    strCartaoUnif := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                    rCartaoUnif := rCartaoUnif + StrtoFloat(StringReplace(strCartaoUnif,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                  end;//if total cartoes

                end;// total cartoes

                if(ibServsVenda.FieldByName('idPagamento').AsInteger = 2) Then begin

                 if (VlrTotalCartaoCredito = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrTotalCartaoCredito   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoCredito   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrTotalCartaoCredito   := VlrTotalCartaoCredito + StrToFloat(StringReplace(TotalCartaoCredito,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                 if (VlrCartaoCredB = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrCartaoCredB   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoCredB   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrCartaoCredB   := VlrCartaoCredB + StrToFloat(StringReplace(TotalCartaoCredB,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                 if (VlrCartaoCredC = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrCartaoCredC   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoCredC   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrCartaoCredC   := VlrCartaoCredC + StrToFloat(StringReplace(TotalCartaoCredC,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                end;//if cartaoc

             //if ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAOD' Then begin
                if(ibServsVenda.FieldByName('idPagamento').AsInteger = 3)Then begin

                  if (VlrTotalCartaoDebito = 0) Then begin//se variavel for igual a zero

                  //atribui o vlr do campo abaixo na variavel
                    VlrTotalCartaoDebito   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalCartaoDebito   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                    VlrTotalCartaoDebito   := VlrTotalCartaoDebito + StrToFloat(StringReplace(TotalCartaoDebito,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                   end;{if}

                 if (VlrCartaoDebB = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrCartaoDebB   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoDebB   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrCartaoDebB   := VlrCartaoDebB + StrToFloat(StringReplace(TotalCartaoDebB,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                 if (VlrCartaoDebC = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrCartaoDebC   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoDebC   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrCartaoDebC   := VlrCartaoDebC + StrToFloat(StringReplace(TotalCartaoDebC,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                end;//if cartaod

               if (ibServsVenda.FieldByName('IDTIPOPAGTO').AsInteger = 4) Then begin

                 if VlrCheque = 0 Then begin

                   VlrCheque := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCheque := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                   VlrCheque := VlrCheque + StrtoFloat(StringReplace(TotalCheque,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end;//if vlrconsig

               end;//if


////////////////////////////////////////////////////////////////////////////////

            if (VlrSangria = 0) Then begin//se variavel for igual a zero

              //atribui o vlr do campo abaixo na variavel
              VlrSangria   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRSANGRIA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            end else begin

              TotalSangria   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRSANGRIA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


              VlrSangria   := VlrSangria + StrToFloat(StringReplace(TotalSangria,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

             end;{if}

            if (ibServsVenda.FieldByName('PENDENTEPAGO').AsString = 'Pendente') Then begin

              if (VlrPendente = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
                VlrPendente   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalPendente   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                VlrPendente   := VlrPendente + StrToFloat(StringReplace(TotalPendente,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

               end;{if}

             end;//if tipovenda pendente


             if (ibServsVenda.FieldByName('NOMEVENDA').AsString = 'Cheque Pre') Then begin

               if VlrChequePre = 0 Then begin

                 VlrChequePre := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 TotalChequePre := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                 VlrChequePre := VlrChequePre + StrtoFloat(StringReplace(TotalChequePre,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end;//if vlrconsig

             end;//if

            ibServsVenda.Next;
            
          end;//while
////////////////////////////////////////////////////////////////////////////////

            Commit(ibTempAReceber);
            ibTempAReceber.Close;
            ibTempAReceber.SQL.Clear;
            ibTempAReceber.SQL.Add('SELECT * FROM TBLCONTASARECEBER WHERE (TBLCONTASARECEBER.EMISSAO between :ParamDataIni and :ParamDataF)and(TBLCONTASARECEBER.CARTAO = ''Cartao'')');
            ibTempAReceber.Open;

            ibTempAReceber.Close;
            ibTempAReceber.ParamByName('ParamDataIni').Value      := dtpDataIniGeral.DateTime;
            ibTempAReceber.ParamByName('ParamDataF').Value        := dtpDataFimGeral.DateTime;
            ibTempAReceber.Open;


            (ibTempAReceber.FieldByName('VLREMITIDO')as TFloatField).DisplayFormat := CasasDecimais('Produtos');


            while not ibTempAReceber.Eof do begin

              if (ibTempAReceber.FieldByName('CARTAO').AsString = 'Cartao')Then begin

                if VlrCartoes = 0 Then begin

                  VlrCartoes := StrtoFloat(StringReplace(FloattoStr(ibTempAReceber.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                end else begin

                  TotalCartoes := StringReplace(FloattoStr(ibTempAReceber.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                  VlrCartoes := VlrCartoes + StrtoFloat(StringReplace(TotalCartoes,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                end;//if vlrconsig

             {   if VlrTotalVendaBCartoes = 0 Then begin

                   VlrTotalVendaBCartoes := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalVendaBCartoes := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                   VlrTotalVendaBCartoes := VlrTotalVendaBCartoes + StrtoFloat(StringReplace(TotalVendaBCartoes,ThousandSeparator,'',[rfReplaceAll]));

                 end;//if vlrconsig

                 if VlrTotalVendaCCartoes = 0 Then begin

                   VlrTotalVendaCCartoes := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalVendaCCartoes := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                   VlrTotalVendaCCartoes := VlrTotalVendaCCartoes + StrtoFloat(StringReplace(TotalVendaCCartoes,ThousandSeparator,'',[rfReplaceAll]));

                 end;//if vlrconsig  }

               ibTempAReceber.Next;


             end;//if
           
            end;//while temp a receber

////////////////////////////////////////////////////////////////////////////////

            ibAPagar.Close;
            ibAPagar.SQL.Clear;
            ibAPagar.SQL.Add('SELECT * FROM TBLCONTASAPAGAR WHERE(TBLCONTASAPAGAR.DATADABAIXA between :ParamDataIni and :ParamDataF)and(TBLCONTASAPAGAR.BAIXADO = ''Sim'')');
            ibAPagar.Open;

            ibAPagar.Close;
            ibAPagar.ParamByName('ParamDataIni').Value      := dtpDataIniGeral.DateTime;
            ibAPagar.ParamByName('ParamDataF').Value        := dtpDataFimGeral.DateTime;
            ibAPagar.Open;

            (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            while not ibAPagar.Eof do begin

              if VlraPagar = 0 Then begin

                VlraPagar := StrtoFloat(StringReplace(FloattoStr(ibAPagar.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalaPagar := StringReplace(FloattoStr(ibAPagar.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                VlraPagar := VlraPagar + StrtoFloat(StringReplace(TotalaPagar,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end;//if vlrconsig

            ibAPagar.Next;

            end;//while

////////////////////////////////////////////////////////////////////////////////

            Commit(ibAReceber);
            ibAReceber.Close;
            ibAReceber.SQL.Clear;
            ibAReceber.SQL.Add('SELECT * FROM TBLCONTASARECEBER WHERE (TBLCONTASARECEBER.DATADABAIXA between :ParamDataIni and :ParamDataF)and(TBLCONTASARECEBER.BAIXADO = ''Sim'')');
            ibAReceber.Open;

            ibAReceber.Close;
            ibAReceber.ParamByName('ParamDataIni').Value      := dtpDataIniGeral.DateTime;
            ibAReceber.ParamByName('ParamDataF').Value        := dtpDataFimGeral.DateTime;
            ibAReceber.Open;


            (ibAReceber.FieldByName('VLREMITIDO')as TFloatField).DisplayFormat := CasasDecimais('Produtos');

            while not ibAReceber.Eof do begin

              if VlraReceber = 0 Then begin

                VlraReceber := StrtoFloat(StringReplace(FloattoStr(ibAReceber.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalaReceber := StringReplace(FloattoStr(ibAReceber.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                VlraReceber := VlraReceber + StrtoFloat(StringReplace(TotalaReceber,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end;//if vlrconsig

            ibAReceber.Next;

            end;//while

////////////////////////////////////////////////////////////////////////////////

            Commit(ibPagtoPendente);
            ibPagtoPendente.Close;
            ibPagtoPendente.SQL.Clear;
            ibPagtoPendente.SQL.Add('SELECT * FROM TBLPAGTOPENDENTE WHERE(TBLPAGTOPENDENTE.DATAPAGTO between :ParamDataIni and :ParamDataF)');
            ibPagtoPendente.Open;

            ibPagtoPendente.Close;
            ibPagtoPendente.ParamByName('ParamDataIni').Value      := dtpDataIniGeral.DateTime;
            ibPagtoPendente.ParamByName('ParamDataF').Value        := dtpDataFimGeral.DateTime;
            ibPagtoPendente.Open;


            (ibPagtoPendente.FieldByName('VLRPAGO')as TFloatField).DisplayFormat := CasasDecimais('Produtos');

            while not ibPagtoPendente.Eof do begin

              if VlrTotalPagoPendente = 0 Then begin

                VlrTotalPagoPendente := StrtoFloat(StringReplace(FloattoStr(ibPagtoPendente.FieldByName('VLRPAGO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalPagoPendente := StringReplace(FloattoStr(ibPagtoPendente.FieldByName('VLRPAGO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                VlrTotalPagoPendente := VlrTotalPagoPendente + StrtoFloat(StringReplace(TotalPagoPendente,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end;//if vlrconsig

            ibPagtoPendente.Next;

            end;//while

////////////////////////////////////////////////////////////////////////////////
   //   (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       Application.CreateForm(TfrmRelFluxoCx, frmRelFluxoCx);

        TRY

          with frmRelFluxoCx do begin

              frmRelFluxoCx.qrpFluxoCx.DataSet := ibServsVenda;
              //frmRelFluxoCx.qrpFluxoCx.DataSet := ibRecVendas;

              //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
              qrdbProd.DataSet    := ibServsVenda;
              qrdbProd.DataField  := ibServsVenda.FieldByName('NOMEPROD').FieldName;

              qrdbNCupom.DataSet    := ibServsVenda;
              qrdbNCupom.DataField  := ibServsVenda.FieldByName('IDSERVSVENDA').FieldName;

              qrdbVlrUnit.DataSet     := ibServsVenda;
              qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
             (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

              qrdbQtde.DataSet        := ibServsVenda;
              qrdbQtde.DataField      := ibServsVenda.FieldByName('QTDE').FieldName;
              (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO

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

           //   qrdbVlrD.DataSet    := ibServsVenda;
            //  qrdbVlrD.DataField  := ibServsVenda.FieldByName('VALORD').FieldName;
            //  (ibServsVenda.FieldByName('VALORD') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


              qrdbDesc.DataSet    := ibServsVenda;
              qrdbDesc.DataField  := ibServsVenda.FieldByName('VLRDESCONTO').FieldName;
              (ibServsVenda.FieldByName('VLRDESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO

         //   qrdbAcrescimo.DataSet    := ibServsVenda;
          //  qrdbAcrescimo.DataField  := ibServsVenda.FieldByName('ACRESCIMO').FieldName;
           // (ibServsVenda.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrlFuncionarioComissao.Caption := '';

            qrl_DataIni.Caption := DateToStr(dtpDataIniGeral.Date);
            qrl_DataF.Caption  := DateToStr(dtpDataFimGeral.Date);

         /////////////////////////////////////////////////////////////////////////

            qrl_TotalDesc.Caption := FormatFloat(CasasDecimais('Produtos'),VlrDesconto);
            qrl_Descontos.Caption := FormatFloat(CasasDecimais('Produtos'),VlrDesconto);

            if VlrPendente > 0 Then begin
            qrl_TotalPendente.Caption      := FormatFloat(CasasDecimais('Produtos'),VlrPendente + VlrTotalVendaBP + VlrTotalVendaCP);
            end else begin
            qrl_TotalPendente.Caption      := '0,00';
            end;

            if VlrSangria > 0 Then begin
            qrl_TotalSangria.Caption        := FormatFloat(CasasDecimais('Produtos'),VlrSangria);
            end else begin
            qrl_TotalSangria.Caption        := '0,00';
            end;

            if VlraPagar > 0 Then begin
            qrl_TotalaPagar.Caption        := FormatFloat(CasasDecimais('Produtos'),VlraPagar);
            end else begin
            qrl_TotalaPagar.Caption        := '0,00';
            end;

            if VlraReceber > 0 Then begin
            qrl_TotalaReceber.Caption        := FormatFloat(CasasDecimais('Produtos'),VlraReceber);
            end else begin
            qrl_TotalaReceber.Caption        := '0,00';
            end;

            if VlrTotalCartaoCredito > 0 Then begin
            qrl_TotalCartaoCredito.Caption        := FormatFloat(CasasDecimais('Produtos'),VlrTotalCartaoCredito + VlrCartaoCredB + VlrCartaoCredC);
            end else begin                                                           //  + VlrTotalVendaBCartoes + VlrTotalVendaCCartoes
            qrl_TotalCartaoCredito.Caption        := '0,00';
            end;

            if VlrTotalCartaoDebito > 0 Then begin
            qrl_TotalCartaoDebito.Caption        := FormatFloat(CasasDecimais('Produtos'),VlrTotalCartaoDebito + VlrCartaoDebB + VlrCartaoDebC);
            end else begin                                                           //  + VlrTotalVendaBCartoes + VlrTotalVendaCCartoes
            qrl_TotalCartaoDebito.Caption        := '0,00';
            end;

            if VlrCheque > 0 Then begin
            qrl_TotalCheque.Caption        := FormatFloat(CasasDecimais('Produtos'),VlrCheque);
            end else begin
            qrl_TotalCheque.Caption        := '0,00';
            end;

            //SOMA OS TOTAIS DE SAIDA
            qrl_TotalSaida.Caption := FormatFloat(CasasDecimais('Produtos'),VlraPagar);
            VlrGeralSaida := VlraPagar;                  ////+ VlrCustoLav + VlrConsig

            //SOMA OS TOTAIS DE ENTRADA                                                 //  VlrTotalVendaB   VlrTotalVendaC
            qrl_TotalEntrada.Caption := FormatFloat(CasasDecimais('Produtos'),VlrUnit + rCartaoUnif + VlrTotalVendaB + VlrTotalVendaC + VlrCheque + VlraReceber + VlrTotalPagoPendente);
            VlrGeralEntrada := VlrUnit + VlrTotalVendaB + VlrTotalVendaC + rCartaoUnif + VlrCheque + VlraReceber + VlrTotalPagoPendente + VlrTotalCartaoCredito + VlrTotalCartaoDebito + VlrCartaoCredB + VlrCartaoCredC + VlrCartaoDebB + VlrCartaoDebC;

            if VlrSangria > 0 Then begin

            VlrGeralEntrada := VlrGeralEntrada - VlrSangria

            end else begin

            VlrGeralEntrada := VlrGeralEntrada;

            end;
                                                                            //  VlrTotalVenda
            if VlrUnit > 0 Then begin
            qrl_TotalVendas.Caption := FormatFloat(CasasDecimais('Produtos'), VlrUnit + VlrTotalVendaB + VlrTotalVendaC);
            end else begin
            qrl_TotalVendas.Caption := '0,00';
            end;

            qrl_TotalPagtoPendente.Caption := FormatFloat(CasasDecimais('Produtos'),VlrTotalPagoPendente);

            if VlrGeralEntrada > VlrGeralSaida Then begin

              qrl_TotalLiquido.Font.Color := clBlue;
              qrl_TotalLiquido.Caption := FormatFloat(CasasDecimais('Produtos'),VlrUnit + VlrTotalVendaB + VlrTotalVendaC + rCartaoUnif + VlrCheque - VlrGeralSaida + VlrCartaoCredB + VlrCartaoCredC + VlrCartaoDebB + VlrCartaoDebC - VlrDesconto);

            end;

            if VlrGeralEntrada < VlrGeralSaida Then begin

              qrl_TotalLiquido.Font.Color := clRed;
              qrl_TotalLiquido.Caption := FormatFloat(CasasDecimais('Produtos'),VlrUnit + VlrTotalVendaB + VlrTotalVendaC + rCartaoUnif + VlrCheque - VlrGeralSaida);

            end;
                                                                                                                                                                                     //VlrTotalCartaoCredito + VlrTotalCartaoDebito +
            qrl_TotalCx.Caption := FormatFloat(CasasDecimais('Produtos'),VlrUnit + VlrTotalVendaB + VlrTotalVendaC + rCartaoUnif + VlrCheque + VlraReceber + VlrTotalPagoPendente +  VlrCartaoCredB + VlrCartaoCredC + VlrCartaoDebB + VlrCartaoDebC - VlrDesconto);
         /////////////////////////////////////////////////////////////////////////

            { qrpFluxoCx.Prepare;
             ExportQR1.Report := frmRelFluxoCx.qrpFluxoCx;
             ExportQR1.ExportQRPDF('C:\Relatorio Fluxo de Caixa\''Fluxo de Caixa',false); }
         {   frmRelFluxoCx.qrpFluxoCx.DataSet := ibRecVendas;
            while not ibRecVendas.Eof do begin

              qrdbDesc.DataSet    := ibRecVendas;
              qrdbDesc.DataField  := ibRecVendas.FieldByName('VLRDESCONTO').FieldName;
              (ibRecVendas.FieldByName('VLRDESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

              ibRecVendas.Next;

            end;//while ibservsvenda  }

////////////////////////////////////////////////////////////////////////////////

             strDataInicial := FormatDateTime('dd.mm.yyyy',dtpDataIniGeral.DateTime);
             strDataF   := FormatDateTime('dd.mm.yyyy',dtpDataFimGeral.DateTime);

             qrpFluxoCx.Prepare;
             //ExportQR1.Report := frmRelFluxoCx.qrpFluxoCx;
            // ExportQR1.ExportQRPDF('C:\Relatórios\''Fluxo de Caixa_XML de '+ strDataInicial +' ate '+ strDataF+'',false);

////////////////////////////////////////////////////////////////////////////////




    ConfirmaRelatorioExcel := Application.MessageBox('Deseja Emitir Relatório para o Excel?','Relatório para Excel',+MB_YESNO+MB_ICONQUESTION);

    if ConfirmaRelatorioExcel = 6 Then begin

        Excel := CreateOleObject('Excel.Application');
        Excel.Visible :=True;
        Excel.Workbooks.Add;
        Excel.Caption := 'Relatório de Vendas por Período';
        Excel.Cells[1,1] := 'Nº Cupom';
        Excel.Cells[1,3] := 'Descrição';
        Excel.Cells[1,5] := 'Valor Unitario';
        Excel.Cells[1,7] := 'Qtde.';
        Excel.Cells[1,9] := 'Total Vendido';

       { for Coluna := 1 to ibCadastro.FieldCount - 1 do
        begin
        Excel.Cells[1,Coluna] := ibCadastro.Fields[Coluna].DisplayName;
        end;}
        Linha := 2;
        ibServsVenda.First;
        while not ibServsVenda.Eof do
        begin
        for Coluna := 1 to ibServsVenda.FieldCount - 1 do
        begin          //
        Excel.Cells[Linha,1] := IntToStr(ibServsVenda.FieldByName('IDSERVSVENDA').AsInteger);
        Excel.Cells[Linha,3] := ibServsVenda.FieldByName('NOMEPROD').AsString;//ibEntrProdEstoque.Fields[Coluna].AsString;
        Excel.Cells[Linha,5] := FormatFloat(',0.00',ibServsVenda.FieldByName('VLRUNIT').AsFloat);
        Excel.Cells[Linha,7] := FormatFloat(',0.00',ibServsVenda.FieldByName('QTDE').AsFloat);
        Excel.Cells[Linha,9] := FormatFloat(',0.00',ibServsVenda.FieldByName('VLRTOTAL').AsFloat);//FloatToStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat);
        end;
        Inc(Linha);
        ibServsVenda.Next;
        end;
        Excel.Columns.AutoFit;
        //Excel.WorkBooks[1].Save;
        //Excel.WorkBooks[1].Close; }

      end;

////////////////////////////////////////////////////////////////////////////////
            

            qrpFluxoCx.Preview;

          end; {if}


        EXCEPT
          on E : Exception do begin
             frmRelFluxoCx.Release;
             MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
          end;
        END;

      end;//if ckRelatórioGeral


////////////////////////////////////////////////////////////////////////////////

      if ckXml_Sat.Checked Then begin

        Commit(ibChaveSat);
        ibChaveSat.Close;
        ibChaveSat.SQL.Clear;
        ibChaveSat.SQL.Add('SELECT TBLSERVICOSVENDAS.VLRDESCONTO,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA As Cupom,TBLSERVICOSVENDAS.ESTOQUE,'
        + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
        + 'TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.PENDENTEPAGO,TBLSERVICOSVENDAS.IDTIPOPAGTO,'
        + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.NOMEVENDA,'
        + 'TBLSERVICOSVENDAS.VLRPENDENTE,TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.NOMEPROD,'
        + 'TBLTIPOPAGTOAVULSO.TIPOPAGTO As TipodePagto,TBLTIPOPAGTOAVULSO.IDTIPO As TipodeID,'
        + 'TBLTIPOPAGTOAVULSO.DESCRICAO As NomedoCartao,TBL_CHAVESAT.NCUPOM,TBL_CHAVESAT.DATA,TBL_CHAVESAT.CUPOMCANC FROM TBLSERVICOSVENDAS '
        //+ 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.IDAGCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
        + 'INNER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
        + 'INNER JOIN TBL_CHAVESAT ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBL_CHAVESAT.NCUPOM '
       // + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA ' + 'TBLRECEBEVENDAS.VLRPAGO,TBLRECEBEVENDAS.IDTIPOPAGTO As IDPagtoVendas,TBLRECEBEVENDAS.VLRDESCONTO
        + 'WHERE(TBL_CHAVESAT.DATA between :ParamDataInicial and :ParamDataFinal)and(TBL_CHAVESAT.CUPOMCANC is null) ORDER BY TBL_CHAVESAT.NCUPOM ASC');
        ibChaveSat.Open;
                                                                                 // and TBL_CHAVESAT.CUPOMCANC<>''1''
        ibChaveSat.Close;
        ibChaveSat.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
        ibChaveSat.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
        ibChaveSat.Open;

        Commit(ibRecVendas);
        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.IDVENDA,TBLRECEBEVENDAS.IDTIPOPAGTO,TBLRECEBEVENDAS.TOTALVENDA,TBLRECEBEVENDAS.DATA,'
        + 'TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.VLRACRESCIMO FROM TBLRECEBEVENDAS '
        +'WHERE(TBLRECEBEVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)');
        ibRecVendas.Open;

        ibRecVendas.Close;
        ibRecVendas.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
        ibRecVendas.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
        ibRecVendas.Open;

        while not ibRecVendas.Eof do begin

          if VlrDesconto = 0 Then begin

           VlrDesconto := StrtoFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRDESCONTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

           TotalDesconto := StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRDESCONTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

           VlrDesconto := VlrDesconto + StrtoFloat(StringReplace(TotalDesconto,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if vlrconsig

          ibRecVendas.Next;

        end;// while recebevendas
////////////////////////////////////////////////////////////////////////////////


          while not ibChaveSat.Eof do begin//enquanto nao for fim de registro

////////////////////////////////////////////////////////////////////////////////

          if(ibChaveSat.FieldByName('IDTIPOPAGTO').AsInteger = 1)Then begin

           if VlrUnit = 0 Then begin

             VlrUnit := StrtoFloat(StringReplace(FloattoStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             TotalVlrUnit := StringReplace(FloattoStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

             VlrUnit := VlrUnit + StrtoFloat(StringReplace(TotalVlrUnit,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if vlrunit

           if VlrTotalVendaB = 0 Then begin

             VlrTotalVendaB := StrtoFloat(StringReplace(FloattoStr(ibChaveSat.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             TotalVendaB := StringReplace(FloattoStr(ibChaveSat.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

             VlrTotalVendaB := VlrTotalVendaB + StrtoFloat(StringReplace(TotalVendaB,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if vlrB

           if VlrTotalVendaC = 0 Then begin

             VlrTotalVendaC := StrtoFloat(StringReplace(FloattoStr(ibChaveSat.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             TotalVendaC := StringReplace(FloattoStr(ibChaveSat.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

             VlrTotalVendaC := VlrTotalVendaC + StrtoFloat(StringReplace(TotalVendaC,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if vlrB

          end;//if idtipopagto=1

                if(ibChaveSat.FieldByName('IDTIPOPAGTO').AsInteger = 2)or(ibChaveSat.FieldByName('IDTIPOPAGTO').AsInteger = 3) Then begin

                  if rCartaoUnif = 0 Then begin

                    rCartaoUnif := StrtoFloat(StringReplace(FloattoStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    strCartaoUnif := StringReplace(FloattoStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                    rCartaoUnif := rCartaoUnif + StrtoFloat(StringReplace(strCartaoUnif,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                  end;//if total cartoes

                end;// total cartoes

                if(ibChaveSat.FieldByName('IDTIPOPAGTO').AsInteger = 2) Then begin

                 if (VlrTotalCartaoCredito = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrTotalCartaoCredito   := strToFloat(StringReplace(FloatToStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoCredito   := StringReplace(FloatToStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrTotalCartaoCredito   := VlrTotalCartaoCredito + StrToFloat(StringReplace(TotalCartaoCredito,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                 if (VlrCartaoCredB = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrCartaoCredB   := strToFloat(StringReplace(FloatToStr(ibChaveSat.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoCredB   := StringReplace(FloatToStr(ibChaveSat.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrCartaoCredB   := VlrCartaoCredB + StrToFloat(StringReplace(TotalCartaoCredB,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                 if (VlrCartaoCredC = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrCartaoCredC   := strToFloat(StringReplace(FloatToStr(ibChaveSat.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoCredC   := StringReplace(FloatToStr(ibChaveSat.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrCartaoCredC   := VlrCartaoCredC + StrToFloat(StringReplace(TotalCartaoCredC,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                end;//if cartaoc

             //if ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAOD' Then begin
                if(ibChaveSat.FieldByName('IDTIPOPAGTO').AsInteger = 3)Then begin

                  if (VlrTotalCartaoDebito = 0) Then begin//se variavel for igual a zero

                  //atribui o vlr do campo abaixo na variavel
                    VlrTotalCartaoDebito   := strToFloat(StringReplace(FloatToStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalCartaoDebito   := StringReplace(FloatToStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                    VlrTotalCartaoDebito   := VlrTotalCartaoDebito + StrToFloat(StringReplace(TotalCartaoDebito,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                   end;{if}

                 if (VlrCartaoDebB = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrCartaoDebB   := strToFloat(StringReplace(FloatToStr(ibChaveSat.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoDebB   := StringReplace(FloatToStr(ibChaveSat.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrCartaoDebB   := VlrCartaoDebB + StrToFloat(StringReplace(TotalCartaoDebB,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                 if (VlrCartaoDebC = 0) Then begin//se variavel for igual a zero

                    //atribui o vlr do campo abaixo na variavel
                   VlrCartaoDebC   := strToFloat(StringReplace(FloatToStr(ibChaveSat.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCartaoDebC   := StringReplace(FloatToStr(ibChaveSat.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                   VlrCartaoDebC   := VlrCartaoDebC + StrToFloat(StringReplace(TotalCartaoDebC,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

                  end;{if}

                end;//if cartaod

               if (ibChaveSat.FieldByName('IDTIPOPAGTO').AsInteger = 4) Then begin

                 if VlrCheque = 0 Then begin

                   VlrCheque := StrtoFloat(StringReplace(FloattoStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalCheque := StringReplace(FloattoStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                   VlrCheque := VlrCheque + StrtoFloat(StringReplace(TotalCheque,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                 end;//if vlrconsig

               end;//if


////////////////////////////////////////////////////////////////////////////////

            if (VlrSangria = 0) Then begin//se variavel for igual a zero

              //atribui o vlr do campo abaixo na variavel
              VlrSangria   := strToFloat(StringReplace(FloatToStr(ibChaveSat.FieldByName('VLRSANGRIA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            end else begin

              TotalSangria   := StringReplace(FloatToStr(ibChaveSat.FieldByName('VLRSANGRIA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


              VlrSangria   := VlrSangria + StrToFloat(StringReplace(TotalSangria,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

             end;{if}

            if (ibChaveSat.FieldByName('PENDENTEPAGO').AsString = 'Pendente') Then begin

              if (VlrPendente = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
                VlrPendente   := strToFloat(StringReplace(FloatToStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalPendente   := StringReplace(FloatToStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


                VlrPendente   := VlrPendente + StrToFloat(StringReplace(TotalPendente,FormatSettings.ThousandSeparator,'',[rfReplaceall]));

               end;{if}

             end;//if tipovenda pendente
                                              ///or(ibServsVenda.FieldByName('IDTIPOPAGTO').AsInteger = 2)
            // if (ibServsVenda.FieldByName('IDTIPOPAGTO').AsInteger = 1)or(ibServsVenda.FieldByName('NOMEVENDA').AsString = '')and(ibServsVenda.FieldByName('PENDENTEPAGO').AsString = 'Pago') Then begin
              if  (ibChaveSat.FieldByName('IDTIPOPAGTO').AsInteger = 1)Then begin
             {  if VlrTotalVenda = 0 Then begin

                 VlrTotalVenda := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 TotalVenda := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                 VlrTotalVenda := VlrTotalVenda + StrtoFloat(StringReplace(TotalVenda,ThousandSeparator,'',[rfReplaceAll]));

               end;//if vlrconsig

             end;//if }
                            ///  and(VlrQtde = 0)
             {  if (VlrUnit = 0) Then begin

                 if (ibServsVenda.FieldByName('VLRUNIT').AsFloat <> null) Then begin
                 VlrUnit := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRUNIT').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
                 end;

                 if (ibServsVenda.FieldByName('VLRUNIT').AsFloat = null)and(ibServsVenda.FieldByName('VLRTOTAL').AsFloat <> null) Then begin
                 VlrUnit := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
                 end;

                 VlrQtde := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('QTDE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
                 VlrUnit := VlrUnit * VlrQtde;// + StrtoFloat(StringReplace(TotalVlrUnit,ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 if (ibServsVenda.FieldByName('VLRUNIT').AsFloat <> null) Then begin
                 TotalVlrUnit := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRUNIT').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
                 end else begin
                 ///(ibServsVenda.FieldByName('VLRUNIT').AsFloat = null)and(ibServsVenda.FieldByName('VLRTOTAL').AsFloat <> null) Then begin
                 TotalVlrUnit := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
                 end;

                /// TotalVlrUnit := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRUNIT').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
                 ValorUnitCalc := StrToFloat(TotalVlrUnit);
                 TotalQtde := StringReplace(FloattoStr(ibServsVenda.FieldByName('QTDE').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
                 VlrQtdeCalc := StrToFloat(TotalQtde);

                 ValorUnitCalc := ValorUnitCalc * VlrQtdeCalc;

                 VlrUnit := VlrUnit + ValorUnitCalc;//StrtoFloat(StringReplace(TotalVlrUnit,ThousandSeparator,'',[rfReplaceAll]));
                /// ValorUnitCalc := VlrUnit;
                /// VlrQtde := VlrQtde + StrtoFloat(StringReplace(TotalQtde,ThousandSeparator,'',[rfReplaceAll]));

               ///  VlrUnit := VlrUnit * VlrQtde;

               end;//if vlrconsig }

            {071118   if VlrUnit = 0 Then begin

                 VlrUnit := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 TotalVlrUnit := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                 VlrUnit := VlrUnit + StrtoFloat(StringReplace(TotalVlrUnit,ThousandSeparator,'',[rfReplaceAll]));

               end;//if vlrconsig }


             end;//if

             if (ibChaveSat.FieldByName('NOMEVENDA').AsString = 'Cheque Pre') Then begin

               if VlrChequePre = 0 Then begin

                 VlrChequePre := StrtoFloat(StringReplace(FloattoStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 TotalChequePre := StringReplace(FloattoStr(ibChaveSat.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                 VlrChequePre := VlrChequePre + StrtoFloat(StringReplace(TotalChequePre,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

               end;//if vlrconsig

             end;//if

           {071118  if (ibServsVenda.FieldByName('IDPagtoVendas').AsInteger = 4) Then begin

               if VlrCheque = 0 Then begin

                 VlrCheque := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

               end else begin

                 TotalCheque := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                 VlrCheque := VlrCheque + StrtoFloat(StringReplace(TotalCheque,ThousandSeparator,'',[rfReplaceAll]));

               end;//if vlrconsig

             end;//if  }

////////////////////////////////////////////////////////////////////////////////

           {  if ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAO' Then begin

               { if VlrCartoes = 0 Then begin

                  VlrCartoes := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                end else begin

                  TotalCartoes := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                  VlrCartoes := VlrCartoes + StrtoFloat(StringReplace(TotalCartoes,ThousandSeparator,'',[rfReplaceAll]));

                end;//if vlrcartoes

                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'VISA CREDITO' Then begin

                  if VlrVisaCredito = 0 Then begin

                    VlrVisaCredito := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalVisaCredito := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrVisaCredito := VlrVisaCredito + StrtoFloat(StringReplace(TotalVisaCredito,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if visa credito

                end;// nome visa credito


                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'VISA DEBITO' Then begin

                  if VlrVisaDebito = 0 Then begin

                    VlrVisaDebito := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalVisaDebito := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrVisaDebito := VlrVisaDebito + StrtoFloat(StringReplace(TotalVisaDebito,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if visa credito

                end;// nome visa debito

                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'VISA PARCELADO' Then begin

                  if VlrVisaParc = 0 Then begin

                    VlrVisaParc := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalVisaParc := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrVisaParc := VlrVisaParc + StrtoFloat(StringReplace(TotalVisaParc,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if visa credito

                end;// nome visa parcelado

                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'MASTERCARD CREDITO' Then begin

                  if VlrMastercardCredito = 0 Then begin

                    VlrMastercardCredito := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalMastercardCredito := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrMastercardCredito := VlrMastercardCredito + StrtoFloat(StringReplace(TotalMastercardCredito,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if visa credito

                end;// nome mastercard credito

                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'MASTERCARD DEBITO' Then begin

                  if VlrMastercardDebito = 0 Then begin

                    VlrMastercardDebito := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalMastercardDebito := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrMastercardDebito := VlrMastercardDebito + StrtoFloat(StringReplace(TotalMastercardDebito,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if visa credito

                end;// nome mastercard debito

                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'MASTERCARD PARCELADO' Then begin

                  if VlrMastercardParc = 0 Then begin

                    VlrMastercardParc := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalMastercardParc := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrMastercardParc := VlrMastercardParc + StrtoFloat(StringReplace(TotalMastercardParc,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if mastercard parc

                end;// nome mastercard parcelado

                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'HIPERCARD' Then begin

                  if VlrHipercard = 0 Then begin

                    VlrHipercard := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalHipercard := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrHipercard := VlrHipercard + StrtoFloat(StringReplace(TotalHipercard,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if mastercard parc

                end;// nome hipercard

                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'SOROCRED' Then begin

                  if VlrSoroCred = 0 Then begin

                    VlrSoroCred := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalSoroCred := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrSoroCred := VlrSoroCred + StrtoFloat(StringReplace(TotalSoroCred,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if mastercard parc

                end;// nome sorocred

                if ibServsVenda.FieldByName('NomedoCartao').AsString = 'AMERICAN EXPRESS' Then begin

                  if VlrAmericanExpress = 0 Then begin

                    VlrAmericanExpress := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    TotalAmericanExpress := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    VlrAmericanExpress := VlrAmericanExpress + StrtoFloat(StringReplace(TotalAmericanExpress,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if mastercard parc

                end;// nome american express

              end;//if tipocartao  }

                //if(ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAOD')or(ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAOC') Then begin
              {071118  if(ibServsVenda.FieldByName('IDPagtoVendas').AsInteger = 2)or(ibServsVenda.FieldByName('IDPagtoVendas').AsInteger = 3) Then begin

                  if rCartaoUnif = 0 Then begin

                    rCartaoUnif := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    strCartaoUnif := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    rCartaoUnif := rCartaoUnif + StrtoFloat(StringReplace(strCartaoUnif,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if visa credito

                end;// nome visa credito

             //if ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAOC' Then begin
             if(ibServsVenda.FieldByName('IDPagtoVendas').AsInteger = 2) Then begin

              if (VlrTotalCartaoCredito = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
                VlrTotalCartaoCredito   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalCartaoCredito   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);


                VlrTotalCartaoCredito   := VlrTotalCartaoCredito + StrToFloat(StringReplace(TotalCartaoCredito,ThousandSeparator,'',[rfReplaceall]));

               end;//if

             end;//if cartaoc

             //if ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAOD' Then begin
             if(ibServsVenda.FieldByName('IDPagtoVendas').AsInteger = 3)Then begin

              if (VlrTotalCartaoDebito = 0) Then begin//se variavel for igual a zero

                //atribui o vlr do campo abaixo na variavel
                VlrTotalCartaoDebito   := strToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalCartaoDebito   := StringReplace(FloatToStr(ibServsVenda.FieldByName('VLRPAGO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);


                VlrTotalCartaoDebito   := VlrTotalCartaoDebito + StrToFloat(StringReplace(TotalCartaoDebito,ThousandSeparator,'',[rfReplaceall]));

               end;//if

             end;//if cartaod  071118}
              

              {  if(ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAO CRED') Then begin

                  if rCartaoCredito = 0 Then begin

                    rCartaoCredito := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    strCartaoCredito := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    rCartaoCredito := rCartaoCredito + StrtoFloat(StringReplace(strCartaoCredito,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if visa credito

                end;// nome visa credito

                if(ibServsVenda.FieldByName('TipodePagto').AsString = 'CARTAO DEB') Then begin

                  if rCartaoDeb = 0 Then begin

                    rCartaoDeb := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                  end else begin

                    strCartaoDeb := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                    rCartaoDeb := rCartaoDeb + StrtoFloat(StringReplace(strCartaoDeb,ThousandSeparator,'',[rfReplaceAll]));

                  end;//if visa credito

                end;// nome visa credito  }

////////////////////////////////////////////////////////////////////////////////



            ibChaveSat.Next;
          end;//while
////////////////////////////////////////////////////////////////////////////////

            Commit(ibTempAReceber);
            ibTempAReceber.Close;
            ibTempAReceber.SQL.Clear;
            ibTempAReceber.SQL.Add('SELECT * FROM TBLCONTASARECEBER WHERE (TBLCONTASARECEBER.EMISSAO between :ParamDataIni and :ParamDataF)and(TBLCONTASARECEBER.CARTAO = ''Cartao'')');
            ibTempAReceber.Open;

            ibTempAReceber.Close;
            ibTempAReceber.ParamByName('ParamDataIni').Value      := dtpDataIniGeral.DateTime;
            ibTempAReceber.ParamByName('ParamDataF').Value        := dtpDataFimGeral.DateTime;
            ibTempAReceber.Open;


            (ibTempAReceber.FieldByName('VLREMITIDO')as TFloatField).DisplayFormat := CasasDecimais('Produtos');


            while not ibTempAReceber.Eof do begin

              if (ibTempAReceber.FieldByName('CARTAO').AsString = 'Cartao')Then begin

                if VlrCartoes = 0 Then begin

                  VlrCartoes := StrtoFloat(StringReplace(FloattoStr(ibTempAReceber.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                end else begin

                  TotalCartoes := StringReplace(FloattoStr(ibTempAReceber.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                  VlrCartoes := VlrCartoes + StrtoFloat(StringReplace(TotalCartoes,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                end;//if vlrconsig

             {   if VlrTotalVendaBCartoes = 0 Then begin

                   VlrTotalVendaBCartoes := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalVendaBCartoes := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                   VlrTotalVendaBCartoes := VlrTotalVendaBCartoes + StrtoFloat(StringReplace(TotalVendaBCartoes,ThousandSeparator,'',[rfReplaceAll]));

                 end;//if vlrconsig

                 if VlrTotalVendaCCartoes = 0 Then begin

                   VlrTotalVendaCCartoes := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

                 end else begin

                   TotalVendaCCartoes := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                   VlrTotalVendaCCartoes := VlrTotalVendaCCartoes + StrtoFloat(StringReplace(TotalVendaCCartoes,ThousandSeparator,'',[rfReplaceAll]));

                 end;//if vlrconsig  }

               ibTempAReceber.Next;


             end;//if
           
            end;//while temp a receber

////////////////////////////////////////////////////////////////////////////////

            ibAPagar.Close;
            ibAPagar.SQL.Clear;
            ibAPagar.SQL.Add('SELECT * FROM TBLCONTASAPAGAR WHERE(TBLCONTASAPAGAR.DATADABAIXA between :ParamDataIni and :ParamDataF)and(TBLCONTASAPAGAR.BAIXADO = ''Sim'')');
            ibAPagar.Open;

            ibAPagar.Close;
            ibAPagar.ParamByName('ParamDataIni').Value      := dtpDataIniGeral.DateTime;
            ibAPagar.ParamByName('ParamDataF').Value        := dtpDataFimGeral.DateTime;
            ibAPagar.Open;

            (ibAPagar.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            while not ibAPagar.Eof do begin

              if VlraPagar = 0 Then begin

                VlraPagar := StrtoFloat(StringReplace(FloattoStr(ibAPagar.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalaPagar := StringReplace(FloattoStr(ibAPagar.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                VlraPagar := VlraPagar + StrtoFloat(StringReplace(TotalaPagar,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end;//if vlrconsig

            ibAPagar.Next;

            end;//while

////////////////////////////////////////////////////////////////////////////////

            Commit(ibAReceber);
            ibAReceber.Close;
            ibAReceber.SQL.Clear;
            ibAReceber.SQL.Add('SELECT * FROM TBLCONTASARECEBER WHERE (TBLCONTASARECEBER.DATADABAIXA between :ParamDataIni and :ParamDataF)and(TBLCONTASARECEBER.BAIXADO = ''Sim'')');
            ibAReceber.Open;

            ibAReceber.Close;
            ibAReceber.ParamByName('ParamDataIni').Value      := dtpDataIniGeral.DateTime;
            ibAReceber.ParamByName('ParamDataF').Value        := dtpDataFimGeral.DateTime;
            ibAReceber.Open;


            (ibAReceber.FieldByName('VLREMITIDO')as TFloatField).DisplayFormat := CasasDecimais('Produtos');

            while not ibAReceber.Eof do begin

              if VlraReceber = 0 Then begin

                VlraReceber := StrtoFloat(StringReplace(FloattoStr(ibAReceber.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalaReceber := StringReplace(FloattoStr(ibAReceber.FieldByName('VLREMITIDO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                VlraReceber := VlraReceber + StrtoFloat(StringReplace(TotalaReceber,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end;//if vlrconsig

            ibAReceber.Next;

            end;//while

////////////////////////////////////////////////////////////////////////////////

            Commit(ibPagtoPendente);
            ibPagtoPendente.Close;
            ibPagtoPendente.SQL.Clear;
            ibPagtoPendente.SQL.Add('SELECT * FROM TBLPAGTOPENDENTE WHERE(TBLPAGTOPENDENTE.DATAPAGTO between :ParamDataIni and :ParamDataF)');
            ibPagtoPendente.Open;

            ibPagtoPendente.Close;
            ibPagtoPendente.ParamByName('ParamDataIni').Value      := dtpDataIniGeral.DateTime;
            ibPagtoPendente.ParamByName('ParamDataF').Value        := dtpDataFimGeral.DateTime;
            ibPagtoPendente.Open;


            (ibPagtoPendente.FieldByName('VLRPAGO')as TFloatField).DisplayFormat := CasasDecimais('Produtos');

            while not ibPagtoPendente.Eof do begin

              if VlrTotalPagoPendente = 0 Then begin

                VlrTotalPagoPendente := StrtoFloat(StringReplace(FloattoStr(ibPagtoPendente.FieldByName('VLRPAGO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end else begin

                TotalPagoPendente := StringReplace(FloattoStr(ibPagtoPendente.FieldByName('VLRPAGO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                VlrTotalPagoPendente := VlrTotalPagoPendente + StrtoFloat(StringReplace(TotalPagoPendente,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

              end;//if vlrconsig

            ibPagtoPendente.Next;

            end;//while

////////////////////////////////////////////////////////////////////////////////
   //   (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       Application.CreateForm(TfrmRelFluxoCx, frmRelFluxoCx);

        TRY

          with frmRelFluxoCx do begin

              frmRelFluxoCx.qrpFluxoCx.DataSet := ibChaveSat;
              //frmRelFluxoCx.qrpFluxoCx.DataSet := ibRecVendas;

              //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
              qrdbProd.DataSet    := ibChaveSat;
              qrdbProd.DataField  := ibChaveSat.FieldByName('NOMEPROD').FieldName;

              qrdbNCupom.DataSet    := ibChaveSat;
              qrdbNCupom.DataField  := ibChaveSat.FieldByName('IDSERVSVENDA').FieldName;

              qrdbVlrUnit.DataSet     := ibChaveSat;
              qrdbVlrUnit.DataField   := ibChaveSat.FieldByName('VLRUNIT').FieldName;
             (ibChaveSat.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

              qrdbQtde.DataSet        := ibChaveSat;
              qrdbQtde.DataField      := ibChaveSat.FieldByName('QTDE').FieldName;
              (ibChaveSat.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO

              qrdbVlrA.DataSet       := ibChaveSat;
              qrdbVlrA.DataField     := ibChaveSat.FieldByName('VLRTOTAL').FieldName;
              (ibChaveSat.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

              qrdbData.DataSet    := ibChaveSat;
              qrdbData.DataField  := ibChaveSat.FieldByName('DATA').FieldName;

              qrdbVlrB.DataSet    := ibChaveSat;
              qrdbVlrB.DataField  := ibChaveSat.FieldByName('VALORB').FieldName;
              (ibChaveSat.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

              qrdbVlrC.DataSet    := ibChaveSat;
              qrdbVlrC.DataField  := ibChaveSat.FieldByName('VALORC').FieldName;
              (ibChaveSat.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

           //   qrdbVlrD.DataSet    := ibServsVenda;
            //  qrdbVlrD.DataField  := ibServsVenda.FieldByName('VALORD').FieldName;
            //  (ibServsVenda.FieldByName('VALORD') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


              qrdbDesc.DataSet    := ibChaveSat;
              qrdbDesc.DataField  := ibChaveSat.FieldByName('VLRDESCONTO').FieldName;
              (ibChaveSat.FieldByName('VLRDESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO

         //   qrdbAcrescimo.DataSet    := ibServsVenda;
          //  qrdbAcrescimo.DataField  := ibServsVenda.FieldByName('ACRESCIMO').FieldName;
           // (ibServsVenda.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrlFuncionarioComissao.Caption := '';

            qrl_DataIni.Caption := DateToStr(dtpDataIniGeral.Date);
            qrl_DataF.Caption  := DateToStr(dtpDataFimGeral.Date);

         /////////////////////////////////////////////////////////////////////////

            qrl_TotalDesc.Caption := FormatFloat(CasasDecimais('Produtos'),VlrDesconto);
            qrl_Descontos.Caption := FormatFloat(CasasDecimais('Produtos'),VlrDesconto);

            if VlrPendente > 0 Then begin
            qrl_TotalPendente.Caption      := FormatFloat(CasasDecimais('Produtos'),VlrPendente + VlrTotalVendaBP + VlrTotalVendaCP);
            end else begin
            qrl_TotalPendente.Caption      := '0,00';
            end;

            if VlrSangria > 0 Then begin
            qrl_TotalSangria.Caption        := FormatFloat(CasasDecimais('Produtos'),VlrSangria);
            end else begin
            qrl_TotalSangria.Caption        := '0,00';
            end;

            if VlraPagar > 0 Then begin
            qrl_TotalaPagar.Caption        := FormatFloat(CasasDecimais('Produtos'),VlraPagar);
            end else begin
            qrl_TotalaPagar.Caption        := '0,00';
            end;

            if VlraReceber > 0 Then begin
            qrl_TotalaReceber.Caption        := FormatFloat(CasasDecimais('Produtos'),VlraReceber);
            end else begin
            qrl_TotalaReceber.Caption        := '0,00';
            end;

            if VlrTotalCartaoCredito > 0 Then begin
            qrl_TotalCartaoCredito.Caption        := FormatFloat(CasasDecimais('Produtos'),VlrTotalCartaoCredito + VlrCartaoCredB + VlrCartaoCredC);
            end else begin                                                           //  + VlrTotalVendaBCartoes + VlrTotalVendaCCartoes
            qrl_TotalCartaoCredito.Caption        := '0,00';
            end;

            if VlrTotalCartaoDebito > 0 Then begin
            qrl_TotalCartaoDebito.Caption        := FormatFloat(CasasDecimais('Produtos'),VlrTotalCartaoDebito + VlrCartaoDebB + VlrCartaoDebC);
            end else begin                                                           //  + VlrTotalVendaBCartoes + VlrTotalVendaCCartoes
            qrl_TotalCartaoDebito.Caption        := '0,00';
            end;

            if VlrCheque > 0 Then begin
            qrl_TotalCheque.Caption        := FormatFloat(CasasDecimais('Produtos'),VlrCheque);
            end else begin
            qrl_TotalCheque.Caption        := '0,00';
            end;

            //SOMA OS TOTAIS DE SAIDA
            qrl_TotalSaida.Caption := FormatFloat(CasasDecimais('Produtos'),VlraPagar);
            VlrGeralSaida := VlraPagar;                  ////+ VlrCustoLav + VlrConsig

            //SOMA OS TOTAIS DE ENTRADA                                                 //  VlrTotalVendaB   VlrTotalVendaC
            qrl_TotalEntrada.Caption := FormatFloat(CasasDecimais('Produtos'),VlrUnit + rCartaoUnif + VlrTotalVendaB + VlrTotalVendaC + VlrCheque + VlraReceber + VlrTotalPagoPendente);
            VlrGeralEntrada := VlrUnit + VlrTotalVendaB + VlrTotalVendaC + rCartaoUnif + VlrCheque + VlraReceber + VlrTotalPagoPendente + VlrTotalCartaoCredito + VlrTotalCartaoDebito + VlrCartaoCredB + VlrCartaoCredC + VlrCartaoDebB + VlrCartaoDebC;

            if VlrSangria > 0 Then begin

            VlrGeralEntrada := VlrGeralEntrada - VlrSangria

            end else begin

            VlrGeralEntrada := VlrGeralEntrada;

            end;
                                                                            //  VlrTotalVenda
            if VlrUnit > 0 Then begin
            qrl_TotalVendas.Caption := FormatFloat(CasasDecimais('Produtos'), VlrUnit + VlrTotalVendaB + VlrTotalVendaC);
            end else begin
            qrl_TotalVendas.Caption := '0,00';
            end;

            qrl_TotalPagtoPendente.Caption := FormatFloat(CasasDecimais('Produtos'),VlrTotalPagoPendente);

            if VlrGeralEntrada > VlrGeralSaida Then begin

              qrl_TotalLiquido.Font.Color := clBlue;
              qrl_TotalLiquido.Caption := FormatFloat(CasasDecimais('Produtos'),VlrUnit + VlrTotalVendaB + VlrTotalVendaC + rCartaoUnif + VlrCheque - VlrGeralSaida + VlrCartaoCredB + VlrCartaoCredC + VlrCartaoDebB + VlrCartaoDebC - VlrDesconto);

            end;

            if VlrGeralEntrada < VlrGeralSaida Then begin

              qrl_TotalLiquido.Font.Color := clRed;
              qrl_TotalLiquido.Caption := FormatFloat(CasasDecimais('Produtos'),VlrUnit + VlrTotalVendaB + VlrTotalVendaC + rCartaoUnif + VlrCheque - VlrGeralSaida);

            end;
                                                                                                                                                                                     //VlrTotalCartaoCredito + VlrTotalCartaoDebito +
            qrl_TotalCx.Caption := FormatFloat(CasasDecimais('Produtos'),VlrUnit + VlrTotalVendaB + VlrTotalVendaC + rCartaoUnif + VlrCheque + VlraReceber + VlrTotalPagoPendente +  VlrCartaoCredB + VlrCartaoCredC + VlrCartaoDebB + VlrCartaoDebC - VlrDesconto);
         /////////////////////////////////////////////////////////////////////////

            { qrpFluxoCx.Prepare;
             ExportQR1.Report := frmRelFluxoCx.qrpFluxoCx;
             ExportQR1.ExportQRPDF('C:\Relatorio Fluxo de Caixa\''Fluxo de Caixa',false); }
         {   frmRelFluxoCx.qrpFluxoCx.DataSet := ibRecVendas;
            while not ibRecVendas.Eof do begin

              qrdbDesc.DataSet    := ibRecVendas;
              qrdbDesc.DataField  := ibRecVendas.FieldByName('VLRDESCONTO').FieldName;
              (ibRecVendas.FieldByName('VLRDESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

              ibRecVendas.Next;

            end;//while ibservsvenda  }

            qrpFluxoCx.Preview;

          end; {if}


        EXCEPT
          on E : Exception do begin
             frmRelFluxoCx.Release;
             MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
          end;
        END;

      end;//if ckxml_Sat

 //   end;{if rb geral}


   {  Application.CreateForm(TfrmRelTotalFluxo, frmRelTotalFluxo);

      TRY

        with frmRelTotalFluxo do begin

          frmRelTotalFluxo.qrpTotalFluxoCx.DataSet := ibServsVenda;

          qrpTotalFluxoCx.Preview; }

       // end; {if}


     { EXCEPT
        on E : Exception do begin
           frmRelTotalFluxo.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END; }
    //////////////////////////////////////////////////////////////

    end;{if rb geral}



////////////////////////////////////////////////////////////////////////////////
    if rbPrecoA.Checked Then begin


      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
      + 'TBLTIPOCOMPROMISSO.NOME As Compromisso,'
      + 'CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
   //   + 'LEFT OUTER JOIN TBLTIPOPRODUTO ON TBLSERVICOSVENDAS.IDTIPOPROD=TBLTIPOPRODUTO.IDTIPOPROD '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA<>''Pago'')');
      ibServsVenda.Open;

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibServsVenda.Open;


   //   (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     Application.CreateForm(TfrmFluxoPrecoA, frmFluxoPrecoA);

      TRY

        with frmFluxoPrecoA do begin

          frmFluxoPrecoA.qrpFluxoCxPrecoA.DataSet := ibServsVenda;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbProd.DataSet    := ibServsVenda;
          qrdbProd.DataField  := ibServsVenda.FieldByName('Produto').FieldName;

          qrdbVlrUnit.DataSet     := ibServsVenda;
          qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
         (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbQtde.DataSet        := ibServsVenda;
          qrdbQtde.DataField      := ibServsVenda.FieldByName('QTDE').FieldName;
          (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbValorA.DataSet       := ibServsVenda;
          qrdbValorA.DataField     := ibServsVenda.FieldByName('VLRTOTAL').FieldName;
          (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet    := ibServsVenda;
          qrdbData.DataField  := ibServsVenda.FieldByName('DATA').FieldName;

          qrpFluxoCxPrecoA.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmFluxoPrecoA.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

    end;{if rbprecoa}

    if rbPrecoB.Checked Then begin

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
      + 'TBLTIPOCOMPROMISSO.NOME As Compromisso,'
      + 'CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
   //   + 'LEFT OUTER JOIN TBLTIPOPRODUTO ON TBLSERVICOSVENDAS.IDTIPOPROD=TBLTIPOPRODUTO.IDTIPOPROD '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA<>''Pago'')');
      ibServsVenda.Open;

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibServsVenda.Open;


   //   (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     Application.CreateForm(TfrmRelFluxoPrecoB, frmRelFluxoPrecoB);

      TRY

        with frmRelFluxoPrecoB do begin

          frmRelFluxoPrecoB.qrpFluxoCxPrecoB.DataSet := ibServsVenda;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbProd.DataSet    := ibServsVenda;
          qrdbProd.DataField  := ibServsVenda.FieldByName('Produto').FieldName;

          qrdbVlrUnit.DataSet     := ibServsVenda;
          qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
         (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbQtde.DataSet        := ibServsVenda;
          qrdbQtde.DataField      := ibServsVenda.FieldByName('QTDE').FieldName;
          (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbValorB.DataSet       := ibServsVenda;
          qrdbValorB.DataField     := ibServsVenda.FieldByName('VALORB').FieldName;
          (ibServsVenda.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet    := ibServsVenda;
          qrdbData.DataField  := ibServsVenda.FieldByName('DATA').FieldName;

          qrpFluxoCxPrecoB.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelFluxoPrecoB.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

    end;{if rbprecob}

    if rbPrecoC.Checked Then begin

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
      + 'TBLTIPOCOMPROMISSO.NOME As Compromisso,'
      + 'CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
   //   + 'LEFT OUTER JOIN TBLTIPOPRODUTO ON TBLSERVICOSVENDAS.IDTIPOPROD=TBLTIPOPRODUTO.IDTIPOPROD '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA<>''Pago'')');
      ibServsVenda.Open;

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibServsVenda.Open;


   //   (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     Application.CreateForm(TfrmRelFluxoPrecoC, frmRelFluxoPrecoC);

      TRY

        with frmRelFluxoPrecoC do begin

          frmRelFluxoPrecoC.qrpFluxoCxPrecoC.DataSet := ibServsVenda;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbProd.DataSet    := ibServsVenda;
          qrdbProd.DataField  := ibServsVenda.FieldByName('Produto').FieldName;

          qrdbVlrUnit.DataSet     := ibServsVenda;
          qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
         (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbQtde.DataSet        := ibServsVenda;
          qrdbQtde.DataField      := ibServsVenda.FieldByName('QTDE').FieldName;
          (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbValorC.DataSet       := ibServsVenda;
          qrdbValorC.DataField     := ibServsVenda.FieldByName('VALORC').FieldName;
          (ibServsVenda.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet    := ibServsVenda;
          qrdbData.DataField  := ibServsVenda.FieldByName('DATA').FieldName;

          qrpFluxoCxPrecoC.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelFluxoPrecoC.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

    end;{if rbprecob}

////////////////////////////////////////////////////////////////////////////////

    if rbPrecoD.Checked Then begin

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
      + 'TBLTIPOCOMPROMISSO.NOME As Compromisso,'
      + 'CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
   //   + 'LEFT OUTER JOIN TBLTIPOPRODUTO ON TBLSERVICOSVENDAS.IDTIPOPROD=TBLTIPOPRODUTO.IDTIPOPROD '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA<>''Pago'')');
      ibServsVenda.Open;

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibServsVenda.Open;


   //   (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     Application.CreateForm(TfrmRelFluxoPrecoD, frmRelFluxoPrecoD);

      TRY

        with frmRelFluxoPrecoD do begin

          frmRelFluxoPrecoD.qrpFluxoCxPrecoD.DataSet := ibServsVenda;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbProd.DataSet    := ibServsVenda;
          qrdbProd.DataField  := ibServsVenda.FieldByName('Produto').FieldName;

          qrdbVlrUnit.DataSet     := ibServsVenda;
          qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
         (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbQtde.DataSet        := ibServsVenda;
          qrdbQtde.DataField      := ibServsVenda.FieldByName('QTDE').FieldName;
          (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbValorD.DataSet       := ibServsVenda;
          qrdbValorD.DataField     := ibServsVenda.FieldByName('VALORD').FieldName;
          (ibServsVenda.FieldByName('VALORD') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet    := ibServsVenda;
          qrdbData.DataField  := ibServsVenda.FieldByName('DATA').FieldName;

          qrpFluxoCxPrecoD.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelFluxoPrecoD.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

    end;{if rbprecob}

  end;{with}

end;

procedure TfrmFluxoCxP.FormShow(Sender: TObject);
begin

  rbGeral.Checked := True;
  dtpDataIniGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFimGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  
end;

procedure TfrmFluxoCxP.rbPrecoAClick(Sender: TObject);

var
intCupom : Integer;

begin

  with dmModule do begin

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,TBLSERVICOSVENDAS.POSVENDA,TBLSERVICOSVENDAS.IDTIPOPAGTO,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.PENDENTEPAGO,'
      + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.VLRTROCA,TBLSERVICOSVENDAS.NOMEVENDA,'
      + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.TOTALVLRPROD,TBLSERVICOSVENDAS.VLRSANGRIA,'
      + 'TBLSERVICOSVENDAS.NOMEPROD,TBLTIPOPAGTOAVULSO.TIPOPAGTO,CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
     // + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
      + 'INNER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
      + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
     // + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA ' TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.IDVENDA,
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA=''Pago'')ORDER BY IDSERVSVENDA ASC');
      ibServsVenda.Open;

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibServsVenda.Open;


     { ibTempServicosVendas.Close;
      ibTempServicosVendas.SQL.Clear;
      ibTempServicosVendas.SQL.Add('SELECT TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.DATA,TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.IDVENDA FROM TBLSERVICOSVENDAS '
      + 'INNER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA=''Pago'')ORDER BY IDSERVSVENDA ASC');
      ibTempServicosVendas.Open;

      ibTempServicosVendas.Close;
      ibTempServicosVendas.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibTempServicosVendas.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibTempServicosVendas.Open; }
      
      Commit(ibRecVendas);
      ibRecVendas.Close;
      ibRecVendas.SQL.Clear;
      ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.IDVENDA,TBLRECEBEVENDAS.IDTIPOPAGTO,TBLRECEBEVENDAS.TOTALVENDA,TBLRECEBEVENDAS.DATA,'
      + 'TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.VLRACRESCIMO FROM TBLRECEBEVENDAS '
      +'WHERE(TBLRECEBEVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)ORDER BY IDVENDA ASC');
      ibRecVendas.Open;

      ibRecVendas.Close;
      ibRecVendas.ParamByName('ParamDataInicial').Value := dtpDataIniGeral.DateTime;
      ibRecVendas.ParamByName('ParamDataFinal').Value := dtpDataFimGeral.DateTime;
      ibRecVendas.Open;


     Application.CreateForm(TfrmFluxoVendasCaixa, frmFluxoVendasCaixa);

      TRY

        with frmFluxoVendasCaixa do begin

            frmFluxoVendasCaixa.sdProdutos.DataSet := ibServsVenda;
            frmFluxoVendasCaixa.sdDesconto.DataSet := ibRecVendas;

            while not ibServsVenda.Eof do begin

              if ibServsVenda.RecordCount > 0 Then begin

                //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
                qrdbProd.DataSet    := ibServsVenda;
                qrdbProd.DataField  := ibServsVenda.FieldByName('NOMEPROD').FieldName;

                qrdbNCupom.DataSet    := ibServsVenda;
                qrdbNCupom.DataField  := ibServsVenda.FieldByName('IDSERVSVENDA').FieldName;

            //  qrdbDesc.DataSet    := ibServsVenda;
          //    qrdbDesc.DataField  := ibServsVenda.FieldByName('VLRDESCONTO').FieldName;
             // (ibServsVenda.FieldByName('VLRDESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

              end;

              ibServsVenda.Next;

            end;


            while not ibRecVendas.Eof do begin

              if ibRecVendas.RecordCount > 0 Then begin

                qrdbDesc.DataSet    := ibRecVendas;
                qrdbDesc.DataField  := ibRecVendas.FieldByName('VLRDESCONTO').FieldName;
                (ibRecVendas.FieldByName('VLRDESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

                ibRecVendas.Next;

              end;

            end; 

          qrpFluxoVendasCaixa.Preview;
          qrpDesconto.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelFluxoCx.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

  end;//with
  
end;

end.
