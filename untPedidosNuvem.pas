unit untPedidosNuvem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TuntPedidoNuvem = class(TForm)
    dbPedidos: TDBGrid;
    Button1: TButton;
    memoResp: TMemo;
    memoConvert: TMemo;
    Button2: TButton;
    mtProdutos: TFDMemTable;
    dsProdutos: TDataSource;
    mtProdutosidprod: TStringField;
    mtProdutosnome: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  untPedidoNuvem: TuntPedidoNuvem;

implementation

uses
  RootUnit,
  untdmModule,
  Firebase.Interfaces,
  Firebase.Auth,
  Firebase.Database,
  System.JSON,
  System.Net.HttpClient,
  System.Generics.Collections,
  System.JSON.Types,
  System.JSON.Writers,
  DataSet.Serialize;
  // DataSet.Serialize.Samples.Master.Detail;

{$R *.dfm}

procedure TuntPedidoNuvem.Button1Click(Sender: TObject);

var
intNuvem : Integer;
strEmail,strPassword,strNode,strKey,strDomain,strToken : String;

  ADatabase: TFirebaseDatabase;
  AResponse: IFirebaseResponse;
  JSONResp: TJSONValue;
  Auth: IFirebaseAuth;
  Obj,obJSON: TJSONObject;
  AParams: TDictionary<string, string>;
  arrayJSON : TJSONArray;
begin

  with dmModule do begin

    ibConfig.Close;
    ibConfig.SQL.Clear;
    ibConfig.SQL.Add('SELECT TRESCASASDECIMAIS,INT_NUVEM,'
    + 'STR_EMAILNUVEM,STR_PASSWORDNUVEM,STR_NODENUVEM,'
    + 'STR_KEYNUVEM, STR_DOMAINNUVEM,STR_TOKENNUVEM FROM TBLCONFIGURACOES');
    ibConfig.Open;

    intNuvem := ibConfig.FieldByName('INT_NUVEM').AsInteger;
    strEmail := ibConfig.FieldByName('STR_EMAILNUVEM').AsString;
    strPassword := ibConfig.FieldByName('STR_PASSWORDNUVEM').AsString;
    strNode := ibConfig.FieldByName('STR_NODENUVEM').AsString;
    strKey := ibConfig.FieldByName('STR_KEYNUVEM').AsString;
    strDomain := ibConfig.FieldByName('STR_DOMAINNUVEM').AsString;
    strToken := ibConfig.FieldByName('STR_TOKENNUVEM').AsString;

////////////////////////////////////////////////////////////////////////////////


  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(strKey);
  AResponse := Auth.SignInWithEmailAndPassword(strEmail, strPassword);
  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
  begin
    if Assigned(JSONResp) then
    begin
      JSONResp.Free;
    end;
    Exit;
  end;
  Obj := JSONResp as TJSONObject;
  Obj.Values['idToken'].Value;
  strToken := Obj.Values['idToken'].Value;

////////////////////////////////////////////////////////////////////////////////


    ADatabase := TFirebaseDatabase.Create;
    ADatabase.SetBaseURI(strDomain);
    ADatabase.SetToken(strToken);
    memoResp.Lines.Clear;

 //TDataSetSerializeConfig.GetInstance.Import.ImportOnlyFieldsVisible := True;

    AParams := TDictionary<string, string>.Create;
    AResponse := ADatabase.Get([strNode,'.json']);

    memoResp.Lines.Add(AResponse.ContentAsString);

   // mtPedidos.LoadFromJSON(memoResp.Lines.Text);
   // obJSON := mtPedidos.ToJSONObject;


  //  memoConvert.Lines.Add(obJSON.ToString);

  end;

end;

procedure TuntPedidoNuvem.Button2Click(Sender: TObject);
var
JSonProd : TJSONObject;
nomeprod : TCadprodutos;

id : T_9;
begin

   nomeprod := TCadprodutos.Create;
   id := T_9.Create;

   mtProdutos.LoadFromJSON(memoResp.Text);

  JSonProd := mtProdutos.ToJSONObject();

  id := nomeprod._9;

  try


  finally

    JSonProd.Free;

  end;


end;

procedure TuntPedidoNuvem.FormCreate(Sender: TObject);
begin
mtProdutos.Open;
end;

end.
