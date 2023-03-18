unit untClasse.DataEntrEstoque;

interface

  type
    TDataEntrEstoque = class
  private
    FQtdeEstoque: String;
    FIDProduto: Integer;
    procedure SetQtdeEstoque(const Value: String);
    procedure SetIDProduto(const Value: Integer);


    public
      property QtdeEstoque : String read FQtdeEstoque write SetQtdeEstoque;
      property IDProduto : Integer read FIDProduto write SetIDProduto;
    end;


implementation

{ TDataEntrEstoque }


procedure TDataEntrEstoque.SetIDProduto(const Value: Integer);
begin
  FIDProduto := Value;
end;

procedure TDataEntrEstoque.SetQtdeEstoque(const Value: String);
begin
  FQtdeEstoque := Value;
end;

end.
