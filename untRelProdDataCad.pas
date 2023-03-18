unit untRelProdDataCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, IBQuery, Buttons;

type
  TfrmProdDataRegistro = class(TForm)
    lbl_DTIni: TLabel;
    lbl_DTF: TLabel;
    dtpDataIni: TDateTimePicker;
    dtpDataF: TDateTimePicker;
    ibeaVisualizar: TSpeedButton;
    ibeaSair: TSpeedButton;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ibeaVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdDataRegistro: TfrmProdDataRegistro;

implementation

uses untdmModule, untRelProd, untRelProdCad, funcPosto;

{$R *.dfm}

procedure TfrmProdDataRegistro.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmProdDataRegistro.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmProdDataRegistro.ibeaVisualizarClick(Sender: TObject);
begin

  with dmModule do begin

    Commit(ibProdutos);
    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE (DATACADASTRO between :ParamDataIni and :ParamDataF) ORDER BY NOME');
    ibProdutos.Open;

    ibProdutos.Close;
    ibProdutos.ParamByName('ParamDataIni').Value := dtpDataIni.DateTime;
    ibProdutos.ParamByName('ParamDataF').Value   := dtpDataF.DateTime;
    ibProdutos.Open;

    Application.CreateForm(TfrmRelProdDataCad, frmRelProdDataCad);

    TRY

      with frmRelProdDataCad do begin

        frmRelProdDataCad.qrpProdutos.DataSet := ibProdutos;


        //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
        qrdbCodigo.DataSet    := ibProdutos;
        qrdbCodigo.DataField  := ibProdutos.FieldByName('REF').FieldName;

       { qrdbCodbarras.DataSet     := ibProdutos;
        qrdbCodBarras.DataField   := ibProdutos.FieldByName('CODBARRAS').FieldName; }

        qrdbDescricao.DataSet       := ibProdutos;
        qrdbDescricao.DataField     := ibProdutos.FieldByName('NOME').FieldName;

        qrdbDataCadastro.DataSet       := ibProdutos;
        qrdbDataCadastro.DataField     := ibProdutos.FieldByName('DATACADASTRO').FieldName;

        qrdbValorVenda.DataSet    := ibProdutos;
        qrdbValorVenda.DataField  := ibProdutos.FieldByName('VALORVENDAA').FieldName;

      // (ibProdutos.FieldByName('VALORCUSTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
        (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO }

        qrpProdutos.Preview;
       // qrpProdutos
      end; {if}


    EXCEPT
      on E : Exception do begin
         frmRelProdDataCad.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;
  //////////////////////////////////////////////////////////////

  end;{with}

end;

procedure TfrmProdDataRegistro.FormShow(Sender: TObject);
begin
  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataF.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

end;

end.
