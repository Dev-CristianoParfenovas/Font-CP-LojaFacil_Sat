unit untCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGIF, ExtCtrls, StdCtrls;

type
  TfrmCaixa = class(TForm)
    imgFundo: TImage;
    ListBoxDadosEmpresa: TListBox;
    lbl_Cupom: TLabel;
    lbl_NumCupom: TLabel;
    listboxCupom: TListBox;
    Shape1: TShape;
    lbl_edtSubTotal: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl_CodBarras: TLabel;
    lbl_Traco: TLabel;
    lbl_NomeProd: TLabel;
    lbl_Valor: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaixa: TfrmCaixa;

implementation

uses untdmModule, BuscaClientes, uBuscaProdutos;

{$R *.dfm}

procedure TfrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  with dmModule do begin

    case key of

      VK_f1:begin

      frmBuscaClientes.ShowModal;

      end;


    {  VK_f3:begin

      if lbl_edtSubTotal.Text <> '0,00' Then begin

      IDVenda := IDVendasServs;
      frmRecebeLoja.ShowModal;

      end;

    end; }

     {  VK_f2:Begin

       if lbl_edtCodBarras.Enabled = True Then begin

       lbl_edtQtde.SetFocus;

       end;  }

     //  end;{begin}


   {   VK_f4:begin

      if lbl_edtCodBarras.Enabled = True Then begin

      ConfirmaMSG := Application.MessageBox('É preciso finalizar a venda para gerar um novo cupom','Notificação:Cupom em aberto',+MB_OK+MB_DEFBUTTON1+MB_ICONWARNING);

     end else begin
   //   if ConfirmaMSG = 6 Then begin

        listboxCupom.Clear; }



  //      CancelarProduto := False;

    //   lbl_edtSubTotal.Text := '0,00';
    //   lbl_edtVlrUnit.Text  := '0,00';
   //    lbl_edtVlrTotal.Text := '0,00';


   {    if lbl_TipoPreco.Caption = '' Then begin

        TipoPreco := 'A';

        end;

        if lbl_Sangria.Caption <> '' Then begin

          lbl_Sangria.Caption := '';

        end;

        DesabilitaCampos(True);

        InsereVenda := True;

       // if CancelarProduto = False Then begin


      //   while not ibServsVendasCli.Eof do begin

          ibServsVendasCli.Close;
          ibServsVendasCli.SQL.Clear;
          ibServsVendasCli.SQL.Add('SELECT IDSERVSVENDA FROM TBLSERVICOSVENDASCLI ORDER BY IDSERVSVENDA DESC');
          ibServsVendasCli.Open;

          lbl_CodVenda.Caption := IntToStr(ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger + 1);

          lbl_NumCupom.Caption := IntToStr(ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger + 1); }


        //  IDVendasServs := (ibServsVendasCli.FieldByName('IDSERVSVENDA').AsInteger + 1);

      //   end;


     //  end;

       //  cboProduto.ClearSelection;
          {lbl_edtCodBarras.Clear;
          lbl_edtCodProd.Clear;
          cboTipoProd.ClearSelection;
          lbl_edtQtde.Text := '0,00';
          lbl_edtVlrUnit.Text := '0,00';
          lbl_edtVlrTotal.Text := '0,00';
          cboTipoCompromisso.ClearSelection;  }

       //   LimpaCampos;

     // lbl_edtQtde.Text := '1';
     //  lbl_edtCodBarras.SetFocus;
  //    end;//if label cod barras

    //  end;{begin}

      { VK_f5:Begin

       lbl_edtConvenio.Text := 'Convenio';

       end;}{begin}

   {    VK_f6:Begin

       lbl_Sangria.Caption := 'Sangria';
       lbl_edtVlrSangria.SetFocus;  }
       
      // end;{begin}



       VK_f7:begin

        frmBuscaProdutos.ShowModal;

       end;{begin}


    //  VK_f8 :begin

     {  ibProdutos.Close;
       ibProdutos.SQL.Clear;
       ibProdutos.SQl.Add('SELECT * FROM CADPRODUTOS WHERE IDPROD=''' + lbl_edtCodProd.Text + '''');
       ibProdutos.Open;

     //  (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat  := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibProdutos.FieldByName('VALORVENDAB') as TFloatField).DisplayFormat  := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     //  (ibProdutos.FieldByName('VALORVENDAC') as TFloatField).DisplayFormat  := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Combustiveis'),ibProdutos.FieldByName('VALORVENDAB').AsFloat); }

      // lbl_edtQtde.SetFocus;

   {   if lbl_edtCodBarras.Enabled = True Then begin

       lbl_TipoPreco.Caption := 'Preço de Venda B';

      end;

       if lbl_TipoPreco.Caption = 'Preço de Venda B' Then begin

       TipoPreco := 'B';

       end else begin

       TipoPreco := 'A';

       end;

      lbl_edtCodBarras.SetFocus;
      lbl_edtQtde.Text := '1'; }


    //  end;{begin}


   //   VK_f9 :begin

    {   ibProdutos.Close;
       ibProdutos.SQL.Clear;
       ibProdutos.SQl.Add('SELECT * FROM CADPRODUTOS WHERE IDPROD=''' + lbl_edtCodProd.Text + '''');
       ibProdutos.Open;

       (ibProdutos.FieldByName('VALORVENDAC') as TFloatField).DisplayFormat  := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

       lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Combustiveis'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);  }

    //  lbl_edtQtde.SetFocus;

   {   if lbl_edtCodBarras.Enabled = True Then begin

       lbl_TipoPreco.Caption := 'Preço de Venda C';

      end;


       if lbl_TipoPreco.Caption = 'Preço de Venda C' Then begin

       TipoPreco := 'C';

       end else begin

       TipoPreco := 'A';

       end;

      lbl_edtCodBarras.SetFocus;
      lbl_edtQtde.Text := '1';  }

   //    end;{begin}


   //    VK_f10:begin

   //     lbl_edtDescVenda.SetFocus;

   //     end;{begin}

    end;{begin}

  end;{with}


end;

end.
