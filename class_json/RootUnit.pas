unit RootUnit;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  T_10 = class;
  T_9 = class;

  T_10 = class
  private
    FIdprod: string;
    FNome: string;
  published
    property Idprod: string read FIdprod write FIdprod;
    property Nome: string read FNome write FNome;
  end;
  
  T_9 = class
  private
    FIdprod: string;
    FNome: string;
  published
    property Idprod: string read FIdprod write FIdprod;
    property Nome: string read FNome write FNome;
  end;
  
  TCadprodutos = class
  private
    [JSONName('10')]
    F_10: T_10;
    [JSONName('9')]
    F_9: T_9;
  published
    property _10: T_10 read F_10;
    property _9: T_9 read F_9;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TRoot = class(TJsonDTO)
  private
    FCadprodutos: TCadprodutos;
  published
    property Cadprodutos: TCadprodutos read FCadprodutos;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TCadprodutos }

constructor TCadprodutos.Create;
begin
  inherited;
  F_9 := T_9.Create;
  F_10 := T_10.Create;
end;

destructor TCadprodutos.Destroy;
begin
  F_9.Free;
  F_10.Free;
  inherited;
end;

{ TRoot }

constructor TRoot.Create;
begin
  inherited;
  FCadprodutos := TCadprodutos.Create;
end;

destructor TRoot.Destroy;
begin
  FCadprodutos.Free;
  inherited;
end;

end.
