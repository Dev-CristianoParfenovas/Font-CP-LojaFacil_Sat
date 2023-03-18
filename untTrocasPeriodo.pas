unit untTrocasPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, IBQuery, ComCtrls, StdCtrls,
  BmsXPButton, Data.DB;

type
  TfrmTrocasPeriodo = class(TForm)
    dbgTrocas: TDBGrid;
    lbl_DataIni: TLabel;
    lbl_DataF: TLabel;
    lbl_F2: TLabel;
    dtpDataIniGeral: TDateTimePicker;
    dtpDataFimGeral: TDateTimePicker;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure FormShow(Sender: TObject);
    procedure SELECTTroca;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ibeaSairClick(Sender: TObject);
    procedure dtpDataFimGeralChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrocasPeriodo: TfrmTrocasPeriodo;
  MontaColunas : Boolean;
implementation

uses untdmModule, funcPosto, DB;

{$R *.dfm}

procedure TfrmTrocasPeriodo.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmTrocasPeriodo.SELECTTroca;

begin

  with dmModule do begin

    Commit(ibRecVendas);
    ibRecVendas.Close;                                                                                           //  and SITUACAOVENDA<> ''Pendente''
    ibRecVendas.SQL.Clear;
    ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.*,CADPRODUTOS.NOME As Produto,'
    + 'TBLUSER.NOME As Vendedor FROM TBLRECEBEVENDAS '
    + 'INNER JOIN CADPRODUTOS ON TBLRECEBEVENDAS.IDPROD=CADPRODUTOS.IDPROD '
    + 'INNER JOIN TBLUSER ON TBLRECEBEVENDAS.IDVENDEDOR=TBLUSER.IDUSER WHERE (DATA between :ParamDataInicial and :ParamDataFinal)and TROCAMERCADORIA=''Sim''');// and TBLRECEBEVENDAS.IDVENDEDOR=''' + IntToStr(ClassVendedor.ID) + '''');
    ibRecVendas.Open;

    ibRecVendas.Close;
    ibRecVendas.ParamByName('ParamDataInicial').Value      := dtpDataIniGeral.DateTime;
    ibRecVendas.ParamByName('ParamDataFinal').Value        := dtpDataFimGeral.DateTime;
    ibRecVendas.Open;

    (ibRecVendas.FieldByName('VLRTROCA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
    

  end;//with

end;


procedure TfrmTrocasPeriodo.FormShow(Sender: TObject);
begin

  dtpDataIniGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFimGeral.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin

  SELECTTroca;
////////////////////////////////////////////////////////////////////////////////

   with dbgTrocas do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

      DataSource := dmModule.dtsRecVendas;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o C�digo da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'Produto';
        Columns.Items[0].Width         := 230;
        Columns.Items[0].Alignment     := taLeftJustify;

       //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Vlr.Troca';
        Columns.Items[1].FieldName     := 'VLRTROCA';
        Columns.Items[1].Width         := 100;
        Columns.Items[1].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[2].Title.Caption := 'Vendedor';
        Columns.Items[2].FieldName     := 'Vendedor';
        Columns.Items[2].Width         := 100;
        Columns.Items[2].Alignment     := taLeftJustify;


        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[3].Title.Caption := 'Data';
        Columns.Items[3].FieldName     := 'DATA';
        Columns.Items[3].Width         := 100;
        Columns.Items[3].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Obs.';
        Columns.Items[4].FieldName     := 'OBSTROCA';
        Columns.Items[4].Width         := 300;
        Columns.Items[4].Alignment     := taLeftJustify;


        MontaColunas := False;

      end;{if}

    end;{with}
////////////////////////////////////////////////////////////////////////////////

  end;//with

end;

procedure TfrmTrocasPeriodo.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmTrocasPeriodo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case key of

    VK_F2 :begin

      Close;

    end;//begin

  end;

end;

procedure TfrmTrocasPeriodo.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmTrocasPeriodo.dtpDataFimGeralChange(Sender: TObject);
begin

  with dmModule do begin

    SELECTTroca;

  end;//with

end;

end.
