unit untPedCompraPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BmsXPButton, ComCtrls, mxFlatControls, StdCtrls, IBQuery;

type
  TfrmPedCompraP = class(TForm)
    ibeaSair: TBmsXPButton;
    ibeaVisualizar: TBmsXPButton;
    dtpDataIni: TmxFlatDateTimePicker;
    dtpDataF: TmxFlatDateTimePicker;
    lbl_DtIni: TLabel;
    lbl_DtF: TLabel;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ibeaVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedCompraP: TfrmPedCompraP;

implementation

uses untdmModule, untRPedCompraGeral, funcPosto, DB;

{$R *.dfm}

procedure TfrmPedCompraP.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPedCompraP.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmPedCompraP.ibeaVisualizarClick(Sender: TObject);
begin

  with dmModule do begin

      Commit(ibTempPedCompra);
      ibTempPedCompra.Close;
      ibTempPedCompra.SQL.Clear;
      ibTempPedCompra.SQL.Add('SELECT TBLPEDIDODECOMPRA.*,'
      + 'CADPRODUTOS.NOME As Produto,CADPRODUTOS.NOMEUNIDVENDA,CADPRODUTOS.REF,TBLCADASTRO.NOME As Fornecedor FROM TBLPEDIDODECOMPRA '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLPEDIDODECOMPRA.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLPEDIDODECOMPRA.IDFORNECEDOR=TBLCADASTRO.IDCAD '
      + 'LEFT OUTER JOIN TBLCADASTRO ON TBLPEDIDODECOMPRA.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE (TBLPEDIDODECOMPRA.DATA between :ParamDataIni and :ParamDataF) ORDER BY TBLPEDIDODECOMPRA.IDDETALHEPCOMPRA ASC');
      ibTempPedCompra.Open;

      ibTempPedCompra.Close;
      ibTempPedCompra.ParamByName('ParamDataIni').Value := dtpDataIni.DateTime;
      ibTempPedCompra.ParamByName('ParamDataF').Value := dtpDataF.DateTime;
      ibTempPedCompra.Open;
      
      Application.CreateForm(TfrmRPedCompraGeral, frmRPedCompraGeral);

      TRY

        with frmRPedCompraGeral do begin

          frmRPedCompraGeral.qrpPedCompra.dataset := ibTempPedCompra;

          qrdbProduto.DataSet            := ibTempPedCompra;
          qrdbProduto.DataField          := ibTempPedCompra.FieldByName('Produto').FieldName;

          qrdbUnit.DataSet            := ibTempPedCompra;
          qrdbUnit.DataField          := ibTempPedCompra.FieldByName('VALOR').FieldName;
          (ibTempPedCompra.FieldByName('VALOR') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbQtde.DataSet               := ibTempPedCompra;
          qrdbQtde.DataField             := ibTempPedCompra.FieldByName('QTDE').FieldName;
          FormatFloat('0',ibTempPedCompra.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }

          qrdbTotal.DataSet           := ibTempPedCompra;
          qrdbTotal.DataField         := ibTempPedCompra.FieldByName('VLRTOTAL').FieldName;
          (ibTempPedCompra.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbRef.DataSet           := ibTempPedCompra;
          qrdbRef.DataField         := ibTempPedCompra.FieldByName('REF').FieldName;

          qrdbDesc.DataSet           := ibTempPedCompra;
          qrdbDesc.DataField         := ibTempPedCompra.FieldByName('DESCONTO').FieldName;
          (ibTempPedCompra.FieldByName('DESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbAcresc.DataSet           := ibTempPedCompra;
          qrdbAcresc.DataField         := ibTempPedCompra.FieldByName('ACRESCIMO').FieldName;
          (ibTempPedCompra.FieldByName('ACRESCIMO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
          
          qrdbNPedido.DataSet           := ibTempPedCompra;
          qrdbNPedido.DataField         := ibTempPedCompra.FieldByName('IDDETALHEPCOMPRA').FieldName;

          qrl_DataIni.Caption := DateToStr(dtpDataIni.Date);
          qrl_DataF.Caption  := DateToStr(dtpDataF.Date);


          qrpPedCompra.Preview;

        end; {if}

      EXCEPT
        on E : Exception do begin
          frmRPedCompraGeral.Release; //frmRelPedOrcamento.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////
    end;//if visualizar pedido

  end;//with

procedure TfrmPedCompraP.FormShow(Sender: TObject);
begin

  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataF.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));


end;

end.
