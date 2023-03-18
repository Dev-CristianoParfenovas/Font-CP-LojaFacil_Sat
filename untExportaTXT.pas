unit untExportaTXT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BmsXPTopBar, Buttons, StdCtrls, ComCtrls, IBQuery;

type
  TfrmExportaTXT = class(TForm)
    dtpDataIni: TDateTimePicker;
    lbl_DTData: TLabel;
    lbl_Explicacao: TLabel;
    sbExportar: TSpeedButton;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    edtCaminho: TLabeledEdit;
    dtpDataF: TDateTimePicker;
    Label1: TLabel;
    function PadR(cStr: String; nSize: Integer; cCar: String): String;
    function Converte(cmd: String): String;
    procedure sbSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure sbExportarClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportaTXT: TfrmExportaTXT;

implementation

uses untdmModule, MaskUtils, DB, funcPosto, untProdutos_MPrima;


{$R *.dfm}


function TFrmExportaTXT.PadR(cStr: String; nSize: Integer; cCar: String): String;
var
  nFor, nAux: Integer;
  cAux: String;
begin
  cAux := Trim(cStr);
  nAux := Abs(Length(cAux)-nSize)-1;
  for nFor := 0 to nAux do
    cAux := cAux+cCar;
  Result := cAux;
end;

function TfrmExportaTXT.Converte(cmd: String): String;
var A : Integer ;
begin
  Result := '' ;
  For A := 1 to length( cmd ) do
  begin
     if not (cmd[A] in ['A'..'Z','a'..'z','0'..'9',
                        ' ','.',',','/','?','<','>',';',':',']','[','{','}',
                        '\','|','=','+','-','_',')','(','*','&','^','%','$',
                        '#','@','!','~',']' ]) then
        Result := Result + '#' + IntToStr(ord( cmd[A] )) + ' '
     else
        Result := Result + cmd[A] + ' ';
  end ;
end;

procedure TfrmExportaTXT.sbSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmExportaTXT.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmExportaTXT.sbExportarClick(Sender: TObject);

var

AvisoExport,I, IDProduto,IntValor : Integer;
Caminho,VlrConvertido,VlrConvertido2,NomeUnidVenda,ValidadeProd : String;   //Variável Responsável pelo caminho do nosso arquivo
mArq    : TextFile; //É o nosso arquivo em si
ValorVenda : Real;
begin

  with dmModule do begin

    AvisoExport := Application.MessageBox('Atenção!Este procedimento exporta valores conforme data de alteração,deseja continuar','Alteração de Preços na balança',+MB_YESNO+MB_DEFBUTTON1+MB_ICONINFORMATION);

    if AvisoExport = 6 Then begin

      Commit(ibProdutos);
      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE(CADPRODUTOS.DATAALTERACAO between :ParamDataIni and :ParamDataF)');
      ibProdutos.Open;

      ibProdutos.Close;
      ibProdutos.ParamByName('ParamDataIni').Value      := dtpDataIni.DateTime;
      ibProdutos.ParamByName('ParamDataF').Value        := dtpDataF.DateTime;
      ibProdutos.Open;

        Caminho := edtCaminho.Text; //A variável recebe o endereço do arquivo txt escrito no Edit
        AssignFile(mArq, Caminho); //Cria-se o Arquivo
        Rewrite(mArq); //Abre-o para gravação
      

       /// ProgressBar1.Max := ibProdutos.RecordCount; //Conta os registros e informa ao progressBar
        while not ibProdutos.Eof do //Enquanto não chegar ao fim da tabela

        Begin

          VlrConvertido := '';

          ValidadeProd  := ibProdutos.FieldByName('VALIDADEPROD').AsString;
          NomeUnidVenda := ibProdutos.FieldByName('NOMEUNIDVENDA').AsString;

          ValorVenda := (ibProdutos.FieldByName('VALORVENDAA').AsFloat);

            VlrConvertido :=  VlrConvertido + FormatFloat('0000000',ValorVenda *100);

            VlrConvertido2 := VlrConvertido;




          if NomeUnidVenda = 'KG' Then begin

           { Writeln(mArq,
            (ibProdutos.FieldByName('CODBARRAS').AsString)+'p'+(ibProdutos.FieldByName('NOME').AsString)+
            '      '+VlrConvertido2); }


            Writeln( marq ,
              Padr(Copy(ibProdutos.FieldByName('CODBARRAS').AsString , 1 , 6), 6 , ' ') +
              Padr(Copy('p'+ibProdutos.FieldByName('NOME').AsString , 1, 23), 23 , ' ') +
              Padr(Copy(VlrConvertido2 , 1 , 30), 30 , ' ') + ' ' );
              ///Padr(Copy(ValidadeProd , 1 , 37), 37 , ' ') + ' ' );
          end;

          if NomeUnidVenda = 'UN' Then begin

            {Writeln(mArq,
            (ibProdutos.FieldByName('CODBARRAS').AsString)+'u'+(ibProdutos.FieldByName('NOME').AsString)+
            '       '+VlrConvertido2);}
            Writeln( marq ,
              Padr(Copy(ibProdutos.FieldByName('CODBARRAS').AsString , 1 , 6), 6 , ' ') +
              Padr(Copy('u'+ibProdutos.FieldByName('NOME').AsString , 1, 23), 23 , ' ') +
              Padr(Copy(VlrConvertido2 , 1 , 30), 30 , ' ') + ' ' );
              ///Padr(Copy(ValidadeProd , 1 , 37), 37 , ' ') + ' ' );
          end;

         /// ProgressBar1.Position := ProgressBar1.Position + 1;
          ibProdutos.Next; //Vai para o Próximo registro
         /// Application.ProcessMessages;
        End;

        CloseFile(mArq);
        ShowMessage('Processo Concluído!!!');

    end;//if

  end;//with

end;

procedure TfrmExportaTXT.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  { Se for o primeiro painel... }
  if Panel.Index = 0 then begin
  { Ajusta a tamanho da ProgressBar de acordo com
  o tamanho do painel }
  ProgressBar1.Width := Rect.Right - Rect.Left +1;
  ProgressBar1.Height := Rect.Bottom - Rect.Top +1;
  { Pinta a ProgressBar no DC (device-context) da StatusBar }
  ProgressBar1.PaintTo(StatusBar.Canvas.Handle, Rect.Left, Rect.Top);
  end;
end;

procedure TfrmExportaTXT.FormShow(Sender: TObject);
begin
dtpDataIni.DateTime    := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
dtpDataF.DateTime      := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
//edtCaminho.Text := frmProd_MPrima.lbl_edtCaminhoTxt.Text;
end;

end.
