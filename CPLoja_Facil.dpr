program CPLoja_Facil;







uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untdmModule in 'untdmModule.pas' {dmModule: TDataModule},
  untLocalEstocagem in 'untLocalEstocagem.pas' {frmLocalEstocagem},
  funcPosto in 'library\funcPosto.pas',
  uGrupoeSubgrupo in 'uGrupoeSubgrupo.pas' {frmGrupoeSubgrupo},
  Fornecedores in 'Fornecedores.pas' {frmFornecedores},
  uBuscaProdutos in 'library\forms\uBuscaProdutos.pas' {frmBuscaProdutos},
  untRelClientes in 'rel\untRelClientes.pas' {frmRelClientes},
  untRelProd in 'rel\untRelProd.pas' {frmRelProd},
  untServicos in 'untServicos.pas' {frmVendasLoja},
  untRecebeLoja in 'untRecebeLoja.pas' {frmRecebeLoja},
  untRelEstoque in 'rel\untRelEstoque.pas' {frmRelEstoque},
  untFluxoCxP in 'untFluxoCxP.pas' {frmFluxoCxP},
  untRelFluxoCx in 'rel\untRelFluxoCx.pas' {frmRelFluxoCx},
  untRelContasaReceber in 'rel\untRelContasaReceber.pas' {frmRelContasaReceber},
  untRelContasaPagar in 'rel\untRelContasaPagar.pas' {frmRelContasPagar},
  untGeraCodBarra in 'untGeraCodBarra.pas' {frmCodBarrasAdicional},
  untRelCodBarrasAD in 'rel\untRelCodBarrasAD.pas' {frmRelCodBarrasAD},
  untFuncSenha in 'untFuncSenha.pas' {frmFuncSenha},
  unrRelPedOrcamento in 'rel\unrRelPedOrcamento.pas' {frmRelPedOrcamento},
  untManutCx in 'untManutCx.pas' {frmManutCx},
  BuscaClientes in 'library\forms\BuscaClientes.pas' {frmBuscaClientes},
  untRelQtdeVendida in 'rel\untRelQtdeVendida.pas' {frmRelQtdeVendida},
  untProdutoVendidoP in 'untProdutoVendidoP.pas' {frmProdutosVendidos},
  untFluxoDetalhado in 'untFluxoDetalhado.pas' {frmFluxoDetalhado},
  untFormSplash in 'untFormSplash.pas' {frmFormSplash},
  untRelEstoqueFornecedor in 'untRelEstoqueFornecedor.pas' {frmRelEstoqueFornecedor},
  untSobre in 'untSobre.pas' {frmSobre},
  untDadosEmpresa in 'untDadosEmpresa.pas' {frmDadosEmpresa},
  untConfiguracoes in 'untConfiguracoes.pas' {frmConfiguracoes},
  untSenhaCx in 'untSenhaCx.pas' {frmSenhaCx},
  untContasaReceber in 'untContasaReceber.pas' {frmContasaReceber},
  untRelTotalFluxo in 'rel\untRelTotalFluxo.pas' {frmRelTotalFluxo},
  untProdutos_MPrima in 'untProdutos_MPrima.pas' {frmProd_MPrima},
  untUnidVenda in 'untUnidVenda.pas' {frmUnidVenda},
  untRelTblPreco in 'rel\untRelTblPreco.pas' {frmRelTblPreco},
  untrelTblPrecoForn in 'untrelTblPrecoForn.pas' {frmTblPrecoForn},
  untLanctoContasaPagar in 'untLanctoContasaPagar.pas' {frmContasApagar},
  unClientes in 'unClientes.pas' {frmClientes},
  Cond_pagto in 'Cond_pagto.pas' {frmCondpagto},
  untRelEstMin in 'rel\untRelEstMin.pas' {frmRelEstoqueMin},
  untRelCRCartao in 'untRelCRCartao.pas' {frmRelCRCartao},
  untCRGeralP in 'untCRGeralP.pas' {frmCRGeralP},
  untSangria in 'untSangria.pas' {frmSangria},
  untTblPreco in 'untTblPreco.pas' {frmTblPreco},
  untEstoqueRapido in 'untEstoqueRapido.pas' {frmEstoqueRapido},
  untCores in 'untCores.pas' {frmCores},
  untTamanho in 'untTamanho.pas' {frmTamanho},
  untEstoqueMForn in 'untEstoqueMForn.pas' {frmEstoqueMForn},
  untRelProdDataCad in 'untRelProdDataCad.pas' {frmProdDataRegistro},
  untRelProdCad in 'rel\untRelProdCad.pas' {frmRelProdDataCad},
  untContasaPagarP in 'untContasaPagarP.pas' {frmContasaPagarP},
  untVendasDetalhado in 'untVendasDetalhado.pas' {frmVendasDetalhado},
  untRelFluxoDetalhado in 'rel\untRelFluxoDetalhado.pas' {frmRelFluxoDetalhado},
  untTroca in 'untTroca.pas' {frmTrocaMercadoria},
  untVendasFunc in 'untVendasFunc.pas' {frmVendasFunc},
  untSenha in 'untSenha.pas' {frmSenha},
  untEtiquetas6087Ref in 'rel\untEtiquetas6087Ref.pas' {frmEtiquetas6087Ref},
  untEtiquetasPimaco6087 in 'rel\untEtiquetasPimaco6087.pas' {frmEtiquetasPimaco6087},
  untEtiquetasPimaco6089 in 'rel\untEtiquetasPimaco6089.pas' {frmEtiquetasPimaco6089},
  untEtiquetasLoja in 'untEtiquetasLoja.pas' {frmEtiquetasLoja},
  untFluxoPrecoA in 'rel\untFluxoPrecoA.pas' {frmFluxoPrecoA},
  untFluxoPrecoD in 'rel\untFluxoPrecoD.pas' {frmRelFluxoPrecoD},
  untFluxoPrecoB in 'rel\untFluxoPrecoB.pas' {frmRelFluxoPrecoB},
  untFluxoPrecoC in 'rel\untFluxoPrecoC.pas' {frmRelFluxoPrecoC},
  untCRPeriodo in 'untCRPeriodo.pas' {frmCRPeriodo},
  untRelCRBaixado in 'rel\untRelCRBaixado.pas' {frmRelCRBaixado},
  untRelCPBaixado in 'rel\untRelCPBaixado.pas' {frmRelCPBaixado},
  untRelCustoDiario in 'rel\untRelCustoDiario.pas' {frmRelCustoDiario},
  untRelEtiquetas6089Nome in 'rel\untRelEtiquetas6089Nome.pas' {frmEtiquetasNome6089},
  untRelPedido in 'rel\untRelPedido.pas' {frmRelPedido},
  untPedidoFunc in 'untPedidoFunc.pas' {frmPedidoFunc},
  untFluxoPedVenda in 'untFluxoPedVenda.pas' {frmFluxoPedVenda},
  untRelRecibo in 'rel\untRelRecibo.pas' {frmRelRecibo},
  untPedidosLoja in 'untPedidosLoja.pas' {frmPedidosLoja},
  untRelVendasFornecedor in 'rel\untRelVendasFornecedor.pas' {frmVendasFornecedor},
  untRelFluxoTroca in 'rel\untRelFluxoTroca.pas' {frmRelatFluxoTroca},
  untTrocaPeriodo in 'untTrocaPeriodo.pas' {frm_TrocaP},
  untPedDetalhado in 'rel\untPedDetalhado.pas' {frmRelPedDetalhado},
  untRProdutos in 'untRProdutos.pas' {frmRProdutos},
  untRClientes in 'untRClientes.pas' {frmRClientes},
  untRelPendente in 'rel\untRelPendente.pas' {frmRelPendente},
  untBackup in 'untBackup.pas' {frmBackup},
  untServicosCPagar in 'untServicosCPagar.pas' {frmServicosCPagar},
  untEtiquetaGr in 'untEtiquetaGr.pas' {frmEtiquetaGr},
  untConfigEtiquetaGr in 'untConfigEtiquetaGr.pas' {frmConfigEtiquetaGr},
  untRelPendentePedido in 'rel\untRelPendentePedido.pas' {frmRelPendentePedido},
  untInstrucoesCaixa in 'untInstrucoesCaixa.pas' {frmInstrucoesCaixa},
  untPedidoVenda in 'untPedidoVenda.pas' {frmPedidodeVenda},
  untVendasCupom in 'untVendasCupom.pas' {frmVendasCupom},
  untRelatVendaCupom in 'rel\untRelatVendaCupom.pas' {frmRelatVendaCupom},
  untCotacao in 'untCotacao.pas' {frmCotacao},
  untSenhaAlteracaoProd in 'untSenhaAlteracaoProd.pas' {frmSenhaAlteracaoProd},
  untEntradadeEstoque in 'untEntradadeEstoque.pas' {frmEntradadeEstoque},
  untGravarCP in 'untGravarCP.pas' {frmGravarCP},
  untEtiquetasLojaR in 'untEtiquetasLojaR.pas' {frmEtiquetasLojaR},
  Unit1 in 'Unit1.pas' {Form1},
  untRCupomVenda in 'rel\untRCupomVenda.pas' {frmCupomVenda},
  untEtiquetaTermica in 'untEtiquetaTermica.pas' {frmEtiquetaTermica},
  untRProdFornecedor in 'rel\untRProdFornecedor.pas' {frmRProdFornecedor},
  untNFPaulista in 'untNFPaulista.pas' {frmNFPaulista},
  untCadFormasPagto in 'untCadFormasPagto.pas' {frmCadFormasPagto},
  untRCupomModR in 'rel\untRCupomModR.pas' {frmVendaCupomModR},
  untfrmREtiquetaZebra in 'rel\untfrmREtiquetaZebra.pas' {frmREtiquetaZebra},
  untRPedOrcObs in 'rel\untRPedOrcObs.pas' {frmRPedOrcObs},
  PrnDOS in 'library\PrnDOS.pas',
  untREtiquetasNome in 'rel\untREtiquetasNome.pas' {frmEtiquetasNome},
  classComboBox in 'Classes\classComboBox.pas',
  untClasse.Cadastro in 'Classes\untClasse.Cadastro.pas',
  untClasse.ConfigCX in 'Classes\untClasse.ConfigCX.pas',
  untClasse.DataEntrEstoque in 'Classes\untClasse.DataEntrEstoque.pas',
  untClasse.ImprimirCupom in 'Classes\untClasse.ImprimirCupom.pas',
  untClasse.VendasCX in 'Classes\untClasse.VendasCX.pas',
  untRFluxoVendasCaixa in 'rel\untRFluxoVendasCaixa.pas' {frmFluxoVendasCaixa},
  REtiquetasLoja in 'rel\REtiquetasLoja.pas' {frmREtiquetasLoja},
  untR_Orc in 'rel\310321\untR_Orc.pas' {frmR_Orc},
  untGrupoSubGrupEstoqueRelat in 'rel\untGrupoSubGrupEstoqueRelat.pas' {frmGrupoSubGrupoEstoqueRelat};

//  untGrupoSubGrupEstoqueRelat in 'rel\untGrupoSubGrupEstoqueRelat.pas' {frmGrupoSubGrupoEstoqueRelat};

//  Daruma_Framework_Impressoras_Fiscais in 'Daruma_Fiscal\Daruma\Daruma_Framework_Impressoras_Fiscais.pas' {Framework_Impressoras_Fiscais},
//  Daruma_Framework_RetornaInformacao in 'Daruma_Fiscal\Daruma\Daruma_Framework_RetornaInformacao.pas' {Framework_FIMFD_RetornaInformacao},
//  Daruma_Framework_AbreCupom in 'Daruma_Fiscal\Daruma\Daruma_Framework_AbreCupom.pas' {Framework_AbreCupom},
//  Daruma_Framework_VendeItem in 'Daruma_Fiscal\Daruma\Daruma_Framework_VendeItem.pas' {Framework_VendeItem},
//  Daruma_Framework_FechaCupomResumido in 'Daruma_Fiscal\Daruma\Daruma_Framework_FechaCupomResumido.pas' {Framework_FechaCupomResumido},
//  Daruma_Framework_IniciaFechamentoCupom in 'Daruma_Fiscal\Daruma\Daruma_Framework_IniciaFechamentoCupom.pas' {Framework_IniciaFechamentoCupom},
//  Daruma_Framework_EfetuaFormaPagamento in 'Daruma_Fiscal\Daruma\Daruma_Framework_EfetuaFormaPagamento.pas' {Framework_EfetuaFormaPagamento},
//  Daruma_Framework_EfetuaFormaPagamentoDescricaoForma in 'Daruma_Fiscal\Daruma\Daruma_Framework_EfetuaFormaPagamentoDescricaoForma.pas' {Framework_EfetuaFormaPagamentoDescricaoForma},
//  Daruma_Framework_IdentificaConsumidor in 'Daruma_Fiscal\Daruma\Daruma_Framework_IdentificaConsumidor.pas' {Framework_IdentificaConsumidor},
//  Daruma_Framework_TerminaFechamentoCupom in 'Daruma_Fiscal\Daruma\Daruma_Framework_TerminaFechamentoCupom.pas' {Framework_TerminaFechamentoCupom},
//  Daruma_Framework_FechaCupom in 'Daruma_Fiscal\Daruma\Daruma_Framework_FechaCupom.pas' {Framework_FechaCupom},
//  Daruma_Framework_AumentaDescricaoItem in 'Daruma_Fiscal\Daruma\Daruma_Framework_AumentaDescricaoItem.pas' {Framework_AumentaDescricaoItem},
////  Daruma_Framework_UsaUnidadeMedida in 'Daruma_Fiscal\Daruma\Daruma_Framework_UsaUnidadeMedida.pas' {Framework_UsaUnidadeMedida},
//  Daruma_Framework_EstornoFormasPagamento in 'Daruma_Fiscal\Daruma\Daruma_Framework_EstornoFormasPagamento.pas' {Framework_EstornoFormasPagamento},
//  Daruma_Framework_CancelaItemGenerico in 'Daruma_Fiscal\Daruma\Daruma_Framework_CancelaItemGenerico.pas' {Framework_CancelaItemGenerico},
//  Daruma_Framework_AbreComprovanteNaoFiscalVinculado in 'Daruma_Fiscal\Daruma\Daruma_Framework_AbreComprovanteNaoFiscalVinculado.pas' {Framework_AbreComprovanteNaoFiscalVinculado},
//  Daruma_Framework_UsaComprovanteNaoFiscalVinculado in 'Daruma_Fiscal\Daruma\Daruma_Framework_UsaComprovanteNaoFiscalVinculado.pas' {Framework_UsaComprovanteNaoFiscalVinculado},
//  Daruma_Framework_RelatorioGerencial in 'Daruma_Fiscal\Daruma\Daruma_Framework_RelatorioGerencial.pas' {Framework_RelatorioGerencial},
//  Daruma_Framework_EnviarTextoCNF in 'Daruma_Fiscal\Daruma\Daruma_Framework_EnviarTextoCNF.pas' {Framework_EnviarTextoCNF},
//  Daruma_Framework_RecebimentoNaoFiscal in 'Daruma_Fiscal\Daruma\Daruma_Framework_RecebimentoNaoFiscal.pas' {Framework_RecebimentoNaoFiscal},
//  Daruma_Framework_AbreRecebimentoNaoFiscal in 'Daruma_Fiscal\Daruma\Daruma_Framework_AbreRecebimentoNaoFiscal.pas' {Framework_AbreRecebimentoNaoFiscal},
//  Daruma_Framework_EfetuaFormaPagamentoNaoFiscal in 'Daruma_Fiscal\Daruma\Daruma_Framework_EfetuaFormaPagamentoNaoFiscal.pas' {Framework_EfetuaFormaPagamentoNaoFiscal},
//  Daruma_Framework_Sangria in 'Daruma_Fiscal\Daruma\Daruma_Framework_Sangria.pas' {Framework_Sangria},
//  Daruma_Framework_Suprimento in 'Daruma_Fiscal\Daruma\Daruma_Framework_Suprimento.pas' {Framework_Suprimento},
 // Daruma_Framework_FundoCaixa in 'Daruma_Fiscal\Daruma\Daruma_Framework_FundoCaixa.pas' {Framework_FundoCaixa},
//  Daruma_Framework_ReducaoZAjustaDataHora in 'Daruma_Fiscal\Daruma\Daruma_Framework_ReducaoZAjustaDataHora.pas' {Framework_ReducaoZAjustaDataHora},
//  Daruma_Framework_LeituraMemoriaFiscalData in 'Daruma_Fiscal\Daruma\Daruma_Framework_LeituraMemoriaFiscalData.pas' {Framework_LeituraMemoriaFiscalData},
//  Daruma_Framework_LeituraMemoriaFiscalReducao in 'Daruma_Fiscal\Daruma\Daruma_Framework_LeituraMemoriaFiscalReducao.pas' {Framework_LeituraMemoriaFiscalReducao},
 // Daruma_Framework_LeituraMemoriaFiscalSerialData in 'Daruma_Fiscal\Daruma\Daruma_Framework_LeituraMemoriaFiscalSerialData.pas' {Framework_LeituraMemoriaFiscalSerialData},
//  Daruma_Framework_LeituraMemoriaFiscalSerialReducao in 'Daruma_Fiscal\Daruma\Daruma_Framework_LeituraMemoriaFiscalSerialReducao.pas' {Framework_LeituraMemoriaFiscalSerialReducao},
//  Daruma_Framework_AutenticacaoStr in 'Daruma_Fiscal\Daruma\Daruma_Framework_AutenticacaoStr.pas' {Framework_AutenticacaoStr},
//  Daruma_Framework_AberturaDoDia in 'Daruma_Fiscal\Daruma\Daruma_Framework_AberturaDoDia.pas' {Framework_AberturaDoDia},
//  Daruma_Framework_ProgramaAliquota in 'Daruma_Fiscal\Daruma\Daruma_Framework_ProgramaAliquota.pas' {Framework_ProgramaAliquota},
//  Daruma_Framework_NomeiaTotalizadorNaoSujeitoIcms in 'Daruma_Fiscal\Daruma\Daruma_Framework_NomeiaTotalizadorNaoSujeitoIcms.pas' {Framework_NomeiaTotalizadorNaoSujeitoIcms},
//  Daruma_Framework_ProgramaFormasPagamento in 'Daruma_Fiscal\Daruma\Daruma_Framework_ProgramaFormasPagamento.pas' {Framework_ProgramaFormasPagamento},
//  Daruma_Framework_ProgramaOperador in 'Daruma_Fiscal\Daruma\Daruma_Framework_ProgramaOperador.pas' {Framework_ProgramaOperador},
//  Daruma_Framework_LinhasEntreCupons in 'Daruma_Fiscal\Daruma\Daruma_Framework_LinhasEntreCupons.pas' {Framework_LinhasEntreCupons},
//  Daruma_Framework_EspacoEntreLinhas in 'Daruma_Fiscal\Daruma\Daruma_Framework_EspacoEntreLinhas.pas' {Framework_EspacoEntreLinhas},
 // Daruma_Framework_ProgramaVinculados in 'Daruma_Fiscal\Daruma\Daruma_Framework_ProgramaVinculados.pas' {Framework_ProgramaVinculados},
 // Daruma_Framework_ProgFormasPagtoSemVincular in 'Daruma_Fiscal\Daruma\Daruma_Framework_ProgFormasPagtoSemVincular.pas' {Framework_ProgFormasPagtoSemVincular},
//  Daruma_Framework_Config_and_Registry in 'Daruma_Fiscal\Daruma\Daruma_Framework_Config_and_Registry.pas' {Framework_Config_and_Registry},
//  Daruma_Framework_Retornos in 'Daruma_Fiscal\Daruma\Daruma_Framework_Retornos.pas' {Framework_Retornos},
 // Daruma_Framework_FIMFD_DownloadDaMfd in 'Daruma_Fiscal\Daruma\Daruma_Framework_FIMFD_DownloadDaMfd.pas' {Framework_FIMFD_DownloadDaMfd},
///  Daruma_Framework_FIMFD_TerminaFechamentoCodigoBarras in 'Daruma_Fiscal\Daruma\Daruma_Framework_FIMFD_TerminaFechamentoCodigoBarras.pas' {Framework_FIMFD_TerminaFechamentoCupomCodigoBarras},
//  Daruma_Framework_MetodosExclusivosFS2000 in 'Daruma_Fiscal\Daruma\Daruma_Framework_MetodosExclusivosFS2000.pas' {Framework_MetodosExclusivosFS2000},
//  Daruma_Framework_DescontoSobreItemVendido in 'Daruma_Fiscal\Daruma\Daruma_Framework_DescontoSobreItemVendido.pas' {Framework_DescontoSobreItemVendido};
 // Daruma_Framework_EsperarArquivo in 'Daruma_Fiscal\Daruma\Daruma_Framework_EsperarArquivo.pas' {Framework_EsperarArquivo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'CP - Loja';
  frmFormSplash := TfrmFormSplash.Create(Application);
  frmFormSplash.Show;
  frmFormSplash.Refresh;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmModule, dmModule);
  Application.CreateForm(TfrmLocalEstocagem, frmLocalEstocagem);
  Application.CreateForm(TfrmGrupoeSubgrupo, frmGrupoeSubgrupo);
  Application.CreateForm(TfrmFornecedores, frmFornecedores);
  Application.CreateForm(TfrmBuscaProdutos, frmBuscaProdutos);
  Application.CreateForm(TfrmRelClientes, frmRelClientes);
  Application.CreateForm(TfrmRelProd, frmRelProd);
  Application.CreateForm(TfrmVendasLoja, frmVendasLoja);
  Application.CreateForm(TfrmRecebeLoja, frmRecebeLoja);
  Application.CreateForm(TfrmRelEstoque, frmRelEstoque);
  Application.CreateForm(TfrmFluxoCxP, frmFluxoCxP);
  Application.CreateForm(TfrmRelFluxoCx, frmRelFluxoCx);
  Application.CreateForm(TfrmRelContasaReceber, frmRelContasaReceber);
  Application.CreateForm(TfrmRelContasPagar, frmRelContasPagar);
  Application.CreateForm(TfrmCodBarrasAdicional, frmCodBarrasAdicional);
  Application.CreateForm(TfrmRelCodBarrasAD, frmRelCodBarrasAD);
  Application.CreateForm(TfrmFuncSenha, frmFuncSenha);
  Application.CreateForm(TfrmRelPedOrcamento, frmRelPedOrcamento);
  Application.CreateForm(TfrmManutCx, frmManutCx);
  Application.CreateForm(TfrmBuscaClientes, frmBuscaClientes);
  Application.CreateForm(TfrmRelQtdeVendida, frmRelQtdeVendida);
  Application.CreateForm(TfrmProdutosVendidos, frmProdutosVendidos);
  Application.CreateForm(TfrmFluxoDetalhado, frmFluxoDetalhado);
  Application.CreateForm(TfrmFormSplash, frmFormSplash);
  Application.CreateForm(TfrmRelEstoqueFornecedor, frmRelEstoqueFornecedor);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TfrmDadosEmpresa, frmDadosEmpresa);
  Application.CreateForm(TfrmConfiguracoes, frmConfiguracoes);
  Application.CreateForm(TfrmSenhaCx, frmSenhaCx);
 // Application.CreateForm(TfrmContasaReceber, frmContasaReceber);
  Application.CreateForm(TfrmRelTotalFluxo, frmRelTotalFluxo);
  Application.CreateForm(TfrmProd_MPrima, frmProd_MPrima);
  Application.CreateForm(TfrmUnidVenda, frmUnidVenda);
  Application.CreateForm(TfrmRelTblPreco, frmRelTblPreco);
  Application.CreateForm(TfrmTblPrecoForn, frmTblPrecoForn);
  Application.CreateForm(TfrmContasApagar, frmContasApagar);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmCondpagto, frmCondpagto);
  Application.CreateForm(TfrmRelEstoqueMin, frmRelEstoqueMin);
//  Application.CreateForm(TFramework_Autenticar, Framework_Autenticar);
 // Application.CreateForm(TFramework_DUAL_ImprimirTexto, Framework_DUAL_ImprimirTexto);
//  Application.CreateForm(TFramework_Exemplo_DUAL_01, Framework_Exemplo_DUAL_01);
 // Application.CreateForm(TFramework_Exemplo_DUAL_02, Framework_Exemplo_DUAL_02);
//  Application.CreateForm(TFramework_Impressora_Dual, Framework_Impressora_Dual);
 // Application.CreateForm(TFramework_LoopingVerificacaoStatus, Framework_LoopingVerificacaoStatus);
 // Application.CreateForm(TFramework_LoopingVerificacaoStatusDoc, Framework_LoopingVerificacaoStatusDoc);
  Application.CreateForm(TfrmRelCRCartao, frmRelCRCartao);
  Application.CreateForm(TfrmCRGeralP, frmCRGeralP);
  Application.CreateForm(TfrmSangria, frmSangria);
  Application.CreateForm(TfrmTblPreco, frmTblPreco);
  Application.CreateForm(TfrmEstoqueRapido, frmEstoqueRapido);
  Application.CreateForm(TfrmCores, frmCores);
  Application.CreateForm(TfrmTamanho, frmTamanho);
  Application.CreateForm(TfrmEstoqueMForn, frmEstoqueMForn);
  Application.CreateForm(TfrmProdDataRegistro, frmProdDataRegistro);
  Application.CreateForm(TfrmRelProdDataCad, frmRelProdDataCad);
  Application.CreateForm(TfrmContasaPagarP, frmContasaPagarP);
  Application.CreateForm(TfrmVendasDetalhado, frmVendasDetalhado);
  Application.CreateForm(TfrmRelFluxoDetalhado, frmRelFluxoDetalhado);
  Application.CreateForm(TfrmTrocaMercadoria, frmTrocaMercadoria);
  Application.CreateForm(TfrmVendasFunc, frmVendasFunc);
  Application.CreateForm(TfrmSenha, frmSenha);
  Application.CreateForm(TfrmEtiquetas6087Ref, frmEtiquetas6087Ref);
  Application.CreateForm(TfrmEtiquetasPimaco6087, frmEtiquetasPimaco6087);
  Application.CreateForm(TfrmEtiquetasPimaco6089, frmEtiquetasPimaco6089);
  Application.CreateForm(TfrmEtiquetasLoja, frmEtiquetasLoja);
  Application.CreateForm(TfrmFluxoPrecoA, frmFluxoPrecoA);
  Application.CreateForm(TfrmRelFluxoPrecoD, frmRelFluxoPrecoD);
  Application.CreateForm(TfrmRelFluxoPrecoB, frmRelFluxoPrecoB);
  Application.CreateForm(TfrmRelFluxoPrecoC, frmRelFluxoPrecoC);
  Application.CreateForm(TfrmCRPeriodo, frmCRPeriodo);
  Application.CreateForm(TfrmRelCRBaixado, frmRelCRBaixado);
  Application.CreateForm(TfrmRelCPBaixado, frmRelCPBaixado);
  Application.CreateForm(TfrmRelCustoDiario, frmRelCustoDiario);
  Application.CreateForm(TfrmEtiquetasNome6089, frmEtiquetasNome6089);
  Application.CreateForm(TfrmRelPedido, frmRelPedido);
  Application.CreateForm(TfrmPedidoFunc, frmPedidoFunc);
  Application.CreateForm(TfrmFluxoPedVenda, frmFluxoPedVenda);
  Application.CreateForm(TfrmRelRecibo, frmRelRecibo);
  Application.CreateForm(TfrmPedidosLoja, frmPedidosLoja);
  Application.CreateForm(TfrmVendasFornecedor, frmVendasFornecedor);
  Application.CreateForm(TfrmRelatFluxoTroca, frmRelatFluxoTroca);
  Application.CreateForm(Tfrm_TrocaP, frm_TrocaP);
  Application.CreateForm(TfrmRelPedDetalhado, frmRelPedDetalhado);
  Application.CreateForm(TfrmRProdutos, frmRProdutos);
  Application.CreateForm(TfrmRClientes, frmRClientes);
  Application.CreateForm(TfrmRelPendente, frmRelPendente);
  Application.CreateForm(TfrmBackup, frmBackup);
  Application.CreateForm(TfrmServicosCPagar, frmServicosCPagar);
  Application.CreateForm(TfrmEtiquetaGr, frmEtiquetaGr);
  Application.CreateForm(TfrmConfigEtiquetaGr, frmConfigEtiquetaGr);
  Application.CreateForm(TfrmRelPendentePedido, frmRelPendentePedido);
  Application.CreateForm(TfrmInstrucoesCaixa, frmInstrucoesCaixa);
 // Application.CreateForm(TfrmPedidodeVenda, frmPedidodeVenda);
  Application.CreateForm(TfrmVendasCupom, frmVendasCupom);
  Application.CreateForm(TfrmRelatVendaCupom, frmRelatVendaCupom);
  Application.CreateForm(TfrmCotacao, frmCotacao);
  Application.CreateForm(TfrmSenhaAlteracaoProd, frmSenhaAlteracaoProd);
  Application.CreateForm(TfrmEntradadeEstoque, frmEntradadeEstoque);
  Application.CreateForm(TfrmGravarCP, frmGravarCP);
  Application.CreateForm(TfrmREtiquetasLoja, frmREtiquetasLoja);
  Application.CreateForm(TfrmEtiquetasLojaR, frmEtiquetasLojaR);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCupomVenda, frmCupomVenda);
  Application.CreateForm(TfrmEtiquetaTermica, frmEtiquetaTermica);
  Application.CreateForm(TfrmRProdFornecedor, frmRProdFornecedor);
  Application.CreateForm(TfrmNFPaulista, frmNFPaulista);
 // Application.CreateForm(TFR_FISCAL_iCFAbrir_ECF_Daruma, FR_FISCAL_iCFAbrir_ECF_Daruma);
// Application.CreateForm(TFR_MenuImpressoraFiscal_Principal, FR_MenuImpressoraFiscal_Principal);
// Application.CreateForm(TFR_FISCAL_iCFVender_ECF_Daruma, FR_FISCAL_iCFVender_ECF_Daruma);
 // Application.CreateForm(TFR_FISCAL_iCFVenderSemDesc_ECF_Daruma, FR_FISCAL_iCFVenderSemDesc_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFVenderResumido_ECF_Daruma, FR_FISCAL_iCFVenderResumido_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFLancarAcrescimoItem_ECF_Daruma, FR_FISCAL_iCFLancarAcrescimoItem_ECF_Daruma);
// Application.CreateForm(TFR_FISCAL_iCFLancarDescontoItem_ECF_Daruma, FR_FISCAL_iCFLancarDescontoItem_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFLancarDescontoUltimoItem_ECF_Daruma, FR_FISCAL_iCFLancarDescontoUltimoItem_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFLancarAcrescimoUltimoItem_ECF_Daruma, FR_FISCAL_iCFLancarAcrescimoUltimoItem_ECF_Daruma);
 // Application.CreateForm(TFR_FISCAL_iCFCancelarItem_ECF_Daruma, FR_FISCAL_iCFCancelarItem_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFCancelarItemParcial_ECF_Daruma, FR_FISCAL_iCFCancelarItemParcial_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFCancelarUltimoItemParcial_ECF_Daruma, FR_FISCAL_iCFCancelarUltimoItemParcial_ECF_Daruma);
 // Application.CreateForm(TFR_FISCAL_iCFEfetuarPagamentoFormatado_ECF_Daruma, FR_FISCAL_iCFEfetuarPagamentoFormatado_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFEfetuarPagamento_ECF_Daruma, FR_FISCAL_iCFEfetuarPagamento_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFEncerrarConfigMsg_ECF_Daruma, FR_FISCAL_iCFEncerrarConfigMsg_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCFIdentificarConsumidor_ECF_Daruma, FR_FISCAL_iCFIdentificarConsumidor_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_rLeituraXCustomizada_ECF_Daruma, FR_FISCAL_rLeituraXCustomizada_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iSangria_ECF_Daruma, FR_FISCAL_iSangria_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iSuprimento_ECF_Daruma, FR_FISCAL_iSuprimento_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iMFLer_ECF_Daruma, FR_FISCAL_iMFLer_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iMFLerSerial_ECF_Daruma, FR_FISCAL_iMFLerSerial_ECF_Daruma);
// Application.CreateForm(TFR_FISCAL_iRGImprimirTexto_ECF_Daruma, FR_FISCAL_iRGImprimirTexto_ECF_Daruma);
 // Application.CreateForm(TFR_FISCAL_iRGAbrir_ECF_Daruma, FR_FISCAL_iRGAbrir_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iRGAbrirIndice_ECF_Daruma, FR_FISCAL_iRGAbrirIndice_ECF_Daruma);
//  Application.CreateForm(TFR_FISCAL_iCCDImprimirTexto_ECF_Daruma, FR_FISCAL_iCCDImprimirTexto_ECF_Daruma);
 // Application.CreateForm(TFR_FISCAL_iCCDAbrir_ECF_Daruma, FR_FISCAL_iCCDAbrir_ECF_Daruma);
 { Application.CreateForm(TFR_FISCAL_iCCDAbrirSimplificado_ECF_Daruma, FR_FISCAL_iCCDAbrirSimplificado_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCCDEstornar_ECF_Daruma, FR_FISCAL_iCCDEstornar_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_RetornoECF, FR_FISCAL_RetornoECF);
  Application.CreateForm(TFR_FISCAL_rRetornarNumeroSerieCodificado_ECF_Daruma, FR_FISCAL_rRetornarNumeroSerieCodificado_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rRetornarInformacao_ECF_Daruma, FR_FISCAL_rRetornarInformacao_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rRetornarInformacaoSeparador_ECF_Daruma, FR_FISCAL_rRetornarInformacaoSeparador_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFAbrir_ECF_Daruma, FR_FISCAL_iCNFAbrir_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFReceberSemDesc_ECF_Daruma, FR_FISCAL_iCNFReceberSemDesc_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFCancelarItem_ECF_Daruma, FR_FISCAL_iCNFCancelarItem_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFCancelarDescontoItem_ECF_Daruma, FR_FISCAL_iCNFCancelarDescontoItem_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFCancelarAcrescimoItem_ECF_Daruma, FR_FISCAL_iCNFCancelarAcrescimoItem_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFTotalizarComprovante_ECF_Daruma, FR_FISCAL_iCNFTotalizarComprovante_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFEfetuarPagamento_ECF_Daruma, FR_FISCAL_iCNFEfetuarPagamento_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFEfetuarPagamentoFormatado_ECF_Daruma, FR_FISCAL_iCNFEfetuarPagamentoFormatado_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFEncerrar_ECF_Daruma, FR_FISCAL_iCNFEncerrar_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCNFReceber_ECF_Daruma, FR_FISCAL_iCNFReceber_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCFBPVender_ECF_Daruma, FR_FISCAL_iCFBPVender_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCFBPAbrir_ECF_Daruma, FR_FISCAL_iCFBPAbrir_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_confCFBPProgramarUF_ECF_Daruma, FR_FISCAL_confCFBPProgramarUF_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_confCadastrarPadrao_ECF_Daruma, FR_FISCAL_confCadastrarPadrao_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rGerarEspelhoMFD_ECF_Daruma, FR_FISCAL_rGerarEspelhoMFD_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCFEncerrar_ECF_Daruma, FR_FISCAL_iCFEncerrar_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rStatusImpressora_ECF_Daruma, FR_FISCAL_rStatusImpressora_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_confCadastrar_ECF_Daruma, FR_FISCAL_confCadastrar_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_confProgramarAvancoPapel_ECF_Daruma, FR_FISCAL_confProgramarAvancoPapel_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_confProgramarOperador_ECF_Daruma, FR_FISCAL_confProgramarOperador_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rGerarRelatorio, FR_FISCAL_rGerarRelatorio);
  Application.CreateForm(TFR_FISCAL_ParametrizacaoSintegra, FR_FISCAL_ParametrizacaoSintegra);
  Application.CreateForm(TFR_FISCAL_rGerarRelatorioOffline, FR_FISCAL_rGerarRelatorioOffline);
  Application.CreateForm(TFR_FISCAL_eAcionarGuilhotina_ECF_Daruma, FR_FISCAL_eAcionarGuilhotina_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iImprimirCodigoBarras_ECF_Daruma, FR_FISCAL_iImprimirCodigoBarras_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rLerAliquotas_ECF_Daruma, FR_FISCAL_rLerAliquotas_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rLerMeiosPagto_ECF_Daruma, FR_FISCAL_rLerMeiosPagto_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rLerRG_ECF_Daruma, FR_FISCAL_rLerRG_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_AssinarRSA_ECF_Daruma, FR_FISCAL_AssinarRSA_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rCalcularMD5_ECF_Daruma, FR_FISCAL_rCalcularMD5_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_confProgramarIDLoja_ECF_Daruma, FR_FISCAL_confProgramarIDLoja_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rRetornarGTCodificado_ECF_Daruma, FR_FISCAL_rRetornarGTCodificado_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rVerificarGTCodificado_ECF_Daruma, FR_FISCAL_rVerificarGTCodificado_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rVerificarNumeroSerieCodificado_ECF_Daruma, FR_FISCAL_rVerificarNumeroSerieCodificado_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_eDefinirProduto_Daruma, FR_FISCAL_eDefinirProduto_Daruma);
  Application.CreateForm(TFR_FISCAL_eDefinirModoRegistro_Daruma, FR_FISCAL_eDefinirModoRegistro_Daruma);
  Application.CreateForm(TFR_FISCAL_TestedeVendadeItensSemPararBuferizan, FR_FISCAL_TestedeVendadeItensSemPararBuferizan);
  Application.CreateForm(TFR_FISCAL_Teste_Consumo_MFD, FR_FISCAL_Teste_Consumo_MFD);
  Application.CreateForm(TFR_FISCAL_MENUFISCAL_LMFC, FR_FISCAL_MENUFISCAL_LMFC);
  Application.CreateForm(TFR_FISCAL_MENUFISCAL_LMFS, FR_FISCAL_MENUFISCAL_LMFS);
  Application.CreateForm(TFR_FISCAL_MENUFISCAL_ArqMFD, FR_FISCAL_MENUFISCAL_ArqMFD);
  Application.CreateForm(TFR_FISCAL_MENU_FISCAL_Info, FR_FISCAL_MENU_FISCAL_Info);
  Application.CreateForm(TFR_FISCAL_iEstornarPagamento_ECF_Daruma, FR_FISCAL_iEstornarPagamento_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iTEF_ImprimirRespostaCartao_ECF_Daruma, FR_FISCAL_iTEF_ImprimirRespostaCartao_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iTEF_ImprimirResposta_ECF_Daruma, FR_FISCAL_iTEF_ImprimirResposta_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_eTEF_EsperarArquivo_ECF_Daruma, FR_FISCAL_eTEF_EsperarArquivo_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_eRSAAssinarArquivo_ECF_Daruma, FR_FISCAL_eRSAAssinarArquivo_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_rRSARetornaChavePublica_ECF_Daruma, FR_FISCAL_rRSARetornaChavePublica_ECF_Daruma);
  Application.CreateForm(TFR_FS2100_iChequeImprimir, FR_FS2100_iChequeImprimir);
  Application.CreateForm(TFR_FISCAL_eCarregarBitmapPromocional_ECF_Daruma, FR_FISCAL_eCarregarBitmapPromocional_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_eMemoriaFiscal_ECF_Daruma, FR_FISCAL_eMemoriaFiscal_ECF_Daruma);
  Application.CreateForm(TFR_ComunicacaoSerial, FR_ComunicacaoSerial);
  Application.CreateForm(TFR_iCNFReceber_ECF_Daruma, FR_iCNFReceber_ECF_Daruma);
  Application.CreateForm(TFR_FISCAL_iCFTotalizarCupom, FR_FISCAL_iCFTotalizarCupom);
  Application.CreateForm(TFR_FISCAL_rGerarMF, FR_FISCAL_rGerarMF);
  Application.CreateForm(TFR_FISCAL_rGerarMFD, FR_FISCAL_rGerarMFD);
  Application.CreateForm(TFR_FISCAL_rGerarNFP, FR_FISCAL_rGerarNFP);
  Application.CreateForm(TFR_FISCAL_rGerarSPED, FR_FISCAL_rGerarSPED);
  Application.CreateForm(TFR_FISCAL_rGerarTDM, FR_FISCAL_rGerarTDM);
  Application.CreateForm(TFR_FISCAL_rGerarSINTEGRA, FR_FISCAL_rGerarSINTEGRA); }
  Application.CreateForm(TfrmCadFormasPagto, frmCadFormasPagto);
  Application.CreateForm(TfrmVendaCupomModR, frmVendaCupomModR);
  Application.CreateForm(TfrmREtiquetaZebra, frmREtiquetaZebra);
  Application.CreateForm(TfrmRPedOrcObs, frmRPedOrcObs);
  Application.CreateForm(TfrmEtiquetasNome, frmEtiquetasNome);
  Application.CreateForm(TfrmFluxoVendasCaixa, frmFluxoVendasCaixa);
  Application.CreateForm(TfrmREtiquetasLoja, frmREtiquetasLoja);
  Application.CreateForm(TfrmR_Orc, frmR_Orc);
  Application.CreateForm(TfrmGrupoSubGrupoEstoqueRelat, frmGrupoSubGrupoEstoqueRelat);
  Application.CreateForm(TfrmGrupoSubGrupoEstoqueRelat, frmGrupoSubGrupoEstoqueRelat);
  Application.Run;
end.
