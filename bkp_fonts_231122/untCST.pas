unit untCST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, IBQuery;

type
  TfrmCST = class(TForm)
    btSair: TSpeedButton;
    btAlterar: TSpeedButton;
    btGravar: TSpeedButton;
    lbl_edtCodCST: TLabeledEdit;
    lbl_edtDescrCST: TLabeledEdit;
    btExcluir: TSpeedButton;
    dbgCST: TDBGrid;
    procedure btSairClick(Sender: TObject);
    procedure lbl_edtCodCSTEnter(Sender: TObject);
    procedure lbl_edtDescrCSTEnter(Sender: TObject);
    procedure lbl_edtCodCSTExit(Sender: TObject);
    procedure lbl_edtDescrCSTExit(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExibeDados;
    procedure SelectCST;
    procedure lbl_edtCodCSTKeyPress(Sender: TObject; var Key: Char);
    procedure LimparCampos;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GravarCST;
    procedure btGravarClick(Sender: TObject);
    procedure dbgCSTCellClick(Column: TColumn);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCST: TfrmCST;
  intIDCST: Integer;
  MontaColunas: Boolean;
  
implementation

uses untdmModule;

{$R *.dfm}

procedure TfrmCST.btSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCST.lbl_edtCodCSTEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmCST.lbl_edtDescrCSTEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmCST.lbl_edtCodCSTExit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure TfrmCST.lbl_edtDescrCSTExit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure TfrmCST.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmCST.ExibeDados;

begin

  with dmModule do begin

  intIDCST := ibCST.FieldByName('IDCST').AsInteger;

    if ibCST.RecordCount > 0 Then begin

      lbl_edtCodCST.Text := ibCST.FieldByName('CODIGO_CST').AsString;
      lbl_edtDescrCST.Text := ibCST.FieldByName('DESCRICAOCST').AsString;

    end;//if record count

  end;//with

end;

procedure TfrmCST.SelectCST;

begin

  with dmModule do begin

    ibCST.Close;
    ibCST.SQL.Clear;
    ibCST.SQL.Add('SELECT * FROM TBL_CST ORDER BY CODIGO_CST');
    ibCST.Open;

  end;//with

end;

procedure TfrmCST.lbl_edtCodCSTKeyPress(Sender: TObject; var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtDescrCST.SetFocus;

  end;

end;

procedure TfrmCST.LimparCampos;

begin

  lbl_edtCodCST.Clear;
  lbl_edtDescrCST.Clear;

end;

procedure TfrmCST.FormShow(Sender: TObject);
begin

  with dmModule do begin

    SelectCST;
    LimparCampos;
    
    with dbgCST do begin

      if MontaColunas Then begin

        DataSource := dmModule.dtsCST;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Código CST';
        Columns.Items[0].FieldName     := 'CODIGO_CST';
        Columns.Items[0].Width         := 80;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[1].Title.Caption := 'Descrição CST';
        Columns.Items[1].FieldName     := 'DESCRICAOCST';
        Columns.Items[1].Width         := 380;
        Columns.Items[1].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;//if monta colunas;

    end;//with

  end;//with

end;

procedure TfrmCST.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmCST.GravarCST;

begin

  with dmModule do begin

      ibCST.Close;
      ibCST.SQL.Clear;
      ibCST.SQL.Add('INSERT INTO TBL_CST'
      + '(CODIGO_CST,DESCRICAOCST) values '
      + '(''' + lbl_edtCodCST.Text + ''','
      + ' ''' + lbl_edtDescrCST.Text + ''')');
      ibCST.ExecSQL;
      Commit(ibCST);

      SelectCST;

      LimparCampos;

  end;//with

end;

procedure TfrmCST.btGravarClick(Sender: TObject);
begin

  with dmModule do begin

    GravarCST;

  end;//with

end;

procedure TfrmCST.dbgCSTCellClick(Column: TColumn);
begin

  with dmModule do begin

    ExibeDados;
    
  end;//with
  
end;

procedure TfrmCST.btAlterarClick(Sender: TObject);

var

ConfirmaAlteracao : Integer;

begin


  with dmModule do begin

  ConfirmaAlteracao := Application.MessageBox('Confirma a alteração','Alteração de Registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaAlteracao = 6 Then begin

      ibCST.Close;
      ibCST.SQL.Clear;
      ibCST.SQL.Add('UPDATE TBL_CST SET '
      + 'CODIGO_CST = ''' + lbl_edtCodCST.Text + ''','
      + 'DESCRICAOCST = ''' + lbl_edtDescrCST.Text + ''' WHERE IDCST=''' + IntToStr(intIDCST) + '''');
      ibCST.ExecSQL;
      Commit(ibCST);
      SelectCST;
      LimparCampos;

    end;//if

  end;//with

end;

procedure TfrmCST.btExcluirClick(Sender: TObject);

var
ConfirmaExclusao : Integer;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Confirma Exclusão do registro?','Exclusão de registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      ibCST.Close;
      ibCST.SQL.Clear;
      ibCST.SQL.Add('DELETE FROM TBL_CST WHERE IDCST=''' + IntToStr(intIDCST) + '''');
      ibCST.ExecSQL;

    end;//if

    SelectCST;
    LimparCampos;


  end;//with


end;

end.
