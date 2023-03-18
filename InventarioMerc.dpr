program InventarioMerc;

uses
  Forms,
  Inventario in 'pas\Inventario.pas' {frmInventario},
  Invent in 'pas\Invent.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmInventario, frmInventario);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
