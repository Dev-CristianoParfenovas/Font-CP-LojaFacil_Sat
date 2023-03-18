unit untPosVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Printers, PrnDOS, 
  classComboBox, IBQuery, Menus, Buttons,
  ACBrBase, ACBrECF, Data.DB;

type
  TfrmPosVenda = class(TForm)
    dbgPosVenda: TDBGrid;
    lbl_edtCodCartao: TLabeledEdit;
    lbl_edtCodBarras: TLabeledEdit;
    cboProd: TComboBox;
    lbl_Prod: TLabel;
    lbl_edtQtde: TLabeledEdit;
    lbl_edtVlrUnit: TLabeledEdit;
    lbl_edtVlrTotal: TLabeledEdit;
    cboFunc: TComboBox;
    lbl_Vendedor: TLabel;
    lbl_edtNomerazao: TLabeledEdit;
    lbl_edtCnpj_cpf: TLabeledEdit;
    lbl_edtIE_rg: TLabeledEdit;
    lbl_edtEndereco: TLabeledEdit;
    lbl_edtNumero: TLabeledEdit;
    lbl_edtComplemento: TLabeledEdit;
    lbl_edtBairro: TLabeledEdit;
    lbl_edtCep: TLabeledEdit;
    lbl_edtTelCom: TLabeledEdit;
    lbl_edtCelular: TLabeledEdit;
    lbl_edtCodProd: TLabeledEdit;
    lbl_edtNumPedido: TLabeledEdit;
    lbl_edtCodCli: TLabeledEdit;
    lbl_F1: TLabel;
    lbl_F2: TLabel;
    lbl_F4: TLabel;
    lbl_edtTotalGeral: TLabeledEdit;
    lbl_F3: TLabel;
    lbl_F5: TLabel;
    lbl_F6: TLabel;
    lbl_F7: TLabel;
    lbl_F8: TLabel;
    lbl_F9: TLabel;
    lbl_Informacao: TLabel;
    MainMenu1: TMainMenu;
    Venda1: TMenuItem;
    Venda2: TMenuItem;
    Orcamento1: TMenuItem;
    Sair1: TMenuItem;
    lbl_CtrlS: TLabel;
    lbl_Sair: TLabel;
    dbgOrcamento: TDBGrid;
    lbl_Vendas: TLabel;
    lbl_Orcamento: TLabel;
    lbl_F10: TLabel;
    Devolucao1: TMenuItem;
    CodigodeBarras1: TMenuItem;
    ibeaExcluir: TSpeedButton;
    ibeaConsulta: TSpeedButton;
    ibeaConsultaCli: TSpeedButton;
    ibeaSair: TSpeedButton;
    ibeaCadCli: TSpeedButton;
    ibeaIncluir: TSpeedButton;
    lbl_QtdeEstoque: TLabel;
    lbl_edtNOrc: TLabeledEdit;
    ImprimeOrcamento1: TMenuItem;
    Label1: TLabel;
    LimpaOrcamento1: TMenuItem;
    Label2: TLabel;
    DeletarOrcamento1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    BuscarOrcamento1: TMenuItem;
    lbl_edtFoneOrc: TLabeledEdit;
    Label5: TLabel;
    BuscarOramentoportelefone1: TMenuItem;
    lbl_edtQtdeItens: TLabeledEdit;
    lbl_edtDesconto: TLabeledEdit;
    lbl_edtIDPosVenda: TLabeledEdit;
    imgFundoCx: TImage;
    ComboBox1: TComboBox;
    PrintDialog1: TPrintDialog;
    lbl_Imprimir: TLabel;
    ACBrECF1: TACBrECF;
    lbl_edtPorcentagemDesc: TLabeledEdit;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses untdmModule, funcPosto, uBuscaProdutos, BuscaClientes;

{$R *.dfm}



end.

