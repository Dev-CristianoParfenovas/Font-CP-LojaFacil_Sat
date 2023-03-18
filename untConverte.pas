unit untConverte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Winsock,Registry,Printers,mxFlatControls,AppEvnts,ShellApi,
  ComCtrls, ExtCtrls, Menus, DB, Buttons, Mask, DBTables, DBIPROCS, DBITypes,
  DBIErrs, Gauges, ImgList, ToolWin, jpeg, ExtDlgs;

implementation

function ConverteMoeda(Param : String): String;

begin

if Param = 'ConverteMoedas' Then begin

Result := ',0.00';

end;

end;

end.
 