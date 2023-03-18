unit untFuncVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBQuery, classComboBox;

type
  TfrmFuncVenda = class(TForm)
    cboUsuario: TComboBox;
    lbl_Info: TLabel;
    lbl_IDCliFunc: TLabel;
    F1: TLabel;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure execSELECTFunc;
    procedure FormShow(Sender: TObject);
    procedure cboUsuarioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncVenda: TfrmFuncVenda;

implementation

uses untdmModule, untServicos;

{$R *.dfm}

procedure TfrmFuncVenda.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmFuncVenda.ExecSELECTFunc;

var

IDLogin : TClasseCombo;

begin

  with dmModule do begin

    ibUser.Close;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER');
    ibUser.Open;

    cboUsuario.Clear;

    while not ibUser.Eof do begin

      IDLogin     := TClasseCombo.Create;
      IDLogin.ID  := ibUser.FieldByName('IDUSER').AsInteger;//ATRIBUI A IDENTIFICACAO DO FUNCIONARIO ATRAVES DO ID NA VARIAVEL.
      cboUsuario.Items.AddObject(ibUser.FieldByName('LOGIN').AsString,IDLogin);//TRAZ OS ITENS ADICIONADOS AO OBJETO SELECIONADO NO COMBO E A DESCRICAO DO FUNCIONARIO.
      ibUser.Next;

    end;

  end;{with}

end;
procedure TfrmFuncVenda.FormShow(Sender: TObject);
begin

  with dmModule do begin

    lbl_IDCliFunc.Caption := '';
    ExecSELECTFunc;
    
  end;//with

end;

procedure TfrmFuncVenda.cboUsuarioClick(Sender: TObject);

var
IDUsuario : TClasseCombo;
StringUsuario : String;

begin

  with dmModule do begin

    if cboUsuario.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO

      IDUsuario := TClasseCombo( cboUsuario.Items.Objects[cboUsuario.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringUsuario   := ' ''' + InttoStr(IDUsuario.ID ) + ''',';

    end;

    lbl_IDCliFunc.Caption := IntToStr(IDUsuario.ID);

  end;//with

end;

procedure TfrmFuncVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  with dmModule do begin

    case Key of

      VK_f1:begin

        ///frmVendasLoja.lbl_Func.Caption  := frmFuncVenda.cboUsuario.Text;
        frmVendasLoja.lbl_NomeFuncComissao.Caption  := 'Funcionário: ' +frmFuncVenda.cboUsuario.Text;
        frmVendasLoja.lbl_IDCli.Caption := frmFuncVenda.lbl_IDCliFunc.Caption;
        frmVendasLoja.lbl_IDFuncComissao.Caption := frmFuncVenda.lbl_IDCliFunc.Caption;

      end;//begin

    end;//case

    frmFuncVenda.Close;

  end;//with

end;

end.
