unit classComboBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DB;

Type
  TClasseCombo = class(TObject)
  private
    fID: Integer;
  published
    property ID: Integer read fID write fID;
  end;

implementation

end.
