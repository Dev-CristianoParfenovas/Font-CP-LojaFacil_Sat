unit untCriaCodBarras;

interface


implementation

Procedure CriaCodigo(Cod : String; Imagem : TCanvas);

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
  a,b,c,d : String;
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

end.
 