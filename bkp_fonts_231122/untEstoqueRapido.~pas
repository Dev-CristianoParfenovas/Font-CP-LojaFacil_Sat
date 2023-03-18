unit untEstoqueRapido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BmsXPButton, Grids, DBGrids, ExtCtrls;

type
  TfrmEstoqueRapido = class(TForm)
    ibeaSair: TBmsXPButton;
    dbgEstoque: TDBGrid;
    lbl_edtCodBarras: TLabeledEdit;
    lbl_edtQtde: TLabeledEdit;
    procedure ibeaSairClick(Sender: TObject);
    procedure lbl_edtCodBarrasChange(Sender: TObject);
    procedure lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstoqueRapido: TfrmEstoqueRapido;
  MontaColunas : Boolean;
  
implementation

uses untdmModule, DB, funcPosto;

{$R *.dfm}

procedure TfrmEstoqueRapido.ibeaSairClick(Sender: TObject);
begin
Close
end;

procedure TfrmEstoqueRapido.lbl_edtCodBarrasChange(Sender: TObject);

var

QtdeEstoque,VlrProduto,ValorCustoE,QtdeVenda,QtdeVendaProd,ValorCustoProd  : Real;
VlrProdutoProd : Real;
TotalCustoProd : String;
EstoqueFinal,TotalProdEstoque,TotalCusto,EstoqueFinalProd,TotalProdEstoqueProd : String;
IDProdQtdeEstoque, IDLocalEstoque : Integer;

begin

  with dmModule do begin

    if lbl_edtCodBarras.Text <> '' Then begin

      ibEntrProdEstoque.Close;
      ibEntrProdEstoque.SQL.Clear;
      ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,TBLENTRADAESTOQUEPROD.IDLOCAL,'
      + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
      + 'CADPRODUTOS.IDLOCAL As Estoque,CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS FROM TBLENTRADAESTOQUEPROD '
      + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarras.Text + '''');
      ibEntrProdEstoque.Open;


      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CODBARRAS=''' + lbl_edtCodBarras.Text + '''');
      ibProdutos.Open;

      IDProdQtdeEstoque := ibProdutos.FieldByName('IDPROD').AsInteger;
      IDLocalEstoque    := ibProdutos.FieldByName('IDLOCAL').AsInteger;



   // end;  //ROTINA ABAIXO PARA SOMAR TOTAL DO ESTQUE E QUANTIDADE DO ESTOQUE

      //traz na variavel a qtde conf. prod da select identificado por id.
      QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),ThousandSeparator,'',[rfReplaceAll]));
     // QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),DecimalSeparator,',',[rfReplaceAll]));

      QtdeVenda   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

      QtdeEstoque := QtdeEstoque + QtdeVenda;

      EstoqueFinal := StringReplace(FloattoStr(QtdeEstoque),ThousandSeparator,'',[rfReplaceAll]);
      EstoqueFinal := StringReplace(EstoqueFinal,DecimalSeparator,'.',[rfReplaceAll]);

      //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
      VlrProduto  := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

      VlrProduto  := QtdeEstoque * VlrProduto;

      TotalProdEstoque := StringReplace(FloattoStr(VlrProduto),ThousandSeparator,'',[rfReplaceAll]);
      TotalProdEstoque := StringReplace(TotalProdEstoque,DecimalSeparator,'.',[rfReplaceAll]);


      ValorCustoE := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

      ValorCustoE := QtdeEstoque * ValorCustoE;

      TotalCusto := StringReplace(FloattoStr(ValorCustoE),ThousandSeparator,'',[rfReplaceAll]);
      TotalCusto := StringReplace(TotalCusto,DecimalSeparator,'.',[rfReplaceAll]);


       //se houver registro ele atribui na alteracao o vlr da variavel

       if ibEntrProdEstoque.RecordCount > 0 Then begin

         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
         +'QUANTIDADE=''' + (EstoqueFinal) + ''','
         +'TOTALCUSTO=''' + TotalCusto + ''','
         +'VLRTOTAL=''' + (TotalProdEstoque) +  ''' WHERE IDPROD=''' + IntToStr(IDProdQtdeEstoque) + '''');
         ibEntrProdEstoque.ExecSQL;


         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
         + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
         + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS FROM TBLENTRADAESTOQUEPROD '
         + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
         + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarras.Text + '''');
         ibEntrProdEstoque.Open;

         (ibEntrProdEstoque.FieldByName('VLRTOTAL')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
         (ibEntrProdEstoque.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat := CasasDecimais('Produtos');



         lbl_edtQtde.SetFocus;

         if lbl_edtQtde.Text <> '' Then begin

         lbl_edtCodBarras.SetFocus;
         lbl_edtCodBarras.Clear;

         end;//if


       end else begin


         QtdeVendaProd   := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));

         EstoqueFinalProd := StringReplace(FloattoStr(QtdeVendaProd),ThousandSeparator,'',[rfReplaceAll]);
         EstoqueFinalProd := StringReplace(EstoqueFinalProd,DecimalSeparator,'.',[rfReplaceAll]);

         //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
         VlrProdutoProd  := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORVENDAA').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

         VlrProdutoProd  := QtdeVendaProd * VlrProdutoProd;

         TotalProdEstoqueProd := StringReplace(FloattoStr(VlrProdutoProd),ThousandSeparator,'',[rfReplaceAll]);
         TotalProdEstoqueProd := StringReplace(TotalProdEstoqueProd,DecimalSeparator,'.',[rfReplaceAll]);

         ValorCustoProd := StrtoFloat(StringReplace(FloattoStr(ibProdutos.FieldByName('VALORCUSTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

         ValorCustoProd := QtdeVendaProd * ValorCustoProd;

         TotalCustoProd := StringReplace(FloattoStr(ValorCustoProd),ThousandSeparator,'',[rfReplaceAll]);
         TotalCustoProd := StringReplace(TotalCustoProd,DecimalSeparator,'.',[rfReplaceAll]);

         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('INSERT INTO TBLENTRADAESTOQUEPROD'
         + '(IDPROD,QUANTIDADE,TOTALCUSTO,VLRTOTAL,CODBARRAS,IDLOCAL) values '
         + '(''' + IntToStr(IDProdQtdeEstoque) + ''','
         + ' ''' + EstoqueFinalProd + ''','
         + ' ''' + TotalCustoProd + ''','
         + ' ''' + TotalProdEstoqueProd + ''','
         + ' ''' + lbl_edtCodBarras.Text + ''','
         + ' ''' + IntToStr(IDLocalEstoque) + ''')');
         ibEntrProdEstoque.ExecSQL;


         ibEntrProdEstoque.Close;
         ibEntrProdEstoque.SQL.Clear;
         ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
         + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,TBLENTRADAESTOQUEPROD.ESTOQUEMIN,'
         + 'CADPRODUTOS.NOME As NomeProd,CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD,CADPRODUTOS.CODBARRAS FROM TBLENTRADAESTOQUEPROD '
         + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
         + 'WHERE CADPRODUTOS.CODBARRAS=''' + lbl_edtCodBarras.Text + '''');
         ibEntrProdEstoque.Open;

         (ibEntrProdEstoque.FieldByName('VLRTOTAL')as TFloatField).DisplayFormat := CasasDecimais('Produtos');
         (ibEntrProdEstoque.FieldByName('VALORVENDAA')as TFloatField).DisplayFormat := CasasDecimais('Produtos');

           lbl_edtCodBarras.SetFocus;
         //  lbl_edtCodBarras.Clear;


         {lbl_edtQtde.SetFocus;

         if lbl_edtQtde.Text > '0' Then begin

           lbl_edtCodBarras.SetFocus;
           lbl_edtCodBarras.Clear;

         end;}

       end;

    end;//if label codbarras

  end;//with

end;

procedure TfrmEstoqueRapido.lbl_edtQtdeKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtCodBarras.SetFocus;

  end;

end;

procedure TfrmEstoqueRapido.FormShow(Sender: TObject);
begin

  lbl_edtQtde.Clear;
  lbl_edtQtde.SetFocus;

  with dmModule do begin

////////////////////////////////////////////////////////////////////////////////

   with dbgEstoque do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

      DataSource := dmModule.dtsEntrProdEstoque;
      
        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'NomeProd';
        Columns.Items[0].Width         := 230;
        Columns.Items[0].Alignment     := taLeftJustify;

       //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Vlr.Venda';
        Columns.Items[1].FieldName     := 'VALORVENDAA';
        Columns.Items[1].Width         := 100;
        Columns.Items[1].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[2].Title.Caption := 'Qtde.Estoque';
        Columns.Items[2].FieldName     := 'QUANTIDADE';
        Columns.Items[2].Width         := 110;
        Columns.Items[2].Alignment     := taLeftJustify;


        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[3].Title.Caption := 'Total';
        Columns.Items[3].FieldName     := 'VLRTOTAL';
        Columns.Items[3].Width         := 100;
        Columns.Items[3].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Estoque Mínimo';
        Columns.Items[4].FieldName     := 'ESTOQUEMIN';
        Columns.Items[4].Width         := 120;
        Columns.Items[4].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with}
////////////////////////////////////////////////////////////////////////////////

  end;//with

end;

procedure TfrmEstoqueRapido.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmEstoqueRapido.lbl_edtCodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 Then begin

lbl_edtCodBarras.Clear;

end;//if

end;

end.
