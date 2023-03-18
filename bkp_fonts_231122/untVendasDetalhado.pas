unit untVendasDetalhado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Data.DB;

type
  TfrmVendasDetalhado = class(TForm)
    lbl_DTIni: TLabel;
    lbl_DTF: TLabel;
    dtpDataCaixaIni: TDateTimePicker;
    dtpDataCaixa: TDateTimePicker;
    procedure BmsXPButton2Click(Sender: TObject);
    procedure ibeaVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibeaImprimirCupomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendasDetalhado: TfrmVendasDetalhado;

implementation

uses funcPosto, untdmModule, untRelFluxoDetalhado, untProdutoVendidoP;
 { Daruma_Framework_DUAL_ImprimirTexto,
  Daruma_Framework_Looping_Verificacao_Status,
  Daruma_Framework_Looping_Verificacao_Status_Doc,
  Daruma_Framework_Variaveis_Globais, Daruma_Framework_Autenticar;
Function Daruma_DUAL_ImprimirTexto( TextoLivre: String; TamanhoTexto: Integer ): Integer; StdCall; External 'Daruma32.dll'  }
{$R *.dfm}

procedure TfrmVendasDetalhado.BmsXPButton2Click(Sender: TObject);
begin
Close;
end;

procedure TfrmVendasDetalhado.ibeaVisualizarClick(Sender: TObject);
var

VlrDinheiro,VlrCheque,VlrChequePre : String;
TotalDinheiro,TotalCheque,TotalChequePre,TotalPendente : Real;
VlrNota,VlrVisaCredito,VlrVisaDebito,VlrVisaParcelado,VlrMastercardCredito : String;
TotalNota,TotalVisaCredito,TotalVisaDebito,TotalVisaParcelado,TotalMastercardCredito : Real;
VlrMastercardDebito,VlrHipercard,VlrMastercardParcelado,VlrAmericanExpress : String;
TotalMastercardParcelado,TotalHipercard,TotalAmericanExpress : Real;
VlrGeral,VlrPendente : String;
TotalGeral,TotalMastercardDebito, TotalVendido, TotalLiquido : Real;

IDDinheiro, IDCheque, IDChequePre,IDPendente : Integer;
IDVisaCredito, IDVisaDebito, IDVisaParcelado, IDMastercardCredito, IDMastercardDebito : Integer;
IDMastercardParcelado,IDHipercard, IDAmericanExpress: Integer;

VisaCredito1,VisaCredito2,VisaCredito3,VisaCredito4 : Real;
VisaDebito1,VisaDebito2,VisaDebito3,VisaDebito4 : Real;
VisaParcelado1,VisaParcelado2,VisaParcelado3,VisaParcelado4 : Real;

MastercardCredito1,MastercardCredito2,MastercardCredito3,MastercardCredito4 : Real;
MastercardDebito1,MastercardDebito2,MastercardDebito3,MastercardDebito4 : Real;
MastercardParcelado1,MastercardParcelado2,MastercardParcelado3,MastercardParcelado4 : Real;

TotalPagoPendente, TotalSoroCred : Real;
VlrPagoPendente, VlrSoroCred : String;
IDSoroCred : Integer;

begin

  with dmModule do begin
      
//    if cboFuncionario.ItemIndex = - 1 Then begin

    //  Commit(ibRecVendas);
      ibRecVendas.Close;                                                                                           //  and SITUACAOVENDA<> ''Pendente''
      ibRecVendas.SQL.Clear;
      ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE (DATA between :ParamDataInicial and :ParamDataFinal)');
      ibRecVendas.Open;

      ibRecVendas.Close;
      ibRecVendas.ParamByName('ParamDataInicial').Value      := dtpDataCaixaIni.DateTime;
      ibRecVendas.ParamByName('ParamDataFinal').Value        := dtpDataCaixa.DateTime;
      ibRecVendas.Open;

      (ibRecVendas.FieldByName('TOTALVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

   // end;//if cbo funcionario

     { ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT  * FROM  TBLSERVICOSVENDAS WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)');
      ibServsVenda.Open;

      ibServsVenda.Close;
      ibServsVenda.ParamByName('ParamDataInicial').Value      := dtpDataCaixaIni.DateTime;
      ibServsVenda.ParamByName('ParamDataFinal').Value        := dtpDataCaixa.DateTime;
      ibServsVenda.Open; }

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
////////////////////////////////////////////////////////////////////////////////

      while not ibRecVendas.Eof do begin


         if TotalPagoPendente = 0 Then begin

         TotalPagoPendente := StrToFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('PAGTOPENDENTE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

         end else begin

         VlrPagoPendente    := (StringReplace(FloatToStr(ibRecVendas.FieldByName('PAGTOPENDENTE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
         TotalPagoPendente  := TotalPagoPendente + StrToFloat(StringReplace(VlrPagoPendente,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

         end;//if



         if ibRecVendas.FieldByName('TOTALVENDA').AsInteger > 0 Then begin

           if TotalGeral = 0 Then begin

             TotalGeral := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrGeral := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalGeral := TotalGeral + StrToFloat(StringReplace(VlrGeral,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if

        if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDDinheiro Then begin

          if TotalDinheiro = 0 Then begin

            TotalDinheiro := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrDinheiro := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalDinheiro := TotalDinheiro + StrToFloat(StringReplace(VlrDinheiro,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if



         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDCheque Then begin

           if TotalCheque = 0 Then begin

             TotalCheque := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrCheque := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalCheque := TotalCheque + StrToFloat(StringReplace(VlrCheque,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         //  lbl_edtCheque.Text   := FormatFloat(CasasDecimais('Produtos'),TotalCheque);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDChequePre Then begin

           if TotalChequePre = 0 Then begin

             TotalChequePre := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrChequePre := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalChequePre := TotalChequePre + StrToFloat(StringReplace(VlrChequePre,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         //  lbl_edtChequePre.Text   := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////


         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaCredito Then begin

           if TotalVisaCredito = 0 Then begin

             TotalVisaCredito := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrVisaCredito := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalVisaCredito := TotalVisaCredito + StrToFloat(StringReplace(VlrVisaCredito,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

        //   lbl_edtVisa.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisa);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaDebito Then begin

           if TotalVisaDebito = 0 Then begin

             TotalVisaDebito := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrVisaDebito := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalVisaDebito := TotalVisaDebito + StrToFloat(StringReplace(VlrVisaDebito,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

        //   lbl_edtVisaElectron.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisaElectron);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaParcelado Then begin

           if TotalVisaParcelado = 0 Then begin

             TotalVisaParcelado := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrVisaParcelado := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalVisaParcelado := TotalVisaParcelado + StrToFloat(StringReplace(VlrVisaParcelado,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         //  lbl_edtVisaElectronPre.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisaElectronPre);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardCredito Then begin

           if TotalMastercardCredito = 0 Then begin

             TotalMastercardCredito := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrMastercardCredito := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalMastercardCredito := TotalMastercardCredito + StrToFloat(StringReplace(VlrMastercardCredito,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         //  lbl_edtMastercard.Text   := FormatFloat(CasasDecimais('Produtos'),TotalMastercard);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardParcelado Then begin

           if TotalMastercardParcelado = 0 Then begin

             TotalMastercardParcelado := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrMastercardParcelado := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalMastercardParcelado := TotalMastercardParcelado + StrToFloat(StringReplace(VlrMastercardParcelado,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

        //   lbl_edtRedeShop.Text   := FormatFloat(CasasDecimais('Produtos'),TotalRedeShop);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////


       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardDebito Then begin

           if TotalMastercardDebito = 0 Then begin

             TotalMastercardDebito := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrMastercardDebito := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalMastercardDebito := TotalMastercardParcelado + StrToFloat(StringReplace(VlrMastercardDebito,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////



       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDHipercard Then begin

           if TotalHipercard = 0 Then begin

             TotalHipercard := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrHipercard := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalHipercard := TotalHipercard + StrToFloat(StringReplace(VlrHipercard,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         //  lbl_edtHipercard.Text   := FormatFloat(CasasDecimais('Produtos'),TotalHipercard);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDAmericanExpress Then begin

           if TotalAmericanExpress = 0 Then begin

             TotalAmericanExpress := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrAmericanExpress := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalAmericanExpress := TotalAmericanExpress + StrToFloat(StringReplace(VlrAmericanExpress,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         //  lbl_edtAmericanExpress.Text   := FormatFloat(CasasDecimais('Produtos'),TotalAmericanExpress);

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDSoroCred Then begin

           if TotalSoroCred = 0 Then begin

             TotalSoroCred := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrSoroCred := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalSoroCred := TotalSoroCred + StrToFloat(StringReplace(VlrSoroCred,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////

      // if (lbl_edtTotalPendente.Text = '0,00') or (lbl_edtTotalPendente.Text = '') Then begin

       { Commit(ibRecVendas);
        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE (DATA between :ParamDataInicial and :ParamDataFinal) and SITUACAOVENDA= ''Pendente''');
        ibRecVendas.Open;

        ibRecVendas.Close;
        ibRecVendas.ParamByName('ParamDataInicial').Value      := dtpDataCaixaIni.DateTime;
        ibRecVendas.ParamByName('ParamDataFinal').Value        := dtpDataCaixa.DateTime;
        ibRecVendas.Open; }

      //  (ibRecVendas.FieldByName('TOTALVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO



       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDPendente Then begin

           if TotalPendente = 0 Then begin

             TotalPendente := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVLRPENDENTE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrPendente := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVLRPENDENTE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalPendente := TotalPendente + StrToFloat(StringReplace(VlrPendente,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

     //  end;//if
////////////////////////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////////////////////////

           // if TotalPendente <> 0 Then begin

           {   if TotalPendente > TotalGeral Then begin

              TotalLiquido := TotalPendente - TotalGeral;

              end else begin

              TotalLiquido := TotalGeral - TotalPendente;

              end;//if }

           // end;//if

              TotalVendido := TotalGeral + TotalPendente;
              TotalLiquido := TotalDinheiro + TotalCheque + TotalPagoPendente;

        ibRecVendas.Next;


      end;//while

     Application.CreateForm(TfrmRelFluxoDetalhado, frmRelFluxoDetalhado);

      TRY

        with frmRelFluxoDetalhado do begin

          frmRelFluxoDetalhado.qrpFluxoCx.DataSet := ibRecVendas;


        qrl_Dinheiro.Caption       := FormatFloat(CasasDecimais('Produtos'),TotalDinheiro);
        qrl_Cheque.Caption         := FormatFloat(CasasDecimais('Produtos'),TotalCheque);
        qrl_ChequePre.Caption      := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);
        qrl_Cartoes.Caption        := FormatFloat(CasasDecimais('Produtos'),TotalVisaCredito+TotalVisaDebito+TotalMastercardCredito+TotalMastercardDebito+TotalHipercard+TotalAmericanExpress);
        qrl_Pendentes.Caption      := FormatFloat(CasasDecimais('Produtos'),TotalPendente);
        qrl_Geral.Caption          := FormatFloat(CasasDecimais('Produtos'),TotalVendido);
        qrl_PagtoPendentes.Caption := FormatFloat(CasasDecimais('Produtos'),TotalPagoPendente);
        qrl_Recebido.Caption       := FormatFloat(CasasDecimais('Produtos'),TotalLiquido);

        qrlDataIni.Caption := DateToStr(frmVendasDetalhado.dtpDataCaixaIni.Date);
        qrlDataF.Caption   := DateToStr(frmVendasDetalhado.dtpDataCaixa.Date);

        {lbl_edtVisaDebito.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisaDebito);
        lbl_edtVisaParcelado.Text   := FormatFloat(CasasDecimais('Produtos'),TotalVisaParcelado);
        lbl_edtMastercardCredito.Text   := FormatFloat(CasasDecimais('Produtos'),TotalMastercardCredito);
        lbl_edtMastercardDebito.Text   := FormatFloat(CasasDecimais('Produtos'),TotalMastercardDebito);
        lbl_edtMastercardParcelado.Text   := FormatFloat(CasasDecimais('Produtos'),TotalHipercard);
        lbl_edtAmericanExpress.Text   := FormatFloat(CasasDecimais('Produtos'),TotalAmericanExpress);
        lbl_edtTotalPendente.Text   := FormatFloat(CasasDecimais('Produtos'),TotalPendente);
        lbl_edtTotalGeral.Text    := FormatFloat(CasasDecimais('Produtos'),TotalVendido);
        lbl_edtPagtoPendente.Text := FormatFloat(CasasDecimais('Produtos'),TotalPagoPendente);
        lbl_edtTotalRecebido.Text   := FormatFloat(CasasDecimais('Produtos'),TotalLiquido); }



////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////



          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
        {  qrdbProd.DataSet    := ibServsVenda;
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

          qrdbAcrescimo.DataSet    := ibServsVenda;
          qrdbAcrescimo.DataField  := ibServsVenda.FieldByName('ACRESCIMO').FieldName;
          (ibServsVenda.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos');} //CRIA UMA MASCARA PARA O CAMPO


          qrpFluxoCx.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelFluxoDetalhado.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

  end;//with

end;

procedure TfrmVendasDetalhado.FormShow(Sender: TObject);
begin
  dtpDataCaixaIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataCaixa.DateTime    := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

end;

procedure TfrmVendasDetalhado.ibeaImprimirCupomClick(Sender: TObject);

{var

VlrDinheiro,VlrCheque,VlrChequePre : String;
TotalDinheiro,TotalCheque,TotalChequePre,TotalPendente : Real;
VlrNota,VlrVisaCredito,VlrVisaDebito,VlrVisaParcelado,VlrMastercardCredito : String;
TotalNota,TotalVisaCredito,TotalVisaDebito,TotalVisaParcelado,TotalMastercardCredito : Real;
VlrMastercardDebito,VlrHipercard,VlrMastercardParcelado,VlrAmericanExpress : String;
TotalMastercardParcelado,TotalHipercard,TotalAmericanExpress : Real;
VlrGeral,VlrPendente : String;
TotalGeral,TotalMastercardDebito, TotalVendido, TotalLiquido : Real;

IDDinheiro, IDCheque, IDChequePre,IDPendente : Integer;
IDVisaCredito, IDVisaDebito, IDVisaParcelado, IDMastercardCredito, IDMastercardDebito : Integer;
IDMastercardParcelado,IDHipercard, IDAmericanExpress, IDSoroCred: Integer;

VisaCredito1,VisaCredito2,VisaCredito3,VisaCredito4 : Real;
VisaDebito1,VisaDebito2,VisaDebito3,VisaDebito4 : Real;
VisaParcelado1,VisaParcelado2,VisaParcelado3,VisaParcelado4 : Real;

MastercardCredito1,MastercardCredito2,MastercardCredito3,MastercardCredito4 : Real;
MastercardDebito1,MastercardDebito2,MastercardDebito3,MastercardDebito4 : Real;
MastercardParcelado1,MastercardParcelado2,MastercardParcelado3,MastercardParcelado4 : Real;

TotalPagoPendente, TotalSoroCred : Real;
VlrPagoPendente, VlrSoroCred : String;

DadosCupom : Array[0..5] of String;
DataIni, DataFim : String;  }

begin

{  with dmModule do begin
      
     // Commit(ibRecVendas);
      ibRecVendas.Close;                                                                                           //  and SITUACAOVENDA<> ''Pendente''
      ibRecVendas.SQL.Clear;
      ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE (DATA between :ParamDataInicial and :ParamDataFinal)');
      ibRecVendas.Open;

      ibRecVendas.Close;
      ibRecVendas.ParamByName('ParamDataInicial').Value      := dtpDataCaixaIni.DateTime;
      ibRecVendas.ParamByName('ParamDataFinal').Value        := dtpDataCaixa.DateTime;
      ibRecVendas.Open;

      (ibRecVendas.FieldByName('TOTALVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

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
////////////////////////////////////////////////////////////////////////////////

      while not ibRecVendas.Eof do begin


         if TotalPagoPendente = 0 Then begin

         TotalPagoPendente := StrToFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('PAGTOPENDENTE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

         end else begin

         VlrPagoPendente    := (StringReplace(FloatToStr(ibRecVendas.FieldByName('PAGTOPENDENTE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
         TotalPagoPendente  := TotalPagoPendente + StrToFloat(StringReplace(VlrPagoPendente,ThousandSeparator,'',[rfReplaceAll]));

         end;//if

         if ibRecVendas.FieldByName('TOTALVENDA').AsInteger > 0 Then begin

           if TotalGeral = 0 Then begin

             TotalGeral := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrGeral := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalGeral := TotalGeral + StrToFloat(StringReplace(VlrGeral,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if

        if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDDinheiro Then begin

          if TotalDinheiro = 0 Then begin

            TotalDinheiro := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrDinheiro := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            TotalDinheiro := TotalDinheiro + StrToFloat(StringReplace(VlrDinheiro,ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDCheque Then begin

           if TotalCheque = 0 Then begin

             TotalCheque := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrCheque := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalCheque := TotalCheque + StrToFloat(StringReplace(VlrCheque,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDChequePre Then begin

           if TotalChequePre = 0 Then begin

             TotalChequePre := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrChequePre := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalChequePre := TotalChequePre + StrToFloat(StringReplace(VlrChequePre,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////


         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaCredito Then begin

           if TotalVisaCredito = 0 Then begin

             TotalVisaCredito := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrVisaCredito := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalVisaCredito := TotalVisaCredito + StrToFloat(StringReplace(VlrVisaCredito,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaDebito Then begin

           if TotalVisaDebito = 0 Then begin

             TotalVisaDebito := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrVisaDebito := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalVisaDebito := TotalVisaDebito + StrToFloat(StringReplace(VlrVisaDebito,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDVisaParcelado Then begin

           if TotalVisaParcelado = 0 Then begin

             TotalVisaParcelado := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrVisaParcelado := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalVisaParcelado := TotalVisaParcelado + StrToFloat(StringReplace(VlrVisaParcelado,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

         if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardCredito Then begin

           if TotalMastercardCredito = 0 Then begin

             TotalMastercardCredito := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrMastercardCredito := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalMastercardCredito := TotalMastercardCredito + StrToFloat(StringReplace(VlrMastercardCredito,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardParcelado Then begin

           if TotalMastercardParcelado = 0 Then begin

             TotalMastercardParcelado := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrMastercardParcelado := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalMastercardParcelado := TotalMastercardParcelado + StrToFloat(StringReplace(VlrMastercardParcelado,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////


       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDMastercardDebito Then begin

           if TotalMastercardDebito = 0 Then begin

             TotalMastercardDebito := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrMastercardDebito := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalMastercardDebito := TotalMastercardParcelado + StrToFloat(StringReplace(VlrMastercardDebito,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////



       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDHipercard Then begin

           if TotalHipercard = 0 Then begin

             TotalHipercard := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrHipercard := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalHipercard := TotalHipercard + StrToFloat(StringReplace(VlrHipercard,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDAmericanExpress Then begin

           if TotalAmericanExpress = 0 Then begin

             TotalAmericanExpress := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrAmericanExpress := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalAmericanExpress := TotalAmericanExpress + StrToFloat(StringReplace(VlrAmericanExpress,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDSoroCred Then begin

           if TotalSoroCred = 0 Then begin

             TotalSoroCred := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrSoroCred := (StringReplace(FloatToStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalSoroCred := TotalSoroCred + StrToFloat(StringReplace(VlrSoroCred,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

////////////////////////////////////////////////////////////////////////////////

       if ibRecVendas.FieldByName('IDTIPOPAGTO').AsInteger = IDPendente Then begin

           if TotalPendente = 0 Then begin

             TotalPendente := StrToFloat(StringReplace(FloatToStr(ibRecVendas.FieldByName('VLRPENDENTE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrPendente := (StringReplace(FloatToStr(ibRecVendas.FieldByName('VLRPENDENTE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

             TotalPendente := TotalPendente + StrToFloat(StringReplace(VlrPendente,ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if tipopagto cheque

            TotalVendido := TotalGeral + TotalPendente;
            TotalLiquido := TotalDinheiro + TotalCheque + TotalPagoPendente;

            ibRecVendas.Next;

      end;//while


            DataIni := FormatDateTime('DD/MM/YYYY',dtpDataCaixaIni.Date);
            DataFim := FormatDateTime('DD/MM/YYYY',dtpDataCaixa.Date);
            //Hora           := FormatDateTime('hh:mm:ss',Now);

            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<tc>_</tc>'),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<sp>1</sp><ce><e><b>*Fluxo Detalhado*</ce></e></b>'),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Data Inicial:<sp>1</sp>'+DataIni+'<sp>1</sp>Data Final:<sp>1</sp>'+DataFim+''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<tc>_</tc>'),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Dinheiro  ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalDinheiro) + ''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Cheque    ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalCheque) + ''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Cheque Pre..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalDinheiro) + ''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Cartoes   ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalVisaCredito+TotalVisaDebito+TotalMastercardCredito+TotalMastercardDebito+TotalHipercard+TotalAmericanExpress+TotalSoroCred) + ''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Total em Pendentes ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalPendente) + ''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<tc>_</tc>'),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('TOTAL GERAL    ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalVendido) + ''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('PAGTO.PENDENTES..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalPagoPendente) + ''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('TOTAL LIQUIDO  ..:(R$)<sp>1</sp>'+ FormatFloat(CasasDecimais('Produtos'),TotalLiquido) + ''),0);

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

////////////////////////////////////////////////////////////////////////////////

  end;//with    }

end;

end.
