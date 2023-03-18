unit untConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untClasse.ConfigCX,
  IBQuery, ExtCtrls, ComCtrls, Buttons;

type
  TfrmConfiguracoes = class(TForm)
    sbInfCaixa: TSpeedButton;
    sbInfGeral: TSpeedButton;
    sbInfCupons: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ibeaIncluir: TSpeedButton;
    ibeaSair: TSpeedButton;
    pcConfiguracoes: TPageControl;
    TabSheet1: TTabSheet;
    tbs_InfoCX: TTabSheet;
    tbsConfigImpressoras: TTabSheet;
    tbsTipoImpressoras: TTabSheet;
    GroupBox1: TGroupBox;
    ckSimProdEstoque: TCheckBox;
    ckNaoProdEstoque: TCheckBox;
    GroupBox31: TGroupBox;
    ckWord: TCheckBox;
    ckExcel: TCheckBox;
    gbNCM: TGroupBox;
    lbl_edtNCM: TLabeledEdit;
    GroupBox2: TGroupBox;
    ckSimConfigSenha: TCheckBox;
    ckNaoConfigSenha: TCheckBox;
    GroupBox3: TGroupBox;
    ckSimPrateleira: TCheckBox;
    ckNaoPrateleira: TCheckBox;
    GroupBox4: TGroupBox;
    ckSimNegativarEstoque: TCheckBox;
    ckNaoNegativarEstoque: TCheckBox;
    GroupBox5: TGroupBox;
    ckSimCasasDecimais: TCheckBox;
    ckNaoCasasDecimais: TCheckBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    lbl_edtPorcentagem: TLabeledEdit;
    GroupBox7: TGroupBox;
    lbl_Inf: TLabel;
    lbl_edtPorcentagemCusto: TLabeledEdit;
    GroupBox8: TGroupBox;
    lbl_edtPorcentagemVlrC: TLabeledEdit;
    GroupBox9: TGroupBox;
    ckSimEstoque: TCheckBox;
    ckNaoEstoque: TCheckBox;
    GroupBox16: TGroupBox;
    ckSimEstoqueItem: TCheckBox;
    ckNaoEstoqueItem: TCheckBox;
    gbBloqueiaVendaEstoque: TGroupBox;
    ckSimBloqueiaVendaEstoque: TCheckBox;
    ckNaoBloqueiaVendaEstoque: TCheckBox;
    GroupBox11: TGroupBox;
    ckSimTrocoInicialCx: TCheckBox;
    ckNaoTrocoInicialCx: TCheckBox;
    GroupBox14: TGroupBox;
    ckSimReceberDinheiro: TCheckBox;
    ckNaoReceberDinheiro: TCheckBox;
    GroupBox13: TGroupBox;
    ckCancelarItemSim: TCheckBox;
    ckCancelarItemNao: TCheckBox;
    GroupBox15: TGroupBox;
    ckSimPedSangria: TCheckBox;
    ckNaoPedSangria: TCheckBox;
    GroupBox10: TGroupBox;
    ckGavBematech: TCheckBox;
    ckGavDaruma: TCheckBox;
    GroupBox12: TGroupBox;
    ckSimCupomPed: TCheckBox;
    ckNaoCupomPed: TCheckBox;
    gbAbreNP: TGroupBox;
    ckSimNP: TCheckBox;
    ckNaoNP: TCheckBox;
    GroupBox32: TGroupBox;
    ckSimSATDaruma: TCheckBox;
    ckNaoSATDaruma: TCheckBox;
    grbSatGeral: TGroupBox;
    ckSimSatGeral: TCheckBox;
    ckNaoSatGeral: TCheckBox;
    GroupBox33: TGroupBox;
    ckSimCupomSimples: TCheckBox;
    ckNaoCupomSimples: TCheckBox;
    GroupBox34: TGroupBox;
    ckSimCPosVenda: TCheckBox;
    ckNaoCPosVenda: TCheckBox;
    GroupBox17: TGroupBox;
    ckSimCupom: TCheckBox;
    ckNaoCupom: TCheckBox;
    GroupBox28: TGroupBox;
    lbl_edtNomeCaminhoRede: TLabeledEdit;
    ckSimPosVendaViaRede: TCheckBox;
    ckNaoPosVendaViaRede: TCheckBox;
    GroupBox18: TGroupBox;
    ckSimImprimirDireto: TCheckBox;
    ckNaoImprimirDireto: TCheckBox;
    GroupBox19: TGroupBox;
    ckSimCupomFiscalF4: TCheckBox;
    ckNaoCupomFiscalF4: TCheckBox;
    GroupBox29: TGroupBox;
    ckSimCupomOrc: TCheckBox;
    ckNaoCupomOrc: TCheckBox;
    ckUsbCupomOrc: TCheckBox;
    ckLpt1CupomOrc: TCheckBox;
    memoDivisao: TMemo;
    lbl_DesenhoDivisao: TLabel;
    GroupBox20: TGroupBox;
    ckSimCXDialogo: TCheckBox;
    ckNaoCXDialogo: TCheckBox;
    GroupBox21: TGroupBox;
    ckSimCalcIBPT: TCheckBox;
    ckNaoCalcIBPT: TCheckBox;
    GroupBox23: TGroupBox;
    memo_Frase: TMemo;
    ckSimFrase: TCheckBox;
    ckNaoFrase: TCheckBox;
    GroupBox22: TGroupBox;
    rb_1: TRadioButton;
    rb_2: TRadioButton;
    rb_3: TRadioButton;
    rb_4: TRadioButton;
    rb_5: TRadioButton;
    rb_6: TRadioButton;
    rb_7: TRadioButton;
    rb_8: TRadioButton;
    rb_9: TRadioButton;
    rb_10: TRadioButton;
    GroupBox24: TGroupBox;
    ckLpt1: TCheckBox;
    ckLpt2: TCheckBox;
    ckLpt3: TCheckBox;
    ckCom1: TCheckBox;
    ckUSB: TCheckBox;
    ckUSB2: TCheckBox;
    ckUSB3: TCheckBox;
    ckUSB4: TCheckBox;
    GroupBox25: TGroupBox;
    ckSimImpressoraTermica: TCheckBox;
    ckNaoImpressoraTermica: TCheckBox;
    GroupBox26: TGroupBox;
    ckImpressaoPosVendaSim: TCheckBox;
    ckImpressaoPosVendaNao: TCheckBox;
    GroupBox27: TGroupBox;
    ckSimImpressoraMatricial: TCheckBox;
    ckNaoImpressoraMatricial: TCheckBox;
    GroupBox30: TGroupBox;
    lbl_edtECF: TLabeledEdit;
    lbl_edtAliquota: TLabeledEdit;
    lbl_edtAnalisaRetorno: TLabeledEdit;
    ckBematech: TCheckBox;
    ckDaruma: TCheckBox;
    ckSweeda: TCheckBox;
    ckEpson: TCheckBox;
    grbNuvem: TGroupBox;
    ckSimNuvem: TCheckBox;
    ckNaoNuvem: TCheckBox;
    tbsNuvem: TTabSheet;
    edtEmail: TEdit;
    Label2: TLabel;
    edtPassword: TEdit;
    Label3: TLabel;
    edtNode: TEdit;
    Label5: TLabel;
    edtKey: TEdit;
    Label6: TLabel;
    edtDomain: TEdit;
    Label7: TLabel;
    edtToken: TEdit;
    Label4: TLabel;
    sbGravarNuvem: TSpeedButton;
    btLogin: TButton;
    memoResp: TMemo;
    procedure btnSairClick(Sender: TObject);
    procedure OcultarSheets(PageControl: TPageControl);
    procedure LimparBotoes;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECT;
    procedure ibeaSairClick(Sender: TObject);
    procedure ibeaIncluirClick(Sender: TObject);
    procedure ckSimEstoqueCheck(Sender: TObject);
    procedure ckNaoEstoqueCheck(Sender: TObject);
    procedure ckSimCupomCheck(Sender: TObject);
    procedure ckNaoCupomCheck(Sender: TObject);
    procedure ckSimProdEstoqueCheck(Sender: TObject);
    procedure ckNaoProdEstoqueCheck(Sender: TObject);
    procedure ckSimFraseCheck(Sender: TObject);
    procedure ckNaoFraseCheck(Sender: TObject);
    procedure ckCancelarItemSimCheck(Sender: TObject);
    procedure ckCancelarItemNaoCheck(Sender: TObject);
    procedure ckSimTrocoInicialCxCheck(Sender: TObject);
    procedure ckNaoTrocoInicialCxCheck(Sender: TObject);
    procedure ckSimImprimirDiretoCheck(Sender: TObject);
    procedure ckNaoImprimirDiretoCheck(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckSimPedSangriaCheck(Sender: TObject);
    procedure ckNaoPedSangriaCheck(Sender: TObject);
    procedure ckSimImpressoraMatricialCheck(Sender: TObject);
    procedure ckNaoImpressoraMatricialCheck(Sender: TObject);
    procedure ckSimImpressoraTermicaCheck(Sender: TObject);
    procedure ckNaoImpressoraTermicaCheck(Sender: TObject);
    procedure ckSimConfigSenhaCheck(Sender: TObject);
    procedure ckNaoConfigSenhaCheck(Sender: TObject);
    procedure ckLpt1Check(Sender: TObject);
    procedure ckCom1Check(Sender: TObject);
    procedure ckBematechCheck(Sender: TObject);
    procedure ckDarumaCheck(Sender: TObject);
    procedure ckSweedaCheck(Sender: TObject);
    procedure ckSimEstoqueItemCheck(Sender: TObject);
    procedure ckNaoEstoqueItemCheck(Sender: TObject);
    procedure ckImpressaoPosVendaSimCheck(Sender: TObject);
    procedure ckImpressaoPosVendaNaoCheck(Sender: TObject);
    procedure ckSimCupomFiscalF4Check(Sender: TObject);
    procedure ckNaoCupomFiscalF4Check(Sender: TObject);
    procedure ckLpt2Check(Sender: TObject);
    procedure ckLpt3Check(Sender: TObject);
    procedure ckSimNegativarEstoqueCheck(Sender: TObject);
    procedure ckNaoNegativarEstoqueCheck(Sender: TObject);
    procedure ckSimPosVendaViaRedeCheck(Sender: TObject);
    procedure ckNaoPosVendaViaRedeCheck(Sender: TObject);
    procedure ckUSBCheck(Sender: TObject);
    procedure ckUSB2Check(Sender: TObject);
    procedure ckUSB3Check(Sender: TObject);
    procedure ckUSB4Check(Sender: TObject);
    procedure sbInfCaixaClick(Sender: TObject);
    procedure sbInfGeralClick(Sender: TObject);
    procedure sbInfCuponsClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckEpsonCheck(Sender: TObject);
    procedure ckSimCalcIBPTCheck(Sender: TObject);
    procedure ckNaoCalcIBPTCheck(Sender: TObject);
    procedure ckSimNPCheck(Sender: TObject);
    procedure ckNaoNPCheck(Sender: TObject);
    procedure ckSimSatGeralCheck(Sender: TObject);
    procedure ckNaoSatGeralCheck(Sender: TObject);
    procedure ckSimPrateleiraClick(Sender: TObject);
    procedure ckNaoPrateleiraClick(Sender: TObject);
    procedure ckSimNuvemClick(Sender: TObject);
    procedure ckNaoNuvemClick(Sender: TObject);
    procedure btLoginClick(Sender: TObject);
    procedure sbGravarNuvemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

uses untdmModule, DB,
  Firebase.Interfaces,
  Firebase.Auth,
  Firebase.Database,
  System.JSON,
  System.Net.HttpClient,
  System.Generics.Collections,
  System.JSON.Types,
  System.JSON.Writers;

{$R *.dfm}

procedure TfrmConfiguracoes.btLoginClick(Sender: TObject);

var
  Auth: IFirebaseAuth;
  AResponse: IFirebaseResponse;
  JSONResp: TJSONValue;
  Obj: TJSONObject;
begin
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(edtKey.Text);
  AResponse := Auth.SignInWithEmailAndPassword(edtEmail.Text, edtPassword.Text);
  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
  begin
    if Assigned(JSONResp) then
    begin
      JSONResp.Free;
    end;
    Exit;
  end;
  Obj := JSONResp as TJSONObject;
  Obj.Values['idToken'].Value;
  edtToken.Text := Obj.Values['idToken'].Value;


end;

procedure TfrmConfiguracoes.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConfiguracoes.OcultarSheets(PageControl: TPageControl);
var

iPage: Integer;

begin

for iPage := 0 to pcConfiguracoes.PageCount - 1 do
pcConfiguracoes.Pages[iPage].TabVisible := False;

if ( pcConfiguracoes.PageCount > 0 ) then
pcConfiguracoes.ActivePage := pcConfiguracoes.Pages[0];

pcConfiguracoes.Style := tsButtons;

end;

procedure TfrmConfiguracoes.LimparBotoes;

begin

ckSimEstoque.Checked         := False;
ckNaoEstoque.Checked         := False;
ckSimCupom.Checked           := False;
ckNaoCupom.Checked           := False;
ckSimProdEstoque.Checked     := False;
ckNaoProdEstoque.Checked     := False;
ckSimFrase.Checked           := False;
ckNaoFrase.Checked           := False;
ckCancelarItemSim.Checked    := False;
ckCancelarItemNao.Checked    := False;
ckSimTrocoInicialCx.Checked  := False;
ckNaoTrocoInicialCx.Checked  := False;
ckSimImprimirDireto.Checked  := False;
ckNaoImprimirDireto.Checked  := False;

lbl_edtPorcentagem.Text      := '';
end;

procedure TfrmConfiguracoes.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmConfiguracoes.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConfiguracoes.ExecSELECT;

begin

  with dmModule do begin

    Commit(ibConfig);
    ibConfig.Close;
    ibConfig.SQL.Clear;
    ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
    ibConfig.Open;

    lbl_edtNCM.Text := ibConfig.FieldByName('NCMFIXO').AsString;

    edtEmail.Text := ibConfig.FieldByName('STR_EMAILNUVEM').AsString;
    edtPassword.Text := ibConfig.FieldByName('STR_PASSWORDNUVEM').AsString;
    edtNode.Text := ibConfig.FieldByName('STR_NODENUVEM').AsString;
    edtKey.Text := ibConfig.FieldByName('STR_KEYNUVEM').AsString;
    edtDomain.Text := ibConfig.FieldByName('STR_DOMAINNUVEM').AsString;
    edtToken.Text := ibConfig.FieldByName('STR_TOKENNUVEM').AsString;

    if ibConfig.FieldByName('PORCENTAGEMCUSTO').AsFloat > 0 Then begin

      lbl_edtPorcentagemCusto.Text := FloatToStr(ibConfig.FieldByName('PORCENTAGEMCUSTO').AsFloat);

    end;  

    if ibConfig.FieldByName('PORCENTAGEMVLRC').AsFloat > 0 Then begin

      lbl_edtPorcentagemVlrC.Text := FloatToStr(ibConfig.FieldByName('PORCENTAGEMVLRC').AsFloat);

    end;

    if ibConfig.FieldByName('ESTOQUEMINIMO').AsString = 'Sim' Then begin

      ckSimEstoque.Checked := True;
      ckNaoEstoque.Checked := False;

    end else begin

      ckSimEstoque.Checked := False;
      ckNaoEstoque.Checked := True;

    end;

    if ibConfig.FieldByName('ABREFORMNP').AsInteger = 1 Then begin

      ckSimNP.Checked := True;
      ckNaoNP.Checked := False;

    end else begin

      ckSimNP.Checked := False;
      ckNaoNP.Checked := True;

    end;

    if ibConfig.FieldByName('INT_NUVEM').AsInteger = 1 Then begin

      ckSimNuvem.Checked := True;
      ckNaoNuvem.Checked := False;

    end else begin

      ckSimNuvem.Checked := False;
      ckNaoNuvem.Checked := True;

    end;

    if ibConfig.FieldByName('BLOQUEIAVENDAESTOQUE').AsInteger = 1 Then begin

      ckSimBloqueiaVendaEstoque.Checked := True;
      ckNaoBloqueiaVendaEstoque.Checked := False;

    end else begin

      ckSimBloqueiaVendaEstoque.Checked := False;
      ckNaoBloqueiaVendaEstoque.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('SATGERAL').AsInteger = 1 Then begin

      ckSimSatGeral.Checked := True;
      ckNaoSatGeral.Checked := False;

    end else begin

      ckSimSatGeral.Checked := False;
      ckNaoSatGeral.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('ATIVARCALCULOIBPT').AsInteger = 1 Then begin

      ckSimCalcIBPT.Checked := True;
      ckNaoCalcIBPT.Checked := False;

    end else begin

      ckSimCalcIBPT.Checked := False;
      ckNaoCalcIBPT.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('CUPOMPVENDA').AsInteger = 1 Then begin

      ckSimCPosVenda.Checked := True;
      ckNaoCPosVenda.Checked := False;

    end else begin

      ckSimCPosVenda.Checked := False;
      ckNaoCPosVenda.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('CUPOMSIMPLESCONF').AsInteger = 1 Then begin

      ckSimCupomSimples.Checked := True;
      ckNaoCupomSimples.Checked := False;

    end else begin

      ckSimCupomSimples.Checked := False;
      ckNaoCupomSimples.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('SATDARUMA').AsInteger = 1 Then begin

      ckSimSATDaruma.Checked := True;
      ckNaoSATDaruma.Checked := False;

    end else begin

      ckSimSATDaruma.Checked := False;
      ckNaoSATDaruma.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('SIMCUPOMORC').AsString = 'Sim' Then begin

      ckSimCupomOrc.Checked := True;
      ckNaoCupomOrc.Checked := False;

    end else begin

      ckSimCupomOrc.Checked := False;
      ckNaoCupomOrc.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('IMPRIMECUPOMPED').AsString = 'Sim' Then begin

      ckSimCupomPed.Checked := True;
      ckNaoCupomPed.Checked := False;

    end else begin

      ckSimCupomPed.Checked := False;
      ckNaoCupomPed.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('GAVETADARUMA').AsString = 'Sim' Then begin

      ckGavDaruma.Checked := True;
      ckGavBematech.Checked := False;

    end;
    
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('GAVETABEMATECH').AsString = 'Sim' Then begin

      ckGavBematech.Checked := True;
      ckGavDaruma.Checked := False;

    end;
    
////////////////////////////////////////////////////////////////////////////////


    if ibConfig.FieldByName('CXDIALOGOIMPRESSAO').AsString = 'Sim' Then begin

      ckSimCXDialogo.Checked := True;
      ckNaoCXDialogo.Checked := False;

    end else begin

      ckSimCXDialogo.Checked := False;
      ckNaoCXDialogo.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////


    if ibConfig.FieldByName('TRESCASASDECIMAIS').AsString = 'Sim' Then begin

      ckSimCasasDecimais.Checked := True;
      ckNaoCasasDecimais.Checked := False;

    end else begin

      ckSimCasasDecimais.Checked := False;
      ckNaoCasasDecimais.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('LPT1CUPOMORC').AsString = 'Sim' Then begin

      ckLpt1CupomOrc.Checked := True;

    end else begin

      ckLpt1CupomOrc.Checked := False;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('USBCUPOMORC').AsString = 'Sim' Then begin

      ckUsbCupomOrc.Checked := True;

    end else begin

      ckUsbCupomOrc.Checked := False;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('IMPRIMIRVIAREDE').AsString = 'Sim' Then begin

      ckSimPosVendaViaRede.Checked := True;
      ckNaoPosVendaViaRede.Checked := False;

    end else begin

      ckSimPosVendaViaRede.Checked := False;
      ckNaoPosVendaViaRede.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('CAMINHODEREDE').AsString <> '' Then begin

      lbl_edtNomeCaminhoRede.Text := ibConfig.FieldByName('CAMINHODEREDE').AsString ;

    end;
    
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('NEGATIVARESTOQUE').AsString = 'Sim' Then begin

      ckSimNegativarEstoque.Checked := True;
      ckNaoNegativarEstoque.Checked := False;

    end else begin

      ckSimNegativarEstoque.Checked := False;
      ckNaoNegativarEstoque.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if (ibConfig.FieldByName('RECEBERDINHEIRO').AsString = 'Sim') Then begin

      ckSimReceberDinheiro.Checked := True;
      ckNaoReceberDinheiro.Checked := False;

    end;

    if (ibConfig.FieldByName('RECEBERDINHEIRO').AsString = 'Nao')or(ibConfig.FieldByName('RECEBERDINHEIRO').AsString ='null') Then begin

      ckNaoReceberDinheiro.Checked := True;
      ckSimReceberDinheiro.Checked := False;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('IMPRESSAOPOSVENDA').AsString = 'Sim' Then begin

      ckImpressaoPosVendaSim.Checked := True;
      ckImpressaoPosVendaNao.Checked := False;

    end else begin

      ckImpressaoPosVendaSim.Checked := False;
      ckImpressaoPosVendaNao.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('IMPRIMIRCUPOM').AsString = 'Sim' Then begin

      ckSimCupom.Checked := True;
      ckNaoCupom.Checked := False;

    end else begin

      ckSimCupom.Checked := False;
      ckNaoCupom.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('PRODUTOESTOQUE').AsString = 'Sim' Then begin

      ckSimProdEstoque.Checked := True;
      ckNaoProdEstoque.Checked := False;

    end else begin

      ckSimProdEstoque.Checked := False;
      ckNaoProdEstoque.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('CANCELARITEMCX').AsString = 'Sim' Then begin

      ckCancelarItemSim.Checked := True;
      ckCancelarItemNao.Checked := False;

    end else begin

      ckCancelarItemSim.Checked := False;
      ckCancelarItemNao.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('TROCOINICIALCX').AsString = 'Sim' Then begin

      ckSimTrocoInicialCx.Checked := True;
      ckNaoTrocoInicialCx.Checked := False;

    end else begin

      ckSimTrocoInicialCx.Checked := False;
      ckNaoTrocoInicialCx.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('IMPRIMIRDIRETO').AsString = 'Sim' Then begin

      ckSimImprimirDireto.Checked := True;
      ckNaoImprimirDireto.Checked := False;

    end else begin

      ckSimImprimirDireto.Checked := False;
      ckNaoImprimirDireto.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('FRASERODAPE').AsString = 'Sim' Then begin

      ckSimFrase.Checked := True;
      ckNaoFrase.Checked := False;

    end else begin

      ckSimFrase.Checked := False;
      ckNaoFrase.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('FRASE').AsString <> '' Then begin

      memo_Frase.Text := ibConfig.FieldByName('FRASE').AsString;

    end else begin

      memo_Frase.Text := '';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('DESENHODIVISAO').AsString <> '' Then begin

      memoDivisao.Text := ibConfig.FieldByName('DESENHODIVISAO').AsString;

    end else begin

      memoDivisao.Text := '';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('PEDIDOS').AsString = 'Sim' Then begin

      ckSimPedSangria.Checked := True;
      ckNaoPedSangria.Checked := False;

    end else begin

      ckSimPedSangria.Checked := False;

    end;

////////////////////////////////////////////////////////////////////////////////
    
    if ibConfig.FieldByName('ESTOQUEITEMCX').AsString = 'Sim' Then begin

      ckSimEstoqueItem.Checked := True;
      ckNaoEstoqueItem.Checked := False;

    end else begin

      ckSimEstoqueItem.Checked := False;
      ckNaoEstoqueItem.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('SANGRIA').AsString = 'Sim' Then begin

      ckNaoPedSangria.Checked := True;
      ckSimPedSangria.Checked := False;

    end else begin

      ckNaoPedSangria.Checked := False;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('IMPRESSORAMATRICIAL').AsString = 'Sim' Then begin

      ckSimImpressoraMatricial.Checked := True;
      ckNaoImpressoraMatricial.Checked := False;

    end else begin

      ckSimImpressoraMatricial.Checked := False;
      ckNaoImpressoraMatricial.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('IMPRESSORATERMICA').AsString = 'Sim' Then begin

      ckSimImpressoraTermica.Checked := True;
      ckNaoImpressoraTermica.Checked := False;

    end else begin

      ckSimImpressoraTermica.Checked := False;
      ckNaoImpressoraTermica.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

   { if (ibConfig.FieldByName('RWORD').AsString = 'Sim') Then begin

      ckWord.Checked := True;
      ckExcel.Checked := False;

    end;

    if (ibConfig.FieldByName('REXCEL').AsString = 'Sim') Then begin

      ckExcel.Checked := True;
      ckWord.Checked := False;

    end; }

////////////////////////////////////////////////////////////////////////////////

    if (ibConfig.FieldByName('LPT1').AsString = 'Sim') Then begin

      ckLpt1.Checked := True;
      ckCom1.Checked := False;
      ckLpt2.Checked := False;
      ckLpt3.Checked := False;
      ckUSB.Checked := False;
      ckUSB2.Checked := False;
      ckUSB3.Checked := False;
      ckUSB4.Checked := False;

    end;

////////////////////////////////////////////////////////////////////////////////

    if (ibConfig.FieldByName('LPT2').AsString = 'Sim') Then begin

      ckLpt2.Checked := True;
      ckCom1.Checked := False;
      ckLpt1.Checked := False;
      ckLpt3.Checked := False;
      ckUSB.Checked  := False;
      ckUSB2.Checked := False;
      ckUSB3.Checked := False;
      ckUSB4.Checked := False;

    end;

////////////////////////////////////////////////////////////////////////////////

    if (ibConfig.FieldByName('LPT3').AsString = 'Sim') Then begin

      ckLpt3.Checked := True;
      ckCom1.Checked := False;
      ckLpt1.Checked := False;
      ckLpt2.Checked := False;
      ckUSB.Checked  := False;
      ckUSB2.Checked := False;
      ckUSB3.Checked := False;
      ckUSB4.Checked := False;

    end;

    if (ibConfig.FieldByName('COM1').AsString = 'Sim') Then begin

      ckCom1.Checked := True;
      ckLpt1.Checked := False;
      ckLpt2.Checked := False;
      ckLpt3.Checked := False;
      ckUSB.Checked  := False;
      ckUSB2.Checked := False;
      ckUSB3.Checked := False;
      ckUSB4.Checked := False;

    end;

    if (ibConfig.FieldByName('USB').AsString = 'Sim') Then begin

      ckUSB.Checked  := True;
      ckUSB2.Checked := False;
      ckUSB3.Checked := False;
      ckUSB4.Checked := False;
      ckCom1.Checked := False;
      ckLpt1.Checked := False;
      ckLpt2.Checked := False;
      ckLpt3.Checked := False;

    end;

    if (ibConfig.FieldByName('USB2').AsString = 'Sim') Then begin

      ckUSB2.Checked  := True;
      ckUSB.Checked := False;
      ckUSB3.Checked := False;
      ckUSB4.Checked := False;
      ckCom1.Checked := False;
      ckLpt1.Checked := False;
      ckLpt2.Checked := False;
      ckLpt3.Checked := False;

    end;

    if (ibConfig.FieldByName('USB3').AsString = 'Sim') Then begin

      ckUSB3.Checked  := True;
      ckUSB.Checked := False;
      ckUSB2.Checked := False;
      ckUSB4.Checked := False;
      ckCom1.Checked := False;
      ckLpt1.Checked := False;
      ckLpt2.Checked := False;
      ckLpt3.Checked := False;

    end;

    if (ibConfig.FieldByName('USB4').AsString = 'Sim') Then begin

      ckUSB4.Checked  := True;
      ckUSB.Checked := False;
      ckUSB3.Checked := False;
      ckUSB4.Checked := False;
      ckCom1.Checked := False;
      ckLpt1.Checked := False;
      ckLpt2.Checked := False;
      ckLpt3.Checked := False;

    end;

////////////////////////////////////////////////////////////////////////////////

    if (ibConfig.FieldByName('CUPOMFISCALF4').AsString = 'Sim') Then begin

      ckSimCupomFiscalF4.Checked := True;
      ckNaoCupomFiscalF4.Checked := False;

    end;

    if (ibConfig.FieldByName('CUPOMFISCALF4').AsString = 'Nao') Then begin

      ckSimCupomFiscalF4.Checked := False;
      ckNaoCupomFiscalF4.Checked := True;


    end;

////////////////////////////////////////////////////////////////////////////////

    if ibConfig.FieldByName('CONTROLARPRATELEIRA').AsString = 'Sim' Then begin

      ckSimPrateleira.Checked := True;
      ckNaoPrateleira.Checked := False;

    end else begin

      ckSimPrateleira.Checked := False;
      ckNaoPrateleira.Checked := True;

    end;
////////////////////////////////////////////////////////////////////////////////

    if (ibConfig.FieldByName('BEMATECHMFD').AsString = 'Sim') Then begin

      ckBematech.Checked := True;
      ckDaruma.Checked := False;
      ckSweeda.Checked := False;
      ckEpson.Checked  := False;

    end;

    if (ibConfig.FieldByName('DARUMAMFD').AsString = 'Sim') Then begin

      ckDaruma.Checked := True;
      ckBematech.Checked := False;
      ckSweeda.Checked := False;
      ckEpson.Checked  := False;

    end;

    if (ibConfig.FieldByName('SWEEDAMFD').AsString = 'Sim') Then begin

      ckSweeda.Checked := True;
      ckDaruma.Checked := False;
      ckBematech.Checked := False;
      ckEpson.Checked  := False;

    end;

    if (ibConfig.FieldByName('EPSONMFD').AsString = 'Sim') Then begin

      ckEpson.Checked  := True;
      ckSweeda.Checked := False;
      ckDaruma.Checked := False;
      ckBematech.Checked := False;

    end;

////////////////////////////////////////////////////////////////////////////////

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 1) Then begin

      rb_1.Checked := True;
      rb_2.Checked := False;
      rb_3.Checked := False;
      rb_4.Checked := False;
      rb_5.Checked := False;
      rb_6.Checked := False;
      rb_7.Checked := False;
      rb_8.Checked := False;
      rb_9.Checked := False;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 2) Then begin

      rb_1.Checked := False;
      rb_2.Checked := True;
      rb_3.Checked := False;
      rb_4.Checked := False;
      rb_5.Checked := False;
      rb_6.Checked := False;
      rb_7.Checked := False;
      rb_8.Checked := False;
      rb_9.Checked := False;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 3) Then begin

      rb_1.Checked := False;
      rb_2.Checked := False;
      rb_3.Checked := True;
      rb_4.Checked := False;
      rb_5.Checked := False;
      rb_6.Checked := False;
      rb_7.Checked := False;
      rb_8.Checked := False;
      rb_9.Checked := False;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 4) Then begin

      rb_1.Checked := False;
      rb_2.Checked := False;
      rb_3.Checked := False;
      rb_4.Checked := True;
      rb_5.Checked := False;
      rb_6.Checked := False;
      rb_7.Checked := False;
      rb_8.Checked := False;
      rb_9.Checked := False;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 5) Then begin

      rb_1.Checked := False;
      rb_2.Checked := False;
      rb_3.Checked := False;
      rb_4.Checked := False;
      rb_5.Checked := True;
      rb_6.Checked := False;
      rb_7.Checked := False;
      rb_8.Checked := False;
      rb_9.Checked := False;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 6) Then begin

      rb_1.Checked := False;
      rb_2.Checked := False;
      rb_3.Checked := False;
      rb_4.Checked := False;
      rb_5.Checked := False;
      rb_6.Checked := True;
      rb_7.Checked := False;
      rb_8.Checked := False;
      rb_9.Checked := False;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 7) Then begin

      rb_1.Checked := False;
      rb_2.Checked := False;
      rb_3.Checked := False;
      rb_4.Checked := False;
      rb_5.Checked := False;
      rb_6.Checked := False;
      rb_7.Checked := True;
      rb_8.Checked := False;
      rb_9.Checked := False;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 8) Then begin

      rb_1.Checked := False;
      rb_2.Checked := False;
      rb_3.Checked := False;
      rb_4.Checked := False;
      rb_5.Checked := False;
      rb_6.Checked := False;
      rb_7.Checked := False;
      rb_8.Checked := True;
      rb_9.Checked := False;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 9) Then begin

      rb_1.Checked := False;
      rb_2.Checked := False;
      rb_3.Checked := False;
      rb_4.Checked := False;
      rb_5.Checked := False;
      rb_6.Checked := False;
      rb_7.Checked := False;
      rb_8.Checked := False;
      rb_9.Checked := True;
      rb_10.Checked := False;

    end;

    if (ibConfig.FieldByName('QTDESALTOS').AsInteger = 10) Then begin

      rb_1.Checked := False;
      rb_2.Checked := False;
      rb_3.Checked := False;
      rb_4.Checked := False;
      rb_5.Checked := False;
      rb_6.Checked := False;
      rb_7.Checked := False;
      rb_8.Checked := False;
      rb_9.Checked := False;
      rb_10.Checked := True;

    end;

////////////////////////////////////////////////////////////////////////////////

      lbl_edtECF.Text       := ibConfig.FieldByName('ECF').AsString;
      lbl_edtAliquota.Text  := ibConfig.FieldByName('ALIQUOTA').AsString;
      lbl_edtAnalisaRetorno.Text := ibConfig.FieldByName('ANALISARETORNO').AsString;
  end;//with

end;

procedure TfrmConfiguracoes.ibeaIncluirClick(Sender: TObject);

var

EstoqueM,AvisaEstoque,ConfirmaCupom,AvisaCupom, ProdEstoque, ConfirmaFrase : String;
CancelarItemCx,TrocoInicialCx, CasasDecimais : String;
ConfirmaGravacao, Aviso, ConfirmaGravarCupom, intNuvem : Integer;

IDConfig,QtdeSaltos,AtivarCalcIBPT,SATDaruma,intCupomSimples : Integer;

VlrPorcentagem,ImprimirDireto,FraseRodape,DesenhoDivisao,PorcentagemCusto : String;
Pedidos,Sangria,ImpressoraMatricial,ImpressoraTermica : String;
RWord,RExcel,SenhaConfiguracao, EstoqueItemCX,SimCupomF4,ControlarPrateleira : String;
LPT1,COM1,BematechMFD,DarumaMFD,SweedaMFD, EpsonMFD, ImpressaoPosVenda : String;
LPT2,LPT3, USB, ReceberDinheiro, NegativarEstoque, ImprimirViaRede : String;
USB2,USB3,USB4,GavBematech,GavDaruma,ImprimeCupomPed : String;
NomeCaminhoRede,CXDialogoImpr : String;
CupomOrc,LPT1CupomOrc,USBCupomOrc,PorcentagemVlrC,strNCMFixo : String;
intCPosVenda, intSatGeral, intBloqueiaVendaEstoque : Integer;
intAbrirNP : TConfigCX;

begin

  with dmModule do begin

////////////////////////////////////////////////////////////////////////////////

  //instanciando a classe configcx
  intAbrirNP := TConfigCX.Create();

    if ckSimNuvem.Checked Then begin

      intNuvem := 1;

    end;

    if ckNaoNuvem.Checked Then begin

      intNuvem := 0;

    end;

    if ckSimNP.Checked Then begin

      intAbrirNP.AbreNotaP := 1;

    end;

    if ckNaoNP.Checked Then begin

      intAbrirNP.AbreNotaP := 0;

    end;

    if (ckSimNP.Checked = False)and(ckNaoNP.Checked = False) Then begin

      intAbrirNP.AbreNotaP := 0;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ckSimCXDialogo.Checked Then begin

      CXDialogoImpr := 'Sim';

    end;

    if ckNaoCXDialogo.Checked Then begin

      CXDialogoImpr := 'Nao';

    end;

    if (ckSimCXDialogo.Checked = False)and(ckNaoCXDialogo.Checked = False) Then begin

      CXDialogoImpr := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimBloqueiaVendaEstoque.Checked Then begin

      intBloqueiaVendaEstoque := 1;

    end;

    if ckNaoBloqueiaVendaEstoque.Checked Then begin

      intBloqueiaVendaEstoque := 0;

    end;

    if (ckSimBloqueiaVendaEstoque.Checked = False)and(ckNaoBloqueiaVendaEstoque.Checked = False) Then begin

      intBloqueiaVendaEstoque := 0;

    end;

////////////////////////////////////////////////////////////////////////////////
    if ckSimCPosVenda.Checked Then begin

      intCPosVenda := 1;

    end;

    if ckNaoCPosVenda.Checked Then begin

      intCPosVenda := 0;

    end;

    if (ckSimCPosVenda.Checked = False)and(ckNaoCPosVenda.Checked = False) Then begin

      intCPosVenda := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimSatGeral.Checked Then begin

      intSatGeral := 1;

    end;

    if ckNaoSatGeral.Checked Then begin

      intSatGeral := 0;

    end;

    if (ckSimSatGeral.Checked = False)and(ckNaoSatGeral.Checked = False) Then begin

      intSatGeral := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimCupomSimples.Checked Then begin

      intCupomSimples := 1;

    end;

    if ckNaoCupomSimples.Checked Then begin

      intCupomSimples := 0;

    end;

    if (ckSimCupomSimples.Checked = False)and(ckNaoCupomSimples.Checked = False) Then begin

      intCupomSimples := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimSATDaruma.Checked Then begin

      SATDaruma := 1;

    end;

    if ckNaoSATDaruma.Checked Then begin

      SATDaruma := 0;

    end;

    if (ckSimSATDaruma.Checked = False)and(ckNaoSATDaruma.Checked = False) Then begin

    SATDaruma := 0;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ckSimCalcIBPT.Checked Then begin

      AtivarCalcIBPT := 1;

    end;

    if ckNaoCalcIBPT.Checked Then begin

      AtivarCalcIBPT := 0;

    end;

    if (ckSimCalcIBPT.Checked = False)and(ckNaoCalcIBPT.Checked = False) Then begin

      AtivarCalcIBPT := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimCupomPed.Checked Then begin

      ImprimeCupomPed := 'Sim';

    end;

    if ckNaoCupomPed.Checked Then begin

      ImprimeCupomPed := 'Nao';

    end;

    if (ckSimCupomPed.Checked = False)and(ckNaoCupomPed.Checked = False) Then begin

      ImprimeCupomPed := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckGavBematech.Checked Then begin

      GavBematech := 'Sim';
      GavDaruma := 'Nao';

    end;

    if ckGavDaruma.Checked Then begin

      GavDaruma := 'Sim';
      GavBematech := 'Nao';
      
    end;

    if (ckGavBematech.Checked = False)and(ckGavDaruma.Checked = False) Then begin

      GavDaruma := 'Nao';
      GavBematech := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimCasasDecimais.Checked Then begin

      CasasDecimais := 'Sim';

    end;

    if ckNaoCasasDecimais.Checked Then begin

      CasasDecimais := 'Nao';

    end;

    if (ckSimCasasDecimais.Checked = False)and(ckNaoCasasDecimais.Checked = False) Then begin

      CasasDecimais := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////


    if ckSimCupomOrc.Checked Then begin

      CupomOrc := 'Sim';

    end;

    if ckNaoCupomOrc.Checked Then begin

      CupomOrc := 'Nao';

    end;

    if (ckSimCupomOrc.Checked = False)and(ckNaoCupomOrc.Checked = False) Then begin

      CupomOrc := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckLpt1CupomOrc.Checked Then begin

      LPT1CupomOrc := 'Sim';

    end;

    if (ckLpt1CupomOrc.Checked = False) Then begin

      LPT1CupomOrc := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckUsbCupomOrc.Checked Then begin

      USBCupomOrc := 'Sim';

    end;

    if (ckUsbCupomOrc.Checked = False) Then begin

      USBCupomOrc := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimPosVendaViaRede.Checked Then begin

      ImprimirViaRede := 'Sim';

    end;

    if ckNaoPosVendaViaRede.Checked Then begin

      ImprimirViaRede := 'Nao';

    end;

    if (ckSimPosVendaViaRede.Checked = False)and(ckNaoPosVendaViaRede.Checked = False) Then begin

      ImprimirViaRede := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimReceberDinheiro.Checked Then begin

      ReceberDinheiro := 'Sim';

    end;

    if ckNaoReceberDinheiro.Checked Then begin

      ReceberDinheiro := 'Nao';

    end;

    if (ckSimReceberDinheiro.Checked = False)and(ckNaoReceberDinheiro.Checked = False) Then begin

      ReceberDinheiro := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimNegativarEstoque.Checked Then begin

      NegativarEstoque := 'Sim';

    end;

    if ckNaoNegativarEstoque.Checked Then begin

      NegativarEstoque := 'Nao';

    end;

    if (ckSimNegativarEstoque.Checked = False)and(ckNaoNegativarEstoque.Checked = False) Then begin

      NegativarEstoque := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimEstoque.Checked Then begin

      EstoqueM := 'Sim';

    end;

    if ckNaoEstoque.Checked Then begin

      EstoqueM := 'Nao';

    end;

    if (ckSimEstoque.Checked = False)and(ckNaoEstoque.Checked = False) Then begin

    EstoqueM := 'Nao';

    end;
////////////////////////////////////////////////////////////////////////////////

    if ckSimCupom.Checked Then begin

    ConfirmaCupom := 'Sim';

    end;

    if ckNaoCupom.Checked Then begin

    ConfirmaCupom := 'Nao';

    end;

    if (ckSimCupom.Checked = False)and(ckNaoCupom.Checked = False) Then begin

    ConfirmaCupom := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimProdEstoque.Checked Then begin

    ProdEstoque := 'Sim';

    end;

    if ckNaoProdEstoque.Checked Then begin

    ProdEstoque := 'Nao';

    end;

    if (ckSimProdEstoque.Checked = False)and (ckNaoProdEstoque.Checked = False) Then begin

    ProdEstoque := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimFrase.Checked Then begin

    ConfirmaFrase := 'Sim';

    end;

    if ckNaoFrase.Checked Then begin

    ConfirmaFrase := 'Nao';

    end;

    if (ckSimFrase.Checked = False)and(ckNaoFrase.Checked = False) Then begin

    ConfirmaFrase := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckCancelarItemSim.Checked Then begin

      CancelarItemCx := 'Sim';

    end;

    if ckCancelarItemNao.Checked Then begin

      CancelarItemCx := 'Nao';

    end;

    if (ckCancelarItemSim.Checked = False)and(ckCancelarItemNao.Checked = False) Then begin

      CancelarItemCx := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimTrocoInicialCx.Checked Then begin

      TrocoInicialCx := 'Sim';

    end;

    if ckNaoTrocoInicialCx.Checked Then begin

      TrocoInicialCx := 'Nao';

    end;

    if (ckSimTrocoInicialCx.Checked = False)and(ckNaoTrocoInicialCx.Checked = False) Then begin

      TrocoInicialCx := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimImprimirDireto.Checked Then begin

      ImprimirDireto := 'Sim';

    end;

    if ckNaoImprimirDireto.Checked Then begin

      ImprimirDireto := 'Nao';

    end;

    if (ckSimImprimirDireto.Checked = False)and(ckNaoImprimirDireto.Checked = False) Then begin

      ImprimirDireto := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimPedSangria.Checked Then begin

      Pedidos := 'Sim';
      Sangria := 'Nao';

    end;

    if ckNaoPedSangria.Checked Then begin

      Pedidos := 'Nao';
      Sangria := 'Sim';

    end;

    if (ckSimPedSangria.Checked = False)and(ckNaoPedSangria.Checked = False) Then begin

      Pedidos := 'Nao';
      Sangria := 'Sim';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimImpressoraMatricial.Checked Then begin

      ImpressoraMatricial := 'Sim';

    end;

    if ckNaoImpressoraMatricial.Checked Then begin

      ImpressoraMatricial := 'Nao';

    end;

    if (ckSimImpressoraMatricial.Checked = False)and(ckNaoImpressoraMatricial.Checked = False) Then begin

      ImpressoraMatricial := 'Nao';

    end;
////////////////////////////////////////////////////////////////////////////////

    if ckSimImpressoraTermica.Checked Then begin

      ImpressoraTermica := 'Sim';

    end;

    if ckNaoImpressoraTermica.Checked Then begin

      ImpressoraTermica := 'Nao';

    end;

    if (ckSimImpressoraTermica.Checked = False)and(ckNaoImpressoraTermica.Checked = False) Then begin

      ImpressoraTermica := 'Nao';

    end;
////////////////////////////////////////////////////////////////////////////////

    if ckSimEstoqueItem.Checked Then begin

      EstoqueItemCX := 'Sim';

    end;

    if ckNaoEstoqueItem.Checked Then begin

      EstoqueItemCX := 'Nao';

    end;

    if (ckSimEstoqueItem.Checked = False)and(ckNaoEstoqueItem.Checked = False) Then begin

      EstoqueItemCX := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckImpressaoPosVendaSim.Checked Then begin

      ImpressaoPosVenda := 'Sim';

    end;

    if ckImpressaoPosVendaNao.Checked Then begin

      ImpressaoPosVenda := 'Nao';

    end;

    if (ckImpressaoPosVendaSim.Checked = False)and(ckImpressaoPosVendaNao.Checked = False) Then begin

      ImpressaoPosVenda := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckLpt1.Checked Then begin

      LPT1 := 'Sim';
      COM1 := 'Nao';
      LPT2 := 'Nao';
      LPT3 := 'Nao';
      USB  := 'Nao';
      USB2 := 'Nao';
      USB3 := 'Nao';
      USB4 := 'Nao';

    end;


////////////////////////////////////////////////////////////////////////////////

    if ckLpt2.Checked Then begin

      LPT2 := 'Sim';
      COM1 := 'Nao';
      LPT1 := 'Nao';
      LPT3 := 'Nao';
      USB  := 'Nao';
      USB2 := 'Nao';
      USB3 := 'Nao';
      USB4 := 'Nao';

    end;


////////////////////////////////////////////////////////////////////////////////

    if ckLpt3.Checked Then begin

      LPT3 := 'Sim';
      COM1 := 'Nao';
      LPT1 := 'Nao';
      LPT2 := 'Nao';
      USB  := 'Nao';
      USB2 := 'Nao';
      USB3 := 'Nao';
      USB4 := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckUSB.Checked Then begin

      USB  := 'Sim';
      USB2 := 'Nao';
      USB3 := 'Nao';
      USB4 := 'Nao';
      LPT3 := 'Nao';
      COM1 := 'Nao';
      LPT1 := 'Nao';
      LPT2 := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckUSB2.Checked Then begin

      USB2  := 'Sim';
      USB  := 'Nao';
      USB3 := 'Nao';
      USB4 := 'Nao';
      LPT3 := 'Nao';
      COM1 := 'Nao';
      LPT1 := 'Nao';
      LPT2 := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckUSB3.Checked Then begin

      USB3  := 'Sim';
      USB  := 'Nao';
      USB2 := 'Nao';
      USB4 := 'Nao';
      LPT3 := 'Nao';
      COM1 := 'Nao';
      LPT1 := 'Nao';
      LPT2 := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckUSB4.Checked Then begin

      USB4  := 'Sim';
      USB  := 'Nao';
      USB2 := 'Nao';
      USB3 := 'Nao';
      LPT3 := 'Nao';
      COM1 := 'Nao';
      LPT1 := 'Nao';
      LPT2 := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if (ckLpt1.Checked = False)and(ckLpt2.Checked = False)and(ckLpt3.Checked = False)and(ckCom1.Checked = False)and(ckUSB.Checked = False) Then begin

      LPT1 := 'Sim';
      COM1 := 'Nao';
      LPT2 := 'Nao';
      LPT3 := 'Nao';

    end;

    if ckCom1.Checked Then begin

      COM1 := 'Sim';
      LPT1 := 'Nao';
      LPT2 := 'Nao';
      LPT3 := 'Nao';
      USB  := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckBematech.Checked Then begin

      BematechMFD := 'Sim';
      DarumaMFD := 'Nao';
      SweedaMFD := 'Nao';
      EpsonMFD  := 'Nao';
      
    end;

    if ckDaruma.Checked Then begin

      DarumaMFD := 'Sim';
      BematechMFD := 'Nao';
      SweedaMFD := 'Nao';
      EpsonMFD  := 'Nao';

    end;

    if ckSweeda.Checked Then begin

      SweedaMFD := 'Sim';
      DarumaMFD := 'Nao';
      BematechMFD := 'Nao';
      EpsonMFD  := 'Nao';

    end;

    if ckEpson.Checked Then begin

      EpsonMFD := 'Sim';
      DarumaMFD := 'Nao';
      BematechMFD := 'Nao';
      SweedaMFD := 'Nao';
      
    end;

////////////////////////////////////////////////////////////////////////////////


    if rb_1.Checked Then begin

    QtdeSaltos := StrToInt('1');

    end;

    if rb_2.Checked Then begin

    QtdeSaltos := StrToInt('2');

    end;

    if rb_3.Checked Then begin

    QtdeSaltos := StrToInt('3');

    end;

    if rb_4.Checked Then begin

    QtdeSaltos := StrToInt('4');

    end;

    if rb_5.Checked Then begin

    QtdeSaltos := StrToInt('5');

    end;

    if rb_6.Checked Then begin

    QtdeSaltos := StrToInt('6');

    end;

    if rb_7.Checked Then begin

    QtdeSaltos := StrToInt('7');

    end;

    if rb_8.Checked Then begin

    QtdeSaltos := StrToInt('8');

    end;

    if rb_9.Checked Then begin

    QtdeSaltos := StrToInt('9');

    end;

    if rb_10.Checked Then begin

    QtdeSaltos := StrToInt('10');

    end;

    if (QtdeSaltos <= 0) Then begin

    QtdeSaltos := StrToInt('0');

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckWord.Checked Then begin

      RWord := 'Sim';

    end;

    if ckWord.Checked = False Then begin

      RWord := 'Nao';

    end;

    if ckExcel.Checked Then begin

      RExcel := 'Sim';

    end;

    if ckExcel.Checked = False Then begin

      RExcel := 'Nao';

    end;

    if (ckWord.Checked = False)and(ckExcel.Checked = False) Then begin

      RWord  := 'Nao';
      RExcel := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////


    if ckSimConfigSenha.Checked Then begin

    SenhaConfiguracao := 'Sim';

    end;

    if ckNaoConfigSenha.Checked Then begin

    SenhaConfiguracao := 'Nao';

    end;

    if (ckSimConfigSenha.Checked = False)and (ckNaoConfigSenha.Checked = False) Then begin

    SenhaConfiguracao := 'Nao';

    end;

////////////////////////////////////////////////////////////////////////////////

    if ckSimCupomFiscalF4.Checked Then begin

      SimCupomF4 := 'Sim';

    end;

    if ckNaoCupomFiscalF4.Checked Then begin

      SimCupomF4 := 'Nao';

    end;

    if (ckSimCupomFiscalF4.Checked = False)and(ckNaoCupomFiscalF4.Checked = False) Then begin

      SimCupomF4 := 'Nao';

    end;
////////////////////////////////////////////////////////////////////////////////

    if ckSimPrateleira.Checked Then begin

      ControlarPrateleira := 'Sim';

    end;

    if ckNaoPrateleira.Checked Then begin

      ControlarPrateleira := 'Nao';

    end;

    if (ckSimPrateleira.Checked = False)and(ckNaoPrateleira.Checked = False) Then begin

      ControlarPrateleira := 'Nao';

    end;
////////////////////////////////////////////////////////////////////////////////


    VlrPorcentagem := StringReplace(lbl_edtPorcentagem.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    VlrPorcentagem := StringReplace(VlrPorcentagem,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if VlrPorcentagem = '' Then
    VlrPorcentagem := '0';

    PorcentagemCusto := StringReplace(lbl_edtPorcentagemCusto.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    PorcentagemCusto := StringReplace(PorcentagemCusto,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if PorcentagemCusto = '' Then
    PorcentagemCusto := '0';

    PorcentagemVlrC := StringReplace(lbl_edtPorcentagemVlrC.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
    PorcentagemVlrC := StringReplace(PorcentagemVlrC,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
    if PorcentagemVlrC = '' Then
    PorcentagemVlrC := '0';

////////////////////////////////////////////////////////////////////////////////

    Commit(ibConfig);
    ibConfig.Close;
    ibConfig.SQL.Clear;
    ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
    ibConfig.Open;

    IDConfig := ibConfig.FieldByName('IDCONFIG').AsInteger;

  //  AvisaEstoque := ibConfig.FieldByName('ESTOQUEMINIMO').AsString;
 //   AvisaCupom   := ibConfig.FieldByName('IMPRIMIRCUPOM').AsString;

  {  if (ckSimEstoque.Checked = False) and (ckNaoEstoque.Checked = False) Then begin

    EstoqueM := AvisaEstoque;

    end;

    if (ckSimCupom.Checked = False) and (ckNaoCupom.Checked = False) Then begin

    ConfirmaCupom := AvisaCupom;

    end; }



   ConfirmaGravacao := Application.MessageBox('Confirma a Opção?','Notificação: Opção de Configuração.',MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

   if ConfirmaGravacao = 6 Then begin

     try

      if ibConfig.RecordCount > 0 Then begin

        ibConfig.Close;
        ibConfig.SQL.Clear;
        ibConfig.SQL.Add('UPDATE TBLCONFIGURACOES SET '
        + 'IMPRIMIRCUPOM=''' + ConfirmaCupom + ''','
        + 'BLOQUEIAVENDAESTOQUE=''' + IntToStr(intBloqueiaVendaEstoque) + ''','
        + 'PRODUTOESTOQUE=''' + ProdEstoque + ''','
        + 'FRASERODAPE=''' + ConfirmaFrase + ''','
        + 'CANCELARITEMCX=''' + CancelarItemCx + ''','
        + 'VLRPORCENTAGEM=''' + VlrPorcentagem + ''','
        + 'PORCENTAGEMCUSTO=''' + PorcentagemCusto + ''','
        + 'PORCENTAGEMVLRC=''' + PorcentagemVlrC + ''','
        + 'TROCOINICIALCX=''' + TrocoInicialCx + ''','
        + 'IMPRIMIRDIRETO=''' + ImprimirDireto + ''','
        + 'QTDESALTOS=''' + IntToStr(QtdeSaltos) + ''','
        + 'RECEBERDINHEIRO=''' + ReceberDinheiro + ''','
        + 'FRASE=''' + memo_Frase.Text + ''','
        + 'PEDIDOS=''' + Pedidos + ''','
        + 'SANGRIA=''' + Sangria + ''','
        + 'IMPRESSORAMATRICIAL=''' + ImpressoraMatricial + ''','
        + 'IMPRESSORATERMICA=''' + ImpressoraTermica + ''','
        + 'DESENHODIVISAO=''' + memoDivisao.Text + ''','
        + 'RWORD=''' + RWord + ''','
        + 'REXCEL=''' + RExcel + ''','
        + 'SENHACONFIGURACAO = ''' + SenhaConfiguracao + ''','
        + 'LPT1= ''' + LPT1 + ''','
        + 'LPT2= ''' + LPT2 + ''','
        + 'LPT3= ''' + LPT3 + ''','
        + 'COM1= ''' + COM1 + ''','
        + 'USB= ''' + USB + ''','
        + 'USB2= ''' + USB2 + ''','
        + 'USB3= ''' + USB3 + ''','
        + 'USB4= ''' + USB4 + ''','
        + 'BEMATECHMFD= ''' + BematechMFD + ''','
        + 'DARUMAMFD= ''' + DarumaMFD + ''','
        + 'SWEEDAMFD= ''' + SweedaMFD + ''','
        + 'EPSONMFD= ''' + EpsonMFD + ''','
        + 'ECF=''' + lbl_edtECF.Text + ''','
        + 'ALIQUOTA=''' + lbl_edtAliquota.Text + ''','
        + 'ANALISARETORNO=''' + lbl_edtAnalisaRetorno.Text + ''','
        + 'ESTOQUEITEMCX=''' + EstoqueItemCX + ''','
        + 'IMPRESSAOPOSVENDA = ''' + ImpressaoPosVenda + ''','
        + 'CUPOMFISCALF4 = ''' + SimCupomF4 + ''','
        + 'CONTROLARPRATELEIRA = ''' + ControlarPrateleira + ''','
        + 'NEGATIVARESTOQUE = ''' + NegativarEstoque + ''','
        + 'IMPRIMIRVIAREDE = ''' + ImprimirViaRede + ''','
        + 'CAMINHODEREDE = ''' + lbl_edtNomeCaminhoRede.Text + ''','
        + 'SIMCUPOMORC = ''' + CupomOrc + ''','
        + 'LPT1CUPOMORC = ''' + LPT1CupomOrc + ''','
        + 'USBCUPOMORC = ''' + USBCupomOrc + ''','
        + 'TRESCASASDECIMAIS = ''' + CasasDecimais + ''','
        + 'CXDIALOGOIMPRESSAO = ''' + CXDialogoImpr + ''','
        + 'GAVETADARUMA = ''' + GavDaruma + ''','
        + 'GAVETABEMATECH = ''' + GavBematech + ''','
        + 'IMPRIMECUPOMPED = ''' + ImprimeCupomPed + ''','
        + 'ATIVARCALCULOIBPT = ''' + IntToStr(AtivarCalcIBPT) + ''','
        + 'SATDARUMA=''' + IntToStr(SATDaruma) + ''','
        + 'NCMFIXO=''' + lbl_edtNCM.Text + ''','
        + 'CUPOMSIMPLESCONF=''' + IntToStr(intCupomSimples) + ''','
        + 'CUPOMPVENDA=''' + IntToStr(intCPosVenda) + ''','
        + 'ABREFORMNP='''  + IntToStr(intAbrirNP.AbreNotaP) + ''','
        + 'SATGERAL=''' + IntToStr(intSatGeral) + ''','
        + 'INT_NUVEM=''' + IntToStr(intNuvem) + ''','
        + 'ESTOQUEMINIMO=''' + EstoqueM + ''' WHERE IDCONFIG=''' + IntToStr(IDConfig) + '''');
        ibConfig.ExecSQL;
        Commit(ibConfig);

      end else begin

        ibConfig.Close;
        ibConfig.SQL.Clear;
        ibConfig.SQL.Add('INSERT INTO TBLCONFIGURACOES '
        + '(ESTOQUEMINIMO,BLOQUEIAVENDAESTOQUE,PRODUTOESTOQUE,FRASERODAPE,CANCELARITEMCX,QTDESALTOS,'
        + 'VLRPORCENTAGEM,TROCOINICIALCX,IMPRIMIRDIRETO,FRASE,ABREFORMNP,'
        + 'DESENHODIVISAO,PEDIDOS,SANGRIA,IMPRESSORAMATRICIAL,IMPRESSORATERMICA,'
        + 'RWORD,REXCEL,SENHACONFIGURACAO,LPT1,LPT2,LPT3,COM1,USB,BEMATECHMFD,DARUMAMFD,'
        + 'SWEEDAMFD,EPSONMFD,ECF,ALIQUOTA,ANALISARETORNO,ESTOQUEITEMCX,IMPRIMIRCUPOM,'
        + 'RECEBERDINHEIRO,CUPOMFISCALF4,CONTROLARPRATELEIRA,NEGATIVARESTOQUE,'
        + 'CAMINHODEREDE,IMPRIMIRVIAREDE,USB2,USB3,USB4,SIMCUPOMORC,LPT1CUPOMORC,USBCUPOMORC,'
        + 'PORCENTAGEMCUSTO,PORCENTAGEMVLRC,TRESCASASDECIMAIS,CXDIALOGOIMPRESSAO,'
        + 'GAVETADARUMA,GAVETABEMATECH,IMPRIMECUPOMPED,ATIVARCALCULOIBPT,SATDARUMA,NCMFIXO,CUPOMSIMPLESCONF,CUPOMPVENDA,SATGERAL,INT_NUVEM,IMPRESSAOPOSVENDA) values '
        + '(''' + EstoqueM + ''','
        + ' ''' + IntToStr(intBloqueiaVendaEstoque) + ''','
        + ' ''' + ProdEstoque + ''','
        + ' ''' + ConfirmaFrase + ''','
        + ' ''' + CancelarItemCx + ''','
        + ' ''' + IntToStr(QtdeSaltos) + ''','
        + ' ''' + VlrPorcentagem + ''','
        + ' ''' + TrocoInicialCx + ''','
        + ' ''' + ImprimirDireto + ''','
        + ' ''' + memo_Frase.Text + ''','
        + ' ''' + IntToStr(intAbrirNP.AbreNotaP) + ''','
        + ' ''' + memoDivisao.Text + ''','
        + ' ''' + Pedidos + ''','
        + ' ''' + Sangria + ''','
        + ' ''' + ImpressoraMatricial + ''','
        + ' ''' + ImpressoraTermica + ''','
        + ' ''' + RWord + ''','
        + ' ''' + RExcel + ''','
        + ' ''' + SenhaConfiguracao + ''','
        + ' ''' + LPT1 + ''','
        + ' ''' + LPT2 + ''','
        + ' ''' + LPT3 + ''','
        + ' ''' + COM1 + ''','
        + ' ''' + USB + ''','
        + ' ''' + BematechMFD + ''','
        + ' ''' + DarumaMFD + ''','
        + ' ''' + SweedaMFD + ''','
        + ' ''' + EpsonMFD + ''','
        + ' ''' + lbl_edtECF.Text + ''','
        + ' ''' + lbl_edtAliquota.Text + ''','
        + ' ''' + lbl_edtAnalisaRetorno.Text + ''','
        + ' ''' + EstoqueItemCX + ''','
        + ' ''' + ConfirmaCupom + ''','
        + ' ''' + ReceberDinheiro + ''','
        + ' ''' + SimCupomF4 + ''','
        + ' ''' + ControlarPrateleira + ''','
        + ' ''' + NegativarEstoque + ''','
        + ' ''' + lbl_edtNomeCaminhoRede.Text + ''','
        + ' ''' + ImprimirViaRede + ''','
        + ' ''' + USB2 + ''','
        + ' ''' + USB3 + ''','
        + ' ''' + USB4 + ''','
        + ' ''' + CupomOrc + ''','
        + ' ''' + LPT1CupomOrc + ''','
        + ' ''' + USBCupomOrc + ''','
        + ' ''' + PorcentagemCusto + ''','
        + ' ''' + PorcentagemVlrC + ''','
        + ' ''' + CasasDecimais + ''','
        + ' ''' + CXDialogoImpr + ''','
        + ' ''' + GavDaruma + ''','
        + ' ''' + GavBematech + ''','
        + ' '''  + ImprimeCupomPed + ''','
        + ' ''' + IntToStr(AtivarCalcIBPT) + ''','
        + ' ''' + IntToStr(SATDaruma) + ''','
        + ' ''' + lbl_edtNCM.Text + ''','
        + ' ''' + IntToStr(intCupomSimples) + ''','
        + ' ''' + IntToStr(intCPosVenda) + ''','
        + ' ''' + IntToStr(intSatGeral) + ''','
        + ' ''' + IntToStr(intNuvem) + ''','
        + ' ''' + ImpressaoPosVenda + ''')');
        ibConfig.ExecSQL;
        Commit(ibConfig);

      end;//if RECORDCOUNT

      finally

        intAbrirNP.Free;

      end;

    end;//if confirmagravação

  //  LimparBotoes;

  end;//with

end;

procedure TfrmConfiguracoes.ckSimEstoqueCheck(Sender: TObject);
begin

  if ckSimEstoque.Checked Then begin

    ckNaoEstoque.Checked := False;

  end;//if

end;

procedure TfrmConfiguracoes.ckNaoEstoqueCheck(Sender: TObject);
begin

  if ckNaoEstoque.Checked Then begin

    ckSimEstoque.Checked := False;

  end;//if

end;

procedure TfrmConfiguracoes.ckSimCupomCheck(Sender: TObject);
begin

  if ckSimCupom.Checked Then begin

    ckNaoCupom.Checked := False;

  end;//if

end;

procedure TfrmConfiguracoes.ckNaoCupomCheck(Sender: TObject);
begin

  if ckNaoCupom.Checked Then begin

    ckSimCupom.Checked := False;

  end;//if

end;

procedure TfrmConfiguracoes.ckSimPrateleiraClick(Sender: TObject);
begin

  if ckSimPrateleira.Checked then

    ckNaoPrateleira.Checked := false;

end;

procedure TfrmConfiguracoes.ckSimProdEstoqueCheck(Sender: TObject);
begin

  if ckSimProdEstoque.Checked Then begin

    ckNaoProdEstoque.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckNaoPrateleiraClick(Sender: TObject);
begin

  if ckNaoPrateleira.Checked then

    ckSimPrateleira.Checked := false;

end;

procedure TfrmConfiguracoes.ckNaoProdEstoqueCheck(Sender: TObject);
begin

  if ckNaoProdEstoque.Checked Then begin

    ckSimProdEstoque.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimFraseCheck(Sender: TObject);
begin

  if ckSimFrase.Checked Then begin

    ckNaoFrase.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckNaoFraseCheck(Sender: TObject);
begin

  if ckNaoFrase.Checked Then begin

    ckSimFrase.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckCancelarItemSimCheck(Sender: TObject);
begin

  if ckCancelarItemSim.Checked then begin

    ckCancelarItemNao.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckCancelarItemNaoCheck(Sender: TObject);
begin

  if ckCancelarItemNao.Checked then begin

    ckCancelarItemSim.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimTrocoInicialCxCheck(Sender: TObject);
begin

  if ckSimTrocoInicialCx.Checked Then begin

    ckNaoTrocoInicialCx.Checked := False;

  end;//if

end;

procedure TfrmConfiguracoes.ckNaoTrocoInicialCxCheck(Sender: TObject);
begin

  if ckNaoTrocoInicialCx.Checked Then begin

    ckSimTrocoInicialCx.Checked := False;

  end;//if

end;

procedure TfrmConfiguracoes.ckSimImprimirDiretoCheck(Sender: TObject);
begin

  if ckSimImprimirDireto.Checked Then begin

    ckNaoImprimirDireto.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckNaoImprimirDiretoCheck(Sender: TObject);
begin

  if ckNaoImprimirDireto.Checked Then begin

    ckSimImprimirDireto.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
begin
pcConfiguracoes.ActivePageIndex := 0;

  with dmModule do begin

    ExecSELECT;

  end;//with

end;

procedure TfrmConfiguracoes.ckSimPedSangriaCheck(Sender: TObject);
begin

  if ckSimPedSangria.Checked then begin

    ckNaoPedSangria.Checked := false;

  end;

end;

procedure TfrmConfiguracoes.ckNaoPedSangriaCheck(Sender: TObject);
begin

  if ckNaoPedSangria.Checked then begin

    ckSimPedSangria.Checked := false;

  end;

end;

procedure TfrmConfiguracoes.ckSimImpressoraMatricialCheck(Sender: TObject);
begin

  if ckSimImpressoraMatricial.Checked then begin

    ckNaoImpressoraMatricial.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckNaoImpressoraMatricialCheck(Sender: TObject);
begin

  if ckNaoImpressoraMatricial.Checked then begin

    ckSimImpressoraMatricial.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimImpressoraTermicaCheck(Sender: TObject);
begin

  if ckSimImpressoraTermica.Checked Then begin

    ckNaoImpressoraTermica.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckNaoImpressoraTermicaCheck(Sender: TObject);
begin

  if ckNaoImpressoraTermica.Checked Then begin

    ckSimImpressoraTermica.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimConfigSenhaCheck(Sender: TObject);
begin

  if ckSimConfigSenha.Checked Then begin

    ckNaoConfigSenha.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckNaoConfigSenhaCheck(Sender: TObject);
begin

  if ckNaoConfigSenha.Checked Then begin

    ckSimConfigSenha.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckLpt1Check(Sender: TObject);
begin

  if ckLpt1.Checked Then begin

    ckLpt2.Checked := False;
    ckLpt3.Checked := False;
    ckCom1.Checked := False;
    ckUSB.Checked := False;
    ckUSB2.Checked := False;
    ckUSB3.Checked := False;
    ckUSB4.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckCom1Check(Sender: TObject);
begin

  if ckCom1.Checked Then begin

    ckLpt1.Checked := False;
    ckLpt2.Checked := False;
    ckLpt3.Checked := False;
    ckUSB.Checked := False;
    ckUSB2.Checked := False;
    ckUSB3.Checked := False;
    ckUSB4.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckBematechCheck(Sender: TObject);
begin

  if ckBematech.Checked Then begin

    ckDaruma.Checked := False;
    ckSweeda.Checked := False;
    ckEpson.Checked  := False;
    
  end;

end;

procedure TfrmConfiguracoes.ckDarumaCheck(Sender: TObject);
begin

  if ckDaruma.Checked Then begin

    ckBematech.Checked := False;
    ckSweeda.Checked := False;
    ckEpson.Checked  := False;
    
  end;

end;

procedure TfrmConfiguracoes.ckSweedaCheck(Sender: TObject);
begin

  if ckSweeda.Checked Then begin

    ckBematech.Checked := False;
    ckDaruma.Checked := False;
    ckEpson.Checked  := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimEstoqueItemCheck(Sender: TObject);
begin

  if ckSimEstoqueItem.Checked Then begin

    ckNaoEstoqueItem.Checked := False;

  end;
  
end;

procedure TfrmConfiguracoes.ckNaoEstoqueItemCheck(Sender: TObject);
begin

  if ckNaoEstoqueItem.Checked Then begin

    ckSimEstoqueItem.Checked := False;

  end;
  
end;

procedure TfrmConfiguracoes.ckImpressaoPosVendaSimCheck(Sender: TObject);
begin

  if ckImpressaoPosVendaSim.Checked Then begin

    ckImpressaoPosVendaNao.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckImpressaoPosVendaNaoCheck(Sender: TObject);
begin

  if ckImpressaoPosVendaNao.Checked Then begin

    ckImpressaoPosVendaSim.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimCupomFiscalF4Check(Sender: TObject);
begin

  if ckSimCupomFiscalF4.Checked Then begin

    ckNaoCupomFiscalF4.Checked := False;

  end;//if

end;

procedure TfrmConfiguracoes.ckNaoCupomFiscalF4Check(Sender: TObject);
begin

  if ckNaoCupomFiscalF4.Checked Then begin

    ckSimCupomFiscalF4.Checked := False;

  end;//if

end;

procedure TfrmConfiguracoes.ckLpt2Check(Sender: TObject);
begin

  if ckLpt2.Checked Then begin

    ckCom1.Checked := False;
    ckLpt1.Checked := False;
    ckLpt3.Checked := False;
    ckCom1.Checked := False;
    ckUSB.Checked  := False;
    ckUSB2.Checked := False;
    ckUSB3.Checked := False;
    ckUSB4.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckLpt3Check(Sender: TObject);
begin

  if ckLpt3.Checked Then begin

    ckCom1.Checked := False;
    ckLpt1.Checked := False;
    ckCom1.Checked := False;
    ckUSB.Checked  := False;
    ckUSB2.Checked := False;
    ckUSB3.Checked := False;
    ckUSB4.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimNegativarEstoqueCheck(Sender: TObject);
begin

  if ckSimNegativarEstoque.Checked Then begin

    ckNaoNegativarEstoque.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckNaoNegativarEstoqueCheck(Sender: TObject);
begin

  if ckNaoNegativarEstoque.Checked Then begin

    ckSimNegativarEstoque.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimPosVendaViaRedeCheck(Sender: TObject);
begin

  if ckSimPosVendaViaRede.Checked Then begin

    ckNaoPosVendaViaRede.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckNaoPosVendaViaRedeCheck(Sender: TObject);
begin

  if ckNaoPosVendaViaRede.Checked Then begin

    ckSimPosVendaViaRede.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckUSBCheck(Sender: TObject);
begin

  if ckUSB.Checked Then begin

    ckCom1.Checked := False;
    ckLpt1.Checked := False;
    ckLpt2.Checked := False;
    ckLpt3.Checked := False;
    ckUSB2.Checked := False;
    ckUSB3.Checked := False;
    ckUSB4.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckUSB2Check(Sender: TObject);
begin

  if ckUSB2.Checked Then begin

    ckCom1.Checked := False;
    ckLpt1.Checked := False;
    ckLpt2.Checked := False;
    ckLpt3.Checked := False;
    ckUSB.Checked := False;
    ckUSB3.Checked := False;
    ckUSB4.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckUSB3Check(Sender: TObject);
begin

  if ckUSB3.Checked Then begin

    ckCom1.Checked := False;
    ckLpt1.Checked := False;
    ckLpt2.Checked := False;
    ckLpt3.Checked := False;
    ckUSB.Checked := False;
    ckUSB2.Checked := False;
    ckUSB4.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckUSB4Check(Sender: TObject);
begin

  if ckUSB4.Checked Then begin

    ckCom1.Checked := False;
    ckLpt1.Checked := False;
    ckLpt2.Checked := False;
    ckLpt3.Checked := False;
    ckUSB.Checked := False;
    ckUSB2.Checked := False;
    ckUSB3.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.sbGravarNuvemClick(Sender: TObject);

var
//VARIÁVEIS PARA SISTEMA NUVEM
strEmail, strPassword, strNode, strKey, strDomain, strToken : String;
IDConfig : Integer;

begin

  with dmModule do begin

    Commit(ibConfig);
    ibConfig.Close;
    ibConfig.SQL.Clear;
    ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
    ibConfig.Open;

    IDConfig := ibConfig.FieldByName('IDCONFIG').AsInteger;
    strEmail := edtEmail.Text;//ibConfig.FieldByName('STR_EMAILNUVEM').AsString;
    strPassword := edtPassword.Text;//ibConfig.FieldByName('STR_PASSWORDNUVEM').AsString;
    strNode := edtNode.Text;//ibConfig.FieldByName('STR_NODENUVEM').AsString;
    strKey := edtKey.Text;//ibConfig.FieldByName('STR_KEYNUVEM').AsString;
    strDomain := edtDomain.Text;//ibConfig.FieldByName('STR_DOMAINNUVEM').AsString;
    strToken := edtToken.Text;//ibConfig.FieldByName('STR_TOKENNUVEM').AsString;

      if ibConfig.RecordCount > 0 Then begin

          ibConfig.Close;
          ibConfig.SQL.Clear;
          ibConfig.SQL.Add('UPDATE TBLCONFIGURACOES SET '
          + 'STR_EMAILNUVEM=''' + strEmail + ''','
          + 'STR_PASSWORDNUVEM=''' + strPassword + ''','
          + 'STR_NODENUVEM=''' + strNode + ''','
          + 'STR_KEYNUVEM=''' + strKey + ''','
          + 'STR_DOMAINNUVEM=''' + strDomain + ''','
          + 'STR_TOKENNUVEM=''' + strToken + ''' WHERE IDCONFIG=''' + IntToStr(IDConfig) + '''');
          ibConfig.ExecSQL;
          Commit(ibConfig);

      end else begin

        ibConfig.Close;
        ibConfig.SQL.Clear;
        ibConfig.SQL.Add('INSERT INTO TBLCONFIGURACOES '
        + '(STR_EMAILNUVEM,STR_PASSWORDNUVEM,STR_NODENUVEM,STR_KEYNUVEM,'
        + 'STR_DOMAINNUVEM,STR_TOKENNUVEM) values '
        + '(''' + strEmail + ''','
        + ' ''' + strPassword + ''','
        + ' ''' + strNode + ''','
        + ' ''' + strKey + ''','
        + ' ''' + strDomain + ''','
        + ' ''' + strToken +''')');
        ibConfig.ExecSQL;
        Commit(ibConfig);

      end;//if RECORDCOUNT


  end;

end;

procedure TfrmConfiguracoes.sbInfCaixaClick(Sender: TObject);
begin


pcConfiguracoes.ActivePage := pcConfiguracoes.Pages[1];

end;

procedure TfrmConfiguracoes.sbInfGeralClick(Sender: TObject);
begin
pcConfiguracoes.ActivePage := pcConfiguracoes.Pages[0];
end;

procedure TfrmConfiguracoes.sbInfCuponsClick(Sender: TObject);
begin
pcConfiguracoes.ActivePage := pcConfiguracoes.Pages[2];
end;

procedure TfrmConfiguracoes.SpeedButton1Click(Sender: TObject);
begin
pcConfiguracoes.ActivePage := pcConfiguracoes.Pages[3];
end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
///OcultarSheets(pcConfiguracoes);
end;

procedure TfrmConfiguracoes.ckEpsonCheck(Sender: TObject);
begin

  if ckEpson.Checked Then begin

    ckEpson.Checked  := True;
    ckBematech.Checked := False;
    ckDaruma.Checked := False;
    ckSweeda.Checked := False;

  end;

end;

procedure TfrmConfiguracoes.ckSimCalcIBPTCheck(Sender: TObject);
begin
ckNaoCalcIBPT.Checked := False;
end;

procedure TfrmConfiguracoes.ckNaoCalcIBPTCheck(Sender: TObject);
begin
ckSimCalcIBPT.Checked := False;
end;

procedure TfrmConfiguracoes.ckSimNPCheck(Sender: TObject);
begin
ckNaoNP.Checked := False;
end;

procedure TfrmConfiguracoes.ckSimNuvemClick(Sender: TObject);
begin

  if ckSimNuvem.Checked then

    ckNaoNuvem.Checked := false;

end;

procedure TfrmConfiguracoes.ckNaoNPCheck(Sender: TObject);
begin
ckSimNP.Checked := False;
end;

procedure TfrmConfiguracoes.ckNaoNuvemClick(Sender: TObject);
begin

  if ckNaoNuvem.Checked then

    ckSimNuvem.Checked := false;

end;

procedure TfrmConfiguracoes.ckSimSatGeralCheck(Sender: TObject);
begin
ckNaoSatGeral.Checked := False;
end;

procedure TfrmConfiguracoes.ckNaoSatGeralCheck(Sender: TObject);
begin
ckSimSatGeral.Checked := False;
end;

end.
