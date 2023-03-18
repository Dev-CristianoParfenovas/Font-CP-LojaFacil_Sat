unit untdmModule;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBQuery,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmModule = class(TDataModule)
    IBDGERAL: TIBDatabase;
    ibCadastro: TIBQuery;
    TRCadastro: TIBTransaction;
    dtsCadastro: TDataSource;
    IBDCep: TIBDatabase;
    ibLogradouro: TIBQuery;
    TRLogradouro: TIBTransaction;
    dtsLogradouro: TDataSource;
    ibContato: TIBQuery;
    TRContato: TIBTransaction;
    dtsContato: TDataSource;
    ibDocumentacao: TIBQuery;
    TRDocumentacao: TIBTransaction;
    dtsDocumentacao: TDataSource;
    ibClassificacao: TIBQuery;
    TRClassificacao: TIBTransaction;
    dtsClassificacao: TDataSource;
    TRCep: TIBTransaction;
    ibProdutos: TIBQuery;
    TRProdutos: TIBTransaction;
    dtsProdutos: TDataSource;
    ibEstoque: TIBQuery;
    TREstoque: TIBTransaction;
    dtsEstoque: TDataSource;
    ibGrupo: TIBQuery;
    TRGrupo: TIBTransaction;
    dtsGrupo: TDataSource;
    ibSubgrupo: TIBQuery;
    TRSubgrupo: TIBTransaction;
    dtsSubGrupo: TDataSource;
    ibEntrProdEstoque: TIBQuery;
    TREntrProdEstoque: TIBTransaction;
    dtsEntrProdEstoque: TDataSource;
    ibMovEst: TIBQuery;
    TRMovEst: TIBTransaction;
    dtsMovEst: TDataSource;
    ibTipoProd: TIBQuery;
    TRTipoProd: TIBTransaction;
    dtsTipoProd: TDataSource;
    ibEntradamercadoria: TIBQuery;
    TREntradamercadoria: TIBTransaction;
    dtsEntradamercadoria: TDataSource;
    ibNatureza: TIBQuery;
    TRNatureza: TIBTransaction;
    dtsNatureza: TDataSource;
    ibCPagar: TIBQuery;
    TRCPagar: TIBTransaction;
    dtsCPagar: TDataSource;
    ibInventario: TIBQuery;
    TRInventario: TIBTransaction;
    dtsInventario: TDataSource;
    ibProdinvent: TIBQuery;
    TRProdinvent: TIBTransaction;
    dtsProdinvent: TDataSource;
    ibTipoPagtoF: TIBQuery;
    TRTipoPagtoF: TIBTransaction;
    dtsTipoPagtoF: TDataSource;
    ibServsVenda: TIBQuery;
    TRServsVenda: TIBTransaction;
    dtsServsVenda: TDataSource;
    ibRecVendas: TIBQuery;
    TRRecVendas: TIBTransaction;
    dtsRecVendas: TDataSource;
    ibTempVendaLoja: TIBQuery;
    TRTempVendaLoja: TIBTransaction;
    dtsTempVendaLoja: TDataSource;
    dtsServsVendasCli: TDataSource;
    TRServsVendasCli: TIBTransaction;
    ibServsVendasCli: TIBQuery;
    dtsTempProd: TDataSource;
    TRTempProd: TIBTransaction;
    ibTempProd: TIBQuery;
    dtsDiaMes: TDataSource;
    TRDiaMes: TIBTransaction;
    ibDiaMes: TIBQuery;
    dtsTipoVenda: TDataSource;
    TRTipoVenda: TIBTransaction;
    ibTipoVenda: TIBQuery;
    dtsVendaConvenio: TDataSource;
    TRVendaConvenio: TIBTransaction;
    ibVendaConvenio: TIBQuery;
    dtsAPagar: TDataSource;
    TRAPagar: TIBTransaction;
    ibAPagar: TIBQuery;
    dtsAReceber: TDataSource;
    TRAReceber: TIBTransaction;
    ibAReceber: TIBQuery;
    dtsHistorico: TDataSource;
    TRHistorico: TIBTransaction;
    ibHistorico: TIBQuery;
    dtsServicos: TDataSource;
    TRServicos: TIBTransaction;
    ibServicos: TIBQuery;
    dtsTipodoc: TDataSource;
    TRTipodoc: TIBTransaction;
    ibTipodoc: TIBQuery;
    dtsBancos: TDataSource;
    TRBancos: TIBTransaction;
    ibBancos: TIBQuery;
    dtsSituacao: TDataSource;
    TRSituacao: TIBTransaction;
    ibSituacao: TIBQuery;
    dtsEventos: TDataSource;
    TREventos: TIBTransaction;
    ibEventos: TIBQuery;
    dtsMatPrima: TDataSource;
    TRMatPrima: TIBTransaction;
    ibMatPrima: TIBQuery;
    dtsKitComp: TDataSource;
    TRKitComp: TIBTransaction;
    ibKitComp: TIBQuery;
    dtsUser: TDataSource;
    TRUser: TIBTransaction;
    ibUser: TIBQuery;
    dtsTempProdNome: TDataSource;
    TRTempProdNome: TIBTransaction;
    ibTempProdNome: TIBQuery;
    ibPedVenda: TIBQuery;
    TRPedVenda: TIBTransaction;
    dtsPedVenda: TDataSource;
    ibPedVendaConsulta: TIBQuery;
    TRPedVendaConsulta: TIBTransaction;
    dtsPedVendaConsulta: TDataSource;
    ibManutPedVenda: TIBQuery;
    TRManutPedVenda: TIBTransaction;
    dtsManutPedVenda: TDataSource;
    ibDetalhePedVenda: TIBQuery;
    TRDetalhePedVenda: TIBTransaction;
    dtsDetalhePedVenda: TDataSource;
    TRLocalEstoque: TIBTransaction;
    ibLocalEstoque: TIBQuery;
    dtsLocalEstoque: TDataSource;
    ibPosVenda: TIBQuery;
    TRPosVenda: TIBTransaction;
    dtsPosVenda: TDataSource;
    ibDadosEmpresa: TIBQuery;
    TRDadosEmpresa: TIBTransaction;
    dtsDadosEmpresa: TDataSource;
    ibTempProdEstoque: TIBQuery;
    TRTempProdEstoque: TIBTransaction;
    dtsTempProdEstoque: TDataSource;
    ibConfig: TIBQuery;
    TRConfig: TIBTransaction;
    dtsConfig: TDataSource;
    ibTempProdutos: TIBQuery;
    TRTempProdutos: TIBTransaction;
    dtsTempProdutos: TDataSource;
    ibAberturaCX: TIBQuery;
    TRAberturaCX: TIBTransaction;
    dtsAberturaCX: TDataSource;
    ibUnidVenda: TIBQuery;
    TRUnidVenda: TIBTransaction;
    dtsUnidVenda: TDataSource;
    ibDataSistema: TIBQuery;
    TRDataSistema: TIBTransaction;
    dtsDataSistema: TDataSource;
    ibCondicoesPagto: TIBQuery;
    TRCondicoesPagto: TIBTransaction;
    dtsCondicoesPagto: TDataSource;
    ibTempCadastro: TIBQuery;
    TRTempCadastro: TIBTransaction;
    dtsTempCadastro: TDataSource;
    dtsTempAReceber: TDataSource;
    TRTempAReceber: TIBTransaction;
    ibTempAReceber: TIBQuery;
    dtsCores: TDataSource;
    TRCores: TIBTransaction;
    ibCores: TIBQuery;
    dtsTamanho: TDataSource;
    TRTamanho: TIBTransaction;
    ibTamanho: TIBQuery;
    TRTempEntradaEstoque: TIBTransaction;
    ibTempEntradaEstoque: TIBQuery;
    dtsTempEntradaEstoque: TDataSource;
    ibCReceberBx: TIBQuery;
    TRCReceberBx: TIBTransaction;
    dtsCReceberBx: TDataSource;
    ibDetalheNota: TIBQuery;
    TRDetalheNota: TIBTransaction;
    dtsDetalheNota: TDataSource;
    ibNotaFiscal: TIBQuery;
    TRNotaFiscal: TIBTransaction;
    dtsNotaFiscal: TDataSource;
    dtsTempNF: TDataSource;
    TRTempNF: TIBTransaction;
    ibTempNF: TIBQuery;
    ibPedCompra: TIBQuery;
    TRPedCompra: TIBTransaction;
    dtsPedCompra: TDataSource;
    ibDetalhePedCompra: TIBQuery;
    TRDetalhePedCompra: TIBTransaction;
    dtsDetalhePedCompra: TDataSource;
    ibTempPedCompra: TIBQuery;
    TRTempPedCompra: TIBTransaction;
    dtsTempPedCompra: TDataSource;
    dtsEtiqueta6089: TDataSource;
    TREtiqueta6089: TIBTransaction;
    ibEtiqueta6089: TIBQuery;
    ibTempEtiqueta6089: TIBQuery;
    TRTempEtiqueta6089: TIBTransaction;
    dtsTempEtiqueta6089: TDataSource;
    ibDetalhePosVenda: TIBQuery;
    TRDetalhePosVenda: TIBTransaction;
    dtsDetalhePosVenda: TDataSource;
    ibDetalheOrcamento: TIBQuery;
    TRDetalheOrcamento: TIBTransaction;
    dtsDetalheOrcamento: TDataSource;
    TROrcamentoPed: TIBTransaction;
    ibOrcamentoPed: TIBQuery;
    dtsOrcamentoPed: TDataSource;
    ibConfigNota: TIBQuery;
    TRConfigNota: TIBTransaction;
    dtsConfigNota: TDataSource;
    ibPagtoPendente: TIBQuery;
    TRPagtoPendente: TIBTransaction;
    dtsPagtoPendente: TDataSource;
    ibServicosPagar: TIBQuery;
    TRServicosPagar: TIBTransaction;
    dtsServicosPagar: TDataSource;
    ibEtiquetaGr: TIBQuery;
    TREtiquetaGr: TIBTransaction;
    dtsEtiquetaGr: TDataSource;
    ibEtiquetaGrande: TIBQuery;
    TREtiquetaGrande: TIBTransaction;
    dtsEtiquetaGrande: TDataSource;
    ibHistPedVenda: TIBQuery;
    TRHistPedVenda: TIBTransaction;
    dtsHistPedVenda: TDataSource;
    ibRelatPedVenda: TIBQuery;
    TRRelatPedVenda: TIBTransaction;
    dtsRelatPedVenda: TDataSource;
    ibControleServ: TIBQuery;
    TRControleServ: TIBTransaction;
    dtsControleServ: TDataSource;
    ibTipoServico: TIBQuery;
    TRTipoServico: TIBTransaction;
    dtsTipoServico: TDataSource;
    ibTempServicos: TIBQuery;
    TRTempServicos: TIBTransaction;
    dtsTempServicos: TDataSource;
    TRHistPendente: TIBTransaction;
    dtsHistPendente: TDataSource;
    ibHistPendente: TIBQuery;
    ibCotacao: TIBQuery;
    TRCotacao: TIBTransaction;
    dtsCotacao: TDataSource;
    ibTempCotacao: TIBQuery;
    TRTempCotacao: TIBTransaction;
    dtsTempCotacao: TDataSource;
    ibDetalheCotacao: TIBQuery;
    TRDetalheCotacao: TIBTransaction;
    dtsDetalheCotacao: TDataSource;
    ibEstoquePrateleira: TIBQuery;
    TREstoquePrateleira: TIBTransaction;
    dtsEstoquePrateleira: TDataSource;
    ibHistoricoEstoqueNF: TIBQuery;
    TRHistoricoEstoqueNF: TIBTransaction;
    dtsHistoricoEstoqueNF: TDataSource;
    ibDetalheEntrEstoque: TIBQuery;
    TRDetalheEntrEstoque: TIBTransaction;
    dtsDetalheEntrEstoque: TDataSource;
    dtsTempServicosVendas: TDataSource;
    TRTempServicosVendas: TIBTransaction;
    ibTempServicosVendas: TIBQuery;
    dtsCST: TDataSource;
    TRCST: TIBTransaction;
    ibCST: TIBQuery;
    dtsST: TDataSource;
    TRST: TIBTransaction;
    ibST: TIBQuery;
    dtsCSOSN: TDataSource;
    TRCSOSN: TIBTransaction;
    ibCSOSN: TIBQuery;
    dtsProdEquivalente: TDataSource;
    TRProdEquivalente: TIBTransaction;
    ibProdEquivalente: TIBQuery;
    dtsProdutoFornecedor: TDataSource;
    TRProdutoFornecedor: TIBTransaction;
    ibProdutoFornecedor: TIBQuery;
    dtsibDetalheEquivalente: TDataSource;
    TRibDetalheEquivalente: TIBTransaction;
    ibDetalheEquivalente: TIBQuery;
    dtsImposto: TDataSource;
    TRImposto: TIBTransaction;
    ibImposto: TIBQuery;
    TRMPV: TIBTransaction;
    dtsMPV: TDataSource;
    ibMPV: TIBQuery;
    TRDetalheMPV: TIBTransaction;
    dtsDetalheMPV: TDataSource;
    ibDetalheMPV: TIBQuery;
    TRDetalhePedVendaNota: TIBTransaction;
    dtsDetalhePedVendaNota: TDataSource;
    ibDetalhePedVendaNota: TIBQuery;
    TRPedVendaNota: TIBTransaction;
    dtsPedVendaNota: TDataSource;
    ibPedVendaNota: TIBQuery;
    TRImprimePedVendaNF: TIBTransaction;
    dtsImprimePedVendaNF: TDataSource;
    ibImprimePedVendaNF: TIBQuery;
    dtsCFOP: TDataSource;
    TRCFOP: TIBTransaction;
    ibCFOP: TIBQuery;
    dtsProdutosEquivalentes: TDataSource;
    TRProdutosEquivalentes: TIBTransaction;
    ibProdutosEquivalentes: TIBQuery;
    dtsCRT: TDataSource;
    TRCRT: TIBTransaction;
    ibCRT: TIBQuery;
    dtsIBGE: TDataSource;
    TRIBGE: TIBTransaction;
    ibIBGE: TIBQuery;
    dtsDataEntrEstoque: TDataSource;
    TRDataEntrEstoque: TIBTransaction;
    ibDataEntrEstoque: TIBQuery;
    ibChaveSat: TIBQuery;
    TRChaveSat: TIBTransaction;
    dtsChaveSat: TDataSource;
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1: TFDQuery;
    fdQry: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmModule: TdmModule;

implementation

{$R *.dfm}

end.
