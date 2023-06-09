unit untConfigNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Printers, IBQuery;

type
  TfrmConfigNota = class(TForm)
    lbl_edtNNotaHoriz: TLabeledEdit;
    lbl_edtNNotaVert: TLabeledEdit;
    lbl_edtSaidaHoriz: TLabeledEdit;
    lbl_edtSaidaVert: TLabeledEdit;
    lbl_edtEntradaHoriz: TLabeledEdit;
    lbl_edtEntradaVert: TLabeledEdit;
    lbl_edtNomeNatHoriz: TLabeledEdit;
    lbl_edtNomeNatVert: TLabeledEdit;
    lbl_edtCodNatHoriz: TLabeledEdit;
    lbl_edtCodNatVert: TLabeledEdit;
    lbl_edtInscEstSistTribHoriz: TLabeledEdit;
    lbl_edtInscEstSistTribVert: TLabeledEdit;
    lbl_edtNomeCliHoriz: TLabeledEdit;
    lbl_edtNomeCliVert: TLabeledEdit;
    lbl_edtCnpjHoriz: TLabeledEdit;
    lbl_edtCnpjVert: TLabeledEdit;
    lbl_edtDataEmissaoHoriz: TLabeledEdit;
    lbl_edtDataEmissaoVert: TLabeledEdit;
    lbl_edtEndCliHoriz: TLabeledEdit;
    lbl_edtEndCliVert: TLabeledEdit;
    lbl_edtBairroCliHoriz: TLabeledEdit;
    lbl_edtBairroCliVert: TLabeledEdit;
    lbl_edtDataSaideEntrHoriz: TLabeledEdit;
    lbl_edtDataSaideEntrVert: TLabeledEdit;
    lbl_edtMunicHoriz: TLabeledEdit;
    lbl_edtMunicVert: TLabeledEdit;
    lbl_edtFonecliHoriz: TLabeledEdit;
    lbl_edtFonecliVert: TLabeledEdit;
    lbl_edtUFHoriz: TLabeledEdit;
    lbl_edtUFVert: TLabeledEdit;
    lbl_edtIEHoriz: TLabeledEdit;
    lbl_edtIEVert: TLabeledEdit;
    lbl_edtHoraSaidaHoriz: TLabeledEdit;
    lbl_edtHoraSaidaVert: TLabeledEdit;
    lbl_edtNFaturaHoriz: TLabeledEdit;
    lbl_edtNFaturaVert: TLabeledEdit;
    lbl_edtVctoHoriz: TLabeledEdit;
    lbl_edtVctoVert: TLabeledEdit;
    lbl_edtValorHoriz: TLabeledEdit;
    lbl_edtValorVert: TLabeledEdit;
    lbl_edtCodProdHoriz: TLabeledEdit;
    lbl_edtCodProdVert: TLabeledEdit;
    lbl_edtNomeProdHoriz: TLabeledEdit;
    lbl_edtNomeProdVert: TLabeledEdit;
    lbl_edtQtdeCol: TLabeledEdit;
    lbl_edtQtdeLinh: TLabeledEdit;
    lbl_edtVlrUnitHoriz: TLabeledEdit;
    lbl_edtVlrUnitVert: TLabeledEdit;
    lbl_edtVlrTotalHoriz: TLabeledEdit;
    lbl_edtVlrTotalVert: TLabeledEdit;
    lbl_edtTotalProdHoriz: TLabeledEdit;
    lbl_edtTotalProdVert: TLabeledEdit;
    lbl_edtTotalNFHoriz: TLabeledEdit;
    lbl_edtTotalNFVert: TLabeledEdit;
    lbl_edtTranspHoriz: TLabeledEdit;
    lbl_edtTranspVert: TLabeledEdit;
    lbl_edtFreteContaHoriz: TLabeledEdit;
    lbl_edtFreteContaVert: TLabeledEdit;
    lbl_edtEndTranspHoriz: TLabeledEdit;
    lbl_edtEndTranspVert: TLabeledEdit;
    lbl_edtQuantidadeHoriz: TLabeledEdit;
    lbl_edtQuantidadeVert: TLabeledEdit;
    lbl_edtEspecieHoriz: TLabeledEdit;
    lbl_edtEspecieVert: TLabeledEdit;
    lbl_edtPBrutoHoriz: TLabeledEdit;
    lbl_edtPBrutoVert: TLabeledEdit;
    lbl_edtPLiqHoriz: TLabeledEdit;
    lbl_edtPLiqVert: TLabeledEdit;
    lbl_edtDadosAdHoriz: TLabeledEdit;
    lbl_edtDadosAdVert: TLabeledEdit;
    lbl_edtCepCliHoriz: TLabeledEdit;
    lbl_edtCepCliVert: TLabeledEdit;
    lbl_edtNNotaCanhotoCol: TLabeledEdit;
    lbl_edtNNotaCanhotoLinh: TLabeledEdit;
    lbl_edtVctoParcCol: TLabeledEdit;
    lbl_edtVctoParcLinh: TLabeledEdit;
    lbl_edtVlrParcCol: TLabeledEdit;
    lbl_edtVlrParcLinh: TLabeledEdit;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTConfiguracao;
    procedure GravaConfig;
    procedure ibeaIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigNota: TfrmConfigNota;

implementation

uses untdmModule, DB;

{$R *.dfm}

procedure TfrmConfigNota.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConfigNota.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmConfigNota.ExecSELECTConfiguracao;

begin

  with dmModule do begin

    Commit(ibConfigNota);
    ibConfigNota.Close;
    ibConfigNota.SQL.Clear;
    ibConfigNota.SQL.Add('SELECT * FROM TBLCONFIGNOTA');
    ibConfigNota.Open;

    lbl_edtNNotaHoriz.Text       := IntToStr(ibConfigNota.FieldByName('NUMERONOTAFISCALHORIZ').AsInteger);
    lbl_edtNNotaVert.Text        := IntToStr(ibConfigNota.FieldByName('NUMERONOTAFISCALVERT').AsInteger);
    lbl_edtEntradaHoriz.Text     := IntToStr(ibConfigNota.FieldByName('ENTRADANFHORIZ').AsInteger);
    lbl_edtEntradaVert.Text      := IntToStr(ibConfigNota.FieldByName('ENTRADANFVERT').AsInteger);
    lbl_edtSaidaHoriz.Text       := IntToStr(ibConfigNota.FieldByName('SAIDANFHORIZ').AsInteger);
    lbl_edtSaidaVert.Text        := IntToStr(ibConfigNota.FieldByName('SAIDANFVERT').AsInteger);
    lbl_edtNomeNatHoriz.Text     := IntToStr(ibConfigNota.FieldByName('NOMENATUREZAHORIZ').AsInteger);
    lbl_edtNomeNatVert.Text      := IntToStr(ibConfigNota.FieldByName('NOMENATUREZAVERT').AsInteger);
    lbl_edtCodNatHoriz.Text      := IntToStr(ibConfigNota.FieldByName('NATUREZACODHORIZ').AsInteger);
    lbl_edtCodNatVert.Text       := IntToStr(ibConfigNota.FieldByName('NATUREZACODVERT').AsInteger);
    lbl_edtNomeCliHoriz.Text     := IntToStr(ibConfigNota.FieldByName('CLIENTEHORIZ').AsInteger);
    lbl_edtNomeCliVert.Text      := IntToStr(ibConfigNota.FieldByName('CLIENTEVERT').AsInteger);
    lbl_edtCnpjHoriz.Text        := IntToStr(ibConfigNota.FieldByName('CNPJHORIZ').AsInteger);
    lbl_edtCnpjVert.Text         := IntToStr(ibConfigNota.FieldByName('CNPJVERT').AsInteger);
    lbl_edtDataEmissaoHoriz.Text := IntToStr(ibConfigNota.FieldByName('DATAEMISSAOHORIZ').AsInteger);
    lbl_edtDataEmissaoVert.Text  := IntToStr(ibConfigNota.FieldByName('DATAEMISSAOVERT').AsInteger);
    lbl_edtEndCliHoriz.Text      := IntToStr(ibConfigNota.FieldByName('ENDCLIENTEHORIZ').AsInteger);
    lbl_edtEndCliVert.Text       := IntToStr(ibConfigNota.FieldByName('ENDCLIENTEVERT').AsInteger);
    lbl_edtBairroCliHoriz.Text   := IntToStr(ibConfigNota.FieldByName('BAIRROCLIENTEHORIZ').AsInteger);
    lbl_edtBairroCliVert.Text    := IntToStr(ibConfigNota.FieldByName('BAIRROCLIENTEVERT').AsInteger);
    lbl_edtCepCliHoriz.Text      := IntToStr(ibConfigNota.FieldByName('CEPCLIENTEHORIZ').AsInteger);
    lbl_edtCepCliVert.Text       := IntToStr(ibConfigNota.FieldByName('CEPCLIENTEVERT').AsInteger);
    lbl_edtDataSaideEntrHoriz.Text := IntToStr(ibConfigNota.FieldByName('DATANFSAIDAENTRADAHORIZ').AsInteger);
    lbl_edtDataSaideEntrVert.Text  := IntToStr(ibConfigNota.FieldByName('DATANFSAIDAENTRADAVERT').AsInteger);
    lbl_edtMunicHoriz.Text         := IntToStr(ibConfigNota.FieldByName('MUNICIPIOCLIENTEHORIZ').AsInteger);
    lbl_edtMunicVert.Text          := IntToStr(ibConfigNota.FieldByName('MUNICIPIOCLIENTEVERT').AsInteger);
    lbl_edtFonecliHoriz.Text       := IntToStr(ibConfigNota.FieldByName('FONECLIENTEHORIZ').AsInteger);
    lbl_edtFonecliVert.Text        := IntToStr(ibConfigNota.FieldByName('FONECLIENTEVERT').AsInteger);
    lbl_edtUFHoriz.Text            := IntToStr(ibConfigNota.FieldByName('UFCLIENTEHORIZ').AsInteger);
    lbl_edtUFVert.Text             := IntToStr(ibConfigNota.FieldByName('UFCLIENTEVERT').AsInteger);
    lbl_edtIEHoriz.Text            := IntToStr(ibConfigNota.FieldByName('IECLIENTEHORIZ').AsInteger);
    lbl_edtIEVert.Text             := IntToStr(ibConfigNota.FieldByName('IECLIENTEVERT').AsInteger);
    lbl_edtNFaturaHoriz.Text       := IntToStr(ibConfigNota.FieldByName('NUMEROFATURAHORIZ').AsInteger);
    lbl_edtNFaturaVert.Text        := IntToStr(ibConfigNota.FieldByName('NUMEROFATURAVERT').AsInteger);
    lbl_edtVctoHoriz.Text          := IntToStr(ibConfigNota.FieldByName('DATAFATURAHORIZ').AsInteger);
    lbl_edtVctoVert.Text           := IntToStr(ibConfigNota.FieldByName('DATAFATURAVERT').AsInteger);
    lbl_edtValorHoriz.Text         := IntToStr(ibConfigNota.FieldByName('VLRFATURAHORIZ').AsInteger);
    lbl_edtValorVert.Text          := IntToStr(ibConfigNota.FieldByName('VLRFATURAVERT').AsInteger);
    lbl_edtCodProdHoriz.Text       := IntToStr(ibConfigNota.FieldByName('CODPRODHORIZ').AsInteger);
    lbl_edtCodProdVert.Text        := IntToStr(ibConfigNota.FieldByName('CODPRODVERT').AsInteger);
    lbl_edtNomeProdHoriz.Text      := IntToStr(ibConfigNota.FieldByName('NOMEPRODHORIZ').AsInteger);
    lbl_edtNomeProdVert.Text       := IntToStr(ibConfigNota.FieldByName('NOMEPRODVERT').AsInteger);
    lbl_edtQtdeCol.Text            := IntToStr(ibConfigNota.FieldByName('QTDEHORIZ').AsInteger);
    lbl_edtQtdeLinh.Text           := IntToStr(ibConfigNota.FieldByName('QTDEVERT').AsInteger);
    lbl_edtVlrUnitHoriz.Text       := IntToStr(ibConfigNota.FieldByName('VLRUNITHORIZ').AsInteger);
    lbl_edtVlrUnitVert.Text        := IntToStr(ibConfigNota.FieldByName('VLRUNITVERT').AsInteger);
    lbl_edtVlrTotalHoriz.Text      := IntToStr(ibConfigNota.FieldByName('VLRTOTALHORIZ').AsInteger);
    lbl_edtVlrTotalVert.Text       := IntToStr(ibConfigNota.FieldByName('VLRTOTALVERT').AsInteger);
    lbl_edtTotalProdHoriz.Text     := IntToStr(ibConfigNota.FieldByName('VLRTOTALPRODHORIZ').AsInteger);
    lbl_edtTotalProdVert.Text      := IntToStr(ibConfigNota.FieldByName('VLRTOTALPRODVERT').AsInteger);
    lbl_edtTotalNFHoriz.Text       := IntToStr(ibConfigNota.FieldByName('VLRTOTALNOTAHORIZ').AsInteger);
    lbl_edtTotalNFVert.Text        := IntToStr(ibConfigNota.FieldByName('VLRTOTALNOTAVERT').AsInteger);
    lbl_edtTranspHoriz.Text        := IntToStr(ibConfigNota.FieldByName('NOMETRANSPHORIZ').AsInteger);
    lbl_edtTranspVert.Text         := IntToStr(ibConfigNota.FieldByName('NOMETRANSPVERT').AsInteger);
    lbl_edtFreteContaHoriz.Text    := IntToStr(ibConfigNota.FieldByName('FRETECONTAHORIZ').AsInteger);
    lbl_edtFreteContaVert.Text     := IntToStr(ibConfigNota.FieldByName('FRETECONTAVERT').AsInteger);
    lbl_edtEndTranspHoriz.Text     := IntToStr(ibConfigNota.FieldByName('ENDTRANSPHORIZ').AsInteger);
    lbl_edtEndTranspVert.Text      := IntToStr(ibConfigNota.FieldByName('ENDTRANSPVERT').AsInteger);
    lbl_edtQuantidadeHoriz.Text    := IntToStr(ibConfigNota.FieldByName('QTDEITENSHORIZ').AsInteger);
    lbl_edtQuantidadeVert.Text     := IntToStr(ibConfigNota.FieldByName('QTDEITENSVERT').AsInteger);
    lbl_edtEspecieHoriz.Text       := IntToStr(ibConfigNota.FieldByName('ESPECIEHORIZ').AsInteger);
    lbl_edtEspecieVert.Text        := IntToStr(ibConfigNota.FieldByName('ESPECIEVERT').AsInteger);
    lbl_edtPBrutoHoriz.Text        := IntToStr(ibConfigNota.FieldByName('PESOBRUTOHORIZ').AsInteger);
    lbl_edtPBrutoVert.Text         := IntToStr(ibConfigNota.FieldByName('PESOBRUTOVERT').AsInteger);
    lbl_edtPLiqHoriz.Text          := IntToStr(ibConfigNota.FieldByName('PESOLIQHORIZ').AsInteger);
    lbl_edtPLiqVert.Text           := IntToStr(ibConfigNota.FieldByName('PESOLIQVERT').AsInteger);
    lbl_edtDadosAdHoriz.Text       := IntToStr(ibConfigNota.FieldByName('DADOSADHORIZ').AsInteger);
    lbl_edtDadosAdVert.Text        := IntToStr(ibConfigNota.FieldByName('DADOSADVERT').AsInteger);
    lbl_edtNNotaCanhotoCol.Text    := IntToStr(ibConfigNota.FieldByName('NUMERONOTACANHOTOCOL').AsInteger);
    lbl_edtNNotaCanhotoLinh.Text   := IntToStr(ibConfigNota.FieldByName('NUMERONOTACANHOTOLINH').AsInteger);
    lbl_edtVlrParcCol.Text         := IntToStr(ibConfigNota.FieldByName('VLRPARCELADOCOL').AsInteger);
    lbl_edtVlrParcLinh.Text        := IntToStr(ibConfigNota.FieldByName('VLRPARCELADOLINH').AsInteger);
    lbl_edtVctoParcCol.Text        := IntToStr(ibConfigNota.FieldByName('VCTOPARCELADOCOL').AsInteger);
    lbl_edtVctoParcLinh.Text       := IntToStr(ibConfigNota.FieldByName('VCTOPARCELADOLINH').AsInteger);

  end;//with

end;

procedure TfrmConfigNota.GravaConfig;

var
NumeroNotaHoriz,NumeroNotaVert,SaidaHoriz,SaidaVert,EntradaHoriz,EntradaVert : Integer;
NomeNatHoriz,NomeNatVert,CodNatHoriz,CodNatVert,CliHoriz,CliVert : Integer;
CnpjHoriz,CnpjVert,DataEmissaoHoriz,DataEmissaoVert,EndCliHoriz : Integer;
EndCliVert,BairroCliHoriz,BairroCliVert,CepCliHoriz,CepCliVert : Integer;
DataSaidaEntrHoriz,DataSaidaEntrVert,MunicipioHoriz,MunicipioVert : Integer;
FoneCliHoriz,FoneCliVert,UFCliHoriz,UFCliVert,IECliHoriz,IECliVert : Integer;
NFaturaHoriz,NFaturaVert,VctoFaturaHoriz,VctoFaturaVert,VlrFaturaHoriz : Integer;
VlrFaturaVert,CodProdHoriz,CodProdVert,NomeProdHoriz,NomeProdVert : Integer;
QtdeHoriz,QtdeVert,VlrUnitHoriz,VlrUnitVert,VlrTotalHoriz,VlrTotalVert : Integer;
TotalProdHoriz,TotalProdVert,TotalNotaHoriz,TotalNotaVert,NomeTranspHoriz : Integer;
NomeTranspVert,FreteContaHoriz,FreteContaVert,EndTranspHoriz,EndTranspVert : Integer;
QuantidadeHoriz,QuantidadeVert,EspecieHoriz,EspecieVert,PBrutoHoriz,PbrutoVert : Integer;
PliqHoriz,PLiqVert,DadosAdHoriz,DadosAdVert,NNotaCanhotoHoriz,NNotaCanhotoVert : Integer;
ConfirmaRegistro,IDConfigNota,VctoParcHoriz,VctoParcVert : Integer;
VlrParcHoriz,VlrParcVert : Integer;
begin

  with dmModule do begin


    ConfirmaRegistro := Application.MessageBox('Confirma o registro?','Gravar Configuração',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

    if ConfirmaRegistro = 6 Then begin

      if lbl_edtNNotaHoriz.Text <> '' Then begin
      NumeroNotaHoriz    := StrToInt(lbl_edtNNotaHoriz.Text);
      end else begin
      NumeroNotaHoriz := 0;
      end;

      if lbl_edtNNotaVert.Text <> '' Then begin
      NumeroNotaVert    := StrToInt(lbl_edtNNotaVert.Text);
      end else begin
      NumeroNotaVert := 0;
      end;

      if lbl_edtSaidaHoriz.Text <> '' Then begin
      SaidaHoriz    := StrToInt(lbl_edtSaidaHoriz.Text);
      end else begin
      SaidaHoriz := 0;
      end;

      if lbl_edtSaidaVert.Text <> '' Then begin
      SaidaVert    := StrToInt(lbl_edtSaidaVert.Text);
      end else begin
      SaidaVert := 0;
      end;

      if lbl_edtEntradaHoriz.Text <> '' Then begin
      EntradaHoriz    := StrToInt(lbl_edtEntradaHoriz.Text);
      end else begin
      EntradaHoriz := 0;
      end;

      if lbl_edtEntradaVert.Text <> '' Then begin
      EntradaVert    := StrToInt(lbl_edtEntradaVert.Text);
      end else begin
      EntradaVert := 0;
      end;

      if lbl_edtNomeNatHoriz.Text <> '' Then begin
      NomeNatHoriz    := StrToInt(lbl_edtNomeNatHoriz.Text);
      end else begin
      NomeNatHoriz := 0;
      end;

      if lbl_edtNomeNatVert.Text <> '' Then begin
      NomeNatVert    := StrToInt(lbl_edtNomeNatVert.Text);
      end else begin
      NomeNatVert := 0;
      end;

      if lbl_edtCodNatHoriz.Text <> '' Then begin
      CodNatHoriz    := StrToInt(lbl_edtCodNatHoriz.Text);
      end else begin
      CodNatHoriz := 0;
      end;

      if lbl_edtCodNatVert.Text <> '' Then begin
      CodNatVert    := StrToInt(lbl_edtCodNatVert.Text);
      end else begin
      CodNatVert := 0;
      end;

      if lbl_edtNomeCliHoriz.Text <> '' Then begin
      CliHoriz    := StrToInt(lbl_edtNomeCliHoriz.Text);
      end else begin
      CliHoriz := 0;
      end;

      if lbl_edtNomeCliVert.Text <> '' Then begin
      CliVert    := StrToInt(lbl_edtNomeCliVert.Text);
      end else begin
      CliVert := 0;
      end;

      if lbl_edtCnpjHoriz.Text <> '' Then begin
      CnpjHoriz    := StrToInt(lbl_edtCnpjHoriz.Text);
      end else begin
      CnpjHoriz := 0;
      end;

      if lbl_edtCnpjVert.Text <> '' Then begin
      CnpjVert    := StrToInt(lbl_edtCnpjVert.Text);
      end else begin
      CnpjVert := 0;
      end;

      if lbl_edtDataEmissaoHoriz.Text <> '' Then begin
      DataEmissaoHoriz    := StrToInt(lbl_edtDataEmissaoHoriz.Text);
      end else begin
      DataEmissaoHoriz := 0;
      end;

      if lbl_edtDataEmissaoVert.Text <> '' Then begin
      DataEmissaoVert    := StrToInt(lbl_edtDataEmissaoVert.Text);
      end else begin
      DataEmissaoVert := 0;
      end;

      if lbl_edtEndCliHoriz.Text <> '' Then begin
      EndCliHoriz    := StrToInt(lbl_edtEndCliHoriz.Text);
      end else begin
      EndCliHoriz := 0;
      end;

      if lbl_edtEndCliVert.Text <> '' Then begin
      EndCliVert    := StrToInt(lbl_edtEndCliVert.Text);
      end else begin
      EndCliVert := 0;
      end;

      if lbl_edtBairroCliHoriz.Text <> '' Then begin
      BairroCliHoriz    := StrToInt(lbl_edtBairroCliHoriz.Text);
      end else begin
      BairroCliHoriz := 0;
      end;

      if lbl_edtBairroCliVert.Text <> '' Then begin
      BairroCliVert    := StrToInt(lbl_edtBairroCliVert.Text);
      end else begin
      BairroCliVert := 0;
      end;

      if lbl_edtCepCliHoriz.Text <> '' Then begin
      CepCliHoriz    := StrToInt(lbl_edtCepCliHoriz.Text);
      end else begin
      CepCliHoriz := 0;
      end;

      if lbl_edtCepCliVert.Text <> '' Then begin
      CepCliVert    := StrToInt(lbl_edtCepCliVert.Text);
      end else begin
      CepCliVert := 0;
      end;

      if lbl_edtDataSaideEntrHoriz.Text <> '' Then begin
      DataSaidaEntrHoriz    := StrToInt(lbl_edtDataSaideEntrHoriz.Text);
      end else begin
      DataSaidaEntrHoriz := 0;
      end;

      if lbl_edtDataSaideEntrVert.Text <> '' Then begin
      DataSaidaEntrVert    := StrToInt(lbl_edtDataSaideEntrVert.Text);
      end else begin
      DataSaidaEntrVert := 0;
      end;

      if lbl_edtMunicHoriz.Text <> '' Then begin
      MunicipioHoriz    := StrToInt(lbl_edtMunicHoriz.Text);
      end else begin
      MunicipioHoriz := 0;
      end;

      if lbl_edtMunicVert.Text <> '' Then begin
      MunicipioVert    := StrToInt(lbl_edtMunicVert.Text);
      end else begin
      MunicipioVert := 0;
      end;

      if lbl_edtFonecliHoriz.Text <> '' Then begin
      FoneCliHoriz    := StrToInt(lbl_edtFonecliHoriz.Text);
      end else begin
      FoneCliHoriz := 0;
      end;

      if lbl_edtFonecliVert.Text <> '' Then begin
      FoneCliVert    := StrToInt(lbl_edtFonecliVert.Text);
      end else begin
      FoneCliVert := 0;
      end;

      if lbl_edtUFHoriz.Text <> '' Then begin
      UFCliHoriz    := StrToInt(lbl_edtUFHoriz.Text);
      end else begin
      UFCliHoriz := 0;
      end;

      if lbl_edtUFVert.Text <> '' Then begin
      UFCliVert    := StrToInt(lbl_edtUFVert.Text);
      end else begin
      UFCliVert := 0;
      end;

      if lbl_edtIEHoriz.Text <> '' Then begin
      IECliHoriz    := StrToInt(lbl_edtIEHoriz.Text);
      end else begin
      IECliHoriz := 0;
      end;

      if lbl_edtIEVert.Text <> '' Then begin
      IECliVert    := StrToInt(lbl_edtIEVert.Text);
      end else begin
      IECliVert := 0;
      end;

      if lbl_edtNFaturaHoriz.Text <> '' Then begin
      NFaturaHoriz    := StrToInt(lbl_edtNFaturaHoriz.Text);
      end else begin
      NFaturaHoriz := 0;
      end;

      if lbl_edtNFaturaVert.Text <> '' Then begin
      NFaturaVert    := StrToInt(lbl_edtNFaturaVert.Text);
      end else begin
      NFaturaVert := 0;
      end;

      if lbl_edtVctoHoriz.Text <> '' Then begin
      VctoFaturaHoriz    := StrToInt(lbl_edtVctoHoriz.Text);
      end else begin
      VctoFaturaHoriz := 0;
      end;

      if lbl_edtVctoVert.Text <> '' Then begin
      VctoFaturaVert    := StrToInt(lbl_edtVctoVert.Text);
      end else begin
      VctoFaturaVert := 0;
      end;

      if lbl_edtValorHoriz.Text <> '' Then begin
      VlrFaturaHoriz    := StrToInt(lbl_edtValorHoriz.Text);
      end else begin
      VlrFaturaHoriz := 0;
      end;

      if lbl_edtValorVert.Text <> '' Then begin
      VlrFaturaVert    := StrToInt(lbl_edtValorVert.Text);
      end else begin
      VlrFaturaVert := 0;
      end;

      if lbl_edtCodProdHoriz.Text <> '' Then begin
      CodProdHoriz    := StrToInt(lbl_edtCodProdHoriz.Text);
      end else begin
      CodProdHoriz := 0;
      end;

      if lbl_edtCodProdVert.Text <> '' Then begin
      CodProdVert    := StrToInt(lbl_edtCodProdVert.Text);
      end else begin
      CodProdVert := 0;
      end;

      if lbl_edtNomeProdHoriz.Text <> '' Then begin
      NomeProdHoriz    := StrToInt(lbl_edtNomeProdHoriz.Text);
      end else begin
      NomeProdHoriz := 0;
      end;

      if lbl_edtNomeProdVert.Text <> '' Then begin
      NomeProdVert    := StrToInt(lbl_edtNomeProdVert.Text);
      end else begin
      NomeProdVert := 0;
      end;

      if lbl_edtQtdeCol.Text <> '' Then begin
      QtdeHoriz    := StrToInt(lbl_edtQtdeCol.Text);
      end else begin
      QtdeHoriz := 0;
      end;

      if lbl_edtQtdeLinh.Text <> '' Then begin
      QtdeVert    := StrToInt(lbl_edtQtdeLinh.Text);
      end else begin
      QtdeVert := 0;
      end;

      if lbl_edtVlrUnitHoriz.Text <> '' Then begin
      VlrUnitHoriz    := StrToInt(lbl_edtVlrUnitHoriz.Text);
      end else begin
      VlrUnitHoriz := 0;
      end;

      if lbl_edtVlrUnitVert.Text <> '' Then begin
      VlrUnitVert    := StrToInt(lbl_edtVlrUnitVert.Text);
      end else begin
      VlrUnitVert := 0;
      end;

      if lbl_edtVlrTotalHoriz.Text <> '' Then begin
      VlrTotalHoriz    := StrToInt(lbl_edtVlrTotalHoriz.Text);
      end else begin
      VlrTotalHoriz := 0;
      end;

      if lbl_edtVlrTotalVert.Text <> '' Then begin
      VlrTotalVert    := StrToInt(lbl_edtVlrTotalVert.Text);
      end else begin
      VlrTotalVert := 0;
      end;

      if lbl_edtTotalProdHoriz.Text <> '' Then begin
      TotalProdHoriz    := StrToInt(lbl_edtTotalProdHoriz.Text);
      end else begin
      TotalProdHoriz := 0;
      end;

      if lbl_edtTotalProdVert.Text <> '' Then begin
      TotalProdVert    := StrToInt(lbl_edtTotalProdVert.Text);
      end else begin
      TotalProdVert := 0;
      end;

      if lbl_edtTotalNFHoriz.Text <> '' Then begin
      TotalNotaHoriz    := StrToInt(lbl_edtTotalNFHoriz.Text);
      end else begin
      TotalNotaHoriz := 0;
      end;

      if lbl_edtTotalNFVert.Text <> '' Then begin
      TotalNotaVert    := StrToInt(lbl_edtTotalNFVert.Text);
      end else begin
      TotalNotaVert := 0;
      end;

      if lbl_edtTranspHoriz.Text <> '' Then begin
      NomeTranspHoriz    := StrToInt(lbl_edtTranspHoriz.Text);
      end else begin
      NomeTranspHoriz := 0;
      end;

      if lbl_edtTranspVert.Text <> '' Then begin
      NomeTranspVert    := StrToInt(lbl_edtTranspVert.Text);
      end else begin
      NomeTranspVert := 0;
      end;

      if lbl_edtFreteContaHoriz.Text <> '' Then begin
      FreteContaHoriz    := StrToInt(lbl_edtFreteContaHoriz.Text);
      end else begin
      FreteContaHoriz := 0;
      end;

      if lbl_edtFreteContaVert.Text <> '' Then begin
      FreteContaVert    := StrToInt(lbl_edtFreteContaVert.Text);
      end else begin
      FreteContaVert := 0;
      end;

      if lbl_edtEndTranspHoriz.Text <> '' Then begin
      EndTranspHoriz    := StrToInt(lbl_edtEndTranspHoriz.Text);
      end else begin
      EndTranspHoriz := 0;
      end;

      if lbl_edtEndTranspVert.Text <> '' Then begin
      EndTranspVert    := StrToInt(lbl_edtEndTranspVert.Text);
      end else begin
      EndTranspVert := 0;
      end;

      if lbl_edtQuantidadeHoriz.Text <> '' Then begin
      QuantidadeHoriz    := StrToInt(lbl_edtQuantidadeHoriz.Text);
      end else begin
      QuantidadeHoriz := 0;
      end;

      if lbl_edtQuantidadeVert.Text <> '' Then begin
      QuantidadeVert    := StrToInt(lbl_edtQuantidadeVert.Text);
      end else begin
      QuantidadeVert := 0;
      end;

      if lbl_edtEspecieHoriz.Text <> '' Then begin
      EspecieHoriz    := StrToInt(lbl_edtEspecieHoriz.Text);
      end else begin
      EspecieHoriz := 0;
      end;

      if lbl_edtEspecieVert.Text <> '' Then begin
      EspecieVert    := StrToInt(lbl_edtEspecieVert.Text);
      end else begin
      EspecieVert := 0;
      end;

      if lbl_edtPBrutoHoriz.Text <> '' Then begin
      PBrutoHoriz    := StrToInt(lbl_edtPBrutoHoriz.Text);
      end else begin
      PBrutoHoriz := 0;
      end;

      if lbl_edtPBrutoVert.Text <> '' Then begin
      PbrutoVert    := StrToInt(lbl_edtPBrutoVert.Text);
      end else begin
      PbrutoVert := 0;
      end;

      if lbl_edtPLiqHoriz.Text <> '' Then begin
      PliqHoriz    := StrToInt(lbl_edtPLiqHoriz.Text);
      end else begin
      PliqHoriz := 0;
      end;

      if lbl_edtPLiqVert.Text <> '' Then begin
      PLiqVert    := StrToInt(lbl_edtPLiqVert.Text);
      end else begin
      PLiqVert := 0;
      end;

      if lbl_edtDadosAdHoriz.Text <> '' Then begin
      DadosAdHoriz    := StrToInt(lbl_edtDadosAdHoriz.Text);
      end else begin
      DadosAdHoriz := 0;
      end;

      if lbl_edtDadosAdVert.Text <> '' Then begin
      DadosAdVert    := StrToInt(lbl_edtDadosAdVert.Text);
      end else begin
      DadosAdVert := 0;
      end;


      if lbl_edtNNotaCanhotoCol.Text <> '' Then begin
      NNotaCanhotoHoriz    := StrToInt(lbl_edtNNotaCanhotoCol.Text);
      end else begin
      NNotaCanhotoHoriz := 0;
      end;

      if lbl_edtNNotaCanhotoLinh.Text <> '' Then begin
      NNotaCanhotoVert    := StrToInt(lbl_edtNNotaCanhotoLinh.Text);
      end else begin
      NNotaCanhotoVert := 0;
      end;

      if lbl_edtVctoParcCol.Text <> '' Then begin
      VctoParcHoriz    := StrToInt(lbl_edtVctoParcCol.Text);
      end else begin
      VctoParcHoriz := 0;
      end;

      if lbl_edtVctoParcLinh.Text <> '' Then begin
      VctoParcVert    := StrToInt(lbl_edtVctoParcLinh.Text);
      end else begin
      VctoParcVert := 0;
      end;


      if lbl_edtVlrParcCol.Text <> '' Then begin
      VlrParcHoriz    := StrToInt(lbl_edtVlrParcCol.Text);
      end else begin
      VlrParcHoriz := 0;
      end;

      if lbl_edtVlrParcLinh.Text <> '' Then begin
      VlrParcVert    := StrToInt(lbl_edtVlrParcLinh.Text);
      end else begin
      VlrParcVert := 0;
      end;

      Commit(ibConfigNota);
      ibConfigNota.Close;
      ibConfigNota.SQL.Clear;
      ibConfigNota.SQL.Add('SELECT * FROM TBLCONFIGNOTA');
      ibConfigNota.Open;

      IDConfigNota := ibConfigNota.FieldByName('IDCONFIGNOTA').AsInteger;

      if ibConfigNota.RecordCount > 0 Then begin

        ibConfigNota.Close;
        ibConfigNota.SQL.Clear;
        ibConfigNota.SQL.Add('UPDATE TBLCONFIGNOTA SET '
        + 'NUMERONOTAFISCALHORIZ = ''' + IntToStr(NumeroNotaHoriz) + ''','
        + 'NUMERONOTAFISCALVERT  = ''' + IntToStr(NumeroNotaVert) + ''','
        + 'SAIDANFHORIZ          = ''' + IntToStr(SaidaHoriz) + ''','
        + 'SAIDANFVERT           = ''' + IntToStr(SaidaVert) + ''','
        + 'ENTRADANFHORIZ        = ''' + IntToStr(EntradaHoriz) + ''','
        + 'ENTRADANFVERT         = ''' + IntToStr(EntradaVert) + ''','
        + 'NOMENATUREZAHORIZ     = ''' + IntToStr(NomeNatHoriz) + ''','
        + 'NOMENATUREZAVERT      = ''' + IntToStr(NomeNatVert) + ''','
        + 'NATUREZACODHORIZ      = ''' + IntToStr(CodNatHoriz) + ''','
        + 'NATUREZACODVERT       = ''' + IntToStr(CodNatVert) + ''','
        + 'CLIENTEHORIZ          = ''' + IntToStr(CliHoriz) + ''','
        + 'CLIENTEVERT           = ''' + IntToStr(CliVert) + ''','
        + 'CNPJHORIZ             = ''' + IntToStr(CnpjHoriz) + ''','
        + 'CNPJVERT              = ''' + IntToStr(CnpjVert) + ''','
        + 'DATAEMISSAOHORIZ      = ''' + IntToStr(DataEmissaoHoriz) + ''','
        + 'DATAEMISSAOVERT       = ''' + IntToStr(DataEmissaoVert) + ''','
        + 'ENDCLIENTEHORIZ       = ''' + IntToStr(EndCliHoriz) + ''','
        + 'ENDCLIENTEVERT        = ''' + IntToStr(EndCliVert) + ''','
        + 'BAIRROCLIENTEHORIZ    = ''' + IntToStr(BairroCliHoriz) + ''','
        + 'BAIRROCLIENTEVERT     = ''' + IntToStr(BairroCliVert) + ''','
        + 'CEPCLIENTEHORIZ       = ''' + IntToStr(CepCliHoriz) + ''','
        + 'CEPCLIENTEVERT        = ''' + IntToStr(CepCliVert) + ''','
        + 'DATANFSAIDAENTRADAHORIZ = ''' + IntToStr(DataSaidaEntrHoriz) + ''','
        + 'DATANFSAIDAENTRADAVERT  = ''' + IntToStr(DataSaidaEntrVert) + ''','
        + 'MUNICIPIOCLIENTEHORIZ   = ''' + IntToStr(MunicipioHoriz) + ''','
        + 'MUNICIPIOCLIENTEVERT    = ''' + IntToStr(MunicipioVert) + ''','
        + 'FONECLIENTEHORIZ        = ''' + IntToStr(FoneCliHoriz) + ''','
        + 'FONECLIENTEVERT         = ''' + IntToStr(FoneCliVert) + ''','
        + 'UFCLIENTEHORIZ          = ''' + IntToStr(UFCliHoriz) + ''','
        + 'UFCLIENTEVERT           = ''' + IntToStr(UFCliVert) + ''','
        + 'IECLIENTEHORIZ          = ''' + IntToStr(IECliHoriz) + ''','
        + 'IECLIENTEVERT           = ''' + IntToStr(IECliVert) + ''','
        + 'NUMEROFATURAHORIZ       = ''' + IntToStr(NFaturaHoriz) + ''','
        + 'NUMEROFATURAVERT        = ''' + IntToStr(NFaturaVert) + ''','
        + 'DATAFATURAHORIZ         = ''' + IntToStr(VctoFaturaHoriz) + ''','
        + 'DATAFATURAVERT          = ''' + IntToStr(VctoFaturaVert) + ''','
        + 'VLRFATURAHORIZ          = ''' + IntToStr(VlrFaturaHoriz) + ''','
        + 'VLRFATURAVERT           = ''' + IntToStr(VlrFaturaVert) + ''','
        + 'CODPRODHORIZ            = ''' + IntToStr(CodProdHoriz) + ''','
        + 'CODPRODVERT             = ''' + IntToStr(CodProdVert) + ''','
        + 'NOMEPRODHORIZ           = ''' + IntToStr(NomeProdHoriz) + ''','
        + 'NOMEPRODVERT            = ''' + IntToStr(NomeProdVert) + ''','
        + 'QTDEHORIZ               = ''' + IntToStr(QtdeHoriz) + ''','
        + 'QTDEVERT                = ''' + IntToStr(QtdeVert) + ''','
        + 'VLRUNITHORIZ            = ''' + IntToStr(VlrUnitHoriz) + ''','
        + 'VLRUNITVERT             = ''' + IntToStr(VlrUnitVert) + ''','
        + 'VLRTOTALHORIZ           = ''' + IntToStr(VlrTotalHoriz) + ''','
        + 'VLRTOTALVERT            = ''' + IntToStr(VlrTotalVert) + ''','
        + 'VLRTOTALPRODHORIZ       = ''' + IntToStr(TotalProdHoriz) + ''','
        + 'VLRTOTALPRODVERT        = ''' + IntToStr(TotalProdVert) + ''','
        + 'VLRTOTALNOTAHORIZ       = ''' + IntToStr(TotalNotaHoriz) + ''','
        + 'VLRTOTALNOTAVERT        = ''' + IntToStr(TotalNotaVert) + ''','
        + 'NOMETRANSPHORIZ         = ''' + IntToStr(NomeTranspHoriz) + ''','
        + 'NOMETRANSPVERT          = ''' + IntToStr(NomeTranspVert) + ''','
        + 'FRETECONTAHORIZ         = ''' + IntToStr(FreteContaHoriz) + ''','
        + 'FRETECONTAVERT          = ''' + IntToStr(FreteContaVert) + ''','
        + 'ENDTRANSPHORIZ          = ''' + IntToStr(EndTranspHoriz) + ''','
        + 'ENDTRANSPVERT           = ''' + IntToStr(EndTranspVert) + ''','
        + 'QTDEITENSHORIZ          = ''' + IntToStr(QuantidadeHoriz) + ''','
        + 'QTDEITENSVERT           = ''' + IntToStr(QuantidadeVert) + ''','
        + 'ESPECIEHORIZ            = ''' + IntToStr(EspecieHoriz) + ''','
        + 'ESPECIEVERT             = ''' + IntToStr(EspecieVert) + ''','
        + 'PESOBRUTOHORIZ          = ''' + IntToStr(PBrutoHoriz) + ''','
        + 'PESOBRUTOVERT           = ''' + IntToStr(PBrutoVert) + ''','
        + 'PESOLIQHORIZ            = ''' + IntToStr(PliqHoriz) + ''','
        + 'PESOLIQVERT             = ''' + IntToStr(PliqVert) + ''','
        + 'DADOSADHORIZ            = ''' + IntToStr(DadosAdHoriz) + ''','
        + 'NUMERONOTACANHOTOCOL    = ''' + IntToStr(NNotaCanhotoHoriz) + ''','
        + 'NUMERONOTACANHOTOLINH   = ''' + IntToStr(NNotaCanhotoVert) + ''','
        + 'VLRPARCELADOCOL         = ''' + IntToStr(VlrParcHoriz) + ''','
        + 'VLRPARCELADOLINH        = ''' + IntToStr(VlrParcVert) + ''','
        + 'VCTOPARCELADOCOL        = ''' + IntToStr(VctoParcHoriz) + ''','
        + 'VCTOPARCELADOLINH       = ''' + IntToStr(VctoParcVert) + ''','
        + 'DADOSADVERT             = ''' + IntToStr(DadosAdVert) + ''' WHERE IDCONFIGNOTA=''' + IntToStr(IDConfigNota) + '''');
        ibConfigNota.ExecSQL;
        Commit(ibConfigNota);

      end else begin

        ibConfigNota.Close;
        ibConfigNota.SQL.Clear;
        ibConfigNota.SQL.Add('INSERT INTO TBLCONFIGNOTA'
        + '(NUMERONOTAFISCALHORIZ,NUMERONOTAFISCALVERT,SAIDANFHORIZ,SAIDANFVERT,'
        + 'ENTRADANFHORIZ,ENTRADANFVERT,NOMENATUREZAHORIZ,NOMENATUREZAVERT,'
        + 'NATUREZACODHORIZ,NATUREZACODVERT,CLIENTEHORIZ,CLIENTEVERT,CNPJHORIZ,'
        + 'CNPJVERT,DATAEMISSAOHORIZ,DATAEMISSAOVERT,ENDCLIENTEHORIZ,ENDCLIENTEVERT,'
        + 'BAIRROCLIENTEHORIZ,BAIRROCLIENTEVERT,CEPCLIENTEHORIZ,CEPCLIENTEVERT,'
        + 'DATANFSAIDAENTRADAHORIZ,DATANFSAIDAENTRADAVERT,MUNICIPIOCLIENTEHORIZ,'
        + 'MUNICIPIOCLIENTEVERT,FONECLIENTEHORIZ,FONECLIENTEVERT,UFCLIENTEHORIZ,'
        + 'UFCLIENTEVERT,IECLIENTEHORIZ,IECLIENTEVERT,NUMEROFATURAHORIZ,NUMEROFATURAVERT,'
        + 'DATAFATURAHORIZ,DATAFATURAVERT,VLRFATURAHORIZ,VLRFATURAVERT,CODPRODHORIZ,'
        + 'CODPRODVERT,NOMEPRODHORIZ,NOMEPRODVERT,QTDEHORIZ,QTDEVERT,VLRUNITHORIZ,'
        + 'VLRUNITVERT,VLRTOTALHORIZ,VLRTOTALVERT,VLRTOTALPRODHORIZ,VLRTOTALPRODVERT,'
        + 'VLRTOTALNOTAHORIZ,VLRTOTALNOTAVERT,NOMETRANSPHORIZ,NOMETRANSPVERT,'
        + 'FRETECONTAHORIZ,FRETECONTAVERT,ENDTRANSPHORIZ,ENDTRANSPVERT,QTDEITENSHORIZ,'
        + 'QTDEITENSVERT,ESPECIEHORIZ,ESPECIEVERT,PESOBRUTOHORIZ,PESOBRUTOVERT,'
        + 'PESOLIQHORIZ,PESOLIQVERT,DADOSADHORIZ,DADOSADVERT,NUMERONOTACANHOTOCOL,'
        + 'VLRPARCELADOCOL,VLRPARCELADOLINH,VCTOPARCELADOCOL,VCTOPARCELADOLINH,NUMERONOTACANHOTOLINH) values '
        + ' (''' + IntToStr(NumeroNotaHoriz) + ''',''' + IntToStr(NumeroNotaVert) + ''','
        + ' ''' + IntToStr(SaidaHoriz) + ''',''' + IntToStr(SaidaVert) + ''','
        + ' ''' + IntToStr(EntradaHoriz) + ''',''' + IntToStr(EntradaVert) + ''','
        + ' ''' + IntToStr(NomeNatHoriz) + ''',''' + IntToStr(NomeNatVert) + ''','
        + ' ''' + IntToStr(CodNatHoriz) + ''',''' + IntToStr(CodNatVert) + ''','
        + ' ''' + IntToStr(CliHoriz) + ''',''' + IntToStr(CliVert) + ''','
        + ' ''' + IntToStr(CnpjHoriz) + ''',''' + IntToStr(CnpjVert) + ''','
        + ' ''' + IntToStr(DataEmissaoHoriz) + ''',''' + IntToStr(DataEmissaoVert) + ''','
        + ' ''' + IntToStr(EndCliHoriz) + ''',''' + IntToStr(EndCliVert) + ''','
        + ' ''' + IntToStr(BairroCliHoriz) + ''',''' + IntToStr(BairroCliVert) + ''','
        + ' ''' + IntToStr(CepCliHoriz) + ''',''' + IntToStr(CepCliVert) + ''','
        + ' ''' + IntToStr(DataSaidaEntrHoriz) + ''',''' + IntToStr(DataSaidaEntrVert) + ''','
        + ' ''' + IntToStr(MunicipioHoriz) + ''',''' + IntToStr(MunicipioVert) + ''','
        + ' ''' + IntToStr(FoneCliHoriz) + ''',''' + IntToStr(FoneCliVert) + ''','
        + ' ''' + IntToStr(UFCliHoriz) + ''',''' + IntToStr(UFCliVert) + ''','
        + ' ''' + IntToStr(IECliHoriz) + ''',''' + IntToStr(IECliVert) + ''','
        + ' ''' + IntToStr(NFaturaHoriz) + ''',''' + IntToStr(NFaturaVert) + ''','
        + ' ''' + IntToStr(VctoFaturaHoriz) + ''',''' + IntToStr(VctoFaturaVert) + ''','
        + ' ''' + IntToStr(VlrFaturaHoriz) + ''',''' + IntToStr(VlrFaturaVert)  + ''','
        + ' ''' + IntToStr(CodProdHoriz) + ''',''' + IntToStr(CodProdVert) + ''','
        + ' ''' + IntToStr(NomeProdHoriz) + ''',''' + IntToStr(NomeProdVert) + ''','
        + ' ''' + IntToStr(QtdeHoriz) + ''',''' + IntToStr(QtdeVert) + ''','
        + ' ''' + IntToStr(VlrUnitHoriz) + ''',''' + IntToStr(VlrUnitVert) + ''','
        + ' ''' + IntToStr(VlrTotalHoriz) + ''',''' + IntToStr(VlrTotalVert) + ''','
        + ' ''' + IntToStr(TotalProdHoriz) + ''',''' + IntToStr(TotalProdVert) + ''','
        + ' ''' + IntToStr(TotalNotaHoriz) + ''',''' + IntToStr(TotalNotaVert) + ''','
        + ' ''' + IntToStr(NomeTranspHoriz) + ''',''' + IntToStr(NomeTranspVert) + ''','
        + ' ''' + IntToStr(FreteContaHoriz) + ''',''' + IntToStr(FreteContaVert) + ''','
        + ' ''' + IntToStr(EndTranspHoriz) + ''',''' + IntToStr(EndTranspVert) + ''','
        + ' ''' + IntToStr(QuantidadeHoriz) + ''',''' + IntToStr(QuantidadeVert) + ''','
        + ' ''' + IntToStr(EspecieHoriz) + ''',''' + IntToStr(EspecieVert) + ''','
        + ' ''' + IntToStr(PBrutoHoriz) + ''',''' + IntToStr(PbrutoVert) + ''','
        + ' ''' + IntToStr(PliqHoriz) + ''',''' + IntToStr(PLiqVert) + ''','
        + ' ''' + IntToStr(DadosAdHoriz) + ''',''' + IntToStr(DadosAdVert) + ''','
        + ' ''' + IntToStr(NNotaCanhotoHoriz) + ''','
        + ' ''' + IntToStr(VlrParcHoriz) + ''',''' + IntToStr(VlrParcVert) + ''','
        + ' ''' + IntToStr(VctoParcHoriz) + ''',''' + IntToStr(VctoParcVert) + ''','
        + ' ''' + IntToStr(NNotaCanhotoVert) + ''')');
        ibConfigNota.ExecSQL;
        Commit(ibConfigNota);

      end;//if recordcount

    end;//if confirma registro

  end;//with

end;

procedure TfrmConfigNota.ibeaIncluirClick(Sender: TObject);
begin

with dmModule do begin

GravaConfig;

end;//with

end;

procedure TfrmConfigNota.FormShow(Sender: TObject);
begin

  with dmModule do begin

    ExecSELECTConfiguracao;

  end;//with

end;

end.
