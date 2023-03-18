unit untCSOSN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, IBQuery, Data.DB;

type
  TfrmCSOSN = class(TForm)
    btGravar: TSpeedButton;
    btAlterar: TSpeedButton;
    btExcluir: TSpeedButton;
    btSair: TSpeedButton;
    lbl_edtCodCSOSN: TLabeledEdit;
    lbl_edtDescrCSOSN: TLabeledEdit;
    dbgCSOSN: TDBGrid;
    procedure lbl_edtCodCSOSNEnter(Sender: TObject);
    procedure lbl_edtDescrCSOSNEnter(Sender: TObject);
    procedure lbl_edtCodCSOSNExit(Sender: TObject);
    procedure lbl_edtDescrCSOSNExit(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExibeDados;
    procedure SelectCSOSN;
    procedure lbl_edtCodCSOSNKeyPress(Sender: TObject; var Key: Char);
    procedure LimparCampos;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GravarCSOSN;
    procedure btGravarClick(Sender: TObject);
    procedure dbgCSOSNCellClick(Column: TColumn);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCSOSN: TfrmCSOSN;
  MontaColunas: Boolean;
  intIDCSOSN : Integer;
  
implementation

uses untdmModule;

{$R *.dfm}

procedure TfrmCSOSN.lbl_edtCodCSOSNEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmCSOSN.lbl_edtDescrCSOSNEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmCSOSN.lbl_edtCodCSOSNExit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure TfrmCSOSN.lbl_edtDescrCSOSNExit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure TfrmCSOSN.btSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCSOSN.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmCSOSN.ExibeDados;

begin

  with dmModule do begin

  intIDCSOSN := ibCSOSN.FieldByName('ID_CSOSN').AsInteger;

    if ibCSOSN.RecordCount > 0 Then begin

      lbl_edtCodCSOSN.Text   := ibCSOSN.FieldByName('CODIGO_CSOSN').AsString;
      lbl_edtDescrCSOSN.Text := ibCSOSN.FieldByName('DESCRICAOCSOSN').AsString;

    end;//if record count

  end;//with

end;

procedure TfrmCSOSN.SelectCSOSN;

begin

  with dmModule do begin

    ibCSOSN.Close;
    ibCSOSN.SQL.Clear;
    ibCSOSN.SQL.Add('SELECT * FROM TBL_CSOSN ORDER BY CODIGO_CSOSN');
    ibCSOSN.Open;

  end;//with

end;

procedure TfrmCSOSN.lbl_edtCodCSOSNKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtDescrCSOSN.SetFocus;

  end;

end;

procedure TfrmCSOSN.LimparCampos;

begin

  lbl_edtCodCSOSN.Clear;
  lbl_edtDescrCSOSN.Clear;

end;

procedure TfrmCSOSN.FormShow(Sender: TObject);
begin

  with dmModule do begin

    SelectCSOSN;
    LimparCampos;
    
    with dbgCSOSN do begin

      if MontaColunas Then begin

        DataSource := dmModule.dtsCSOSN;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Código CSOSN';
        Columns.Items[0].FieldName     := 'CODIGO_CSOSN';
        Columns.Items[0].Width         := 80;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[1].Title.Caption := 'Descrição CSOSN';
        Columns.Items[1].FieldName     := 'DESCRICAOCSOSN';
        Columns.Items[1].Width         := 380;
        Columns.Items[1].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;//if monta colunas;

    end;//with

  end;//with

end;

procedure TfrmCSOSN.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmCSOSN.GravarCSOSN;

begin

  with dmModule do begin

      ibCSOSN.Close;
      ibCSOSN.SQL.Clear;
      ibCSOSN.SQL.Add('INSERT INTO TBL_CSOSN'
      + '(CODIGO_CSOSN,DESCRICAOCSOSN) values '
      + '(''' + lbl_edtCodCSOSN.Text + ''','
      + ' ''' + lbl_edtDescrCSOSN.Text + ''')');
      ibCSOSN.ExecSQL;
      Commit(ibCSOSN);

      SelectCSOSN;

      LimparCampos;

  end;//with

end;

procedure TfrmCSOSN.btGravarClick(Sender: TObject);
begin

  with dmModule do begin

    GravarCSOSN;

  end;//with

end;

procedure TfrmCSOSN.dbgCSOSNCellClick(Column: TColumn);
begin

  with dmModule do begin

    ExibeDados;
    
  end;//with
  
end;

procedure TfrmCSOSN.btAlterarClick(Sender: TObject);

var

ConfirmaAlteracao : Integer;

begin


  with dmModule do begin

  ConfirmaAlteracao := Application.MessageBox('Confirma a alteração','Alteração de Registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaAlteracao = 6 Then begin

      ibCSOSN.Close;
      ibCSOSN.SQL.Clear;
      ibCSOSN.SQL.Add('UPDATE TBL_CSOSN SET '
      + 'CODIGO_CSOSN = ''' + lbl_edtCodCSOSN.Text + ''','
      + 'DESCRICAOCSOSN = ''' + lbl_edtDescrCSOSN.Text + ''' WHERE ID_CSOSN=''' + IntToStr(intIDCSOSN) + '''');
      ibCSOSN.ExecSQL;
      Commit(ibCSOSN);
      SelectCSOSN;
      LimparCampos;

    end;//if

  end;//with

end;

procedure TfrmCSOSN.btExcluirClick(Sender: TObject);

var
ConfirmaExclusao : Integer;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Confirma Exclusão do registro?','Exclusão de registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      ibCSOSN.Close;
      ibCSOSN.SQL.Clear;
      ibCSOSN.SQL.Add('DELETE FROM TBL_CSOSN WHERE IDCSOSN=''' + IntToStr(intIDCSOSN) + '''');
      ibCSOSN.ExecSQL;

    end;//if

    SelectCSOSN;
    LimparCampos;


  end;//with


end;

end.
