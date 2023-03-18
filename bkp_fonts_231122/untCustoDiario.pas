unit untCustoDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, mxFlatControls, ComCtrls, Grids, DBGrids, BmsXPButton;

type
  TfrmCustoDiario = class(TForm)
    lbl_edtDescricao: TmxFlatEdit;
    lbl_Descricao: TLabel;
    lbl_edtVlrCusto: TmxFlatEdit;
    lbl_ValorCusto: TLabel;
    dtpData: TmxFlatDateTimePicker;
    lbl_Data: TLabel;
    ibeaSair: TBmsXPButton;
    dbgContasaPagar: TDBGrid;
    dtpDataIni: TmxFlatDateTimePicker;
    dtpDataF: TmxFlatDateTimePicker;
    lbl_DTF: TLabel;
    lbl_DTIni: TLabel;
    memoObs: TmxFlatMemo;
    lbl_Obs: TLabel;
    ibeaIncluir: TBmsXPButton;
    ibeaLimpar: TBmsXPButton;
    ibeaAlterarCP: TBmsXPButton;
    ibeaExcluirCP: TBmsXPButton;
    lbl_edtTotal: TmxFlatEdit;
    lbl_Total: TLabel;
    procedure ibeaSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCustoDiario: TfrmCustoDiario;

implementation

{$R *.dfm}

procedure TfrmCustoDiario.ibeaSairClick(Sender: TObject);
begin
Close
end;

end.
