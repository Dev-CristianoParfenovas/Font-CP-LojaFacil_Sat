unit untClasse.ImprimirCupom;

interface

  type
    TImprimirCupom = class

    private
    FStrNomeEmpr: String;
    FStrEndEmpr: String;
    FStrNumEmpr: String;
    FStrBairroEmpr: String;
    FStrTelefoneEmpr: String;
    FStr_ParametroVendaC: String;
    FintConfirmaImpressao : Integer;
    FStrFraseTrocaM: String;
    procedure SetStrNomeEmpr(const Value: String);
    procedure SetStrEndEmpr(const Value: String);
    procedure SetStrNumEmpr(const Value: String);
    procedure SetStrBairroEmpr(const Value: String);
    procedure SetStrTelefoneEmpr(const Value: String);
    procedure SetStr_ParametroVendaC(const Value: String);
    procedure SetFintConfirmaImpressao(const Value: Integer);
    procedure SetStrFraseTrocaM(const Value: String);

    public
      property StrNomeEmpr : String read FStrNomeEmpr write SetStrNomeEmpr;
      property StrEndEmpr : String read FStrEndEmpr write SetStrEndEmpr;
      property StrNumEmpr : String read FStrNumEmpr write SetStrNumEmpr;
      property StrBairroEmpr : String read FStrBairroEmpr write SetStrBairroEmpr;
      property StrFraseTrocaM : String read FStrFraseTrocaM write SetStrFraseTrocaM;
      property StrTelefoneEmpr : String read FStrTelefoneEmpr write SetStrTelefoneEmpr;
      property Str_ParametroVendaC : String read FStr_ParametroVendaC write SetStr_ParametroVendaC;
      property intConfirmaImpressao : Integer read FintConfirmaImpressao write SetFintConfirmaImpressao;
    end;
////////////////////////////////////////////////////////////////////////////////

    TConfiguracoes = class(TImprimirCupom)


      private
        FStrDesenhoDivisaoCupom: String;
        FStrHoraConvertida: String;
        FStrDataConvertida: String;
        FintImprSimplesConf: Integer;
        procedure SetStrDesenhoDivisaoCupom(const Value: String);
        procedure SetStrDataConvertida(const Value: String);
        procedure SetStrHoraConvertida(const Value: String);
        procedure SetintImprSimplesConf(const Value: Integer);

      public
        property StrDesenhoDivisaoCupom : String read FStrDesenhoDivisaoCupom write SetStrDesenhoDivisaoCupom;
        property StrDataConvertida : String read FStrDataConvertida write SetStrDataConvertida;
        property StrHoraConvertida : String read FStrHoraConvertida write SetStrHoraConvertida;
        property intImprSimplesConf : Integer read FintImprSimplesConf write SetintImprSimplesConf;
    end;
////////////////////////////////////////////////////////////////////////////////

    TDadosProduto = class

      private
        FStrVlrCredito: String;
        FStrNomeProd: String;
        FStrcodBarrasProd: String;
        procedure SetStrcodBarrasProd(const Value: String);
        procedure SetStrNomeProd(const Value: String);
        procedure SetStrVlrCredito(const Value: String);

      public
        property StrNomeProd : String read FStrNomeProd write SetStrNomeProd;
        property StrcodBarrasProd : String read FStrcodBarrasProd write SetStrcodBarrasProd;
        property StrVlrCredito : String read FStrVlrCredito write SetStrVlrCredito;

    end;

implementation




{ TImprimirCupom }

procedure TImprimirCupom.SetStrBairroEmpr(const Value: String);
begin
  FStrBairroEmpr := Value;
end;

procedure TImprimirCupom.SetStrEndEmpr(const Value: String);
begin
  FStrEndEmpr := Value;
end;

procedure TImprimirCupom.SetStrNomeEmpr(const Value: String);
begin
  FStrNomeEmpr := Value;
end;

procedure TImprimirCupom.SetStrNumEmpr(const Value: String);
begin
  FStrNumEmpr := Value;
end;

procedure TImprimirCupom.SetStrTelefoneEmpr(const Value: String);
begin
  FStrTelefoneEmpr := Value;
end;

procedure TImprimirCupom.SetStr_ParametroVendaC(const Value: String);
begin
  FStr_ParametroVendaC := Value;
end;

procedure TImprimirCupom.SetFintConfirmaImpressao(const Value: Integer);
begin
  FintConfirmaImpressao := Value;
end;

procedure TImprimirCupom.SetStrFraseTrocaM(const Value: String);
begin
  FStrFraseTrocaM := Value;
end;

{ TConfiguracoes }

procedure TConfiguracoes.SetintImprSimplesConf(const Value: Integer);
begin
  FintImprSimplesConf := Value;
end;

procedure TConfiguracoes.SetStrDataConvertida(const Value: String);
begin
  FStrDataConvertida := Value;
end;

procedure TConfiguracoes.SetStrDesenhoDivisaoCupom(const Value: String);
begin
  FStrDesenhoDivisaoCupom := Value;
end;

procedure TConfiguracoes.SetStrHoraConvertida(const Value: String);
begin
  FStrHoraConvertida := Value;
end;

{ TDadosProduto }

procedure TDadosProduto.SetStrcodBarrasProd(const Value: String);
begin
  FStrcodBarrasProd := Value;
end;

procedure TDadosProduto.SetStrNomeProd(const Value: String);
begin
  FStrNomeProd := Value;
end;

procedure TDadosProduto.SetStrVlrCredito(const Value: String);
begin
  FStrVlrCredito := Value;
end;

end.
 