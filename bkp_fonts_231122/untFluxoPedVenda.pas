unit untFluxoPedVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  Grids, DBGrids, classComboBox,IBQuery, Data.DB;

type
  TfrmFluxoPedVenda = class(TForm)
    lbl_DataIni: TLabel;
    lbl_DataF: TLabel;
    lbl_Vendedor: TLabel;
    lbl_edtTotalDinh: TLabeledEdit;
    lbl_edtCheque: TLabeledEdit;
    lbl_edtChequePre: TLabeledEdit;
    lbl_edtDuplicata: TLabeledEdit;
    lbl_edtTotalGeral: TLabeledEdit;
    lbl_edtComissao: TLabeledEdit;
    lbl_edtTotalAPagar: TLabeledEdit;
    dbgFluxoPed: TDBGrid;
    dtpDataIni: TDateTimePicker;
    dtpDataF: TDateTimePicker;
    cboVendedor: TComboBox;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTVendedor;
    procedure dtpDataFChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibeaLimparClick(Sender: TObject);
    procedure cboVendedorChange(Sender: TObject);
    procedure ibeaConfirmarClick(Sender: TObject);
    procedure lbl_edtComissaoExit(Sender: TObject);
    procedure lbl_edtComissaoKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaEstornarClick(Sender: TObject);
    procedure ibeaReciboClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoPedVenda: TfrmFluxoPedVenda;
  MontaColunas : Boolean;
  
implementation

uses untdmModule, funcPosto, untRelRecibo;

{$R *.dfm}

procedure TfrmFluxoPedVenda.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmFluxoPedVenda.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmFluxoPedVenda.ExecSELECTVendedor;

var
IDVendedor : TClasseCombo;

begin

  with dmModule do begin

    ibUser.Close;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE TIPOUSUARIO=''Vendedor''');
    ibUser.Open;

    cboVendedor.Clear;

    while not ibUser.Eof do begin

      IDVendedor      := TClasseCombo.Create;
      IDVendedor.ID   := ibUser.FieldByName('IDUSER').AsInteger;
      cboVendedor.Items.AddObject(ibUser.FieldByName('NOME').AsString,IDVendedor);
      ibUser.Next;

    end;//WHILE

  end;//with

end;

procedure TfrmFluxoPedVenda.dtpDataFChange(Sender: TObject);

var
IDClassVendedor : TClasseCombo;
IDDinheiro, IDCheque, IDChequePre,IDPendente : Integer;
IDVisaCredito, IDVisaDebito, IDVisaParcelado, IDMastercardCredito, IDMastercardDebito : Integer;
IDMastercardParcelado,IDDuplicata: Integer;
TotalDinheiro,TotalCheque,TotalChequePre,TotalDuplicata,TotalGeral : Real;
VlrDinheiro,VlrCheque,VlrChequePre,VlrDuplicata,VlrGeral: String;

begin

  if TotalDinheiro > 0 Then begin

    TotalDinheiro := 0;

  end;

  if TotalCheque > 0 Then begin

    TotalCheque := 0;

  end;

  if TotalChequePre > 0 Then begin

    TotalChequePre := 0;

  end;

  if TotalDuplicata > 0 Then begin

    TotalDuplicata := 0;

  end;

  if TotalGeral > 0 Then begin

    TotalGeral := 0;

  end;

  if VlrDinheiro > '0' Then begin

    VlrDinheiro := '0';

  end;

  if VlrCheque > '0' Then begin

    VlrCheque := '0';

  end;

  if VlrChequePre > '0' Then begin

    VlrChequePre := '0';

  end;

  if VlrDuplicata > '0' Then begin

    VlrDuplicata := '0';

  end;

  if VlrGeral > '0' Then begin

    VlrGeral := '0';

  end;

  with dmModule do begin

      IDDinheiro            :=  1;
      IDCheque              :=  2;
      IDChequePre           :=  3;
      IDVisaCredito         :=  4;
      IDVisaDebito          :=  5;
      IDVisaParcelado       :=  6;
      IDMastercardCredito   :=  7;
      IDMastercardDebito    :=  8;
      IDMastercardParcelado :=  9;
      IDPendente            := 12;
      IDDuplicata           := 13;
////////////////////////////////////////////////////////////////////////////////


    if cboVendedor.ItemIndex <>-1 Then begin

      IDClassVendedor :=  TClasseCombo(cboVendedor.Items.Objects[cboVendedor.ItemIndex]);

      Commit(ibPedVenda);
      ibPedVenda.Close;
      ibPedVenda.SQL.Clear;
      ibPedVenda.SQL.Add('SELECT TBLPEDIDODEVENDA.*,CADPRODUTOS.NOME As Produto,'
      + 'TBLUSER.NOME As VendedorPed FROM TBLPEDIDODEVENDA '
      + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODEVENDA.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLPEDIDODEVENDA.IDVENDEDOR=TBLUSER.IDUSER '
      + 'WHERE (TBLPEDIDODEVENDA.DATA between :ParamDataInicial and :ParamDataFinal)and TBLPEDIDODEVENDA.IDVENDEDOR=''' + IntToStr(IDClassVendedor.ID) + '''');
      ibPedVenda.Open;

      ibPedVenda.Close;
      ibPedVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibPedVenda.ParamByName('ParamDataFinal').Value := dtpDataF.DateTime;
      ibPedVenda.Open;

      (ibPedVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedVenda.FieldByName('VLRPROD') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibPedVenda.FieldByName('QTDEPROD').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }
      (ibPedVenda.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedVenda.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      while not ibPedVenda.Eof do begin

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDDinheiro Then begin

          if TotalDinheiro = 0 Then begin

            TotalDinheiro := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrDinheiro := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalDinheiro := TotalDinheiro + StrToFloat(StringReplace(VlrDinheiro,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDCheque Then begin

          if TotalCheque = 0 Then begin

            TotalCheque := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrCheque := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalCheque := TotalCheque + StrToFloat(StringReplace(VlrCheque,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDChequePre Then begin

          if TotalChequePre = 0 Then begin

            TotalChequePre := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrChequePre := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalChequePre := TotalChequePre + StrToFloat(StringReplace(VlrChequePre,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////
         
        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDDuplicata Then begin

          if TotalDuplicata = 0 Then begin

            TotalDuplicata := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrDuplicata := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalDuplicata := TotalDuplicata + StrToFloat(StringReplace(VlrDuplicata,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

         if ibPedVenda.FieldByName('VLRTOTAL').AsInteger > 0 Then begin

           if TotalGeral = 0 Then begin

             TotalGeral := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrGeral := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalGeral := TotalGeral + StrToFloat(StringReplace(VlrGeral,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if
////////////////////////////////////////////////////////////////////////////////

      ibPedVenda.Next;

      end;//while

      lbl_edtTotalDinh.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDinheiro);
      lbl_edtCheque.Text       := FormatFloat(CasasDecimais('Produtos'),TotalCheque);
      lbl_edtChequePre.Text    := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);
      lbl_edtDuplicata.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDuplicata);
      lbl_edtTotalGeral.Text   := FormatFloat(CasasDecimais('Produtos'),TotalGeral);

    end else begin

      Commit(ibPedVenda);
      ibPedVenda.Close;
      ibPedVenda.SQL.Clear;
      ibPedVenda.SQL.Add('SELECT TBLPEDIDODEVENDA.*,CADPRODUTOS.NOME As Produto,'
      + 'TBLUSER.NOME As VendedorPed FROM TBLPEDIDODEVENDA '
      + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODEVENDA.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLPEDIDODEVENDA.IDVENDEDOR=TBLUSER.IDUSER '
      + 'WHERE (TBLPEDIDODEVENDA.DATA between :ParamDataInicial and :ParamDataFinal)');
      ibPedVenda.Open;

      ibPedVenda.Close;
      ibPedVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibPedVenda.ParamByName('ParamDataFinal').Value := dtpDataF.DateTime;
      ibPedVenda.Open;

      (ibPedVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedVenda.FieldByName('VLRPROD') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibPedVenda.FieldByName('QTDEPROD').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }
      (ibPedVenda.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedVenda.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      while not ibPedVenda.Eof do begin

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDDinheiro Then begin

          if TotalDinheiro = 0 Then begin

            TotalDinheiro := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrDinheiro := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalDinheiro := TotalDinheiro + StrToFloat(StringReplace(VlrDinheiro,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDCheque Then begin

          if TotalCheque = 0 Then begin

            TotalCheque := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrCheque := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalCheque := TotalCheque + StrToFloat(StringReplace(VlrCheque,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDChequePre Then begin

          if TotalChequePre = 0 Then begin

            TotalChequePre := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrChequePre := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalChequePre := TotalChequePre + StrToFloat(StringReplace(VlrChequePre,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDDuplicata Then begin

          if TotalDuplicata = 0 Then begin

            TotalDuplicata := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrDuplicata := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalDuplicata := TotalDuplicata + StrToFloat(StringReplace(VlrDuplicata,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////
         if ibPedVenda.FieldByName('VLRTOTAL').AsInteger > 0 Then begin

           if TotalGeral = 0 Then begin

             TotalGeral := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrGeral := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalGeral := TotalGeral + StrToFloat(StringReplace(VlrGeral,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if
////////////////////////////////////////////////////////////////////////////////

      ibPedVenda.Next;

      end;//while

      lbl_edtTotalDinh.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDinheiro);
      lbl_edtCheque.Text       := FormatFloat(CasasDecimais('Produtos'),TotalCheque);
      lbl_edtChequePre.Text    := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);
      lbl_edtDuplicata.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDuplicata);
      lbl_edtTotalGeral.Text   := FormatFloat(CasasDecimais('Produtos'),TotalGeral);

    end;//if cbo vendedor

  end;//with

end;

procedure TfrmFluxoPedVenda.FormShow(Sender: TObject);
begin

      lbl_edtTotalDinh.Text    := '0,00';
      lbl_edtCheque.Text       := '0,00';
      lbl_edtChequePre.Text    := '0,00';
      lbl_edtDuplicata.Text    := '0,00';
      lbl_edtTotalGeral.Text   := '0,00';
      lbl_edtComissao.Text     := '';
      lbl_edtTotalAPagar.Text  := '';

      dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
      dtpDataF.DateTime   := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin

    ExecSELECTVendedor;

    with dbgFluxoPed do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

         DataSource := dtsPedVenda;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);
        Columns.Insert(5);
        Columns.Insert(6);
        Columns.Insert(7);

        //Parametros da Coluna que exibe o C�digo da entrada no estoque
        Columns.Items[0].Title.Caption := 'N� Pedido';
        Columns.Items[0].FieldName     := 'IDNUMPEDIDO';
        Columns.Items[0].Width         := 80;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Descri��o do Produto';
        Columns.Items[1].FieldName     := 'Produto';
        Columns.Items[1].Width         := 280;
        Columns.Items[1].Alignment     := taLeftJustify;


        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[2].Title.Caption := 'Vlr.Unit�rio';
        Columns.Items[2].FieldName     := 'VLRPROD';
        Columns.Items[2].Width         := 80;
        Columns.Items[2].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[3].Title.Caption := 'Qtde.';
        Columns.Items[3].FieldName     := 'QTDEPROD';
        Columns.Items[3].Width         := 80;
        Columns.Items[3].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Valor(A)';
        Columns.Items[4].FieldName     := 'VLRTOTAL';
        Columns.Items[4].Width         := 80;
        Columns.Items[4].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[5].Title.Caption := 'Data';
        Columns.Items[5].FieldName     := 'DATA';
        Columns.Items[5].Width         := 80;
        Columns.Items[5].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[6].Title.Caption := 'Comiss�o';
        Columns.Items[6].FieldName     := 'SITUACAOCOMISSAO';
        Columns.Items[6].Width         := 80;
        Columns.Items[6].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[7].Title.Caption := 'Data do Pagto.';
        Columns.Items[7].FieldName     := 'DATAPAGTOCOMISSAO';
        Columns.Items[7].Width         := 100;
        Columns.Items[7].Alignment     := taLeftJustify;


        MontaColunas := False;

      end;{if}

    end;{with}

////////////////////////////////////////////////////////////////////////////////

  end;//with

end;

procedure TfrmFluxoPedVenda.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmFluxoPedVenda.ibeaLimparClick(Sender: TObject);
begin

  lbl_edtTotalDinh.Text    := '0,00';
  lbl_edtCheque.Text       := '0,00';
  lbl_edtChequePre.Text    := '0,00';
  lbl_edtDuplicata.Text    := '0,00';
  lbl_edtTotalGeral.Text   := '0,00';
  lbl_edtComissao.Text     := '';
  lbl_edtTotalAPagar.Text  := '';
  cboVendedor.ClearSelection;
  
end;

procedure TfrmFluxoPedVenda.cboVendedorChange(Sender: TObject);

var
IDClassVendedor : TClasseCombo;
IDDinheiro, IDCheque, IDChequePre,IDPendente : Integer;
IDVisaCredito, IDVisaDebito, IDVisaParcelado, IDMastercardCredito, IDMastercardDebito : Integer;
IDMastercardParcelado,IDDuplicata: Integer;
TotalDinheiro,TotalCheque,TotalChequePre,TotalDuplicata,TotalGeral : Real;
VlrDinheiro,VlrCheque,VlrChequePre,VlrDuplicata,VlrGeral: String;

begin

  if TotalDinheiro > 0 Then begin

    TotalDinheiro := 0;

  end;

  if TotalCheque > 0 Then begin

    TotalCheque := 0;

  end;

  if TotalChequePre > 0 Then begin

    TotalChequePre := 0;

  end;

  if TotalDuplicata > 0 Then begin

    TotalDuplicata := 0;

  end;

  if TotalGeral > 0 Then begin

    TotalGeral := 0;

  end;

  if VlrDinheiro > '0' Then begin

    VlrDinheiro := '0';

  end;

  if VlrCheque > '0' Then begin

    VlrCheque := '0';

  end;

  if VlrChequePre > '0' Then begin

    VlrChequePre := '0';

  end;

  if VlrDuplicata > '0' Then begin

    VlrDuplicata := '0';

  end;

  if VlrGeral > '0' Then begin

    VlrGeral := '0';

  end;

  with dmModule do begin

      IDDinheiro            :=  1;
      IDCheque              :=  2;
      IDChequePre           :=  3;
      IDVisaCredito         :=  4;
      IDVisaDebito          :=  5;
      IDVisaParcelado       :=  6;
      IDMastercardCredito   :=  7;
      IDMastercardDebito    :=  8;
      IDMastercardParcelado :=  9;
      IDPendente            := 12;
      IDDuplicata           := 13;
////////////////////////////////////////////////////////////////////////////////


    if cboVendedor.ItemIndex <>-1 Then begin

      IDClassVendedor :=  TClasseCombo(cboVendedor.Items.Objects[cboVendedor.ItemIndex]);

      Commit(ibPedVenda);
      ibPedVenda.Close;
      ibPedVenda.SQL.Clear;
      ibPedVenda.SQL.Add('SELECT TBLPEDIDODEVENDA.*,CADPRODUTOS.NOME As Produto,'
      + 'TBLUSER.NOME As VendedorPed FROM TBLPEDIDODEVENDA '
      + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODEVENDA.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLPEDIDODEVENDA.IDVENDEDOR=TBLUSER.IDUSER '
      + 'WHERE (TBLPEDIDODEVENDA.DATA between :ParamDataInicial and :ParamDataFinal)and TBLPEDIDODEVENDA.IDVENDEDOR=''' + IntToStr(IDClassVendedor.ID) + '''');
      ibPedVenda.Open;

      ibPedVenda.Close;
      ibPedVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibPedVenda.ParamByName('ParamDataFinal').Value := dtpDataF.DateTime;
      ibPedVenda.Open;

      (ibPedVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedVenda.FieldByName('VLRPROD') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibPedVenda.FieldByName('QTDEPROD').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }
      (ibPedVenda.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibPedVenda.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

      while not ibPedVenda.Eof do begin

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDDinheiro Then begin

          if TotalDinheiro = 0 Then begin

            TotalDinheiro := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrDinheiro := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalDinheiro := TotalDinheiro + StrToFloat(StringReplace(VlrDinheiro,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDCheque Then begin

          if TotalCheque = 0 Then begin

            TotalCheque := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrCheque := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalCheque := TotalCheque + StrToFloat(StringReplace(VlrCheque,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDChequePre Then begin

          if TotalChequePre = 0 Then begin

            TotalChequePre := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrChequePre := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalChequePre := TotalChequePre + StrToFloat(StringReplace(VlrChequePre,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////
         
        if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDDuplicata Then begin

          if TotalDuplicata = 0 Then begin

            TotalDuplicata := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            VlrDuplicata := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            TotalDuplicata := TotalDuplicata + StrToFloat(StringReplace(VlrDuplicata,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if

         end;//if tipopagto dinheiro

////////////////////////////////////////////////////////////////////////////////

         if ibPedVenda.FieldByName('VLRTOTAL').AsInteger > 0 Then begin

           if TotalGeral = 0 Then begin

             TotalGeral := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrGeral := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalGeral := TotalGeral + StrToFloat(StringReplace(VlrGeral,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if
////////////////////////////////////////////////////////////////////////////////

      ibPedVenda.Next;

      end;//while

      lbl_edtTotalDinh.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDinheiro);
      lbl_edtCheque.Text       := FormatFloat(CasasDecimais('Produtos'),TotalCheque);
      lbl_edtChequePre.Text    := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);
      lbl_edtDuplicata.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDuplicata);
      lbl_edtTotalGeral.Text   := FormatFloat(CasasDecimais('Produtos'),TotalGeral);

    end;//if cbo vendedor

  end;//with


end;

procedure TfrmFluxoPedVenda.ibeaConfirmarClick(Sender: TObject);

var
ConfirmaComissao : Integer;
ClassVendedor : TClasseCombo;
Comissao : String;
begin

  with dmModule do begin

    ConfirmaComissao := Application.MessageBox('Confirma o lan�amento','Lan�ar Comiss�o',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

      if ConfirmaComissao = 6 Then begin

        if cboVendedor.ItemIndex <>-1 Then begin

          ClassVendedor :=  TClasseCombo(cboVendedor.Items.Objects[cboVendedor.ItemIndex]);

          Comissao := 'Pago';

          ibPedVenda.Close;                                              
          ibPedVenda.SQL.Clear;
          ibPedVenda.SQL.Add('UPDATE TBLPEDIDODEVENDA SET '
          + 'DATAPAGTOCOMISSAO = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''','
          + 'SITUACAOCOMISSAO = ''' + Comissao + ''' WHERE IDVENDEDOR=''' + IntToStr(ClassVendedor.ID) + '''and (TBLPEDIDODEVENDA.DATA between :ParamDataInicial and :ParamDataFinal)');
          ibPedVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
          ibPedVenda.ParamByName('ParamDataFinal').Value   := dtpDataF.DateTime;
          ibPedVenda.ExecSQL;

          lbl_edtComissao.Text := '';
          lbl_edtTotalAPagar.Text := '';

        end;//if cbovendedor

      end;//if confirma comissao

  end;//with

end;

procedure TfrmFluxoPedVenda.lbl_edtComissaoExit(Sender: TObject);


   var
    Valor1 :Real;
    Valor2 :Real;
    Valor3 :Real;
    Valor4 :Real;
begin

if lbl_edtTotalGeral.Text <> '' Then begin

  if lbl_edtComissao.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtComissao.Text)>0) and (lbl_edtComissao.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtComissao.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtTotalGeral.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor3 := Valor2 * Valor1;

      Valor4 := Valor3 /100;

      lbl_edtTotalAPagar.Text := FormatFloat(',0.00',(Valor4));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtComissao.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtTotalGeral.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor3 := Valor2 * Valor1;

      Valor4 := Valor3 /100;

      lbl_edtTotalAPagar.Text := FormatFloat(',0.00',(Valor4));

    end;{if}

  end;{if}

end;//label custo


end;

procedure TfrmFluxoPedVenda.lbl_edtComissaoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtTotalAPagar.SetFocus;

  end;

end;

procedure TfrmFluxoPedVenda.ibeaEstornarClick(Sender: TObject);

var
ConfirmaEstorno : Integer;
ClassVendedor : TClasseCombo;
Comissao : String;
begin

  with dmModule do begin

    ConfirmaEstorno := Application.MessageBox('Confirma o estorno do lan�amento','Estorno de lan�amento',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

      if ConfirmaEstorno = 6 Then begin

        if cboVendedor.ItemIndex <>-1 Then begin

          ClassVendedor :=  TClasseCombo(cboVendedor.Items.Objects[cboVendedor.ItemIndex]);

          Comissao := '';

          ibPedVenda.Close;                                              
          ibPedVenda.SQL.Clear;
          ibPedVenda.SQL.Add('UPDATE TBLPEDIDODEVENDA SET '
          + 'DATAPAGTOCOMISSAO = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''','
          + 'SITUACAOCOMISSAO = ''' + Comissao + ''' WHERE IDVENDEDOR=''' + IntToStr(ClassVendedor.ID) + '''and (TBLPEDIDODEVENDA.DATA between :ParamDataInicial and :ParamDataFinal)');
          ibPedVenda.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
          ibPedVenda.ParamByName('ParamDataFinal').Value   := dtpDataF.DateTime;
          ibPedVenda.ExecSQL;

          lbl_edtComissao.Text := '';
          lbl_edtTotalAPagar.Text := '';

        end;//if cbovendedor

      end;//if confirma comissao

  end;//with

end;

procedure TfrmFluxoPedVenda.ibeaReciboClick(Sender: TObject);
begin

  with dmModule do begin


    Application.CreateForm(TfrmRelRecibo, frmRelRecibo);

    TRY

      with frmRelRecibo do begin


    // qrl_DatadeEmissao.Caption := FormatDateTime('dd/mm/yyyy',Now);

     // qrlNomeCliente.Caption := cboVendedor.Text;
    //  qrlNomeCliente.Caption := cboVendedor.Text;
      qrl_DataIni.Caption := DateToStr(dtpDataIni.Date);
      qrl_DataF.Caption  := DateToStr(dtpDataF.Date);
      qrlDataRecibo.Caption := FormatDateTime('dd/mm/yyyy',Now);
      qrlValor.Caption := lbl_edtTotalAPagar.Text;

     { if cboVendedor.Text <> '' Then begin
      qrl_NomeVendedor.Caption := cboVendedor.Text;
      end else begin
      qrl_NomeVendedor.Caption := '';
      end;  }
      
      ibDadosEmpresa.Close;
      ibDadosEmpresa.SQL.Clear;
      ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
      ibDadosEmpresa.Open;

     // qrlEmpresa.Caption := ibDadosEmpresa.FieldByName('NOME').AsString;
     { qrlEndereco.Caption := ibDadosEmpresa.FieldByName('ENDERECO').AsString;
      qrlNum.Caption := ibDadosEmpresa.FieldByName('NUMERO').AsString;
      qrlBairro.Caption := ibDadosEmpresa.FieldByName('BAIRRO').AsString;
      qrlEstado.Caption := ibDadosEmpresa.FieldByName('ESTADO').AsString;
      qrlDDDEmpresa.Caption := ibDadosEmpresa.FieldByName('DDD').AsString;
      qrlTelefoneEmpresa.Caption := ibDadosEmpresa.FieldByName('TELEFONE').AsString;  }


      qrpRelatRecibo.Preview;

      end; {if}


    EXCEPT
      on E : Exception do begin
        frmRelRecibo.Release; //frmRelPedOrcamento.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formul�rio: ' + E.Message,mtError,[mbOk],0);
      end;
    END;

////////////////////////////////////////////////////////////////////////////////

  end;{with}

end;

end.
