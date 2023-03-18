unit untPimaco6089;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BmsXPButton, BmsXPCheckBox, DB, IBQuery,
  StdCtrls;

type
  TfrmPimaco6089 = class(TForm)
    GroupBox1: TGroupBox;
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
    ckEtiqueta16: TCheckBox;
    ckEtiqueta11: TCheckBox;
    ckEtiqueta17: TCheckBox;
    ckEtiqueta12: TCheckBox;
    ckEtiqueta18: TCheckBox;
    ckEtiqueta13: TCheckBox;
    ckEtiqueta19: TCheckBox;
    ckEtiqueta14: TCheckBox;
    ckEtiqueta20: TCheckBox;
    ckEtiqueta15: TCheckBox;
    ckEtiqueta26: TCheckBox;
    ckEtiqueta21: TCheckBox;
    ckEtiqueta27: TCheckBox;
    ckEtiqueta22: TCheckBox;
    ckEtiqueta28: TCheckBox;
    ckEtiqueta23: TCheckBox;
    ckEtiqueta29: TCheckBox;
    ckEtiqueta24: TCheckBox;
    ckEtiqueta30: TCheckBox;
    ckEtiqueta25: TCheckBox;
    ckEtiqueta46: TCheckBox;
    ckEtiqueta47: TCheckBox;
    ckEtiqueta41: TCheckBox;
    ckEtiqueta42: TCheckBox;
    ckEtiqueta48: TCheckBox;
    ckEtiqueta43: TCheckBox;
    ckEtiqueta49: TCheckBox;
    ckEtiqueta44: TCheckBox;
    ckEtiqueta50: TCheckBox;
    ckEtiqueta45: TCheckBox;
    ckEtiqueta36: TCheckBox;
    ckEtiqueta31: TCheckBox;
    ckEtiqueta37: TCheckBox;
    ckEtiqueta32: TCheckBox;
    ckEtiqueta38: TCheckBox;
    ckEtiqueta33: TCheckBox;
    ckEtiqueta39: TCheckBox;
    ckEtiqueta34: TCheckBox;
    ckEtiqueta40: TCheckBox;
    ckEtiqueta35: TCheckBox;
    ckEtiqueta56: TCheckBox;
    ckEtiqueta51: TCheckBox;
    ckEtiqueta57: TCheckBox;
    ckEtiqueta52: TCheckBox;
    ckEtiqueta58: TCheckBox;
    ckEtiqueta53: TCheckBox;
    ckEtiqueta59: TCheckBox;
    ckEtiqueta54: TCheckBox;
    ckEtiqueta60: TCheckBox;
    ckEtiqueta55: TCheckBox;
    ckMarcarTodos: TCheckBox;
    ckMarcar1a10: TCheckBox;
    ckMarcar11a20: TCheckBox;
    ckMarcar21a30: TCheckBox;
    ckMarcar31a40: TCheckBox;
    ckMarcar41a50: TCheckBox;
    ckMarcar51a60: TCheckBox;
    grbTiposEtiqueta: TGroupBox;
    ckImprimiCodigo: TCheckBox;
    ckComNome: TCheckBox;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure LimparBotoes;
    procedure MarcaTodos;
    procedure Marcar1a10;
    procedure Marcar11a20;
    procedure Marcar21a30;
    procedure Marcar31a40;
    procedure Marcar41a50;
    procedure Marcar51a60;
    Procedure CriaCodigo(Cod : String; Imagem : TCanvas);
    procedure FormShow(Sender: TObject);
    procedure ckMarcarTodosCheck(Sender: TObject);
    procedure ckMarcar1a10Check(Sender: TObject);
    procedure ckMarcar11a20Check(Sender: TObject);
    procedure ckMarcar21a30Check(Sender: TObject);
    procedure ckMarcar31a40Check(Sender: TObject);
    procedure ckMarcar41a50Check(Sender: TObject);
    procedure ckMarcar51a60Check(Sender: TObject);
    procedure ibeaAbrirRelatorioClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPimaco6089: TfrmPimaco6089;

implementation

uses untdmModule, untProdutos_MPrima, untEtiquetasPimaco6089, funcPosto,
  untRelEtiquetas6089Nome;

{$R *.dfm}

procedure TfrmPimaco6089.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPimaco6089.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmPimaco6089.LimparBotoes;

begin

  ckMarcarTodos.Checked := False;
  ckMarcar1a10.Checked  := False;
  ckMarcar11a20.Checked := False;
  ckMarcar21a30.Checked := False;
  ckMarcar31a40.Checked := False;
  ckMarcar41a50.Checked := False;
  ckMarcar51a60.Checked := False;
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
  ckEtiqueta26.Checked  := False;
  ckEtiqueta27.Checked  := False;
  ckEtiqueta28.Checked  := False;
  ckEtiqueta29.Checked  := False;
  ckEtiqueta30.Checked  := False;
  ckEtiqueta31.Checked  := False;
  ckEtiqueta32.Checked  := False;
  ckEtiqueta33.Checked  := False;
  ckEtiqueta34.Checked  := False;
  ckEtiqueta35.Checked  := False;
  ckEtiqueta36.Checked  := False;
  ckEtiqueta37.Checked  := False;
  ckEtiqueta38.Checked  := False;
  ckEtiqueta39.Checked  := False;
  ckEtiqueta40.Checked  := False;
  ckEtiqueta41.Checked  := False;
  ckEtiqueta42.Checked  := False;
  ckEtiqueta43.Checked  := False;
  ckEtiqueta44.Checked  := False;
  ckEtiqueta45.Checked  := False;
  ckEtiqueta46.Checked  := False;
  ckEtiqueta47.Checked  := False;
  ckEtiqueta48.Checked  := False;
  ckEtiqueta49.Checked  := False;
  ckEtiqueta50.Checked  := False;
  ckEtiqueta51.Checked  := False;
  ckEtiqueta52.Checked  := False;
  ckEtiqueta53.Checked  := False;
  ckEtiqueta54.Checked  := False;
  ckEtiqueta55.Checked  := False;
  ckEtiqueta56.Checked  := False;
  ckEtiqueta57.Checked  := False;
  ckEtiqueta58.Checked  := False;
  ckEtiqueta59.Checked  := False;
  ckEtiqueta60.Checked  := False;

end;

procedure TfrmPimaco6089.MarcaTodos;

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
    ckEtiqueta26.Checked := True;
    ckEtiqueta27.Checked := True;
    ckEtiqueta28.Checked := True;
    ckEtiqueta29.Checked := True;
    ckEtiqueta30.Checked := True;
    ckEtiqueta31.Checked := True;
    ckEtiqueta32.Checked := True;
    ckEtiqueta33.Checked := True;
    ckEtiqueta34.Checked := True;
    ckEtiqueta35.Checked := True;
    ckEtiqueta36.Checked := True;
    ckEtiqueta37.Checked := True;
    ckEtiqueta38.Checked := True;
    ckEtiqueta39.Checked := True;
    ckEtiqueta40.Checked := True;
    ckEtiqueta41.Checked := True;
    ckEtiqueta42.Checked := True;
    ckEtiqueta43.Checked := True;
    ckEtiqueta44.Checked := True;
    ckEtiqueta45.Checked := True;
    ckEtiqueta46.Checked := True;
    ckEtiqueta47.Checked := True;
    ckEtiqueta48.Checked := True;
    ckEtiqueta49.Checked := True;
    ckEtiqueta50.Checked := True;
    ckEtiqueta51.Checked := True;
    ckEtiqueta52.Checked := True;
    ckEtiqueta53.Checked := True;
    ckEtiqueta54.Checked := True;
    ckEtiqueta55.Checked := True;
    ckEtiqueta56.Checked := True;
    ckEtiqueta57.Checked := True;
    ckEtiqueta58.Checked := True;
    ckEtiqueta59.Checked := True;
    ckEtiqueta60.Checked := True;

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
    ckEtiqueta26.Checked := False;
    ckEtiqueta27.Checked := False;
    ckEtiqueta28.Checked := False;
    ckEtiqueta29.Checked := False;
    ckEtiqueta30.Checked := False;
    ckEtiqueta31.Checked := False;
    ckEtiqueta32.Checked := False;
    ckEtiqueta33.Checked := False;
    ckEtiqueta34.Checked := False;
    ckEtiqueta35.Checked := False;
    ckEtiqueta36.Checked := False;
    ckEtiqueta37.Checked := False;
    ckEtiqueta38.Checked := False;
    ckEtiqueta39.Checked := False;
    ckEtiqueta40.Checked := False;
    ckEtiqueta41.Checked := False;
    ckEtiqueta42.Checked := False;
    ckEtiqueta43.Checked := False;
    ckEtiqueta44.Checked := False;
    ckEtiqueta45.Checked := False;
    ckEtiqueta46.Checked := False;
    ckEtiqueta47.Checked := False;
    ckEtiqueta48.Checked := False;
    ckEtiqueta49.Checked := False;
    ckEtiqueta50.Checked := False;
    ckEtiqueta51.Checked := False;
    ckEtiqueta52.Checked := False;
    ckEtiqueta53.Checked := False;
    ckEtiqueta54.Checked := False;
    ckEtiqueta55.Checked := False;
    ckEtiqueta56.Checked := False;
    ckEtiqueta57.Checked := False;
    ckEtiqueta58.Checked := False;
    ckEtiqueta59.Checked := False;
    ckEtiqueta60.Checked := False;

  end;//if

end;

procedure TfrmPimaco6089.Marcar1a10;

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

procedure TfrmPimaco6089.Marcar11a20;

begin

  if ckMarcar11a20.Checked Then begin

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

  end;//if

end;

procedure TfrmPimaco6089.Marcar21a30;

begin

  if ckMarcar21a30.Checked Then begin

    ckEtiqueta21.Checked := True;
    ckEtiqueta22.Checked := True;
    ckEtiqueta23.Checked := True;
    ckEtiqueta24.Checked := True;
    ckEtiqueta25.Checked := True;
    ckEtiqueta26.Checked := True;
    ckEtiqueta27.Checked := True;
    ckEtiqueta28.Checked := True;
    ckEtiqueta29.Checked := True;
    ckEtiqueta30.Checked := True;

  end else begin

    ckEtiqueta21.Checked := False;
    ckEtiqueta22.Checked := False;
    ckEtiqueta23.Checked := False;
    ckEtiqueta24.Checked := False;
    ckEtiqueta25.Checked := False;
    ckEtiqueta26.Checked := False;
    ckEtiqueta27.Checked := False;
    ckEtiqueta28.Checked := False;
    ckEtiqueta29.Checked := False;
    ckEtiqueta30.Checked := False;

  end;//if

end;

procedure TfrmPimaco6089.Marcar31a40;

begin

  if ckMarcar31a40.Checked Then begin

    ckEtiqueta31.Checked := True;
    ckEtiqueta32.Checked := True;
    ckEtiqueta33.Checked := True;
    ckEtiqueta34.Checked := True;
    ckEtiqueta35.Checked := True;
    ckEtiqueta36.Checked := True;
    ckEtiqueta37.Checked := True;
    ckEtiqueta38.Checked := True;
    ckEtiqueta39.Checked := True;
    ckEtiqueta40.Checked := True;

  end else begin

    ckEtiqueta31.Checked := False;
    ckEtiqueta32.Checked := False;
    ckEtiqueta33.Checked := False;
    ckEtiqueta34.Checked := False;
    ckEtiqueta35.Checked := False;
    ckEtiqueta36.Checked := False;
    ckEtiqueta37.Checked := False;
    ckEtiqueta38.Checked := False;
    ckEtiqueta39.Checked := False;
    ckEtiqueta40.Checked := False;

  end;//if

end;

procedure TfrmPimaco6089.Marcar41a50;

begin

  if ckMarcar41a50.Checked Then begin

    ckEtiqueta41.Checked := True;
    ckEtiqueta42.Checked := True;
    ckEtiqueta43.Checked := True;
    ckEtiqueta44.Checked := True;
    ckEtiqueta45.Checked := True;
    ckEtiqueta46.Checked := True;
    ckEtiqueta47.Checked := True;
    ckEtiqueta48.Checked := True;
    ckEtiqueta49.Checked := True;
    ckEtiqueta50.Checked := True;

  end else begin

    ckEtiqueta41.Checked := False;
    ckEtiqueta42.Checked := False;
    ckEtiqueta43.Checked := False;
    ckEtiqueta44.Checked := False;
    ckEtiqueta45.Checked := False;
    ckEtiqueta46.Checked := False;
    ckEtiqueta47.Checked := False;
    ckEtiqueta48.Checked := False;
    ckEtiqueta49.Checked := False;
    ckEtiqueta50.Checked := False;

  end;//if

end;

procedure TfrmPimaco6089.Marcar51a60;

begin

  if ckMarcar51a60.Checked Then begin

    ckEtiqueta51.Checked := True;
    ckEtiqueta52.Checked := True;
    ckEtiqueta53.Checked := True;
    ckEtiqueta54.Checked := True;
    ckEtiqueta55.Checked := True;
    ckEtiqueta56.Checked := True;
    ckEtiqueta57.Checked := True;
    ckEtiqueta58.Checked := True;
    ckEtiqueta59.Checked := True;
    ckEtiqueta60.Checked := True;

  end else begin

    ckEtiqueta51.Checked := False;
    ckEtiqueta52.Checked := False;
    ckEtiqueta53.Checked := False;
    ckEtiqueta54.Checked := False;
    ckEtiqueta55.Checked := False;
    ckEtiqueta56.Checked := False;
    ckEtiqueta57.Checked := False;
    ckEtiqueta58.Checked := False;
    ckEtiqueta59.Checked := False;
    ckEtiqueta60.Checked := False;

  end;//if

end;

Procedure TfrmPimaco6089.CriaCodigo(Cod : String; Imagem : TCanvas);

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


procedure TfrmPimaco6089.FormShow(Sender: TObject);
begin
LimparBotoes;
end;

procedure TfrmPimaco6089.ckMarcarTodosCheck(Sender: TObject);
begin
MarcaTodos;
end;

procedure TfrmPimaco6089.ckMarcar1a10Check(Sender: TObject);
begin
Marcar1a10;
end;

procedure TfrmPimaco6089.ckMarcar11a20Check(Sender: TObject);
begin
Marcar11a20;
end;

procedure TfrmPimaco6089.ckMarcar21a30Check(Sender: TObject);
begin
Marcar21a30;
end;

procedure TfrmPimaco6089.ckMarcar31a40Check(Sender: TObject);
begin
Marcar31a40;
end;

procedure TfrmPimaco6089.ckMarcar41a50Check(Sender: TObject);
begin
Marcar41a50;
end;

procedure TfrmPimaco6089.ckMarcar51a60Check(Sender: TObject);
begin
Marcar51a60;
end;

procedure TfrmPimaco6089.ibeaAbrirRelatorioClick(Sender: TObject);

var

CodBarras, NomeProd, ValorProd,Referencia,TipoUnidade : String;

begin
  with dmModule do begin

  if frmProd_MPrima.lbl_edtNomeProduto.Text = '' Then begin

    Application.MessageBox('Por Favor selecione um Produto','Notificação:Produto não Selecionado', + MB_OK+MB_ICONQUESTION);

  end else begin


    if ckImprimiCodigo.Checked then begin

      Commit(ibTempProdutos);
      ibTempProdutos.Close;
      ibTempProdutos.SQL.Clear;
      ibTempProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE IDPROD=''' + frmProd_MPrima.lbl_edtCodigo.Text + '''');
      ibTempProdutos.Open;

      (ibTempProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat        := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


      Application.CreateForm(TfrmEtiquetasPimaco6089,frmEtiquetasPimaco6089);

      TRY

        with frmEtiquetasPimaco6089 do begin

          frmEtiquetasPimaco6089.qrpPimaco6089.DataSet := ibTempProdutos;

          if ibTempProdutos.FieldByName('CODBARRASAD').AsString <> '' Then begin



          //  frmRelCodBarrasAD.GeraCodigoBarraAD.Text        := ibTempProdutos.FieldByName('CODBARRASAD').AsString;
            CodBarras  := ibTempProdutos.FieldByName('CODBARRASAD').AsString;
            NomeProd   := (ibTempProdutos.FieldByName('NOME').AsString);
            ValorProd  := FormatFloat(CasasDecimais('Produtos'),ibTempProdutos.FieldByName('VALORVENDAA').AsFloat);
            Referencia := (ibTempProdutos.FieldByName('REF').AsString);
          //  frmRelCodBarrasAD.GeraCodigoBarraAD.Top         := 0;
          //  frmRelCodBarrasAD.GeraCodigoBarraAD.Left        := 7;

         //  frmRelCodBarrasAD.qriCod12.Picture     := nil;

          ///////////////////////////////////////////

           if ckEtiqueta1.Checked Then begin

             CriaCodigo(CodBarras,qriCod1.Canvas);
             qrl_Referencia1.Caption  := Referencia ;
             qrl_CodB1.Caption        := CodBarras;
             qrl_Vlr1.Caption         := ValorProd;

           end else begin

             qriCod1.Picture := nil;
             qrl_Referencia1.Caption  := '';
             qrl_CodB1.Caption        := '';
             qrl_Ref1.Caption         := '';
             qrl_Vlr1.Caption         := '';
             qrl_P1.Caption           := '';

           end;

          ////////////////////////////////////////////
           if ckEtiqueta2.Checked Then begin

             CriaCodigo(CodBarras,qriCod2.Canvas);
             qrl_Referencia2.Caption  := Referencia ;
             qrl_CodB2.Caption        := CodBarras;
             qrl_Vlr2.Caption         := ValorProd;

           end else begin

             qriCod2.Picture := nil;
             qrl_Referencia2.Caption  := '';
             qrl_CodB2.Caption        := '';
             qrl_Ref2.Caption         := '';
             qrl_Vlr2.Caption         := '';
             qrl_P2.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta3.Checked Then begin

             CriaCodigo(CodBarras,qriCod3.Canvas);
             qrl_Referencia3.Caption  := Referencia ;
             qrl_CodB3.Caption        := CodBarras;
             qrl_Vlr3.Caption         := ValorProd;

           end else begin

             qriCod3.Picture := nil;
             qrl_Referencia3.Caption  := '';
             qrl_CodB3.Caption        := '';
             qrl_Ref3.Caption         := '';
             qrl_Vlr3.Caption         := '';
             qrl_P3.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta4.Checked Then begin

             CriaCodigo(CodBarras,qriCod4.Canvas);
             qrl_Referencia4.Caption  := Referencia ;
             qrl_CodB4.Caption        := CodBarras;
             qrl_Vlr4.Caption         := ValorProd;

           end else begin

             qriCod4.Picture := nil;
             qrl_Referencia4.Caption  := '';
             qrl_CodB4.Caption        := '';
             qrl_Ref4.Caption         := '';
             qrl_Vlr4.Caption         := '';
             qrl_P4.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta5.Checked Then begin

             CriaCodigo(CodBarras,qriCod5.Canvas);
             qrl_Referencia5.Caption  := Referencia ;
             qrl_CodB5.Caption        := CodBarras;
             qrl_Vlr5.Caption         := ValorProd;

           end else begin

             qriCod5.Picture := nil;
             qrl_Referencia5.Caption  := '';
             qrl_CodB5.Caption        := '';
             qrl_Ref5.Caption         := '';
             qrl_Vlr5.Caption         := '';
             qrl_P5.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta6.Checked Then begin

             CriaCodigo(CodBarras,qriCod6.Canvas);
             qrl_Referencia6.Caption  := Referencia ;
             qrl_CodB6.Caption        := CodBarras;
             qrl_Vlr6.Caption         := ValorProd;

           end else begin

             qriCod6.Picture := nil;
             qrl_Referencia6.Caption  := '';
             qrl_CodB6.Caption        := '';
             qrl_Ref6.Caption         := '';
             qrl_Vlr6.Caption         := '';
             qrl_P6.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta7.Checked Then begin

             CriaCodigo(CodBarras,qriCod7.Canvas);
             qrl_Referencia7.Caption  := Referencia ;
             qrl_CodB7.Caption        := CodBarras;
             qrl_Vlr7.Caption         := ValorProd;

           end else begin

             qriCod7.Picture := nil;
             qrl_Referencia7.Caption  := '';
             qrl_CodB7.Caption        := '';
             qrl_Ref7.Caption         := '';
             qrl_Vlr7.Caption         := '';
             qrl_P7.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta8.Checked Then begin

             CriaCodigo(CodBarras,qriCod8.Canvas);
             qrl_Referencia8.Caption  := Referencia ;
             qrl_CodB8.Caption        := CodBarras;
             qrl_Vlr8.Caption         := ValorProd;

           end else begin

             qriCod8.Picture := nil;
             qrl_Referencia8.Caption  := '';
             qrl_CodB8.Caption        := '';
             qrl_Ref8.Caption         := '';
             qrl_Vlr8.Caption         := '';
             qrl_P8.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta9.Checked Then begin

             CriaCodigo(CodBarras,qriCod9.Canvas);
             qrl_Referencia9.Caption  := Referencia ;
             qrl_CodB9.Caption        := CodBarras;
             qrl_Vlr9.Caption         := ValorProd;

           end else begin

             qriCod9.Picture := nil;
             qrl_Referencia9.Caption  := '';
             qrl_CodB9.Caption        := '';
             qrl_Ref9.Caption         := '';
             qrl_Vlr9.Caption         := '';
             qrl_P9.Caption           := '';


           end;
          ////////////////////////////////////////////

           if ckEtiqueta10.Checked Then begin

             CriaCodigo(CodBarras,qriCod10.Canvas);
             qrl_Referencia10.Caption  := Referencia ;
             qrl_CodB10.Caption        := CodBarras;
             qrl_Vlr10.Caption         := ValorProd;

           end else begin

             qriCod10.Picture := nil;
             qrl_Referencia10.Caption  := '';
             qrl_CodB10.Caption        := '';
             qrl_Ref10.Caption         := '';
             qrl_Vlr10.Caption         := '';
             qrl_P10.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta11.Checked Then begin

             CriaCodigo(CodBarras,qriCod11.Canvas);
             qrl_Referencia11.Caption  := Referencia ;
             qrl_CodB11.Caption        := CodBarras;
             qrl_Vlr11.Caption         := ValorProd;

           end else begin

             qriCod11.Picture := nil;
             qrl_Referencia11.Caption  := '';
             qrl_CodB11.Caption        := '';
             qrl_Ref11.Caption         := '';
             qrl_Vlr11.Caption         := '';
             qrl_P11.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta12.Checked Then begin

             CriaCodigo(CodBarras,qriCod12.Canvas);
             qrl_Referencia12.Caption  := Referencia ;
             qrl_CodB12.Caption        := CodBarras;
             qrl_Vlr12.Caption         := ValorProd;

           end else begin

             qriCod12.Picture := nil;
             qrl_Referencia12.Caption  := '';
             qrl_CodB12.Caption        := '';
             qrl_Ref12.Caption         := '';
             qrl_Vlr12.Caption         := '';
             qrl_P12.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta13.Checked Then begin

             CriaCodigo(CodBarras,qriCod13.Canvas);
             qrl_Referencia13.Caption  := Referencia ;
             qrl_CodB13.Caption        := CodBarras;
             qrl_Vlr13.Caption         := ValorProd;

           end else begin

             qriCod13.Picture := nil;
             qrl_Referencia13.Caption  := '';
             qrl_CodB13.Caption        := '';
             qrl_Ref13.Caption         := '';
             qrl_Vlr13.Caption         := '';
             qrl_P13.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta14.Checked Then begin

             CriaCodigo(CodBarras,qriCod14.Canvas);
             qrl_Referencia14.Caption  := Referencia ;
             qrl_CodB14.Caption        := CodBarras;
             qrl_Vlr14.Caption         := ValorProd;

           end else begin

             qriCod14.Picture := nil;
             qrl_Referencia14.Caption  := '';
             qrl_CodB14.Caption        := '';
             qrl_Ref14.Caption         := '';
             qrl_Vlr14.Caption         := '';
             qrl_P14.Caption           := '';

           end;
          ////////////////////////////////////////////


           if ckEtiqueta15.Checked Then begin

             CriaCodigo(CodBarras,qriCod15.Canvas);
             qrl_Referencia15.Caption  := Referencia ;
             qrl_CodB15.Caption        := CodBarras;
             qrl_Vlr15.Caption         := ValorProd;

           end else begin

             qriCod15.Picture := nil;
             qrl_Referencia15.Caption  := '';
             qrl_CodB15.Caption        := '';
             qrl_Ref15.Caption         := '';
             qrl_Vlr15.Caption         := '';
             qrl_P15.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta16.Checked Then begin

             CriaCodigo(CodBarras,qriCod16.Canvas);
             qrl_Referencia16.Caption  := Referencia ;
             qrl_CodB16.Caption        := CodBarras;
             qrl_Vlr16.Caption         := ValorProd;

           end else begin

             qriCod16.Picture := nil;
             qrl_Referencia16.Caption  := '';
             qrl_CodB16.Caption        := '';
             qrl_Ref16.Caption         := '';
             qrl_Vlr16.Caption         := '';
             qrl_P16.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta17.Checked Then begin

             CriaCodigo(CodBarras,qriCod17.Canvas);
             qrl_Referencia17.Caption  := Referencia ;
             qrl_CodB17.Caption        := CodBarras;
             qrl_Vlr17.Caption         := ValorProd;

           end else begin

             qriCod17.Picture := nil;
             qrl_Referencia17.Caption  := '';
             qrl_CodB17.Caption        := '';
             qrl_Ref17.Caption         := '';
             qrl_Vlr17.Caption         := '';
             qrl_P17.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta18.Checked Then begin

             CriaCodigo(CodBarras,qriCod18.Canvas);
             qrl_Referencia18.Caption  := Referencia ;
             qrl_CodB18.Caption        := CodBarras;
             qrl_Vlr18.Caption         := ValorProd;

           end else begin

             qriCod18.Picture := nil;
             qrl_Referencia18.Caption  := '';
             qrl_CodB18.Caption        := '';
             qrl_Ref18.Caption         := '';
             qrl_Vlr18.Caption         := '';
             qrl_P18.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta19.Checked Then begin

             CriaCodigo(CodBarras,qriCod19.Canvas);
             qrl_Referencia19.Caption  := Referencia ;
             qrl_CodB19.Caption        := CodBarras;
             qrl_Vlr19.Caption         := ValorProd;

           end else begin

             qriCod19.Picture := nil;
             qrl_Referencia19.Caption  := '';
             qrl_CodB19.Caption        := '';
             qrl_Ref19.Caption         := '';
             qrl_Vlr19.Caption         := '';
             qrl_P19.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta20.Checked Then begin

             CriaCodigo(CodBarras,qriCod20.Canvas);
             qrl_Referencia20.Caption  := Referencia ;
             qrl_CodB20.Caption        := CodBarras;
             qrl_Vlr20.Caption         := ValorProd;

           end else begin

             qriCod20.Picture := nil;
             qrl_Referencia20.Caption  := '';
             qrl_CodB20.Caption        := '';
             qrl_Ref20.Caption         := '';
             qrl_Vlr20.Caption         := '';
             qrl_P20.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta21.Checked Then begin

             CriaCodigo(CodBarras,qriCod21.Canvas);
             qrl_Referencia21.Caption  := Referencia ;
             qrl_CodB21.Caption        := CodBarras;
             qrl_Vlr21.Caption         := ValorProd;

           end else begin

             qriCod21.Picture := nil;
             qrl_Referencia21.Caption  := '';
             qrl_CodB21.Caption        := '';
             qrl_Ref21.Caption         := '';
             qrl_Vlr21.Caption         := '';
             qrl_P21.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta22.Checked Then begin

             CriaCodigo(CodBarras,qriCod22.Canvas);
             qrl_Referencia22.Caption  := Referencia ;
             qrl_CodB22.Caption        := CodBarras;
             qrl_Vlr22.Caption         := ValorProd;

           end else begin

             qriCod22.Picture := nil;
             qrl_Referencia22.Caption  := '';
             qrl_CodB22.Caption        := '';
             qrl_Ref22.Caption         := '';
             qrl_Vlr22.Caption         := '';
             qrl_P22.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta23.Checked Then begin

             CriaCodigo(CodBarras,qriCod23.Canvas);
             qrl_Referencia23.Caption  := Referencia ;
             qrl_CodB23.Caption        := CodBarras;
             qrl_Vlr23.Caption         := ValorProd;

           end else begin

             qriCod23.Picture := nil;
             qrl_Referencia23.Caption  := '';
             qrl_CodB23.Caption        := '';
             qrl_Ref23.Caption         := '';
             qrl_Vlr23.Caption         := '';
             qrl_P23.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta24.Checked Then begin

             CriaCodigo(CodBarras,qriCod24.Canvas);
             qrl_Referencia24.Caption  := Referencia ;
             qrl_CodB24.Caption        := CodBarras;
             qrl_Vlr24.Caption         := ValorProd;

           end else begin

             qriCod24.Picture := nil;
             qrl_Referencia24.Caption  := '';
             qrl_CodB24.Caption        := '';
             qrl_Ref24.Caption         := '';
             qrl_Vlr24.Caption         := '';
             qrl_P24.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta25.Checked Then begin

             CriaCodigo(CodBarras,qriCod25.Canvas);
             qrl_Referencia25.Caption  := Referencia ;
             qrl_CodB25.Caption        := CodBarras;
             qrl_Vlr25.Caption         := ValorProd;

           end else begin

             qriCod25.Picture := nil;
             qrl_Referencia25.Caption  := '';
             qrl_CodB25.Caption        := '';
             qrl_Ref25.Caption         := '';
             qrl_Vlr25.Caption         := '';
             qrl_P25.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta26.Checked Then begin

             CriaCodigo(CodBarras,qriCod26.Canvas);
             qrl_Referencia26.Caption  := Referencia ;
             qrl_CodB26.Caption        := CodBarras;
             qrl_Vlr26.Caption         := ValorProd;

           end else begin

             qriCod26.Picture := nil;
             qrl_Referencia26.Caption  := '';
             qrl_CodB26.Caption        := '';
             qrl_Ref26.Caption         := '';
             qrl_Vlr26.Caption         := '';
             qrl_P26.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta27.Checked Then begin

             CriaCodigo(CodBarras,qriCod27.Canvas);
             qrl_Referencia27.Caption  := Referencia ;
             qrl_CodB27.Caption        := CodBarras;
             qrl_Vlr27.Caption         := ValorProd;

           end else begin

             qriCod27.Picture := nil;
             qrl_Referencia27.Caption  := '';
             qrl_CodB27.Caption        := '';
             qrl_Ref27.Caption         := '';
             qrl_Vlr27.Caption         := '';
             qrl_P27.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta28.Checked Then begin

             CriaCodigo(CodBarras,qriCod28.Canvas);
             qrl_Referencia28.Caption  := Referencia ;
             qrl_CodB28.Caption        := CodBarras;
             qrl_Vlr28.Caption         := ValorProd;

           end else begin

             qriCod28.Picture := nil;
             qrl_Referencia28.Caption  := '';
             qrl_CodB28.Caption        := '';
             qrl_Ref28.Caption         := '';
             qrl_Vlr28.Caption         := '';
             qrl_P28.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta29.Checked Then begin

             CriaCodigo(CodBarras,qriCod29.Canvas);
             qrl_Referencia29.Caption  := Referencia ;
             qrl_CodB29.Caption        := CodBarras;
             qrl_Vlr29.Caption         := ValorProd;

           end else begin

             qriCod29.Picture := nil;
             qrl_Referencia29.Caption  := '';
             qrl_CodB29.Caption        := '';
             qrl_Ref29.Caption         := '';
             qrl_Vlr29.Caption         := '';
             qrl_P29.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta30.Checked Then begin

             CriaCodigo(CodBarras,qriCod30.Canvas);
             qrl_Referencia30.Caption  := Referencia ;
             qrl_CodB30.Caption        := CodBarras;
             qrl_Vlr30.Caption         := ValorProd;

           end else begin

             qriCod30.Picture := nil;
             qrl_Referencia30.Caption  := '';
             qrl_CodB30.Caption        := '';
             qrl_Ref30.Caption         := '';
             qrl_Vlr30.Caption         := '';
             qrl_P30.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta31.Checked Then begin

             CriaCodigo(CodBarras,qriCod31.Canvas);
             qrl_Referencia31.Caption  := Referencia ;
             qrl_CodB31.Caption        := CodBarras;
             qrl_Vlr31.Caption         := ValorProd;

           end else begin

             qriCod31.Picture := nil;
             qrl_Referencia31.Caption  := '';
             qrl_CodB31.Caption        := '';
             qrl_Ref31.Caption         := '';
             qrl_Vlr31.Caption         := '';
             qrl_P31.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta32.Checked Then begin

             CriaCodigo(CodBarras,qriCod32.Canvas);
             qrl_Referencia32.Caption  := Referencia ;
             qrl_CodB32.Caption        := CodBarras;
             qrl_Vlr32.Caption         := ValorProd;

           end else begin

             qriCod32.Picture := nil;
             qrl_Referencia32.Caption  := '';
             qrl_CodB32.Caption        := '';
             qrl_Ref32.Caption         := '';
             qrl_Vlr32.Caption         := '';
             qrl_P32.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta33.Checked Then begin

             CriaCodigo(CodBarras,qriCod33.Canvas);
             qrl_Referencia33.Caption  := Referencia ;
             qrl_CodB33.Caption        := CodBarras;
             qrl_Vlr33.Caption         := ValorProd;

           end else begin

             qriCod33.Picture := nil;
             qrl_Referencia33.Caption  := '';
             qrl_CodB33.Caption        := '';
             qrl_Ref33.Caption         := '';
             qrl_Vlr33.Caption         := '';
             qrl_P33.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta34.Checked Then begin

             CriaCodigo(CodBarras,qriCod34.Canvas);
             qrl_Referencia34.Caption  := Referencia ;
             qrl_CodB34.Caption        := CodBarras;
             qrl_Vlr34.Caption         := ValorProd;

           end else begin

             qriCod34.Picture := nil;
             qrl_Referencia34.Caption  := '';
             qrl_CodB34.Caption        := '';
             qrl_Ref34.Caption         := '';
             qrl_Vlr34.Caption         := '';
             qrl_P34.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta35.Checked Then begin

             CriaCodigo(CodBarras,qriCod35.Canvas);
             qrl_Referencia35.Caption  := Referencia ;
             qrl_CodB35.Caption        := CodBarras;
             qrl_Vlr35.Caption         := ValorProd;

           end else begin

             qriCod35.Picture := nil;
             qrl_Referencia35.Caption  := '';
             qrl_CodB35.Caption        := '';
             qrl_Ref35.Caption         := '';
             qrl_Vlr35.Caption         := '';
             qrl_P35.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta36.Checked Then begin

             CriaCodigo(CodBarras,qriCod36.Canvas);
             qrl_Referencia36.Caption  := Referencia ;
             qrl_CodB36.Caption        := CodBarras;
             qrl_Vlr36.Caption         := ValorProd;

           end else begin

             qriCod36.Picture := nil;
             qrl_Referencia36.Caption  := '';
             qrl_CodB36.Caption        := '';
             qrl_Ref36.Caption         := '';
             qrl_Vlr36.Caption         := '';
             qrl_P36.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta37.Checked Then begin

             CriaCodigo(CodBarras,qriCod37.Canvas);
             qrl_Referencia37.Caption  := Referencia ;
             qrl_CodB37.Caption        := CodBarras;
             qrl_Vlr37.Caption         := ValorProd;

           end else begin

             qriCod37.Picture := nil;
             qrl_Referencia37.Caption  := '';
             qrl_CodB37.Caption        := '';
             qrl_Ref37.Caption         := '';
             qrl_Vlr37.Caption         := '';
             qrl_P37.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta38.Checked Then begin

             CriaCodigo(CodBarras,qriCod38.Canvas);
             qrl_Referencia38.Caption  := Referencia ;
             qrl_CodB38.Caption        := CodBarras;
             qrl_Vlr38.Caption         := ValorProd;

           end else begin

             qriCod38.Picture := nil;
             qrl_Referencia38.Caption  := '';
             qrl_CodB38.Caption        := '';
             qrl_Ref38.Caption         := '';
             qrl_Vlr38.Caption         := '';
             qrl_P38.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta39.Checked Then begin

             CriaCodigo(CodBarras,qriCod39.Canvas);
             qrl_Referencia39.Caption  := Referencia ;
             qrl_CodB39.Caption        := CodBarras;
             qrl_Vlr39.Caption         := ValorProd;

           end else begin

             qriCod39.Picture := nil;
             qrl_Referencia39.Caption  := '';
             qrl_CodB39.Caption        := '';
             qrl_Ref39.Caption         := '';
             qrl_Vlr39.Caption         := '';
             qrl_P39.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta40.Checked Then begin

             CriaCodigo(CodBarras,qriCod40.Canvas);
             qrl_Referencia40.Caption  := Referencia ;
             qrl_CodB40.Caption        := CodBarras;
             qrl_Vlr40.Caption         := ValorProd;

           end else begin

             qriCod40.Picture := nil;
             qrl_Referencia40.Caption  := '';
             qrl_CodB40.Caption        := '';
             qrl_Ref40.Caption         := '';
             qrl_Vlr40.Caption         := '';
             qrl_P40.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta41.Checked Then begin

             CriaCodigo(CodBarras,qriCod41.Canvas);
             qrl_Referencia41.Caption  := Referencia ;
             qrl_CodB41.Caption        := CodBarras;
             qrl_Vlr41.Caption         := ValorProd;

           end else begin

             qriCod41.Picture := nil;
             qrl_Referencia41.Caption  := '';
             qrl_CodB41.Caption        := '';
             qrl_Ref41.Caption         := '';
             qrl_Vlr41.Caption         := '';
             qrl_P41.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta42.Checked Then begin

             CriaCodigo(CodBarras,qriCod42.Canvas);
             qrl_Referencia42.Caption  := Referencia ;
             qrl_CodB42.Caption        := CodBarras;
             qrl_Vlr42.Caption         := ValorProd;

           end else begin

             qriCod42.Picture := nil;
             qrl_Referencia42.Caption  := '';
             qrl_CodB42.Caption        := '';
             qrl_Ref42.Caption         := '';
             qrl_Vlr42.Caption         := '';
             qrl_P42.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta43.Checked Then begin

             CriaCodigo(CodBarras,qriCod43.Canvas);
             qrl_Referencia43.Caption  := Referencia ;
             qrl_CodB43.Caption        := CodBarras;
             qrl_Vlr43.Caption         := ValorProd;

           end else begin

             qriCod43.Picture := nil;
             qrl_Referencia43.Caption  := '';
             qrl_CodB43.Caption        := '';
             qrl_Ref43.Caption         := '';
             qrl_Vlr43.Caption         := '';
             qrl_P43.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta44.Checked Then begin

             CriaCodigo(CodBarras,qriCod44.Canvas);
             qrl_Referencia44.Caption  := Referencia ;
             qrl_CodB44.Caption        := CodBarras;
             qrl_Vlr44.Caption         := ValorProd;

           end else begin

             qriCod44.Picture := nil;
             qrl_Referencia44.Caption  := '';
             qrl_CodB44.Caption        := '';
             qrl_Ref44.Caption         := '';
             qrl_Vlr44.Caption         := '';
             qrl_P44.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta45.Checked Then begin

             CriaCodigo(CodBarras,qriCod45.Canvas);
             qrl_Referencia45.Caption  := Referencia ;
             qrl_CodB45.Caption        := CodBarras;
             qrl_Vlr45.Caption         := ValorProd;

           end else begin

             qriCod45.Picture := nil;
             qrl_Referencia45.Caption  := '';
             qrl_CodB45.Caption        := '';
             qrl_Ref45.Caption         := '';
             qrl_Vlr45.Caption         := '';
             qrl_P45.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta46.Checked Then begin

             CriaCodigo(CodBarras,qriCod46.Canvas);
             qrl_Referencia46.Caption  := Referencia ;
             qrl_CodB46.Caption        := CodBarras;
             qrl_Vlr46.Caption         := ValorProd;

           end else begin

             qriCod46.Picture := nil;
             qrl_Referencia46.Caption  := '';
             qrl_CodB46.Caption        := '';
             qrl_Ref46.Caption         := '';
             qrl_Vlr46.Caption         := '';
             qrl_P46.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta47.Checked Then begin

             CriaCodigo(CodBarras,qriCod47.Canvas);
             qrl_Referencia47.Caption  := Referencia ;
             qrl_CodB47.Caption        := CodBarras;
             qrl_Vlr47.Caption         := ValorProd;

           end else begin

             qriCod47.Picture := nil;
             qrl_Referencia47.Caption  := '';
             qrl_CodB47.Caption        := '';
             qrl_Ref47.Caption         := '';
             qrl_Vlr47.Caption         := '';
             qrl_P47.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta48.Checked Then begin

             CriaCodigo(CodBarras,qriCod48.Canvas);
             qrl_Referencia48.Caption  := Referencia ;
             qrl_CodB48.Caption        := CodBarras;
             qrl_Vlr48.Caption         := ValorProd;

           end else begin

             qriCod48.Picture := nil;
             qrl_Referencia48.Caption  := '';
             qrl_CodB48.Caption        := '';
             qrl_Ref48.Caption         := '';
             qrl_Vlr48.Caption         := '';
             qrl_P48.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta49.Checked Then begin

             CriaCodigo(CodBarras,qriCod49.Canvas);
             qrl_Referencia49.Caption  := Referencia ;
             qrl_CodB49.Caption        := CodBarras;
             qrl_Vlr49.Caption         := ValorProd;

           end else begin

             qriCod49.Picture := nil;
             qrl_Referencia49.Caption  := '';
             qrl_CodB49.Caption        := '';
             qrl_Ref49.Caption         := '';
             qrl_Vlr49.Caption         := '';
             qrl_P49.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta50.Checked Then begin

             CriaCodigo(CodBarras,qriCod50.Canvas);
             qrl_Referencia50.Caption  := Referencia ;
             qrl_CodB50.Caption        := CodBarras;
             qrl_Vlr50.Caption         := ValorProd;

           end else begin

             qriCod50.Picture := nil;
             qrl_Referencia50.Caption  := '';
             qrl_CodB50.Caption        := '';
             qrl_Ref50.Caption         := '';
             qrl_Vlr50.Caption         := '';
             qrl_P50.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta51.Checked Then begin

             CriaCodigo(CodBarras,qriCod51.Canvas);
             qrl_Referencia51.Caption  := Referencia ;
             qrl_CodB51.Caption        := CodBarras;
             qrl_Vlr51.Caption         := ValorProd;

           end else begin

             qriCod51.Picture := nil;
             qrl_Referencia51.Caption  := '';
             qrl_CodB51.Caption        := '';
             qrl_Ref51.Caption         := '';
             qrl_Vlr51.Caption         := '';
             qrl_P51.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta52.Checked Then begin

             CriaCodigo(CodBarras,qriCod52.Canvas);
             qrl_Referencia52.Caption  := Referencia ;
             qrl_CodB52.Caption        := CodBarras;
             qrl_Vlr52.Caption         := ValorProd;

           end else begin

             qriCod52.Picture := nil;
             qrl_Referencia52.Caption  := '';
             qrl_CodB52.Caption        := '';
             qrl_Ref52.Caption         := '';
             qrl_Vlr52.Caption         := '';
             qrl_P52.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta53.Checked Then begin

             CriaCodigo(CodBarras,qriCod53.Canvas);
             qrl_Referencia53.Caption  := Referencia ;
             qrl_CodB53.Caption        := CodBarras;
             qrl_Vlr53.Caption         := ValorProd;

           end else begin

             qriCod53.Picture := nil;
             qrl_Referencia53.Caption  := '';
             qrl_CodB53.Caption        := '';
             qrl_Ref53.Caption         := '';
             qrl_Vlr53.Caption         := '';
             qrl_P53.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta54.Checked Then begin

             CriaCodigo(CodBarras,qriCod54.Canvas);
             qrl_Referencia54.Caption  := Referencia ;
             qrl_CodB54.Caption        := CodBarras;
             qrl_Vlr54.Caption         := ValorProd;

           end else begin

             qriCod54.Picture := nil;
             qrl_Referencia54.Caption  := '';
             qrl_CodB54.Caption        := '';
             qrl_Ref54.Caption         := '';
             qrl_Vlr54.Caption         := '';
             qrl_P54.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta55.Checked Then begin

             CriaCodigo(CodBarras,qriCod55.Canvas);
             qrl_Referencia55.Caption  := Referencia ;
             qrl_CodB55.Caption        := CodBarras;
             qrl_Vlr55.Caption         := ValorProd;

           end else begin

             qriCod55.Picture := nil;
             qrl_Referencia55.Caption  := '';
             qrl_CodB55.Caption        := '';
             qrl_Ref55.Caption         := '';
             qrl_Vlr55.Caption         := '';
             qrl_P55.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta56.Checked Then begin

             CriaCodigo(CodBarras,qriCod56.Canvas);
             qrl_Referencia56.Caption  := Referencia ;
             qrl_CodB56.Caption        := CodBarras;
             qrl_Vlr56.Caption         := ValorProd;

           end else begin

             qriCod56.Picture := nil;
             qrl_Referencia56.Caption  := '';
             qrl_CodB56.Caption        := '';
             qrl_Ref56.Caption         := '';
             qrl_Vlr56.Caption         := '';
             qrl_P56.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta57.Checked Then begin

             CriaCodigo(CodBarras,qriCod57.Canvas);
             qrl_Referencia57.Caption  := Referencia ;
             qrl_CodB57.Caption        := CodBarras;
             qrl_Vlr57.Caption         := ValorProd;

           end else begin

             qriCod57.Picture := nil;
             qrl_Referencia57.Caption  := '';
             qrl_CodB57.Caption        := '';
             qrl_Ref57.Caption         := '';
             qrl_Vlr57.Caption         := '';
             qrl_P57.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta58.Checked Then begin

             CriaCodigo(CodBarras,qriCod58.Canvas);
             qrl_Referencia58.Caption  := Referencia ;
             qrl_CodB58.Caption        := CodBarras;
             qrl_Vlr58.Caption         := ValorProd;

           end else begin

             qriCod58.Picture := nil;
             qrl_Referencia58.Caption  := '';
             qrl_CodB58.Caption        := '';
             qrl_Ref58.Caption         := '';
             qrl_Vlr58.Caption         := '';
             qrl_P58.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta59.Checked Then begin

             CriaCodigo(CodBarras,qriCod59.Canvas);
             qrl_Referencia59.Caption  := Referencia ;
             qrl_CodB59.Caption        := CodBarras;
             qrl_Vlr59.Caption         := ValorProd;

           end else begin

             qriCod59.Picture := nil;
             qrl_Referencia59.Caption  := '';
             qrl_CodB59.Caption        := '';
             qrl_Ref59.Caption         := '';
             qrl_Vlr59.Caption         := '';
             qrl_P59.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta60.Checked Then begin

             CriaCodigo(CodBarras,qriCod60.Canvas);
             qrl_Referencia60.Caption  := Referencia ;
             qrl_CodB60.Caption        := CodBarras;
             qrl_Vlr60.Caption         := ValorProd;

           end else begin

             qriCod60.Picture := nil;
             qrl_Referencia60.Caption  := '';
             qrl_CodB60.Caption        := '';
             qrl_Ref60.Caption         := '';
             qrl_Vlr60.Caption         := '';
             qrl_P60.Caption           := '';

           end;
          ////////////////////////////////////////////

          end;{if}

            qrpPimaco6089.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmEtiquetasPimaco6089.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

    end;//if ck imprimir cod barras

/////////////////////////////////////////////////////////////

    if ckComNome.Checked Then begin

      Commit(ibTempProdutos);
      ibTempProdutos.Close;
      ibTempProdutos.SQL.Clear;
      ibTempProdutos.SQL.Add('SELECT CADPRODUTOS.*,TBLUNIDADEDEVENDA.TIPODEUNIDADE FROM CADPRODUTOS '
      + 'LEFT OUTER JOIN TBLUNIDADEDEVENDA ON CADPRODUTOS.IDUNIDVENDA=TBLUNIDADEDEVENDA.IDTIPOUNID WHERE CADPRODUTOS.IDPROD=''' + frmProd_MPrima.lbl_edtCodigo.Text + '''');
      ibTempProdutos.Open;

    //  (ibTempProdutos.FieldByName('VALORCUSTO') as TFloatField).DisplayFormat         := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat        := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
   //   (ibTempProdutos.FieldByName('VLRPROM') as TFloatField).DisplayFormat            := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


      Application.CreateForm(TfrmEtiquetasNome6089,frmEtiquetasNome6089);

      TRY

        with frmEtiquetasNome6089 do begin

          frmEtiquetasNome6089.qrp6089Nome.DataSet := ibTempProdutos;

          //if ibTempProdutos.FieldByName('CODBARRASAD').AsString <> '' Then begin



          //  frmRelCodBarrasAD.GeraCodigoBarraAD.Text        := ibTempProdutos.FieldByName('CODBARRASAD').AsString;
            CodBarras   := ibTempProdutos.FieldByName('CODBARRASAD').AsString;
            NomeProd    := (ibTempProdutos.FieldByName('NOME').AsString);
            ValorProd   := FormatFloat(CasasDecimais('Produtos'),ibTempProdutos.FieldByName('VALORVENDAA').AsFloat);
            Referencia  := (ibTempProdutos.FieldByName('REF').AsString);
            TipoUnidade := ibTempProdutos.FieldByName('TIPODEUNIDADE').AsString;

          //  frmRelCodBarrasAD.GeraCodigoBarraAD.Top         := 0;
          //  frmRelCodBarrasAD.GeraCodigoBarraAD.Left        := 7;

         //  frmRelCodBarrasAD.qriCod12.Picture     := nil;

          ///////////////////////////////////////////

           if ckEtiqueta1.Checked Then begin

             qrl_Referencia1.Caption  := Referencia;
             qrl_Nome1.Caption        := NomeProd;
             qrlUnid1.Caption         := TipoUnidade;
             qrl_Vlr1.Caption         := ValorProd;

           end else begin

             qrl_Referencia1.Caption  := '';
             qrl_Nome1.Caption        := '';
             qrl_Ref1.Caption         := '';
             qrl_Vlr1.Caption         := '';
             qrlUnid1.Caption         := '';
             qrl_P1.Caption           := '';

           end;

          ////////////////////////////////////////////
           if ckEtiqueta2.Checked Then begin

             qrl_Referencia2.Caption  := Referencia;
             qrl_Nome2.Caption        := NomeProd;
             qrlUnid2.Caption         := TipoUnidade;
             qrl_Vlr2.Caption         := ValorProd;

           end else begin

             qrl_Referencia2.Caption  := '';
             qrl_Nome2.Caption        := '';
             qrl_Ref2.Caption         := '';
             qrl_Vlr2.Caption         := '';
             qrlUnid2.Caption         := '';
             qrl_P2.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta3.Checked Then begin

             qrl_Referencia3.Caption  := Referencia;
             qrl_Nome3.Caption        := NomeProd;
             qrlUnid3.Caption         := TipoUnidade;
             qrl_Vlr3.Caption         := ValorProd;

           end else begin

             qrl_Referencia3.Caption  := '';
             qrl_Nome3.Caption        := '';
             qrl_Ref3.Caption         := '';
             qrl_Vlr3.Caption         := '';
             qrlUnid3.Caption         := '';
             qrl_P3.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta4.Checked Then begin

             qrl_Referencia4.Caption  := Referencia;
             qrl_Nome4.Caption        := NomeProd;
             qrlUnid4.Caption         := TipoUnidade;
             qrl_Vlr4.Caption         := ValorProd;

           end else begin

             qrl_Referencia4.Caption  := '';
             qrl_Nome4.Caption        := '';
             qrl_Ref4.Caption         := '';
             qrl_Vlr4.Caption         := '';
             qrlUnid4.Caption         := '';
             qrl_P4.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta5.Checked Then begin

             qrl_Referencia5.Caption  := Referencia;
             qrl_Nome5.Caption        := NomeProd;
             qrlUnid5.Caption         := TipoUnidade;
             qrl_Vlr5.Caption         := ValorProd;

           end else begin

             qrl_Referencia5.Caption  := '';
             qrl_Nome5.Caption        := '';
             qrl_Ref5.Caption         := '';
             qrl_Vlr5.Caption         := '';
             qrlUnid5.Caption         := '';
             qrl_P5.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta6.Checked Then begin

             qrl_Referencia6.Caption  := Referencia;
             qrl_Nome6.Caption        := NomeProd;
             qrlUnid6.Caption         := TipoUnidade;
             qrl_Vlr6.Caption         := ValorProd;

           end else begin

             qrl_Referencia6.Caption  := '';
             qrl_Nome6.Caption        := '';
             qrl_Ref6.Caption         := '';
             qrl_Vlr6.Caption         := '';
             qrlUnid6.Caption         := '';
             qrl_P6.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta7.Checked Then begin

             qrl_Referencia7.Caption  := Referencia;
             qrl_Nome7.Caption        := NomeProd;
             qrlUnid7.Caption         := TipoUnidade;
             qrl_Vlr7.Caption         := ValorProd;

           end else begin

             qrl_Referencia7.Caption  := '';
             qrl_Nome7.Caption        := '';
             qrl_Ref7.Caption         := '';
             qrl_Vlr7.Caption         := '';
             qrlUnid7.Caption         := '';
             qrl_P7.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta8.Checked Then begin

             qrl_Referencia8.Caption  := Referencia;
             qrl_Nome8.Caption        := NomeProd;
             qrlUnid8.Caption         := TipoUnidade;
             qrl_Vlr8.Caption         := ValorProd;

           end else begin

             qrl_Referencia8.Caption  := '';
             qrl_Nome8.Caption        := '';
             qrl_Ref8.Caption         := '';
             qrl_Vlr8.Caption         := '';
             qrlUnid8.Caption         := '';
             qrl_P8.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta9.Checked Then begin

             qrl_Referencia9.Caption  := Referencia;
             qrl_Nome9.Caption        := NomeProd;
             qrlUnid9.Caption         := TipoUnidade;
             qrl_Vlr9.Caption         := ValorProd;

           end else begin

             qrl_Referencia9.Caption  := '';
             qrl_Nome9.Caption        := '';
             qrl_Ref9.Caption         := '';
             qrl_Vlr9.Caption         := '';
             qrlUnid9.Caption         := '';
             qrl_P9.Caption           := '';


           end;
          ////////////////////////////////////////////

           if ckEtiqueta10.Checked Then begin

             qrl_Referencia10.Caption  := Referencia;
             qrl_Nome10.Caption        := NomeProd;
             qrlUnid10.Caption         := TipoUnidade;
             qrl_Vlr10.Caption         := ValorProd;

           end else begin

             qrl_Referencia10.Caption  := '';
             qrl_Nome10.Caption        := '';
             qrl_Ref10.Caption         := '';
             qrl_Vlr10.Caption         := '';
             qrlUnid10.Caption         := '';
             qrl_P10.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta11.Checked Then begin

             qrl_Referencia11.Caption  := Referencia;
             qrl_Nome11.Caption        := NomeProd;
             qrlUnid11.Caption         := TipoUnidade;
             qrl_Vlr11.Caption         := ValorProd;

           end else begin

             qrl_Referencia11.Caption  := '';
             qrl_Nome11.Caption        := '';
             qrl_Ref11.Caption         := '';
             qrl_Vlr11.Caption         := '';
             qrlUnid11.Caption         := '';
             qrl_P11.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta12.Checked Then begin

             qrl_Referencia12.Caption  := Referencia;
             qrl_Nome12.Caption        := NomeProd;
             qrlUnid12.Caption         := TipoUnidade;
             qrl_Vlr12.Caption         := ValorProd;

           end else begin

             qrl_Referencia12.Caption  := '';
             qrl_Nome12.Caption        := '';
             qrl_Ref12.Caption         := '';
             qrl_Vlr12.Caption         := '';
             qrlUnid12.Caption         := '';
             qrl_P12.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta13.Checked Then begin

             qrl_Referencia13.Caption  := Referencia;
             qrl_Nome13.Caption        := NomeProd;
             qrlUnid13.Caption         := TipoUnidade;
             qrl_Vlr13.Caption         := ValorProd;

           end else begin

             qrl_Referencia13.Caption  := '';
             qrl_Nome13.Caption        := '';
             qrl_Ref13.Caption         := '';
             qrl_Vlr13.Caption         := '';
             qrlUnid13.Caption         := '';
             qrl_P13.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta14.Checked Then begin

             qrl_Referencia14.Caption  := Referencia;
             qrl_Nome14.Caption        := NomeProd;
             qrlUnid14.Caption         := TipoUnidade;
             qrl_Vlr14.Caption         := ValorProd;

           end else begin

             qrl_Referencia14.Caption  := '';
             qrl_Nome14.Caption        := '';
             qrl_Ref14.Caption         := '';
             qrl_Vlr14.Caption         := '';
             qrlUnid14.Caption         := '';
             qrl_P14.Caption           := '';

           end;
          ////////////////////////////////////////////


           if ckEtiqueta15.Checked Then begin

             qrl_Referencia15.Caption  := Referencia;
             qrl_Nome15.Caption        := NomeProd;
             qrlUnid15.Caption         := TipoUnidade;
             qrl_Vlr15.Caption         := ValorProd;

           end else begin

             qrl_Referencia15.Caption  := '';
             qrl_Nome15.Caption        := '';
             qrl_Ref15.Caption         := '';
             qrl_Vlr15.Caption         := '';
             qrlUnid15.Caption         := '';
             qrl_P15.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta16.Checked Then begin

             qrl_Referencia16.Caption  := Referencia;
             qrl_Nome16.Caption        := NomeProd;
             qrlUnid16.Caption         := TipoUnidade;
             qrl_Vlr16.Caption         := ValorProd;

           end else begin

             qrl_Referencia16.Caption  := '';
             qrl_Nome16.Caption        := '';
             qrl_Ref16.Caption         := '';
             qrl_Vlr16.Caption         := '';
             qrlUnid16.Caption         := '';
             qrl_P16.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta17.Checked Then begin

             qrl_Referencia17.Caption  := Referencia;
             qrl_Nome17.Caption        := NomeProd;
             qrlUnid17.Caption         := TipoUnidade;
             qrl_Vlr17.Caption         := ValorProd;

           end else begin

             qrl_Referencia17.Caption  := '';
             qrl_Nome17.Caption        := '';
             qrl_Ref17.Caption         := '';
             qrl_Vlr17.Caption         := '';
             qrlUnid17.Caption         := '';
             qrl_P17.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta18.Checked Then begin

             qrl_Referencia18.Caption  := Referencia;
             qrl_Nome18.Caption        := NomeProd;
             qrlUnid18.Caption         := TipoUnidade;
             qrl_Vlr18.Caption         := ValorProd;

           end else begin

             qrl_Referencia18.Caption  := '';
             qrl_Nome18.Caption        := '';
             qrl_Ref18.Caption         := '';
             qrl_Vlr18.Caption         := '';
             qrlUnid18.Caption         := '';
             qrl_P18.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta19.Checked Then begin

             qrl_Referencia19.Caption  := Referencia;
             qrl_Nome19.Caption        := NomeProd;
             qrlUnid19.Caption         := TipoUnidade;
             qrl_Vlr19.Caption         := ValorProd;

           end else begin

             qrl_Referencia19.Caption  := '';
             qrl_Nome19.Caption        := '';
             qrl_Ref19.Caption         := '';
             qrl_Vlr19.Caption         := '';
             qrlUnid19.Caption         := '';
             qrl_P19.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta20.Checked Then begin

             qrl_Referencia20.Caption  := Referencia;
             qrl_Nome20.Caption        := NomeProd;
             qrlUnid20.Caption         := TipoUnidade;
             qrl_Vlr20.Caption         := ValorProd;

           end else begin

             qrl_Referencia20.Caption  := '';
             qrl_Nome20.Caption        := '';
             qrl_Ref20.Caption         := '';
             qrl_Vlr20.Caption         := '';
             qrlUnid20.Caption         := '';
             qrl_P20.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta21.Checked Then begin

             qrl_Referencia21.Caption  := Referencia;
             qrl_Nome21.Caption        := NomeProd;
             qrlUnid21.Caption         := TipoUnidade;
             qrl_Vlr21.Caption         := ValorProd;

           end else begin

             qrl_Referencia21.Caption  := '';
             qrl_Nome21.Caption        := '';
             qrl_Ref21.Caption         := '';
             qrl_Vlr21.Caption         := '';
             qrlUnid21.Caption         := '';
             qrl_P21.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta22.Checked Then begin

             qrl_Referencia22.Caption  := Referencia;
             qrl_Nome22.Caption        := NomeProd;
             qrlUnid22.Caption         := TipoUnidade;
             qrl_Vlr22.Caption         := ValorProd;

           end else begin

             qrl_Referencia22.Caption  := '';
             qrl_Nome22.Caption        := '';
             qrl_Ref22.Caption         := '';
             qrl_Vlr22.Caption         := '';
             qrlUnid22.Caption         := '';
             qrl_P22.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta23.Checked Then begin

             qrl_Referencia23.Caption  := Referencia;
             qrl_Nome23.Caption        := NomeProd;
             qrlUnid23.Caption         := TipoUnidade;
             qrl_Vlr23.Caption         := ValorProd;

           end else begin

             qrl_Referencia23.Caption  := '';
             qrl_Nome23.Caption        := '';
             qrl_Ref23.Caption         := '';
             qrl_Vlr23.Caption         := '';
             qrlUnid23.Caption         := '';
             qrl_P23.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta24.Checked Then begin

             qrl_Referencia24.Caption  := Referencia;
             qrl_Nome24.Caption        := NomeProd;
             qrlUnid24.Caption         := TipoUnidade;
             qrl_Vlr24.Caption         := ValorProd;

           end else begin

             qrl_Referencia24.Caption  := '';
             qrl_Nome24.Caption        := '';
             qrl_Ref24.Caption         := '';
             qrl_Vlr24.Caption         := '';
             qrlUnid24.Caption         := '';
             qrl_P24.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta25.Checked Then begin

             qrl_Referencia25.Caption  := Referencia;
             qrl_Nome25.Caption        := NomeProd;
             qrlUnid25.Caption         := TipoUnidade;
             qrl_Vlr25.Caption         := ValorProd;

           end else begin

             qrl_Referencia25.Caption  := '';
             qrl_Nome25.Caption        := '';
             qrl_Ref25.Caption         := '';
             qrl_Vlr25.Caption         := '';
             qrlUnid25.Caption         := '';
             qrl_P25.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta26.Checked Then begin

             qrl_Referencia26.Caption  := Referencia;
             qrl_Nome26.Caption        := NomeProd;
             qrlUnid26.Caption         := TipoUnidade;
             qrl_Vlr26.Caption         := ValorProd;

           end else begin

             qrl_Referencia26.Caption  := '';
             qrl_Nome26.Caption        := '';
             qrl_Ref26.Caption         := '';
             qrl_Vlr26.Caption         := '';
             qrlUnid26.Caption         := '';
             qrl_P26.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta27.Checked Then begin

             qrl_Referencia27.Caption  := Referencia;
             qrl_Nome27.Caption        := NomeProd;
             qrlUnid27.Caption         := TipoUnidade;
             qrl_Vlr27.Caption         := ValorProd;

           end else begin

             qrl_Referencia27.Caption  := '';
             qrl_Nome27.Caption        := '';
             qrl_Ref27.Caption         := '';
             qrl_Vlr27.Caption         := '';
             qrlUnid27.Caption         := '';
             qrl_P27.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta28.Checked Then begin

             qrl_Referencia28.Caption  := Referencia;
             qrl_Nome28.Caption        := NomeProd;
             qrlUnid28.Caption         := TipoUnidade;
             qrl_Vlr28.Caption         := ValorProd;

           end else begin

             qrl_Referencia28.Caption  := '';
             qrl_Nome28.Caption        := '';
             qrl_Ref28.Caption         := '';
             qrl_Vlr28.Caption         := '';
             qrlUnid28.Caption         := '';
             qrl_P28.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta29.Checked Then begin

             qrl_Referencia29.Caption  := Referencia;
             qrl_Nome29.Caption        := NomeProd;
             qrlUnid29.Caption         := TipoUnidade;
             qrl_Vlr29.Caption         := ValorProd;

           end else begin

             qrl_Referencia29.Caption  := '';
             qrl_Nome29.Caption        := '';
             qrl_Ref29.Caption         := '';
             qrl_Vlr29.Caption         := '';
             qrlUnid29.Caption         := '';
             qrl_P29.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta30.Checked Then begin

             qrl_Referencia30.Caption  := Referencia;
             qrl_Nome30.Caption        := NomeProd;
             qrlUnid30.Caption         := TipoUnidade;
             qrl_Vlr30.Caption         := ValorProd;

           end else begin

             qrl_Referencia30.Caption  := '';
             qrl_Nome30.Caption        := '';
             qrl_Ref30.Caption         := '';
             qrl_Vlr30.Caption         := '';
             qrlUnid30.Caption         := '';
             qrl_P30.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta31.Checked Then begin

             qrl_Referencia31.Caption  := Referencia;
             qrl_Nome31.Caption        := NomeProd;
             qrlUnid31.Caption         := TipoUnidade;
             qrl_Vlr31.Caption         := ValorProd;

           end else begin

             qrl_Referencia31.Caption  := '';
             qrl_Nome31.Caption        := '';
             qrl_Ref31.Caption         := '';
             qrl_Vlr31.Caption         := '';
             qrlUnid31.Caption         := '';
             qrl_P31.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta32.Checked Then begin

             qrl_Referencia32.Caption  := Referencia;
             qrl_Nome32.Caption        := NomeProd;
             qrlUnid32.Caption         := TipoUnidade;
             qrl_Vlr32.Caption         := ValorProd;

           end else begin

             qrl_Referencia32.Caption  := '';
             qrl_Nome32.Caption        := '';
             qrl_Ref32.Caption         := '';
             qrl_Vlr32.Caption         := '';
             qrlUnid32.Caption         := '';
             qrl_P32.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta33.Checked Then begin

             qrl_Referencia33.Caption  := Referencia;
             qrl_Nome33.Caption        := NomeProd;
             qrlUnid33.Caption         := TipoUnidade;
             qrl_Vlr33.Caption         := ValorProd;

           end else begin

             qrl_Referencia33.Caption  := '';
             qrl_Nome33.Caption        := '';
             qrl_Ref33.Caption         := '';
             qrl_Vlr33.Caption         := '';
             qrlUnid33.Caption         := '';
             qrl_P33.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta34.Checked Then begin

             qrl_Referencia34.Caption  := Referencia;
             qrl_Nome34.Caption        := NomeProd;
             qrlUnid34.Caption         := TipoUnidade;
             qrl_Vlr34.Caption         := ValorProd;

           end else begin

             qrl_Referencia34.Caption  := '';
             qrl_Nome34.Caption        := '';
             qrl_Ref34.Caption         := '';
             qrl_Vlr34.Caption         := '';
             qrlUnid34.Caption         := '';
             qrl_P34.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta35.Checked Then begin

             qrl_Referencia35.Caption  := Referencia;
             qrl_Nome35.Caption        := NomeProd;
             qrlUnid35.Caption         := TipoUnidade;
             qrl_Vlr35.Caption         := ValorProd;

           end else begin

             qrl_Referencia35.Caption  := '';
             qrl_Nome35.Caption        := '';
             qrl_Ref35.Caption         := '';
             qrl_Vlr35.Caption         := '';
             qrlUnid35.Caption         := '';
             qrl_P35.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta36.Checked Then begin

             qrl_Referencia36.Caption  := Referencia;
             qrl_Nome36.Caption        := NomeProd;
             qrlUnid36.Caption         := TipoUnidade;
             qrl_Vlr36.Caption         := ValorProd;

           end else begin

             qrl_Referencia36.Caption  := '';
             qrl_Nome36.Caption        := '';
             qrl_Ref36.Caption         := '';
             qrl_Vlr36.Caption         := '';
             qrlUnid36.Caption         := '';
             qrl_P36.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta37.Checked Then begin

             qrl_Referencia37.Caption  := Referencia;
             qrl_Nome37.Caption        := NomeProd;
             qrlUnid37.Caption         := TipoUnidade;
             qrl_Vlr37.Caption         := ValorProd;

           end else begin

             qrl_Referencia37.Caption  := '';
             qrl_Nome37.Caption        := '';
             qrl_Ref37.Caption         := '';
             qrl_Vlr37.Caption         := '';
             qrlUnid37.Caption         := '';
             qrl_P37.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta38.Checked Then begin

             qrl_Referencia38.Caption  := Referencia;
             qrl_Nome38.Caption        := NomeProd;
             qrlUnid38.Caption         := TipoUnidade;
             qrl_Vlr38.Caption         := ValorProd;

           end else begin

             qrl_Referencia38.Caption  := '';
             qrl_Nome38.Caption        := '';
             qrl_Ref38.Caption         := '';
             qrl_Vlr38.Caption         := '';
             qrlUnid38.Caption         := '';
             qrl_P38.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta39.Checked Then begin

             qrl_Referencia39.Caption  := Referencia;
             qrl_Nome39.Caption        := NomeProd;
             qrlUnid39.Caption         := TipoUnidade;
             qrl_Vlr39.Caption         := ValorProd;

           end else begin

             qrl_Referencia39.Caption  := '';
             qrl_Nome39.Caption        := '';
             qrl_Ref39.Caption         := '';
             qrl_Vlr39.Caption         := '';
             qrlUnid39.Caption         := '';
             qrl_P39.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta40.Checked Then begin

             qrl_Referencia40.Caption  := Referencia;
             qrl_Nome40.Caption        := NomeProd;
             qrlUnid40.Caption         := TipoUnidade;
             qrl_Vlr40.Caption         := ValorProd;

           end else begin

             qrl_Referencia40.Caption  := '';
             qrl_Nome40.Caption        := '';
             qrl_Ref40.Caption         := '';
             qrl_Vlr40.Caption         := '';
             qrlUnid40.Caption         := '';
             qrl_P40.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta41.Checked Then begin

             qrl_Referencia41.Caption  := Referencia;
             qrl_Nome41.Caption        := NomeProd;
             qrlUnid41.Caption         := TipoUnidade;
             qrl_Vlr41.Caption         := ValorProd;

           end else begin

             qrl_Referencia41.Caption  := '';
             qrl_Nome41.Caption        := '';
             qrl_Ref41.Caption         := '';
             qrl_Vlr41.Caption         := '';
             qrlUnid41.Caption         := '';
             qrl_P41.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta42.Checked Then begin

             qrl_Referencia42.Caption  := Referencia;
             qrl_Nome42.Caption        := NomeProd;
             qrlUnid42.Caption         := TipoUnidade;
             qrl_Vlr42.Caption         := ValorProd;

           end else begin

             qrl_Referencia42.Caption  := '';
             qrl_Nome42.Caption        := '';
             qrl_Ref42.Caption         := '';
             qrl_Vlr42.Caption         := '';
             qrlUnid42.Caption         := '';
             qrl_P42.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta43.Checked Then begin

             qrl_Referencia43.Caption  := Referencia;
             qrl_Nome43.Caption        := NomeProd;
             qrlUnid43.Caption         := TipoUnidade;
             qrl_Vlr43.Caption         := ValorProd;

           end else begin

             qrl_Referencia43.Caption  := '';
             qrl_Nome43.Caption        := '';
             qrl_Ref43.Caption         := '';
             qrl_Vlr43.Caption         := '';
             qrlUnid43.Caption         := '';
             qrl_P43.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta44.Checked Then begin

             qrl_Referencia44.Caption  := Referencia;
             qrl_Nome44.Caption        := NomeProd;
             qrlUnid44.Caption         := TipoUnidade;
             qrl_Vlr44.Caption         := ValorProd;

           end else begin

             qrl_Referencia44.Caption  := '';
             qrl_Nome44.Caption        := '';
             qrl_Ref44.Caption         := '';
             qrl_Vlr44.Caption         := '';
             qrlUnid44.Caption         := '';
             qrl_P44.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta45.Checked Then begin

             qrl_Referencia45.Caption  := Referencia;
             qrl_Nome45.Caption        := NomeProd;
             qrlUnid45.Caption         := TipoUnidade;
             qrl_Vlr45.Caption         := ValorProd;

           end else begin

             qrl_Referencia45.Caption  := '';
             qrl_Nome45.Caption        := '';
             qrl_Ref45.Caption         := '';
             qrl_Vlr45.Caption         := '';
             qrlUnid45.Caption         := '';
             qrl_P45.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta46.Checked Then begin

             qrl_Referencia46.Caption  := Referencia;
             qrl_Nome46.Caption        := NomeProd;
             qrlUnid46.Caption         := TipoUnidade;
             qrl_Vlr46.Caption         := ValorProd;

           end else begin

             qrl_Referencia46.Caption  := '';
             qrl_Nome46.Caption        := '';
             qrl_Ref46.Caption         := '';
             qrl_Vlr46.Caption         := '';
             qrlUnid46.Caption         := '';
             qrl_P46.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta47.Checked Then begin

             qrl_Referencia47.Caption  := Referencia;
             qrl_Nome47.Caption        := NomeProd;
             qrlUnid47.Caption         := TipoUnidade;
             qrl_Vlr47.Caption         := ValorProd;

           end else begin

             qrl_Referencia47.Caption  := '';
             qrl_Nome47.Caption        := '';
             qrl_Ref47.Caption         := '';
             qrl_Vlr47.Caption         := '';
             qrlUnid47.Caption         := '';
             qrl_P47.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta48.Checked Then begin

             qrl_Referencia48.Caption  := Referencia;
             qrl_Nome48.Caption        := NomeProd;
             qrlUnid48.Caption         := TipoUnidade;
             qrl_Vlr48.Caption         := ValorProd;

           end else begin

             qrl_Referencia48.Caption  := '';
             qrl_Nome48.Caption        := '';
             qrl_Ref48.Caption         := '';
             qrl_Vlr48.Caption         := '';
             qrlUnid48.Caption         := '';
             qrl_P48.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta49.Checked Then begin

             qrl_Referencia49.Caption  := Referencia;
             qrl_Nome49.Caption        := NomeProd;
             qrlUnid49.Caption         := TipoUnidade;
             qrl_Vlr49.Caption         := ValorProd;

           end else begin

             qrl_Referencia49.Caption  := '';
             qrl_Nome49.Caption        := '';
             qrl_Ref49.Caption         := '';
             qrl_Vlr49.Caption         := '';
             qrlUnid49.Caption         := '';
             qrl_P49.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta50.Checked Then begin

             qrl_Referencia50.Caption  := Referencia;
             qrl_Nome50.Caption        := NomeProd;
             qrlUnid50.Caption         := TipoUnidade;
             qrl_Vlr50.Caption         := ValorProd;

           end else begin

             qrl_Referencia50.Caption  := '';
             qrl_Nome50.Caption        := '';
             qrl_Ref50.Caption         := '';
             qrl_Vlr50.Caption         := '';
             qrlUnid50.Caption         := '';
             qrl_P50.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta51.Checked Then begin

             qrl_Referencia51.Caption  := Referencia;
             qrl_Nome51.Caption        := NomeProd;
             qrlUnid51.Caption         := TipoUnidade;
             qrl_Vlr51.Caption         := ValorProd;

           end else begin

             qrl_Referencia51.Caption  := '';
             qrl_Nome51.Caption        := '';
             qrl_Ref51.Caption         := '';
             qrl_Vlr51.Caption         := '';
             qrlUnid51.Caption         := '';
             qrl_P51.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta52.Checked Then begin

             qrl_Referencia52.Caption  := Referencia;
             qrl_Nome52.Caption        := NomeProd;
             qrlUnid52.Caption         := TipoUnidade;
             qrl_Vlr52.Caption         := ValorProd;

           end else begin

             qrl_Referencia52.Caption  := '';
             qrl_Nome52.Caption        := '';
             qrl_Ref52.Caption         := '';
             qrl_Vlr52.Caption         := '';
             qrlUnid52.Caption         := '';
             qrl_P52.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta53.Checked Then begin

             qrl_Referencia53.Caption  := Referencia;
             qrl_Nome53.Caption        := NomeProd;
             qrlUnid53.Caption         := TipoUnidade;
             qrl_Vlr53.Caption         := ValorProd;

           end else begin

             qrl_Referencia53.Caption  := '';
             qrl_Nome53.Caption        := '';
             qrl_Ref53.Caption         := '';
             qrl_Vlr53.Caption         := '';
             qrlUnid53.Caption         := '';
             qrl_P53.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta54.Checked Then begin

             qrl_Referencia54.Caption  := Referencia;
             qrl_Nome54.Caption        := NomeProd;
             qrlUnid54.Caption         := TipoUnidade;
             qrl_Vlr54.Caption         := ValorProd;

           end else begin

             qrl_Referencia54.Caption  := '';
             qrl_Nome54.Caption        := '';
             qrl_Ref54.Caption         := '';
             qrl_Vlr54.Caption         := '';
             qrlUnid54.Caption         := '';
             qrl_P54.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta55.Checked Then begin

             qrl_Referencia55.Caption  := Referencia;
             qrl_Nome55.Caption        := NomeProd;
             qrlUnid55.Caption         := TipoUnidade;
             qrl_Vlr55.Caption         := ValorProd;

           end else begin

             qrl_Referencia55.Caption  := '';
             qrl_Nome55.Caption        := '';
             qrl_Ref55.Caption         := '';
             qrl_Vlr55.Caption         := '';
             qrlUnid55.Caption         := '';
             qrl_P55.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta56.Checked Then begin

             qrl_Referencia56.Caption  := Referencia;
             qrl_Nome56.Caption        := NomeProd;
             qrlUnid56.Caption         := TipoUnidade;
             qrl_Vlr56.Caption         := ValorProd;

           end else begin

             qrl_Referencia56.Caption  := '';
             qrl_Nome56.Caption        := '';
             qrl_Ref56.Caption         := '';
             qrl_Vlr56.Caption         := '';
             qrlUnid56.Caption         := '';
             qrl_P56.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta57.Checked Then begin

             qrl_Referencia57.Caption  := Referencia;
             qrl_Nome57.Caption        := NomeProd;
             qrlUnid57.Caption         := TipoUnidade;
             qrl_Vlr57.Caption         := ValorProd;

           end else begin

             qrl_Referencia57.Caption  := '';
             qrl_Nome57.Caption        := '';
             qrl_Ref57.Caption         := '';
             qrl_Vlr57.Caption         := '';
             qrlUnid57.Caption         := '';
             qrl_P57.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta58.Checked Then begin

             qrl_Referencia58.Caption  := Referencia;
             qrl_Nome58.Caption        := NomeProd;
             qrlUnid58.Caption         := TipoUnidade;
             qrl_Vlr58.Caption         := ValorProd;

           end else begin

             qrl_Referencia58.Caption  := '';
             qrl_Nome58.Caption        := '';
             qrl_Ref58.Caption         := '';
             qrl_Vlr58.Caption         := '';
             qrlUnid58.Caption         := '';
             qrl_P58.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta59.Checked Then begin

             qrl_Referencia59.Caption  := Referencia;
             qrl_Nome59.Caption        := NomeProd;
             qrlUnid59.Caption         := TipoUnidade;
             qrl_Vlr59.Caption         := ValorProd;

           end else begin

             qrl_Referencia59.Caption  := '';
             qrl_Nome59.Caption        := '';
             qrl_Ref59.Caption         := '';
             qrl_Vlr59.Caption         := '';
             qrlUnid59.Caption         := '';
             qrl_P59.Caption           := '';

           end;
          ////////////////////////////////////////////

           if ckEtiqueta60.Checked Then begin

             qrl_Referencia60.Caption  := Referencia;
             qrl_Nome60.Caption        := NomeProd;
             qrlUnid60.Caption         := TipoUnidade;
             qrl_Vlr60.Caption         := ValorProd;

           end else begin

             qrl_Referencia60.Caption  := '';
             qrl_Nome60.Caption        := '';
             qrl_Ref60.Caption         := '';
             qrl_Vlr60.Caption         := '';
             qrlUnid60.Caption         := '';
             qrl_P60.Caption           := '';

           end;
          ////////////////////////////////////////////

        // end;{if}

            qrp6089Nome.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmEtiquetasNome6089.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

    end;//if ckcomnome
  //////////////////////////////////////////////////////////////


  end;{if}

  end;{with}


end;

end.
