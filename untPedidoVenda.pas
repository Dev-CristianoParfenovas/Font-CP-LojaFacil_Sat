unit untPedidoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids,
  classComboBox, DB, IBQuery, QRExport,
  ComObj, ShellApi, Buttons, Printers;

type
  TfrmPedidodeVenda = class(TForm)
    pcPedidoVenda: TPageControl;
    tbsPedido: TTabSheet;
    tbsContasaReceber: TTabSheet;
    Label1: TLabel;
    Image1: TImage;
    lbl_edtNumPedido: TLabeledEdit;
    lbl_edtNumCHDupl: TLabeledEdit;
    cboTipoPagto: TComboBox;
    lbl_TipoPagto: TLabel;
    lbl_dataPed: TLabel;
    lbl_edtRg: TLabeledEdit;
    lbl_edtCpf: TLabeledEdit;
    lbl_edtTelefone: TLabeledEdit;
    cboCliente: TComboBox;
    lbl_Cliente: TLabel;
    lbl_edtDesc: TLabeledEdit;
    lbl_edtAcresc: TLabeledEdit;
    lbl_edtTotalPed: TLabeledEdit;
    dbgPedVendas: TDBGrid;
    cboProduto: TComboBox;
    lbl_Prod: TLabel;
    lbl_edtVlrProd: TLabeledEdit;
    lbl_edtQtde: TLabeledEdit;
    lbl_edtTotalProd: TLabeledEdit;
    lbl_edtTotalGeral: TLabeledEdit;
    Label2: TLabel;
    Image2: TImage;
    lbl_DTInicio: TLabel;
    lbl_DtFinal: TLabel;
    dbgContasReceber: TDBGrid;
    lbl_edtTotalCRPeriodo: TLabeledEdit;
    Label3: TLabel;
    Label4: TLabel;
    tbsConsulta: TTabSheet;
    lbl_edtCodConsultaCli: TLabeledEdit;
    cboCliConsulta: TComboBox;
    lbl_edtDDDCliConsulta: TLabeledEdit;
    lbl_edtTelefoneCliConsulta: TLabeledEdit;
    lbl_edtNumeroCliCons: TLabeledEdit;
    lbl_edtBairroCliCons: TLabeledEdit;
    Label5: TLabel;
    lbl_Consulta: TLabel;
    Image3: TImage;
    Label6: TLabel;
    Label7: TLabel;
    dbgCliConsulta: TDBGrid;
    tbsManutPed: TTabSheet;
    Label8: TLabel;
    Image4: TImage;
    lbl_edtPedidoNumero: TLabeledEdit;
    lbl_edtDDDCliManutPed: TLabeledEdit;
    lbl_edtTelefoneCliManutPed: TLabeledEdit;
    lbl_edtCpfManutPed: TLabeledEdit;
    lbl_edtRgManutPed: TLabeledEdit;
    dbgManutPed: TDBGrid;
    lbl_edtCodManut: TLabeledEdit;
    Image19: TImage;
    Label24: TLabel;
    lbl_edtTotalP: TLabeledEdit;
    lbl_edtVlrProdM: TLabeledEdit;
    lbl_edtQtdeProdM: TLabeledEdit;
    lbl_edtTotalProdM: TLabeledEdit;
    lbl_edtCodProd: TLabeledEdit;
    cboProdM: TComboBox;
    Label9: TLabel;
    lbl_edtComissaoM: TLabeledEdit;
    Label10: TLabel;
    cboClienteM: TComboBox;
    lbl_ClienteM: TLabel;
    lbl_vctoProdM: TLabel;
    grbEstoque: TGroupBox;
    rbSim: TRadioButton;
    rbNao: TRadioButton;
    lbl_PB: TLabel;
    lbl_PC: TLabel;
    Label11: TLabel;
    lbl_edtTotalGeralPedidos: TLabeledEdit;
    lbl_edtTotalPedCliente: TLabeledEdit;
    Image5: TImage;
    lbl_Info: TLabel;
    Image6: TImage;
    Label12: TLabel;
    Label13: TLabel;
    Image7: TImage;
    lbl_edtEnderecoCliCons: TLabeledEdit;
    lbl_edtCelular: TLabeledEdit;
    cboFunc: TComboBox;
    lbl_Vendedor: TLabel;
    lbl_edtEndereco: TLabeledEdit;
    lbl_edtCompl: TLabeledEdit;
    lbl_edtNumero: TLabeledEdit;
    lbl_edtBairro: TLabeledEdit;
    lbl_edtCidade: TLabeledEdit;
    lbl_edtEstado: TLabeledEdit;
    lbl_edtCodBarras: TLabeledEdit;
    memoObs: TMemo;
    lbl_Obs: TLabel;
    lbl_Forn: TLabel;
    lbl_CondPagto: TLabel;
    cboFornecedorManutP: TComboBox;
    lbl_FornecedorM: TLabel;
    cboVendedorCons: TComboBox;
    lbl_Vend: TLabel;
    lbl_Vcto: TLabel;
    cboBanco: TComboBox;
    lbl_Bco: TLabel;
    lbl_edtComissao: TLabeledEdit;
    lbl_edtVlrDocumento: TLabeledEdit;
    grbTituloPedido: TGroupBox;
    tbsHistorico: TTabSheet;
    dbgHistorico: TDBGrid;
    lbl_edtTotalPago: TLabeledEdit;
    lbl_edtTotalPendente: TLabeledEdit;
    lbl_edtTotal: TLabeledEdit;
    lbl_edtCodCliH: TLabeledEdit;
    lbl_edtNomeCliH: TLabeledEdit;
    lbl_edtVlrTotalP: TLabeledEdit;
    lbl_edtPagtoParcial: TLabeledEdit;
    lbl_edtSaldoDevedor: TLabeledEdit;
    lbl_edtVlrPago: TLabeledEdit;
    lbl_edtTotalemAver: TLabeledEdit;
    Label14: TLabel;
    Label15: TLabel;
    tbsEstornoPendente: TTabSheet;
    lbl_edtData: TLabeledEdit;
    lbl_edtValorPagtoEfetuado: TLabeledEdit;
    dbgPagamentoEfetuado: TDBGrid;
    lbl_CodCliPagto: TLabel;
    lbl_NomeCliPagto: TLabel;
    lbl_edtNPedido: TLabeledEdit;
    lbl_edtNumeroPedido: TLabeledEdit;
    lbl_edtTotalDevedor: TLabeledEdit;
    ibeaNovo: TSpeedButton;
    ibeaAlterar: TSpeedButton;
    ibeaExcluir: TSpeedButton;
    ibeaHabilitarIncluir: TSpeedButton;
    ibeaPrecoA: TSpeedButton;
    ibeaBuscaCli: TSpeedButton;
    ibeaBuscaProd: TSpeedButton;
    ibeaSair: TSpeedButton;
    ibeaLimparCampos: TSpeedButton;
    ibeaIncluir: TSpeedButton;
    ibeaBuscaProdM: TSpeedButton;
    ibeaVisualizarpedido: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ibeaAlterarManut: TSpeedButton;
    ibeaExcluirManut: TSpeedButton;
    ibeaPedidoWord: TSpeedButton;
    ibeaSairM: TSpeedButton;
    ibeaSairConsulta: TSpeedButton;
    ibeaSairCR: TSpeedButton;
    ibeaHistorico: TSpeedButton;
    ibeaPesqClientes: TSpeedButton;
    ibeaSairPendente: TSpeedButton;
    ibeaPagtoPendente: TSpeedButton;
    ibeaRelatorioP: TSpeedButton;
    ibeaExcluirPagto: TSpeedButton;
    ibeaPagtosEfetuados: TSpeedButton;
    spbtnLimparCampos: TSpeedButton;
    cboTipoPagtoMP: TComboBox;
    lbl_TPagto: TLabel;
    grbImprimirNota: TGroupBox;
    cboNatureza: TComboBox;
    lbl_Natureza: TLabel;
    lbl_CodNatureza: TLabel;
    ibeaImprimirNF: TSpeedButton;
    lbl_Emiss: TLabel;
    lbl_CP: TLabel;
    cboTransportadora: TComboBox;
    lbl_Transp: TLabel;
    lbl_edtFrete: TLabeledEdit;
    lbl_edtEspecie: TLabeledEdit;
    lbl_edtPeso: TLabeledEdit;
    lbl_edtPesoBruto: TLabeledEdit;
    lbl_edtQtdeItens: TLabeledEdit;
    ibeaGravarNota: TSpeedButton;
    memoObsNF: TMemo;
    lbl_ObsNF: TLabel;
    lbl_edtNNotaImprimir: TLabeledEdit;
    dtpVctoCP: TDateTimePicker;
    dtpVctoProd: TDateTimePicker;
    lbl_CodBarras: TLabel;
    lbl_Traco: TLabel;
    lbl_NomeProd: TLabel;
    lbl_Valor: TLabel;
    lbl_TipoPreco: TLabel;
    dtpDataPed: TDateTimePicker;
    dtpDataPedManut: TDateTimePicker;
    dtpVctoProdM: TDateTimePicker;
    dtpEmissaoNota: TDateTimePicker;
    dtpDataPrazoIni: TDateTimePicker;
    dtpDataPrazoVct: TDateTimePicker;
    dtpDataIniCR: TDateTimePicker;
    dtpDataFinalCR: TDateTimePicker;
    dtpDataIni: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    cboFornecedores: TComboBox;
    cboCondPagto: TComboBox;
    lbl_edtRef: TLabeledEdit;
    lbl_edtCodInterno: TLabeledEdit;
    cboCondPagtoNota: TComboBox;


  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses uBuscaProdutos, untdmModule, BuscaClientes,funcPosto,
   unClientes,
  untPrincipal, untRPedOrcObs;

{$R *.dfm}



end.


