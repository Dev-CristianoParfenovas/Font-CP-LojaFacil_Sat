unit untRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IBEAntialiasButton, StdCtrls, classComboBox, IBQuery,
  ComCtrls;

type
  TfrmRecibo = class(TForm)
    lbl_Cliente: TLabel;
    lbl_edtCodCli: TLabeledEdit;
    cboCliente: TComboBox;
    ibeaSair: TIBEAntialiasButton;
    Image2: TImage;
    lbl_DadosOc: TLabel;
    lbl_edtNome: TLabeledEdit;
    lbl_edtValor: TLabeledEdit;
    ibeaOk: TIBEAntialiasButton;
    memoHistRecibo: TMemo;
    Label1: TLabel;
    dtpDataRecibo: TDateTimePicker;
    procedure ExecSELECTCliente;
    procedure ExecSELECTDiaMes;
    procedure FormShow(Sender: TObject);
    procedure lbl_edtCodCliExit(Sender: TObject);
    procedure cboClienteChange(Sender: TObject);
    procedure ibeaOkClick(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecibo: TfrmRecibo;
  IDClass : Integer;
  IDCliente : TClasseCombo;
  IDClassCliente : Integer;
  ClassConsultaCliente : TClasseCombo;
  IDClassRelat : Integer;
  IDDia : TClasseCombo;
  IDMes : TClasseCombo;
implementation

uses untdmModule, untRelRecibo;

{$R *.dfm}

procedure TfrmRecibo.ExecSELECTDiaMes;

begin

  with dmModule do begin

    ibDiaMes.Close;
    ibDiaMes.SQL.Clear;
    ibDiaMes.SQL.Add('SELECT * FROM TBLDIAMES');
    ibDiaMes.Open;

  // cboDia.Clear;
  //  cboMes.Clear;

 {  while not ibDiaMes.Eof do begin

      IDDia := TClasseCombo.Create;
      IDDia.ID := ibDiaMes.FieldByName('IDDIAMES').AsInteger;
      cboDia.Items.AddObject(ibDiaMes.FieldByName('DIA').AsString,IDDia);  }

   {   IDMes := TClasseCombo.Create;
      IDMes.ID := ibDiaMes.FieldByName('IDDIAMES').AsInteger;
      cboMes.Items.AddObject(ibDiaMes.FieldByName('MES').AsString,IDMes);  }

  //    ibDiaMes.Next;

  //  end;{while}

  end;{with}

end;

procedure TfrmRecibo.ExecSELECTCliente;

begin

  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.

    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClass) + '''');
    ibCadastro.Open;

    cboCliente.Clear;

    while not ibCadastro.Eof do begin

      IDCliente := TClasseCombo.Create;
      IDCliente.ID := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboCliente.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,IDCliente);
      ibCadastro.Next;

    end;{while}

  end;{whit}

end;


procedure TfrmRecibo.FormShow(Sender: TObject);
begin

  dtpDataRecibo.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  lbl_edtCodCli.Clear;
  cboCliente.ClearSelection;
  lbl_edtNome.Clear;
  lbl_edtValor.Clear;
  memoHistRecibo.Clear;

  with dmModule do begin

    ExecSELECTCliente;
   // ExecSELECTDiaMes;

  end;{with}

end;

procedure TfrmRecibo.lbl_edtCodCliExit(Sender: TObject);
var
i : Integer;
begin

with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClassCliente := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.


    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.NOME,TBLCADASTRO.IDCAD,TBLCADDOCUMENTACAO.CODIGO FROM TBLCADASTRO '
    + ' INNER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD=TBLCADDOCUMENTACAO.IDCAD '
    + ' WHERE TBLCADASTRO.IDCLASS=''' + IntToStr(IDClassCliente) + ''''
    + ' and TBLCADDOCUMENTACAO.CODIGO='''+ lbl_edtCodCli.Text + '''');
    ibCadastro.Open;

    for i:=0 to cboCliente.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboCliente.Items.Objects[i]).ID = ibCadastro.FieldByName('IDCAD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboCliente.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboCliente.ClearSelection;//LIMPA A SELECAO.
      end;{if}
    end;{for}


 //  end;{if}

  // lbl_edtNomeAnimal.SetFocus;

  end;{whit}


end;

procedure TfrmRecibo.cboClienteChange(Sender: TObject);
begin
  with dmModule do begin

    if cboCliente.ItemIndex <> -1 Then begin

      //DEFINE QUAL SERÁ O CÓDOGIO DO PRODUTO SELECIONADO
      ClassConsultaCliente      := TClasseCombo( cboCliente.Items.Objects[cboCliente.ItemIndex] );

       //FAZ A BUSCA PELO PRODUTO SELECIONADO NO COMBOBOX.
      ibDocumentacao.Close;
      ibDocumentacao.SQL.Clear;
      ibDocumentacao.SQL.Add('SELECT * FROM TBLCADDOCUMENTACAO WHERE IDCAD=''' + InttoStr(ClassConsultaCliente.ID) + '''');
      ibDocumentacao.Open;

      //EXIBE O VALOR DE VENDA A DO PRODUTO SELECIONADO
      lbl_edtCodCli.Text := ibDocumentacao.FieldByName('CODIGO').AsString;

      lbl_edtValor.SetFocus;

    end;
  end;

end;

procedure TfrmRecibo.ibeaOkClick(Sender: TObject);
begin
  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClassRelat := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.


    //SELECT PARA TRAZER OS DADOS PRO RELATORIO

  //  Commit(ibCadastro);
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT TBLCADASTRO.NOME,TBLCADASTRO.CEP,'
    + 'TBLCADASTRO.NUMERO,TBLCADDOCUMENTACAO.CODIGO,TBLLOGRADOURO.ENDERECO,'
    + 'TBLLOGRADOURO.BAIRRO,TBLLOGRADOURO.ESTADO,TBLLOGRADOURO.CIDADE FROM TBLCADASTRO '
    + 'LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCADASTRO.IDCAD=TBLCADDOCUMENTACAO.IDCAD '
    + 'LEFT OUTER JOIN TBLLOGRADOURO ON TBLCADASTRO.IDCAD=TBLLOGRADOURO.IDCAD'
    + ' WHERE TBLCADASTRO.IDCLASS=''' + IntToStr(IDClassRelat) + ''' ORDER BY NOME');
    ibCadastro.Open;


    Application.CreateForm(TfrmRelRecibo, frmRelRecibo);


    TRY

      with frmRelRecibo do begin

        frmRelRecibo.qrpRelatRecibo.DataSet := ibCadastro;

        //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT

        if cboCliente.ItemIndex <> - 1 Then begin
        qrdbCliente.DataSet    := ibCadastro;
        qrdbCliente.DataField  := ibCadastro.FieldByName('NOME').FieldName;
        end;
        qrlValor.Caption := frmRecibo.lbl_edtValor.Text;
        qrlHistRecibo.Caption := frmRecibo.memoHistRecibo.Text;
        qrlNomeCli.Caption := frmRecibo.lbl_edtNome.Text;
        qrlDataRecibo.Caption := DateToStr(frmRecibo.dtpDataRecibo.DateTime);

        qrpRelatRecibo.Preview;

      end; {if}

    EXCEPT
      on E : Exception do begin
         frmRelRecibo.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;
  //////////////////////////////////////////////////////////////

  end;{with}

end;

procedure TfrmRecibo.ibeaSairClick(Sender: TObject);
begin
  Close;
end;

end.
