unit untEmissaoServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, mxFlatControls, BmsXPButton, ComCtrls, ExtCtrls,
  BmsXPPageControl, Grids, DBGrids, IBQuery, classComboBox, axCtrls,
  BmsXPCheckBox, Buttons;

type
  TfrmEmissaoServicos = class(TForm)
    pcServicos: TBmsXPPageControl;
    tbsPagina1: TTabSheet;
    lbl_edtCodBarras: TmxFlatEdit;
    lbl_edtVlrUnit: TmxFlatEdit;
    lbl_edtVlrTotal: TmxFlatEdit;
    lbl_edtCodServico: TmxFlatEdit;
    cboServicos: TmxFlatComboBox;
    ibeaIncluir: TBmsXPButton;
    ibeaSair: TBmsXPButton;
    dbgServicos: TDBGrid;
    memoObs: TmxFlatMemo;
    ibeaNovoServico: TBmsXPButton;
    ibeaEncerrarServico: TBmsXPButton;
    lbl_CodBarra: TLabel;
    lbl_Descricao: TLabel;
    lbl_ServicoAvulso: TLabel;
    lbl_VlrUn: TLabel;
    lbl_VlrTotal: TLabel;
    lbl_NServ: TLabel;
    lbl_Obs: TLabel;
    lbl_TotalServicos: TLabel;
    lbl_SubTotal: TLabel;
    cboFuncionario: TmxFlatComboBox;
    lbl_Func: TLabel;
    ibeaExcluir: TBmsXPButton;
    lbl_TipoPreco: TLabel;
    cboCliente: TmxFlatComboBox;
    lbl_Clientes: TLabel;
    lbl_edtTrazerServico: TmxFlatEdit;
    lbl_edtTrazerServ: TLabel;
    ibeaExcluirServico: TBmsXPButton;
    lbl_edtVlrTotalServ: TmxFlatEdit;
    lbl_TotalServico: TLabel;
    lbl_F1: TLabel;
    lbl_F4: TLabel;
    lbl_F4Servico: TLabel;
    ibeaImprimirFicha: TBmsXPButton;
    ibeaAlterarServico: TBmsXPButton;
    ibeaLimparServico: TBmsXPButton;
    lbl_edtServicoAvulso: TmxFlatEdit;
    ckAberto: TBmsXPCheckBox;
    ckBaixado: TBmsXPCheckBox;
    ibeaBaixarServico: TBmsXPButton;
    ibeaRetornoServico: TBmsXPButton;
    ibeaRelatorioP: TSpeedButton;
    procedure ibeaSairClick(Sender: TObject);
    procedure CriaCodigo(Cod : String; Imagem : TCanvas);
    procedure LimpaCampos;
    procedure LimpaProduto;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTClientes;
    procedure SelectFuncionario;
    procedure SelectServicos;
    procedure GravarServico;
    procedure GravarFinalServicos;
    procedure FormShow(Sender: TObject);
    procedure ibeaNovoServicoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboServicosChange(Sender: TObject);
    procedure lbl_edtCodBarrasExit(Sender: TObject);
    procedure lbl_edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure ibeaEncerrarServicoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgServicosCellClick(Column: TColumn);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure lbl_edtTrazerServicoExit(Sender: TObject);
    procedure ibeaExcluirServicoClick(Sender: TObject);
    procedure lbl_edtTrazerServicoKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaImprimirFichaClick(Sender: TObject);
    procedure ibeaAlterarServicoClick(Sender: TObject);
    procedure ibeaLimparServicoClick(Sender: TObject);
    procedure lbl_edtVlrUnitExit(Sender: TObject);
    procedure lbl_edtVlrUnitKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaBaixarServicoClick(Sender: TObject);
    procedure ibeaRetornoServicoClick(Sender: TObject);
    procedure ckAbertoCheck(Sender: TObject);
    procedure ckBaixadoCheck(Sender: TObject);
    procedure lbl_edtServicoAvulsoKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaRelatorioPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmissaoServicos: TfrmEmissaoServicos;
  MontaColunas : Boolean;
  IDNServico, IDNumeroServico : Integer;

implementation

uses untdmModule, funcPosto, DB, untRelatServEmitido, untOSPeriodo;

{$R *.dfm}

procedure TfrmEmissaoServicos.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmEmissaoServicos.CriaCodigo(Cod : String; Imagem : TCanvas);

Const
  digitos : array['0'..'9'] of string[5]= ('00110',
  '10001',
  '01001',
  '11000',
  '00101',
  '10100',
  '01100',
  '00011',
  '10010',
  '01010');
Var
  Numero : String;
  Cod1 : Array[1..1000] Of Char;
  Cod2 : Array[1..1000] Of Char;
  Codigo : Array[1..1000] Of Char;
  Digito : String;
  c1,c2 : Integer;
  x,y,z,h : LongInt;
  a,b,c,d : TPoint;
  I : Boolean;
Begin
  Numero := Cod;
  For x := 1 to 1000 Do
  Begin
    Cod1 [x] := #0;
    Cod2 [x] := #0;
    Codigo[x] := #0;
  End;
  c1 := 1;
  c2 := 1;
  x := 1;
  For y := 1 to Length(Numero) div 2 do
  Begin
    Digito := Digitos[Numero[x ]];
    For z := 1 to 5 do
    Begin
      Cod1[c1] := Digito[z];
      Inc(c1);
    End;
    Digito := Digitos[Numero[x+1]];
    For z := 1 to 5 do
    Begin
      Cod2[c2] := Digito[z];
      Inc(c2);
    End;
    Inc(x,2);
  End;
  y := 5;
  Codigo[1] := '0'; 
  Codigo[2] := '0';
  Codigo[3] := '0';
  Codigo[4] := '0'; { Inicio do Codigo }
  For x := 1 to c1-1 do
  begin
    Codigo[y] := Cod1[x]; Inc(y);
    Codigo[y] := Cod2[x]; Inc(y);
  end;
  Codigo[y] := '1'; Inc(y); { Final do Codigo }
  Codigo[y] := '0'; Inc(y);
  Codigo[y] := '0';
  Imagem.Pen .Width := 1;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen .Color := ClWhite;
  a.x := 1; a.y := 0;
  b.x := 1; b.y := 79;
  c.x := 2000; c.y := 79;
  d.x := 2000; d.y := 0;
  Imagem.Polygon([a,b,c,d]);
  Imagem.Brush.Color := ClBlack;
  Imagem.Pen .Color := ClBlack;
  x := 0;
  i := True;
  for y:=1 to 1000 do
  begin
    If Codigo[y] <> #0 Then
    Begin
      If Codigo[y] = '0' then 
        h := 1 
      Else 
        h := 3;
      a.x := x; a.y := 0;
      b.x := x; b.y := 79;
      c.x := x+h-1; c.y := 79;
      d.x := x+h-1; d.y := 0;
      If i Then 
        Imagem.Polygon([a,b,c,d]);
      i := Not(i);
      x := x + h;
    End;
  end;
end;

procedure TfrmEmissaoServicos.LimpaCampos;

begin

lbl_edtCodServico.Clear;
cboFuncionario.ClearSelection;
lbl_edtCodBarras.Clear;
cboServicos.ClearSelection;
lbl_TipoPreco.Caption := '';
lbl_edtVlrUnit.Text := '';
lbl_edtVlrTotal.Text := '';
memoObs.Clear;
lbl_SubTotal.Caption := '0,00';
cboCliente.ClearSelection;

end;

procedure TfrmEmissaoServicos.LimpaProduto;

begin

lbl_edtCodBarras.Clear;
cboServicos.ClearSelection;
lbl_TipoPreco.Caption := '';
lbl_edtVlrUnit.Clear;
lbl_edtVlrTotal.Clear;
lbl_edtServicoAvulso.Clear;

end;

procedure TfrmEmissaoServicos.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmEmissaoServicos.ExecSELECTClientes;

var
IDClassCli : Integer;
ClassCli     : TClasseCombo;
begin
  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClassCli := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO FORNECEDOR NA VARIAVEL.

    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClassCli) + ''' ORDER BY NOME');//('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboCliente.Clear; //LIMPA O COMBOBOX

    while not ibCadastro.Eof do begin

      ClassCli     := TClasseCombo.Create;
      ClassCli.ID  := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboCliente.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,ClassCli);
      ibCadastro.Next;

    end;{WHILE}

  end;{WITH}

end;

procedure TfrmEmissaoServicos.SelectFuncionario;

var

IDCLassFunc : TClasseCombo;

begin

  with dmModule do begin

    Commit(ibUser);
    ibUser.Close;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE TIPOUSUARIO=''Funcionario''');
    ibUser.Open;

    cboFuncionario.Clear;

    while not ibUser.Eof do begin

      IDCLassFunc := TClasseCombo.Create;
      IDCLassFunc.ID := ibUser.FieldByName('IDUSER').AsInteger;
      cboFuncionario.Items.AddObject(ibUser.FieldByName('NOME').AsString,IDCLassFunc);
      ibUser.Next;

    end;//while

  end;//with

end;

procedure TfrmEmissaoServicos.SelectServicos;

var
IDClassServico : TClasseCombo;

begin

  with dmModule do begin

    Commit(ibTipoServico);
    ibTipoServico.Close;
    ibTipoServico.SQL.Clear;
    ibTipoServico.SQL.Add('SELECT * FROM TBLTIPOSERVICOS ORDER BY DESCRICAO');
    ibTipoServico.Open;

    cboServicos.Clear;

    while not ibTipoServico.Eof do begin

      IDClassServico := TClasseCombo.Create;
      IDClassServico.ID := ibTipoServico.FieldByName('IDTIPOSERVICO').AsInteger;
      cboServicos.Items.AddObject(ibTipoServico.FieldByName('DESCRICAO').AsString,IDClassServico);
      ibTipoServico.Next;

    end;//while

  end;//with

end;

procedure TfrmEmissaoServicos.GravarServico;

var

IDClassGravaCli, IDClassGravaTPagto, IDClassGravaFunc : TClasseCombo;
StringGravaCli, StringGravaTPagto, StringGravaFunc : String;
IDClassGravaServico : TClasseCombo;
StringGravaServico : String;
IDNumeroServ : Integer;
ValorUnit, ValorB, ValorTotal, TipoServico, DescontoServ : String;
Valor1, Valor2, Valor3 : Real;

begin

  IDNumeroServ := 0;

  with dmModule do begin

////////////////////////////////////////////////////////////////////////////////

  if lbl_edtCodServico.Text = '' Then begin

  Application.MessageBox('Para lançar um novo serviço é necessário gerar o número','Numero não lançado',+MB_OK+MB_DEFBUTTON1+MB_ICONINFORMATION)

  end else begin

    if lbl_edtCodServico.Text > '0' Then begin

      IDNumeroServ := StrToInt(lbl_edtCodServico.Text);

      if cboCliente.ItemIndex = -1 Then begin

        StringGravaCli := ' '' 0 '',';

      end else begin

        IDClassGravaCli   := TClasseCombo( cboCliente.Items.Objects[cboCliente.ItemIndex] );
        StringGravaCli    := ' ''' + InttoStr( IDClassGravaCli.ID ) + ''',';

      end;//if

     { if cboTipoPagto.ItemIndex = -1 Then begin

        StringGravaTPagto := ' '' 0 '',';

      end else begin

        IDClassGravaTPagto   := TClasseCombo( cboTipoPagto.Items.Objects[cboTipoPagto.ItemIndex] );
        StringGravaTPagto    := ' ''' + InttoStr( IDClassGravaTPagto.ID ) + ''',';

      end;//if }

      if cboFuncionario.ItemIndex = -1 Then begin

        StringGravaFunc := ' '' 0 '',';

      end else begin

        IDClassGravaFunc   := TClasseCombo( cboFuncionario.Items.Objects[cboFuncionario.ItemIndex] );
        StringGravaFunc    := ' ''' + InttoStr( IDClassGravaFunc.ID ) + ''',';

      end;//if

      if cboServicos.ItemIndex = -1 Then begin

        StringGravaServico := ' '' 0 '',';

      end else begin

        IDClassGravaServico   := TClasseCombo( cboServicos.Items.Objects[cboServicos.ItemIndex] );
        StringGravaServico    := ' ''' + InttoStr( IDClassGravaServico.ID ) + ''',';

      end;//if

////////////////////////////////////////////////////////////////////////////////

      if lbl_TipoPreco.Caption = '' Then begin

    //  ValorB := '0';

      ValorUnit := StringReplace(lbl_edtVlrUnit.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorUnit := StringReplace(ValorUnit,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorUnit  = '' Then
         ValorUnit := '0';

      end;

      if lbl_TipoPreco.Caption = '(B)' Then begin

     // ValorUnit := '0';

      ValorUnit := StringReplace(lbl_edtVlrUnit.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorUnit := StringReplace(ValorUnit,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorUnit  = '' Then
         ValorUnit := '0';

      end;

      ValorTotal := StringReplace(lbl_edtVlrTotal.Text,ThousandSeparator,'',[rfReplaceAll]);
      ValorTotal := StringReplace(ValorTotal,DecimalSeparator,'.',[rfReplaceAll]);
      if ValorTotal  = '' Then
         ValorTotal := '0';

     { DescontoServ := StringReplace(lbl_edtDesconto.Text,ThousandSeparator,'',[rfReplaceAll]);
      DescontoServ := StringReplace(DescontoServ,DecimalSeparator,'.',[rfReplaceAll]);
      if DescontoServ  = '' Then
         DescontoServ := '0';}


////////////////////////////////////////////////////////////////////////////////

      if (lbl_SubTotal.Caption = '0,00')or(lbl_SubTotal.Caption = '') Then begin

       lbl_SubTotal.Caption := lbl_edtVlrTotal.Text;

       Valor1 := StrToFloat(StringReplace(lbl_SubTotal.Caption,ThousandSeparator,'',[rfReplaceAll]));

      end else if lbl_SubTotal.Caption <> '0,00' Then begin

       Valor1 := StrToFloat(StringReplace(lbl_SubTotal.Caption,ThousandSeparator,'',[rfReplaceAll]));
       Valor2 := StrToFloat(StringReplace(lbl_edtVlrTotal.Text,ThousandSeparator,'',[rfReplaceAll]));
       Valor3 := Valor1+ Valor2;
       lbl_SubTotal.Caption := FormatFloat(',0.00',(Valor3));

       end;{if}

////////////////////////////////////////////////////////////////////////////////

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('INSERT INTO TBLSERVICOS '
      + '(NOMESERVICO,IDCLIENTE,IDFUNC,IDSERVICO,SERVICOAVULSO,'
      + 'IDNUMEROSERVICO,VLRA,VLRTOTAL,'
      + 'DATA) values '
      + '(''' + cboServicos.Text + ''','
      + StringGravaCli
      + StringGravaFunc
      + StringGravaServico
      + ' ''' + lbl_edtServicoAvulso.Text + ''','
      + ' ''' + IntToStr(IDNumeroServ) + ''','
      + ' ''' + ValorUnit + ''','
    //  + ' ''' + ValorB + ''','VLRB,
      + ' ''' + ValorTotal + ''','
      + ' ''' + FormatDateTime('mm-dd-yyyy',now) + ''')');
      ibServicos.ExecSQL;

      Commit(ibServicos);

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('SELECT * FROM TBLSERVICOS WHERE IDNUMEROSERVICO=''' + lbl_edtCodServico.Text + '''');
      ibServicos.Open;

      (ibServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
    //  (ibServicos.FieldByName('VLRB') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
      (ibServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

      LimpaProduto;

    end;//if

  end;//if cod servicos

  end;//with

end;

procedure TfrmEmissaoServicos.GravarFinalServicos;

var
Total, Situacao : String;

begin

  with dmModule do begin

    Total := StringReplace(lbl_SubTotal.Caption,ThousandSeparator,'',[rfReplaceAll]);
    Total := StringReplace(Total,DecimalSeparator,'.',[rfReplaceAll]);
    if Total  = '' Then
       Total := '0';

    Situacao := 'Pendente';

    ibControleServ.Close;
    ibControleServ.SQL.Clear;
    ibControleServ.SQL.Add('INSERT INTO TBLCONTROLESERVICOS '
    + '(TOTAL,CODIGOSERVICO,OBS,SITUACAO,HORA,DATA) values '
    + '(''' + Total + ''','
    + ' ''' + lbl_edtCodServico.Text + ''','
    + ' ''' + memoObs.Text + ''','
    + ' ''' + Situacao + ''','
    + ' ''' + FormatDateTime('hh:mm:ss',now) + ''','
    + ' ''' + FormatDateTime('mm-dd-yyyy',now) + ''')');
    ibControleServ.ExecSQL;
    Commit(ibControleServ);
    
  end;//with

end;

procedure TfrmEmissaoServicos.FormShow(Sender: TObject);
begin

  LimpaCampos;
  with dmModule do begin

    SelectServicos;
    SelectFuncionario;
    ExecSELECTClientes;
    ibServicos.Close;
    ibControleServ.Close;
    
  with dbgServicos do begin

      if MontaColunas Then begin

      DataSource := dmModule.dtsServicos;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o Código da entrada no estoque
        Columns.Items[0].Title.Caption := 'Descrição';
        Columns.Items[0].FieldName     := 'NOMESERVICO';
        Columns.Items[0].Width         := 210;
        Columns.Items[0].Alignment     := taLeftJustify;

        Columns.Items[1].Title.Caption := 'Servico Avulso';
        Columns.Items[1].FieldName     := 'SERVICOAVULSO';
        Columns.Items[1].Width         := 210;
        Columns.Items[1].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[2].Title.Caption := 'Qtde.';
        Columns.Items[2].FieldName     := 'QTDE';
        Columns.Items[2].Width         := 70;
        Columns.Items[2].Alignment     := taLeftJustify;

        //parametros que exibe a qtde. de entrada no estoque
        Columns.Items[3].Title.Caption := 'Valor';
        Columns.Items[3].FieldName     := 'VLRA';
        Columns.Items[3].Width         := 80;
        Columns.Items[3].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o vlr unitario do produto.
       { Columns.Items[3].Title.Caption := 'Valor(B)';
        Columns.Items[3].FieldName     := 'VLRB';
        Columns.Items[3].Width         := 80;
        Columns.Items[3].Alignment     := taLeftJustify; }

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Total';
        Columns.Items[4].FieldName     := 'VLRTOTAL';
        Columns.Items[4].Width         := 80;
        Columns.Items[4].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with}

////////////////////////////////////////////////////////////////////////////////

  end;//with

end;

procedure TfrmEmissaoServicos.ibeaNovoServicoClick(Sender: TObject);

var
CodigoServico : String;
Valor1,Valor2 : Real;
begin

  with dmModule do begin

    ibControleServ.Close;
    ibControleServ.SQL.Clear;
    ibControleServ.SQL.Add('SELECT * FROM TBLCONTROLESERVICOS ORDER BY IDCONTROLE DESC');
    ibControleServ.Open;

    if ibControleServ.RecordCount > 0 Then begin

      Valor1 := StrToFloat(ibControleServ.FieldByName('CODIGOSERVICO').AsString);

      if Valor1 >0 Then begin

        lbl_edtCodServico.Text := FloatToStr(Valor1+1);

      end else begin

        lbl_edtCodServico.Text := '7890001';

      end;

    end else begin

      lbl_edtCodServico.Text := '7890001';

    end;//if

    IDNServico := (ibControleServ.FieldByName('IDCONTROLE').AsInteger);

  end;//with

end;

procedure TfrmEmissaoServicos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case key of

    VK_F1 :begin

      if pcServicos.ActivePage.TabIndex = 0 Then begin

        lbl_TipoPreco.Caption := '';
        lbl_edtVlrUnit.Text := '';
        lbl_edtVlrTotal.Text := '';
        cboServicos.ClearSelection;
        lbl_edtServicoAvulso.Text := '';
     //   lbl_Porcentagem.Caption := '';

      end;//if

     {if pcServicos.ActivePage.TabIndex = 1 Then begin

        lbl_TPreco.Caption := '';
        lbl_edtQtdeSO.Text := '1';
        lbl_edtVlrSO.Text := '';
        lbl_edtTotalSO.Text := '';
        cboManutServ.ClearSelection;
        lbl_edtIDServ.Text := '';
        lbl_edtNumeroServExcluir.Clear;

      end;//if }

    end;//begin

    VK_F4 :begin

      ibeaNovoServicoClick(Sender);

    end;//begin

   //// VK_F8 :begin

    {  if pcServicos.ActivePage.TabIndex = 0 Then begin

        lbl_TipoPreco.Caption := '(B)';

      end; }

     { if pcServicos.ActivePage.TabIndex = 1 Then begin

        lbl_TPreco.Caption := 'Preço(B)';

      end;  }

  ////  end;//begin

  end;//case

end;

procedure TfrmEmissaoServicos.cboServicosChange(Sender: TObject);

var

IDClassServicos : TClasseCombo;
TipoPreco : String;

begin

  with dmModule do begin

    if cboServicos.ItemIndex <> - 1 Then begin

      IDClassServicos := TClasseCombo(cboServicos.Items.Objects[cboServicos.ItemIndex]);

    end;

    Commit(ibTipoServico);
    ibTipoServico.Close;
    ibTipoServico.SQL.Clear;
    ibTipoServico.SQL.Add('SELECT * FROM TBLTIPOSERVICOS WHERE TBLTIPOSERVICOS.IDTIPOSERVICO=''' + IntToStr(IDClassServicos.ID) + '''');
    ibTipoServico.Open;

////////////////////////////////////////////////////////////////////////////////

  {  if lbl_TipoPreco.Caption = '' Then begin

      TipoPreco := 'A';

    end;

    if lbl_TipoPreco.Caption = '(B)' Then begin

      TipoPreco := 'B';

    end;  }

  //  if  (TipoPreco = 'A') Then begin

    lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibTipoServico.FieldByName('VALOR').AsFloat);

   // end else if  (TipoPreco = 'B') Then begin

  //  lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);

   // end;

////////////////////////////////////////////////////////////////////////////////
    lbl_edtVlrUnit.SetFocus;
    lbl_edtVlrTotal.Text := '';

  end;//with


end;

procedure TfrmEmissaoServicos.lbl_edtCodBarrasExit(Sender: TObject);

var
i : Integer;

begin

  with dmModule do begin

    Commit(ibTipoServico);
    ibTipoServico.Close;
    ibTipoServico.SQL.Clear;
    ibTipoServico.SQL.Add('SELECT * FROM TBLTIPOSERVICOS WHERE TBLTIPOSERVICOS.CODBARRAS=''' + lbl_edtCodBarras.Text + '''');
    ibTipoServico.Open;


   // if lbl_TipoPreco.Caption = '' Then begin
    lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibTipoServico.FieldByName('VALOR').AsFloat);
  //  end;

   // if lbl_TipoPreco.Caption = '(B)' Then begin
   // lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibProdutos.FieldByName('VALORVENDAB').AsFloat);
   // end;
        
    for i:=0 to cboServicos.Items.Count -1 do begin//COMECA O LOOPING DOS ITENS -1 ATRIBUINDO 0 A VARIAVEL PARA CONTAR 3 REGISTROS EXISTENTES NA TBL.
      if TClasseCombo( cboServicos.Items.Objects[i]).ID = ibTipoServico.FieldByName('IDTIPOSERVICO').AsInteger then begin//SE A CLASSE DO COMBO E OS OBJETOS DESSA VARIAVEL FOR IGUAL AOS DADOS DA TABELA
        cboServicos.ItemIndex:= i;//COMECA O LOOPING DO REGISTRO
        Break;
      end else begin
        cboServicos.ClearSelection;//LIMPA A SELECAO.
      end;{if}
   end;{for}

 end;//with

end;

procedure TfrmEmissaoServicos.lbl_edtCodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtVlrUnit.SetFocus;
    
  end;//with

end;

procedure TfrmEmissaoServicos.ibeaIncluirClick(Sender: TObject);
begin

  with dmModule do begin

    GravarServico;

  end;//with

end;

procedure TfrmEmissaoServicos.ibeaEncerrarServicoClick(Sender: TObject);

var
ConfirmaFinalServico, EmitirRelatorio : Integer;
CodBarras,Situacao : String;
OleGraphic: TOleGraphic;
fs: TFileStream;
begin

  with dmModule do begin

    if (lbl_edtCodServico.Text > '0')and(lbl_SubTotal.Caption > '0,00') Then begin

      ConfirmaFinalServico := Application.MessageBox('Deseja Finalizar o Serviço','Final de Serviço',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

      if ConfirmaFinalServico = 6 Then begin

        GravarFinalServicos;

        Situacao := 'Pendente';

        ibServicos.Close;
        ibServicos.SQL.Clear;
        ibServicos.SQL.Add('UPDATE TBLSERVICOS SET '
        + 'SITUACAO = ''' + Situacao + ''' WHERE IDNUMEROSERVICO=''' + lbl_edtCodServico.Text + '''');
        ibServicos.ExecSQL;
        Commit(ibServicos);
////////////////////////////////////////////////////////////////////////////////

      EmitirRelatorio := Application.MessageBox('Deseja Imprimir','Imprimir Serviço',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

      if EmitirRelatorio = 6 Then begin

       Commit(ibServicos);
       ibServicos.Close;
       ibServicos.SQL.Clear;
       ibServicos.SQL.Add('SELECT TBLSERVICOS.*,TBLCADASTRO.NOME As Cliente,'
       + 'TBLCADASTRO.TELEFONE As FoneCli, TBLCADASTRO.CELULAR As CelularCli,'
       + 'TBLCADASTRO.NUMERO As NumeroCasa,TBLCADASTRO.CEP As CepCli,TBLLOGRADOURO.ENDERECO As EndCli,'
       + 'TBLLOGRADOURO.BAIRRO As BairroCli,TBLUSER.NOME As NomeFunc,'
       + 'TBLCONTROLESERVICOS.DATA  As DataServico,TBLCONTROLESERVICOS.OBS As Observacao FROM TBLSERVICOS '
       + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOS.IDCLIENTE=TBLCADASTRO.IDCAD '
       + 'LEFT OUTER JOIN TBLLOGRADOURO ON TBLSERVICOS.IDCLIENTE=TBLLOGRADOURO.IDCAD '
       + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOS.IDFUNC=TBLUSER.IDUSER '
       + 'LEFT OUTER JOIN TBLCONTROLESERVICOS ON TBLSERVICOS.IDNUMEROSERVICO=TBLCONTROLESERVICOS.CODIGOSERVICO WHERE TBLSERVICOS.IDNUMEROSERVICO=''' + lbl_edtCodServico.Text + '''');
       ibServicos.Open;
       { ibControleServ.Close;
        ibControleServ.SQL.Clear;
        ibControleServ.SQL.Add('SELECT TBLCONTROLESERVICOS.*,TBLSERVICOS.QTDE,'
        + 'TBLSERVICOS.VLRA,TBLSERVICOS.VLRB,TBLSERVICOS.NOMEPROD,'
        + 'TBLSERVICOS.VLRTOTAL FROM TBLCONTROLESERVICOS '
        + 'INNER JOIN TBLSERVICOS ON TBLCONTROLESERVICOS.CODIGOSERVICO=TBLSERVICOS.IDNUMEROSERVICO WHERE TBLSERVICOS.IDNUMEROSERVICO=''' + lbl_edtTrazerServico.Text + '''');
        ibControleServ.Open; }

        CodBarras  := lbl_edtCodServico.Text;

        Application.CreateForm(TfrmRelatServicosEmitidos, frmRelatServicosEmitidos);

      TRY

        with frmRelatServicosEmitidos do begin

          frmRelatServicosEmitidos.qrpServicosEmitidos.DataSet := ibServicos;

          if CodBarras <> '' Then begin

             CriaCodigo(CodBarras,qrimgCodBarras.Canvas);
             qrl_CodBarra.Caption        := CodBarras;

           end else begin//if (ibTempEtiqueta6089.FieldByName('ETIQUETA1').AsString = 'Nao')or(ibTempEtiqueta6089.FieldByName('ETIQUETA1').AsString = '')Then begin

             qrimgCodBarras.Picture := nil;
             qrl_CodBarra.Caption        := '';

           end;

          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbServico.DataSet     := ibServicos;
          qrdbServico.DataField   := ibServicos.FieldByName('NOMESERVICO').FieldName;

          qrdbServicoAvulso.DataSet     := ibServicos;
          qrdbServicoAvulso.DataField   := ibServicos.FieldByName('SERVICOAVULSO').FieldName;

          qrdbVlrUnit.DataSet     := ibServicos;
          qrdbVlrUnit.DataField   := ibServicos.FieldByName('VLRA').FieldName;
          (ibServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

        ////  qrdb_VlrB.DataSet       := ibServicos;
        ////  qrdb_VlrB.DataField     := ibServicos.FieldByName('VLRB').FieldName;
       ////   (ibServicos.FieldByName('VLRB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbTotal.DataSet          := ibServicos;
          qrdbTotal.DataField        := ibServicos.FieldByName('VLRTOTAL').FieldName;
          (ibServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          if ibServicos.FieldByName('IDCLIENTE').AsInteger > 0 Then begin

            qrdbNomeCliente.DataSet           := ibServicos;
            qrdbNomeCliente.DataField         := ibServicos.FieldByName('Cliente').FieldName;

            qrdbTelefoneCliente.DataSet           := ibServicos;
            qrdbTelefoneCliente.DataField         := ibServicos.FieldByName('FoneCli').FieldName;

            qrdbEndereco.DataSet          := ibServicos;
            qrdbEndereco.DataField        := ibServicos.FieldByName('EndCli').FieldName;

            qrdbNumero.DataSet          := ibServicos;
            qrdbNumero.DataField        := ibServicos.FieldByName('NumeroCasa').FieldName;

            qrdbBairro.DataSet          := ibServicos;
            qrdbBairro.DataField        := ibServicos.FieldByName('BairroCli').FieldName;

            qrdbCep.DataSet          := ibServicos;
            qrdbCep.DataField        := ibServicos.FieldByName('CepCli').FieldName;
            (ibServicos.FieldByName('CepCli') as TIntegerField).DisplayFormat := CasasDecimais('FormatoCep');//FormatFloat('00000-000'); //CRIA UMA MASCARA PARA O CAMPO
            
          end;

          qrdbObs.Lines.Text := ibServicos.FieldByName('Observacao').AsString;

          {  Commit(ibDadosEmpresa);
            ibDadosEmpresa.Close;
            ibDadosEmpresa.SQL.Clear;
            ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
            ibDadosEmpresa.Open;

            qrl_NomeEmpr.Caption      := ibDadosEmpresa.FieldByName('NOME').AsString;
            qrl_EnderecoEmpr.Caption  := ibDadosEmpresa.FieldByName('ENDERECO').AsString;
            qrl_BairroEmpr.Caption    := ibDadosEmpresa.FieldByName('BAIRRO').AsString;
            qrl_TelefoneEmpr.Caption  := ibDadosEmpresa.FieldByName('TELEFONE').AsString; }

////////////////////////////////////////////////////////////////////////////////

       //ROTINA PARA EXIBIR A IMAGEM DO PRODUTO
       //ROTINA PARA EXIBIR A IMAGEM DO PRODUTO
      if Not FileExists(ExtractFilePath(Application.ExeName) + 'Data\RunTime\Imagens_Sistema\logo fama2.jpg' ) Then begin

        frmRelatServicosEmitidos.imgLogo.Picture := Nil; //LIMPA A IMAGEM

      end else begin

        try

          frmRelatServicosEmitidos.imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+ '\Data\RunTime\Imagens_Sistema\logo fama2.jpg');

        finally
          fs.Free;
          OleGraphic.Free
        end;

       end;

////////////////////////////////////////////////////////////////////////////////



          qrpServicosEmitidos.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelatServicosEmitidos.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

    end;//if emitir relatorios

////////////////////////////////////////////////////////////////////////////////


      ibServicos.Close;

    end;

    end;//if cod servico

   LimpaCampos;
  end;//with
 
end;

procedure TfrmEmissaoServicos.FormCreate(Sender: TObject);

var
i : Integer;

begin

  MontaColunas := True;

 { for i := 0 to pcServicos.PageCount-1 do
  pcServicos.Pages[i].TabVisible := False;
  //Deixa a primeira página ativa
  pcServicos.ActivePage := pcServicos.Pages[0]; }

end;

procedure TfrmEmissaoServicos.dbgServicosCellClick(Column: TColumn);

var
i : Integer;

begin

 with dmModule do begin

   if lbl_edtCodServico.Text > '0' Then begin

     IDNumeroServico := ibServicos.FieldByName('IDSERVICOS').AsInteger;

     if ibServicos.RecordCount > 0 Then begin

       for i:=0 to cboServicos.Items.Count -1 do begin
         if TClasseCombo( cboServicos.Items.Objects[i]).ID = ibServicos.FieldByName('IDSERVICO').AsInteger then begin
           cboServicos.ItemIndex:= i;
           Break;
         end else begin
           cboServicos.ClearSelection;
         end;
       end;

       if ibServicos.FieldByName('VLRA').AsFloat > 0 Then begin

         lbl_TipoPreco.Caption := '';
         lbl_edtVlrUnit.Text  := FormatFloat(CasasDecimais('Produtos'),ibServicos.FieldByName('VLRA').AsFloat);

       end;

       if ibServicos.FieldByName('VLRB').AsFloat > 0 Then begin

         lbl_TipoPreco.Caption := 'Preço(B)';
         lbl_edtVlrUnit.Text  := FormatFloat(CasasDecimais('Produtos'),ibServicos.FieldByName('VLRB').AsFloat);

       end;

       lbl_edtServicoAvulso.Text := ibServicos.FieldByName('SERVICOAVULSO').AsString;
       lbl_edtVlrTotal.Text := FormatFloat(CasasDecimais('Produtos'),ibServicos.FieldByName('VLRTOTAL').AsFloat);

     end;//if recortdcount

   end;//if

 end;//with


end;

procedure TfrmEmissaoServicos.ibeaExcluirClick(Sender: TObject);

var
ConfirmaExclusao : Integer;
Valor1 : Real;
TotalValor1 : String;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Confirma a Exclusão do Item?','Exclusão de Registro',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 then begin

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('DELETE FROM TBLSERVICOS WHERE IDSERVICOS=''' + IntToStr(IDNumeroServico) + '''');
      ibServicos.ExecSQL;
      Commit(ibServicos);

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('SELECT * FROM TBLSERVICOS WHERE IDNUMEROSERVICO=''' + lbl_edtCodServico.Text + '''');
      ibServicos.Open;

      (ibServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
      (ibServicos.FieldByName('VLRB') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
      (ibServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

      LimpaProduto;

    end;//if cofirmaexclusao

        while not ibServicos.Eof do begin

          if (Valor1 = 0) Then begin//se variavel for igual a zero

            Valor1   := strToFloat(StringReplace(FloatToStr(ibServicos.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            TotalValor1  := StringReplace(FloatToStr(ibServicos.FieldByName('VLRTOTAL').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            Valor1   := Valor1 + StrToFloat(StringReplace(TotalValor1,ThousandSeparator,'',[rfReplaceall]));

           end;{if}

        ibServicos.Next;

        end;//while

        lbl_SubTotal.Caption := FormatFloat(CasasDecimais('Produtos'),Valor1);

  end;//with

end;

procedure TfrmEmissaoServicos.lbl_edtTrazerServicoExit(Sender: TObject);
begin

  with dmModule do begin

    if ckAberto.Checked Then begin

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('SELECT * FROM TBLSERVICOS WHERE IDNUMEROSERVICO=''' + lbl_edtTrazerServico.Text + ''' and SITUACAO=''Pendente''');
      ibServicos.Open;

      (ibServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
    ////  (ibServicos.FieldByName('VLRB') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
      (ibServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

      Commit(ibControleServ);
      ibControleServ.Close;
      ibControleServ.SQL.Clear;
      ibControleServ.SQL.Add('SELECT * FROM TBLCONTROLESERVICOS WHERE CODIGOSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibControleServ.Open;

      lbl_edtVlrTotalServ.Text := FormatFloat(CasasDecimais('Produtos'),ibControleServ.FieldByName('TOTAL').AsFloat);
      memoObs.Text := ibControleServ.FieldByName('OBS').AsString;

    end;//if ck

    if ckBaixado.Checked Then begin

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('SELECT * FROM TBLSERVICOS WHERE IDNUMEROSERVICO=''' + lbl_edtTrazerServico.Text + ''' and SITUACAO=''Baixado''');
      ibServicos.Open;

      (ibServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
    ////  (ibServicos.FieldByName('VLRB') as TFloatField).DisplayFormat := CasasDecimais('Produtos');
      (ibServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

      Commit(ibControleServ);
      ibControleServ.Close;
      ibControleServ.SQL.Clear;
      ibControleServ.SQL.Add('SELECT * FROM TBLCONTROLESERVICOS WHERE CODIGOSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibControleServ.Open;

      lbl_edtVlrTotalServ.Text := FormatFloat(CasasDecimais('Produtos'),ibControleServ.FieldByName('TOTAL').AsFloat);
      memoObs.Text := ibControleServ.FieldByName('OBS').AsString;

    end;//if ck

  end;//with

end;

procedure TfrmEmissaoServicos.ibeaExcluirServicoClick(Sender: TObject);

var
ConfirmaExclusao : Integer;


begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Confirma a Exclusão do Serviço?','Exclusão de Serviço',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 then begin

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('DELETE FROM TBLSERVICOS WHERE IDNUMEROSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibServicos.ExecSQL;
      Commit(ibServicos);

      ibControleServ.Close;
      ibControleServ.SQL.Clear;
      ibControleServ.SQL.Add('DELETE FROM TBLCONTROLESERVICOS WHERE CODIGOSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibControleServ.ExecSQL;
      Commit(ibControleServ);

    end;//if cofirmaexclusao

      lbl_edtTrazerServico.Clear;
      memoObs.Clear;

  end;//with

end;

procedure TfrmEmissaoServicos.lbl_edtTrazerServicoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtVlrTotalServ.SetFocus;

  end;//if

end;

procedure TfrmEmissaoServicos.ibeaImprimirFichaClick(Sender: TObject);

var
CodBarras : String;
OleGraphic: TOleGraphic;
fs: TFileStream;
begin

  with dmModule do begin

       Commit(ibServicos);
       ibServicos.Close;
       ibServicos.SQL.Clear;
       ibServicos.SQL.Add('SELECT TBLSERVICOS.*,TBLCADASTRO.NOME As Cliente,'
       + 'TBLCADASTRO.TELEFONE As FoneCli, TBLCADASTRO.CELULAR As CelularCli,'
       + 'TBLCADASTRO.NUMERO As NumeroCasa,TBLCADASTRO.CEP As CepCli,TBLLOGRADOURO.ENDERECO As EndCli,'
       + 'TBLLOGRADOURO.BAIRRO As BairroCli,TBLUSER.NOME As NomeFunc,'
       + 'TBLCONTROLESERVICOS.DATA  As DataServico,TBLCONTROLESERVICOS.OBS As Observacao FROM TBLSERVICOS '
       + 'LEFT OUTER JOIN TBLCADASTRO ON TBLSERVICOS.IDCLIENTE=TBLCADASTRO.IDCAD '
       + 'LEFT OUTER JOIN TBLLOGRADOURO ON TBLSERVICOS.IDCLIENTE=TBLLOGRADOURO.IDCAD '
       + 'LEFT OUTER JOIN TBLUSER ON TBLSERVICOS.IDFUNC=TBLUSER.IDUSER '
       + 'LEFT OUTER JOIN TBLCONTROLESERVICOS ON TBLSERVICOS.IDNUMEROSERVICO=TBLCONTROLESERVICOS.CODIGOSERVICO WHERE IDNUMEROSERVICO=''' + lbl_edtTrazerServico.Text + '''');
       ibServicos.Open;
       { ibControleServ.Close;
        ibControleServ.SQL.Clear;
        ibControleServ.SQL.Add('SELECT TBLCONTROLESERVICOS.*,TBLSERVICOS.QTDE,'
        + 'TBLSERVICOS.VLRA,TBLSERVICOS.VLRB,TBLSERVICOS.NOMEPROD,'
        + 'TBLSERVICOS.VLRTOTAL FROM TBLCONTROLESERVICOS '
        + 'INNER JOIN TBLSERVICOS ON TBLCONTROLESERVICOS.CODIGOSERVICO=TBLSERVICOS.IDNUMEROSERVICO WHERE TBLSERVICOS.IDNUMEROSERVICO=''' + lbl_edtTrazerServico.Text + '''');
        ibControleServ.Open; }

        CodBarras  := lbl_edtTrazerServico.Text;

        Application.CreateForm(TfrmRelatServicosEmitidos, frmRelatServicosEmitidos);

      TRY

        with frmRelatServicosEmitidos do begin

          frmRelatServicosEmitidos.qrpServicosEmitidos.DataSet := ibServicos;

          if CodBarras <> '' Then begin

             CriaCodigo(CodBarras,qrimgCodBarras.Canvas);
             qrl_CodBarra.Caption        := CodBarras;

           end else begin//if (ibTempEtiqueta6089.FieldByName('ETIQUETA1').AsString = 'Nao')or(ibTempEtiqueta6089.FieldByName('ETIQUETA1').AsString = '')Then begin

             qrimgCodBarras.Picture := nil;
             qrl_CodBarra.Caption        := '';

           end;

          //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
          qrdbServico.DataSet     := ibServicos;
          qrdbServico.DataField   := ibServicos.FieldByName('NOMESERVICO').FieldName;

          qrdbServicoAvulso.DataSet     := ibServicos;
          qrdbServicoAvulso.DataField   := ibServicos.FieldByName('servicoavulso').FieldName;

          qrdbVlrUnit.DataSet     := ibServicos;
          qrdbVlrUnit.DataField   := ibServicos.FieldByName('VLRA').FieldName;
          (ibServicos.FieldByName('VLRA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

         //// qrdb_VlrB.DataSet       := ibServicos;
        ////  qrdb_VlrB.DataField     := ibServicos.FieldByName('VLRB').FieldName;
        ////  (ibServicos.FieldByName('VLRB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbTotal.DataSet          := ibServicos;
          qrdbTotal.DataField        := ibServicos.FieldByName('VLRTOTAL').FieldName;
          (ibServicos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

          qrdbData.DataSet          := ibServicos;
          qrdbData.DataField        := ibServicos.FieldByName('DATA').FieldName;

          qrdbFuncionario.DataSet          := ibServicos;
          qrdbFuncionario.DataField        := ibServicos.FieldByName('NomeFunc').FieldName;

          qrdbEndereco.DataSet          := ibServicos;
          qrdbEndereco.DataField        := ibServicos.FieldByName('EndCli').FieldName;

          qrdbNumero.DataSet          := ibServicos;
          qrdbNumero.DataField        := ibServicos.FieldByName('NumeroCasa').FieldName;

          qrdbBairro.DataSet          := ibServicos;
          qrdbBairro.DataField        := ibServicos.FieldByName('BairroCli').FieldName;

          qrdbCep.DataSet          := ibServicos;
          qrdbCep.DataField        := ibServicos.FieldByName('CepCli').FieldName;
          (ibServicos.FieldByName('CepCli') as TIntegerField).DisplayFormat := CasasDecimais('FormatoCep'); //CRIA UMA MASCARA PARA O CAMPO

          if ibServicos.FieldByName('IDCLIENTE').AsInteger > 0 Then begin

            qrdbNomeCliente.DataSet           := ibServicos;
            qrdbNomeCliente.DataField         := ibServicos.FieldByName('Cliente').FieldName;

            qrdbTelefoneCliente.DataSet           := ibServicos;
            qrdbTelefoneCliente.DataField         := ibServicos.FieldByName('FoneCli').FieldName;

          end;

          qrdbObs.Lines.Text := ibServicos.FieldByName('Observacao').AsString;

          {  Commit(ibDadosEmpresa);
            ibDadosEmpresa.Close;
            ibDadosEmpresa.SQL.Clear;
            ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
            ibDadosEmpresa.Open;

            qrl_NomeEmpr.Caption      := ibDadosEmpresa.FieldByName('NOME').AsString;
            qrl_EnderecoEmpr.Caption  := ibDadosEmpresa.FieldByName('ENDERECO').AsString;
            qrl_BairroEmpr.Caption    := ibDadosEmpresa.FieldByName('BAIRRO').AsString;
            qrl_TelefoneEmpr.Caption  := ibDadosEmpresa.FieldByName('TELEFONE').AsString;}


////////////////////////////////////////////////////////////////////////////////

       //ROTINA PARA EXIBIR A IMAGEM DO PRODUTO
      if Not FileExists(ExtractFilePath(Application.ExeName) + 'Data\RunTime\Imagens_Sistema\logo fama2.jpg' ) Then begin

        frmRelatServicosEmitidos.imgLogo.Picture := Nil; //LIMPA A IMAGEM

      end else begin

        try

          frmRelatServicosEmitidos.imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+ '\Data\RunTime\Imagens_Sistema\logo fama2.jpg');

        finally
          fs.Free;
          OleGraphic.Free
        end;

       end;
       
////////////////////////////////////////////////////////////////////////////////


          qrpServicosEmitidos.Preview;

        end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelatServicosEmitidos.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

  end;//with

end;

procedure TfrmEmissaoServicos.ibeaAlterarServicoClick(Sender: TObject);

var
ConfirmaAlteracao : Integer;


begin

  with dmModule do begin

  ConfirmaAlteracao := Application.MessageBox('Confirma a Alteração da Observação?','Alteração de Serviço',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaAlteracao = 6 then begin

      ibControleServ.Close;
      ibControleServ.SQL.Clear;
      ibControleServ.SQL.Add('UPDATE TBLCONTROLESERVICOS SET '
      + 'OBS=''' + memoObs.Text + ''' WHERE CODIGOSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibControleServ.ExecSQL;
      Commit(ibControleServ);

    end;//if cofirmaexclusao

      Commit(ibControleServ);
      ibControleServ.Close;
      ibControleServ.SQL.Clear;
      ibControleServ.SQL.Add('SELECT * FROM TBLCONTROLESERVICOS WHERE CODIGOSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibControleServ.Open;

      lbl_edtVlrTotalServ.Text := FormatFloat(CasasDecimais('Produtos'),ibControleServ.FieldByName('TOTAL').AsFloat);
      memoObs.Text := ibControleServ.FieldByName('OBS').AsString;

  end;//with

end;

procedure TfrmEmissaoServicos.ibeaLimparServicoClick(Sender: TObject);
begin

  with dmModule do begin

    lbl_edtTrazerServico.Clear;
    lbl_edtVlrTotalServ.Clear;
    memoObs.Clear;
    ibServicos.Close;
    ibControleServ.Close;

  end;//with

end;

procedure TfrmEmissaoServicos.lbl_edtVlrUnitExit(Sender: TObject);
begin


  if lbl_edtVlrUnit.Text <> '' Then begin

    lbl_edtVlrTotal.Text := lbl_edtVlrUnit.Text;
    lbl_edtVlrTotal.Text := FormatFloat(CasasDecimais('Produtos'),StrToFloat(lbl_edtVlrTotal.Text));
    lbl_edtVlrUnit.Text  := FormatFloat(CasasDecimais('Produtos'),StrToFloat(lbl_edtVlrUnit.Text));

  end;

end;

procedure TfrmEmissaoServicos.lbl_edtVlrUnitKeyPress(Sender: TObject;
  var Key: Char);
begin


  if key = #13 Then begin

    lbl_edtVlrTotal.SetFocus;

  end;

end;

procedure TfrmEmissaoServicos.ibeaBaixarServicoClick(Sender: TObject);

var
Situacao  : String;
ConfirmaBx : Integer;

begin

  with dmModule do begin

    ConfirmaBx := Application.MessageBox('Confirma a baixa?','Baixa de Serviço',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaBx = 6 Then begin

      Situacao := 'Baixado';

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('UPDATE TBLSERVICOS SET '
      + 'DATADABAIXA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''','
      + 'SITUACAO = ''' + Situacao + ''' WHERE IDNUMEROSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibServicos.ExecSQL;
      Commit(ibServicos);

      ibControleServ.Close;
      ibControleServ.SQL.Clear;
      ibControleServ.SQL.Add('UPDATE TBLCONTROLESERVICOS SET '
      + 'DATADABAIXA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''','
      + 'SITUACAO = ''' + Situacao + ''' WHERE CODIGOSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibControleServ.ExecSQL;
      Commit(ibControleServ);

    end;//if

  end;//with

end;

procedure TfrmEmissaoServicos.ibeaRetornoServicoClick(Sender: TObject);

var
Situacao  : String;
ConfirmaBx : Integer;

begin

  with dmModule do begin

    ConfirmaBx := Application.MessageBox('Confirma o Retorno?','Retorno de Serviço',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaBx = 6 Then begin

      Situacao := 'Pendente';

      ibServicos.Close;
      ibServicos.SQL.Clear;
      ibServicos.SQL.Add('UPDATE TBLSERVICOS SET '
      + 'SITUACAO = ''' + Situacao + ''' WHERE IDNUMEROSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibServicos.ExecSQL;
      Commit(ibServicos);

      ibControleServ.Close;
      ibControleServ.SQL.Clear;
      ibControleServ.SQL.Add('UPDATE TBLCONTROLESERVICOS SET '
      + 'SITUACAO = ''' + Situacao + ''' WHERE CODIGOSERVICO=''' + lbl_edtTrazerServico.Text + '''');
      ibControleServ.ExecSQL;
      Commit(ibControleServ);

    end;//if

  end;//with


end;

procedure TfrmEmissaoServicos.ckAbertoCheck(Sender: TObject);
begin

  if ckAberto.Checked Then begin

    ckBaixado.Checked := False;
    lbl_edtTrazerServico.SetFocus;

  end;

end;

procedure TfrmEmissaoServicos.ckBaixadoCheck(Sender: TObject);
begin

  if ckBaixado.Checked Then begin

    ckAberto.Checked := False;
    lbl_edtTrazerServico.SetFocus;
    
  end;

end;

procedure TfrmEmissaoServicos.lbl_edtServicoAvulsoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtVlrUnit.SetFocus;
    
  end;//if

end;

procedure TfrmEmissaoServicos.ibeaRelatorioPClick(Sender: TObject);
begin
frmOSPeriodo.ShowModal;
end;

end.



