unit untPedidoFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, classComboBox,
  IBQuery;

type
  TfrmPedidoFunc = class(TForm)
    lbl_DtIni: TLabel;
    lbl_DtF: TLabel;
    lbl_Vendedor: TLabel;
    lbl_Cliente: TLabel;
    dtpDataIni: TDateTimePicker;
    dtpDataF: TDateTimePicker;
    cboVendedor: TComboBox;
    cboCliente: TComboBox;
    ckPedido: TCheckBox;
    ckOrcamento: TCheckBox;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTVendedor;
    procedure ExecSELECTCliente;
    procedure FormShow(Sender: TObject);
    procedure ibeaVisualizarClick(Sender: TObject);
    procedure ibeaLimparClick(Sender: TObject);
    procedure ibeaDetalhadoClick(Sender: TObject);
    procedure ckPedidoCheck(Sender: TObject);
    procedure ckOrcamentoCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoFunc: TfrmPedidoFunc;

implementation

uses untdmModule, untRelPedido, funcPosto, DB, untPedDetalhado;

{$R *.dfm}

procedure TfrmPedidoFunc.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPedidoFunc.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmPedidoFunc.ExecSELECTVendedor;

var
IDFuncionario      : TClasseCombo;
begin

  with dmModule do begin

    ibUser.Close;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE TIPOUSUARIO=''Vendedor''');
    ibUser.Open;

    cboVendedor.Clear;

    while not ibUser.Eof do begin

      IDFuncionario      := TClasseCombo.Create;
      IDFuncionario.ID   := ibUser.FieldByName('IDUSER').AsInteger;
      cboVendedor.Items.AddObject(ibUser.FieldByName('NOME').AsString,IDFuncionario);
      ibUser.Next;

    end;//WHILE

  end;//with

end;

procedure TfrmPedidoFunc.ExecSELECTCliente;

var
IDClassCliente : Integer;
IDSelectCliente : TClasseCombo;

begin

  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClassCliente := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.


    //SELECT PARA TRAZER OS DADOS PRO RELATORIO
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE TBLCADASTRO.IDCLASS=''' + IntToStr(IDClassCliente) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboCliente.Clear;

    while not ibCadastro.Eof do begin

    IDSelectCliente := TClasseCombo.Create;
    IDSelectCliente.ID := ibCadastro.FieldByName('IDCAD').AsInteger;
    cboCliente.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,IDSelectCliente);
    ibCadastro.Next;

    end;{while}


  end;//with

end;

procedure TfrmPedidoFunc.FormShow(Sender: TObject);
begin

  cboVendedor.ClearSelection;
  dtpDataIni.DateTime     := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataF.DateTime       := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  ckPedido.Checked := True;
  
  with dmModule do begin

    ExecSELECTVendedor;
    ExecSELECTCliente;
    
  end;//with

end;

procedure TfrmPedidoFunc.ibeaVisualizarClick(Sender: TObject);

var

IDClassVendedor,IDClassCliente : TClasseCombo;

begin

  with dmModule do begin

    if cboVendedor.ItemIndex <>-1 Then begin

      IDClassVendedor :=  TClasseCombo(cboVendedor.Items.Objects[cboVendedor.ItemIndex]);

      Commit(ibPedVenda);
      ibPedVenda.Close;
      ibPedVenda.SQL.Clear;
      ibPedVenda.SQL.Add('SELECT TBLPEDIDODEVENDA.*,'
      + 'CADPRODUTOS.NOME As Produto,TBLCADASTRO.NOME As Cliente,'
      + 'TBLUSER.NOME As VendedorPed FROM TBLPEDIDODEVENDA '
      + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODEVENDA.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLPEDIDODEVENDA.IDVENDEDOR=TBLUSER.IDUSER '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLPEDIDODEVENDA.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'WHERE (TBLPEDIDODEVENDA.DATA between :ParamDataInicial and :ParamDataFinal)and TBLPEDIDODEVENDA.IDVENDEDOR=''' + IntToStr(IDClassVendedor.ID) + '''ORDER BY TBLPEDIDODEVENDA.IDNUMPEDIDO ASC');
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



      Application.CreateForm(TfrmRelPedido, frmRelPedido);

      TRY

        with frmRelPedido do begin

        frmRelPedido.qrpPedido.dataset := ibPedVenda;

        qrdbNumPed.DataSet          := ibPedVenda;
        qrdbNumPed.DataField        := ibPedVenda.FieldByName('IDNUMPEDIDO').FieldName;

        qrdbProduto.DataSet            := ibPedVenda;
        qrdbProduto.DataField          := ibPedVenda.FieldByName('Produto').FieldName;

        qrdbUnit.DataSet            := ibPedVenda;
        qrdbUnit.DataField          := ibPedVenda.FieldByName('VLRPROD').FieldName;


        qrdbQtde.DataSet               := ibPedVenda;
        qrdbQtde.DataField             := ibPedVenda.FieldByName('QTDEPROD').FieldName;

        qrdbTotal.DataSet           := ibPedVenda;
        qrdbTotal.DataField         := ibPedVenda.FieldByName('VLRTOTAL').FieldName;

        qrdbDesc.DataSet           := ibPedVenda;
        qrdbDesc.DataField         := ibPedVenda.FieldByName('DESCONTO').FieldName;

        qrdbAcresc.DataSet           := ibPedVenda;
        qrdbAcresc.DataField         := ibPedVenda.FieldByName('ACRESCIMO').FieldName;

        qrdbVendedor.DataSet           := ibPedVenda;
        qrdbVendedor.DataField         := ibPedVenda.FieldByName('VendedorPed').FieldName;

        qrdbCliente.DataSet           := ibPedVenda;
        qrdbCliente.DataField         := ibPedVenda.FieldByName('Cliente').FieldName;

        qrl_DataIni.Caption := DateToStr(dtpDataIni.Date);
        qrl_DataF.Caption  := DateToStr(dtpDataF.Date);

        if ckPedido.Checked Then begin

          qrl_Titulo.Caption := 'Pedido';

        end;

        if ckOrcamento.Checked Then begin

          qrl_Titulo.Caption := 'Orçamento';

        end;

        qrpPedido.Preview;


        end; {if}


      EXCEPT
        on E : Exception do begin
          frmRelPedido.Release; //frmRelPedOrcamento.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

    end;//cbovendedor<> ''
////////////////////////////////////////////////////////////////////////////////
    

    if (cboVendedor.Text = '')and(cboCliente.Text = '')Then begin

      Commit(ibPedVenda);
      ibPedVenda.Close;
      ibPedVenda.SQL.Clear;
      ibPedVenda.SQL.Add('SELECT TBLPEDIDODEVENDA.*,'
      + 'CADPRODUTOS.NOME As Produto,TBLCADASTRO.NOME As Cliente,'
      + 'TBLUSER.NOME As VendedorPed FROM TBLPEDIDODEVENDA '
      + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODEVENDA.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLPEDIDODEVENDA.IDVENDEDOR=TBLUSER.IDUSER '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLPEDIDODEVENDA.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'WHERE (TBLPEDIDODEVENDA.DATA between :ParamDataInicial and :ParamDataFinal)ORDER BY TBLPEDIDODEVENDA.IDNUMPEDIDO ASC');
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



      Application.CreateForm(TfrmRelPedido, frmRelPedido);

      TRY

        with frmRelPedido do begin

        frmRelPedido.qrpPedido.dataset := ibPedVenda;

        qrdbNumPed.DataSet          := ibPedVenda;
        qrdbNumPed.DataField        := ibPedVenda.FieldByName('IDNUMPEDIDO').FieldName;

        qrdbProduto.DataSet            := ibPedVenda;
        qrdbProduto.DataField          := ibPedVenda.FieldByName('Produto').FieldName;

        qrdbUnit.DataSet            := ibPedVenda;
        qrdbUnit.DataField          := ibPedVenda.FieldByName('VLRPROD').FieldName;


        qrdbQtde.DataSet               := ibPedVenda;
        qrdbQtde.DataField             := ibPedVenda.FieldByName('QTDEPROD').FieldName;

        qrdbTotal.DataSet           := ibPedVenda;
        qrdbTotal.DataField         := ibPedVenda.FieldByName('VLRTOTAL').FieldName;

        qrdbDesc.DataSet           := ibPedVenda;
        qrdbDesc.DataField         := ibPedVenda.FieldByName('DESCONTO').FieldName;

        qrdbAcresc.DataSet           := ibPedVenda;
        qrdbAcresc.DataField         := ibPedVenda.FieldByName('ACRESCIMO').FieldName;

        qrdbVendedor.DataSet           := ibPedVenda;
        qrdbVendedor.DataField         := ibPedVenda.FieldByName('VendedorPed').FieldName;

        qrdbCliente.DataSet           := ibPedVenda;
        qrdbCliente.DataField         := ibPedVenda.FieldByName('Cliente').FieldName;

        qrl_DataIni.Caption := DateToStr(dtpDataIni.Date);
        qrl_DataF.Caption  := DateToStr(dtpDataF.Date);

        if ckPedido.Checked Then begin

          qrl_Titulo.Caption := 'Pedido';

        end;

        if ckOrcamento.Checked Then begin

          qrl_Titulo.Caption := 'Orçamento';

        end;

        qrpPedido.Preview;


        end; {if}


      EXCEPT
        on E : Exception do begin
          frmRelPedido.Release; //frmRelPedOrcamento.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

    end;// if cbocliente e vendedor em branco

////////////////////////////////////////////////////////////////////////////////

    if (cboCliente.ItemIndex <>-1)and(cboVendedor.Text = '') Then begin

      IDClassCliente :=  TClasseCombo(cboCliente.Items.Objects[cboCliente.ItemIndex]);

      Commit(ibPedVenda);
      ibPedVenda.Close;
      ibPedVenda.SQL.Clear;
      ibPedVenda.SQL.Add('SELECT TBLPEDIDODEVENDA.*,'
      + 'CADPRODUTOS.NOME As Produto,TBLCADASTRO.NOME As Cliente,'
      + 'TBLUSER.NOME As VendedorPed FROM TBLPEDIDODEVENDA '
      + 'INNER JOIN CADPRODUTOS ON TBLPEDIDODEVENDA.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLUSER ON TBLPEDIDODEVENDA.IDVENDEDOR=TBLUSER.IDUSER '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLPEDIDODEVENDA.IDCLIENTE=TBLCADASTRO.IDCAD '
      + 'WHERE (TBLPEDIDODEVENDA.DATA between :ParamDataInicial and :ParamDataFinal)and TBLPEDIDODEVENDA.IDCLIENTE=''' + IntToStr(IDClassCliente.ID) + '''ORDER BY TBLPEDIDODEVENDA.IDNUMPEDIDO ASC');
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



      Application.CreateForm(TfrmRelPedido, frmRelPedido);

      TRY

        with frmRelPedido do begin

        frmRelPedido.qrpPedido.dataset := ibPedVenda;

        qrdbNumPed.DataSet          := ibPedVenda;
        qrdbNumPed.DataField        := ibPedVenda.FieldByName('IDNUMPEDIDO').FieldName;

        qrdbProduto.DataSet            := ibPedVenda;
        qrdbProduto.DataField          := ibPedVenda.FieldByName('Produto').FieldName;

        qrdbUnit.DataSet            := ibPedVenda;
        qrdbUnit.DataField          := ibPedVenda.FieldByName('VLRPROD').FieldName;


        qrdbQtde.DataSet               := ibPedVenda;
        qrdbQtde.DataField             := ibPedVenda.FieldByName('QTDEPROD').FieldName;

        qrdbTotal.DataSet           := ibPedVenda;
        qrdbTotal.DataField         := ibPedVenda.FieldByName('VLRTOTAL').FieldName;

        qrdbDesc.DataSet           := ibPedVenda;
        qrdbDesc.DataField         := ibPedVenda.FieldByName('DESCONTO').FieldName;

        qrdbAcresc.DataSet           := ibPedVenda;
        qrdbAcresc.DataField         := ibPedVenda.FieldByName('ACRESCIMO').FieldName;

        qrdbVendedor.DataSet           := ibPedVenda;
        qrdbVendedor.DataField         := ibPedVenda.FieldByName('VendedorPed').FieldName;

        qrdbCliente.DataSet           := ibPedVenda;
        qrdbCliente.DataField         := ibPedVenda.FieldByName('Cliente').FieldName;

        qrl_DataIni.Caption := DateToStr(dtpDataIni.Date);
        qrl_DataF.Caption  := DateToStr(dtpDataF.Date);

        if ckPedido.Checked Then begin

          qrl_Titulo.Caption := 'Pedido';

        end;

        if ckOrcamento.Checked Then begin

          qrl_Titulo.Caption := 'Orçamento';

        end;

        qrpPedido.Preview;


        end; {if}


      EXCEPT
        on E : Exception do begin
          frmRelPedido.Release; //frmRelPedOrcamento.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

    end;//if cbocliente
////////////////////////////////////////////////////////////////////////////////

  end;{with}

end;

procedure TfrmPedidoFunc.ibeaLimparClick(Sender: TObject);
begin
  cboVendedor.ClearSelection;
  cboCliente.ClearSelection;
  ckPedido.Checked := True;
end;

procedure TfrmPedidoFunc.ibeaDetalhadoClick(Sender: TObject);

var
IDClassVendedor : TClasseCombo;
IDDinheiro, IDCheque, IDChequePre,IDPendente : Integer;
IDVisaCredito, IDVisaDebito, IDVisaParcelado, IDMastercardCredito, IDMastercardDebito : Integer;
IDMastercardParcelado,IDDuplicata: Integer;
TotalDinheiro,TotalCheque,TotalChequePre,TotalDuplicata,TotalGeral : Real;
VlrDinheiro,VlrCheque,VlrChequePre,VlrDuplicata,VlrGeral: String;
TotalPendentePed : Real;
VlrPendentePed : String;

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

  if TotalPendentePed > 0 Then begin

    TotalPendentePed := 0;

  end;

  if VlrDinheiro > '0' Then begin

    VlrDinheiro := '0';

  end;

  if VlrPendentePed > '0' Then begin

    VlrPendentePed := '0';

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

         if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDPendente Then begin

           if TotalPendentePed = 0 Then begin

             TotalPendentePed := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrPendentePed := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalPendentePed := TotalPendentePed + StrToFloat(StringReplace(VlrPendentePed,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if
////////////////////////////////////////////////////////////////////////////////


      ibPedVenda.Next;

      end;//while

//      lbl_edtTotalDinh.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDinheiro);
//     lbl_edtCheque.Text       := FormatFloat(CasasDecimais('Produtos'),TotalCheque);
 //     lbl_edtChequePre.Text    := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);
//      lbl_edtDuplicata.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDuplicata);
 //     lbl_edtTotalGeral.Text   := FormatFloat(CasasDecimais('Produtos'),TotalGeral);

      Application.CreateForm(TfrmRelPedDetalhado, frmRelPedDetalhado);

      TRY

        with frmRelPedDetalhado do begin

        frmRelPedDetalhado.qrpPedidoDetalhado.dataset := ibPedVenda;

        qrl_TotalDinheiro.Caption       := FormatFloat(CasasDecimais('Produtos'),TotalDinheiro);
        qrl_TotalCheque.Caption         := FormatFloat(CasasDecimais('Produtos'),TotalCheque);
        qrl_TotalChequePre.Caption      := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);
        qrl_TotalDuplicata.Caption      := FormatFloat(CasasDecimais('Produtos'),TotalDuplicata);
        qrl_TotalGeral.Caption          := FormatFloat(CasasDecimais('Produtos'),TotalGeral);
       // qrl_TotalPendente.Caption       := FormatFloat(CasasDecimais('Produtos'),TotalPendentePed);
        qrl_DataIni.Caption := DateToStr(frmPedidoFunc.dtpDataIni.Date);
        qrl_DataF.Caption   := DateToStr(frmPedidoFunc.dtpDataF.Date);

        if cboVendedor.Text <> '' Then begin

          qrl_NomeVendedor.Caption := cboVendedor.Text;

        end else begin

          qrl_NomeVendedor.Caption := 'Geral';

        end;

        qrpPedidoDetalhado.Preview;


        end; {if}


      EXCEPT
        on E : Exception do begin
          frmRelPedDetalhado.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;


////////////////////////////////////////////////////////////////////////////////

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

         if ibPedVenda.FieldByName('IDTIPOPAGTO').AsInteger = IDPendente Then begin

           if TotalPendentePed = 0 Then begin

             TotalPendentePed := StrToFloat(StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end else begin

             VlrPendentePed := (StringReplace(FloatToStr(ibPedVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

             TotalPendentePed := TotalPendentePed + StrToFloat(StringReplace(VlrPendentePed,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;//if

         end;//if
////////////////////////////////////////////////////////////////////////////////

      ibPedVenda.Next;

      end;//while

     // lbl_edtTotalDinh.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDinheiro);
     // lbl_edtCheque.Text       := FormatFloat(CasasDecimais('Produtos'),TotalCheque);
    //  lbl_edtChequePre.Text    := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);
    //  lbl_edtDuplicata.Text    := FormatFloat(CasasDecimais('Produtos'),TotalDuplicata);
   //   lbl_edtTotalGeral.Text   := FormatFloat(CasasDecimais('Produtos'),TotalGeral);

      Application.CreateForm(TfrmRelPedDetalhado, frmRelPedDetalhado);

      TRY

        with frmRelPedDetalhado do begin

        frmRelPedDetalhado.qrpPedidoDetalhado.dataset := ibPedVenda;

        qrl_TotalDinheiro.Caption       := FormatFloat(CasasDecimais('Produtos'),TotalDinheiro);
        qrl_TotalCheque.Caption         := FormatFloat(CasasDecimais('Produtos'),TotalCheque);
        qrl_TotalChequePre.Caption      := FormatFloat(CasasDecimais('Produtos'),TotalChequePre);
        qrl_TotalDuplicata.Caption      := FormatFloat(CasasDecimais('Produtos'),TotalDuplicata);
        qrl_TotalGeral.Caption          := FormatFloat(CasasDecimais('Produtos'),TotalGeral);
        //qrl_TotalPendente.Caption       := FormatFloat(CasasDecimais('Produtos'),TotalPendentePed);

        qrl_DataIni.Caption := DateToStr(frmPedidoFunc.dtpDataIni.Date);
        qrl_DataF.Caption   := DateToStr(frmPedidoFunc.dtpDataF.Date);

        if cboVendedor.Text <> '' Then begin

          qrl_NomeVendedor.Caption := cboVendedor.Text;

        end else begin

          qrl_NomeVendedor.Caption := 'Geral';

        end;

        qrpPedidoDetalhado.Preview;


        end; {if}


      EXCEPT
        on E : Exception do begin
          frmRelPedDetalhado.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;



    end;//if cbo vendedor

  end;//with


end;

procedure TfrmPedidoFunc.ckPedidoCheck(Sender: TObject);
begin

  if ckPedido.Checked Then begin

    ckOrcamento.Checked := False;

  end;//if

end;

procedure TfrmPedidoFunc.ckOrcamentoCheck(Sender: TObject);
begin

  if ckOrcamento.Checked Then begin

    ckPedido.Checked := False;

  end;//if

end;

end.
