unit untCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  ExtCtrls, Grids, DBGrids, ComCtrls,
  IBQuery, classComboBox, Data.DB;

type
  TfrmCotacao = class(TForm)
    pcCotacao: TPageControl;
    tbsCotacao: TTabSheet;
    tbsManutHist: TTabSheet;
    cboFornecedores: TComboBox;
    lbl_Forn: TLabel;
    lbl_edtNomeProd: TLabeledEdit;
    lbl_edtVlrCotacao: TLabeledEdit;
    lbl_DTCotacao: TLabel;
    lbl_edtTotalCotacao: TLabeledEdit;
    lbl_DTIni: TLabel;
    lbl_DTF: TLabel;
    cboFornecedorCon: TComboBox;
    lbl_ConForn: TLabel;
    dbgConsulta: TDBGrid;
    lbl_edtTotalConsulta: TLabeledEdit;
    lbl_edtNumeroCotacao: TLabeledEdit;
    lbl_edtIDProd: TLabeledEdit;
    lbl_edtQtde: TLabeledEdit;
    lbl_edtTotal: TLabeledEdit;
    dbgCotacao: TDBGrid;
    dtpDataInicial: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    dtpDataCotacao: TDateTimePicker;
    procedure bmxSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTFornecedor;
    procedure SelectFornecedorConsulta;
    procedure SelectCotacao;
    procedure IncluirCotacao;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btLimparCamposClick(Sender: TObject);
    procedure bmxGerarCotacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_edtQtdeExit(Sender: TObject);
    procedure bmxIncluirClick(Sender: TObject);
    procedure lbl_edtVlrCotacaoKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure lbl_edtVlrCotacaoExit(Sender: TObject);
    procedure dbgCotacaoCellClick(Column: TColumn);
    procedure bmxExcluirClick(Sender: TObject);
    procedure pcCotacaoChange(Sender: TObject);
    procedure cboFornecedorConChange(Sender: TObject);
    procedure dbgConsultaCellClick(Column: TColumn);
    procedure bmxExcluirConsultaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCotacao: TfrmCotacao;
  MontaColunas, MontaColunasCotacao : Boolean;
  IDCotacao,IDConsultaCotacao,IDDetalheConsulta : Integer;
  
implementation

uses funcPosto, untdmModule, uBuscaProdutos;

{$R *.dfm}

procedure TfrmCotacao.bmxSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCotacao.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmCotacao.ExecSELECTFornecedor;

var
  IDClassForn : Integer;
  ClassForn : TClasseCombo;
begin
  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClassForn := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICA��O DO FORNECEDOR NA VARIAVEL.

    Commit(ibCadastro);
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClassForn)+ ''' ORDER BY NOME');//('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboFornecedores.Clear; //LIMPA O COMBOBOX
    while not ibCadastro.Eof do begin
      ClassForn    := TClasseCombo.Create;
      ClassForn.ID  := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboFornecedores.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,ClassForn);
      ibCadastro.Next;
    end;
  end;
end;


procedure TfrmCotacao.SelectFornecedorConsulta;

var
  IDClassFornC : Integer;
  ClassFornC : TClasseCombo;
begin
  with dmModule do begin

    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Fornecedores''');
    ibClassificacao.Open;
    IDClassFornC := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICA��O DO FORNECEDOR NA VARIAVEL.

    Commit(ibCadastro);
    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClassFornC)+ ''' ORDER BY NOME');//('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClass) + ''' ORDER BY NOME');
    ibCadastro.Open;

    cboFornecedorCon.Clear; //LIMPA O COMBOBOX
    while not ibCadastro.Eof do begin
      ClassFornC    := TClasseCombo.Create;
      ClassFornC.ID  := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboFornecedorCon.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,ClassFornC);
      ibCadastro.Next;
    end;
  end;
end;


procedure TfrmCotacao.IncluirCotacao;

var
IDGravarFornecedor : TClasseCombo;
StringGravarFornecedor, VlrTotalCotacao,Valor,Qtde,Total : String;
IDProdCotacao, IDDetalheCotacao : Integer;
Valor1,Valor2,Valor3 : Real;

begin

  with dmModule do begin

    If cboFornecedores.ItemIndex = -1 Then begin

      StringGravarFornecedor := ' ''0'',';

    end else begin

      IDGravarFornecedor   := TClasseCombo( cboFornecedores.Items.Objects[cboFornecedores.ItemIndex] );
      StringGravarFornecedor  := ' ''' + InttoStr( IDGravarFornecedor.ID ) + ''',';

    end;{ifcbotipopagto}

    if lbl_edtIDProd.Text > '0' Then begin

      IDProdCotacao := StrToInt(lbl_edtIDProd.Text);

    end else begin

      IDProdCotacao := 0;

    end;

    Valor := StringReplace(lbl_edtVlrCotacao.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    Valor := StringReplace(Valor,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if Valor = '' Then
       Valor := '0';

    Qtde := StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    Qtde := StringReplace(Qtde,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if Qtde = '' Then
       Qtde := '0';

    Total := StringReplace(lbl_edtTotal.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    Total := StringReplace(Total,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if Total = '' Then
       Total := '0';


    if lbl_edtNumeroCotacao.Text > '0' then begin

      IDDetalheCotacao := StrToInt(lbl_edtNumeroCotacao.Text);

    end else begin

      IDDetalheCotacao := 0;

    end;

    ibCotacao.Close;
    ibCotacao.SQL.Clear;
    ibCotacao.SQL.Add('INSERT INTO TBLCOTACAO'
    + '(DATACOTACAO,IDDETALHECOTACAO,IDFORNECEDOR,NOMEFORNECEDOR,IDPRODUTO,'
    + 'NOMEPRODUTO,VLRCOTACAO,QTDE,TOTAL) values '
    + '(''' + FormatDateTime('mm-dd-yyyy',Now) + ''','
    + ' ''' + IntToStr(IDDetalheCotacao) + ''','
    + StringGravarFornecedor
    + ' ''' + cboFornecedores.Text + ''','
    + ' ''' + IntToStr(IDProdCotacao) + ''','
    + ' ''' + lbl_edtNomeProd.Text + ''','
    + ' ''' + Valor + ''','
    + ' ''' + Qtde + ''','
    + ' ''' + Total + ''')');
    ibCotacao.ExecSQL;
    Commit(ibCotacao);

/////////////////////////////////////////////////////////////////////////////////
      if lbl_edtTotal.Text <> '' Then begin// se for em branco executa rotina abaixo.

        if (Pos(',',lbl_edtTotal.Text)>0) and (lbl_edtTotal.Text <> '') Then begin

          Valor1 := StrToFloat(StringReplace(lbl_edtTotal.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          if lbl_edtTotalCotacao.Text = '' Then begin

            lbl_edtTotalCotacao.Text := FormatFloat(',0.00',(Valor1));

          end else begin

            Valor2 := StrToFloat(StringReplace(lbl_edtTotalCotacao.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
            Valor3 := (Valor2 + Valor1);

            lbl_edtTotalCotacao.Text := FormatFloat(',0.00',(Valor3));

          end;

        end;

      end;
////////////////////////////////////////////////////////////////////////////////

    lbl_edtNomeProd.Clear;
    lbl_edtVlrCotacao.Clear;
    lbl_edtIDProd.Clear;
    lbl_edtQtde.Text := '1';
    lbl_edtTotal.Clear;
  
  end;//with

end;

procedure TfrmCotacao.SelectCotacao;

var

NumeroDetalheCotacao : Integer;

begin

  with dmModule do begin

    if lbl_edtNumeroCotacao.Text > '0' Then begin

       NumeroDetalheCotacao := StrToInt(lbl_edtNumeroCotacao.Text);

    end else begin

       NumeroDetalheCotacao := 0;

    end;//if numero cotacao

      Commit(ibCotacao);
      ibCotacao.Close;
      ibCotacao.SQL.Clear;
      ibCotacao.SQL.Add('SELECT * FROM TBLCOTACAO WHERE IDDETALHECOTACAO=''' + IntToStr(NumeroDetalheCotacao) + '''');
      ibCotacao.Open;

      (ibCotacao.FieldByName('VLRCOTACAO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibCotacao.FieldByName('TOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibCotacao.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }

  end;//with

end;

procedure TfrmCotacao.FormShow(Sender: TObject);
begin

dtpDataCotacao.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
dtpDataInicial.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
dtpDataFinal.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
lbl_edtNomeProd.Clear;
lbl_edtVlrCotacao.Text := '0,00';
cboFornecedores.ClearSelection;
lbl_edtQtde.Text := '1';
lbl_edtTotal.Clear;
lbl_edtTotalCotacao.Clear;
lbl_edtNumeroCotacao.Clear;
pcCotacao.ActivePageIndex := 0;

  with dmModule do begin

    ExecSELECTFornecedor;

    with dbgCotacao do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin

         DataSource := dtsCotacao;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);

        //Parametros da Coluna que exibe o C�digo da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'NOMEPRODUTO';
        Columns.Items[0].Width         := 100;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Vlr.Cota��o';
        Columns.Items[1].FieldName     := 'VLRCOTACAO';
        Columns.Items[1].Width         := 70;
        Columns.Items[1].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[2].Title.Caption := 'Qtde';
        Columns.Items[2].FieldName     := 'QTDE';
        Columns.Items[2].Width         := 70;
        Columns.Items[2].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[3].Title.Caption := 'Total';
        Columns.Items[3].FieldName     := 'TOTAL';
        Columns.Items[3].Width         := 70;
        Columns.Items[3].Alignment     := taLeftJustify;

        MontaColunas := False;

      end;{if}

    end;{with}

////////////////////////////////////////////////////////////////////////////////

    with dbgConsulta do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColunasCotacao Then begin

         DataSource := dtsTempCotacao;

        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);

        //Parametros da Coluna que exibe o C�digo da entrada no estoque
        Columns.Items[0].Title.Caption := 'Produto';
        Columns.Items[0].FieldName     := 'NOMEPRODUTO';
        Columns.Items[0].Width         := 100;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[1].Title.Caption := 'Vlr.Cota��o';
        Columns.Items[1].FieldName     := 'VLRCOTACAO';
        Columns.Items[1].Width         := 70;
        Columns.Items[1].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[2].Title.Caption := 'Qtde';
        Columns.Items[2].FieldName     := 'QTDE';
        Columns.Items[2].Width         := 70;
        Columns.Items[2].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no estoque.
        Columns.Items[3].Title.Caption := 'Total';
        Columns.Items[3].FieldName     := 'TOTAL';
        Columns.Items[3].Width         := 70;
        Columns.Items[3].Alignment     := taLeftJustify;

        MontaColunasCotacao := False;

      end;{if}

    end;{with}

////////////////////////////////////////////////////////////////////////////////

  end;//with

end;

procedure TfrmCotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  with dmModule do begin

    case key of

      VK_F7 :begin

          try
             if frmBuscaProdutos = Nil then
                frmBuscaProdutos := TfrmBuscaProdutos.Create(self);
          except
              ShowMessage('Erro na cria��o do formul�rio !!');
              exit;
          end;

          frmBuscaProdutos.ShowModal;
          FreeAndNil(frmBuscaProdutos);

      end;//begin

    end;

  end;//with

end;

procedure TfrmCotacao.btLimparCamposClick(Sender: TObject);
begin

lbl_edtNomeProd.Clear;
lbl_edtVlrCotacao.Text := '0,00';

end;

procedure TfrmCotacao.bmxGerarCotacaoClick(Sender: TObject);

var
TotalCompra : String;
begin

  with dmModule do begin

    TotalCompra := StringReplace(lbl_edtTotalCotacao.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    TotalCompra := StringReplace(TotalCompra,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if TotalCompra = '' Then
    TotalCompra := '0';

      ibCotacao.Close;

  end;//with

end;

procedure TfrmCotacao.FormCreate(Sender: TObject);
begin

  MontaColunas := True;
  MontaColunasCotacao := True;
  
end;

procedure TfrmCotacao.lbl_edtQtdeExit(Sender: TObject);

var

Valor1,Valor2,Valor3,Valor4 : Real;

begin
  if lbl_edtQtde.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQtde.Text)>0) and (lbl_edtQtde.Text <> '') Then begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrCotacao.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      lbl_edtTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrCotacao.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));


    end;{if}

  end;{if}


end;

procedure TfrmCotacao.bmxIncluirClick(Sender: TObject);
begin

  with dmModule do begin

    IncluirCotacao;
    SelectCotacao;

    lbl_edtNomeProd.Clear;
    lbl_edtIDProd.Clear;
    lbl_edtQtde.Text := '1';
    lbl_edtTotal.Clear;

  end;//with

end;

procedure TfrmCotacao.lbl_edtVlrCotacaoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtQtde.SetFocus;
    
  end;//if

end;

procedure TfrmCotacao.lbl_edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin

  if key=#13 Then begin

    lbl_edtTotal.SetFocus;
    
  end;//if

end;

procedure TfrmCotacao.lbl_edtVlrCotacaoExit(Sender: TObject);
begin

  if (lbl_edtVlrCotacao.Text <> '') Then begin

    lbl_edtVlrCotacao.Text := FormatFloat(Casasdecimais('Produtos'),StrToFloat(lbl_edtVlrCotacao.Text));

  end else begin

    lbl_edtVlrCotacao.Text := '0,00';

  end;//if

end;

procedure TfrmCotacao.dbgCotacaoCellClick(Column: TColumn);

var

i  : Integer;

begin

  with dmModule do begin

    IDCotacao := ibCotacao.FieldByName('IDCOTACAO').AsInteger;

    if ibCotacao.RecordCount > 0 Then begin


      lbl_edtNomeProd.Text  := ibCotacao.FieldByName('NOMEPRODUTO').AsString;
      lbl_edtIDProd.Text    := IntToStr(ibCotacao.FieldByName('IDPRODUTO').AsInteger);
      lbl_edtVlrCotacao.Text   := FormatFloat(CasasDecimais('Produtos'),ibCotacao.FieldByName('VLRCOTACAO').AsFloat);
      lbl_edtQtde.Text      := FormatFloat(CasasDecimais('Produtos'),ibCotacao.FieldByName('QTDE').AsFloat);
      lbl_edtTotal.Text := FormatFloat(CasasDecimais('Produtos'),ibCotacao.FieldByName('TOTAL').AsFloat);

      for i:=0 to cboFornecedores.Items.Count -1 do begin
        if TClasseCombo( cboFornecedores.Items.Objects[i]).ID = ibCotacao.FieldByName('IDFORNECEDOR').AsInteger then begin
          cboFornecedores.ItemIndex:= i;
          Break;
        end else begin
          cboFornecedores.ClearSelection;
        end;
      end;//for

    end;//if record count

  end;//with

end;

procedure TfrmCotacao.bmxExcluirClick(Sender: TObject);

var

ConfirmaExclusao : Integer;
ValorProduto : Real;
TotalCotacao : String;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Confirma a Exclus�o?','Exclus�o de Registro',+MB_YESNO+MB_ICONQUESTION+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      ibCotacao.Close;
      ibCotacao.SQL.Clear;
      ibCotacao.SQL.Add('DELETE FROM TBLCOTACAO WHERE IDCOTACAO=''' + IntToStr(IDCotacao) + '''');
      ibCotacao.ExecSQL;

    end;//if

    SelectCotacao;

////////////////////////////////////////////////////////////////////////////////

    while not ibCotacao.Eof do begin//enquanto nao for fim de registro

          if (ValorProduto = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorProduto := StrtoFloat(StringReplace(FloattoStr(ibCotacao.FieldByName('TOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            TotalCotacao := StringReplace(FloattoStr(ibCotacao.FieldByName('TOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorProduto := ValorProduto + StrtoFloat(StringReplace(TotalCotacao,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;{if}

          ibCotacao.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}


     lbl_edtTotalCotacao.Text   := FormatFloat(CasasDecimais('Produtos'),ValorProduto);

////////////////////////////////////////////////////////////////////////////////



    lbl_edtNomeProd.Clear;
    lbl_edtIDProd.Clear;
    lbl_edtQtde.Text := '1';
    lbl_edtTotal.Clear;

  end;//with

end;

procedure TfrmCotacao.pcCotacaoChange(Sender: TObject);
begin

  with dmModule do begin

     if pcCotacao.ActivePage.TabIndex = 0 Then begin

       ibTempCotacao.Close;
       cboFornecedorCon.ClearSelection;
       lbl_edtTotalConsulta.Clear;

     end else if pcCotacao.ActivePage.TabIndex = 1 Then begin

       SelectFornecedorConsulta;

     end;//if

   end;//with

end;

procedure TfrmCotacao.cboFornecedorConChange(Sender: TObject);

var

IDClassfornecedor : TClasseCombo;
ValorProduto : Real;
TotalCotacao : String;

begin

  with dmModule do begin

    if cboFornecedorCon.ItemIndex <> - 1 Then begin

      IDClassfornecedor := TClasseCombo( cboFornecedorCon.Items.Objects[cboFornecedorCon.ItemIndex] );

      Commit(ibTempCotacao);
      ibTempCotacao.Close;
      ibTempCotacao.SQL.Clear;
      ibTempCotacao.SQL.Add('SELECT TBLCOTACAO.*,TBLCADASTRO.NOME As Fornecedor FROM TBLCOTACAO'
      + ' LEFT OUTER JOIN  TBLCADASTRO ON TBLCOTACAO.IDFORNECEDOR=TBLCADASTRO.IDCAD WHERE(TBLCOTACAO.DATACOTACAO Between :ParamDataIni and :ParamDataF)and TBLCOTACAO.IDFORNECEDOR=''' + IntToStr(IDClassfornecedor.ID) + ''' ORDER BY TBLCOTACAO.NOMEPRODUTO');
      ibTempCotacao.Open;

      ibTempCotacao.Close;
      ibTempCotacao.ParamByName('ParamDataIni').Value      := dtpDataInicial.DateTime;
      ibTempCotacao.ParamByName('ParamDataF').Value        := dtpDataFinal.DateTime;
      ibTempCotacao.Open;

      (ibTempCotacao.FieldByName('VLRCOTACAO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempCotacao.FieldByName('TOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibTempCotacao.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }


////////////////////////////////////////////////////////////////////////////////

    while not ibTempCotacao.Eof do begin//enquanto nao for fim de registro

          if (ValorProduto = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorProduto := StrtoFloat(StringReplace(FloattoStr(ibTempCotacao.FieldByName('TOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            TotalCotacao := StringReplace(FloattoStr(ibTempCotacao.FieldByName('TOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorProduto := ValorProduto + StrtoFloat(StringReplace(TotalCotacao,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;{if}

          ibTempCotacao.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}


     lbl_edtTotalConsulta.Text   := FormatFloat(CasasDecimais('Produtos'),ValorProduto);

////////////////////////////////////////////////////////////////////////////////

    end;//if

  end;//with

end;

procedure TfrmCotacao.dbgConsultaCellClick(Column: TColumn);

var

i  : Integer;

begin

  with dmModule do begin

    IDConsultaCotacao := ibTempCotacao.FieldByName('IDCOTACAO').AsInteger;
    IDDetalheConsulta := ibTempCotacao.FieldByName('IDDETALHECOTACAO').AsInteger;

    if ibTempCotacao.RecordCount > 0 Then begin

      for i:=0 to cboFornecedorCon.Items.Count -1 do begin
        if TClasseCombo( cboFornecedorCon.Items.Objects[i]).ID = ibTempCotacao.FieldByName('IDFORNECEDOR').AsInteger then begin
          cboFornecedorCon.ItemIndex:= i;
          Break;
        end else begin
          cboFornecedorCon.ClearSelection;
        end;
      end;//for

    end;//if record count

  end;//with
  
end;

procedure TfrmCotacao.bmxExcluirConsultaClick(Sender: TObject);

var

ConfirmaExclusao : Integer;
ValorProduto : Real;
TotalCotacao : String;

begin

  with dmModule do begin

  ConfirmaExclusao := Application.MessageBox('Confirma a Exclus�o?','Exclus�o de Registro',+MB_YESNO+MB_ICONQUESTION+MB_ICONQUESTION);

    if ConfirmaExclusao = 6 Then begin

      ibTempCotacao.Close;
      ibTempCotacao.SQL.Clear;
      ibTempCotacao.SQL.Add('DELETE FROM TBLCOTACAO WHERE IDCOTACAO=''' + IntToStr(IDConsultaCotacao) + '''');
      ibTempCotacao.ExecSQL;

   {   Commit(ibTempCotacao);
      ibTempCotacao.Close;
      ibTempCotacao.SQL.Clear;
      ibTempCotacao.SQL.Add('SELECT * FROM TBLCOTACAO WHERE IDDETALHECOTACAO=''' + IntToStr(IDDetalheConsulta) + '''');
      ibTempCotacao.Open;

      (ibTempCotacao.FieldByName('VLRCOTACAO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibTempCotacao.FieldByName('TOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      FormatFloat('0',ibTempCotacao.FieldByName('QTDE').AsFloat); //CRIA UMA MASCARA PARA O CAMPO   }

    end;//if

    cboFornecedorConChange(Sender);

////////////////////////////////////////////////////////////////////////////////

    while not ibTempCotacao.Eof do begin//enquanto nao for fim de registro

          if (ValorProduto = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorProduto := StrtoFloat(StringReplace(FloattoStr(ibTempCotacao.FieldByName('TOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            TotalCotacao := StringReplace(FloattoStr(ibTempCotacao.FieldByName('TOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorProduto := ValorProduto + StrtoFloat(StringReplace(TotalCotacao,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;{if}

          ibTempCotacao.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}


     lbl_edtTotalConsulta.Text   := FormatFloat(CasasDecimais('Produtos'),ValorProduto);

////////////////////////////////////////////////////////////////////////////////

  end;//with


end;

end.
