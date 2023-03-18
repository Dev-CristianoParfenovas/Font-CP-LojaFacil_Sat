unit untCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,
  classComboBox, ExtCtrls, IBQuery, Data.DB;

type
  TfrmCliente = class(TForm)
    dbgClientes: TDBGrid;
    listboxCupom: TListBox;
    ListBoxDadosEmpresa: TListBox;
    Shape1: TShape;
    lbl_edtTotalPedido: TLabeledEdit;
    lbl_Prods: TLabel;
    lbl_F1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_TipoPreco: TLabel;
    lbl_F8: TLabel;
    lbl_F9: TLabel;
    lbl_F2: TLabel;
    lbl_F5: TLabel;
    lbl_edtTelefone: TLabeledEdit;
    lbl_edtCelular: TLabeledEdit;
    lbl_edtNome: TLabeledEdit;
    lbl_edtEndereco: TLabeledEdit;
    lbl_edtNum: TLabeledEdit;
    lbl_edtCompl: TLabeledEdit;
    lbl_edtBairro: TLabeledEdit;
    lbl_edtCodBarras: TLabeledEdit;
    lbl_edtQtde: TLabeledEdit;
    lbl_edtVlrUnit: TLabeledEdit;
    lbl_edtVlrTotal: TLabeledEdit;
    cboProdutos: TComboBox;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTCliente;
    procedure ExecSELECTProdutos;
    procedure LimparCampos;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_edtTelefoneExit(Sender: TObject);
    procedure lbl_edtTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtCelularExit(Sender: TObject);
    procedure lbl_edtCelularKeyPress(Sender: TObject; var Key: Char);
    procedure dbgClientesCellClick(Column: TColumn);
    procedure ibeLimparClick(Sender: TObject);
    procedure ibeaGravarClick(Sender: TObject);
    procedure lbl_edtQtdeExit(Sender: TObject);
    procedure cboProdutosClick(Sender: TObject);
    procedure lbl_edtCodBarrasChange(Sender: TObject);
    procedure lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtVlrTotalKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl_edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaFinalizaClick(Sender: TObject);
    procedure ibeaImprimirClick(Sender: TObject);
    procedure lbl_edtNomeCachorroKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtNumKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtComplKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtBairroExit(Sender: TObject);
    procedure lbl_edtBairroKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaIncluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;
  MontaColunas : Boolean;
  IDClassTelcom,IDClassTelcomAg : Integer;
  IDClassTelCel,IDClassTelCelAg : Integer;
  IDCadCliAg,IDAnimalCliAg    : Integer;
  IDClassServicos,IDClassProdutos : TClasseCombo;

implementation

uses untdmModule, unClientes, funcPosto, Daruma_Framework_Autenticar,
  Daruma_Framework_Impressora_Dual, Daruma_Framework_DUAL_ImprimirTexto,
  Daruma_Framework_Looping_Verificacao_Status,
  Daruma_Framework_Looping_Verificacao_Status_Doc,
  Daruma_Framework_Variaveis_Globais, uBuscaProdutos;
Function Daruma_DUAL_ImprimirTexto( TextoLivre: String; TamanhoTexto: Integer ): Integer; StdCall; External 'Daruma32.dll'

{$R *.dfm}

procedure TfrmCliente.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmCliente.ExecSELECTCliente;

var
IDClass,IDClassTelcom : Integer;
begin

  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.

    //LOCALIZA O TELEFONE COMERCIAl
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
    ibClassificacao.Open;
    IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

    //BUSCA TODOS OS CLIENTES QUE ESTEJAM NA CLASSIFICAÇÃO DE CLIENTES
    Commit(ibTempCadastro);
    ibTempCadastro.Close;
    ibTempCadastro.SQL.Clear;
    ibTempCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLLOGRADOURO.BAIRRO,TBLLOGRADOURO.ENDERECO,'
    + ' TBLCONTATO.CONTATO As Telefone,TBLCONTATO.TIPO FROM TBLCADASTRO '
    + ' LEFT OUTER JOIN TBLCONTATO ON TBLCADASTRO.IDCAD = TBLCONTATO.IDCAD '
    + ' LEFT OUTER JOIN TBLLOGRADOURO ON TBLCADASTRO.IDCAD = TBLLOGRADOURO.IDCAD '
    + ' WHERE TBLCADASTRO.idclass=''' + InttoStr(IDClass) + ''' and (TBLCONTATO.TIPO=''' + IntToStr(IDClassTelcom) + '''or TBLCONTATO.TIPO is null)   ORDER BY TBLCADASTRO.IDCAD DESC');
    ibTempCadastro.Open;

  end; {with}

end;


procedure TfrmCliente.ExecSELECTProdutos;

begin

  with dmModule do begin

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS');
    ibProdutos.Open;

    cboProdutos.Clear;

    while not ibProdutos.Eof do begin

      IDClassProdutos := TClasseCombo.Create;
      IDClassProdutos.ID := ibProdutos.FieldByName('IDPROD').AsInteger;
      cboProdutos.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDClassProdutos);
      ibProdutos.Next;

    end;//while

  end;//with

end;

procedure TfrmCliente.ibeaSairClick(Sender: TObject);
begin
Close;
listboxCupom.Clear;
ListBoxDadosEmpresa.Clear;

end;

procedure TfrmCliente.LimparCampos;

begin

lbl_edtTelefone.Clear;
lbl_edtCelular.Clear;
lbl_edtNome.Clear;
lbl_edtEndereco.Clear;
lbl_edtNum.Clear;
lbl_edtCompl.Clear;
lbl_edtBairro.Clear;
lbl_edtCodBarras.Clear;
lbl_edtQtde.Text := '1';
lbl_edtVlrUnit.Clear;
lbl_edtVlrTotal.Clear;
lbl_edtTotalPedido.Clear;
listboxCupom.Clear;
lbl_TipoPreco.Caption := '';

  if cboProdutos.Text <> '' Then begin

    cboProdutos.ClearSelection;

  end;//if

end;

procedure TfrmCliente.FormShow(Sender: TObject);

var

DadosEmpresa : Array[0..6] of String;

begin

LimparCampos;
lbl_edtQtde.Text := '1';

  with dmModule do begin

    ExecSELECTProdutos;
    ExecSELECTCliente;

    with dbgClientes do begin

      if MontaColunas Then begin

        DataSource := dtsTempCadastro;

        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);

        //Parametros da Coluna
        Columns.Items[0].Title.Caption := 'Nome/RazãoSocial';
        Columns.Items[0].FieldName     := 'NOME';
        Columns.Items[0].Width         := 150;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna
        Columns.Items[1].Title.Caption := 'Endereco';
        Columns.Items[1].FieldName     := 'ENDERECO';
        Columns.Items[1].Width         := 195;
        Columns.Items[1].Alignment     := taLeftJustify;

        Columns.Items[2].Title.Caption := 'Número';
        Columns.Items[2].FieldName     := 'NUMERO';
        Columns.Items[2].Width         := 50;
        Columns.Items[2].Alignment     := taLeftJustify;

        //Parametros da Coluna
        Columns.Items[3].Title.Caption := 'Telefone';
        Columns.Items[3].FieldName     := 'Telefone';
        Columns.Items[3].Width         := 80;
        Columns.Items[3].Alignment     := taLeftJustify;

        MontaColunas := False;  

      end;//if monta colunas

    end;;//whit dbgrid

////////////////////////////////////////////////////////////////////////////////

      //rotina para cabeçalho do cupom
      
      ibDadosEmpresa.Close;
      ibDadosEmpresa.SQL.Clear;
      ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
      ibDadosEmpresa.Open;

      DadosEmpresa[0]:=ibDadosEmpresa.FieldByName('NOME').AsString;
      DadosEmpresa[1]:=ibDadosEmpresa.FieldByName('ENDERECO').AsString;
      DadosEmpresa[2]:=ibDadosEmpresa.FieldByName('NUMERO').AsString;
      DadosEmpresa[3]:=ibDadosEmpresa.FieldByName('BAIRRO').AsString;
      DadosEmpresa[4]:=ibDadosEmpresa.FieldByName('ESTADO').AsString;
      DadosEmpresa[5]:=ibDadosEmpresa.FieldByName('DDD').AsString;
      DadosEmpresa[6]:=ibDadosEmpresa.FieldByName('TELEFONE').AsString;

      with ListBoxDadosEmpresa do begin

      ListBoxDadosEmpresa.Items.Add(DadosEmpresa[0]);
      ListBoxDadosEmpresa.Items.Add(DadosEmpresa[1]+','+DadosEmpresa[2]);
      ListBoxDadosEmpresa.Items.Add(DadosEmpresa[3]+'  '+'-'+'  '+DadosEmpresa[4]);
      ListBoxDadosEmpresa.Items.Add(DadosEmpresa[5]+'  '+'  '+DadosEmpresa[6]);

     end;//with

  end;//with

end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
MontaColunas := True;
end;

procedure TfrmCliente.lbl_edtTelefoneExit(Sender: TObject);

var

DadosCupom : Array[0..5] of String;

begin

  with dmModule do begin

    if lbl_edtTelefone.Text <> '' Then begin

      lbl_edtTelefone.Text := StringReplace(lbl_edtTelefone.Text,'-','',[rfReplaceAll]);
      lbl_edtTelefone.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtTelefone.Text));

    end;

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    Commit(ibTempCadastro);
    ibTempCadastro.Close;
    ibTempCadastro.SQL.Clear;
    ibTempCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLLOGRADOURO.BAIRRO,TBLLOGRADOURO.ENDERECO,'
    + ' TBLCONTATO.CONTATO As Telefone,TBLCONTATO.TIPO FROM TBLCADASTRO '
    + ' LEFT OUTER JOIN TBLCONTATO ON TBLCADASTRO.IDCAD = TBLCONTATO.IDCAD '
    + ' LEFT OUTER JOIN TBLLOGRADOURO ON TBLCADASTRO.IDCAD = TBLLOGRADOURO.IDCAD '
    + 'WHERE IDCLASS=''' + InttoStr(IDClass) + ''' and TBLCONTATO.CONTATO=''' + lbl_edtTelefone.Text + '''');
    ibTempCadastro.Open;

    if ibTempCadastro.RecordCount > 0 Then begin

        lbl_edtNome.Text := ibTempCadastro.FieldByName('NOME').AsString;
        lbl_edtEndereco.Text := ibTempCadastro.FieldByName('ENDERECO').AsString;
        lbl_edtNum.Text      := ibTempCadastro.FieldByName('NUMERO').AsString;
        lbl_edtCompl.Text    := ibTempCadastro.FieldByName('COMPL').AsString;
        lbl_edtBairro.Text   := ibTempCadastro.FieldByName('BAIRRO').AsString;

    end;//IF

    if (lbl_edtTelefone.Text <> '')and(lbl_edtNome.Text <> '') Then begin

      DadosCupom[0]:=lbl_edtNome.Text;
      DadosCupom[1]:=lbl_edtTelefone.Text;
      DadosCupom[2]:=lbl_edtEndereco.Text;
      DadosCupom[3]:=lbl_edtNum.Text;
      DadosCupom[4]:=lbl_edtCompl.Text;
      DadosCupom[5]:=lbl_edtBairro.Text;

      listboxCupom.Items.Add('Cliente:'+DadosCupom[0]);
      listboxCupom.Items.Add('Telefone:'+DadosCupom[1]);
      listboxCupom.Items.Add('End: '+DadosCupom[2]+','+DadosCupom[3]);
      listboxCupom.Items.Add('Compl:'+DadosCupom[4]+' '+'Bairro:'+DadosCupom[5]);
      listboxCupom.Items.Add('------------------------------------------------');

    end;//if inserirdados
    
  end;{With}

end;

procedure TfrmCliente.lbl_edtTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 Then begin

    lbl_edtNome.SetFocus;

  end;//if

end;

procedure TfrmCliente.lbl_edtCelularExit(Sender: TObject);

var

DadosCupom : Array[0..5] of String;

begin

  with dmModule do begin

    if lbl_edtCelular.Text <> '' Then begin

      lbl_edtCelular.Text := StringReplace(lbl_edtCelular.Text,'-','',[rfReplaceAll]);
      lbl_edtCelular.Text := FormatFloat('0000-0000',StrToFloat(lbl_edtCelular.Text));

    end;

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    Commit(ibTempCadastro);
    ibTempCadastro.Close;
    ibTempCadastro.SQL.Clear;
    ibTempCadastro.SQL.Add('SELECT TBLCADASTRO.*,TBLLOGRADOURO.BAIRRO,TBLLOGRADOURO.ENDERECO,'
    + ' TBLCONTATO.CONTATO As Telefone,TBLCONTATO.TIPO FROM TBLCADASTRO '
    + ' LEFT OUTER JOIN TBLCONTATO ON TBLCADASTRO.IDCAD = TBLCONTATO.IDCAD '
    + ' LEFT OUTER JOIN TBLLOGRADOURO ON TBLCADASTRO.IDCAD = TBLLOGRADOURO.IDCAD '
    + 'WHERE IDCLASS=''' + InttoStr(IDClass) + ''' and TBLCONTATO.CONTATO=''' + lbl_edtCelular.Text + '''');
    ibTempCadastro.Open;

    if ibTempCadastro.RecordCount > 0 Then begin

      lbl_edtNome.Text := ibTempCadastro.FieldByName('NOME').AsString;
      lbl_edtEndereco.Text := ibTempCadastro.FieldByName('ENDERECO').AsString;
      lbl_edtNum.Text      := ibTempCadastro.FieldByName('NUMERO').AsString;
      lbl_edtCompl.Text    := ibTempCadastro.FieldByName('COMPL').AsString;
      lbl_edtBairro.Text   := ibTempCadastro.FieldByName('BAIRRO').AsString;

    end;//IF

    if lbl_edtNome.Text <> '' Then begin

      DadosCupom[0]:=lbl_edtNome.Text;
      DadosCupom[1]:=lbl_edtCelular.Text;
      DadosCupom[2]:=lbl_edtEndereco.Text;
      DadosCupom[3]:=lbl_edtNum.Text;
      DadosCupom[4]:=lbl_edtCompl.Text;
      DadosCupom[5]:=lbl_edtBairro.Text;

      listboxCupom.Items.Add('Cliente:'+DadosCupom[0]);
      listboxCupom.Items.Add('Celular:'+DadosCupom[1]);
      listboxCupom.Items.Add('End: '+DadosCupom[2]+','+DadosCupom[3]);
      listboxCupom.Items.Add('Compl:'+DadosCupom[4]+' '+'Bairro:'+DadosCupom[5]);
      listboxCupom.Items.Add('------------------------------------------------');

    end;//if

  end;{With}

end;

procedure TfrmCliente.lbl_edtCelularKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 Then begin

    lbl_edtNome.SetFocus;

  end;//if

end;

procedure TfrmCliente.dbgClientesCellClick(Column: TColumn);
begin

  with dmModule do begin

 //   IDAnimalCliAg := ibAnimalCli.FieldByName('IDANIMALCLI').AsInteger;
 //   IDCadCliAg    := ibAnimalCli.FieldByName('IDCADCLI').AsInteger; //ATRIBUI O IDCAD DO CADASTRO A VARIAVEL

  {  if ibAnimalCli.RecordCount > 0 Then begin

      lbl_edtNome.Text          := ibAnimalCli.FieldByName('NOME').AsString;
      lbl_edtNomeCachorro.Text  := ibAnimalCli.FieldByName('NOMEANIMAL').AsString;
      lbl_edtEndereco.Text := ibAnimalCli.FieldByName('ENDERECO').AsString;
      lbl_edtNum.Text      := ibAnimalCli.FieldByName('NUMERO').AsString;
      lbl_edtCompl.Text    := ibAnimalCli.FieldByName('COMPL').AsString;
      lbl_edtBairro.Text   := ibAnimalCli.FieldByName('BAIRRO').AsString;

    end;  }


    //LOCALIZA O TELEFONE COMERCIAl
    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Com''');
    ibClassificacao.Open;
    IDClassTelcom := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone coml. na variavel.

    ibContato.Close;
    ibContato.SQL.Clear;
    ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
    + ' (IDCAD='''+ InttoStr(IDCadCliAg) + ''') And (TIPO=''' + InttoStr(IDClassTelcom) + ''')');
    ibContato.Open;

      //se tiver registro traz no campo
    if ibContato.RecordCount > 0 Then begin
      // lbl_edtDDD.Text          := ibContato.FieldByName('DDD').AsString; //TRAZ O DDD DO TELEFONE COMERCIAL
       lbl_edtTelefone.Text       := ibContato.FieldByName('CONTATO').AsString; //TRAZ O CONTATO (TELEFONE) COMERCIAL
    // limpa os campos se nao houver registro.
    end else begin
   //   lbl_edtDDD.Clear;
      lbl_edtTelefone.Clear;
    end;

      //LOCALIZA O TELEFONE CELULAR
      ibClassificacao.Close;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Tel Cel''');
      ibClassificacao.Open;
      IDClassTelCel := ibClassificacao.FieldByName('IDCLASS').AsInteger;//atribui a identiicacao do contato de telefone celular na variavel.

      ibContato.Close;
      ibContato.SQL.Clear;
      ibContato.SQL.Add('SELECT DDD,CONTATO FROM TBLCONTATO WHERE'
      + ' (IDCAD='''+ InttoStr(IDCadCliAg) + ''') And (TIPO=''' + InttoStr(IDClassTelCel) + ''')');
      ibContato.Open;

      //se tiver registro traz no campo
      if ibContato.RecordCount > 0 Then begin
         lbl_edtCelular.Text       := ibContato.FieldByName('CONTATO').AsString; //TRAZ O CONTATO (TELEFONE) CELULAR
       // limpa os campos se nao houver registro.
      end else begin
        lbl_edtCelular.Clear;
      end;


  end;{with}

end;

procedure TfrmCliente.ibeLimparClick(Sender: TObject);
begin

  with dmModule do begin

    LimparCampos;
    lbl_edtTelefone.SetFocus;
    ExecSELECTCliente;
    
  end;//with

end;

procedure TfrmCliente.ibeaGravarClick(Sender: TObject);

var

IncluirPedido :Array [0..6] of String;

begin

  IncluirPedido[0] := cboProdutos.Text;
  IncluirPedido[1] := lbl_edtQtde.Text;
  IncluirPedido[2] := 'X';
  IncluirPedido[3] := lbl_edtVlrUnit.Text;
  IncluirPedido[4] := lbl_edtVlrTotal.Text;
  IncluirPedido[5] := '=';

  if cboProdutos.Text <> '' Then begin

    listboxCupom.Items.Add(IncluirPedido[1]);
    listboxCupom.Items.Add(IncluirPedido[2]+ ' ' + IncluirPedido[3]+ ' ' + IncluirPedido[4]+ ' ' + IncluirPedido[6] + ' ' + IncluirPedido[5]);

  end;//if

  lbl_TipoPreco.Caption := '';
  lbl_edtCodBarras.Clear;
  lbl_edtQtde.Text := '1';
  lbl_edtVlrUnit.Clear;
  lbl_edtVlrTotal.Clear;
  cboProdutos.ClearSelection;
  lbl_edtCodBarras.SetFocus;

end;

procedure TfrmCliente.lbl_edtQtdeExit(Sender: TObject);

   var
    Valor1 :Real;
    Valor2 :Real;
    ValorReal :Real;
begin

 if (cboProdutos.Text <> '') Then begin

  if lbl_edtQtde.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQtde.Text)>0) and (lbl_edtQtde.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnit.Text,ThousandSeparator,'',[rfReplaceAll]));

      lbl_edtVlrTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnit.Text,ThousandSeparator,'',[rfReplaceAll]));
       lbl_edtVlrTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

    end;{if}

  end;{if}

 end;{if cbo produto}


end;

procedure TfrmCliente.cboProdutosClick(Sender: TObject);

var

IDClassProduto : TClasseCombo;
Produto : Array[0..3] of String;
TipoPreco : String;

begin

  with dmModule do begin

    if cboProdutos.ItemIndex <> - 1 Then begin

      IDClassProduto := TClasseCombo(cboProdutos.Items.Objects[cboProdutos.ItemIndex]);

    end;

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,LOCALESTOCAGEM.NOME As Estoque FROM CADPRODUTOS '
    + 'INNER JOIN LOCALESTOCAGEM ON CADPRODUTOS.IDLOCAL=LOCALESTOCAGEM.IDESTOQUE '
    + 'WHERE CADPRODUTOS.IDPROD=''' + IntToStr(IDClassProduto.ID) + '''');
    ibProdutos.Open;

////////////////////////////////////////////////////////////////////////////////

    if lbl_TipoPreco.Caption = '' Then begin

      TipoPreco := 'A';

    end;

    if lbl_TipoPreco.Caption = 'Preço de Venda(B)' Then begin

      TipoPreco := 'B';

    end;

    if lbl_TipoPreco.Caption = 'Preço de Venda(C)' Then begin

      TipoPreco := 'C';

    end;

    if  (TipoPreco = 'A') Then begin

      lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

    end else if  (TipoPreco = 'B') Then begin

      lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);

    end else if  (TipoPreco = 'C') Then begin

      lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);

    end;

////////////////////////////////////////////////////////////////////////////////


    lbl_edtCodBarras.Text := ibProdutos.FieldByName('CODBARRAS').AsString;
    lbl_edtQtde.SetFocus;
    lbl_edtQtde.Text := '1';

  end;{with}


end;

procedure TfrmCliente.lbl_edtCodBarrasChange(Sender: TObject);

var

i : Integer;

CodBarrasVenda, TipoPreco : String;

begin

  with dmModule do begin

    if lbl_edtCodBarras.Text <> '' Then begin

      CodBarrasVenda := lbl_edtCodBarras.Text;

    end;//if cod barras

    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE CADPRODUTOS.CODBARRAS=''' + CodBarrasVenda + ''' or CADPRODUTOS.CODBARRASAD=''' + CodBarrasVenda + '''');
    ibProdutos.Open;

    if lbl_TipoPreco.Caption = '' Then begin

      TipoPreco := 'A';

    end;

    if lbl_TipoPreco.Caption = 'Preço de Venda(B)' Then begin

      TipoPreco := 'B';

    end;

    if lbl_TipoPreco.Caption = 'Preço de Venda(C)' Then begin

      TipoPreco := 'C';

    end;

  //  lbl_edtCodProd.Text := ibProdutos.FieldByName('IDPROD').AsString;
   // lbl_edtCodBarras.Text :=  ibProdutos.FieldByName('CODBARRAS').AsString;
   // lbl_NomeProd.Caption  :=  ibProdutos.FieldByName('NOME').AsString;
  //  lbl_edtEstoque.Text := ibProdutos.FieldByName('Estoque').AsString;

    if  (TipoPreco = 'A') Then begin

    lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);
   // lbl_Valor.Caption   := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

    end else if  (TipoPreco = 'B') Then begin

   lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
 //  lbl_Valor.Caption   := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);


    end else if  (TipoPreco = 'C') Then begin
 //
    lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAC').AsFloat);
  //  lbl_edtVlrTotal.Text   := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAA').AsFloat);

    end;

    for i:=0 to cboProdutos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboProdutos.Items.Objects[i]).ID = ibProdutos.FieldByName('IDPROD').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboProdutos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboProdutos.ClearSelection;//LIMPA A SELECAO. }
      end;{if}
    end;{for}

    if lbl_edtQtde.Text = '0' then begin

     lbl_edtQtde.Text := '1';

    end;

     lbl_edtQtdeExit(Sender);

   // if (lbl_edtQtde.Text > '0') and () Then begin

  //   lbl_edtVlrTotal.SetFocus;

   //end;//if}

     { cboServicos.ClearSelection;
      cboProdutos.ClearSelection;
      lbl_edtCodBarras.Clear;
      lbl_edtQtde.Clear;
      lbl_edtVlrUnit.Clear;
      lbl_edtVlrTotal.Clear;
      lbl_TipoPreco.Caption := '';
      lbl_edtCodBarras.SetFocus;}

  end;{with}

end;

procedure TfrmCliente.lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 Then begin

   lbl_edtVlrTotal.SetFocus;

   { if cboProdutos.Text = '' Then begin

      lbl_edtCodBarras.SetFocus;

    end else begin

      lbl_edtQtde.SetFocus; }

   // end;{if cbo produto}

   { if cboServicos.Text <> '' Then begin

      lbl_edtQtde.SetFocus;

    end;//if }

  end;

end;

procedure TfrmCliente.lbl_edtVlrTotalKeyPress(Sender: TObject;
  var Key: Char);

  var

DadosCupom : Array[0..7] of String;

Valor1, Valor2, Valor3, Valor4 : Real;

i : Integer;

begin

  if Key = #13 Then begin



    if lbl_edtVlrTotal.Text > '0,00' Then begin

      DadosCupom[0]:=cboProdutos.Text;
      DadosCupom[1]:=lbl_edtQtde.Text;
      DadosCupom[2]:='X';
      DadosCupom[3]:=lbl_edtVlrUnit.Text;
      DadosCupom[4]:='=';
      DadosCupom[5]:=lbl_edtVlrTotal.Text;
      DadosCupom[6]:=lbl_edtCodBarras.Text;

      if cboProdutos.Text <> '' Then begin

        listboxCupom.Items.Add('');
        listboxCupom.Items.Add(DadosCupom[0]);
        listboxCupom.Items.Add(DadosCupom[1] + ' ' + ' ' + ' ' + DadosCupom[2] + ' ' + ' ' + ' ' + DadosCupom[3] + ' ' + ' ' + ' ' + DadosCupom[4]  + ' ' + ' ' + ' ' + DadosCupom[5]);

      end;//if


        for i := 0 to listboxCupom.Items.Count-1 do begin

          SendMessage(listboxCupom.Handle,WM_VSCROLL,SB_LINEDOWN,0);

        end;//for

    //  lbl_TipoPreco.Caption := '';


  ////////////////////////////////////////////////////////////////////////////////
      if (lbl_edtTotalPedido.Text = '0,00') or (lbl_edtTotalPedido.Text = '') Then begin

      lbl_edtTotalPedido.Text  := lbl_edtVlrTotal.Text;

      Valor1 := StrToFloat(StringReplace(lbl_edtTotalPedido.Text,ThousandSeparator,'',[rfReplaceAll]));

     end else if lbl_edtTotalPedido.Text <> '0,00' Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtTotalPedido.Text,ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(lbl_edtVlrTotal.Text);
      Valor3 := StrToFloat(FormatFloat(',0.00',(Valor1)+ (Valor2)));
      lbl_edtTotalPedido.Text := FormatFloat(',0.00',(Valor3));

      end;{if}

  ///////////////////////////////////////////////////////////////////////////////
      
      lbl_TipoPreco.Caption := '';
      lbl_edtCodBarras.Clear;
      lbl_edtQtde.Text := '1';
      lbl_edtVlrUnit.Clear;
      lbl_edtVlrTotal.Clear;
      cboProdutos.ClearSelection;
      lbl_edtCodBarras.SetFocus;

    end else begin

      Application.MessageBox('Para concluir um lançamento selecione um produto ou serviço?','Lançamento em branco',+MB_YESNO+MB_ICONQUESTION);

    end;//iflblvlrtotal

  end;{if}


end;

procedure TfrmCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case key of

    VK_F1:begin

      listboxCupom.Clear;
      lbl_TipoPreco.Caption := '';
      lbl_edtCodBarras.Clear;
      lbl_edtQtde.Text := '1';
      lbl_edtVlrUnit.Clear;
      lbl_edtVlrTotal.Clear;
      lbl_edtTotalPedido.Clear;
      lbl_TipoPreco.Caption := '';
      lbl_edtCodBarras.SetFocus;
      cboProdutos.ClearSelection;
      
    end;

    VK_F2:begin

      lbl_edtQtde.SetFocus;

    end;

    VK_F7:begin

      frmBuscaProdutos.ShowModal;

    end;

    VK_F5:begin

      lbl_TipoPreco.Caption := '';
      lbl_edtCodBarras.Clear;
      lbl_edtQtde.Text := '1';
      lbl_edtVlrUnit.Clear;
      lbl_edtVlrTotal.Clear;
      cboProdutos.ClearSelection;
      lbl_edtCodBarras.SetFocus;

    end;

    VK_F8:begin

      lbl_TipoPreco.Caption := 'Preço de Venda(B)';

    end;

    VK_F9:begin

      lbl_TipoPreco.Caption := 'Preço de Venda(C)';

    end;

  end;

end;

procedure TfrmCliente.lbl_edtCodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key =#13 Then begin

    lbl_edtQtde.SetFocus;
    lbl_edtQtde.Text := '1';

  end;

end;

procedure TfrmCliente.ibeaFinalizaClick(Sender: TObject);

var

InformacaoPedido : Array [0..2] of String;

begin

InformacaoPedido[0]:='TOTAL..:(R$)';
InformacaoPedido[1]:= lbl_edtTotalPedido.Text;
InformacaoPedido[2]:='**Sem efeito fiscal**';

listboxCupom.Items.Add( '  ');
listboxCupom.Items.Add('-------------------------------------');
listboxCupom.Items.Add('            '+InformacaoPedido[0] + '' + InformacaoPedido[1]);
listboxCupom.Items.Add('  ');
listboxCupom.Items.Add('          ' + InformacaoPedido[2]);
end;

procedure TfrmCliente.ibeaImprimirClick(Sender: TObject);

var

ConfirmaCupom : Integer;
DataConvertida, Hora : String;

begin

          ConfirmaCupom := Application.MessageBox('Deseja imprimir o Cupom','Notificação:Impressão de Cupom',+MB_YESNO+MB_ICONQUESTION);

          if ConfirmaCupom = 6 Then begin

            DataConvertida := FormatDateTime('DD/MM/YYYY',Now);
            Hora           := FormatDateTime('hh:mm:ss',Now);
            listboxCupom.Items.Add('-------------------------------------');
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<sp>1</sp>'+(frmCliente.ListBoxDadosEmpresa.Items).Text+ ''),0);
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Data:<sp>1</sp>'+DataConvertida+ '<sp>1</sp>Hora:<sp>1</sp>'+Hora+ ''),0);
            listboxCupom.Items.Add('-------------------------------------');
            Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<sp>1</sp>'+(frmCliente.listboxCupom.Items).Text+ ''),0);
            //IPRIMINDO A VIGÉSIMA PRIMEIRA LINHA
            if Int_Retorno = 1 Then
            begin
              Application.MessageBox('Impressao Concluida!!!', 'CP SISTEMAS', mb_ok + 32);
            end
            else
            begin
              Application.MessageBox('Erro!', 'Daruma Framework', mb_ok + 16);
            end;

          end;//if confirmacupom
////////////////////////////////////////////////////////////////////////////////

end;

procedure TfrmCliente.lbl_edtNomeCachorroKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtCodBarras.SetFocus;

  end;//if

end;

procedure TfrmCliente.lbl_edtNomeKeyPress(Sender: TObject; var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtEndereco.SetFocus;

  end;//if

end;

procedure TfrmCliente.lbl_edtEnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtNum.SetFocus;

  end;//if

end;

procedure TfrmCliente.lbl_edtNumKeyPress(Sender: TObject; var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtCompl.SetFocus;

  end;//if

end;

procedure TfrmCliente.lbl_edtComplKeyPress(Sender: TObject; var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtBairro.SetFocus;

  end;//if

end;

procedure TfrmCliente.lbl_edtBairroExit(Sender: TObject);

var

DadosCupom : Array[0..5] of String;

begin

  if lbl_edtNome.Text <> '' Then begin

    DadosCupom[0]:=lbl_edtNome.Text;
    DadosCupom[1]:=lbl_edtTelefone.Text;
    DadosCupom[2]:=lbl_edtEndereco.Text;
    DadosCupom[3]:=lbl_edtNum.Text;
    DadosCupom[4]:=lbl_edtCompl.Text;
    DadosCupom[5]:=lbl_edtBairro.Text;

    listboxCupom.Items.Add('Cliente:'+DadosCupom[0]);
    listboxCupom.Items.Add('Telefone:'+DadosCupom[1]);
    listboxCupom.Items.Add('End: '+DadosCupom[2]+','+DadosCupom[3]);
    listboxCupom.Items.Add('Compl:'+DadosCupom[4]+' '+'Bairro:'+DadosCupom[5]);
    listboxCupom.Items.Add('-------------------------------------');

  end;//if

end;

procedure TfrmCliente.lbl_edtBairroKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtNome.SetFocus;

  end;//if

end;

procedure TfrmCliente.ibeaIncluirClick(Sender: TObject);

var

DadosCupom : Array[0..5] of String;

begin

  if lbl_edtNome.Text <> '' Then begin

    DadosCupom[0]:=lbl_edtNome.Text;
    DadosCupom[1]:=lbl_edtTelefone.Text;
    DadosCupom[2]:=lbl_edtEndereco.Text;
    DadosCupom[3]:=lbl_edtNum.Text;
    DadosCupom[4]:=lbl_edtCompl.Text;
    DadosCupom[5]:=lbl_edtBairro.Text;

    listboxCupom.Items.Add('Cliente:'+DadosCupom[0]);
    listboxCupom.Items.Add('Telefone:'+DadosCupom[1]);
    listboxCupom.Items.Add('End: '+DadosCupom[2]+','+DadosCupom[3]);
    listboxCupom.Items.Add('Compl:'+DadosCupom[4]+' '+'Bairro:'+DadosCupom[5]);
    listboxCupom.Items.Add('-------------------------------------');

  end;//if
  
end;

end.
