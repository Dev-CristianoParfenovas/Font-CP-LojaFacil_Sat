unit untEtiquetasLoja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBQuery;

type
  TfrmEtiquetasLoja = class(TForm)
    grbEtiquetasLoja: TGroupBox;
    ckEtiqueta1: TCheckBox;
    ckEtiqueta2: TCheckBox;
    ckEtiqueta3: TCheckBox;
    ckEtiqueta4: TCheckBox;
    ckEtiqueta5: TCheckBox;
    ckEtiqueta6: TCheckBox;
    ckEtiqueta7: TCheckBox;
    ckEtiqueta8: TCheckBox;
    ckEtiqueta9: TCheckBox;
    ckEtiqueta10: TCheckBox;
    ckEtiqueta11: TCheckBox;
    ckEtiqueta12: TCheckBox;
    ckEtiqueta13: TCheckBox;
    ckEtiqueta14: TCheckBox;
    ckEtiqueta15: TCheckBox;
    ckEtiqueta16: TCheckBox;
    ckEtiqueta17: TCheckBox;
    ckEtiqueta18: TCheckBox;
    ckEtiqueta19: TCheckBox;
    ckEtiqueta20: TCheckBox;
    ckEtiqueta21: TCheckBox;
    ckEtiqueta22: TCheckBox;
    ckEtiqueta23: TCheckBox;
    ckEtiqueta24: TCheckBox;
    ckEtiqueta25: TCheckBox;
    ckMarcarTodos: TCheckBox;
    ckMarcar1a10: TCheckBox;
    ckMarcar11a25: TCheckBox;
    procedure Commit(IBQueryExec : TIBQuery);
    Procedure CriaCodigo(Cod : String; Imagem : TCanvas);
    procedure MarcarTodos;
    Procedure Marcar1a10;
    procedure Marcar11a25;
    procedure Limparbotoes;
    procedure FormShow(Sender: TObject);
    procedure ibSairClick(Sender: TObject);
    procedure BmsXPButton1Click(Sender: TObject);
    procedure ckMarcarTodosClick(Sender: TObject);
    procedure ckMarcar1a10Click(Sender: TObject);
    procedure ckMarcar11a25Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEtiquetasLoja: TfrmEtiquetasLoja;

implementation

uses untdmModule, untProdutos_MPrima, untRelCodBarrasAD, DB, funcPosto;

{$R *.dfm}

procedure TfrmEtiquetasLoja.Commit(IBQueryExec : TIBQuery);

begin

  with dmModule do begin

    with IBQueryExec do begin

      SQL.Clear;
      SQL.Add('Commit');
      Open;
      Close;

    end;//with ibqueryexec

  end;//with

end;

Procedure TfrmEtiquetasLoja.CriaCodigo(Cod : String; Imagem : TCanvas);

Const
  digitos : array['0'..'9'] of string[5]= ('00110',
  '10001',
  '01001',
  '11000',
  '00101',
  '10100',
  '01100',
  '00011',
  '10010',
  '01010');
Var
  Numero : String;
  Cod1 : Array[1..1000] Of Char;
  Cod2 : Array[1..1000] Of Char;
  Codigo : Array[1..1000] Of Char;
  Digito : String;
  c1,c2 : Integer;
  x,y,z,h : LongInt;
  a,b,c,d : TPoint;
  I : Boolean;
Begin
  Numero := Cod;
  For x := 1 to 1000 Do
  Begin
    Cod1 [x] := #0;
    Cod2 [x] := #0;
    Codigo[x] := #0;
  End;
  c1 := 1;
  c2 := 1;
  x := 1;
  For y := 1 to Length(Numero) div 2 do
  Begin
    Digito := Digitos[Numero[x ]];
    For z := 1 to 5 do
    Begin
      Cod1[c1] := Digito[z];
      Inc(c1);
    End;
    Digito := Digitos[Numero[x+1]];
    For z := 1 to 5 do
    Begin
      Cod2[c2] := Digito[z]; 
      Inc(c2);
    End;
    Inc(x,2);
  End;
  y := 5;
  Codigo[1] := '0'; 
  Codigo[2] := '0';
  Codigo[3] := '0'; 
  Codigo[4] := '0'; { Inicio do Codigo }
  For x := 1 to c1-1 do
  begin
    Codigo[y] := Cod1[x]; Inc(y);
    Codigo[y] := Cod2[x]; Inc(y);
  end;
  Codigo[y] := '1'; Inc(y); { Final do Codigo }
  Codigo[y] := '0'; Inc(y);
  Codigo[y] := '0';
  Imagem.Pen .Width := 1;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen .Color := ClWhite;
  a.x := 1; a.y := 0;
  b.x := 1; b.y := 79;
  c.x := 2000; c.y := 79;
  d.x := 2000; d.y := 0;
  Imagem.Polygon([a,b,c,d]);
  Imagem.Brush.Color := ClBlack;
  Imagem.Pen .Color := ClBlack;
  x := 0;
  i := True;
  for y:=1 to 1000 do
  begin
    If Codigo[y] <> #0 Then
    Begin
      If Codigo[y] = '0' then
        h := 1
      Else
        h := 3;
      a.x := x; a.y := 0;
      b.x := x; b.y := 79;
      c.x := x+h-1; c.y := 79;
      d.x := x+h-1; d.y := 0;
      If i Then
        Imagem.Polygon([a,b,c,d]);
      i := Not(i);
      x := x + h;
    End;
  end;
end;


procedure TfrmEtiquetasLoja.MarcarTodos;

begin

  if ckMarcarTodos.Checked Then begin

    ckEtiqueta1.Checked  := True;
    ckEtiqueta2.Checked  := True;
    ckEtiqueta3.Checked  := True;
    ckEtiqueta4.Checked  := True;
    ckEtiqueta5.Checked  := True;
    ckEtiqueta6.Checked  := True;
    ckEtiqueta7.Checked  := True;
    ckEtiqueta8.Checked  := True;
    ckEtiqueta9.Checked  := True;
    ckEtiqueta10.Checked := True;
    ckEtiqueta11.Checked := True;
    ckEtiqueta12.Checked := True;
    ckEtiqueta13.Checked := True;
    ckEtiqueta14.Checked := True;
    ckEtiqueta15.Checked := True;
    ckEtiqueta16.Checked := True;
    ckEtiqueta17.Checked := True;
    ckEtiqueta18.Checked := True;
    ckEtiqueta19.Checked := True;
    ckEtiqueta20.Checked := True;
    ckEtiqueta21.Checked := True;
    ckEtiqueta22.Checked := True;
    ckEtiqueta23.Checked := True;
    ckEtiqueta24.Checked := True;
    ckEtiqueta25.Checked := True;

  end else begin

    ckEtiqueta1.Checked  := False;
    ckEtiqueta2.Checked  := False;
    ckEtiqueta3.Checked  := False;
    ckEtiqueta4.Checked  := False;
    ckEtiqueta5.Checked  := False;
    ckEtiqueta6.Checked  := False;
    ckEtiqueta7.Checked  := False;
    ckEtiqueta8.Checked  := False;
    ckEtiqueta9.Checked  := False;
    ckEtiqueta10.Checked := False;
    ckEtiqueta11.Checked := False;
    ckEtiqueta12.Checked := False;
    ckEtiqueta13.Checked := False;
    ckEtiqueta14.Checked := False;
    ckEtiqueta15.Checked := False;
    ckEtiqueta16.Checked := False;
    ckEtiqueta17.Checked := False;
    ckEtiqueta18.Checked := False;
    ckEtiqueta19.Checked := False;
    ckEtiqueta20.Checked := False;
    ckEtiqueta21.Checked := False;
    ckEtiqueta22.Checked := False;
    ckEtiqueta23.Checked := False;
    ckEtiqueta24.Checked := False;
    ckEtiqueta25.Checked := False;

  end;//if

end;

procedure TfrmEtiquetasLoja.Marcar1a10;

begin

  if ckMarcar1a10.Checked Then begin

    ckEtiqueta1.Checked  := True;
    ckEtiqueta2.Checked  := True;
    ckEtiqueta3.Checked  := True;
    ckEtiqueta4.Checked  := True;
    ckEtiqueta5.Checked  := True;
    ckEtiqueta6.Checked  := True;
    ckEtiqueta7.Checked  := True;
    ckEtiqueta8.Checked  := True;
    ckEtiqueta9.Checked  := True;
    ckEtiqueta10.Checked := True;

  end else begin

    ckEtiqueta1.Checked  := False;
    ckEtiqueta2.Checked  := False;
    ckEtiqueta3.Checked  := False;
    ckEtiqueta4.Checked  := False;
    ckEtiqueta5.Checked  := False;
    ckEtiqueta6.Checked  := False;
    ckEtiqueta7.Checked  := False;
    ckEtiqueta8.Checked  := False;
    ckEtiqueta9.Checked  := False;
    ckEtiqueta10.Checked := False;

  end;//if

end;

procedure TfrmEtiquetasLoja.Marcar11a25;

begin

  if ckMarcar11a25.Checked Then begin

    ckEtiqueta11.Checked := True;
    ckEtiqueta12.Checked := True;
    ckEtiqueta13.Checked := True;
    ckEtiqueta14.Checked := True;
    ckEtiqueta15.Checked := True;
    ckEtiqueta16.Checked := True;
    ckEtiqueta17.Checked := True;
    ckEtiqueta18.Checked := True;
    ckEtiqueta19.Checked := True;
    ckEtiqueta20.Checked := True;
    ckEtiqueta21.Checked := True;
    ckEtiqueta22.Checked := True;
    ckEtiqueta23.Checked := True;
    ckEtiqueta24.Checked := True;
    ckEtiqueta25.Checked := True;

  end else begin

    ckEtiqueta11.Checked := False;
    ckEtiqueta12.Checked := False;
    ckEtiqueta13.Checked := False;
    ckEtiqueta14.Checked := False;
    ckEtiqueta15.Checked := False;
    ckEtiqueta16.Checked := False;
    ckEtiqueta17.Checked := False;
    ckEtiqueta18.Checked := False;
    ckEtiqueta19.Checked := False;
    ckEtiqueta20.Checked := False;
    ckEtiqueta21.Checked := False;
    ckEtiqueta22.Checked := False;
    ckEtiqueta23.Checked := False;
    ckEtiqueta24.Checked := False;
    ckEtiqueta25.Checked := False;

  end;//if

end;

procedure TfrmEtiquetasLoja.Limparbotoes;

begin

    ckEtiqueta1.Checked   := False;
    ckEtiqueta2.Checked   := False;
    ckEtiqueta3.Checked   := False;
    ckEtiqueta4.Checked   := False;
    ckEtiqueta5.Checked   := False;
    ckEtiqueta6.Checked   := False;
    ckEtiqueta7.Checked   := False;
    ckEtiqueta8.Checked   := False;
    ckEtiqueta9.Checked   := False;
    ckEtiqueta10.Checked  := False;
    ckEtiqueta11.Checked  := False;
    ckEtiqueta12.Checked  := False;
    ckEtiqueta13.Checked  := False;
    ckEtiqueta14.Checked  := False;
    ckEtiqueta15.Checked  := False;
    ckEtiqueta16.Checked  := False;
    ckEtiqueta17.Checked  := False;
    ckEtiqueta18.Checked  := False;
    ckEtiqueta19.Checked  := False;
    ckEtiqueta20.Checked  := False;
    ckEtiqueta21.Checked  := False;
    ckEtiqueta22.Checked  := False;
    ckEtiqueta23.Checked  := False;
    ckEtiqueta24.Checked  := False;
    ckEtiqueta25.Checked  := False;
    ckMarcarTodos.Checked := False;
    ckMarcar1a10.Checked  := False;
    ckMarcar11a25.Checked := False;

end;

procedure TfrmEtiquetasLoja.FormShow(Sender: TObject);
begin
Limparbotoes;
end;

procedure TfrmEtiquetasLoja.ibSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmEtiquetasLoja.BmsXPButton1Click(Sender: TObject);

var

CodBarras, NomeProd, ValorProd : String;

begin
  with dmModule do begin

  if frmProd_MPrima.Showing Then begin

    if frmProd_MPrima.lbl_edtNomeProduto.Text = '' Then begin

      Application.MessageBox('Por Favor selecione um Produto','Notificação:Produto não Selecionado', + MB_OK+MB_ICONQUESTION);

    end else begin


      Commit(ibTempProdutos);
      ibTempProdutos.Close;
      ibTempProdutos.SQL.Clear;
      ibTempProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE IDPROD=''' + frmProd_MPrima.lbl_edtCodigo.Text + '''');
      ibTempProdutos.Open;

    //  (ibTempProdutos.FieldByName('VALORCUSTO') as TFloatField).DisplayFormat         := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat        := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
   //   (ibTempProdutos.FieldByName('VLRPROM') as TFloatField).DisplayFormat            := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


      Application.CreateForm(TfrmRelCodBarrasAD,frmRelCodBarrasAD);

      TRY

        with frmRelCodBarrasAD do begin

          frmRelCodBarrasAD.qrpCodBarrasAD.DataSet := ibTempProdutos;

          if ibTempProdutos.FieldByName('CODBARRASAD').AsString <> '' Then begin


           CodBarras := ibTempProdutos.FieldByName('CODBARRASAD').AsString;
           NomeProd  := (ibTempProdutos.FieldByName('NOME').AsString);
           ValorProd := FormatFloat(CasasDecimais('Produtos'),ibTempProdutos.FieldByName('VALORVENDAA').AsFloat);

////////////////////////////////////////////////////////////////////////////////

           ibDadosEmpresa.Close;
           ibDadosEmpresa.SQL.Clear;
           ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
           ibDadosEmpresa.Open;



           qrl_Empr3.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr4.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr5.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr6.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr7.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr8.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr9.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr10.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr11.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr12.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr13.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr14.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr15.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr16.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr17.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr18.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr19.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr20.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr21.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr22.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr23.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr24.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;
           qrl_Empr25.Caption := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;


////////////////////////////////////////////////////////////////////////////////

         if ckEtiqueta1.Checked Then begin

           CriaCodigo(CodBarras,qriCod1.Canvas);
           qrl_Codigo1.Caption  := CodBarras;
           qrl_Cod1.Caption      := CodBarras;
           qrl_Nome1.Caption     := NomeProd;
           qrl_NomeProd1.Caption := NomeProd;
           qrl_Vlr1.Caption      := ValorProd;
           qrl_Empr1.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo1.Caption   := '';
           qrl_Cod1.Caption      := '';
           qrl_Nome1.Caption     := '';
           qrl_NomeProd1.Caption := '';
           qrl_Vlr1.Caption      := '';
           qrl_Empr1.Caption     := '';
           qrl_C1.Caption        := '';
           qrl_Frase1.Caption    := '';
           qrl_Preco1.Caption    := '';

         end;
          ////////////////////////////////////////////

         if ckEtiqueta2.Checked Then begin

           CriaCodigo(CodBarras,qriCod2.Canvas);
           qrl_Codigo2.Caption  := CodBarras;
           qrl_Cod2.Caption      := CodBarras;
           qrl_Nome2.Caption     := NomeProd;
           qrl_NomeProd2.Caption := NomeProd;
           qrl_Vlr2.Caption      := ValorProd;
           qrl_Empr2.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo2.Caption   := '';
           qrl_Cod2.Caption      := '';
           qrl_Nome2.Caption     := '';
           qrl_NomeProd2.Caption := '';
           qrl_Vlr2.Caption      := '';
           qrl_Empr2.Caption     := '';
           qrl_C2.Caption        := '';
           qrl_Frase2.Caption    := '';
           qrl_Preco2.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta3.Checked Then begin

           CriaCodigo(CodBarras,qriCod3.Canvas);
           qrl_Codigo3.Caption  := CodBarras;
           qrl_Cod3.Caption      := CodBarras;
           qrl_Nome3.Caption     := NomeProd;
           qrl_NomeProd3.Caption := NomeProd;
           qrl_Vlr3.Caption      := ValorProd;
           qrl_Empr3.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo3.Caption   := '';
           qrl_Cod3.Caption      := '';
           qrl_Nome3.Caption     := '';
           qrl_NomeProd3.Caption := '';
           qrl_Vlr3.Caption      := '';
           qrl_Empr3.Caption     := '';
           qrl_C3.Caption        := '';
           qrl_Frase3.Caption    := '';
           qrl_Preco3.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta4.Checked Then begin

           CriaCodigo(CodBarras,qriCod4.Canvas);
           qrl_Codigo4.Caption  := CodBarras;
           qrl_Cod4.Caption      := CodBarras;
           qrl_Nome4.Caption     := NomeProd;
           qrl_NomeProd4.Caption := NomeProd;
           qrl_Vlr4.Caption      := ValorProd;
           qrl_Empr4.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo4.Caption   := '';
           qrl_Cod4.Caption      := '';
           qrl_Nome4.Caption     := '';
           qrl_NomeProd4.Caption := '';
           qrl_Vlr4.Caption      := '';
           qrl_Empr4.Caption     := '';
           qrl_C4.Caption        := '';
           qrl_Frase4.Caption    := '';
           qrl_Preco4.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta5.Checked Then begin

           CriaCodigo(CodBarras,qriCod5.Canvas);
           qrl_Codigo5.Caption  := CodBarras;
           qrl_Cod5.Caption      := CodBarras;
           qrl_Nome5.Caption     := NomeProd;
           qrl_NomeProd5.Caption := NomeProd;
           qrl_Vlr5.Caption      := ValorProd;
           qrl_Empr5.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo5.Caption   := '';
           qrl_Cod5.Caption      := '';
           qrl_Nome5.Caption     := '';
           qrl_NomeProd5.Caption := '';
           qrl_Vlr5.Caption      := '';
           qrl_Empr5.Caption     := '';
           qrl_C5.Caption        := '';
           qrl_Frase5.Caption    := '';
           qrl_Preco5.Caption    := '';

         end;

           ///////////////////////////////////////////

         if ckEtiqueta6.Checked Then begin

           CriaCodigo(CodBarras,qriCod6.Canvas);
           qrl_Codigo6.Caption  := CodBarras;
           qrl_Cod6.Caption      := CodBarras;
           qrl_Nome6.Caption     := NomeProd;
           qrl_NomeProd6.Caption := NomeProd;
           qrl_Vlr6.Caption      := ValorProd;
           qrl_Empr6.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo6.Caption   := '';
           qrl_Cod6.Caption      := '';
           qrl_Nome6.Caption     := '';
           qrl_NomeProd6.Caption := '';
           qrl_Vlr6.Caption      := '';
           qrl_Empr6.Caption     := '';
           qrl_C6.Caption        := '';
           qrl_Frase6.Caption    := '';
           qrl_Preco6.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta7.Checked Then begin

           CriaCodigo(CodBarras,qriCod7.Canvas);
           qrl_Codigo7.Caption  := CodBarras;
           qrl_Cod7.Caption      := CodBarras;
           qrl_Nome7.Caption     := NomeProd;
           qrl_NomeProd7.Caption := NomeProd;
           qrl_Vlr7.Caption      := ValorProd;
           qrl_Empr7.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo7.Caption   := '';
           qrl_Cod7.Caption      := '';
           qrl_Nome7.Caption     := '';
           qrl_NomeProd7.Caption := '';
           qrl_Vlr7.Caption      := '';
           qrl_Empr7.Caption     := '';
           qrl_C7.Caption        := '';
           qrl_Frase7.Caption    := '';
           qrl_Preco7.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta8.Checked Then begin

           CriaCodigo(CodBarras,qriCod8.Canvas);
           qrl_Codigo8.Caption  := CodBarras;
           qrl_Cod8.Caption      := CodBarras;
           qrl_Nome8.Caption     := NomeProd;
           qrl_NomeProd8.Caption := NomeProd;
           qrl_Vlr8.Caption      := ValorProd;
           qrl_Empr8.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo8.Caption   := '';
           qrl_Cod8.Caption      := '';
           qrl_Nome8.Caption     := '';
           qrl_NomeProd8.Caption := '';
           qrl_Vlr8.Caption      := '';
           qrl_Empr8.Caption     := '';
           qrl_C8.Caption        := '';
           qrl_Frase8.Caption    := '';
           qrl_Preco8.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta9.Checked Then begin

           CriaCodigo(CodBarras,qriCod9.Canvas);
           qrl_Codigo9.Caption  := CodBarras;
           qrl_Cod9.Caption      := CodBarras;
           qrl_Nome9.Caption     := NomeProd;
           qrl_NomeProd9.Caption := NomeProd;
           qrl_Vlr9.Caption      := ValorProd;
           qrl_Empr9.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo9.Caption   := '';
           qrl_Cod9.Caption      := '';
           qrl_Nome9.Caption     := '';
           qrl_NomeProd9.Caption := '';
           qrl_Vlr9.Caption      := '';
           qrl_Empr9.Caption     := '';
           qrl_C9.Caption        := '';
           qrl_Frase9.Caption    := '';
           qrl_Preco9.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta10.Checked Then begin

           CriaCodigo(CodBarras,qriCod10.Canvas);
           qrl_Codigo10.Caption  := CodBarras;
           qrl_Cod10.Caption      := CodBarras;
           qrl_Nome10.Caption     := NomeProd;
           qrl_NomeProd10.Caption := NomeProd;
           qrl_Vlr10.Caption      := ValorProd;
           qrl_Empr10.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo10.Caption   := '';
           qrl_Cod10.Caption      := '';
           qrl_Nome10.Caption     := '';
           qrl_NomeProd10.Caption := '';
           qrl_Vlr10.Caption      := '';
           qrl_Empr10.Caption     := '';
           qrl_C10.Caption        := '';
           qrl_Frase10.Caption    := '';
           qrl_Preco10.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta11.Checked Then begin

           CriaCodigo(CodBarras,qriCod11.Canvas);
           qrl_Codigo11.Caption  := CodBarras;
           qrl_Cod11.Caption      := CodBarras;
           qrl_Nome11.Caption     := NomeProd;
           qrl_NomeProd11.Caption := NomeProd;
           qrl_Vlr11.Caption      := ValorProd;
           qrl_Empr11.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo11.Caption   := '';
           qrl_Cod11.Caption      := '';
           qrl_Nome11.Caption     := '';
           qrl_NomeProd11.Caption := '';
           qrl_Vlr11.Caption      := '';
           qrl_Empr11.Caption     := '';
           qrl_C11.Caption        := '';
           qrl_Frase11.Caption    := '';
           qrl_Preco11.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta12.Checked then begin

           CriaCodigo(CodBarras,qriCod12.Canvas);
           qrl_Codigo12.Caption  := CodBarras;
           qrl_Cod12.Caption      := CodBarras;
           qrl_Nome12.Caption     := NomeProd;
           qrl_NomeProd12.Caption := NomeProd;
           qrl_Vlr12.Caption      := ValorProd;
           qrl_Empr12.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo12.Caption   := '';
           qrl_Cod12.Caption      := '';
           qrl_Nome12.Caption     := '';
           qrl_NomeProd12.Caption := '';
           qrl_Vlr12.Caption      := '';
           qrl_Empr12.Caption     := '';
           qrl_C12.Caption        := '';
           qrl_Frase12.Caption    := '';
           qrl_Preco12.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta13.Checked Then begin

           CriaCodigo(CodBarras,qriCod13.Canvas);
           qrl_Codigo13.Caption  := CodBarras;
           qrl_Cod13.Caption      := CodBarras;
           qrl_Nome13.Caption     := NomeProd;
           qrl_NomeProd13.Caption := NomeProd;
           qrl_Vlr13.Caption      := ValorProd;
           qrl_Empr13.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo13.Caption   := '';
           qrl_Cod13.Caption      := '';
           qrl_Nome13.Caption     := '';
           qrl_NomeProd13.Caption := '';
           qrl_Vlr13.Caption      := '';
           qrl_Empr13.Caption     := '';
           qrl_C13.Caption        := '';
           qrl_Frase13.Caption    := '';
           qrl_Preco13.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta14.Checked Then begin

           CriaCodigo(CodBarras,qriCod14.Canvas);
           qrl_Codigo14.Caption  := CodBarras;
           qrl_Cod14.Caption      := CodBarras;
           qrl_Nome14.Caption     := NomeProd;
           qrl_NomeProd14.Caption := NomeProd;
           qrl_Vlr14.Caption      := ValorProd;
           qrl_Empr14.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo14.Caption   := '';
           qrl_Cod14.Caption      := '';
           qrl_Nome14.Caption     := '';
           qrl_NomeProd14.Caption := '';
           qrl_Vlr14.Caption      := '';
           qrl_Empr14.Caption     := '';
           qrl_C14.Caption        := '';
           qrl_Frase14.Caption    := '';
           qrl_Preco14.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta15.Checked Then begin

           CriaCodigo(CodBarras,qriCod15.Canvas);
           qrl_Codigo15.Caption  := CodBarras;
           qrl_Cod15.Caption      := CodBarras;
           qrl_Nome15.Caption     := NomeProd;
           qrl_NomeProd15.Caption := NomeProd;
           qrl_Vlr15.Caption      := ValorProd;
           qrl_Empr15.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo15.Caption   := '';
           qrl_Cod15.Caption      := '';
           qrl_Nome15.Caption     := '';
           qrl_NomeProd15.Caption := '';
           qrl_Vlr15.Caption      := '';
           qrl_Empr15.Caption     := '';
           qrl_C15.Caption        := '';
           qrl_Frase15.Caption    := '';
           qrl_Preco15.Caption    := '';

         end;

           ///////////////////////////////////////////

         if ckEtiqueta16.Checked Then begin

           CriaCodigo(CodBarras,qriCod16.Canvas);
           qrl_Codigo16.Caption  := CodBarras;
           qrl_Cod16.Caption      := CodBarras;
           qrl_Nome16.Caption     := NomeProd;
           qrl_NomeProd16.Caption := NomeProd;
           qrl_Vlr16.Caption      := ValorProd;
           qrl_Empr16.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo16.Caption   := '';
           qrl_Cod16.Caption      := '';
           qrl_Nome16.Caption     := '';
           qrl_NomeProd16.Caption := '';
           qrl_Vlr16.Caption      := '';
           qrl_Empr16.Caption     := '';
           qrl_C16.Caption        := '';
           qrl_Frase16.Caption    := '';
           qrl_Preco16.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta17.Checked Then begin

           CriaCodigo(CodBarras,qriCod17.Canvas);
           qrl_Codigo17.Caption  := CodBarras;
           qrl_Cod17.Caption      := CodBarras;
           qrl_Nome17.Caption     := NomeProd;
           qrl_NomeProd17.Caption := NomeProd;
           qrl_Vlr17.Caption      := ValorProd;
           qrl_Empr17.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo17.Caption   := '';
           qrl_Cod17.Caption      := '';
           qrl_Nome17.Caption     := '';
           qrl_NomeProd17.Caption := '';
           qrl_Vlr17.Caption      := '';
           qrl_Empr17.Caption     := '';
           qrl_C17.Caption        := '';
           qrl_Frase17.Caption    := '';
           qrl_Preco17.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta18.Checked Then begin

           CriaCodigo(CodBarras,qriCod18.Canvas);
           qrl_Codigo18.Caption  := CodBarras;
           qrl_Cod18.Caption      := CodBarras;
           qrl_Nome18.Caption     := NomeProd;
           qrl_NomeProd18.Caption := NomeProd;
           qrl_Vlr18.Caption      := ValorProd;
           qrl_Empr18.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo18.Caption   := '';
           qrl_Cod18.Caption      := '';
           qrl_Nome18.Caption     := '';
           qrl_NomeProd18.Caption := '';
           qrl_Vlr18.Caption      := '';
           qrl_Empr18.Caption     := '';
           qrl_C18.Caption        := '';
           qrl_Frase18.Caption    := '';
           qrl_Preco18.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta19.Checked Then begin

           CriaCodigo(CodBarras,qriCod19.Canvas);
           qrl_Codigo19.Caption  := CodBarras;
           qrl_Cod19.Caption      := CodBarras;
           qrl_Nome19.Caption     := NomeProd;
           qrl_NomeProd19.Caption := NomeProd;
           qrl_Vlr19.Caption      := ValorProd;
           qrl_Empr19.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo19.Caption   := '';
           qrl_Cod19.Caption      := '';
           qrl_Nome19.Caption     := '';
           qrl_NomeProd19.Caption := '';
           qrl_Vlr19.Caption      := '';
           qrl_Empr19.Caption     := '';
           qrl_C19.Caption        := '';
           qrl_Frase19.Caption    := '';
           qrl_Preco19.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta20.Checked Then begin

           CriaCodigo(CodBarras,qriCod20.Canvas);
           qrl_Codigo20.Caption  := CodBarras;
           qrl_Cod20.Caption      := CodBarras;
           qrl_Nome20.Caption     := NomeProd;
           qrl_NomeProd20.Caption := NomeProd;
           qrl_Vlr20.Caption      := ValorProd;
           qrl_Empr20.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo20.Caption   := '';
           qrl_Cod20.Caption      := '';
           qrl_Nome20.Caption     := '';
           qrl_NomeProd20.Caption := '';
           qrl_Vlr20.Caption      := '';
           qrl_Empr20.Caption     := '';
           qrl_C20.Caption        := '';
           qrl_Frase20.Caption    := '';
           qrl_Preco20.Caption    := '';

         end;

           ///////////////////////////////////////////

         if ckEtiqueta21.Checked Then begin

           CriaCodigo(CodBarras,qriCod21.Canvas);
           qrl_Codigo21.Caption  := CodBarras;
           qrl_Cod21.Caption      := CodBarras;
           qrl_Nome21.Caption     := NomeProd;
           qrl_NomeProd21.Caption := NomeProd;
           qrl_Vlr21.Caption      := ValorProd;
           qrl_Empr21.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo21.Caption   := '';
           qrl_Cod21.Caption      := '';
           qrl_Nome21.Caption     := '';
           qrl_NomeProd21.Caption := '';
           qrl_Vlr21.Caption      := '';
           qrl_Empr21.Caption     := '';
           qrl_C21.Caption        := '';
           qrl_Frase21.Caption    := '';
           qrl_Preco21.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta22.Checked Then begin

           CriaCodigo(CodBarras,qriCod22.Canvas);
           qrl_Codigo22.Caption  := CodBarras;
           qrl_Cod22.Caption      := CodBarras;
           qrl_Nome22.Caption     := NomeProd;
           qrl_NomeProd22.Caption := NomeProd;
           qrl_Vlr22.Caption      := ValorProd;
           qrl_Empr22.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo22.Caption   := '';
           qrl_Cod22.Caption      := '';
           qrl_Nome22.Caption     := '';
           qrl_NomeProd22.Caption := '';
           qrl_Vlr22.Caption      := '';
           qrl_Empr22.Caption     := '';
           qrl_C22.Caption        := '';
           qrl_Frase22.Caption    := '';
           qrl_Preco22.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta23.Checked Then begin

           CriaCodigo(CodBarras,qriCod23.Canvas);
           qrl_Codigo23.Caption  := CodBarras;
           qrl_Cod23.Caption      := CodBarras;
           qrl_Nome23.Caption     := NomeProd;
           qrl_NomeProd23.Caption := NomeProd;
           qrl_Vlr23.Caption      := ValorProd;
           qrl_Empr23.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo23.Caption   := '';
           qrl_Cod23.Caption      := '';
           qrl_Nome23.Caption     := '';
           qrl_NomeProd23.Caption := '';
           qrl_Vlr23.Caption      := '';
           qrl_Empr23.Caption     := '';
           qrl_C23.Caption        := '';
           qrl_Frase23.Caption    := '';
           qrl_Preco23.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta24.Checked Then begin

           CriaCodigo(CodBarras,qriCod24.Canvas);
           qrl_Codigo24.Caption  := CodBarras;
           qrl_Cod24.Caption      := CodBarras;
           qrl_Nome24.Caption     := NomeProd;
           qrl_NomeProd24.Caption := NomeProd;
           qrl_Vlr24.Caption      := ValorProd;
           qrl_Empr24.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo24.Caption   := '';
           qrl_Cod24.Caption      := '';
           qrl_Nome24.Caption     := '';
           qrl_NomeProd24.Caption := '';
           qrl_Vlr24.Caption      := '';
           qrl_Empr24.Caption     := '';
           qrl_C24.Caption        := '';
           qrl_Frase24.Caption    := '';
           qrl_Preco24.Caption    := '';

         end;

          ////////////////////////////////////////////

         if ckEtiqueta25.Checked Then begin

           CriaCodigo(CodBarras,qriCod25.Canvas);
           qrl_Codigo25.Caption  := CodBarras;
           qrl_Cod25.Caption      := CodBarras;
           qrl_Nome25.Caption     := NomeProd;
           qrl_NomeProd25.Caption := NomeProd;
           qrl_Vlr25.Caption      := ValorProd;
           qrl_Empr25.Caption  := ibDadosEmpresa.FieldByName('NOMEFANTASIA').AsString;

         end else begin

           qrl_Codigo25.Caption   := '';
           qrl_Cod25.Caption      := '';
           qrl_Nome25.Caption     := '';
           qrl_NomeProd25.Caption := '';
           qrl_Vlr25.Caption      := '';
           qrl_Empr25.Caption     := '';
           qrl_C25.Caption        := '';
           qrl_Frase25.Caption    := '';
           qrl_Preco25.Caption    := '';

         end;

           ///////////////////////////////////////////


          end;{if}

            qrpCodBarrasAD.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelCodBarrasAD.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

    end;{if}

  end;//if frmprodshowing

  end;{with}


end;

procedure TfrmEtiquetasLoja.ckMarcarTodosClick(Sender: TObject);
begin
MarcarTodos;
end;

procedure TfrmEtiquetasLoja.ckMarcar1a10Click(Sender: TObject);
begin
Marcar1a10;
end;

procedure TfrmEtiquetasLoja.ckMarcar11a25Click(Sender: TObject);
begin
Marcar11a25;
end;

end.
