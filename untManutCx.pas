unit untManutCx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, StrUtils, Printers,
  ComCtrls, DB, IBQuery, Buttons, ACBrBase, ACBrValidador, classComboBox;

type
  TfrmManutCx = class(TForm)
    imgBarraSist: TImage;
    lbl_Cupom: TLabel;
    lbl_DTInicio: TLabel;
    lbl_DtFinal: TLabel;
    lbl_edtProduto: TLabeledEdit;
    lbl_edtQtde: TLabeledEdit;
    lbl_edtVlrUnit: TLabeledEdit;
    lbl_edtVlrTotal: TLabeledEdit;
    dbgDetalheProd: TDBGrid;
    lbl_edtTotalCaixa: TLabeledEdit;
    lbl_edtNumCupom: TLabeledEdit;
    ibeaAlterar: TSpeedButton;
    ibeaExcluir: TSpeedButton;
    ibeaSair: TSpeedButton;
    ibeaImprimirCupom: TSpeedButton;
    dtpDataIni: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    ACBrValidador1: TACBrValidador;
    Label1: TLabel;
    cboTipoPagto: TComboBox;
    lbl_edtNumeroCupomSat: TLabeledEdit;
    lbl_edtValor: TLabeledEdit;
    lbl_edtNomeCli: TLabeledEdit;
    lbl_edtCPFCli: TLabeledEdit;
    lbl_edtCNPJCli: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    ckOrc: TCheckBox;
    sbOrc: TSpeedButton;
    lbl_edtTotalDesc: TLabeledEdit;
    lbl_edtTotalLiquido: TLabeledEdit;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure LimpaCampos;
    procedure ExecSELECTTipoPagto;
    procedure Tratar_RetornoSAT(iRetorno:integer);
    procedure ibeaSairClick(Sender: TObject);
    procedure dtpDataFinalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgDetalheProdCellClick(Column: TColumn);
    procedure ibeaAlterarClick(Sender: TObject);
    procedure lbl_edtQtdeExit(Sender: TObject);
    procedure ibeaExcluirClick(Sender: TObject);
    procedure ibeaImprimirCupomClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lbl_edtCPFCliExit(Sender: TObject);
    procedure lbl_edtCNPJCliExit(Sender: TObject);
    procedure cboTipoPagtoEnter(Sender: TObject);
    procedure lbl_edtNumeroCupomSatEnter(Sender: TObject);
    procedure lbl_edtValorEnter(Sender: TObject);
    procedure lbl_edtNomeCliEnter(Sender: TObject);
    procedure lbl_edtCPFCliEnter(Sender: TObject);
    procedure lbl_edtCNPJCliEnter(Sender: TObject);
    procedure cboTipoPagtoExit(Sender: TObject);
    procedure lbl_edtNumeroCupomSatExit(Sender: TObject);
    procedure lbl_edtValorExit(Sender: TObject);
    procedure lbl_edtNomeCliExit(Sender: TObject);
    procedure sbOrcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutCx: TfrmManutCx;
  ValorGeralCX : Real;
  ValorB : Real;
  ValorC : Real;
  ValorTotalCX : String;
  ValorGeral : Real;
  TotalBC : Real;
  MontaCol : Boolean;
  TotalB : String;
  TotalC : String;
  IDServs,IDProdutoPedido : Integer;
  ConfirmaMSG : Integer;
  QtdeAlterada : String;
  VlrTotalAlteradoA : String;
  VlrTotalAlteradoB : String;
  VlrTotalAlteradoC : String;
  TipoPreco : String;
  IDServsVenda : Integer;
  IDProdutoMCX : Integer;

implementation

uses untdmModule, funcPosto, untServicos;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///SAT

	//Geral
  function eDefinirProduto_Daruma(szProduto: String): Integer; StdCall; External 'DarumaFrameWork.dll';
  function regAlterarValor_Daruma(pszPathChave:String; pszValor:String):Integer; StdCall; External 'DarumaFrameWork.dll';
  function eVerificarVersaoDLL_Daruma(pszRet:String):Integer; StdCall; External 'DarumaFrameWork.dll';
  //DUAL - Mini-Impressoras
  function eBuscarPortaVelocidade_DUAL_DarumaFramework(): Integer; StdCall; External 'DarumaFrameWork.dll';
  function iImprimirTexto_DUAL_DarumaFramework(pszString: String; iTam: Integer): Integer; StdCall; External 'DarumaFrameWork.dll';
  
  // SAT - XML
  function regAlterarValor_SAT_Daruma(pszTagSAT:String; pszValorTagSAT:String):Integer; StdCall; External 'DarumaFramework.dll';
  function regRetornarValor_SAT_Daruma(pszTagSAT:String; pszValorTagSAT:String):Integer; StdCall; External 'DarumaFramework.dll';
   
  // SAT - Cupom Fiscal Parametrizado
    //abertura
    function aCFAbrir_SAT_Daruma(pszCPF: String; pszNome: String; pszEndereceo: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    //item
    function aCFVender_SAT_Daruma(pszCargaTributaria: String; pszQuantidade: String; pszPrecoUnitario: String; pszTipoDescAcres: String; pszValorDescAcres: String; pszCodigoItem: String; pszUnidadeMedida: String; pszDescricao: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    function aCFeCancelarItem_SAT_Daruma(iNumItem: Integer): Integer; StdCall; External 'DarumaFrameWork.dll';
    //totalizar
    function aCFTotalizar_SAT_Daruma(pszTipoDescAcres: String; pszValorDescAcresc: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    //pagamento
    function aCFEfetuarPagamento_SAT_Daruma (pszFormaPgto: String; pszValor:String; pszCodCred: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    function aCFeCancelarFormaPagamento_SAT_Daruma(iIndiceMP: Integer): Integer; StdCall; External 'DarumaFrameWork.dll';
    function aCFEstornarPagamento_SAT_Daruma(pszFormaPgtoEstornado: String; pszFormaPgtoEfetivado:String; pszValor: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    //encerrar
    function tCFEncerrar_SAT_Daruma(pszCupomAdicional: String; pszInfoAdicional: String): Integer; StdCall; External 'DarumaFrameWork.dll';

  // SAT - Cupom Fiscal montando xml
    //abertura
    function aCFeAbrir_SAT_Daruma(pszTagsParamAbertura: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    //item
    function aCFeVender_SAT_Daruma(pszTagsParamVenda: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    //totalizar
    function aCFeTotalizar_SAT_Daruma(pszTagsParamTotalizacao: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    //pagamento
    function aCFeEfetuarPagamento_SAT_Daruma(pszTagsParamPagamento: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    function aCFeEstornarPagamento_SAT_Daruma(pszTagsEstorno: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    //encerrar
    function tCFeEncerrar_SAT_Daruma(pszTagsParamEncerramento: String): Integer; StdCall; External 'DarumaFrameWork.dll';
    // envio
    function tCFeEnviar_SAT_Daruma(pszTagsCFe: String): Integer; StdCall; External 'DarumaFrameWork.dll';

  //SAT - Cancela CF
  function tCFeCancelar_SAT_Daruma(): Integer; StdCall; External 'DarumaFrameWork.dll';
  function tCFeCancelarParametrizado_SAT_Daruma(pszCpfCnpj: String; pszChaveAcesso:String): Integer; StdCall; External 'DarumaFrameWork.dll';

  //SAT - Reimpress�o e Impress�o
  function iReimprimirUltimoCFe_SAT_Daruma() : Integer; StdCall; External 'DarumaFrameWork.dll';
  function iImprimirCFe_SAT_Daruma(szPathXmlSAT: String; pszTipo: String): Integer; StdCall; External 'DarumaFrameWork.dll';

  // SAT - Configura��o SAT
  function tCFeAssociarAssinatura_SAT_Daruma(pszTagsAssinatura: String): Integer; StdCall; External 'DarumaFrameWork.dll';
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$R *.dfm}

procedure TfrmManutCX.Tratar_RetornoSAT(iRetorno:integer);
var
  Str_Msg: String;
begin
   Str_Msg:=StringOFChar(#0,300);

   if (iRetorno=1) then
   begin
     Str_Msg := 'Comando executado com sucesso!';
   end
   else
   begin
      case iRetorno of
         0: Str_Msg:= '[0] - M�todo n�o executado/ Tag inv�lida/ N�o foi poss�vel comunicar com impressora';
         //retorno 0, depende do m�todo que foi chamado tem significado diferente.
        -6: Str_Msg:= '[-6] - TimeOut, erro de comunica��o com o SAT';
        -7: Str_Msg:= '[-7] - Erro ao abrir comunica��o com o SAT';
        -40: Str_Msg:= '[-40] - Tag XML inv�lida';
        -50: Str_Msg:= '[-50] - Impressora off-Line';
        -51: Str_Msg:= '[-51] - Impressora sem papel';
        -99: Str_Msg:= '[-99] - Par�metro inv�lido ou ponteiro nulo de par�metro';
        -120: Str_Msg:= '[-120] - Encontrada tag inv�lida';
        -121: Str_Msg:= '[-121] - Estrutura Invalida';
        -122: Str_Msg:= '[-122] - Tag obrigat�ria n�o foi informada';
        -123: Str_Msg:= '[-123] - Tag obrigat�ria n�o tem valor preenchido';
        -130: Str_Msg:= '[-130] - CFe j� aberto';
        -131: Str_Msg:= '[-131] - CFe n�o aberto';
        -132: Str_Msg:= '[-132] - CFe n�o em fase de venda';
        -133: Str_Msg:= '[-133] - CFe n�o em fase de totaliza��o';
        -134: Str_Msg:= '[-134] - CFe n�o em fase de pagamento';
        -135: Str_Msg:= '[-135] - CFe n�o em fase de encerramento';
        -136: Str_Msg:= '[-136] - CFe em estado inv�lido para opera��o';
        -140: Str_Msg:= '[-140] - Biblioteca auxiliar SAT.dll n�o foi encontrada/carregada';
        -141: Str_Msg:= '[-141] - Impressora inv�lida (modelo deve ser DR700 ou vers�o incompativel)';
        -142: Str_Msg:= '[-142] - Resposta Incompleta do SAT';
        /// Os c�digos de erro abaixo s�o retornados pelo SAT  para verificar mais retornos consulte a Especifica��o de Requisitos do SAT vigente.
        1084: Str_Msg:= '[1084] - Formato do Certificado Inv�lido';
        1085: Str_Msg:= '[1085] - Assinatura do Aplicativo Comercial n�o confere';
        1218: Str_Msg:= '[1218] - CF-e-SAT J� est� cancelado';
        1412: Str_Msg:= '[1412] - CFe de cancelamento n�o corresponde a um CFe emitido nos 30 minutos anteriores ao pedido de cancelamento';
        1999: Str_Msg:= '[1999] - Erro desconhecido';
        6001: Str_Msg:= '[6001] - C�digo de ativa��o inv�lido';
        6002: Str_Msg:= '[6002] - SAT ainda n�o ativado';
        6003: Str_Msg:= '[6003] - SAT n�o vinculado ao AC';
        6004: Str_Msg:= '[6004] - Vincula��o do AC n�o confere';
        6005: Str_Msg:= '[6005] - Tamanho do CFe superior a 1500KB';
        6006: Str_Msg:= '[6006] - SAT bloqueado pelo contribuinte';
        6007: Str_Msg:= '[6007] - SAT bloqueado pela SEFAZ';
        6008: Str_Msg:= '[6008] - SAT bloqueado por falta de comunica��o';
        6009: Str_Msg:= '[6009] - SAT bloqueado, c�digo de ativa��o incorreto';
        6010: Str_Msg:= '[6010] - Erro de valida��o do conte�do';
        6098: Str_Msg:= '[6098] - SAT em processamento. Tente novamente';
        6099: Str_Msg:= '[6099] - Erro desconhecido';
        7001: Str_Msg:= '[7001] - C�digo de ativa��o inv�lido';
        7002: Str_Msg:= '[7002] - Cupom Inv�lido';
        7003: Str_Msg:= '[7003] - SAT bloqueado pelo contribuinte';
        7004: Str_Msg:= '[7004] - SAT bloqueado pela SEFAZ';
        7005: Str_Msg:= '[7005] - SAT bloqueado por falta de comunica��o';
        7006: Str_Msg:= '[7006] - SAT bloqueado, c�digo de ativa��o incorreto';
        7007: Str_Msg:= '[7007] - Erro de valida��o do conte�do';
        7098: Str_Msg:= '[7098] - SAT em processamento. Tente novamente';
        7099: Str_Msg:= '[7099] - Erro desconhecido';
        8098: Str_Msg:= '[8098] - SAT em processamento. Tente novamente';
        8099: Str_Msg:= '[8099] - Erro desconhecido';
        10001: Str_Msg:= '[10001] - C�digo de ativa��o inv�lido';
        10098: Str_Msg:= '[10098] - SAT em processamento. Tente novamente';
        10099: Str_Msg:= '[10099] - Erro desconhecido';
        13001: Str_Msg:= '[13001] - C�digo de ativa��o inv�lido';
        13002: Str_Msg:= '[13002] - Erro de comunica��o com a SEFAZ';
        13003: Str_Msg:= '[13003] - Assinatura fora do padr�o informado';
        13098: Str_Msg:= '[13098] - SAT em processamento. Tente novamente';
        13099: Str_Msg:= '[13099] - Erro desconhecido';

        else
          Str_Msg:= '['+ IntToStr(iRetorno)+'] - N�mero de Erro n�o identificado... Consulte a Especifica��o de Requisitos SAT vigente.';
      end;
 end;
 Application.MessageBox(pchar(Str_Msg), 'Daruma DLL Framework', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmManutCX.Commit(IBQueryExec : TIBQuery);

begin

  with dmModule do begin

    with IBQueryExec do begin

      SQL.Clear;
      SQL.Add('Commit');
      Open;
      Close;

    end;{with query exec}

  end;{with}

end;

procedure TfrmManutCX.LimpaCampos;

begin

  lbl_edtTotalCaixa.Text := '0,00';
  lbl_edtProduto.Text := '';
  lbl_edtQtde.Text := '0';
  lbl_edtVlrUnit.Text := '0,00';
  lbl_edtVlrTotal.Text := '0,00';
  lbl_edtNumCupom.Text := '';

end;

procedure TfrmManutCx.ibeaSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmManutCX.ExecSELECTTipoPagto;

var
IDTipoPagto    : TClasseCombo;

begin

  with dmModule do begin

    Commit(ibConfig);
    ibConfig.Close;
    ibConfig.SQL.Clear;
    ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
    ibConfig.Open;

    if ibConfig.FieldByName('RECEBERDINHEIRO').AsString = 'Nao' Then begin

      ibTipoPagtoF.Close;
      ibTipoPagtoF.SQL.Clear;
      ibTipoPagtoF.SQL.Add('SELECT * FROM TBLTIPOPAGTOAVULSO');
      ibTipoPagtoF.Open;


      cboTipoPagto.Clear;

      while not ibTipoPagtoF.Eof do begin

        IDTipoPagto    := TClasseCombo.Create;
        IDTipoPagto.ID := ibTipoPagtoF.FieldByName('IDTIPO').AsInteger;
        cboTipoPagto.Items.AddObject(ibTipoPagtoF.FieldByName('DESCRICAO').AsString,IDTipoPagto);
        ibTipoPagtoF.Next;

      end;{while}

    end;//if receber dinheiro =nao

    if ibConfig.FieldByName('RECEBERDINHEIRO').AsString = 'Sim' Then begin

      ibTipoPagtoF.Close;
      ibTipoPagtoF.SQL.Clear;
      ibTipoPagtoF.SQL.Add('SELECT * FROM TBLTIPOPAGTOAVULSO');
      ibTipoPagtoF.Open;


      cboTipoPagto.Clear;

      while not ibTipoPagtoF.Eof do begin

        IDTipoPagto    := TClasseCombo.Create;
        IDTipoPagto.ID := ibTipoPagtoF.FieldByName('IDTIPO').AsInteger;
        cboTipoPagto.Items.AddObject(ibTipoPagtoF.FieldByName('DESCRICAO').AsString,IDTipoPagto);
        cboTipoPagto.ItemIndex := 0;
        ibTipoPagtoF.Next;

      end;{while}

    end;//if receber dinheiro =sim

  end;{with}

end;

procedure TfrmManutCx.dtpDataFinalChange(Sender: TObject);

var

ValorCx, VlrDesconto, VlrLiquido    : Real;
ValorTroco : Real;
ValorVenda : Real;
ValorSangria,VlrSubTotal : Real;
GeralCx, TotalDesconto :  String;
GeralTroco : String;
GeralVenda : String;
GeralSangria, TipoSaida : String;

begin

  with dmModule do begin

    ValorGeralCX := 0;
    ValorB := 0;
    ValorC := 0;
   {   Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.IDAGCOMPR,TBLTIPOCOMPROMISSO.NOME As Compromisso,'
      + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,'
      + 'TBLSERVICOSVENDAS.IDSERVS,CADPRODUTOS.NOME As Produto,TBLRECEBEVENDAS.VLRPAGO,'
      + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
      ibServsVenda.Open;  }


     { Commit(ibTempVendaLoja);
      ibTempVendaLoja.Close;
      ibTempVendaLoja.SQL.Clear;
      ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,'
      + 'TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.OBS,'
      + 'TBLSERVICOSVENDAS.IDSERVS,TBLRECEBEVENDAS.VLRPAGO,'
      + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
      + 'INNER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
     // + 'LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADDOCUMENTACAO.IDCAD '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
    //  + 'WHERE TBLSERVICOSVENDAS.CONDICOESPAGTOSERV=''' + TipoPendente + '''');// and TBLSERVICOSVENDAS.NUMEROCUPOM=''' + lbl_edtNumCupom.Text + '''');//(TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
      ibTempVendaLoja.Open;  }

     { Commit(ibTempVendaLoja);
      ibTempVendaLoja.Close;
      ibTempVendaLoja.SQL.Clear;
      ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,TBLSERVICOSVENDAS.POSVENDA,TBLSERVICOSVENDAS.IDTIPOPAGTO,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.PENDENTEPAGO,'
      + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.VLRTROCA,TBLSERVICOSVENDAS.NOMEVENDA,'
      + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.TOTALVLRPROD,TBLSERVICOSVENDAS.VLRSANGRIA,'
      + 'TBLSERVICOSVENDAS.NOMEPROD,TBLTIPOPAGTOAVULSO.TIPOPAGTO,CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
     // + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
      + 'INNER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
      + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.POSVENDA=''Pago'')ORDER BY IDSERVSVENDA ASC');
      ibTempVendaLoja.Open; }

      if ckOrc.Checked Then begin

        Commit(ibTempVendaLoja);
        ibTempVendaLoja.Close;
        ibTempVendaLoja.SQL.Clear;
        ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDORCAMENTO,TBLSERVICOSVENDAS.ESTOQUE,TBLSERVICOSVENDAS.POSVENDA,TBLSERVICOSVENDAS.IDTIPOPAGTO,TBLSERVICOSVENDAS.IDVENDAORC,'
        + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.PENDENTEPAGO,'
        + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.VLRTROCA,TBLSERVICOSVENDAS.NOMEVENDA,'
        + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.TOTALVLRPROD,TBLSERVICOSVENDAS.VLRSANGRIA,'
        + 'TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.IDSERVS,CADPRODUTOS.NOME As Produto, '
        + 'TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.IDVENDA FROM TBLSERVICOSVENDAS '
       // + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
       // + 'INNER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
        + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA '
        + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.IDVENDAORC=''0'' )ORDER BY TBLSERVICOSVENDAS.IDORCAMENTO ASC');
        ibTempVendaLoja.Open;                                                                                                 // OR TBLSERVICOSVENDAS.IDVENDAORC IS NULL

        ibTempVendaLoja.Close;
        ibTempVendaLoja.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
        ibTempVendaLoja.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
        ibTempVendaLoja.Open;

       (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VLRSANGRIA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis');
       (ibTempVendaLoja.FieldByName('VLRDESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

     end;//if ckorc checked

      if ckOrc.Checked = False then begin

        Commit(ibTempVendaLoja);
        ibTempVendaLoja.Close;
        ibTempVendaLoja.SQL.Clear;
        ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.IDORCAMENTO,TBLSERVICOSVENDAS.ESTOQUE,TBLSERVICOSVENDAS.POSVENDA,TBLSERVICOSVENDAS.IDTIPOPAGTO,'
        + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,TBLSERVICOSVENDAS.PENDENTEPAGO,TBLSERVICOSVENDAS.IDVENDAORC,'
        + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,TBLSERVICOSVENDAS.VLRTROCA,TBLSERVICOSVENDAS.NOMEVENDA,'
        + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.VALORD,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLSERVICOSVENDAS.TOTALVLRPROD,TBLSERVICOSVENDAS.VLRSANGRIA,'
        + 'TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.IDSERVS,TBLTIPOPAGTOAVULSO.TIPOPAGTO,CADPRODUTOS.NOME As Produto, '
        + 'TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.IDVENDA FROM TBLSERVICOSVENDAS '
        + 'LEFT OUTER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
        + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVSVENDA=TBLRECEBEVENDAS.IDVENDA '
        + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)and(TBLSERVICOSVENDAS.IDVENDAORC=''1'' )ORDER BY IDSERVSVENDA ASC');
        ibTempVendaLoja.Open;

        ibTempVendaLoja.Close;
        ibTempVendaLoja.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
        ibTempVendaLoja.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
        ibTempVendaLoja.Open;

       (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('VLRSANGRIA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       (ibTempVendaLoja.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis');
       (ibTempVendaLoja.FieldByName('VLRDESCONTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
       
     end;//if ckorc checked

    while not ibTempVendaLoja.Eof do begin//enquanto nao for fim de registro

          if (ValorGeralCX = 0) and (ValorB = 0) and (ValorC = 0) Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeralCX := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            ValorB := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            ValorC := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotalCX := StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

            TotalB := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

            TotalC := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);


            //atribui a variavel o valor separando por ponto
            ValorGeralCX := ValorGeralCX + StrtoFloat(StringReplace(ValorTotalCX,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            ValorB := ValorB + StrToFloat(StringReplace(TotalB,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

            ValorC := ValorC + StrToFloat(StringReplace(TotalC,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

           end;{if}

           TotalBC := ValorB + ValorC;

            if (TotalBC = 0)  Then begin


              ValorGeral :=  ValorGeralCX;

            end else begin

              ValorGeral := TotalBC + ValorGeralCX;

            end;

           { if VlrDesconto = 0 Then begin

             VlrDesconto := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRDESCONTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

            end else begin

             TotalDesconto := StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRDESCONTO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

             VlrDesconto := VlrDesconto + StrtoFloat(StringReplace(TotalDesconto,ThousandSeparator,'',[rfReplaceAll]));

            end;//if vlrconsig  }


          ibTempVendaLoja.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}

////////////////////////////////////////////////////////////////////////////////

        Commit(ibRecVendas);
        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('SELECT TBLRECEBEVENDAS.IDVENDA,TBLRECEBEVENDAS.IDTIPOPAGTO,TBLRECEBEVENDAS.TOTALVENDA,TBLRECEBEVENDAS.DATA,'
        + 'TBLRECEBEVENDAS.VLRDESCONTO,TBLRECEBEVENDAS.VLRACRESCIMO FROM TBLRECEBEVENDAS '
        +'WHERE(TBLRECEBEVENDAS.DATA between :ParamDataInicial and :ParamDataFinal)');
        ibRecVendas.Open;

        ibRecVendas.Close;
        ibRecVendas.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
        ibRecVendas.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
        ibRecVendas.Open;

        while not ibRecVendas.Eof do begin

          if VlrDesconto = 0 Then begin

           VlrDesconto := StrtoFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRDESCONTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end else begin

           TotalDesconto := StringReplace(FloattoStr(ibRecVendas.FieldByName('VLRDESCONTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

           VlrDesconto := VlrDesconto + StrtoFloat(StringReplace(TotalDesconto,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

          end;//if vlrconsig

          ibRecVendas.Next;

        end;// while recebevendas

////////////////////////////////////////////////////////////////////////////////

      // if lbl_edtTotalCaixa.Text = '0,00' Then begin

         lbl_edtTotalCaixa.Text   := FormatFloat(CasasDecimais('Produtos'),ValorGeral);
         lbl_edtTotalDesc.Text    := FormatFloat(CasasDecimais('Produtos'),VlrDesconto);
         lbl_edtTotalLiquido.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeral - VlrDesconto);
     //  end;


/////////////////////////////////////////////////////////////////////////////////

    { lbl_edtTotalCx.Text := FormatFloat(CasasDecimais('Produtos'),ValorCx);
     lbl_edtTotalTroco.Text := FormatFloat(CasasDecimais('Produtos'),ValorTroco);
     lbl_edtSubTotal.Text := FormatFloat(CasasDecimais('Produtos'),ValorVenda);
     lbl_edtSangria.Text := FormatFloat(CasasDecimais('Produtos'),ValorSangria);
     lbl_edtTotalPeriodo.Text := FormatFloat(CasasDecimais('Produtos'),VlrSubTotal);}


  end;{with}

end;

procedure TfrmManutCx.FormShow(Sender: TObject);
begin

  dtpDataIni.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataFinal.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
//  lbl_TipoPreco.Caption := '';
  TipoPreco := '';
  lbl_edtNomeCli.Clear;
  lbl_edtCPFCli.Clear;
  lbl_edtCNPJCli.Clear;
  ckOrc.Checked := False;
  
  ValorGeralCX := 0;
  ValorB := 0;
  ValorC := 0;

  LimpaCampos;
  
  with dmModule do begin

  ibTempVendaLoja.Close;
  ExecSELECTTipoPagto;
  
    //Adiciona as Colunas com os dados do Clientes
    with dbgDetalheProd do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaCol Then begin

         DataSource := dmModule.dtsTempVendaLoja;

        //determina as colunas a serem montadas 0 codigo cliente, 1 razao Social, 2 endere�o numero...
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);
        Columns.Insert(5);
        Columns.Insert(6);
        Columns.Insert(7);
        Columns.Insert(8);
        Columns.Insert(9);
        Columns.Insert(10);
        Columns.Insert(11);
        Columns.Insert(12);
        //Parametros da Coluna que exibe o Nome do cliente.

        Columns.Items[0].Title.Caption := 'N�Cupom ';
        Columns.Items[0].FieldName     := 'IDSERVSVENDA';
        Columns.Items[0].Width         := 50;
        Columns.Items[0].Alignment     := taLeftJustify;


        Columns.Items[1].Title.Caption := 'N�Orc.';
        Columns.Items[1].FieldName     := 'IDORCAMENTO';
        Columns.Items[1].Width         := 50;
        Columns.Items[1].Alignment     := taLeftJustify;


        Columns.Items[2].Title.Caption := 'Produto';
        Columns.Items[2].FieldName     := 'NOMEPROD';
        Columns.Items[2].Width         := 180;
        Columns.Items[2].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do cliente.
        Columns.Items[3].Title.Caption := 'Qtde.';
        Columns.Items[3].FieldName     := 'QTDE';
        Columns.Items[3].Width         := 50;
        Columns.Items[3].Alignment     := taLeftJustify;


       // Parametros que exibe o compl. do cliente
        Columns.Items[4].Title.Caption := 'Vlr.Unit.';
        Columns.Items[4].FieldName     := 'VLRUNIT';
        Columns.Items[4].Width         := 71;
        Columns.Items[4].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[5].Title.Caption := 'Vlr.Desc.';
        Columns.Items[5].FieldName     := 'VLRDESCONTO';
        Columns.Items[5].Width         := 50;
        Columns.Items[5].Alignment     := taLeftJustify;


       // Parametros que exibe o compl. do cliente
        Columns.Items[6].Title.Caption := 'Valor Venda';
        Columns.Items[6].FieldName     := 'VLRTOTAL';
        Columns.Items[6].Width         := 80;
        Columns.Items[6].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[7].Title.Caption := 'Valor B';
        Columns.Items[7].FieldName     := 'VALORB';
        Columns.Items[7].Width         := 80;
        Columns.Items[7].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[8].Title.Caption := 'Valor C';
        Columns.Items[8].FieldName     := 'VALORC';
        Columns.Items[8].Width         := 80;
        Columns.Items[8].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[9].Title.Caption := 'Cod.Cliente';
        Columns.Items[9].FieldName     := 'CODCLI';
        Columns.Items[9].Width         := 70;
        Columns.Items[9].Alignment     := taLeftJustify;


       // Parametros que exibe o compl. do cliente
        Columns.Items[10].Title.Caption := 'DATA';
        Columns.Items[10].FieldName     := 'DATA';
        Columns.Items[10].Width         := 70;
        Columns.Items[10].Alignment     := taLeftJustify;

        Columns.Items[11].Title.Caption := 'Vlr.Sangria';
        Columns.Items[11].FieldName     := 'VLRSANGRIA';
        Columns.Items[11].Width         := 80;
        Columns.Items[11].Alignment     := taLeftJustify;

        Columns.Items[12].Title.Caption := 'Obs.';
        Columns.Items[12].FieldName     := 'OBS';
        Columns.Items[12].Width         := 80;
        Columns.Items[12].Alignment     := taLeftJustify;


        MontaCol := False;

      end; {if}

    end; {with do db grid}
////////////////////////////////////////////////////////////////////////////////


  end;{with}

end;

procedure TfrmManutCx.FormCreate(Sender: TObject);
begin
  MontaCol := True;
end;

procedure TfrmManutCx.dbgDetalheProdCellClick(Column: TColumn);

//var
//IdOrc : Integer;
begin

  with dmModule do begin

    IDServs      := ibTempVendaLoja.FieldByName('IDSERVS').AsInteger;
    //IdOrc        := ibTempVendaLoja.FieldByName('IDSERVS').AsInteger;
    IDProdutoMCX := ibTempVendaLoja.FieldByName('IDPROD').AsInteger;

    if ckOrc.Checked = False Then begin

      IDServsVenda := ibTempVendaLoja.FieldByName('IDSERVSVENDA').AsInteger;
      lbl_edtNumCupom.Text := IntToStr(ibTempVendaLoja.FieldByName('IDORCAMENTO').AsInteger);

    end;

    if ckOrc.Checked Then begin

      //IDServsVenda := ibTempVendaLoja.FieldByName('IDSERVSVENDA').AsInteger;
      lbl_edtNumCupom.Text := IntToStr(ibTempVendaLoja.FieldByName('IDORCAMENTO').AsInteger);

    end;

    if ibTempVendaLoja.RecordCount > 0 Then begin

    lbl_edtProduto.Text     := ibTempVendaLoja.FieldByName('NOMEPROD').AsString;
    lbl_edtQtde.Text := FormatFloat('0',ibTempVendaLoja.FieldByName('QTDE').AsFloat);
    lbl_edtVlrUnit.Text := FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRUNIT').AsFloat);

    if ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat <> 0 Then begin

    lbl_edtVlrTotal.Text := FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat);
  //  lbl_TipoPreco.Caption := 'Pre�o (A)';
    TipoPreco := 'A';

    end else if ibTempVendaLoja.FieldByName('VALORB').AsFloat <> 0 Then begin

    lbl_edtVlrTotal.Text := FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VALORB').AsFloat);
  //  lbl_TipoPreco.Caption := 'Pre�o (B)';
    TipoPreco := 'B';

    end else if ibTempVendaLoja.FieldByName('VALORC').AsFloat <> 0 Then begin

    lbl_edtVlrTotal.Text := FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VALORC').AsFloat);
  //  lbl_TipoPreco.Caption := 'Pre�o (C)';
    TipoPreco := 'C';

    end;

    end;


  end;{with}

end;

procedure TfrmManutCx.ibeaAlterarClick(Sender: TObject);
begin

  with dmModule do begin

  ConfirmaMSG := Application.MessageBox('Confirma Altera��o?','Notifica��o:Altera��o de Registro', + MB_YESNO + MB_ICONQUESTION);

    if ConfirmaMSG = 6 Then begin


      QtdeAlterada := StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
      QtdeAlterada := StringReplace(QtdeAlterada,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
      if QtdeAlterada = '' Then
      QtdeAlterada := '0';


      if TipoPreco = 'A' Then begin

        VlrTotalAlteradoA := StringReplace(lbl_edtVlrTotal.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        VlrTotalAlteradoA := StringReplace(VlrTotalAlteradoA,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

      end else begin

        VlrTotalAlteradoA := '0';

      end;


      if TipoPreco = 'B' Then begin

        VlrTotalAlteradoB := StringReplace(lbl_edtVlrTotal.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        VlrTotalAlteradoB := StringReplace(VlrTotalAlteradoB,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

      end else begin

        VlrTotalAlteradoB := '0';

      end;


      if TipoPreco = 'C' Then begin

        VlrTotalAlteradoC := StringReplace(lbl_edtVlrTotal.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        VlrTotalAlteradoC := StringReplace(VlrTotalAlteradoC,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

      end else begin

        VlrTotalAlteradoC := '0';

      end;

      ibTempVendaLoja.Close;
      ibTempVendaLoja.SQL.Clear;
      ibTempVendaLoja.SQL.Add('UPDATE TBLSERVICOSVENDAS SET '
      + 'QTDE=''' + QtdeAlterada + ''','
      + 'VLRTOTAL=''' + VlrTotalAlteradoA + ''','
      + 'VALORB='''+ VlrTotalAlteradoB + ''','
      + 'VALORC=''' + VlrTotalAlteradoC + ''' WHERE IDSERVS=''' + IntToStr(IDServs) + '''');
      ibTempVendaLoja.ExecSQL;
      Commit(ibTempVendaLoja);


      Commit(ibTempVendaLoja);
      ibTempVendaLoja.Close;
      ibTempVendaLoja.SQL.Clear;
      ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.CONDICOESPAGTOSERV,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.NUMEROCUPOM,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,'
      + 'TBLSERVICOSVENDAS.VLRPARCIAL,TBLSERVICOSVENDAS.TOTALPARCIAL,TBLSERVICOSVENDAS.NOMEPROD,'
      + 'TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSVENDAS.NOMESERVICO,TBLRECEBEVENDAS.VLRPAGO,'
      + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
      + 'WHERE TBLSERVICOSVENDAS.IDSERVSVENDA=''' + IntToStr(IDServsVenda) + ''' and (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
      ibTempVendaLoja.Open;

      ibTempVendaLoja.Close;
      ibTempVendaLoja.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibTempVendaLoja.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
      ibTempVendaLoja.Open;

     (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibTempVendaLoja.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibTempVendaLoja.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibTempVendaLoja.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


    end;{if confirmamsg}
    
  end;{with}

end;

procedure TfrmManutCx.lbl_edtQtdeExit(Sender: TObject);

var

Valor1,Valor2 : Real;

begin

  if (lbl_edtQtde.Text <> '') Then begin// se for em branco executa rotina abaixo.

    if (Pos(',',lbl_edtQtde.Text)>0) and (lbl_edtQtde.Text <> '') Then begin
      
      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnit.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      lbl_edtVlrTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));

    end else begin

      Valor1 := StrToFloat(StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      Valor2 := StrToFloat(StringReplace(lbl_edtVlrUnit.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
      lbl_edtVlrTotal.Text := FormatFloat(',0.00',(Valor2 * Valor1));


    {  if (lbl_edtQuantidade.Text <> '') and (lbl_edtQtdeProd.Text <> '') Then begin// se for diferente de branco executa rotina abaixo.

       Valor1 := StrToFloat(StringReplace(lbl_edtQuantidade.Text,ThousandSeparator,'',[rfReplaceAll]));
       Valor2 := StrToFloat(StringReplace(lbl_edtVlrunit.Text,ThousandSeparator,'',[rfReplaceAll]));
       Valor3 := StrToFloat(StringReplace(lbl_edtQtdeProd.Text,ThousandSeparator,'',[rfReplaceAll]));

       Valor4 := (Valor1 + Valor3);

       lbl_edtQtdeProd.Text := FormatFloat(',0.00',(Valor4));

       lbl_edtTotalEstoque.Text := FormatFloat(',0.00',(Valor4 * Valor2));

      end; }

    end;{if}

  end;{if}

end;

procedure TfrmManutCx.ibeaExcluirClick(Sender: TObject);

var

ValorVendaCx,ValorCancelado, TotalCancelado : Real;
TotaldoCupom : String;
QtdeEstoque, VlrProduto, ValorCustoE : Real;
QtdeVenda : Real;
EstoqueFinal, TotalProdEstoque, TotalCusto : String;

begin

  with dmModule do begin

  ConfirmaMSG := Application.MessageBox('Deseja Excluir?','Notifica��o:Exclus�o de Registro', + MB_YESNO + MB_ICONQUESTION);

    if ConfirmaMSG = 6 Then begin


      if lbl_edtVlrTotal.Text <> '' Then begin

        ibRecVendas.Close;
        ibRecVendas.SQL.Clear;
        ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE IDVENDA=''' + IntToStr(IDServsVenda) + '''');
        ibRecVendas.Open;

        ValorVendaCx := StrtoFloat(StringReplace(FloattoStr(ibRecVendas.FieldByName('TOTALVENDA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        ValorCancelado   := StrToFloat(StringReplace(lbl_edtVlrTotal.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        ValorVendaCx := ValorVendaCx - ValorCancelado;

        TotaldoCupom := StringReplace(FloattoStr(ValorVendaCx),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        TotaldoCupom := StringReplace(TotaldoCupom,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

        if TotaldoCupom > '0' Then begin

          ibRecVendas.Close;
          ibRecVendas.SQL.Clear;
          ibRecVendas.SQL.Add('UPDATE TBLRECEBEVENDAS SET '
          + 'TOTALVENDA = ''' + TotaldoCupom + ''' WHERE IDVENDA=''' + IntToStr(IDServsVenda) + '''');
          ibRecVendas.ExecSQL;
          Commit(ibRecVendas);

        end;//if totalcupom >0

        if TotaldoCupom = '0' Then begin

          ibRecVendas.Close;
          ibRecVendas.SQL.Clear;
          ibRecVendas.SQL.Add('DELETE FROM TBLRECEBEVENDAS WHERE IDVENDA=''' + IntToStr(IDServsVenda) + '''');
          ibRecVendas.Open;

        end;//if totalcupom = 0

      end;//if lbl vlrtotal



      ibTempVendaLoja.Close;
      ibTempVendaLoja.SQL.Clear;
      ibTempVendaLoja.SQL.Add('DELETE FROM TBLSERVICOSVENDAS WHERE IDSERVS=''' + InttoStr(IDServs) + '''');
      ibTempVendaLoja.Open;

      ibRecVendas.Close;
      ibRecVendas.SQL.Clear;
      ibRecVendas.SQL.Add('DELETE FROM TBLRECEBEVENDAS WHERE IDVENDA=''' + InttoStr(IDServsVenda) + '''');
      ibRecVendas.Open;

      ibAReceber.Close;
      ibAReceber.SQL.Clear;
      ibAReceber.SQL.Add('DELETE FROM TBLCONTASARECEBER WHERE IDSERVSVENDA=''' + IntToStr(IDServsVenda) + '''');
      ibAReceber.ExecSQL;
      Commit(ibAReceber);

      Commit(ibTempVendaLoja);
      ibTempVendaLoja.Close;
      ibTempVendaLoja.SQL.Clear;
      ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.*,TBLRECEBEVENDAS.VLRPAGO,'
      + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
      + 'WHERE (TBLSERVICOSVENDAS.DATA between :ParamDataInicial and :ParamDataFinal) ORDER BY TBLSERVICOSVENDAS.IDSERVSVENDA');
      ibTempVendaLoja.Open;

      ibTempVendaLoja.Close;
      ibTempVendaLoja.ParamByName('ParamDataInicial').Value := dtpDataIni.DateTime;
      ibTempVendaLoja.ParamByName('ParamDataFinal').Value := dtpDataFinal.DateTime;
      ibTempVendaLoja.Open;

     (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibTempVendaLoja.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibTempVendaLoja.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
     (ibTempVendaLoja.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO


////////////////////////////////////////////////////////////////////////////////

      if ckOrc.Checked = False Then begin

        ibEntrProdEstoque.Close;
        ibEntrProdEstoque.SQL.Clear;
        ibEntrProdEstoque.SQL.Add('SELECT TBLENTRADAESTOQUEPROD.QUANTIDADE,'
        + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLENTRADAESTOQUEPROD.IDPROD,'
        + 'CADPRODUTOS.VALORVENDAA,CADPRODUTOS.VALORCUSTO,CADPRODUTOS.TIPOPROD FROM TBLENTRADAESTOQUEPROD '
        + 'INNER JOIN CADPRODUTOS ON TBLENTRADAESTOQUEPROD.IDPROD=CADPRODUTOS.IDPROD '
        + 'WHERE TBLENTRADAESTOQUEPROD.IDPROD=''' + IntToStr(IDProdutoMCX) + '''');
        ibEntrProdEstoque.Open;

        //ROTINA ABAIXO PARA SOMAR TOTAL DO ESTQUE E QUANTIDADE DO ESTOQUE

        //traz na variavel a qtde conf. prod da select identificado por id.
        QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
       // QtdeEstoque := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('QUANTIDADE').AsFloat),DecimalSeparator,',',[rfReplaceAll]));

        QtdeVenda   := StrToFloat(StringReplace(lbl_edtQtde.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        QtdeEstoque := QtdeEstoque + QtdeVenda;

        EstoqueFinal := StringReplace(FloattoStr(QtdeEstoque),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        EstoqueFinal := StringReplace(EstoqueFinal,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

        //AQUI VAI O CALCULO DO TOTAL CONFORME VENDE O PRODUTO
        VlrProduto  := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        VlrProduto  := QtdeEstoque * VlrProduto;

        TotalProdEstoque := StringReplace(FloattoStr(VlrProduto),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        TotalProdEstoque := StringReplace(TotalProdEstoque,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);


        ValorCustoE := StrtoFloat(StringReplace(FloattoStr(ibEntrProdEstoque.FieldByName('VALORCUSTO').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

        ValorCustoE := QtdeEstoque * ValorCustoE;

        TotalCusto := StringReplace(FloattoStr(ValorCustoE),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        TotalCusto := StringReplace(TotalCusto,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);

         //se houver registro ele atribui na alteracao o vlr da variavel
         if ibEntrProdEstoque.RecordCount > 0 Then begin

           ibEntrProdEstoque.Close;
           ibEntrProdEstoque.SQL.Clear;
           ibEntrProdEstoque.SQL.Add('UPDATE TBLENTRADAESTOQUEPROD SET '
           +'QUANTIDADE=''' + (EstoqueFinal) + ''','
           +'TOTALCUSTO=''' + TotalCusto + ''','
           +'VLRTOTAL=''' + (TotalProdEstoque) +  ''' WHERE IDPROD=''' + IntToStr(IDProdutoMCX) + '''');
           ibEntrProdEstoque.ExecSQL;
           Commit(ibEntrProdEstoque);

         end;{if}

       end;//if  

////////////////////////////////////////////////////////////////////////////////


    end;{if confirmamsg}

    dtpDataFinalChange(Sender);

  end;{with}

end;

procedure TfrmManutCx.ibeaImprimirCupomClick(Sender: TObject);

var

NumeroCupom, NomeEmpresa,Endereco,Numero, Bairro, Estado, Telefone : String;
NomeProduto,Qtde,Vlr,Total,DataConvertida,Hora, Str_ParametroVenda : String;
VlrPago,Troco,TotalVenda,DesenhoDivisao,QtdedeSaltos, strNomeProdCupom : String;
Frase,FraseRodape, strContadorItem, TotalQtdeItens,QtdeTotalItens : String;
intIDCliente, i, intContadorItem,intImprimirCupomSimples, Int_Retorno : Integer;
F : TextFile;
QtdedeItens : Real;
Produto : Array[0..10] of String;
strNomeCli, strEnderecoCli, strNumeroCli, strBairroCli, strTelefoneCli :String;
strVlrUnitCupom, strQtdeCupom, strVlrTotalCupom, strNomePagto :String;

begin

  with dmModule do begin

   { ibDadosEmpresa.Close;
    ibDadosEmpresa.SQL.Clear;
    ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
    ibDadosEmpresa.Open;

    if ibDadosEmpresa.RecordCount > 0 Then begin

    NomeEmpresa := ibDadosEmpresa.FieldByName('NOME').AsString;
    Endereco    := ibDadosEmpresa.FieldByName('ENDERECO').AsString;
    Numero      := ibDadosEmpresa.FieldByName('NUMERO').AsString;
    Bairro      := ibDadosEmpresa.FieldByName('BAIRRO').AsString;
    Estado      := ibDadosEmpresa.FieldByName('ESTADO').AsString;
    Telefone    := ibDadosEmpresa.FieldByName('TELEFONE').AsString;

    end;  }

    if lbl_edtNumCupom.Text <> '' Then begin

    NumeroCupom := lbl_edtNumCupom.Text;

    end;

         {   intImprimirCupomSimples := Application.MessageBox('Imprimir Cupom Simples Conferencia?','Cupom para Simples Conferencia', +MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1);

            if intImprimirCupomSimples = 6 Then begin

              Commit(ibConfig);
              ibConfig.Close;
              ibConfig.SQL.Clear;
              ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
              ibConfig.Open;

              DesenhoDivisao   := ibConfig.FieldByName('DESENHODIVISAO').AsString;
              QtdedeSaltos := IntToStr(ibConfig.FieldByName('QTDESALTOS').AsInteger);
              FraseRodape  := ibConfig.FieldByName('FRASERODAPE').AsString;
              Frase        := ibConfig.FieldByName('FRASE').AsString;


              Commit(ibTempVendaLoja);
              ibTempVendaLoja.Close;
              ibTempVendaLoja.SQL.Clear;
              ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.NOMEPROD,TBLSERVICOSVENDAS.IDFUNC,'
              + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
              + 'TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.IDSERVS,TBLSERVICOSVENDAS.IDCLIENTE,'
              + 'TBLUSER.IDUSER,TBLUSER.LOGIN,CADPRODUTOS.NOME As Produto,CADPRODUTOS.CODBARRAS FROM TBLSERVICOSVENDAS '
              + 'INNER JOIN TBLUSER ON TBLSERVICOSVENDAS.IDFUNC=TBLUSER.IDUSER '
              + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD WHERE IDSERVSVENDA=''' + (NumeroCupom) + '''');
              ibTempVendaLoja.Open;

              intIDCliente := ibTempVendaLoja.FieldByName('IDCLIENTE').AsInteger;

              DataConvertida := FormatDateTime('DD/MM/YYYY',ibTempVendaLoja.FieldByName('DATA').AsDateTime);
              Hora           := FormatDateTime('hh:mm:ss',ibTempVendaLoja.FieldByName('HORA').AsDateTime);

             (ibTempVendaLoja.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := ',0.00';
             (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';
             (ibTempVendaLoja.FieldByName('VALORB') as TFloatField).DisplayFormat := ',0.00';
             (ibTempVendaLoja.FieldByName('VALORC') as TFloatField).DisplayFormat := ',0.00';
             (ibTempVendaLoja.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis');

              Commit(ibServsVenda);
              ibRecVendas.Close;
              ibRecVendas.SQL.Clear;
              ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE TBLRECEBEVENDAS.IDVENDA=''' + NumeroCupom + '''');
              ibRecVendas.Open;

              TotalVenda     := FormatFloat(CasasDecimais('Produtos'),ibRecVendas.FieldByName('TOTALVENDA').AsFloat);
              VlrPago        := FormatFloat(CasasDecimais('Produtos'),ibRecVendas.FieldByName('VLRPAGO').AsFloat);
              Troco          := FormatFloat(CasasDecimais('Produtos'),ibRecVendas.FieldByName('TROCO').AsFloat);
                AssignPrn(F);
                Rewrite(F);
                i := 0;
                                                                          //.Text+ #27#97#49

                Commit(ibDadosEmpresa);
                ibDadosEmpresa.Close;
                ibDadosEmpresa.SQL.Clear;
                ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
                ibDadosEmpresa.Open;
                            // '<sp>1</sp>'+
                  Writeln(F,(ibDadosEmpresa.FieldByName('NOME').AsString));



                ///  Int_Retorno := Daruma_DUAL_ImprimirTexto(pchar(ibDadosEmpresa.FieldByName('NOME').AsString),0);

                  if ibDadosEmpresa.FieldByName('ENDERECO').AsString <> '' Then begin
                  Writeln(F,(ibDadosEmpresa.FieldByName('ENDERECO').AsString)+','+(ibDadosEmpresa.FieldByName('NUMERO').AsString));
               ///   Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar(ibDadosEmpresa.FieldByName('ENDERECO').AsString)+'    ,'+(ibDadosEmpresa.FieldByName('NUMERO').AsString),0);
                  end;

                  if ibDadosEmpresa.FieldByName('BAIRRO').AsString <> '' Then begin
                  Writeln(F,(ibDadosEmpresa.FieldByName('BAIRRO').AsString));
                ///  Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar(ibDadosEmpresa.FieldByName('BAIRRO').AsString),0);
                  end;

                  if ibDadosEmpresa.FieldByName('TELEFONE').AsString <> '' Then begin
                  Writeln(F,('Fone:'+ibDadosEmpresa.FieldByName('TELEFONE').AsString));
                ///  Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('Fone: '+ibDadosEmpresa.FieldByName('TELEFONE').AsString),0);
                  end;

                Writeln(F,(DesenhoDivisao));

                Commit(ibCadastro);
                ibCadastro.Close;
                ibCadastro.SQL.Clear;
                ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCAD=''' + IntToStr(intIDCliente) + '''');
                ibCadastro.Open;


                if frmVendasLoja.lbl_Func.Caption <> '' Then begin
                Writeln(F,('Funcion�rio: '+ ibTempVendaLoja.FieldByName('LOGIN').AsString));
                end;

                Writeln(F,('Cupom: '+NumeroCupom));
                Writeln(F,('Data:'+DataConvertida+' '+'Hora:'+Hora));
                Writeln(F,('**Cupom nao Fiscal para simples conferencia**'));
                Writeln(F,(DesenhoDivisao));

                if ibCadastro.RecordCount > 0 Then begin

                   Writeln(F,(ibCadastro.FieldByName('NOME').AsString));
                   Writeln(F,('Telefone: '+ ibCadastro.FieldByName('TELEFONE').AsString));
                   Writeln(F,(ibCadastro.FieldByName('ENDERECO').AsString)+(' , '+ibCadastro.FieldByName('NUMERO').AsString));
                   Writeln(F,(ibCadastro.FieldByName('BAIRRO').AsString));
                   Writeln(F,(ibCadastro.FieldByName('CIDADE').AsString)+(ibCadastro.FieldByName('ESTADO').AsString));
                   Writeln(F,(DesenhoDivisao));

                 
                end;


////////////////////////////////////////////////////////////////////////////////
                intContadorItem := 1;
                while not ibTempVendaLoja.Eof do begin

                  if intContadorItem = 1 Then begin

                    strContadorItem := '00'+ IntToStr(intContadorItem);

                  end else begin

                    strContadorItem := '00'+ IntToStr(intContadorItem);

                  end;



                  Writeln(F,(strContadorItem+' '+ibTempVendaLoja.FieldByName('NOMEPROD').AsString)+'...R$ '+(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat)));

                    if QtdedeItens = 0 Then begin

                      QtdedeItens := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('QTDE').AsFloat),ThousandSeparator,'',[rfreplaceAll]));

                    end else begin

                      TotalQtdeItens := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('QTDE').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                      QtdedeItens := QtdedeItens + StrtoFloat(StringReplace(TotalQtdeItens,ThousandSeparator,'',[rfReplaceAll]));

                    end;//if

                    intContadorItem :=  intContadorItem+1;
                                    
                ibTempVendaLoja.Next;

                end;//while
                  QtdeTotalItens := FormatFloat('0',QtdedeItens);

                  Writeln(F,('Qtde.Itens..:'+ QtdeTotalItens));                
  ////////////////////////////////////////////////////////////////////////////////

           // Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<sp>1</sp>'+(frmVendasLoja.listboxCupom.Items).Text+ ''),0);
              Writeln(F,(DesenhoDivisao));
////////////////////////////////////////////////////////////////////////////////

            Writeln(F,('TOTAL DA VENDA: '+TotalVenda));
            Writeln(F,('VLR.PAGO: '+VlrPago));
            Writeln(F,('TROCO: ' +Troco));
            Writeln(F,(DesenhoDivisao));
            //Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar(Frase),0);


                if Frase <> '' Then begin
                Writeln(F,(Frase));
                end;

                CloseFile(F);


           end; }

////////////////////////////////////////////////////////////////////////////////
            intImprimirCupomSimples := Application.MessageBox('Imprimir Cupom Simples Conferencia?','Cupom para Simples Conferencia', +MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1);

            if intImprimirCupomSimples = 6 Then begin

              Commit(ibConfig);
              ibConfig.Close;
              ibConfig.SQL.Clear;
              ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
              ibConfig.Open;

              DesenhoDivisao   := ibConfig.FieldByName('DESENHODIVISAO').AsString;
              QtdedeSaltos := IntToStr(ibConfig.FieldByName('QTDESALTOS').AsInteger);
              FraseRodape  := ibConfig.FieldByName('FRASERODAPE').AsString;
              Frase        := ibConfig.FieldByName('FRASE').AsString;


              Commit(ibTempVendaLoja);
              ibTempVendaLoja.Close;
              ibTempVendaLoja.SQL.Clear;
              ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.*,TBLTIPOPAGTOAVULSO.DESCRICAO,TBLTIPOPAGTOAVULSO.IDTIPO,'
              + 'CADPRODUTOS.NOME As Produto,CADPRODUTOS.CODBARRAS FROM TBLSERVICOSVENDAS '
              + 'INNER JOIN TBLTIPOPAGTOAVULSO ON TBLSERVICOSVENDAS.IDTIPOPAGTO=TBLTIPOPAGTOAVULSO.IDTIPO '
              + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD WHERE IDSERVSVENDA=''' + (NumeroCupom) + '''');
              ibTempVendaLoja.Open;

              DataConvertida := FormatDateTime('DD/MM/YYYY',ibTempVendaLoja.FieldByName('DATA').AsDateTime);
              Hora           := FormatDateTime('hh:mm:ss',ibTempVendaLoja.FieldByName('HORA').AsDateTime);
                            
             (ibTempVendaLoja.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := ',0.00';
             (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';
             (ibTempVendaLoja.FieldByName('VALORB') as TFloatField).DisplayFormat := ',0.00';
             (ibTempVendaLoja.FieldByName('VALORC') as TFloatField).DisplayFormat := ',0.00';
             (ibTempVendaLoja.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Produtos');


              Commit(ibServsVenda);
              ibRecVendas.Close;
              ibRecVendas.SQL.Clear;
              ibRecVendas.SQL.Add('SELECT * FROM TBLRECEBEVENDAS WHERE TBLRECEBEVENDAS.IDVENDA=''' + NumeroCupom + '''');
              ibRecVendas.Open;

              TotalVenda     := FormatFloat(CasasDecimais('Produtos'),ibRecVendas.FieldByName('TOTALVENDA').AsFloat);
              VlrPago        := FormatFloat(CasasDecimais('Produtos'),ibRecVendas.FieldByName('VLRPAGO').AsFloat);
              Troco          := FormatFloat(CasasDecimais('Produtos'),ibRecVendas.FieldByName('TROCO').AsFloat);

                                                                         
                Commit(ibDadosEmpresa);
                ibDadosEmpresa.Close;
                ibDadosEmpresa.SQL.Clear;
                ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
                ibDadosEmpresa.Open;

                
                  strNomeCli     := ibDadosEmpresa.FieldByName('NOME').AsString;
                  strEnderecoCli := ibDadosEmpresa.FieldByName('ENDERECO').AsString;
                  strNumeroCli   := ibDadosEmpresa.FieldByName('NUMERO').AsString;
                  strBairroCli   := ibDadosEmpresa.FieldByName('BAIRRO').AsString;
                  strTelefoneCli := ibDadosEmpresa.FieldByName('TELEFONE').AsString;

                  Str_ParametroVenda := StringOFChar(#0,700);

                  Str_ParametroVenda:= '<ce>'+strNomeCli+'</ce><l></l>';

                 // Int_Retorno := iImprimirTexto_DUAL_DarumaFramework(pchar('<b>'+(ibDadosEmpresa.FieldByName('NOME').AsString)+'</b><l></l>'+//,0);

                  if ibDadosEmpresa.FieldByName('ENDERECO').AsString <> '' Then begin

                    Str_ParametroVenda:= Str_ParametroVenda+ strEnderecoCli+' , '+strNumeroCli+'<l></l>';
                  //(ibDadosEmpresa.FieldByName('ENDERECO').AsString)+'    ,'+(ibDadosEmpresa.FieldByName('NUMERO').AsString)+'<l></l>'+//,0);

                  end;

                  if ibDadosEmpresa.FieldByName('BAIRRO').AsString <> '' Then begin //begin

                     Str_ParametroVenda:= Str_ParametroVenda+ strBairroCli+'<l></l>';
                    //(ibDadosEmpresa.FieldByName('BAIRRO').AsString)+'<l></l>'+//,0);

                  end;

                  if ibDadosEmpresa.FieldByName('TELEFONE').AsString <> '' Then begin //begin

                    Str_ParametroVenda := Str_ParametroVenda+ strTelefoneCli+'<l></l>';
                   // ('Fone: '+ibDadosEmpresa.FieldByName('TELEFONE').AsString)+'<l></l>'+//,0);
                  end;

                //Writeln(F,(DesenhoDivisao));

              { if frmVendasLoja.lbl_Funcionario.Text <> '' Then begin
                Writeln(F,('Funcion�rio:<sp>1</sp>'+ frmVendasLoja.lbl_Funcionario.Text + ''));
                end;  }

                Str_ParametroVenda := Str_ParametroVenda+('Cupom: '+frmManutCx.lbl_edtNumCupom.Text)+'<l></l>';//,0);
                Str_ParametroVenda := Str_ParametroVenda+('Data:'+DataConvertida+' '+'Hora:'+Hora)+'<l></l>';//,0);
                Str_ParametroVenda := Str_ParametroVenda+('**Cupom nao Fiscal para simples conferencia**')+'<l></l>';//,0);
                Str_ParametroVenda := Str_ParametroVenda+(DesenhoDivisao)+'<l></l>';//,0);

////////////////////////////////////////////////////////////////////////////////
                intContadorItem := 1;
                while not ibTempVendaLoja.Eof do begin

                  if intContadorItem = 1 Then begin

                    strContadorItem := '00'+ IntToStr(intContadorItem);

                  end else begin

                    strContadorItem := '00'+ IntToStr(intContadorItem);

                  end;

                  strNomeProdCupom := ibTempVendaLoja.FieldByName('NOMEPROD').AsString;
                  strNomePagto   := ibTempVendaLoja.FieldByName('DESCRICAO').AsString;
                  strVlrUnitCupom  := FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRUNIT').AsFloat);
                  strQtdeCupom     := FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('QTDE').AsFloat);
                  strVlrTotalCupom := FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat);


                 Str_ParametroVenda := Str_ParametroVenda+(strContadorItem+' '+strNomeProdCupom)+'<l></l>';//,0);
                 Str_ParametroVenda := Str_ParametroVenda+(strQtdeCupom+' X '+strVlrUnitCupom+' = '+strVlrTotalCupom)+'<l></l>';//,0);
                 //(FloatToStr(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('QTDE').AsFloat)))+' X '+(FloatToStr(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRUNIT').AsFloat)))+' = '+(FloatToStr(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat)))+'<l></l>';//,0);
                //  Writeln(F,(strContadorItem+' '+ibTempVendaLoja.FieldByName('NOMEPROD').AsString)+'...R$ '+(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat)));
                //  Int_Retorno:= iImprimirTexto_DUAL_DarumaFramework(pchar(strContadorItem+' '+(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('QTDE').AsFloat))+' X '+(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRUNIT').AsFloat))+' = '+(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat))),0);
                  //+ibTempVendaLoja.FieldByName('NOMEPROD').AsString)+'...R$ '+(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat)),0);
               // Writeln(11F,(FormatFloat(CasasDecimais('Combustiveis'),ibTempVendaLoja.FieldByName('QTDE').AsFloat))+' X '+(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRUNIT').AsFloat))+' = '+(FormatFloat(CasasDecimais('Produtos'),ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat)));

                   { if QtdedeItens = 0 Then begin

                      QtdedeItens := StrToFloat(StringReplace(FloatToStr(ibServsVenda.FieldByName('QTDE').AsFloat),ThousandSeparator,'',[rfreplaceAll]));

                    end else begin

                      TotalQtdeItens := StringReplace(FloatToStr(ibServsVenda.FieldByName('QTDE').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

                      QtdedeItens := QtdedeItens + StrtoFloat(StringReplace(TotalQtdeItens,ThousandSeparator,'',[rfReplaceAll]));

                    end;//if }
                    if QtdedeItens = 0 Then begin

                      QtdedeItens := StrToFloat(StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('QTDE').AsFloat),FormatSettings.ThousandSeparator,'',[rfreplaceAll]));

                    end else begin

                      TotalQtdeItens := StringReplace(FloatToStr(ibTempVendaLoja.FieldByName('QTDE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);

                      QtdedeItens := QtdedeItens + StrtoFloat(StringReplace(TotalQtdeItens,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

                    end;//if

                    intContadorItem :=  intContadorItem+1;

                ibTempVendaLoja.Next;

                end;//while
                  QtdeTotalItens := FormatFloat('0',QtdedeItens);

                 // Writeln(F,('Qtde.Itens..:'+ QtdeTotalItens));
                  Str_ParametroVenda := Str_ParametroVenda+('Qtde.Itens..:'+ QtdeTotalItens)+'<l></l>';//,0);
  ////////////////////////////////////////////////////////////////////////////////

           // Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<sp>1</sp>'+(frmVendasLoja.listboxCupom.Items).Text+ ''),0);
              //Writeln(F,(DesenhoDivisao));
              Str_ParametroVenda := Str_ParametroVenda+(DesenhoDivisao)+'<l></l>';//,0);
////////////////////////////////////////////////////////////////////////////////


                //  Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar(DesenhodeDivisao),0);
                  //Writeln(F,('TOTAL..:(R$)' + ' ' + '=' + ' ' +  Produto[3]));
                  Str_ParametroVenda := Str_ParametroVenda+('TOTAL..:(R$)' + ' ' + '=' + ' ' +  TotalVenda)+'<l></l>';//,0);

                 // Writeln(F,('VLR.PAGO: '+Produto[1] + ' ' + '=' + ' ' + Produto[2]));
                  Str_ParametroVenda := Str_ParametroVenda+('VLR.PAGO..:(R$)'+ strNomePagto+ ' ' + '=' + ' ' +VlrPago)+'<l></l>';//,0);
                                                                             // Produto[1]
                //  Writeln(F,('TROCO' + ' ' + '=' + ' ' +Produto[4]));
                  Str_ParametroVenda := Str_ParametroVenda+('TROCO' + ' ' + '=' + ' ' +Troco)+'<l></l>';//,0);

                //  Writeln(F,(DesenhoDivisao));
                  Str_ParametroVenda := Str_ParametroVenda+(DesenhoDivisao)+'<l></l>';//,0);
                  ///Int_Retorno:= Daruma_DUAL_ImprimirTexto(pchar('<sl>'+QtdedeSaltos+'</sl>'), 0);

////////////////////////////////////////////////////////////////////////////////


                if Frase <> '' Then begin
                //Writeln(F,(Frase));
                Int_Retorno:= iImprimirTexto_DUAL_DarumaFramework(Str_ParametroVenda+(Frase)+'<sl>05</sl><gui></gui>',0);

                end else begin

               // Str_ParametroVenda := Str_ParametroVenda+('<sl>05</sl><gui></gui>',0);
                Int_Retorno:= iImprimirTexto_DUAL_DarumaFramework(Str_ParametroVenda+'<sl>05</sl><gui></gui>',0);

                end;

            //intImprCupomS := 0;

            end; //if imprimir cupom simples conferencia
////////////////////////////////////////////////////////////////////////////////
{  if AcionaGaveta = 'Sim' Then begin

                // Fun��o para Abrir a gaveta de dinheiro
                iRetorno := Bematech_FI_AcionaGaveta();
                // Procedure que analisa o retorno da fun��o
              //  Analisa_iRetorno();
                // Procedure que analisa o retorno da Impressora
              //  Retorno_Impressora();

              end;   }

                //Writeln(F,(''));
               // Writeln(F,(''));
               // Writeln(F,(''));
              //  Writeln(F,(''));
              //  Writeln(F,(''));
              // Writeln(F,(''));
              //  Writeln(F,(''));
              //  Writeln(F,(''));
              //  Writeln(F,(''));

//****************************************************************************//





  end;//with 

end;

procedure TfrmManutCx.SpeedButton1Click(Sender: TObject);

var

NumeroCupom, NomeEmpresa,Endereco,Numero, Bairro, Estado, Telefone : String;
{NomeProduto,Qtde,Vlr,Total,DataConvertida,Hora : String;
VlrPago,Troco,TotalVenda,DesenhodeDivisao,QtdedeSaltos : String;
Frase,FraseRodape : String; }
ncmexistente : Boolean;
intSATDaruma, AtivarCalcIBPT, ConfirmaImprSAT, iRetorno, ProdutoID : Integer;
Str_Nome, Str_CPF, Str_Endereco : String;
rImpostoEstadual,rVlrImpostoEstadual,rCalculoImpEstadual,rTotalImpostoEstadual,rTotalGeralImpostoEstadual : Real;
strImpostoEstadual,resultadoestadual,strTotalpelosprodutos : String;

str_PrecoUnit,str_TipoDescAcres,str_ValorDescAcres : String;
str_CodigoItem,str_UnidMedida,str_FormaPgto,str_CodCred : String;
str_CupomAdic,str_InfoAdic,str_Valor : String;

strCSOSN,strCST,strCFOP,strPIS,strIPI,strICMS,strCOFINS, QtdeTotalItens,TotalQtdeItens: String;
rPIS,rIPI,rICMS,rCOFINS,QtdedeItens :Real;
intContadorItem,QtdeItens, intNacionalidadeProd : Integer;
strContadorItem, Str_Aliquota,InformaNCM, strNCMProd, strNCM, VlrUnit, Qtde : String;
strPorcNCM, strTotalVenda, strQtde, resultado, CodBarras, NomeProd, VlrTotal : String;
rTotalVlrVenda, rTotalQtde, rVlrPorcNCM, CalculoPorcentagem, rTotalImposto : Real;
rTotalGeralImposto, RSomaaVenda, rSomaTotaldaVenda, RVlrUnit, RVlrTotal, RQtde : Real;
str_Quantidade, strUnidMedida, str_Descricao, Str_Valor_do_Desconto : String;
Str_Mensagem_Promocional : String;
begin

  with dmModule do begin

    ibDadosEmpresa.Close;
    ibDadosEmpresa.SQL.Clear;
    ibDadosEmpresa.SQL.Add('SELECT * FROM TBLDADOSEMPRESA');
    ibDadosEmpresa.Open;

    if ibDadosEmpresa.RecordCount > 0 Then begin

    NomeEmpresa := ibDadosEmpresa.FieldByName('NOME').AsString;
    Endereco    := ibDadosEmpresa.FieldByName('ENDERECO').AsString;
    Numero      := ibDadosEmpresa.FieldByName('NUMERO').AsString;
    Bairro      := ibDadosEmpresa.FieldByName('BAIRRO').AsString;
    Estado      := ibDadosEmpresa.FieldByName('ESTADO').AsString;
    Telefone    := ibDadosEmpresa.FieldByName('TELEFONE').AsString;

    end;

    if lbl_edtNumeroCupomSat.Text <> '' Then begin

    NumeroCupom := lbl_edtNumeroCupomSat.Text;

    end;

      Commit(ibTempVendaLoja);
      ibTempVendaLoja.Close;
      ibTempVendaLoja.SQL.Clear;
      ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.VLRSANGRIA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.VALORC,'
      + 'TBLSERVICOSVENDAS.NOMEPROD,'
      + 'TBLSERVICOSVENDAS.IDSERVS,TBLRECEBEVENDAS.VLRPAGO,'
      + 'TBLRECEBEVENDAS.TROCO,TBLRECEBEVENDAS.TOTALVENDA,TBLCADDOCUMENTACAO.CODIGO As CodCli FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLRECEBEVENDAS ON TBLSERVICOSVENDAS.IDSERVS=TBLRECEBEVENDAS.IDVENDA '
      + 'LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLSERVICOSVENDAS.IDCLIENTE=TBLCADDOCUMENTACAO.IDCAD '
      + 'WHERE TBLSERVICOSVENDAS.IDSERVSVENDA=''' + NumeroCupom + '''');
      ibTempVendaLoja.Open;

     // DataConvertida := FormatDateTime('DD/MM/YYYY',ibTempVendaLoja.FieldByName('DATA').AsDateTime);
      //Hora           := FormatDateTime('hh:mm:ss',ibTempVendaLoja.FieldByName('HORA').AsDateTime);



        Commit(ibConfig);
        ibConfig.Close;
        ibConfig.SQL.Clear;
        ibConfig.SQL.Add('SELECT * FROM TBLCONFIGURACOES');
        ibConfig.Open;

        AtivarCalcIBPT      := (ibConfig.FieldByName('ATIVARCALCULOIBPT').AsInteger);
        intSATDaruma       := ibConfig.FieldByName('SATDARUMA').AsInteger;


////////////////////////////////////////////////////////////////////////////////

          if (intSATDaruma = 1)and(lbl_edtvalor.Text > '0,00') Then begin

            ConfirmaImprSAT := Application.MessageBox('Confirma Impress�o','SAT',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

            if ConfirmaImprSAT = 6 Then begin
            //  if IniciaCupomFiscalF4 = 'Nao' Then begin
                 //**ABRECUPOM SAT**
                // Str_CPF_ou_CNPJ := '';

               //  Int_Retorno := //iCFAbrirPadrao_ECF_Daruma();

                  Str_Nome := lbl_edtNomeCli.Text;
                  Str_CPF := lbl_edtCpfCli.Text ;
                  Str_Endereco := '';
                  iRetorno:=  aCFAbrir_SAT_Daruma(Str_CPF, Str_Nome, Str_Endereco);
                  //Tratar_RetornoSAT(iRetorno);

            //  end;

               // if frmVendasLoja.lbl_CodPosVenda.Caption = '' Then begin

                  Commit(ibTempVendaLoja);
                ///  ibTempVendaLoja.Close;
                  ibTempVendaLoja.SQL.Clear;
                  ibTempVendaLoja.SQL.Add('SELECT TBLSERVICOSVENDAS.*,'
                  + 'CADPRODUTOS.NOME As Produto,CADPRODUTOS.CODBARRAS FROM TBLSERVICOSVENDAS '
                  + 'INNER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD WHERE IDSERVSVENDA=''' + (lbl_edtNumCupom.Text) + '''');
                  ibTempVendaLoja.Open;

                 (ibTempVendaLoja.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := ',0.00';
                 (ibTempVendaLoja.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := ',0.00';
                 (ibTempVendaLoja.FieldByName('VALORB') as TFloatField).DisplayFormat := ',0.00';
                 (ibTempVendaLoja.FieldByName('VALORC') as TFloatField).DisplayFormat := ',0.00';
                 (ibTempVendaLoja.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis');

             //  end; 


                    while not ibTempVendaLoja.Eof do begin

                          ProdutoID := ibTempVendaLoja.FieldByName('IDPROD').AsInteger;
                          ncmexistente := False;

                         { Commit(ibProdutos);
                          ibProdutos.Close;
                          ibProdutos.SQL.Clear;
                          ibProdutos.SQL.Add('SELECT * FROM CADPRODUTOS WHERE IDPROD=''' + IntToStr(ProdutoID) + '''');
                          ibProdutos.Open;

                          Str_Aliquota := ibProdutos.FieldByName('ALIQUOTA').AsString;
                          InformaNCM   := ibProdutos.FieldByName('NCM').AsString;}

                          Commit(ibProdutos);
                          ibProdutos.Close;
                          ibProdutos.SQL.Clear;
                          ibProdutos.SQL.Add('SELECT CADPRODUTOS.IDPROD,CADPRODUTOS.NCM,CADPRODUTOS.NCMSH,CADPRODUTOS.NOME,'
                          + 'CADPRODUTOS.CODBARRAS,CADPRODUTOS.ALIQUOTA,CADPRODUTOS.NACIONALIDADEPROD,CADPRODUTOS.IDCFOP,'
                          + 'CADPRODUTOS.IDCST,CADPRODUTOS.IDCSOSN,CADPRODUTOS.PIS,CADPRODUTOS.IPI,CADPRODUTOS.ICMS,CADPRODUTOS.COFINS,'
                          + 'TBL_CFOP.CODIGO_CFOP,TBL_CST.CODIGO_CST,TBL_CSOSN.CODIGO_CSOSN FROM CADPRODUTOS '
                          + 'LEFT OUTER JOIN TBL_CFOP ON CADPRODUTOS.IDCFOP=TBL_CFOP.IDCFOP '
                          + 'LEFT OUTER JOIN TBL_CST ON CADPRODUTOS.IDCST=TBL_CST.IDCST '
                          + 'LEFT OUTER JOIN TBL_CSOSN ON CADPRODUTOS.IDCSOSN=TBL_CSOSN.ID_CSOSN WHERE IDPROD=''' + IntToStr(ProdutoID) + '''');
                          ibProdutos.Open;

                          Str_Aliquota := ibProdutos.FieldByName('ALIQUOTA').AsString;
                          InformaNCM   := ibProdutos.FieldByName('NCM').AsString;
                          strNCMProd   := ibProdutos.FieldByName('NCM').AsString;
                          strCFOP      := ibProdutos.FieldByName('CODIGO_CFOP').AsString;
                          strCST       := ibProdutos.FieldByName('CODIGO_CST').AsString;
                          strCSOSN     := ibProdutos.FieldByName('CODIGO_CSOSN').AsString;

                          rPIS         := (ibProdutos.FieldByName('PIS').AsFloat);
                          strPIS       := FormatFloat(CasasDecimais('Produtos'),rPIS);

                          rIPI         :=  (ibProdutos.FieldByName('IPI').AsFloat);
                          strIPI       := FormatFloat(CasasDecimais('Produtos'),rIPI);

                          rICMS        := (ibProdutos.FieldByName('ICMS').AsFloat);
                          strICMS      := FormatFloat(CasasDecimais('Produtos'),rICMS);

                          rCOFINS      := (ibProdutos.FieldByName('COFINS').AsFloat);
                          strCOFINS    := FormatFloat(CasasDecimais('Produtos'),rCOFINS);

                          strCFOP := AnsiReplaceStr(strCFOP,'.','');

                          ibImposto.Close;
                          ibImposto.SQL.Clear;
                          ibImposto.SQL.Add('SELECT * FROM TBLIMPOSTO_IBPT WHERE TBLIMPOSTO_IBPT.CODIGO=''' + InformaNCM + '''');
                          ibImposto.Open;

                          if ibImposto.RecordCount > 0 Then begin

                            ncmexistente := True;

                          end;

                              if (ncmexistente = True)and(AtivarCalcIBPT = 1) Then begin

                              //  InformaNCM   := ibProdutos.FieldByName('NCM').AsString;

                                if InformaNCM <> '' Then begin

                                  strNCM          := StringReplace(ibProdutos.FieldByName('NCM').AsString,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
                                 // intNCM := StrToInt(strNCM);
                                //  NCM := IntToStr(intNCM);
                                  intNacionalidadeProd := (ibProdutos.FieldByName('NACIONALIDADEPROD').AsInteger);

                                    if intNacionalidadeProd = 1 Then begin

                                      ibImposto.Close;
                                      ibImposto.SQL.Clear;
                                      ibImposto.SQL.Add('SELECT * FROM TBLIMPOSTO_IBPT WHERE TBLIMPOSTO_IBPT.CODIGO=''' + strNCM + '''');
                                      ibImposto.Open;

                                      strPorcNCM     := (ibImposto.FieldByName('NACIONALFE').AsString);
                                      strImpostoEstadual := (ibImposto.FieldByName('ESTADUAL').AsString);

                                    end;

                                    if intNacionalidadeProd = 2 Then begin

                                      ibImposto.Close;
                                      ibImposto.SQL.Clear;
                                      ibImposto.SQL.Add('SELECT * FROM TBLIMPOSTO_IBPT WHERE TBLIMPOSTO_IBPT.CODIGO=''' + strNCM + '''');
                                      ibImposto.Open;

                                      strPorcNCM     := (ibImposto.FieldByName('IMPORTADOS').AsString);
                                      strImpostoEstadual := (ibImposto.FieldByName('ESTADUAL').AsString);

                                    end;

                                end;

                              end;//calcibpt
//****************************************************************************//
  //     .*,CADPRODUTOS.NCM FROM TBLIMPOSTO_IBPT '
  //    + 'INNER JOIN CADPRODUTOS ON TBLIMPOSTO_IBPT.CODIGO=CADPRODUTOS.NCM

                          rTotalVlrVenda := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
                          strTotalVenda  := FormatFloat(CasasDecimais('Produtos'),rTotalVlrVenda);//StringReplace(FloatToStr(RVlrTotal),ThousandSeparator,'',[rfReplaceAll]);

                          rTotalQtde     := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('QTDE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
                          strQtde        := FormatFloat(CasasDecimais('Produtos'),rTotalQtde);//StringReplace(FloatToStr(RQtde),ThousandSeparator,'',[rfReplaceAll]);

                        if (AtivarCalcIBPT = 1)and(ncmexistente = True) Then begin

                          if InformaNCM > '0' Then begin

                              //CALCULA ALIQUOTA NACIONAL OU IMORTADO imposto federal
                              strPorcNCM := StringReplace(strPorcNCM,FormatSettings.ThousandSeparator,',',[rfReplaceAll]);
                              rVlrPorcNCM    :=  StrtoFloat(strPorcNCM);//StrtoFloat(StringReplace(FloattoStr(ibImposto.FieldByName('ALIQNAC').AsFloat),ThousandSeparator,'.',[rfReplaceAll]));

                              //CALCULAIMPOSTO ESTADUAL
                              strImpostoEstadual := StringReplace(strImpostoEstadual,FormatSettings.ThousandSeparator,',',[rfReplaceAll]);
                              rVlrImpostoEstadual    :=  StrtoFloat(strImpostoEstadual);//StrtoFloat(StringReplace(FloattoStr(ibImposto.FieldByName('ALIQNAC').AsFloat),ThousandSeparator,'.',[rfReplaceAll]));

                            //calcula ref aliquota nacional ou importada imposto federal
                              CalculoPorcentagem := rTotalVlrVenda * rVlrPorcNCM / 100;

                            //calcula imposto estadual
                              rCalculoImpEstadual := rTotalVlrVenda * rVlrImpostoEstadual / 100;

                            // ref imposto federal
                            rTotalImposto := CalculoPorcentagem;

                            // ref imposto estadual
                            rTotalImpostoEstadual := rCalculoImpEstadual;

                            //total federal
                            rTotalGeralImposto :=  rTotalImposto + rTotalGeralImposto;
                            resultado :=  FormatFloat(CasasDecimais('Produtos'),rTotalGeralImposto);

                            //total estadual
                            rTotalGeralImpostoEstadual :=  rTotalImpostoEstadual + rTotalGeralImpostoEstadual;
                            resultadoestadual :=  FormatFloat(CasasDecimais('Produtos'),rTotalGeralImpostoEstadual);

                          end;

                        end;

                            RSomaaVenda := rTotalVlrVenda + RSomaaVenda;
                            rSomaTotaldaVenda := RSomaaVenda - rTotalGeralImposto - rTotalGeralImpostoEstadual;
                            strTotalpelosprodutos := FormatFloat(CasasDecimais('Produtos'),rSomaTotaldaVenda);

//****************************************************************************//


                      if ibProdutos.FieldByName('CODBARRAS').AsString > '0' Then begin

                        CodBarras    := ibProdutos.FieldByName('CODBARRAS').AsString;

                      end else begin

                        CodBarras    := IntToStr(ibProdutos.FieldByName('IDPROD').AsInteger);

                      end;


                      NomeProd  := ibProdutos.FieldByName('NOME').AsString;

                      RVlrUnit  := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRUNIT').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
                      VLrUnit   := FormatFloat('##.00',RVlrUnit);//FormatFloat(CasasDecimais('Combustiveis'),RVlrUnit);//StringReplace(FloatToStr(RVlrUnit),ThousandSeparator,'',[rfReplaceAll]);


                      RVlrTotal := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
                      Vlrtotal  := FormatFloat('##.00',RVlrTotal);//FormatFloat(CasasDecimais('Combustiveis'),RVlrTotal);//StringReplace(FloatToStr(RVlrTotal),ThousandSeparator,'',[rfReplaceAll]);


                      RQtde     := StrtoFloat(StringReplace(FloattoStr(ibTempVendaLoja.FieldByName('QTDE').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));
                      Qtde      := FormatFloat(CasasDecimais('Combustiveis'),RQtde);//StringReplace(FloatToStr(RQtde),ThousandSeparator,'',[rfReplaceAll]);


                        str_Aliquota:= Str_Aliquota;
                        str_Quantidade:= Trim(Qtde);
                        str_PrecoUnit:= (VLrUnit);
                        str_TipoDescAcres:=  'D$';
                        str_ValorDescAcres:= '0,00';
                        str_CodigoItem:= Trim(CodBarras);
                        str_UnidMedida:= 'UN';
                        str_Descricao:= Trim(NomeProd);

                        if (strCFOP <>'')Then begin

                          iRetorno:= regAlterarValor_SAT_Daruma('PROD\CFOP',strCFOP);// -------------------> aqui lan�a o cfop;
                                     
                        end;

                        if (strNCMProd <>'')Then begin

                          iRetorno:= regAlterarValor_SAT_Daruma('PROD\NCM',strNCMProd);// -------------------> aqui lan�a o cfop;
                                    
                        end;

                      {  if (strCST <>'')Then begin

                          iRetorno:= regAlterarValor_SAT_Daruma('IMPOSTO\PIS\PISSN\CST',strCST);
                          //iRetorno:= regAlterarValor_SAT_Daruma('IMPOSTO\PIS\PISOUTR\CST','99');

                        end;

                        if (strCSOSN <>'')Then begin

                          iRetorno:= regAlterarValor_SAT_Daruma('IMPOSTO\ICMS\ICMSSN102\CSOSN',strCSOSN);
                          iRetorno:= regAlterarValor_SAT_Daruma('IMPOSTO\ICMS\ICMSSN102\ORIG','0');

                        end;  }
                                                
                          iRetorno:= aCFVender_SAT_Daruma(str_Aliquota, str_Quantidade , str_PrecoUnit , str_TipoDescAcres , str_ValorDescAcres , str_CodigoItem, str_UnidMedida, str_Descricao);
                       // Tratar_RetornoSAT(iRetorno);

                      ibTempVendaLoja.Next;

                    end;//while

////////////////////////////////////////////////////////////////////////////////

                   { if (lbl_edtDesconto.Text > '0,00') Then begin

                        str_TipoDescAcres:= 'D$';
                        Str_Valor_do_Desconto:= lbl_edtDesconto.Text;
                        iRetorno:= aCFTotalizar_SAT_Daruma(str_TipoDescAcres, Str_Valor_do_Desconto);
                      //  Tratar_RetornoSAT(iRetorno);

                    end; }

                   // if (lbl_edtDesconto.Text = '0,00') Then begin

                        str_TipoDescAcres:= 'D$';
                        Str_Valor_do_Desconto:= '0,00';
                        iRetorno:= aCFTotalizar_SAT_Daruma(str_TipoDescAcres, Str_Valor_do_Desconto);
                      //  Tratar_RetornoSAT(iRetorno);

                  //  end;

////////////////////////////////////////////////////////////////////////////////

                    //EFETUA FORMAPAGTO    and(cboTPagto2.Text = '')

                    if (cboTipoPagto.Text <> '')Then begin

                      str_FormaPgto:= cboTipoPagto.Text;
                      str_Valor:= lbl_edtValor.Text;
                      str_CodCred:= '';
                      iRetorno:= aCFEfetuarPagamento_SAT_Daruma(str_FormaPgto, str_Valor, str_CodCred);
                     // Tratar_RetornoSAT(iRetorno);

                    end;

////////////////////////////////////////////////////////////////////////////////

              //TERMINA FECH CUPOM
                  {  if  (strTotalpelosprodutos >'0,00') Then begin

                      Str_Mensagem_Promocional  := 'Voce pagou aproximadamente:'+#10+'R$'+resultado+' de tributos federais'+#10+'R$'+resultadoestadual+' de tributos estaduais'+#10+'R$'+strTotalpelosprodutos+' pelos produtos'+#10+'Fonte:IBPT/FECOMERCIO  SP        Xe67Eq';

                    end else begin

                      Str_Mensagem_Promocional := 'Obrigado Volte Sempre!!!';

                    end;  }

                    //sTipoCupomAdic := '0';

                   // Int_Retorno := iCFEncerrar_ECF_Daruma(sTipoCupomAdic,Str_Mensagem_Promocional);

                    if  (strTotalpelosprodutos >'0,00')and(AtivarCalcIBPT = 1) Then begin

                      Str_Mensagem_Promocional  := 'Trib aprox R$:'+resultado+' Federal e '+resultadoestadual+' Estadual'+#10+'Fonte:IBPT 5oi7eW';

                    end else begin

                      Str_Mensagem_Promocional := 'Obrigado Volte Sempre!!!';

                    end;                   

                    str_CupomAdic:= '';
                    str_InfoAdic:= Str_Mensagem_Promocional;
                    iRetorno := tCFEncerrar_SAT_Daruma(str_CupomAdic,str_InfoAdic);
                    Tratar_RetornoSAT(iRetorno);

                //imprimir cupom sat
             {
                str_Path:= StringOfChar(#0,900);
                str_Tipo:= StringOfChar(#0,2);

                str_Path:= CaminhoXMLDarumaSAT;
                str_Tipo:= IntToStr(CB_Tipo.ItemIndex+1);
                iRetorno:= iImprimirCFe_SAT_Daruma(str_Path, str_Tipo);
                Tratar_RetornoSAT(iRetorno);
                                              }
            end;//ifconfirmaimpressao

          end;
//****************************************************************************//



  end;//with


end;

procedure TfrmManutCx.lbl_edtCPFCliExit(Sender: TObject);

var
DocOK,DocInv : String;

begin

       tedit(sender).color := clwindow;

       if lbl_edtCPFCli.Text <> '' Then begin

         
          //formatar
          ACBrValidador1.TipoDocto := TACBrValTipoDocto( 0 ) ;
          ACBrValidador1.Documento   := lbl_edtCPFCli.Text ;
          lbl_edtCPFCli.Text := ACBrValidador1.Formatar ;

          lbl_edtCPFCli.Text := lbl_edtCPFCli.Text;
         //validar
          ACBrValidador1.Documento   := lbl_edtCPFCli.Text ;

          ///DocOK  := 'Doc.OK';

          if ACBrValidador1.Validar then begin
        ///  ShowMessage('Ok')
          end else begin
             DocInv  := ACBrValidador1.MsgErro;
             ShowMessage(DocInv);
             lbl_edtCPFCli.Text := '';

          end;
          
        end;


      { if DocInv = '' Then begin

         frmNFPaulista.Close;

       end else begin

         frmVendasLoja.lbl_CnpjCpfP.Caption := '';
         frmVendasLoja.lbl_edtCnpjCpf.Caption := '';
         frmVendasLoja.lbl_CodCliente.Caption := '';
         frmVendasLoja.lbl_Cliente.Caption := '';

       end; }


end;

procedure TfrmManutCx.lbl_edtCNPJCliExit(Sender: TObject);

var
DocOK,DocInv : String;

begin

       tedit(sender).color := clwindow;
       
       if lbl_edtCNPJCli.Text <> '' Then begin

          //formatar
          ACBrValidador1.TipoDocto := TACBrValTipoDocto( 1 ) ;
          ACBrValidador1.Documento   := lbl_edtCNPJCli.Text;
          lbl_edtCNPJCli.Text := ACBrValidador1.Formatar;

         // lbl_edtCNPJCli.Text := lbl_edtCNPJCli.Text;
         //validar
          ACBrValidador1.Documento   := lbl_edtCNPJCli.Text ;

          ///DocOK  := 'Doc.OK';

          if ACBrValidador1.Validar then begin
        ///  ShowMessage('Ok')
          end else begin
             DocInv  := ACBrValidador1.MsgErro;
             ShowMessage(DocInv);
             lbl_edtCNPJCli.Text := '';

          end;
             
       end;


end;

procedure TfrmManutCx.cboTipoPagtoEnter(Sender: TObject);
begin

tedit(sender).color := $00A0FAF8;

end;

procedure TfrmManutCx.lbl_edtNumeroCupomSatEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmManutCx.lbl_edtValorEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmManutCx.lbl_edtNomeCliEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmManutCx.lbl_edtCPFCliEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmManutCx.lbl_edtCNPJCliEnter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
end;

procedure TfrmManutCx.cboTipoPagtoExit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure TfrmManutCx.lbl_edtNumeroCupomSatExit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure TfrmManutCx.lbl_edtValorExit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure TfrmManutCx.lbl_edtNomeCliExit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure TfrmManutCx.sbOrcClick(Sender: TObject);

var
ValorPosVenda, ValorPosVendaB, ValorPosVendaC : Real;
TotalPosVenda,TotalPosVendaB, TotalPosVendaC, VlrTotalPosVenda, VlrTotalPosVendaB, VlrTotalPosVendaC : String;
Produto : Array[0..10]of String;

begin

  with dmModule do begin

    if (ckOrc.Checked)and(lbl_edtNumCupom.Text <> '') then begin

      Commit(ibServsVenda);
      ibServsVenda.Close;
      ibServsVenda.SQL.Clear;
      ibServsVenda.SQL.Add('SELECT * FROM TBLSERVICOSVENDAS WHERE TBLSERVICOSVENDAS.IDORCAMENTO=''' + lbl_edtNumCupom.Text + '''');
      ibServsVenda.Open;

      (ibServsVenda.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('VALORB') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('VALORC') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('VLRUNIT') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO
      (ibServsVenda.FieldByName('QTDE') as TFloatField).DisplayFormat := CasasDecimais('Combustiveis');


    while not ibServsVenda.Eof do begin//enquanto nao for fim de registro

      if ValorPosVenda = 0 Then begin//se variavel for igual a zero

        //atribui o vlr do campo abaixo na variavel
        ValorPosVenda := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end else begin

        //atribui na variavel substituindo o ponto para vlr em branco
        TotalPosVenda := StringReplace(FloattoStr(ibServsVenda.FieldByName('VLRTOTAL').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        //atribui a variavel o valor separando por ponto
        ValorPosVenda := ValorPosVenda + StrtoFloat(StringReplace(TotalPosVenda,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end;{if}

      //VALORB

      if ValorPosVendaB = 0 Then begin//se variavel for igual a zero

        //atribui o vlr do campo abaixo na variavel
        ValorPosVendaB := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end else begin

        //atribui na variavel substituindo o ponto para vlr em branco
        TotalPosVendaB := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORB').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        //atribui a variavel o valor separando por ponto
        ValorPosVendaB := ValorPosVendaB + StrtoFloat(StringReplace(TotalPosVendaB,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end;{if}

      //VALORC

      if ValorPosVendaC = 0 Then begin//se variavel for igual a zero

        //atribui o vlr do campo abaixo na variavel
        ValorPosVendaC := StrtoFloat(StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end else begin

        //atribui na variavel substituindo o ponto para vlr em branco
        TotalPosVendaC := StringReplace(FloattoStr(ibServsVenda.FieldByName('VALORC').AsFloat),FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
        //atribui a variavel o valor separando por ponto
        ValorPosVendaC := ValorPosVendaC + StrtoFloat(StringReplace(TotalPosVendaC,FormatSettings.ThousandSeparator,'',[rfReplaceAll]));

      end;{if}
////////////////////////////////////////////////////////////////////////////////

        Produto[0]:=IntToStr(ibServsVenda.FieldByName('IDPROD').AsInteger);
        Produto[1]:=ibServsVenda.FieldByName('NOMEPROD').AsString;
        Produto[3]:=ibServsVenda.FieldByName('QTDE').AsString;
  ///      Produto[4]:=frmVendasLoja.lbl_X.Caption;
        Produto[5]:=FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRUNIT').AsFloat);
   ///     Produto[6]:=frmVendasLoja.lbl_edtIgual.Caption;
        Produto[7]:=FormatFloat(CasasDecimais('Produtos'),ibServsVenda.FieldByName('VLRTOTAL').AsFloat + ibServsVenda.FieldByName('VALORB').AsFloat + ibServsVenda.FieldByName('VALORC').AsFloat);

    ///    frmVendasLoja.listboxCupom.Items.Add(Produto[0] + ' ' + '-' + ' ' + Produto[1]);
   ///     frmVendasLoja.listboxCupom.Items.Add(Produto[3] + ' ' + ' ' + ' ' + Produto[4] + ' ' + ' ' + ' ' + Produto[5] + ' ' + ' ' + ' ' + Produto[6]  + ' ' + ' ' + ' ' + Produto[7]);

  ////////////////////////////////////////////////////////////////////////////////


     ibServsVenda.Next;

    end;//while

     frmVendasLoja.lbl_edtSubTotal.Caption := FormatFloat(',0.00',ValorPosVenda + ValorPosVendaB + ValorPosVendaC);
     frmVendasLoja.lbl_IdOrc.Caption := lbl_edtNumCupom.Text;
 //   frmVendasLoja.lbl_Cliente.Caption := lbl_edtNomerazao.Text;
    { if lbl_edtCodCli.Text <> '' Then begin
     frmVendasLoja.lbl_CodCliente.Caption := lbl_edtCodCli.Text;
     end; }
     frmVendasLoja.lbl_edtInformacao.Caption := '';

   //  frmVendasLoja.lbl_CodPosVenda.Caption := lbl_edtIDVenda.Text;
      

    end;//if

      frmManutCx.Close;

  end;//with
  
end;

end.
