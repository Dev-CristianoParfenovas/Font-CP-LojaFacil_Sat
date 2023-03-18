unit Inventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls, IBEAntialiasButton,
  mxFlatControls, classComboBox, IniFiles, RxGIF, Gauges, IBQuery;

type
  TfrmInventario = class(TForm)
    ibeaNovo: TIBEAntialiasButton;
    ibeaAlterar: TIBEAntialiasButton;
    ibeaConsultar: TIBEAntialiasButton;
    ibeaExcluir: TIBEAntialiasButton;
    ibeaPrimeiro: TIBEAntialiasButton;
    ibeaAnterior: TIBEAntialiasButton;
    ibeaProximo: TIBEAntialiasButton;
    ibeaUltimo: TIBEAntialiasButton;
    ibeaSair: TIBEAntialiasButton;
    mxFlatPanel1: TmxFlatPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    gStatusImportacao: TGauge;
    Label9: TLabel;
    btnZerarEstoque: TIBEAntialiasButton;
    Shape1: TShape;
    dtpDatainvent: TmxFlatDateTimePicker;
    Label1: TLabel;
    cboEstoque: TComboBox;
    lblLocalestoq: TLabel;
    lbl_edtCodigo: TLabeledEdit;
    Image1: TImage;
    BN: TLabel;
    Image7: TImage;
    lbl_edtCodbarra: TLabeledEdit;
    cboProduto: TComboBox;
    lblProduto: TLabel;
    lbl_edtQuantidade: TLabeledEdit;
    lbl_edtVlrunit: TLabeledEdit;
    lbl_edtVlrtotal: TLabeledEdit;
    ibeaIncluiProd: TIBEAntialiasButton;
    dbgInventario: TDBGrid;
    Label2: TLabel;
    Image2: TImage;
    Label7: TLabel;
    Image3: TImage;
    dbgProdinvent: TDBGrid;
    Label8: TLabel;
    Image13: TImage;
    Label10: TLabel;

    procedure Commit(IBQueryExec : TIBQuery);
    procedure AlteraInventario;
    procedure DesabilitaCampos(opcao:Boolean);
    procedure DesabilitaCamposProd(opcao:Boolean);
    procedure LimpaCampo;
    procedure ExibeDados;
    procedure ExecSELECTEstoque;
    procedure ExecSELECTProd;
    procedure ExecSELECTInvent;
    procedure FormShow(Sender: TObject);
    procedure ibeaSairClick(Sender: TObject);
    procedure ibeaNovoClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cboProdutoChange(Sender: TObject);
    procedure ibeaPrimeiroClick(Sender: TObject);
    procedure ibeaAnteriorClick(Sender: TObject);
    procedure ibeaProximoClick(Sender: TObject);
    procedure ibeaUltimoClick(Sender: TObject);
    procedure cboEstoqueClick(Sender: TObject);
    procedure ibeaIncluiProdClick(Sender: TObject);
    procedure lbl_edtQuantidadeExit(Sender: TObject);
    procedure lbl_edtVlrtotalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInventario: TfrmInventario;
  ConfirmaMSG : Integer;
  IDCad : Integer;
  IDClass : Integer;
  IDClassEstoque : Integer;
  IDClassProd : Integer;
  IDInventario : Integer;
  Qtdeitens : Integer;
  IDEstoque : TClasseCombo;
  ClassProd : TClasseCombo;
  ClassConsultaProd : TClasseCombo;
  IDProduto : TClasseCombo;
  StringProd : String;
  StringEstoque : String;
  Incluiprod : Boolean;
  MontaColunas : Boolean;
  MontaColunasProd : Boolean;
  ExibeRegistro : Boolean;

  //VARIAVEIS PARA AS CASAS DECIMAIS
  ConfigSiS : TIniFile;
  FormatoMoeda : String;
  Casas : Longint;
  ValorCusto : String;
  ValorVendaa : String;
  ValorVendab : String;
  ValorVendac : String;
  Erro : Boolean;


  IDInvProduto : Integer;//para marmazenar o id do produto para update na inclusao

  implementation

uses DB, funcPosto, untdmModule;

{$R *.dfm}


function CasasDecimais: String;
begin

  with ConfigSiS do begin

    ConfigSiS := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\RunTime\sis.ini'); //Cria o vinculo com o Arquivo ini
    Casas := ReadInteger('Formatacoes','FormatoMoedaCasas',2);//atribui as chaves do arquivo ini na variavel

    if Casas = 2 Then begin
      Result := ',0.00';
    end else begin
      Result := ',0.000';
    end; {if}

  end; {if}

end;


procedure TfrmInventario.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmInventario.AlteraInventario;
begin
{  with dmModule do begin

    If cboEstoque.ItemIndex = -1 Then begin

      StringEstoque    := ', ESTOQUE=''0''';

    end else begin

      IDEstoque         := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );
      StringEstoque     := ', ESTOQUE=''' + InttoStr( IDEstoque.ID ) + '''';

      ibInventario.Close;
      ibInventario.SQL.Clear;
      ibInventario.SQL.Add('UPDATE INVENTARIO SET '
      + StringEstoque
      +'DATA=''' + FormatDateTime('mm-dd-yyyy', dtpDatainvent.Date) + ''' WHERE IDINVENTARIO=''' + InttoStr(IDCad) + '''');
      ibInventario.ExecSQL; }

  //  end;{if}
 // end;{with}
end;

procedure TfrmInventario.DesabilitaCampos(opcao:Boolean);
begin
  lbl_edtCodigo.Enabled := opcao;
  cboEstoque.Enabled := opcao;
  dtpDatainvent.Enabled := opcao;
end;

procedure TfrmInventario.DesabilitaCamposProd(opcao:Boolean);
begin

  lbl_edtCodbarra.Enabled := opcao;
  cboProduto.Enabled := opcao;
  lbl_edtQuantidade.Enabled := opcao;
  lbl_edtVlrunit.Enabled := opcao;
  lbl_edtVlrtotal.Enabled := opcao;

end;

procedure TfrmInventario.LimpaCampo;
begin
  lbl_edtCodigo.Clear;
 // cboEstoque.ClearSelection;
  lbl_edtCodbarra.Clear;
//  cboProduto.ClearSelection;
  lbl_edtQuantidade.Clear;
  lbl_edtVlrunit.Clear;
  lbl_edtVlrtotal.Clear;
end;

procedure TfrmInventario.ExibeDados; //procedimento criado para exibir os dados da tbl nos campos

var

i : Integer;

begin

  with dmModule do begin

    IDCad := ibInventario.FieldByName('IDINVENTARIO').AsInteger; //variavel para executar contador automatico no campo codigo do cliente


    for i:=0 to cboEstoque.Items.Count -1 do begin
      if TClasseCombo( cboEstoque.Items.Objects[i]).ID = ibInventario.FieldByName('IDLOCAL').AsInteger then begin
        cboEstoque.ItemIndex:= i;
        Break;
      end else begin
        cboEstoque.ClearSelection;
      end;
    end;

    //traz os dados nos campos se houver registro
    if ibInventario.RecordCount > 0 then begin

      lbl_edtCodigo.Text      := ibInventario.FieldByName('NUMINVENT').AsString;
      dtpDatainvent.Date      := ibInventario.FieldByName('DATA').AsDateTime;

    //limpa os campos se nao houver registro
    end else begin

      cboEstoque.Clear;
      cboProduto.Clear;
      lbl_edtQuantidade.Clear;
      lbl_edtCodigo.Clear;
      lbl_edtCodbarra.Clear;

    end;

  end;

end;

procedure TfrmInventario.ExecSELECTEstoque;
begin

  with dmModule do begin

    ibEstoque.Close;
    ibEstoque.SQL.Clear;
    ibEstoque.SQL.Add('SELECT * FROM LOCALESTOCAGEM');
    ibEstoque.Open;

    cboEstoque.Clear;
    while not ibEstoque.Eof do begin

      IDEstoque       := TClasseCombo.Create;
      IDEstoque.ID    := ibEstoque.FieldByName('IDESTOQUE').AsInteger;
      cboEstoque.Items.AddObject(ibEstoque.FieldByName('NOME').AsString,IDEstoque);
      ibEstoque.Next;

    end;
  end;
end;

procedure TfrmInventario.ExecSELECTProd;
begin

  with dmModule do begin

    //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS.
    ibProdutos.Close;
    ibProdutos.SQL.Clear;
    ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS');
    ibProdutos.Open;

    cboProduto.Clear;

    while not ibProdutos.Eof do begin//TRAZ A IDENTIFICACAO NO COMBO ATRAVES DO IDENQUANTO NAO FOR FIM DOS REGISTROS

      IDProduto := TClasseCombo.Create;// ATRIBUI A CLASSE CRIADA NA VARIAVEL.
      IDProduto.ID := ibProdutos.FieldByName('IDPROD').AsInteger;//ATRIBUI A IDENTIFICACAO DO CAMPO DA TABELA NA VARIAVEL
      cboProduto.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDProduto);//ADICIONA O OBJETO OU ITEM CONTENTO TEXTO VINDOS DE UMA TABELA.
      ibProdutos.Next;

    end;

  end;

end;

procedure TfrmInventario.ExecSELECTInvent;
begin
  with dmModule do begin
    ibInventario.Close;
    ibInventario.SQL.Clear;
    ibInventario.SQL.Add('SELECT * FROM INVENTARIO');
    ibInventario.Open;
  end;
end;

procedure TfrmInventario.FormShow(Sender: TObject);
begin

  //atribui data atual ao abrir o modulo.
  dtpDatainvent.Date := Date;

  ExecSELECTProd;
  ExecSELECTEstoque;
  ExecSELECTInvent;
  ibeaNovo.Caption := '&Novo';//deixa o caption do botao como novo ao abrir o form.
  ibeaAlterar.Caption := '&Alterar';

  //habilita os botes ao abrir o form
  ibeaNovo.Enabled := True;
  ibeaAlterar.Enabled := True;
  ibeaExcluir.Enabled := True;
  ibeaConsultar.Enabled := True;
  DesabilitaCampos(False);
  DesabilitaCamposProd(False);
  LimpaCampo;

    with dbgInventario do begin

    DataSource := dmModule.dtsInventario;

      // monta as colunas abaixo se for verdadeiro
      if MontaColunas Then begin
        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o Código do inventario
        Columns.Items[0].Title.Caption := 'Nº do Inventário';
        Columns.Items[0].FieldName     := 'NUMINVENT';
        Columns.Items[0].Width         := 80;
        Columns.Items[0].Alignment     := taCenter;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no inventario.
        Columns.Items[1].Title.Caption := 'Estoque';
        Columns.Items[1].FieldName     := 'ESTOQUE';
        Columns.Items[1].Width         := 170;

        // Parametros que exibe o nome do estoque.
        Columns.Items[2].Title.Caption := 'Data do Inventário';
        Columns.Items[2].FieldName     := 'DATA';
        Columns.Items[2].Width         := 150;

        //parametros que exibe a qtde. de entrada no inventario
        Columns.Items[3].Title.Caption := 'Qtde de Ítens.';
        Columns.Items[3].FieldName     := 'QTDEITENS';
        Columns.Items[3].Width         := 75;
        Columns.Items[3].Alignment     := taCenter;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Vlr Total';
        Columns.Items[4].FieldName     := 'VLRTOTAL';
        Columns.Items[4].Width         := 100;

        MontaColunas := False;

      end;{if}

     end;{with}

    with dbgProdinvent do begin

    DataSource := dmModule.dtsProdinvent;

      // monta as colunas abaixo se for verdadeiro
      if MontaColunasProd Then begin
        //determina as colunas a serem montadas
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);

        //Parametros da Coluna que exibe o Código do inventario
        Columns.Items[0].Title.Caption := 'Código de Barras';
        Columns.Items[0].FieldName     := 'CODBARRA';
        Columns.Items[0].Width         := 135;
        Columns.Items[0].Alignment     := taCenter;

        //Parametros da Coluna que exibe o Nome do produto que esta entrando no inventario.
        Columns.Items[1].Title.Caption := 'Descrição do Produto';
        Columns.Items[1].FieldName     := 'NomeProd';
        Columns.Items[1].Width         := 170;

        // Parametros que exibe o nome do estoque.
        Columns.Items[2].Title.Caption := 'Quantidade de Itens';
        Columns.Items[2].FieldName     := 'QTDE';
        Columns.Items[2].Width         := 130;

        //parametros que exibe a qtde. de entrada no inventario
        Columns.Items[3].Title.Caption := 'Vlr Unitário';
        Columns.Items[3].FieldName     := 'VLRUNIT';
        Columns.Items[3].Width         := 100;
        Columns.Items[3].Alignment     := taCenter;

        //Parametros da Coluna que exibe o vlr unitario do produto.
        Columns.Items[4].Title.Caption := 'Vlr Total';
        Columns.Items[4].FieldName     := 'VLRTOTAL';
        Columns.Items[4].Width         := 100;
        Columns.Items[4].Alignment     := taCenter;

        MontaColunasProd := False;

      end;{if}

   end;{with}

end;

procedure TfrmInventario.ibeaSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmInventario.ibeaNovoClick(Sender: TObject);

begin

  ibeaExcluir.Enabled := False;
  ibeaConsultar.Enabled := False;

  with dmModule do begin

   //rotina para cancelar ou nao a operacao

    if ibeaAlterar.Caption = '&Atualizar' Then begin

    ConfirmaMSG := Application.MessageBox('Deseja cancelar esta operação?'
              + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        ibeaNovo.Enabled := True;
        ibeaNovo.Caption := '&Novo';
        ibeaExcluir.Enabled := True;
        DesabilitaCampos(False);
        DesabilitaCamposProd(False);
        dbgInventario.Enabled := False;
        dbgProdinvent.Enabled := False;
        lbl_edtCodigo.Text := '';
        cboEstoque.ClearSelection;

      end;{if}

    end else begin


////////////////////////////////////////////////////////////////////////////////

    if ibeaNovo.Caption = '&Gravar' Then begin

     //traz a identificacao do estoque do item do objeto selecionado.
      If cboEstoque.ItemIndex = -1 Then begin
        StringEstoque     := ' ''0'',';
        Application.MessageBox('Informe o Estoque','Notificação: Estoque não especificado',MB_OK+MB_ICONERROR);
      end else begin
        IDEstoque         := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );//atribui na variavel classe combo
        StringEstoque     := ' ''' + InttoStr( IDEstoque.ID ) + ''',';//atribui na variavel de string
       end;

        ibInventario.Close;
        ibInventario.SQL.Clear;
        ibInventario.SQL.Add('INSERT INTO INVENTARIO'
        + ' (NUMINVENT,IDLOCAL,DATA) values '
        + ' (''' + lbl_edtCodigo.Text + ''','
        + StringEstoque
        + ' ''' + FormatDateTime('mm-dd-yyyy', dtpDatainvent.Date) + ''')'); 
        ibInventario.ExecSQL;

        Commit(ibInventario);

        ibeaNovo.Caption := '&Novo';
        ibeaAlterar.Enabled := True;
        ibeaExcluir.Enabled := True;
        ibeaConsultar.Enabled := True;
        DesabilitaCampos(False);
       // application.MessageBox('Essa operação grava o inventário e desabilita a inclusão de produto?','Notificação: Gravação do Inventário', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
     //   DesabilitaCamposProd(False);
      end else begin

        ibeaNovo.Caption := '&Gravar';
        DesabilitaCampos(True);
        LimpaCampo;
        lbl_edtCodigo.SetFocus;
        cboEstoque.ClearSelection;
        cboProduto.ClearSelection;

        //SELECT PARA TRAZER O CODIGO EM ORDEM CRESCENTE.
        ibInventario.Close;
        ibInventario.SQL.Clear;
        ibInventario.SQL.Add('SELECT * FROM INVENTARIO ORDER BY IDINVENTARIO DESC');
        ibInventario.Open;


        lbl_edtCodigo.Text := IntToStr(ibInventario.FieldByName('IDINVENTARIO').AsInteger + 1);

      end;{if}

  end;{with}

end;

end;

procedure TfrmInventario.ibeaAlterarClick(Sender: TObject);
begin

  ibeaExcluir.Enabled := False;
  ibeaConsultar.Enabled := False;

  with dmModule do begin

    if ibeaNovo.Caption = '&Gravar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin

        lbl_edtCodigo.Text := '';
        ibeaNovo.Caption := '&Novo';
        DesabilitaCampos(False);
        DesabilitaCamposProd(False);

      end;{if}

      end else begin

  /////////////////////////////////////////////////////////////////////////////////

       //avisa se nao houver registro para alteracao
       if ibInventario.RecordCount < 1 Then begin

       ConfirmaMSG := Application.MessageBox('Não existe registro para ser alterado!!'
                  + #13 + 'Clique em Ok para Retornar a operação normal.','Notificação: Cancelar Operação', MB_OK + MB_ICONWARNING);

        ibeaNovo.Caption := '&Novo';
        lbl_edtCodigo.Clear;
        DesabilitaCampos(False);
        dbgInventario.Enabled := False;
        dbgProdinvent.Enabled := False;

       end else begin

  /////////////////////////////////////////////////////////////////////////////////

          if cboEstoque.Text = '' Then begin
             ConfirmaMSG := Application.MessageBox('É necessário selecionar um registro para ser alterado!!'
                        + #13 + 'Clique em Ok para Retornar a operação normal.','Notificação: Cancelar Operação', MB_OK + MB_ICONWARNING);
            ibeaAlterar.Caption := '&Alterar';

          end else begin


  ////////////////////////////////////////////////////////////////////////////////


        if ibeaAlterar.Caption = '&Atualizar' Then begin

          ConfirmaMSG := Application.MessageBox('Alterar esse Registro?','Notificação:Exclusão de Regsitro',MB_YESNO + mb_DefButton1+MB_ICONQUESTION);

        if ConfirmaMSG = 6 Then begin

          AlteraInventario;

          Commit(ibInventario);

        end;

          ibeaAlterar.Caption := '&Alterar';
          ibeaNovo.Enabled := True;
          ibeaExcluir.Enabled := True;
          ibeaConsultar.Enabled := True;
          DesabilitaCampos(False);

        end else begin

          ibeaAlterar.Caption := '&Atualizar';
          DesabilitaCampos(True);

        end;{if}

      end;{if}

     end;{if}

    end;{if}

  end;{with}

end;

procedure TfrmInventario.ibeaExcluirClick(Sender: TObject);
begin
{  with dmModule do begin
    ConfirmaMSG := Application.MessageBox('Você deseja Excluir esse Registro?','Notificação: Exclusão de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
    if ConfirmaMSG = 6 Then begin
      ibInventario.Close;
      ibInventario.SQL.Clear;
      ibInventario.SQL.Add('DELETE FROM INVENTARIO WHERE IDCODIGO=''' + InttoStr(IDCad) + '''');
      ibInventario.Open;
      ExecSELECT;
    end;
  end;}
end;

procedure TfrmInventario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
      Key :=#0; //Desabilita processamento posterior da tecla
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  end;
procedure TfrmInventario.FormCreate(Sender: TObject);
begin
  MontaColunas := True;
  MontaColunasProd := True;
end;

procedure TfrmInventario.cboProdutoChange(Sender: TObject);

begin
  //INSTANCIA O DATAMODUlE PARA TRABALHAR COM AS TABELAS
  with dmModule do begin
    if cboProduto.ItemIndex <> -1 Then begin

      //DEFINE QUAL SERÁ O CÓDOGIO DO PRODUTO SELECIONADO
      ClassConsultaProd   := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );

      //FAZ A BUSCA PELO PRODUTO SELECIONADO NO COMBOBOX.
      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE IDProd=''' + InttoStr(ClassConsultaProd.ID) + '''');
      ibProdutos.Open;

      //EXIBE O VALOR DE VENDA A DO PRODUTO SELECIONADO
      lbl_edtVlrunit.Text := FormatFloat(CasasDecimais,ibProdutos.FieldByName('VALORVENDAA').AsFloat);

      //EXIBE O CODIGO DE BARRAS DO PRODUTO SLECIONADO
      lbl_edtCodbarra.Text := ibProdutos.FieldByName('CODBARRAS').AsString;

      //EXIBE O FOCO NO LABEL QTDE.
      lbl_edtQuantidade.SetFocus;
    end;
  end;
end;

procedure TfrmInventario.ibeaPrimeiroClick(Sender: TObject);
begin
  with dmModule do begin

   if ibInventario.Active Then begin
    ibInventario.First;
   end;
    ExibeDados;

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;
    end;
  end;
end;

procedure TfrmInventario.ibeaAnteriorClick(Sender: TObject);
begin
  with dmModule do begin

    if ibInventario.Active Then begin
      ibInventario.Prior;
    end;
      ExibeDados;

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;
    end;
  end;
end;

procedure TfrmInventario.ibeaProximoClick(Sender: TObject);
begin
  with dmModule do begin

   if ibInventario.Active Then begin
    ibInventario.Next;
   end;
    ExibeDados;

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;
    end;
  end;
end;

procedure TfrmInventario.ibeaUltimoClick(Sender: TObject);
begin
  with dmModule do begin

    if ibInventario.Active Then begin
      ibInventario.Last;
    end;
      ExibeDados;

    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;
    end;
  end;
end;

procedure TfrmInventario.cboEstoqueClick(Sender: TObject);
begin

  DesabilitaCamposProd(True);

  with dmModule do begin

    if cboEstoque.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      IDEstoque         := TClasseCombo( cboEstoque.Items.Objects[cboEstoque.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringEstoque     := ' IDLOCAL=''' + InttoStr( IDEstoque.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.

      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      ibProdutos.Close;
      ibProdutos.SQL.Clear;
      ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE ' + StringEstoque);
      ibProdutos.Open;


      cboProduto.Clear;// LIMPA O COMBO
      while not ibProdutos.Eof do begin
        IDProduto := TClasseCombo.Create;
        IDProduto.ID := ibProdutos.FieldByName('IDPROD').AsInteger;
        cboProduto.Items.AddObject(ibProdutos.FieldByName('NOME').AsString,IDProduto);
        ibProdutos.Next;

      end;{while}
    end;{if}
  end;{with}
end;

procedure TfrmInventario.ibeaIncluiProdClick(Sender: TObject);

var

ValorTotal,ValorUnit : String;

begin

  with dmModule do begin

    //traz a identificacao do funcionario do item do objeto selecionado.
    If cboProduto.ItemIndex = -1 Then begin

      StringProd     := ' ''0'',';
      Application.MessageBox('Informe o Produto','Notificação: Produto não especificado',MB_OK+MB_ICONERROR);

    end else begin

      IDProduto      := TClasseCombo( cboProduto.Items.Objects[cboProduto.ItemIndex] );
      StringProd     := ' ''' + InttoStr( IDProduto.ID ) + ''',';

      //select para trazer os produtos se o cliente for alterar
      ibProdinvent.Close;
      ibProdinvent.SQL.Clear;
      ibProdinvent.SQL.Add('SELECT IDPROD,IDINVPROD FROM TBLINVENTARIOPROD WHERE IDPROD=''' + IntToStr(IDProduto.ID) + '''');
     // +'and IDINVPROD=''' + IntToStr(IDProduto.ID) + '''');//
     ibProdinvent.Open;

     IDInvProduto := ibProdinvent.FieldByName('IDINVPROD').AsInteger;


      Incluiprod := False;

      //faz alteracao se houver registro
      if ibProdinvent.RecordCount > 0 Then begin

        ibProdinvent.Close;
        ibProdinvent.SQL.Clear;
        ibProdinvent.SQL.Add('UPDATE TBLINVENTARIOPROD SET'
        +' QTDE=''' + lbl_edtQuantidade.Text + ''' WHERE IDINVPROD=''' + InttoStr(IDInvProduto) + ''''
        +'and IDPROD=''' + IntTostr(IDProduto.ID) + '''');
        ibProdinvent.ExecSQL;

        Incluiprod := True;
        /////////////////////////////////////////////////////////////////////////////////////////////

        end else begin//senao grava normalmente abaixo.

          ValorTotal := StringReplace(lbl_edtVlrtotal.Text,ThousandSeparator,'',[rfReplaceAll]);
          ValorTotal := StringReplace(ValorTotal,DecimalSeparator,'.',[rfReplaceAll]);
        if ValorTotal = '' Then
          ValorTotal := '0';

            ValorUnit := StringReplace(lbl_edtVlrunit.Text,ThousandSeparator,'',[rfReplaceAll]);
            ValorUnit := StringReplace(ValorUnit,DecimalSeparator,'.',[rfReplaceAll]);
          if ValorUnit = '' Then
            ValorUnit := '0';

            //grava os dados na tbl entrada de estoque de produtos.
            ibProdinvent.Close;
            ibProdinvent.SQL.Clear;
            ibProdinvent.SQL.Add('INSERT INTO TBLINVENTARIOPROD '
            + '(IDINVPROD,QTDE,IDPROD,VLRUNIT,VLRTOTAL,CODBARRA) values '
            + '(''' + lbl_edtCodigo.Text + ''',''' + lbl_edtQuantidade.Text + ''','
            + StringProd
            + ' ''' + ValorUnit + ''',''' + ValorTotal + ''','
            + ' ''' + lbl_edtCodbarra.Text + ''')');
            ibProdinvent.ExecSQL;

            Commit(ibProdinvent);

            Incluiprod := True;

      end;{if}

      if Incluiprod then begin

        ibProdinvent.Close;
        ibProdinvent.SQL.Clear;
        ibProdinvent.SQL.Add('SELECT TBLINVENTARIOPROD.IDINVPROD,TBLINVENTARIOPROD.IDPROD,'
        + 'TBLINVENTARIOPROD.CODBARRA,TBLINVENTARIOPROD.VLRUNIT,TBLINVENTARIOPROD.VLRTOTAL,'
        + 'TBLINVENTARIOPROD.QTDE,CADPRODUTOS.NOME As NomeProd FROM TBLINVENTARIOPROD '
        + 'INNER JOIN CADPRODUTOS ON TBLINVENTARIOPROD.IDPROD=CADPRODUTOS.IDPROD WHERE IDINVPROD=''' + InttoStr(IDInvProduto) + '''');
        ibProdinvent.Open;

      end;{if}
     end;{if}


    (ibProdinvent.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00'; //CRIA UMA MASCARA PARA O CAMPO
    (ibProdinvent.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := ',0.00'; //CRIA UMA MASCARA PARA O CAMPO



  end;{with}

end;

procedure TfrmInventario.lbl_edtQuantidadeExit(Sender: TObject);
var
Valor1 : Real;
Valor2 : Real;

begin
  if lbl_edtQuantidade.Text <> '' Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQuantidade.Text)>0) and (lbl_edtQuantidade.Text <> '') Then begin

      Valor1 := StrToFloat(lbl_edtQuantidade.Text);
      Valor2 := StrToFloat(lbl_edtVlrunit.Text);
      lbl_edtVlrtotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

    end else begin

       Valor1 := StrToFloat(lbl_edtQuantidade.Text);
       Valor2 := StrToFloat(lbl_edtVlrunit.Text);
       lbl_edtVlrtotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));
    end;{if}

  end;{if}

end;

procedure TfrmInventario.lbl_edtVlrtotalExit(Sender: TObject);

   var
    Valor1 :Real;
    Valor2 :Real;
begin

 if lbl_edtVlrTotal.Text <> '' Then begin //se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtVlrTotal.Text)>0) and (lbl_edtVlrTotal.Text <> '') Then begin

      Valor1 := StrToFloat(lbl_edtVlrTotal.Text);
      Valor2 := StrToFloat(lbl_edtVlrunit.Text);
      lbl_edtQuantidade.Text := FormatFloat(',0.00',(Valor1 / Valor2));

    end else begin

       Valor1 := StrToFloat(lbl_edtVlrTotal.Text);
       Valor2 := StrToFloat(lbl_edtVlrunit.Text);
       lbl_edtQuantidade.Text := FormatFloat(',0.00',(Valor1 / Valor2));

    end;{if}

  end;{if}

end;

end.
