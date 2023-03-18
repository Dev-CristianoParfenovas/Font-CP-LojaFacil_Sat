unit untTipoServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, BmsXPButton, Grids, DBGrids, IBQuery;

type
  TfrmTipoServicos = class(TForm)
    lbl_edtNome: TLabeledEdit;
    ibeaSair: TBmsXPButton;
    lbl_edtVlrServico: TLabeledEdit;
    ibeaIncluir: TBmsXPButton;
    ibeaAlterar: TBmsXPButton;
    ibeaExcluir: TBmsXPButton;
    dbgTipoServico: TDBGrid;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure GravaServicos;
    procedure AlteraServicos;
    procedure ExcluirServicos;
    procedure SelectServicos;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgTipoServicoCellClick(Column: TColumn);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoServicos: TfrmTipoServicos;
  MontaColunas : Boolean;
  IDTipoServico : Integer;

implementation

uses untdmModule, DB, funcPosto;

{$R *.dfm}

procedure TfrmTipoServicos.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmTipoServicos.Commit(IBQueryExec : TIBQuery);

begin

  with dmModule do begin

    with IBQueryExec do begin

      SQL.Clear;
      SQL.Add('Commit');
      Open;
      Close;

    end;//with ibquery

  end;//with

end;

procedure TfrmTipoServicos.GravaServicos;

var

Valor : String;

begin

  with dmModule do begin

    Valor := StringReplace(lbl_edtVlrServico.Text,ThousandSeparator,'',[rfReplaceAll]);
    Valor := StringReplace(Valor,DecimalSeparator,'.',[rfReplaceAll]);
    if Valor = '' Then
       Valor := '0';

    ibTipoServico.Close;
    ibTipoServico.SQL.Clear;
    ibTipoServico.SQL.Add('INSERT INTO TBLTIPOSERVICOS '
    +'(DESCRICAO,VALOR) values '
    + '(''' + lbl_edtNome.Text + ''','
    + ' ''' + Valor + ''')');
    ibTipoServico.ExecSQL;
    Commit(ibTipoServico);


  end;//with

end;

procedure TfrmTipoServicos.AlteraServicos;

var

Valor : String;

begin

  with dmModule do begin

    Valor := StringReplace(lbl_edtVlrServico.Text,ThousandSeparator,'',[rfReplaceAll]);
    Valor := StringReplace(Valor,DecimalSeparator,'.',[rfReplaceAll]);
    if Valor = '' Then
       Valor := '0';

    ibTipoServico.Close;
    ibTipoServico.SQL.Clear;
    ibTipoServico.SQL.Add('UPDATE TBLTIPOSERVICOS SET '
    +'DESCRICAO = ''' + lbl_edtNome.Text + ''','
    + 'VALOR = ''' + Valor + ''' WHERE IDTIPOSERVICO = ''' + IntToStr(IDTipoServico) + '''');
    ibTipoServico.ExecSQL;
    Commit(ibTipoServico);

  end;//with

end;

procedure TfrmTipoServicos.ExcluirServicos;

begin

  with dmModule do begin

    ibTipoServico.Close;
    ibTipoServico.SQL.Clear;
    ibTipoServico.SQL.Add('DELETE FROM TBLTIPOSERVICOS WHERE IDTIPOSERVICO = ''' + IntToStr(IDTipoServico) + '''');
    ibTipoServico.ExecSQL;
    Commit(ibTipoServico);
    
  end;//with

end;

procedure TfrmTipoServicos.SelectServicos;

begin

  with dmModule do begin

    Commit(ibTipoServico);
    ibTipoServico.Close;
    ibTipoServico.SQL.Clear;
    ibTipoServico.SQL.Add('SELECT * FROM TBLTIPOSERVICOS ORDER BY IDTIPOSERVICO DESC');
    ibTipoServico.Open;

    (ibTipoServico.FieldByName('VALOR') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

  end;//with

end;

procedure TfrmTipoServicos.FormShow(Sender: TObject);
begin

  lbl_edtNome.Clear;
  lbl_edtVlrServico.Clear;

  with dmModule do begin

    SelectServicos;

    with dbgTipoServico do begin


      if MontaColunas Then begin

        DataSource := dmModule.dtsTipoServico;

        Columns.Insert(0);
        Columns.Insert(1);

        // Parametros que exibe o nome do produto
        Columns.Items[0].Title.Caption := 'Descrição';
        Columns.Items[0].FieldName     := 'DESCRICAO';
        Columns.Items[0].Width         := 200;
        Columns.Items[0].Alignment     := taLeftJustify;

        Columns.Items[1].Title.Caption := 'Valor';
        Columns.Items[1].FieldName     := 'VALOR';
        Columns.Items[1].Width         := 70;
        Columns.Items[1].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with dbgrid}

  end;//with

end;

procedure TfrmTipoServicos.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmTipoServicos.dbgTipoServicoCellClick(Column: TColumn);
begin

  with dmModule do begin

    IDTipoServico := ibTipoServico.FieldByName('IDTIPOSERVICO').AsInteger;

    if ibTipoServico.RecordCount > 0 Then begin

      lbl_edtNome.Text := ibTipoServico.FieldByName('DESCRICAO').AsString;
      lbl_edtVlrServico.Text := FormatFloat(CasasDecimais('Produtos'),ibTipoServico.FieldByName('VALOR').AsFloat);

    end;//if

  end;//with

end;

procedure TfrmTipoServicos.ibeaIncluirClick(Sender: TObject);
begin

  with dmModule do begin

    GravaServicos;
    SelectServicos;
    lbl_edtNome.Clear;
    lbl_edtVlrServico.Clear;

  end;//with

end;

procedure TfrmTipoServicos.ibeaAlterarClick(Sender: TObject);
begin

  with dmModule do begin

    AlteraServicos;
    SelectServicos;
    lbl_edtNome.Clear;
    lbl_edtVlrServico.Clear;

  end;//with

end;

procedure TfrmTipoServicos.ibeaExcluirClick(Sender: TObject);

var
ConfirmaExclusao : Integer;

begin

  with dmModule do begin

    ConfirmaExclusao := Application.MessageBox('Confirma a Exclusão do Registro?','Exclusão de registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      ExcluirServicos;
      SelectServicos;
      lbl_edtNome.Clear;
      lbl_edtVlrServico.Clear;

    end;//if

  end;//with

end;

end.
