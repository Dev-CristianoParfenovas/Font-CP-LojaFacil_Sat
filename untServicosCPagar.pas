unit untServicosCPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids,
  IBQuery, Buttons;

type
  TfrmServicosCPagar = class(TForm)
    lbl_edtNome: TLabeledEdit;
    dbgServicosaPagar: TDBGrid;
    ibeaIncluir: TSpeedButton;
    ibeaAlterar: TSpeedButton;
    ibeaExcluir: TSpeedButton;
    ibeaSair: TSpeedButton;
    ckServicos: TCheckBox;
    ckCustoDiario: TCheckBox;
    procedure ibeaSairClick(Sender: TObject);
    procedure ckServicosCheck(Sender: TObject);
    procedure ckCustoDiarioCheck(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure GravarServico;
    procedure AlterarServico;
    procedure SELECTServicos;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgServicosaPagarCellClick(Column: TColumn);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServicosCPagar: TfrmServicosCPagar;
  MontaColunas : Boolean;
  IDServico : Integer;
  
implementation

uses DB, untdmModule;

{$R *.dfm}

procedure TfrmServicosCPagar.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmServicosCPagar.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmServicosCPagar.GravarServico;

var
Servicos,CustoDiario : String;
ConfirmaServico : Integer;

begin

  with dmModule do begin

    if (ckServicos.Checked = True)or(ckCustoDiario.Checked = True)Then begin


        ConfirmaServico := Application.MessageBox('Confirma a inclusão?','Inclusão de Serviços',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

        if ConfirmaServico = 6 Then begin

          if (ckServicos.Checked = True)and(ckCustoDiario.Checked = False) Then begin

            Servicos := 'Sim';

          end else begin

            Servicos := 'Nao';

          end;

          if (ckCustoDiario.Checked = True)and(ckServicos.Checked = False) Then begin

            CustoDiario := 'Sim';

          end else begin

            CustoDiario := 'Nao';

          end;

          ibServicosPagar.Close;
          ibServicosPagar.SQL.Clear;
          ibServicosPagar.SQL.Add('INSERT INTO TBLSERVICOSAPAGAR'
          + '(DESCRICAO,SERVICOS,CUSTODIARIO) values '
          + '(''' + lbl_edtNome.Text + ''',''' + Servicos + ''','
          + ' ''' + CustoDiario + ''')');
          ibServicosPagar.ExecSQL;
          Commit(ibServicosPagar);

          SELECTServicos;

        end;//if confirma servico

        lbl_edtNome.Clear;

    end else begin


    Application.MessageBox('Para lançar um serviço é necessário habilitar Servicos ou Custo Diário','Informação',+MB_OK+MB_DEFBUTTON1+MB_ICONINFORMATION);

    end;//if ck em branco

  end;//with

end;

procedure TfrmServicosCPagar.AlterarServico;

var
ConfirmaAlteracao : Integer;
Servicos,CustoDiario : String;

begin

  with dmModule do begin

    if (ckServicos.Checked = True)or(ckCustoDiario.Checked = True)Then begin

      ConfirmaAlteracao := Application.MessageBox('Confirma a Alteração?','Alteração de Servicos',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

      if ConfirmaAlteracao = 6 Then begin

        if (ckServicos.Checked = True)and(ckCustoDiario.Checked = False) Then begin

          Servicos := 'Sim';

        end else begin

          Servicos := 'Nao';

        end;

        if (ckCustoDiario.Checked = True)and(ckServicos.Checked = False) Then begin

          CustoDiario := 'Sim';

        end else begin

          CustoDiario := 'Nao';

        end;

          ibServicosPagar.Close;
          ibServicosPagar.SQL.Clear;
          ibServicosPagar.SQL.Add('UPDATE TBLSERVICOSAPAGAR SET '
          + 'DESCRICAO = ''' + lbl_edtNome.Text + ''','
          + 'SERVICOS = ''' + Servicos + ''','
          + 'CUSTODIARIO = ''' + CustoDiario + ''' WHERE IDSERVICO=''' + IntToStr(IDServico) + '''');
          ibServicosPagar.ExecSQL;

          Commit(ibServicosPagar);

          SELECTServicos;

      end;//if confirma alteração

    end;//if ck em branco

  end;//with

end;

procedure TfrmServicosCPagar.SELECTServicos;

begin

  with dmModule do begin

    if ckServicos.Checked = True Then begin

      Commit(ibServicosPagar);
      ibServicosPagar.Close;
      ibServicosPagar.SQL.Clear;
      ibServicosPagar.SQL.Add('SELECT * FROM TBLSERVICOSAPAGAR WHERE SERVICOS=''Sim''');
      ibServicosPagar.Open;

    end;//if

    if ckCustoDiario.Checked = True Then begin

      Commit(ibServicosPagar);
      ibServicosPagar.Close;
      ibServicosPagar.SQL.Clear;
      ibServicosPagar.SQL.Add('SELECT * FROM TBLSERVICOSAPAGAR WHERE CUSTODIARIO=''Sim''');
      ibServicosPagar.Open;

    end;//if

  end;//with

end;

procedure TfrmServicosCPagar.ckServicosCheck(Sender: TObject);
begin

  if ckServicos.Checked Then begin

    ckCustoDiario.Checked := False;
    lbl_edtNome.Clear;

  end;

  with dmModule do begin

    SELECTServicos;

  end;//with

end;

procedure TfrmServicosCPagar.ckCustoDiarioCheck(Sender: TObject);
begin

  if ckCustoDiario.Checked Then begin

    ckServicos.Checked := False;
    lbl_edtNome.Clear;

  end;

  with dmModule do begin

    SELECTServicos;

  end;//with

end;

procedure TfrmServicosCPagar.FormShow(Sender: TObject);
begin

lbl_edtNome.Clear;
ckServicos.Checked := False;
ckCustoDiario.Checked := False;

  with dmModule do begin

    with dbgServicosaPagar do begin

      if MontaColunas Then begin

        DataSource := dmModule.dtsServicosPagar;

        Columns.Insert(0);

        //Parametros da Coluna que exibe o Código do Produto
        // Parametros que exibe o nome do produto
        Columns.Items[0].Title.Caption := 'Descrição';
        Columns.Items[0].FieldName     := 'DESCRICAO';
        Columns.Items[0].Width         := 150;
        Columns.Items[0].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with monta colunas}


  end;//with

end;

procedure TfrmServicosCPagar.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmServicosCPagar.dbgServicosaPagarCellClick(Column: TColumn);
begin

  with dmModule do begin

    IDServico := ibServicosPagar.FieldByName('IDSERVICO').AsInteger;

    if ibServicosPagar.RecordCount > 0 then begin

      lbl_edtNome.Text := ibServicosPagar.FieldByName('DESCRICAO').AsString;

    end;//if

  end;//with

end;

procedure TfrmServicosCPagar.ibeaIncluirClick(Sender: TObject);
begin

  with dmModule do begin

    GravarServico;

  end;//with

end;

procedure TfrmServicosCPagar.ibeaAlterarClick(Sender: TObject);
begin

  with dmModule do begin

    AlterarServico;

  end;//with

end;

end.
