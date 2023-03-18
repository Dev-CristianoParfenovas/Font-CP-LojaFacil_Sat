unit untVendasCupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IBQuery, Buttons;

type
  TfrmVendasCupom = class(TForm)
    lbl_edtNCupom: TLabeledEdit;
    ibeaVisualizar: TSpeedButton;
    ibeaSair: TSpeedButton;
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
  frmVendasCupom: TfrmVendasCupom;

implementation

uses funcPosto, DB, untdmModule, untRelatVendaCupom;

{$R *.dfm}

procedure TfrmVendasCupom.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmVendasCupom.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmVendasCupom.ibeaVisualizarClick(Sender: TObject);
begin

  with dmModule do begin

    if lbl_edtNCupom.Text <> '' Then begin

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.POSVENDA,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.PENDENTEPAGO,'
      + 'TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.NOMEVENDA,'
      + 'CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE TBLSERVICOSVENDAS.IDSERVSVENDA=''' + lbl_edtNCupom.Text + '''');
      ibServsVenda.Open;

      Application.CreateForm(TfrmRelatVendaCupom, frmRelatVendaCupom);

      TRY

        with frmRelatVendaCupom do begin

          frmRelatVendaCupom.qrpVendasCupom.DataSet := ibServsVenda;


          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbNCupom.DataSet    := ibServsVenda;
          qrdbNCupom.DataField  := ibServsVenda.FieldByName('IDSERVSVENDA').FieldName;

          qrdbProd.DataSet    := ibServsVenda;
          qrdbProd.DataField  := ibServsVenda.FieldByName('Produto').FieldName;

          qrdbVlrUnit.DataSet     := ibServsVenda;
          qrdbVlrUnit.DataField   := ibServsVenda.FieldByName('VLRUNIT').FieldName;
         (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbQtde.DataSet        := ibServsVenda;
          qrdbQtde.DataField      := ibServsVenda.FieldByName('QTDE').FieldName;
          (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbVlrTotal.DataSet       := ibServsVenda;
          qrdbVlrTotal.DataField     := ibServsVenda.FieldByName('VLRTOTAL').FieldName;
          (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet    := ibServsVenda;
          qrdbData.DataField  := ibServsVenda.FieldByName('DATA').FieldName;

          qrpVendasCupom.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelatVendaCupom.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

    end;//if label numero cupom <> ''
    
  end;//with

end;

procedure TfrmVendasCupom.FormShow(Sender: TObject);
begin

  lbl_edtNCupom.Clear;
  
end;

end.
