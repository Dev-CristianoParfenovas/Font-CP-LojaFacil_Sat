unit untBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  ShellApi, ComCtrls;

type
  TfrmBackup = class(TForm)
    lbl_DataBKP: TLabel;
    StatusBar1: TStatusBar;
    progBarBKP: TProgressBar;
    dtpDataBkp: TDateTimePicker;
    lbl_edtOrigem: TLabeledEdit;
    lbl_edtDestino: TLabeledEdit;
    procedure ibeaSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibeaExecutarClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;
  Origem,Destino : String;
implementation

{$R *.dfm}

procedure TfrmBackup.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmBackup.FormCreate(Sender: TObject);

begin

  Origem  := ExtractFilePath(ParamStr(0));
  //Destino := ExtractFilePath(ParamStr(0));

end;

procedure TfrmBackup.FormShow(Sender: TObject);

begin

dtpDataBkp.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

lbl_edtOrigem.Text := (Origem+'Dados\LOJA.fdb');
lbl_edtDestino.Text := ('C:\BKP_CPSistemas');

end;

procedure TfrmBackup.ibeaExecutarClick(Sender: TObject);

var
Dados: TSHFileOpStruct;
origem, destino: String;
i : Integer;
begin


    //  Data := StrToDate(FormatDateTime('mm/dd/yyyy',dtpDataBkp.Date));
    //  DataBKP := DateToStr(Data);

      origem:=lbl_edtOrigem.Text;
      destino:=lbl_edtDestino.Text;

      If (lbl_edtOrigem.Text<>'') and (lbl_edtDestino.Text<>'') then
      begin
        FillChar(Dados,SizeOf(Dados), 0);
////////////////////////////////////////////////////////////////////////////////

          for i := progBarBKP.Min to progBarBKP.Max do begin
          { Atualiza a posi��o da ProgressBar }
          progBarBKP.Position := i;
          { Repinta a StatusBar para for�ar a atualiza��o visual }
          StatusBar1.Repaint;
          { Aguarda 50 milisegundos }
          Sleep(50);
          end;

          { Aguarde 500 milisegundos }
          Sleep(500);
          { Reseta (zera) a ProgressBar }
          progBarBKP.Position := progBarBKP.Min;
          { Repinta a StatusBar para for�ar a atualiza��o visual }
          StatusBar1.Repaint;

////////////////////////////////////////////////////////////////////////////////


        with Dados do
        begin
          wFunc := FO_COPY;
          pFrom := PChar(origem);
          pTo := PChar(destino);
          fFlags:= FOF_ALLOWUNDO;
        end;

        SHFileOperation(Dados);

        ShowMessage('Processo finalizado. Verifique se sua c�pia foi realizada corretamente.');
      end
      else
      begin
        ShowMessage('Preencha corretamente os caminhos de origem e destino.');
        lbl_edtOrigem.SetFocus;
      end;

end;

procedure TfrmBackup.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  { Se for o primeiro painel... }
  if Panel.Index = 0 then begin
  { Ajusta a tamanho da ProgressBar de acordo com
  o tamanho do painel }
  progBarBKP.Width := Rect.Right - Rect.Left +1;
  progBarBKP.Height := Rect.Bottom - Rect.Top +1;
  { Pinta a ProgressBar no DC (device-context) da StatusBar }
  progBarBKP.PaintTo(StatusBar.Canvas.Handle, Rect.Left, Rect.Top);
  end;
end;

end.
