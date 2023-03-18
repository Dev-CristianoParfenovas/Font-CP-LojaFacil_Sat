unit untClasse.ConfigCX;

interface

  type
  TConfigCX = class

  private
    FAbreNotaP : Integer;
    function getFAbreNotaP: Integer;
    procedure SetFAbreNotaP(const Value: Integer);

  public
  property AbreNotaP : Integer read getFAbreNotaP write SetFAbreNotaP;


  end;

implementation

{ TConfigCX }

function TConfigCX.getFAbreNotaP: Integer;
begin
Result := FAbreNotaP;
end;

procedure TConfigCX.SetFAbreNotaP(const Value: Integer);
begin

  if Value > 0 Then

    FAbreNotaP := Value;
    
end;

end.
