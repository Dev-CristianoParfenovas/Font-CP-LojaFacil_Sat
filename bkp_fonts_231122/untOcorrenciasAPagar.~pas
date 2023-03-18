unit untOcorrenciasAPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, IBEAntialiasButton, IBQuery;

type
  TfrmServicosAPagar = class(TForm)
    ibeaIncluir: TIBEAntialiasButton;
    ibeaAlterar: TIBEAntialiasButton;
    ibeaExcluir: TIBEAntialiasButton;
    ibeaSair: TIBEAntialiasButton;
    lbl_edtNome: TLabeledEdit;
    dbgContasAPagar: TDBGrid;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTServicos;
    procedure GravaServicos;
    procedure AlteraServicos;
    procedure DeletaServicos;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure dbgContasAPagarCellClick(Column: TColumn);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServicosAPagar: TfrmServicosAPagar;
  MontaColunas : Boolean;
  IDServicos : Integer;

implementation

uses untdmModule, DB;

{$R *.dfm}

procedure TfrmServicosAPagar.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmServicosAPagar.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmServicosAPagar.ExecSELECTServicos;

begin

  with dmModule do begin

    ibServicos.Close;
    ibServicos.SQL.Clear;
    ibServicos.SQL.Add('SELECT * FROM TBLSERVICOSAPAGAR');
    ibServicos.Open;

  end;{with}

end;
procedure TfrmServicosAPagar.GravaServicos;

var

ConfirmaRegistro : Integer;

begin

  with dmModule do begin

  ConfirmaRegistro := Application.MessageBox('Confirma o Registro?','Inclusão de Registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaRegistro = 6 Then begin

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('INSERT INTO TBLSERVICOSAPAGAR'
      + '(TIPO) values '
      + '(''' + lbl_edtNome.Text + ''')');
      ibServicos.ExecSQL;
      Commit(ibServicos);

      ExecSELECTServicos;
      lbl_edtNome.Clear;

    end;//if
      lbl_edtNome.SetFocus;
  end;//with

end;

procedure TfrmServicosAPagar.AlteraServicos;

var
ConfirmaAlteracao : Integer;

begin

  with dmModule do begin

    ConfirmaAlteracao := Application.MessageBox('Confirma a Alteração?','Alteração de Registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaAlteracao = 6 Then begin

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('UPDATE TBLSERVICOSAPAGAR SET '
      + 'TIPO = ''' + lbl_edtNome.Text + ''' WHERE IDSERVICO=''' + InttoStr(IDServicos) + '''');
      ibServicos.ExecSQL;
      Commit(ibServicos);

      ExecSELECTServicos;
      lbl_edtNome.Clear;

    end;//if

      lbl_edtNome.SetFocus;

  end;//with

end;

procedure TfrmServicosAPagar.DeletaServicos;

var

ConfirmaExclusao : Integer;

begin

  with dmModule do begin

    ConfirmaExclusao := Application.MessageBox('Confirma a Exclusão do Registro?','Exclusão de Registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('DELETE FROM TBLSERVICOSAPAGAR WHERE IDSERVICO=''' + InttoStr(IDServicos) + '''');
      ibServicos.ExecSQL;
      Commit(ibServicos);

      ExecSELECTServicos;
      lbl_edtNome.Clear;

    end;//if

      lbl_edtNome.SetFocus;

  end;//with

end;

procedure TfrmServicosAPagar.FormShow(Sender: TObject);
begin

  lbl_edtNome.Clear;
  lbl_edtNome.SetFocus;
  
  with dmModule do begin

    ExecSELECTServicos;

    with dbgContasAPagar do begin

      if MontaColunas Then begin

      DataSource := dmModule.dtsServicos;

        //determina as colunas a serem montadas
        Columns.Insert(0);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Descrição';
        Columns.Items[0].FieldName     := 'TIPO';
        Columns.Items[0].Width         := 170;
        Columns.Items[0].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;//if monta colunas;

    end;//with

  end;//with

end;

procedure TfrmServicosAPagar.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmServicosAPagar.ibeaIncluirClick(Sender: TObject);
begin

  with dmModule do begin

    GravaServicos;

  end;//with

end;

procedure TfrmServicosAPagar.dbgContasAPagarCellClick(Column: TColumn);
begin

  with dmModule do begin

    IDServicos:= ibServicos.FieldByName('IDSERVICO').AsInteger;

    if ibServicos.RecordCount > 0 Then begin

      lbl_edtNome.Text := ibServicos.FieldByName('TIPO').AsString;

    end;//if recordcount

  end;//with

end;

procedure TfrmServicosAPagar.ibeaAlterarClick(Sender: TObject);
begin

  with dmModule do begin

    AlteraServicos;

  end;//with

end;

procedure TfrmServicosAPagar.ibeaExcluirClick(Sender: TObject);
begin

  with dmModule do begin

    DeletaServicos;

  end;//with

end;

end.
