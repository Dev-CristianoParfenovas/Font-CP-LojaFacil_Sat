unit untSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, classComboBox,
  IBQuery, jpeg, axCtrls, IniFiles, Buttons;

type
  TfrmSenha = class(TForm)
    cboUsuario: TComboBox;
    lbl_Usuario: TLabel;
    imgChave: TImage;
    imgFundo: TImage;
    lbl_edtSenha: TLabeledEdit;
    ibeaOK: TSpeedButton;
    ibeaCancelar: TSpeedButton;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECT;
    procedure FormShow(Sender: TObject);
    procedure ibeaOkClick(Sender: TObject);
    procedure cboUsuarioChange(Sender: TObject);
    procedure ibeaCancelarClick(Sender: TObject);
    procedure lbl_edtSenhaChange(Sender: TObject);
    procedure lbl_edtSenhaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;
  IDLogin : TClasseCombo;
  IDClassUsuario : TClasseCombo;
  Numero,Senha : string;
  IDCad : Integer;
  IDAcesso : Integer;
  CarregarSkin : TIniFile;

implementation

uses untdmModule, untFormSplash;

{$R *.dfm}

procedure TfrmSenha.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmSenha.ExecSELECT;

begin

  with dmModule do begin

    Commit(ibUser);
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

procedure TfrmSenha.FormShow(Sender: TObject);

var

OleGraphic: TOleGraphic;
fs: TFileStream;
///CaminhoSkin, AtivarSkin : String;

begin
 lbl_edtSenha.Clear;
if frmFormSplash.Showing Then begin
frmFormSplash.Close;
frmFormSplash.Free;
end;//if
  with dmModule do begin

    ExecSELECT;
////////////////////////////////////////////////////////////////////////////////


      //ROTINA PARA EXIBIR A IMAGEM DO PRODUTO
      if Not FileExists(ExtractFilePath(Application.ExeName) + 'Data\RunTime\Imagens_Sistema\TelaSenha2008.gif' ) Then begin

        imgFundo.Picture := Nil; //LIMPA A IMAGEM

      end else begin

        try

          imgFundo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+ '\Data\RunTime\Imagens_Sistema\TelaSenha2008.gif');

        finally
          fs.Free;
          OleGraphic.Free
        end;

       end;

////////////////////////////////////////////////////////////////////////////////

  {  with CarregarSkin do begin

      CarregarSkin := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\RunTime\sis.ini'); //Cria o vinculo com o Arquivo ini

      AtivarSkin := ReadString('CarregarSkin','AtivarSkin','');

      if (AtivarSkin = 'Sim') Then begin

      if not SkinData1.Active Then SkinData1.Active := True;

        CaminhoSkin := ReadString('CarregarSkin','PathSkin','')+'\interface.skn';
        SkinData1.SkinFile := CaminhoSkin;
      //  SkinData1.SkinStore := CaminhoSkin;

      end;

    end;//with }

  end;{with}

end;

procedure TfrmSenha.ibeaOkClick(Sender: TObject);

var

DataSistema,DataDia : TDateTime;
DiaSistema,MesSistema,AnoSistema, DiaAtual,MesAtual,AnoAtual : Word;

begin
  with dmModule do begin

         Commit(ibDataSistema);
         ibDataSistema.Close;
         ibDataSistema.SQL.Clear;
         ibDataSistema.SQL.Add('SELECT * FROM TBLDATASISTEMA');
         ibDataSistema.Open;


         DataSistema := (ibDataSistema.FieldByName('DATA').AsDateTime);
         DataDia := StrToDate(FormatDateTime('dd/mm/yyyy',Now));

         DecodeDate(DataSistema,AnoSistema,MesSistema,DiaSistema);
         DecodeDate(DataDia,AnoAtual,MesAtual,DiaAtual);

         if (AnoSistema=AnoAtual)and(MesSistema=MesAtual)and(DiaSistema=DiaAtual) Then begin

         Application.MessageBox('Sistema desatualizado, favor entrar em contato com nosso suporte no telefone(011)7643-6630','Notificação de Sistema', + MB_OK);
         Application.Terminate;

         end;

         if (AnoSistema=AnoAtual)and(MesAtual>MesSistema)Then begin

         Application.MessageBox('Sistema desatualizado, favor entrar em contato com nosso suporte no telefone(011)7643-6630','Notificação de Sistema', + MB_OK);
         Application.Terminate;

         end;

         if (AnoSistema=AnoAtual)and(MesAtual=MesSistema)and(DiaAtual>DiaSistema)Then begin

         Application.MessageBox('Sistema desatualizado, favor entrar em contato com nosso suporte no telefone(011)7643-6630','Notificação de Sistema', + MB_OK);
         Application.Terminate;

         end;

         if (AnoAtual > AnoSistema)Then begin

         Application.MessageBox('Sistema desatualizado, favor entrar em contato com nosso suporte no telefone(011)7643-6630','Notificação de Sistema', + MB_OK);
         Application.Terminate;

         end;


    if cboUsuario.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
    IDClassUsuario := TClasseCombo( cboUsuario.Items.Objects[cboUsuario.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
    end;

    ibUser.Close;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE IDUSER=''' + IntToStr(IDClassUsuario.ID) + '''');
    ibUser.Open;

    IDAcesso := (IDClassUsuario.ID);

    Senha  := ibUser.FieldByName('SENHA').AsString;
    IDCad  := ibUser.FieldByName('IDUSER').AsInteger;
    Numero := lbl_edtSenha.Text;


    if Senha = Numero Then begin

    ShowMessage('Senha Liberada!!');

    frmSenha.Close;

    end else begin

    ShowMessage('Senha Incorreta?');

    Application.Terminate;

    end;

  end;{with}
  
end;

procedure TfrmSenha.cboUsuarioChange(Sender: TObject);
begin
  lbl_edtSenha.SetFocus;
end;

procedure TfrmSenha.ibeaCancelarClick(Sender: TObject);

var

ConfirmaMSG : Integer;

begin

 /// SkinData1.Active := False;

  ConfirmaMSG := Application.MessageBox('Você deseja realmente sair do Sistema?','Sair do Sistema', MB_YESNO + mb_DefButton1+MB_ICONQUESTION);

  if ConfirmaMSG = 6 Then begin

    Application.Terminate;

 /// end else begin

 ///   SkinData1.Active := True;

  end;
  
end;

procedure TfrmSenha.lbl_edtSenhaChange(Sender: TObject);
begin
//  lbl_edtSenha.PasswordChar :='*';
end;

procedure TfrmSenha.lbl_edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key= #13 Then begin

    ibeaOkClick(Sender);

  end;

end;

end.
