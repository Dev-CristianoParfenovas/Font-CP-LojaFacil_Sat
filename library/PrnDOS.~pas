unit PrnDOS;
{ 
  BY: Paulo César de Carvalho
  Dezembro de 2004.

  Esta unidade foi criada para facilitar a impressão em modo texto.

}

  interface

  uses SysUtils, Printers, Dialogs;

type
   TPrnDOS = Object
    FPrnDOS : TextFile;
    Port    : String;
    Page,
    pRow,
    pCol    : Integer;

    procedure Print;
    procedure NewPage;
    procedure CharSay(Linha, Coluna: Integer; Texto: String);
    procedure CharValSay(Linha, Coluna: Integer; Valor: Real;
                         Tamanho: Integer; Decimais : Integer = 2);
    procedure CmpSay(Linha, Coluna: Integer; Texto: String);
    procedure CmpValSay(Linha, Coluna: Integer; Valor: Real;
                        Tamanho: Integer; Decimais : Integer = 2);
    procedure EndPage;
    procedure EndPrint;
   end;

implementation

{ A função PortDefaultPrinter retorna a porta de impressão selecionada
  através do componente PrintDialog }
function PortDefaultPrinter: String;
var
  Driver, Port, Device: String;
  DeviceMode: THandle;
begin
  SetLength(Driver,255);
  SetLength(Port,255);
  SetLength(Device,255);
  Printer.GetPrinter(PChar(Device), PChar(Driver), PChar(Port), DeviceMode);
  Printer.Canvas.Font.Name := 'Draft 10cpi';
  Result := Port;
end;

{ O procedimento Print inicia a impressão }
procedure TPrnDOS.Print;
begin
     Port := PortDefaultPrinter; //Porta selecionada em PrintDialog
     AssignFile(FPrnDOS,Port);
     Rewrite(FPrnDOS);
     Page := 0;
     pRow := 0;
     pCol := 0;
end;

{ O procedimento NewPage incrementa o número de páginas
  e zera as variáveis de controle de linha e coluna }
procedure TPrnDOS.NewPage;
begin
     Inc(Page);
     pRow := 0;
     pCol := 0;
end;

{ O procedimento CharSay imprime um texto na linha e coluna informada }
procedure TPrnDOS.CharSay(Linha, Coluna:Integer; Texto:String);
begin
  Linha := Abs(Linha);
  Coluna := Abs(Coluna);
  if Linha > pRow then begin
     pCol := 0;
     while Linha > pRow do begin
       Inc(pRow);
       WriteLn(FPrnDOS,#18);
     end;
  end;
  while Coluna > pCol do begin
     Inc(pCol);
     Write(FPrnDOS,#18+#32);
  end;
  Write(FPrnDOS, Texto);
  pCol := pCol + Length(Texto);
end;

{ O procedimento CharValSay imprime um valor na linha e coluna informada,
  de acordo com o tamanho e número de decimais }
procedure TPrnDOS.CharValSay(Linha, Coluna: Integer; Valor: Real;
                       Tamanho: Integer; Decimais : Integer = 2);
var
  Texto: String;
begin
  Str(Valor:Tamanho:Decimais,Texto);
  Linha := Abs(Linha);
  Coluna := Abs(Coluna);
  if Linha > pRow then begin
     pCol := 0;
     while Linha > pRow do begin
       Inc(pRow);
       WriteLn(FPrnDOS,#18);
     end;
  end;
  while Coluna > pCol do begin
     Inc(pCol);
     Write(FPrnDOS,#18+#32);
  end;
  Write(FPrnDOS, Texto);
  pCol := pCol + Tamanho;
end;

{ O procedimento CmpSay é idêntico a CharSay, simplesmente,
  comprimindo o texto }
Procedure TPrnDOS.CmpSay(Linha, Coluna:Integer; Texto:String);
begin
  Linha  := Abs(Linha);
  Coluna := Abs(Coluna);
  if Linha > pRow then begin
     pCol:= 0;
     while Linha > pRow do begin
       Inc(pRow);
       WriteLn(FPrnDOS,#15);
     end;
  end;
  while Coluna > pCol do begin
     Inc(pCol);
     Write(FPrnDOS,#15+#32);
  end;
  Write(FPrnDos, #15+Texto+#18);
  pCol := pCol + Length(Texto);
end;

{ O procedimento CmpValSay é idêntico a CharValSay, simplesmente
  comprimindo o valor }
procedure TPrnDOS.CmpValSay(Linha, Coluna: Integer; Valor: Real;
                      Tamanho: Integer; Decimais : Integer = 2);
var
  Texto : String;
begin
  Str(Valor:Tamanho:Decimais,Texto);
  Linha  := Abs(Linha);
  Coluna := Abs(Coluna);
  if Linha > pRow then begin
     pCol:= 0;
     while Linha > pRow do begin
       Inc(pRow);
       WriteLn(FPrnDOS,#15);
     end;
  end;
  while Coluna > pCol do begin
     Inc(pCol);
     Write(FPrnDOS,#15+#32);
  end;
  Write(FPrnDos,#15+Texto);
  pCol := pCol + Tamanho;
end;

{ O procedimento EndPage zera as variáveis de Linha e Coluna
  e ejecta a página }
procedure TPrnDOS.EndPage;
begin
  pRow := 0;
  pCol := 0;
  WriteLn(FPrnDOS, #12);   { Eject }
end;

{ O procedimento EndPrint encerra a impressão }
procedure TPrnDOS.EndPrint;
begin
  //Encerra a impressão
  Port := '';
  Page := 0;
  pRow := 0;
  pCol := 0;

  CloseFile(FPrnDOS);
end;

end.
