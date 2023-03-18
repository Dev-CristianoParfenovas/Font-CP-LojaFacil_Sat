unit untLocalEstocagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, 
  CheckLst, RxGIF, classComboBox, IBQuery, Buttons;

type
  TfrmLocalEstocagem = class(TForm)
    Label1: TLabel;
    Image13: TImage;
    lbl_edtDescricao: TLabeledEdit;
    ibeaIncluir: TSpeedButton;
    bit_Close: TSpeedButton;
    chkListLocalEstocagem: TCheckListBox;
    Label6: TLabel;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Label5: TLabel;
    Label3: TLabel;
    lblTotalEstoque: TLabel;
    lblTotalProdutos: TLabel;

    procedure Commit(IBQueryExec : TIBQuery);

    procedure ListaLocalEstocagem;

    procedure DesabilitaCampos(opcao:Boolean);
    procedure LimpaCampo;
    procedure ExibeDados;
    procedure ExecSELECT;
    procedure ibeaNovoClick(Sender: TObject);
    procedure ibeaPrimeiroClick(Sender: TObject);
    procedure ibeaAnteriorClick(Sender: TObject);
    procedure ibeaProximoClick(Sender: TObject);
    procedure ibeaUltimoClick(Sender: TObject);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure dbgLocalEstoqueCellClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkListLocalEstocagemClick(Sender: TObject);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure bit_CloseClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalEstocagem: TfrmLocalEstocagem;
  ConfirmaMSG: Integer;
  IDEstoque : Integer;
  IDClass : Integer;
  MontaColunas : Boolean;
  ClassLocal : TClasseCombo;

  TotalRegistros : Integer;

implementation

uses  untdmModule, funcPosto;

{$R *.dfm}


procedure TfrmLocalEstocagem.Commit(IBQueryExec : TIBQuery);
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

procedure TfrmLocalEstocagem.ListaLocalEstocagem;
begin
  with dmModule do begin
    ibEstoque.close;
    ibEstoque.sql.clear;
    ibEstoque.sql.add('SELECT IDESTOQUE,NOME FROM LOCALESTOCAGEM');
    ibEstoque.Open;

    chkListLocalEstocagem.Clear;
    while not ibEstoque.Eof do begin
      ClassLocal:= TClasseCombo.Create;
      ClassLocal.ID := ibEstoque.FieldByName('IDESTOQUE').AsInteger;
      chkListLocalEstocagem.Items.AddObject( ibEstoque.FieldByName('NOME').AsString, ClassLocal );
      ibEstoque.Next;
    end;
  end;
end;

procedure TfrmLocalEstocagem.DesabilitaCampos(opcao:Boolean);
begin
  //lbl_edtCodigo.Enabled := opcao;
  //lbl_edtLocalEstoque.Enabled := opcao;
end;

procedure TfrmLocalEstocagem.LimpaCampo;
begin
    //lbl_edtCodigo.Clear;
    //lbl_edtLocalEstoque.Clear;
//  end;
end;

procedure TfrmLocalEstocagem.ExibeDados;  //procedimento criado para exibir os dados da tbl nos campos
begin
  with dmModule do begin

   IDEstoque := ibEstoque.FieldByName('IDESTOQUE').AsInteger; //variavel para executar contador automatico no campo codigo

    //traz os dados nos campos se houver registro
    if ibEstoque.RecordCount > 0 Then begin
      //lbl_edtCodigo.Text               := IntToStr(ibEstoque.FieldByName('IDESTOQUE').AsInteger);
      //lbl_edtLocalEstoque.Text         := ibEstoque.FieldByName('NOME').AsString;

    //limpa os campos se nao houver registro
    end else begin
      //lbl_edtCodigo.Clear;
      //lbl_edtLocalEstoque.Clear;
    end;
  end;
end;

procedure TfrmLocalEstocagem.ExecSELECT;  //procedimento para seletar sql
begin
  with dmModule do begin
      //BUSCA TODOS OS PRODUTOS QUE ESTEJAM NA CLASSIFICAÇÃO DE PRODUTOS
    ibEstoque.Close;
    ibEstoque.SQL.Clear;
    ibEstoque.SQL.Add('SELECT * FROM LOCALESTOCAGEM');
    ibEstoque.Open;
  end;
end;

procedure TfrmLocalEstocagem.ibeaNovoClick(Sender: TObject);
begin

  {ibeaAlterar.Enabled := False;
  //ibeaExcluir.Enabled := False;
  with dmModule do begin

    if ibeaNovo.Caption = '&Gravar' Then begin

        ExecSELECT;

        ibeaNovo.Caption := '&Novo';
        ibeaAlterar.Enabled := True;
        ibeaExcluir.Enabled := True;
        LimpaCampo;
        DesabilitaCampos(False);
      end else begin
        ibeaNovo.Caption := '&Gravar';
        DesabilitaCampos(True);
        LimpaCampo;
        lbl_edtCodigo.Text := IntToStr(ibEstoque.FieldByName('IDESTOQUE').AsInteger + 1);

      end;
  end;  }
end;

procedure TfrmLocalEstocagem.ibeaPrimeiroClick(Sender: TObject);
begin
  with dmModule do begin

    if ibEstoque.Active Then begin
      ibEstoque.First;
    end;
      ExibeDados;

    {if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;
    end; }
  end;
end;

procedure TfrmLocalEstocagem.ibeaAnteriorClick(Sender: TObject);
begin
  with dmModule do begin

    if ibEstoque.Active Then begin
      ibEstoque.Prior;
    end;
      ExibeDados;

    {if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;
    end;}
  end;
end;

procedure TfrmLocalEstocagem.ibeaProximoClick(Sender: TObject);
begin
  with dmModule do begin

    if ibEstoque.Active Then begin
      ibEstoque.Next;
    end;
      ExibeDados;

    {if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;
    end;}
  end;
end;

procedure TfrmLocalEstocagem.ibeaUltimoClick(Sender: TObject);
begin
  with dmModule do begin

    if ibEstoque.Active Then begin
      ibEstoque.Last;
    end;
      ExibeDados;

      {if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Deseja cancelar está operação?'
                                + #13 + 'Clique em Sim para cancelar e Não para continuar.','Notificação: Cancelar Operação', MB_YESNO + MB_ICONQUESTION);

      if ConfirmaMSG = 6 Then begin
        //RESTAURAR OS CAMPOS
        ibeaAlterar.Caption := '&Alterar';
        DesabilitaCampos(False);

      end;
    end; }
  end;
end;

procedure TfrmLocalEstocagem.ibeaAlterarClick(Sender: TObject);
begin
  {ibeaNovo.Enabled := False;
  ibeaExcluir.Enabled := False;

  with dmModule do begin
    if ibeaAlterar.Caption = '&Atualizar' Then begin

      ConfirmaMSG := Application.MessageBox('Alterar esse Registro?','Notificação: Exclusão de Registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
      if ConfirmaMSG = 6 Then begin
        ibEstoque.Close;
        ibEstoque.SQL.Clear;
        ibEstoque.SQL.Add('UPDATE LOCALESTOCAGEM SET '
        + 'NOME =''' + lbl_edtLocalEstoque.Text + ''' WHERE IDESTOQUE=''' + InttoStr(IDEstoque) + '''');
        ibEstoque.ExecSQL;
        ExecSELECT;
      end;
      ibeaAlterar.Caption := '&Alterar';
      DesabilitaCampos(False);
      ibeaNovo.Enabled := True;
      ibeaExcluir.Enabled := True;
    end else begin
      ibeaAlterar.Caption := '&Atualizar';
      DesabilitaCampos(True);
    end;
  end;}
end;


procedure TfrmLocalEstocagem.dbgLocalEstoqueCellClick(Column: TColumn);
begin
  ExibeDados;
end;

procedure TfrmLocalEstocagem.FormKeyPress(Sender: TObject; var Key: Char);
begin
 Key := UpCase(Key); //Deixa todos os textos em maiusculo
    if Key = #13 Then begin
       Key := #0; //Desabilita processamento posterior da tecla
       Perform(WM_NEXTDLGCTL,0,0);//Simula o envio de Tab
  end;
end;

procedure TfrmLocalEstocagem.FormShow(Sender: TObject);
begin
  {ibeaNovo.Caption := '&Novo';//deixa o caption do botao como novo ao abrir o form.
  ibeaAlterar.Caption := '&Alterar';

  //habilita os botes ao abrir o form
  ibeaNovo.Enabled := True;
  ibeaAlterar.Enabled := True;
  ibeaExcluir.Enabled := True; }


  //ExecSELECT;
  ListaLocalEstocagem;

  DesabilitaCampos(False);
  LimpaCampo;
   
end;

procedure TfrmLocalEstocagem.FormCreate(Sender: TObject);
begin
  MontaColunas := True;
end;

procedure TfrmLocalEstocagem.chkListLocalEstocagemClick(Sender: TObject);
  procedure Limpa;
  var
    i: integer;
  begin
    for i := 0 to chkListLocalEstocagem.Items.Count -1 do
      chkListLocalEstocagem.Checked[i] := False;
  end;
var
  index: integer;
begin
  index := chkListLocalEstocagem.ItemIndex;
  Limpa;
  chkListLocalEstocagem.Checked[index] := True;
  with dmModule do begin
    ClassLocal := TClasseCombo( chkListLocalEstocagem.Items.Objects[chkListLocalEstocagem.ItemIndex] );
    ibEstoque.SQL.Clear;
    ibEstoque.SQL.Add('SELECT Count(LOCALESTOCAGEM.IDESTOQUE) As Total FROM LOCALESTOCAGEM '
    + ' INNER JOIN CADPRODUTOS ON LOCALESTOCAGEM.IDESTOQUE = CADPRODUTOS.IDLOCAL WHERE '
    + ' LOCALESTOCAGEM.IDESTOQUE = ' + InttoStr( ClassLocal.ID ) );
    ibEstoque.Open;
    TotalRegistros            := ibEstoque.FieldByName('Total').AsInteger;
    lblTotalProdutos.Caption  := FormatFloat(',0', TotalRegistros );
  end;

end;

procedure TfrmLocalEstocagem.ibeaIncluirClick(Sender: TObject);
begin

  with dmModule do begin
    ibEstoque.Close;
    ibEstoque.SQL.Clear;
    ibEstoque.SQL.Add ('INSERT INTO LOCALESTOCAGEM '
    + '(NOME) values '
    + ' (''' + lbl_edtDescricao.Text + ''')');
    ibEstoque.ExecSQL;

    Commit(ibEstoque);

  end;
  ListaLocalEstocagem;

end;

procedure TfrmLocalEstocagem.bit_CloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmLocalEstocagem.btnAlterarClick(Sender: TObject);
var
  LocalEstoque : String;
begin

  with dmModule do begin
    if chkListLocalEstocagem.ItemIndex =-1 Then begin
      Application.MessageBox ('Para alterar um Local de Estocagem é necessário seleciona-lo','Notificação de operação inválida', MB_OK + mb_DefButton1+MB_ICONEXCLAMATION);
    end else begin
      LocalEstoque := UpperCase(chkListLocalEstocagem.Items.Strings[chkListLocalEstocagem.ItemIndex]);
      ClassLocal := TClasseCombo( chkListLocalEstocagem.Items.Objects[chkListLocalEstocagem.ItemIndex] );    
      PromptString(Self,'Alteração de Local de estocagem','Informe o nome para o Local de estocagem',LocalEstoque);
      If (LocalEstoque='') Then begin
        PromptString(Self,'Alteração de Local de estocagem','Informe o nome para o Local de estocagem',LocalEstoque);
      end else begin
        If (LocalEstoque <> UpperCase(chkListLocalEstocagem.Items.Strings[chkListLocalEstocagem.ItemIndex])) Then begin
          ibEstoque.close;
          ibEstoque.sql.clear;
          ibEstoque.sql.Add('UPDATE LOCALESTOCAGEM SET'
          + ' NOME = ''' + LocalEstoque + ''''
          + ' WHERE IDESTOQUE = ' + IntToStr(ClassLocal.ID) );
          ibEstoque.ExecSQL;

          Commit(ibEstoque);

          ListaLocalEstocagem;
          lblTotalProdutos.Caption := '0';
          lblTotalEstoque.Caption  := '0';
        end;
      end;
    end;
  end;

end;

procedure TfrmLocalEstocagem.btnExcluirClick(Sender: TObject);
begin

  if chkListLocalEstocagem.ItemIndex =-1 Then begin

    Application.MessageBox ('Para remover um Local de Estocagem é necessário seleciona-lo','Notificação de operação inválida', MB_OK + mb_DefButton1+MB_ICONEXCLAMATION);

  end else begin

    with dmModule do begin

      If (TotalRegistros > 0) Then begin

        Application.MessageBox ( PChar('Não é possível remover o estoque: "' + chkListLocalEstocagem.Items.Strings[chkListLocalEstocagem.ItemIndex]
        + '", porque existe produtos cadastrados neste estoque'),'Notificação de operação inválida', MB_OK + mb_DefButton1+MB_ICONWARNING);

      end else begin

        ConfirmaMSG := Application.MessageBox ('Deseja realmente Excluir / Apagar este registro.' + #13 + 'Clique em SIM para excluir, e clique em NÃO para cancelar.','Notificação: Exclusão de registro', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);
        If ConfirmaMSG = 6 Then begin //o 6 eh o mesmo que sim

          ibEstoque.SQL.Clear;
          ibEstoque.SQL.Add('DELETE FROM LOCALESTOCAGEM'
          + ' WHERE IDESTOQUE = ' + IntToStr(ClassLocal.ID) );
          ibEstoque.ExecSQL;
          chkListLocalEstocagem.Items.Delete(chkListLocalEstocagem.ItemIndex);

        end; {if}

      end; {if}

    end; {with}

  end;

end;

end.
