unit untSenhaCx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, classComboBox, Buttons;

type
  TfrmSenhaCx = class(TForm)
    lbl_edtSenha: TLabeledEdit;
    cboUsuario: TComboBox;
    lbl_Usuario: TLabel;
    imgChave: TImage;
    lbl_edtTrocoInicial: TLabeledEdit;
    ibeaOk: TSpeedButton;
    ibeaCancelar: TSpeedButton;
    lbl_edtIDFunc: TLabeledEdit;
    procedure ExecSELECT;
    procedure FormShow(Sender: TObject);
    procedure ibeaOkClick(Sender: TObject);
    procedure cboUsuarioClick(Sender: TObject);
    procedure lbl_edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure ibeaCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaCx: TfrmSenhaCx;
  IDLogin : TClasseCombo;
implementation

uses untdmModule, untServicos;

{$R *.dfm}

procedure TfrmSenhaCx.ExecSELECT;

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


procedure TfrmSenhaCx.FormShow(Sender: TObject);
begin

  lbl_edtSenha.Text := '';
  lbl_edtTrocoInicial.Text := '0,00';
  lbl_edtIDFunc.Text := '';
  
  with dmModule do begin

    ExecSELECT;

  end;//with

end;

procedure TfrmSenhaCx.ibeaOkClick(Sender: TObject);

var

HoraAbertura,DataAbertura,HoraFech,DataAtual : TDateTime;
IDFuncCx, IDCadCx : Integer;
IDClassUsuario : TClasseCombo;
StringGravaUsuario,SenhaCx,NumeroCX, TrocoInicial, NomeFunc : String;

begin

  with dmModule do begin

    if cboUsuario.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO

      IDClassUsuario := TClasseCombo( cboUsuario.Items.Objects[cboUsuario.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringGravaUsuario   := ' ''' + InttoStr(IDClassUsuario.ID ) + ''',';

    end;

    ibUser.Close;
    ibUser.SQL.Clear;
    ibUser.SQL.Add('SELECT * FROM TBLUSER WHERE IDUSER=''' + IntToStr(IDClassUsuario.ID) + '''');
    ibUser.Open;

    SenhaCx  := ibUser.FieldByName('SENHA').AsString;
    IDCadCx  := ibUser.FieldByName('IDUSER').AsInteger;
    NumeroCx := lbl_edtSenha.Text;
 //   IDFuncPista := ibUser.FieldByName('IDUSER').AsInteger;

    if SenhaCx = NumeroCx Then begin

      ShowMessage('Senha Liberada!!');


      ibAberturaCX.Close;
      ibAberturaCX.SQL.Clear;
      ibAberturaCX.SQL.Add('SELECT * FROM TBLABERTURACX WHERE IDFUNC = ''' + IntToStr(IDClassUsuario.ID) + ''' and DATAABERTURA = ''' + FormatDateTime('mm-dd-yyyy',Now) + ''' ORDER BY IDABERTURACX DESC');
      ibAberturaCX.Open;

      IDFuncCx       := ibAberturaCX.FieldByName('IDFUNC').AsInteger;
      HoraAbertura   := ibAberturaCX.FieldByName('HORAABERTURA').AsDateTime;
      HoraFech       := ibAberturaCX.FieldByName('HORAFECH').AsDateTime;
      DataAbertura   := ibAberturaCX.FieldByName('DATAABERTURA').AsDateTime;
      DataAtual      := StrToDate(FormatDateTime('dd/mm/yyyy',now));//ibAbrePista.FieldByName('DATAABERTURA').AsDateTime;

////////////////////////////////////////////////////////////////////////////////   and(ibAbrePista.FieldByName('IDFUNC').AsInteger='' + StrToInt(IDClassUsuario.ID) +  '')

      if (DataAbertura = DataAtual)  and (HoraFech = 0) and (IDFuncCx > 0) Then begin

        ConfirmaMSG := Application.MessageBox ( PChar('Atenção!! o Caixa de: "' + cboUsuario.Text
            + '" já se encontra aberto'),'Notificação Abertura de Caixa', MB_YESNO + mb_DefButton1+MB_ICONINFORMATION);

        if ConfirmaMSG = 6 Then begin

          frmSenhaCX.Close;
          NomeFunc := ibUser.FieldByName('NOME').AsString;
      //    frmVendasLoja.lbl_Func.Caption := NomeFunc;
          frmVendasLoja.ShowModal;

        end else begin

          frmSenhaCX.Close;

        end;{if confirma msg}

      end else begin//if dataabertura = data atual

////////////////////////////////////////////////////////////////////////////////

     //   (DataAbertura = DataAtual)  and (HoraFech > 0) and (IDFunc > 0) Then begin

        ConfirmaMSG := Application.MessageBox ( PChar('Abertura do Caixa de: "' + cboUsuario.Text
            + '"'),'Notificação Abertura de Caixa', MB_YESNO + mb_DefButton1+MB_ICONINFORMATION);

        if ConfirmaMSG = 6 Then begin

          TrocoInicial := StringReplace(lbl_edtTrocoInicial.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
          TrocoInicial := StringReplace(TrocoInicial,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
          if TrocoInicial = '' Then
          TrocoInicial := '0';

        {  ibServsVenda.Close;
          ibServsVenda.SQL.Clear;
          ibServsVenda.SQL.Add('INSERT INTO TBLSERVICOSVENDAS'
          + '(DATA,IDFUNC,TROCOINICIAL,HORA) values '
          + '(''' + FormatDateTime('mm-dd-yyyy',now) + ''','
          + StringGravaUsuario
          + ' ''' + TrocoInicial + ''','
          + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
          ibServsVenda.ExecSQL; }


          ibAberturaCX.Close;
          ibAberturaCX.SQL.Clear;
          ibAberturaCX.SQL.Add('INSERT INTO TBLABERTURACX'
          + '(DATAABERTURA,IDFUNC,TROCOINICIAL,HORAABERTURA) values '
          + '(''' + FormatDateTime('mm-dd-yyyy',now) + ''','
          + StringGravaUsuario
          + ' ''' + TrocoInicial + ''','
          + ' ''' + FormatDateTime('hh:mm:ss',now) + ''')');
          ibAberturaCX.ExecSQL;

          frmSenhaCX.Close;
          NomeFunc := ibUser.FieldByName('NOME').AsString;
      //    frmVendasLoja.lbl_Func.Caption := NomeFunc;
          frmVendasLoja.ShowModal;

        end else begin

          frmSenhaCX.Close;

        end;{if confirma msg}

      end;//if dataabertura <> data atual

////////////////////////////////////////////////////////////////////////////////

    end else if SenhaCx <> NumeroCX Then begin

      ShowMessage('Senha Incorreta!!');
      frmSenhaCX.Close;

    end;//if senha numero

  end;{with}

end;

procedure TfrmSenhaCx.cboUsuarioClick(Sender: TObject);

var
IDUsuario : TClasseCombo;
StringUsuario : String;

begin

  with dmModule do begin

    if cboUsuario.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO

      IDUsuario := TClasseCombo( cboUsuario.Items.Objects[cboUsuario.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringUsuario   := ' ''' + InttoStr(IDUsuario.ID ) + ''',';

    end;

    lbl_edtSenha.SetFocus;
    lbl_edtIDFunc.Text := IntToStr(IDUsuario.ID);

  end;//with

end;

procedure TfrmSenhaCx.lbl_edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 Then begin

    lbl_edtTrocoInicial.SetFocus;

  end;//if

end;

procedure TfrmSenhaCx.ibeaCancelarClick(Sender: TObject);
begin
Close;
end;

end.
