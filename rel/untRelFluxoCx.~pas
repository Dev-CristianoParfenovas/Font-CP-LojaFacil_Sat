unit untRelFluxoCx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart,
  Series, TeeFunci, DB, IBDatabase, IBCustomDataSet, IBQuery, IniFiles;

type
  TfrmRelFluxoCx = class(TForm)
    qrpFluxoCx: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlProd: TQRLabel;
    qrl_Qtde: TQRLabel;
    qrl_VlrUnit: TQRLabel;
    qrl_VltTotal: TQRLabel;
    qrl_Data: TQRLabel;
    qrdbProd: TQRDBText;
    qrdbVlrUnit: TQRDBText;
    qrdbQtde: TQRDBText;
    qrdbVlrA: TQRDBText;
    qrdbData: TQRDBText;
    qrl_PrecoB: TQRLabel;
    qrl_PrecoC: TQRLabel;
    qrdbVlrB: TQRDBText;
    qrdbVlrC: TQRDBText;
    qrlDesc: TQRLabel;
    qrdbDesc: TQRDBText;
    SummaryBand1: TQRBand;
    qrlDescVendas: TQRLabel;
    qrlTotalVendido: TQRLabel;
    qrpValor: TQRExpr;
    qrlAcresc: TQRLabel;
    qrdbComissaoC: TQRDBText;
    qrlTotalAcresc: TQRLabel;
    QRExpr1: TQRExpr;
    qrlTotalRecebido: TQRLabel;
    qrl_Mais: TQRLabel;
    qrl_Sub: TQRLabel;
    qrl_Igual: TQRLabel;
    QRShape1: TQRShape;
    qrlFuncionarioComissao: TQRLabel;
    qrl_PrecoD: TQRLabel;
    qrdbComissao: TQRDBText;
    qrl_DataInicio: TQRLabel;
    qrl_DataIni: TQRLabel;
    qrl_DataFinal: TQRLabel;
    qrl_DataF: TQRLabel;
    qrl_APagar: TQRLabel;
    qrl_TotalaPagar: TQRLabel;
    qrl_Saida: TQRLabel;
    qrl_TotalSaida: TQRLabel;
    QRShape2: TQRShape;
    qrl_AReceber: TQRLabel;
    qrl_PagtoPendente: TQRLabel;
    QRLabel4: TQRLabel;
    qrl_VendaCartoes: TQRLabel;
    qrl_VendaChPre: TQRLabel;
    qrl_TotalPen: TQRLabel;
    qrl_TotalaReceber: TQRLabel;
    qrl_TotalPagtoPendente: TQRLabel;
    qrl_TotalVendas: TQRLabel;
    qrl_TotalCartaoCredito: TQRLabel;
    qrl_TotalCartaoDebito: TQRLabel;
    qrl_TotalPendente: TQRLabel;
    qrl_Entrada: TQRLabel;
    qrl_TotalEntrada: TQRLabel;
    qrl_Liquido: TQRLabel;
    qrl_TotalLiquido: TQRLabel;
    QRShape3: TQRShape;
    qrl_NCupom: TQRLabel;
    qrdbNCupom: TQRDBText;
    qrl_Sangria: TQRLabel;
    qrl_TotalSangria: TQRLabel;
    qrsysdataPagina: TQRSysData;
    QRLabel2: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrexp_PrecoC: TQRExpr;
    QRExpr4: TQRExpr;
    qrl_Descontos: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel7: TQRLabel;
    qrl_TotalCheque: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    qrl_TotalDesc: TQRLabel;
    qrl_TotalCx: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFluxoCx: TfrmRelFluxoCx;
  ConfigSiS : TIniFile;
  PathSistema : String;
  
implementation

uses untdmModule, untFluxoCxP;

{$R *.dfm}

procedure TfrmRelFluxoCx.FormShow(Sender: TObject);
begin

  with dmModule do begin

    with ConfigSiS do begin

      ConfigSiS := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Data\RunTime\sis.ini'); //Cria o vinculo com o Arquivo ini

        with dmModule do begin

          frmRelFluxoCx.Caption := ReadString('ConfigSiS','Titulo','');
          dmModule.IBDGERAL.DatabaseName := ReadString('ConfigSiS','Banco','') + '\LOJA.fdb'; //Faz a leitura de uma String na seção do arquivo ini
          dmModule.IBDGERAL.Params.Add('user_name=SYSDBA');
          dmModule.IBDGERAL.Params.Add('password=masterkey');
          dmModule.IBDGERAL.Connected := True; //Manda Conectar o Banco de Dados

        end;

    end;

    if frmFluxoCxP.Showing Then begin

    frmFluxoCxP.ibeaOkClick(Sender)

    {if frmFluxoCxP.rbGeral.Checked Then begin

    //  Commit(ibServsVenda);
      ibVendas.Close;
      ibVendas.SQL.Clear;
      ibVendas.SQL.Add('SELECT TBLSERVICOSVENDAS.IDPROD,TBLSERVICOSVENDAS.IDSERVSVENDA,TBLSERVICOSVENDAS.ESTOQUE,'
      + 'TBLSERVICOSVENDAS.QTDE,TBLSERVICOSVENDAS.HORA,TBLSERVICOSVENDAS.VLRUNIT,TBLSERVICOSVENDAS.VLRTOTAL,TBLSERVICOSVENDAS.DATA,'
      + 'TBLSERVICOSVENDAS.TIPOCOMPR,TBLSERVICOSVENDAS.TIPOVENDA,TBLSERVICOSVENDAS.VALORB,TBLSERVICOSVENDAS.TOTALCUSTO,'
      + 'TBLSERVICOSVENDAS.VALORC,TBLSERVICOSVENDAS.DESCONTO,TBLSERVICOSVENDAS.ACRESCIMO,TBLTIPOCOMPROMISSO.NOME As Compromisso,'
      + 'CADPRODUTOS.NOME As Produto FROM TBLSERVICOSVENDAS '
      + 'LEFT OUTER JOIN TBLTIPOCOMPROMISSO ON TBLSERVICOSVENDAS.TIPOCOMPR=TBLTIPOCOMPROMISSO.IDTIPO '
   //   + 'LEFT OUTER JOIN TBLTIPOPRODUTO ON TBLSERVICOSVENDAS.IDTIPOPROD=TBLTIPOPRODUTO.IDTIPOPROD '
      + 'LEFT OUTER JOIN CADPRODUTOS ON TBLSERVICOSVENDAS.IDPROD=CADPRODUTOS.IDPROD '
      + 'WHERE (DATA between :ParamDataInicial and :ParamDataFinal)');
      ibVendas.Open;

      ibVendas.Close;
      ibVendas.ParamByName('ParamDataInicial').Value := frmFluxoCxP.dtpDataIniGeral.DateTime;
      ibVendas.ParamByName('ParamDataFinal').Value := frmFluxoCxP.dtpDataFimGeral.DateTime;
      ibVendas.Open;}

    end;//if 

  end;//with

end;

procedure TfrmRelFluxoCx.FormCreate(Sender: TObject);
begin
  PathSistema := ExtractFilePath(ParamStr(0));

end;

end.
