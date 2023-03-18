unit untConfigEtiquetaGr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IBQuery, Printers, ComCtrls;

type
  TfrmConfigEtiquetaGr = class(TForm)
    pcConfigEtiqueta: TPageControl;
    tbsNomeVlr: TTabSheet;
    tbsRefCodInt: TTabSheet;
    Shape1: TShape;
    lbl_edtEtiqueta1Horiz: TLabeledEdit;
    lbl_edtEtiqueta1Vert: TLabeledEdit;
    lbl_edtEtiqueta2Horiz: TLabeledEdit;
    lbl_edtEtiqueta2Vert: TLabeledEdit;
    lbl_edtEtiqueta3Horiz: TLabeledEdit;
    lbl_edtEtiqueta3Vert: TLabeledEdit;
    lbl_edtEtiqueta4Horiz: TLabeledEdit;
    lbl_edtEtiqueta4Vert: TLabeledEdit;
    lbl_edtEtiqueta5Horiz: TLabeledEdit;
    lbl_edtEtiqueta5Vert: TLabeledEdit;
    lbl_edtEtiqueta6Horiz: TLabeledEdit;
    lbl_edtEtiqueta6Vert: TLabeledEdit;
    lbl_edtEtiqueta7Horiz: TLabeledEdit;
    lbl_edtEtiqueta7Vert: TLabeledEdit;
    lbl_edtEtiqueta8Horiz: TLabeledEdit;
    lbl_edtEtiqueta8Vert: TLabeledEdit;
    lbl_edtEtiqueta9Horiz: TLabeledEdit;
    lbl_edtEtiqueta9Vert: TLabeledEdit;
    lbl_edtEtiqueta10Horiz: TLabeledEdit;
    lbl_edtEtiqueta10Vert: TLabeledEdit;
    lbl_edtEtiqueta11Horiz: TLabeledEdit;
    lbl_edtEtiqueta11Vert: TLabeledEdit;
    lbl_edtEtiqueta12Horiz: TLabeledEdit;
    lbl_edtEtiqueta12Vert: TLabeledEdit;
    lbl_edtEtiqueta13Horiz: TLabeledEdit;
    lbl_edtEtiqueta13Vert: TLabeledEdit;
    lbl_edtEtiqueta14Horiz: TLabeledEdit;
    lbl_edtEtiqueta14Vert: TLabeledEdit;
    lbl_edtEtiqueta15Horiz: TLabeledEdit;
    lbl_edtEtiqueta15Vert: TLabeledEdit;
    lbl_edtEtiqueta16Horiz: TLabeledEdit;
    lbl_edtEtiqueta16Vert: TLabeledEdit;
    lbl_edtEtiqueta17Horiz: TLabeledEdit;
    lbl_edtEtiqueta17Vert: TLabeledEdit;
    lbl_edtEtiqueta18Horiz: TLabeledEdit;
    lbl_edtEtiqueta18Vert: TLabeledEdit;
    lbl_edtEtiqueta19Horiz: TLabeledEdit;
    lbl_edtEtiqueta19Vert: TLabeledEdit;
    lbl_edtEtiqueta20Horiz: TLabeledEdit;
    lbl_edtEtiqueta20Vert: TLabeledEdit;
    lbl_edtEtiqueta21Horiz: TLabeledEdit;
    lbl_edtEtiqueta21Vert: TLabeledEdit;
    lbl_edtEtiqueta22Horiz: TLabeledEdit;
    lbl_edtEtiqueta22Vert: TLabeledEdit;
    lbl_edtEtiqueta23Horiz: TLabeledEdit;
    lbl_edtEtiqueta23Vert: TLabeledEdit;
    lbl_edtEtiqueta24Horiz: TLabeledEdit;
    lbl_edtEtiqueta24Vert: TLabeledEdit;
    lbl_edtVlr1Horz: TLabeledEdit;
    lbl_edtVlr1Vert: TLabeledEdit;
    lbl_edtVlr2Horiz: TLabeledEdit;
    lbl_edtVlr2Vert: TLabeledEdit;
    lbl_edtVlr3Horiz: TLabeledEdit;
    lbl_edtVlr3Vert: TLabeledEdit;
    lbl_edtVlr4Horiz: TLabeledEdit;
    lbl_edtVlr4Vert: TLabeledEdit;
    lbl_edtVlr5Horiz: TLabeledEdit;
    lbl_edtvlr5Vert: TLabeledEdit;
    lbl_edtVlr6Horiz: TLabeledEdit;
    lbl_edtVlr6Vert: TLabeledEdit;
    lbl_edtVlr7Horiz: TLabeledEdit;
    lbl_edtVlr7Vert: TLabeledEdit;
    lbl_edtVlr8Horiz: TLabeledEdit;
    lbl_edtVlr8Vert: TLabeledEdit;
    lbl_edtVlr9Horiz: TLabeledEdit;
    lbl_edtVlr9Vert: TLabeledEdit;
    lbl_edtVlr10Horiz: TLabeledEdit;
    lbl_edtVlr10Vert: TLabeledEdit;
    lbl_edtVlr11Horiz: TLabeledEdit;
    lbl_edtVlr11Vert: TLabeledEdit;
    lbl_edtVlr12Horiz: TLabeledEdit;
    lbl_edtVlr12Vert: TLabeledEdit;
    lbl_edtVlr13Horiz: TLabeledEdit;
    lbl_edtVlr13Vert: TLabeledEdit;
    lbl_edtVlr14Horiz: TLabeledEdit;
    lbl_edtVlr14Vert: TLabeledEdit;
    lbl_edtVlr15Horiz: TLabeledEdit;
    lbl_edtVlr15Vert: TLabeledEdit;
    lbl_edtVlr16Horiz: TLabeledEdit;
    lbl_edtVlr16Vert: TLabeledEdit;
    lbl_edtVlr17Horiz: TLabeledEdit;
    lbl_edtVlr17Vert: TLabeledEdit;
    lbl_edtVlr18Horiz: TLabeledEdit;
    lbl_edtVlr18Vert: TLabeledEdit;
    lbl_edtVlr19Horiz: TLabeledEdit;
    lbl_edtVlr19Vert: TLabeledEdit;
    lbl_edtVlr20Horiz: TLabeledEdit;
    lbl_edtVlr20Vert: TLabeledEdit;
    lbl_edtVlr21Horiz: TLabeledEdit;
    lbl_edtVlr21Vert: TLabeledEdit;
    lbl_edtVlr22Horiz: TLabeledEdit;
    lbl_edtVlr22Vert: TLabeledEdit;
    lbl_edtVlr23Horiz: TLabeledEdit;
    lbl_edtVlr23Vert: TLabeledEdit;
    lbl_edtVlr24Horiz: TLabeledEdit;
    lbl_edtVlr24Vert: TLabeledEdit;
    lbl_edtRefV1: TLabeledEdit;
    lbl_edtRefH2: TLabeledEdit;
    lbl_edtRefV2: TLabeledEdit;
    lbl_edtRefH3: TLabeledEdit;
    lbl_edtRefV3: TLabeledEdit;
    lbl_edtRefH4: TLabeledEdit;
    lbl_edtRefV4: TLabeledEdit;
    lbl_edtRefH5: TLabeledEdit;
    lbl_edtRefV5: TLabeledEdit;
    lbl_edtRefH6: TLabeledEdit;
    lbl_edtRefV6: TLabeledEdit;
    lbl_edtRefH7: TLabeledEdit;
    lbl_edtRefV7: TLabeledEdit;
    lbl_edtRefH8: TLabeledEdit;
    lbl_edtRefV8: TLabeledEdit;
    lbl_edtRefH9: TLabeledEdit;
    lbl_edtRefV9: TLabeledEdit;
    lbl_edtRefH10: TLabeledEdit;
    lbl_edtRefV10: TLabeledEdit;
    lbl_edtRefH11: TLabeledEdit;
    lbl_edtRefV11: TLabeledEdit;
    lbl_edtRefH12: TLabeledEdit;
    lbl_edtRefV12: TLabeledEdit;
    lbl_edtRefH13: TLabeledEdit;
    lbl_edtRefV13: TLabeledEdit;
    lbl_edtRefH14: TLabeledEdit;
    lbl_edtRefV14: TLabeledEdit;
    lbl_edtRefH15: TLabeledEdit;
    lbl_edtRefV15: TLabeledEdit;
    lbl_edtRefH16: TLabeledEdit;
    lbl_edtRefV16: TLabeledEdit;
    lbl_edtRefH17: TLabeledEdit;
    lbl_edtRefV17: TLabeledEdit;
    lbl_edtRefH18: TLabeledEdit;
    lbl_edtRefV18: TLabeledEdit;
    lbl_edtRefH19: TLabeledEdit;
    lbl_edtRefV19: TLabeledEdit;
    lbl_edtRefH20: TLabeledEdit;
    lbl_edtRefV20: TLabeledEdit;
    lbl_edtRefH21: TLabeledEdit;
    lbl_edtRefV21: TLabeledEdit;
    lbl_edtRefH22: TLabeledEdit;
    lbl_edtRefV22: TLabeledEdit;
    lbl_edtRefH23: TLabeledEdit;
    lbl_edtRefV23: TLabeledEdit;
    lbl_edtRefH24: TLabeledEdit;
    lbl_edtRefV24: TLabeledEdit;
    lbl_edtRefH1: TLabeledEdit;
    Shape2: TShape;
    lbl_edtCodInternoH1: TLabeledEdit;
    lbl_edtCodInternoV1: TLabeledEdit;
    lbl_edtCodInternoH2: TLabeledEdit;
    lbl_edtCodInternoV2: TLabeledEdit;
    lbl_edtCodInternoH3: TLabeledEdit;
    lbl_edtCodInternoV3: TLabeledEdit;
    lbl_edtCodInternoH4: TLabeledEdit;
    lbl_edtCodInternoV4: TLabeledEdit;
    lbl_edtCodInternoH5: TLabeledEdit;
    lbl_edtCodInternoV5: TLabeledEdit;
    lbl_edtCodInternoH6: TLabeledEdit;
    lbl_edtCodInternoV6: TLabeledEdit;
    lbl_edtCodInternoH7: TLabeledEdit;
    lbl_edtCodInternoV7: TLabeledEdit;
    lbl_edtCodInternoH8: TLabeledEdit;
    lbl_edtCodInternoV8: TLabeledEdit;
    lbl_edtCodInternoH9: TLabeledEdit;
    lbl_edtCodInternoV9: TLabeledEdit;
    lbl_edtCodInternoH10: TLabeledEdit;
    lbl_edtCodInternoV10: TLabeledEdit;
    lbl_edtCodInternoH11: TLabeledEdit;
    lbl_edtCodInternoV11: TLabeledEdit;
    lbl_edtCodInternoH12: TLabeledEdit;
    lbl_edtCodInternoV12: TLabeledEdit;
    lbl_edtCodInternoH13: TLabeledEdit;
    lbl_edtCodInternoV13: TLabeledEdit;
    lbl_edtCodInternoH14: TLabeledEdit;
    lbl_edtCodInternoV14: TLabeledEdit;
    lbl_edtCodInternoH15: TLabeledEdit;
    lbl_edtCodInternoV15: TLabeledEdit;
    lbl_edtCodInternoH16: TLabeledEdit;
    lbl_edtCodInternoV16: TLabeledEdit;
    lbl_edtCodInternoH17: TLabeledEdit;
    lbl_edtCodInternoV17: TLabeledEdit;
    lbl_edtCodInternoH18: TLabeledEdit;
    lbl_edtCodInternoV18: TLabeledEdit;
    lbl_edtCodInternoH19: TLabeledEdit;
    lbl_edtCodInternoV19: TLabeledEdit;
    lbl_edtCodInternoH20: TLabeledEdit;
    lbl_edtCodInternoV20: TLabeledEdit;
    lbl_edtCodInternoH21: TLabeledEdit;
    lbl_edtCodInternoV21: TLabeledEdit;
    lbl_edtCodInternoH22: TLabeledEdit;
    lbl_edtCodInternoV22: TLabeledEdit;
    lbl_edtCodInternoH23: TLabeledEdit;
    lbl_edtCodInternoV23: TLabeledEdit;
    lbl_edtCodInternoH24: TLabeledEdit;
    lbl_edtCodInternoV24: TLabeledEdit;
    tbsFabrUnid: TTabSheet;
    lbl_edtFabrV1: TLabeledEdit;
    lbl_edtFabrH1: TLabeledEdit;
    lbl_edtFabrH2: TLabeledEdit;
    lbl_edtFabrV2: TLabeledEdit;
    lbl_edtFabrH3: TLabeledEdit;
    lbl_edtFabrV3: TLabeledEdit;
    lbl_edtFabrH4: TLabeledEdit;
    lbl_edtFabrV4: TLabeledEdit;
    lbl_edtFabrH5: TLabeledEdit;
    lbl_edtFabrH9: TLabeledEdit;
    lbl_edtFabrH13: TLabeledEdit;
    lbl_edtFabrH17: TLabeledEdit;
    lbl_edtFabrH21: TLabeledEdit;
    lbl_edtFabrV21: TLabeledEdit;
    lbl_edtFabrV17: TLabeledEdit;
    lbl_edtFabrV13: TLabeledEdit;
    lbl_edtFabrV9: TLabeledEdit;
    lbl_edtFabrV5: TLabeledEdit;
    lbl_edtFabrH22: TLabeledEdit;
    lbl_edtFabrH18: TLabeledEdit;
    lbl_edtFabrH14: TLabeledEdit;
    lbl_edtFabrH10: TLabeledEdit;
    lbl_edtFabrH6: TLabeledEdit;
    lbl_edtFabrV22: TLabeledEdit;
    lbl_edtFabrV18: TLabeledEdit;
    lbl_edtFabrV14: TLabeledEdit;
    lbl_edtFabrV10: TLabeledEdit;
    lbl_edtFabrV6: TLabeledEdit;
    lbl_edtFabrH23: TLabeledEdit;
    lbl_edtFabrH19: TLabeledEdit;
    lbl_edtFabrH15: TLabeledEdit;
    lbl_edtFabrH11: TLabeledEdit;
    lbl_edtFabrH7: TLabeledEdit;
    lbl_edtFabrV23: TLabeledEdit;
    lbl_edtFabrV19: TLabeledEdit;
    lbl_edtFabrV15: TLabeledEdit;
    lbl_edtFabrV11: TLabeledEdit;
    lbl_edtFabrV7: TLabeledEdit;
    lbl_edtFabrH24: TLabeledEdit;
    lbl_edtFabrH20: TLabeledEdit;
    lbl_edtFabrH16: TLabeledEdit;
    lbl_edtFabrH12: TLabeledEdit;
    lbl_edtFabrH8: TLabeledEdit;
    lbl_edtFabrV24: TLabeledEdit;
    lbl_edtFabrV20: TLabeledEdit;
    lbl_edtFabrV16: TLabeledEdit;
    lbl_edtFabrV12: TLabeledEdit;
    lbl_edtFabrV8: TLabeledEdit;
    Shape3: TShape;
    lbl_edtUnidH1: TLabeledEdit;
    lbl_edtUnidV1: TLabeledEdit;
    lbl_edtUnidH2: TLabeledEdit;
    lbl_edtUnidV2: TLabeledEdit;
    lbl_edtUnidH3: TLabeledEdit;
    lbl_edtUnidV3: TLabeledEdit;
    lbl_edtUnidH4: TLabeledEdit;
    lbl_edtUnidV4: TLabeledEdit;
    lbl_edtUnidV8: TLabeledEdit;
    lbl_edtUnidH8: TLabeledEdit;
    lbl_edtUnidV7: TLabeledEdit;
    lbl_edtUnidH7: TLabeledEdit;
    lbl_edtUnidV6: TLabeledEdit;
    lbl_edtUnidH6: TLabeledEdit;
    lbl_edtUnidV5: TLabeledEdit;
    lbl_edtUnidH5: TLabeledEdit;
    lbl_edtUnidH9: TLabeledEdit;
    lbl_edtUnidH13: TLabeledEdit;
    lbl_edtUnidH17: TLabeledEdit;
    lbl_edtUnidH21: TLabeledEdit;
    lbl_edtUnidV21: TLabeledEdit;
    lbl_edtUnidV17: TLabeledEdit;
    lbl_edtUnidV13: TLabeledEdit;
    lbl_edtUnidV9: TLabeledEdit;
    lbl_edtUnidH10: TLabeledEdit;
    lbl_edtUnidH14: TLabeledEdit;
    lbl_edtUnidH18: TLabeledEdit;
    lbl_edtUnidH22: TLabeledEdit;
    lbl_edtUnidV22: TLabeledEdit;
    lbl_edtUnidV18: TLabeledEdit;
    lbl_edtUnidV14: TLabeledEdit;
    lbl_edtUnidV10: TLabeledEdit;
    lbl_edtUnidH11: TLabeledEdit;
    lbl_edtUnidH15: TLabeledEdit;
    lbl_edtUnidH19: TLabeledEdit;
    lbl_edtUnidH23: TLabeledEdit;
    lbl_edtUnidV23: TLabeledEdit;
    lbl_edtUnidV19: TLabeledEdit;
    lbl_edtUnidV15: TLabeledEdit;
    lbl_edtUnidV11: TLabeledEdit;
    lbl_edtUnidH12: TLabeledEdit;
    lbl_edtUnidH16: TLabeledEdit;
    lbl_edtUnidH20: TLabeledEdit;
    lbl_edtUnidH24: TLabeledEdit;
    lbl_edtUnidV24: TLabeledEdit;
    lbl_edtUnidV20: TLabeledEdit;
    lbl_edtUnidV16: TLabeledEdit;
    lbl_edtUnidV12: TLabeledEdit;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTConfigEtiqueta;
    procedure GravarConfig;
    procedure ibeaImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibeaGravarConfigClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigEtiquetaGr: TfrmConfigEtiquetaGr;

implementation

uses untdmModule, funcPosto, DB;

{$R *.dfm}

procedure TfrmConfigEtiquetaGr.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConfigEtiquetaGr.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmConfigEtiquetaGr.ExecSELECTConfigEtiqueta;

begin

  with dmModule do begin

    Commit(ibEtiquetaGrande);
    ibEtiquetaGrande.Close;
    ibEtiquetaGrande.SQL.Clear;
    ibEtiquetaGrande.SQL.Add('SELECT * FROM TBLETIQUETAGRANDE');
    ibEtiquetaGrande.Open;

    if ibEtiquetaGrande.RecordCount > 0 Then begin


////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA1HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA1HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta1Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA1HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta1Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA1VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA1VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta1Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA1VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta1Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA2HORIZ').AsInteger = 0)or (ibEtiquetaGrande.FieldByName('ETIQUETA2HORIZ').AsInteger > 0)then begin

        lbl_edtEtiqueta2Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA2HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta2Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA2VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA2VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta2Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA2VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta2Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA3HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA3HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta3Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA3HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta3Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA3VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA3VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta3Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA3VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta3Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA4HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA4HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta4Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA4HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta4Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA4VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA4VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta4Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA4VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta4Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA5HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA5HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta5Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA5HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta5Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA5VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA5VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta5Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA5VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta5Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA6HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA6HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta6Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA6HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta6Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA6VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA6VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta6Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA6VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta6Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA7HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA7HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta7Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA7HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta7Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA7VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA7VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta7Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA7VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta7Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA8HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA8HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta8Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA8HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta8Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA8VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA8VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta8Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA8VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta8Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA9HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA9HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta9Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA9HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta9Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA9VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA9VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta9Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA9VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta9Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA10HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA10HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta10Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA10HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta10Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA10VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA10VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta10Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA10VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta10Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA11HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA11HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta11Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA11HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta11Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA11VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA11VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta11Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA11VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta11Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA12HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA12HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta12Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA12HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta12Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA12VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA12VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta12Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA12VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta12Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA13HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA13HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta13Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA13HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta13Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA13VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA13VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta13Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA13VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta13Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA14HORIZ').AsInteger = 0)or (ibEtiquetaGrande.FieldByName('ETIQUETA14HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta14Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA14HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta14Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA14VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA14VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta14Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA14VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta14Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA15HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA15HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta15Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA15HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta15Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA15VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA15VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta15Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA15VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta15Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA16HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA16HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta16Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA16HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta16Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA16VERT').AsInteger  = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA16VERT').AsInteger  > 0) then begin

        lbl_edtEtiqueta16Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA16VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta16Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA17HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA17HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta17Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA17HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta17Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA17VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA17VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta17Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA17VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta17Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA18HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA18HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta18Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA18HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta18Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA18VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA18VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta18Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA18VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta18Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA19HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA19HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta19Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA19HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta19Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA19VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA19VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta19Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA19VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta19Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA20HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA20HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta20Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA20HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta20Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA20VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA20VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta20Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA20VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta20Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA21HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA21HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta21Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA21HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta21Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA21VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA21VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta21Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA21VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta21Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA22HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA22HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta22Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA22HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta22Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA22VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA22VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta22Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA22VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta22Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA23HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA23HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta23Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA23HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta23Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA23VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA23VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta23Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA23VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta23Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('ETIQUETA24HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA24HORIZ').AsInteger > 0) then begin

        lbl_edtEtiqueta24Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA24HORIZ').AsInteger);

      end else begin

        lbl_edtEtiqueta24Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA24VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('ETIQUETA24VERT').AsInteger > 0) then begin

        lbl_edtEtiqueta24Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('ETIQUETA24VERT').AsInteger);

      end else begin

        lbl_edtEtiqueta24Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR1HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR1HORIZ').AsInteger > 0) then begin

        lbl_edtVlr1Horz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR1HORIZ').AsInteger);

      end else begin

        lbl_edtVlr1Horz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR1VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR1VERT').AsInteger > 0) then begin

        lbl_edtVlr1Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR1VERT').AsInteger);

      end else begin

        lbl_edtVlr1Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR2HORIZ').AsInteger = 0)or (ibEtiquetaGrande.FieldByName('VALOR2HORIZ').AsInteger > 0)then begin

        lbl_edtVlr2Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR2HORIZ').AsInteger);

      end else begin

        lbl_edtVlr2Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR2VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR2VERT').AsInteger > 0) then begin

        lbl_edtVlr2Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR2VERT').AsInteger);

      end else begin

        lbl_edtVlr2Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR3HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR3HORIZ').AsInteger > 0) then begin

        lbl_edtVlr3Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR3HORIZ').AsInteger);

      end else begin

        lbl_edtVlr3Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR3VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR3VERT').AsInteger > 0) then begin

        lbl_edtVlr3Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR3VERT').AsInteger);

      end else begin

        lbl_edtVlr3Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR4HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR4HORIZ').AsInteger > 0) then begin

        lbl_edtVlr4Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR4HORIZ').AsInteger);

      end else begin

        lbl_edtVlr4Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR4VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR4VERT').AsInteger > 0) then begin

        lbl_edtVlr4Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR4VERT').AsInteger);

      end else begin

        lbl_edtVlr4Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR5HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR5HORIZ').AsInteger > 0) then begin

        lbl_edtVlr5Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR5HORIZ').AsInteger);

      end else begin

        lbl_edtVlr5Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR5VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR5VERT').AsInteger > 0) then begin

        lbl_edtVlr5Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR5VERT').AsInteger);

      end else begin

        lbl_edtVlr5Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR6HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR6HORIZ').AsInteger > 0) then begin

        lbl_edtVlr6Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR6HORIZ').AsInteger);

      end else begin

        lbl_edtVlr6Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('ETIQUETA6VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR6VERT').AsInteger > 0) then begin

        lbl_edtVlr6Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR6VERT').AsInteger);

      end else begin

        lbl_edtVlr6Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR7HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR7HORIZ').AsInteger > 0) then begin

        lbl_edtVlr7Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR7HORIZ').AsInteger);

      end else begin

        lbl_edtVlr7Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR7VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR7VERT').AsInteger > 0) then begin

        lbl_edtVlr7Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR7VERT').AsInteger);

      end else begin

        lbl_edtVlr7Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR8HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR8HORIZ').AsInteger > 0) then begin

        lbl_edtVlr8Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR8HORIZ').AsInteger);

      end else begin

        lbl_edtVlr8Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR8VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR8VERT').AsInteger > 0) then begin

        lbl_edtVlr8Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR8VERT').AsInteger);

      end else begin

        lbl_edtVlr8Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR9HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR9HORIZ').AsInteger > 0) then begin

        lbl_edtVlr9Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR9HORIZ').AsInteger);

      end else begin

        lbl_edtVlr9Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR9VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR9VERT').AsInteger > 0) then begin

        lbl_edtVlr9Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR9VERT').AsInteger);

      end else begin

        lbl_edtVlr9Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR10HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR10HORIZ').AsInteger > 0) then begin

        lbl_edtVlr10Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR10HORIZ').AsInteger);

      end else begin

        lbl_edtVlr10Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR10VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR10VERT').AsInteger > 0) then begin

        lbl_edtVlr10Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR10VERT').AsInteger);

      end else begin

        lbl_edtVlr10Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR11HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR11HORIZ').AsInteger > 0) then begin

        lbl_edtVlr11Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR11HORIZ').AsInteger);

      end else begin

        lbl_edtVlr11Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR11VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR11VERT').AsInteger > 0) then begin

        lbl_edtVlr11Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR11VERT').AsInteger);

      end else begin

        lbl_edtVlr11Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR12HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR12HORIZ').AsInteger > 0) then begin

        lbl_edtVlr12Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR12HORIZ').AsInteger);

      end else begin

        lbl_edtVlr12Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR12VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR12VERT').AsInteger > 0) then begin

        lbl_edtVlr12Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR12VERT').AsInteger);

      end else begin

        lbl_edtVlr12Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR13HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR13HORIZ').AsInteger > 0) then begin

        lbl_edtVlr13Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR13HORIZ').AsInteger);

      end else begin

        lbl_edtVlr13Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR13VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR13VERT').AsInteger > 0) then begin

        lbl_edtVlr13Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR13VERT').AsInteger);

      end else begin

        lbl_edtVlr13Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR14HORIZ').AsInteger = 0)or (ibEtiquetaGrande.FieldByName('VALOR14HORIZ').AsInteger > 0) then begin

        lbl_edtVlr14Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR14HORIZ').AsInteger);

      end else begin

        lbl_edtVlr14Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR14VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR14VERT').AsInteger > 0) then begin

        lbl_edtVlr14Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR14VERT').AsInteger);

      end else begin

        lbl_edtVlr14Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR15HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR15HORIZ').AsInteger > 0) then begin

        lbl_edtVlr15Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR15HORIZ').AsInteger);

      end else begin

        lbl_edtVlr15Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR15VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR15VERT').AsInteger > 0) then begin

        lbl_edtVlr15Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR15VERT').AsInteger);

      end else begin

        lbl_edtVlr15Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR16HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR16HORIZ').AsInteger > 0) then begin

        lbl_edtVlr16Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR16HORIZ').AsInteger);

      end else begin

        lbl_edtVlr16Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR16VERT').AsInteger  = 0)or(ibEtiquetaGrande.FieldByName('VALOR16VERT').AsInteger  > 0) then begin

        lbl_edtVlr16Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR16VERT').AsInteger);

      end else begin

        lbl_edtVlr16Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR17HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR17HORIZ').AsInteger > 0) then begin

        lbl_edtVlr17Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR17HORIZ').AsInteger);

      end else begin

        lbl_edtVlr17Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR17VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR17VERT').AsInteger > 0) then begin

        lbl_edtVlr17Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR17VERT').AsInteger);

      end else begin

        lbl_edtVlr17Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR18HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR18HORIZ').AsInteger > 0) then begin

        lbl_edtVlr18Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR18HORIZ').AsInteger);

      end else begin

        lbl_edtVlr18Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR18VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR18VERT').AsInteger > 0) then begin

        lbl_edtVlr18Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR18VERT').AsInteger);

      end else begin

        lbl_edtVlr18Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR19HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR19HORIZ').AsInteger > 0) then begin

        lbl_edtVlr19Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR19HORIZ').AsInteger);

      end else begin

        lbl_edtVlr19Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR19VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR19VERT').AsInteger > 0) then begin

        lbl_edtVlr19Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR19VERT').AsInteger);

      end else begin

        lbl_edtVlr19Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR20HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR20HORIZ').AsInteger > 0) then begin

        lbl_edtVlr20Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR20HORIZ').AsInteger);

      end else begin

        lbl_edtVlr20Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR20VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR20VERT').AsInteger > 0) then begin

        lbl_edtVlr20Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR20VERT').AsInteger);

      end else begin

        lbl_edtVlr20Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR21HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR21HORIZ').AsInteger > 0) then begin

        lbl_edtVlr21Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR21HORIZ').AsInteger);

      end else begin

        lbl_edtVlr21Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR21VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR21VERT').AsInteger > 0) then begin

        lbl_edtVlr21Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR21VERT').AsInteger);

      end else begin

        lbl_edtVlr21Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR22HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR22HORIZ').AsInteger > 0) then begin

        lbl_edtVlr22Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR22HORIZ').AsInteger);

      end else begin

        lbl_edtVlr22Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR22VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR22VERT').AsInteger > 0) then begin

        lbl_edtVlr22Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR22VERT').AsInteger);

      end else begin

        lbl_edtVlr22Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR23HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR23HORIZ').AsInteger > 0) then begin

        lbl_edtVlr23Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR23HORIZ').AsInteger);

      end else begin

        lbl_edtVlr23Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR23VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR23VERT').AsInteger > 0) then begin

        lbl_edtVlr23Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR23VERT').AsInteger);

      end else begin

        lbl_edtVlr23Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

      if (ibEtiquetaGrande.FieldByName('VALOR24HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR24HORIZ').AsInteger > 0) then begin

        lbl_edtVlr24Horiz.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR24HORIZ').AsInteger);

      end else begin

        lbl_edtVlr24Horiz.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('VALOR24VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('VALOR24VERT').AsInteger > 0) then begin

        lbl_edtVlr24Vert.Text := IntToStr(ibEtiquetaGrande.FieldByName('VALOR24VERT').AsInteger);

      end else begin

        lbl_edtVlr24Vert.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

//ESTRUTURA PARA DADOS DA REFERENCIA

      if (ibEtiquetaGrande.FieldByName('REF1HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF1HORIZ').AsInteger > 0) then begin

        lbl_edtRefH1.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF1HORIZ').AsInteger);

      end else begin

        lbl_edtRefH1.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF1VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF1VERT').AsInteger > 0) then begin

        lbl_edtRefV1.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF1VERT').AsInteger);

      end else begin

        lbl_edtRefV1.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF2HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF2HORIZ').AsInteger > 0) then begin

        lbl_edtRefH2.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF2HORIZ').AsInteger);

      end else begin

        lbl_edtRefH2.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF2VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF2VERT').AsInteger > 0) then begin

        lbl_edtRefV2.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF2VERT').AsInteger);

      end else begin

        lbl_edtRefV2.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF3HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF3HORIZ').AsInteger > 0) then begin

        lbl_edtRefH3.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF3HORIZ').AsInteger);

      end else begin

        lbl_edtRefH3.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF3VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF3VERT').AsInteger > 0) then begin

        lbl_edtRefV3.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF3VERT').AsInteger);

      end else begin

        lbl_edtRefV3.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF4HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF4HORIZ').AsInteger > 0) then begin

        lbl_edtRefH4.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF4HORIZ').AsInteger);

      end else begin

        lbl_edtRefH4.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF4VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF4VERT').AsInteger > 0) then begin

        lbl_edtRefV4.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF4VERT').AsInteger);

      end else begin

        lbl_edtRefV4.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF5HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF5HORIZ').AsInteger > 0) then begin

        lbl_edtRefH5.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF5HORIZ').AsInteger);

      end else begin

        lbl_edtRefH5.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF5VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF5VERT').AsInteger > 0) then begin

        lbl_edtRefV5.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF5VERT').AsInteger);

      end else begin

        lbl_edtRefV5.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF6HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF6HORIZ').AsInteger > 0) then begin

        lbl_edtRefH6.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF6HORIZ').AsInteger);

      end else begin

        lbl_edtRefH6.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF6VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF6VERT').AsInteger > 0) then begin

        lbl_edtRefV6.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF6VERT').AsInteger);

      end else begin

        lbl_edtRefV6.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF7HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF7HORIZ').AsInteger > 0) then begin

        lbl_edtRefH7.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF7HORIZ').AsInteger);

      end else begin

        lbl_edtRefH7.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF7VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF7VERT').AsInteger > 0) then begin

        lbl_edtRefV7.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF7VERT').AsInteger);

      end else begin

        lbl_edtRefV7.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF8HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF8HORIZ').AsInteger > 0) then begin

        lbl_edtRefH8.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF8HORIZ').AsInteger);

      end else begin

        lbl_edtRefH8.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF8VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF8VERT').AsInteger > 0) then begin

        lbl_edtRefV8.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF8VERT').AsInteger);

      end else begin

        lbl_edtRefV8.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF9HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF9HORIZ').AsInteger > 0) then begin

        lbl_edtRefH9.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF9HORIZ').AsInteger);

      end else begin

        lbl_edtRefH9.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF9VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF9VERT').AsInteger > 0) then begin

        lbl_edtRefV9.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF9VERT').AsInteger);

      end else begin

        lbl_edtRefV9.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF10HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF10HORIZ').AsInteger > 0) then begin

        lbl_edtRefH10.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF10HORIZ').AsInteger);

      end else begin

        lbl_edtRefH10.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF10VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF10VERT').AsInteger > 0) then begin

        lbl_edtRefV10.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF10VERT').AsInteger);

      end else begin

        lbl_edtRefV10.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF11HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF11HORIZ').AsInteger > 0) then begin

        lbl_edtRefH11.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF11HORIZ').AsInteger);

      end else begin

        lbl_edtRefH11.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF11VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF11VERT').AsInteger > 0) then begin

        lbl_edtRefV11.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF11VERT').AsInteger);

      end else begin

        lbl_edtRefV11.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF12HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF12HORIZ').AsInteger > 0) then begin

        lbl_edtRefH12.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF12HORIZ').AsInteger);

      end else begin

        lbl_edtRefH12.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF12VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF12VERT').AsInteger > 0) then begin

        lbl_edtRefV12.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF12VERT').AsInteger);

      end else begin

        lbl_edtRefV12.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF13HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF13HORIZ').AsInteger > 0) then begin

        lbl_edtRefH13.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF13HORIZ').AsInteger);

      end else begin

        lbl_edtRefH13.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF13VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF13VERT').AsInteger > 0) then begin

        lbl_edtRefV13.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF13VERT').AsInteger);

      end else begin

        lbl_edtRefV13.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF14HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF14HORIZ').AsInteger > 0) then begin

        lbl_edtRefH14.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF14HORIZ').AsInteger);

      end else begin

        lbl_edtRefH14.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF14VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF14VERT').AsInteger > 0) then begin

        lbl_edtRefV14.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF14VERT').AsInteger);

      end else begin

        lbl_edtRefV14.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF15HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF15HORIZ').AsInteger > 0) then begin

        lbl_edtRefH15.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF15HORIZ').AsInteger);

      end else begin

        lbl_edtRefH15.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF15VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF15VERT').AsInteger > 0) then begin

        lbl_edtRefV15.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF15VERT').AsInteger);

      end else begin

        lbl_edtRefV15.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF16HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF16HORIZ').AsInteger > 0) then begin

        lbl_edtRefH16.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF16HORIZ').AsInteger);

      end else begin

        lbl_edtRefH16.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF16VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF16VERT').AsInteger > 0) then begin

        lbl_edtRefV16.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF16VERT').AsInteger);

      end else begin

        lbl_edtRefV16.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF17HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF17HORIZ').AsInteger > 0) then begin

        lbl_edtRefH17.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF17HORIZ').AsInteger);

      end else begin

        lbl_edtRefH17.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF17VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF17VERT').AsInteger > 0) then begin

        lbl_edtRefV17.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF17VERT').AsInteger);

      end else begin

        lbl_edtRefV17.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF18HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF18HORIZ').AsInteger > 0) then begin

        lbl_edtRefH18.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF18HORIZ').AsInteger);

      end else begin

        lbl_edtRefH18.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF18VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF18VERT').AsInteger > 0) then begin

        lbl_edtRefV18.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF18VERT').AsInteger);

      end else begin

        lbl_edtRefV18.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF19HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF19HORIZ').AsInteger > 0) then begin

        lbl_edtRefH19.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF19HORIZ').AsInteger);

      end else begin

        lbl_edtRefH19.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF19VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF19VERT').AsInteger > 0) then begin

        lbl_edtRefV19.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF19VERT').AsInteger);

      end else begin

        lbl_edtRefV19.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF20HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF20HORIZ').AsInteger > 0) then begin

        lbl_edtRefH20.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF20HORIZ').AsInteger);

      end else begin

        lbl_edtRefH20.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF20VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF20VERT').AsInteger > 0) then begin

        lbl_edtRefV20.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF20VERT').AsInteger);

      end else begin

        lbl_edtRefV20.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF21HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF21HORIZ').AsInteger > 0) then begin

        lbl_edtRefH21.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF21HORIZ').AsInteger);

      end else begin

        lbl_edtRefH21.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF21VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF21VERT').AsInteger > 0) then begin

        lbl_edtRefV21.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF21VERT').AsInteger);

      end else begin

        lbl_edtRefV21.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF22HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF22HORIZ').AsInteger > 0) then begin

        lbl_edtRefH22.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF22HORIZ').AsInteger);

      end else begin

        lbl_edtRefH22.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF22VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF22VERT').AsInteger > 0) then begin

        lbl_edtRefV22.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF22VERT').AsInteger);

      end else begin

        lbl_edtRefV22.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF23HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF23HORIZ').AsInteger > 0) then begin

        lbl_edtRefH23.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF23HORIZ').AsInteger);

      end else begin

        lbl_edtRefH23.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF23VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF23VERT').AsInteger > 0) then begin

        lbl_edtRefV23.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF23VERT').AsInteger);

      end else begin

        lbl_edtRefV23.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF24HORIZ').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF24HORIZ').AsInteger > 0) then begin

        lbl_edtRefH24.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF24HORIZ').AsInteger);

      end else begin

        lbl_edtRefH24.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('REF24VERT').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('REF24VERT').AsInteger > 0) then begin

        lbl_edtRefV24.Text := IntToStr(ibEtiquetaGrande.FieldByName('REF24VERT').AsInteger);

      end else begin

        lbl_edtRefV24.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

//ESTRUTURA PARA TRAZER OS DADOS DO CÓDIGO INTERNO

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ1').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ1').AsInteger > 0) then begin

        lbl_edtCodInternoH1.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ1').AsInteger);

      end else begin

        lbl_edtCodInternoH1.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT1').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT1').AsInteger > 0) then begin

        lbl_edtCodInternoV1.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT1').AsInteger);

      end else begin

        lbl_edtCodInternoV1.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ2').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ2').AsInteger > 0) then begin

        lbl_edtCodInternoH2.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ2').AsInteger);

      end else begin

        lbl_edtCodInternoH2.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT2').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT2').AsInteger > 0) then begin

        lbl_edtCodInternoV2.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT2').AsInteger);

      end else begin

        lbl_edtCodInternoV2.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ3').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ3').AsInteger > 0) then begin

        lbl_edtCodInternoH3.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ3').AsInteger);

      end else begin

        lbl_edtCodInternoH3.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT3').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT3').AsInteger > 0) then begin

        lbl_edtCodInternoV3.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT3').AsInteger);

      end else begin

        lbl_edtCodInternoV3.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ4').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ4').AsInteger > 0) then begin

        lbl_edtCodInternoH4.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ4').AsInteger);

      end else begin

        lbl_edtCodInternoH4.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT4').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT4').AsInteger > 0) then begin

        lbl_edtCodInternoV4.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT4').AsInteger);

      end else begin

        lbl_edtCodInternoV4.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ5').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ5').AsInteger > 0) then begin

        lbl_edtCodInternoH5.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ5').AsInteger);

      end else begin

        lbl_edtCodInternoH5.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT5').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT5').AsInteger > 0) then begin

        lbl_edtCodInternoV5.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT5').AsInteger);

      end else begin

        lbl_edtCodInternoV5.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ6').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ6').AsInteger > 0) then begin

        lbl_edtCodInternoH6.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ6').AsInteger);

      end else begin

        lbl_edtCodInternoH6.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT6').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT6').AsInteger > 0) then begin

        lbl_edtCodInternoV6.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT6').AsInteger);

      end else begin

        lbl_edtCodInternoV6.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ7').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ7').AsInteger > 0) then begin

        lbl_edtCodInternoH7.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ7').AsInteger);

      end else begin

        lbl_edtCodInternoH7.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT7').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT7').AsInteger > 0) then begin

        lbl_edtCodInternoV7.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT7').AsInteger);

      end else begin

        lbl_edtCodInternoV7.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ8').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ8').AsInteger > 0) then begin

        lbl_edtCodInternoH8.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ8').AsInteger);

      end else begin

        lbl_edtCodInternoH8.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT8').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT8').AsInteger > 0) then begin

        lbl_edtCodInternoV8.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT8').AsInteger);

      end else begin

        lbl_edtCodInternoV8.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ9').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ9').AsInteger > 0) then begin

        lbl_edtCodInternoH9.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ9').AsInteger);

      end else begin

        lbl_edtCodInternoH9.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT9').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT9').AsInteger > 0) then begin

        lbl_edtCodInternoV9.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT9').AsInteger);

      end else begin

        lbl_edtCodInternoV9.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ10').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ10').AsInteger > 0) then begin

        lbl_edtCodInternoH10.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ10').AsInteger);

      end else begin

        lbl_edtCodInternoH10.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT10').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT10').AsInteger > 0) then begin

        lbl_edtCodInternoV10.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT10').AsInteger);

      end else begin

        lbl_edtCodInternoV10.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ11').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ11').AsInteger > 0) then begin

        lbl_edtCodInternoH11.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ11').AsInteger);

      end else begin

        lbl_edtCodInternoH11.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT11').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT11').AsInteger > 0) then begin

        lbl_edtCodInternoV11.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT11').AsInteger);

      end else begin

        lbl_edtCodInternoV11.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ12').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ12').AsInteger > 0) then begin

        lbl_edtCodInternoH12.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ12').AsInteger);

      end else begin

        lbl_edtCodInternoH12.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT12').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT12').AsInteger > 0) then begin

        lbl_edtCodInternoV12.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT12').AsInteger);

      end else begin

        lbl_edtCodInternoV12.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ13').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ13').AsInteger > 0) then begin

        lbl_edtCodInternoH13.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ13').AsInteger);

      end else begin

        lbl_edtCodInternoH13.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT13').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT13').AsInteger > 0) then begin

        lbl_edtCodInternoV13.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT13').AsInteger);

      end else begin

        lbl_edtCodInternoV13.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ14').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ14').AsInteger > 0) then begin

        lbl_edtCodInternoH14.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ14').AsInteger);

      end else begin

        lbl_edtCodInternoH14.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT14').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT14').AsInteger > 0) then begin

        lbl_edtCodInternoV14.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT14').AsInteger);

      end else begin

        lbl_edtCodInternoV14.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ15').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ15').AsInteger > 0) then begin

        lbl_edtCodInternoH15.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ15').AsInteger);

      end else begin

        lbl_edtCodInternoH15.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT15').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT15').AsInteger > 0) then begin

        lbl_edtCodInternoV15.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT15').AsInteger);

      end else begin

        lbl_edtCodInternoV15.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ16').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ16').AsInteger > 0) then begin

        lbl_edtCodInternoH16.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ16').AsInteger);

      end else begin

        lbl_edtCodInternoH16.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT16').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT16').AsInteger > 0) then begin

        lbl_edtCodInternoV16.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT16').AsInteger);

      end else begin

        lbl_edtCodInternoV16.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ17').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ17').AsInteger > 0) then begin

        lbl_edtCodInternoH17.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ17').AsInteger);

      end else begin

        lbl_edtCodInternoH17.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT17').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT17').AsInteger > 0) then begin

        lbl_edtCodInternoV17.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT17').AsInteger);

      end else begin

        lbl_edtCodInternoV17.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ18').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ18').AsInteger > 0) then begin

        lbl_edtCodInternoH18.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ18').AsInteger);

      end else begin

        lbl_edtCodInternoH18.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT18').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT18').AsInteger > 0) then begin

        lbl_edtCodInternoV18.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT18').AsInteger);

      end else begin

        lbl_edtCodInternoV18.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ19').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ19').AsInteger > 0) then begin

        lbl_edtCodInternoH19.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ19').AsInteger);

      end else begin

        lbl_edtCodInternoH19.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT19').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT19').AsInteger > 0) then begin

        lbl_edtCodInternoV19.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT19').AsInteger);

      end else begin

        lbl_edtCodInternoV19.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ20').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ20').AsInteger > 0) then begin

        lbl_edtCodInternoH20.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ20').AsInteger);

      end else begin

        lbl_edtCodInternoH20.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT20').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT20').AsInteger > 0) then begin

        lbl_edtCodInternoV20.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT20').AsInteger);

      end else begin

        lbl_edtCodInternoV20.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ21').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ21').AsInteger > 0) then begin

        lbl_edtCodInternoH21.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ21').AsInteger);

      end else begin

        lbl_edtCodInternoH21.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT21').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT21').AsInteger > 0) then begin

        lbl_edtCodInternoV21.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT21').AsInteger);

      end else begin

        lbl_edtCodInternoV21.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ22').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ22').AsInteger > 0) then begin

        lbl_edtCodInternoH22.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ22').AsInteger);

      end else begin

        lbl_edtCodInternoH22.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT22').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT22').AsInteger > 0) then begin

        lbl_edtCodInternoV22.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT22').AsInteger);

      end else begin

        lbl_edtCodInternoV22.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ23').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ23').AsInteger > 0) then begin

        lbl_edtCodInternoH23.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ23').AsInteger);

      end else begin

        lbl_edtCodInternoH23.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT23').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT23').AsInteger > 0) then begin

        lbl_edtCodInternoV23.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT23').AsInteger);

      end else begin

        lbl_edtCodInternoV23.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTHORIZ24').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTHORIZ24').AsInteger > 0) then begin

        lbl_edtCodInternoH24.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTHORIZ24').AsInteger);

      end else begin

        lbl_edtCodInternoH24.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('CODINTVERT24').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('CODINTVERT24').AsInteger > 0) then begin

        lbl_edtCodInternoV24.Text := IntToStr(ibEtiquetaGrande.FieldByName('CODINTVERT24').AsInteger);

      end else begin

        lbl_edtCodInternoV24.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

//ESTRUTURA PARA TRAZER OS DADOS DO FABRICANTE

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ1').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ1').AsInteger > 0) then begin

        lbl_edtFabrH1.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ1').AsInteger);

      end else begin

        lbl_edtFabrH1.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT1').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT1').AsInteger > 0) then begin

        lbl_edtFabrV1.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT1').AsInteger);

      end else begin

        lbl_edtFabrV1.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ2').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ2').AsInteger > 0) then begin

        lbl_edtFabrH2.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ2').AsInteger);

      end else begin

        lbl_edtFabrH2.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT2').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT2').AsInteger > 0) then begin

        lbl_edtFabrV2.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT2').AsInteger);

      end else begin

        lbl_edtFabrV2.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ3').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ3').AsInteger > 0) then begin

        lbl_edtFabrH3.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ3').AsInteger);

      end else begin

        lbl_edtFabrH3.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT3').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT3').AsInteger > 0) then begin

        lbl_edtFabrV3.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT3').AsInteger);

      end else begin

        lbl_edtFabrV3.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ4').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ4').AsInteger > 0) then begin

        lbl_edtFabrH4.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ4').AsInteger);

      end else begin

        lbl_edtFabrH4.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT4').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT4').AsInteger > 0) then begin

        lbl_edtFabrV4.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT4').AsInteger);

      end else begin

        lbl_edtFabrV4.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ5').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ5').AsInteger > 0) then begin

        lbl_edtFabrH5.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ5').AsInteger);

      end else begin

        lbl_edtFabrH5.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT5').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT5').AsInteger > 0) then begin

        lbl_edtFabrV5.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT5').AsInteger);

      end else begin

        lbl_edtFabrV5.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ6').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ6').AsInteger > 0) then begin

        lbl_edtFabrH6.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ6').AsInteger);

      end else begin

        lbl_edtFabrH6.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT6').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT6').AsInteger > 0) then begin

        lbl_edtFabrV6.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT6').AsInteger);

      end else begin

        lbl_edtFabrV6.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ7').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ7').AsInteger > 0) then begin

        lbl_edtFabrH7.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ7').AsInteger);

      end else begin

        lbl_edtFabrH7.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT7').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT7').AsInteger > 0) then begin

        lbl_edtFabrV7.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT7').AsInteger);

      end else begin

        lbl_edtFabrV7.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ8').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ8').AsInteger > 0) then begin

        lbl_edtFabrH8.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ8').AsInteger);

      end else begin

        lbl_edtFabrH8.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT8').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT8').AsInteger > 0) then begin

        lbl_edtFabrV8.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT8').AsInteger);

      end else begin

        lbl_edtFabrV8.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ9').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ9').AsInteger > 0) then begin

        lbl_edtFabrH9.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ9').AsInteger);

      end else begin

        lbl_edtFabrH9.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT9').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT9').AsInteger > 0) then begin

        lbl_edtFabrV9.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT9').AsInteger);

      end else begin

        lbl_edtFabrV9.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ10').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ10').AsInteger > 0) then begin

        lbl_edtFabrH10.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ10').AsInteger);

      end else begin

        lbl_edtFabrH10.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT10').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT10').AsInteger > 0) then begin

        lbl_edtFabrV10.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT10').AsInteger);

      end else begin

        lbl_edtFabrV10.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ11').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ11').AsInteger > 0) then begin

        lbl_edtFabrH11.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ11').AsInteger);

      end else begin

        lbl_edtFabrH11.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT11').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT11').AsInteger > 0) then begin

        lbl_edtFabrV11.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT11').AsInteger);

      end else begin

        lbl_edtFabrV11.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ12').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ12').AsInteger > 0) then begin

        lbl_edtFabrH12.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ12').AsInteger);

      end else begin

        lbl_edtFabrH12.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT12').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT12').AsInteger > 0) then begin

        lbl_edtFabrV12.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT12').AsInteger);

      end else begin

        lbl_edtFabrV12.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ13').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ13').AsInteger > 0) then begin

        lbl_edtFabrH13.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ13').AsInteger);

      end else begin

        lbl_edtFabrH13.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT13').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT13').AsInteger > 0) then begin

        lbl_edtFabrV13.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT13').AsInteger);

      end else begin

        lbl_edtFabrV13.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ14').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ14').AsInteger > 0) then begin

        lbl_edtFabrH14.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ14').AsInteger);

      end else begin

        lbl_edtFabrH14.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT14').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT14').AsInteger > 0) then begin

        lbl_edtFabrV14.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT14').AsInteger);

      end else begin

        lbl_edtFabrV14.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ15').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ15').AsInteger > 0) then begin

        lbl_edtFabrH15.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ15').AsInteger);

      end else begin

        lbl_edtFabrH15.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT15').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT15').AsInteger > 0) then begin

        lbl_edtFabrV15.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT15').AsInteger);

      end else begin

        lbl_edtFabrV15.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ16').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ16').AsInteger > 0) then begin

        lbl_edtFabrH16.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ16').AsInteger);

      end else begin

        lbl_edtFabrH16.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT16').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT16').AsInteger > 0) then begin

        lbl_edtFabrV16.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT16').AsInteger);

      end else begin

        lbl_edtFabrV16.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ17').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ17').AsInteger > 0) then begin

        lbl_edtFabrH17.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ17').AsInteger);

      end else begin

        lbl_edtFabrH17.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT17').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT17').AsInteger > 0) then begin

        lbl_edtFabrV17.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT17').AsInteger);

      end else begin

        lbl_edtFabrV17.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ18').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ18').AsInteger > 0) then begin

        lbl_edtFabrH18.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ18').AsInteger);

      end else begin

        lbl_edtFabrH18.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT18').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT18').AsInteger > 0) then begin

        lbl_edtFabrV18.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT18').AsInteger);

      end else begin

        lbl_edtFabrV18.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ19').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ19').AsInteger > 0) then begin

        lbl_edtFabrH19.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ19').AsInteger);

      end else begin

        lbl_edtFabrH19.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT19').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT19').AsInteger > 0) then begin

        lbl_edtFabrV19.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT19').AsInteger);

      end else begin

        lbl_edtFabrV19.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ20').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ20').AsInteger > 0) then begin

        lbl_edtFabrH20.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ20').AsInteger);

      end else begin

        lbl_edtFabrH20.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT20').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT20').AsInteger > 0) then begin

        lbl_edtFabrV20.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT20').AsInteger);

      end else begin

        lbl_edtFabrV20.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ21').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ21').AsInteger > 0) then begin

        lbl_edtFabrH21.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ21').AsInteger);

      end else begin

        lbl_edtFabrH21.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT21').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT21').AsInteger > 0) then begin

        lbl_edtFabrV21.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT21').AsInteger);

      end else begin

        lbl_edtFabrV21.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ22').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ22').AsInteger > 0) then begin

        lbl_edtFabrH22.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ22').AsInteger);

      end else begin

        lbl_edtFabrH22.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT22').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT22').AsInteger > 0) then begin

        lbl_edtFabrV22.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT22').AsInteger);

      end else begin

        lbl_edtFabrV22.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ23').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ23').AsInteger > 0) then begin

        lbl_edtFabrH23.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ23').AsInteger);

      end else begin

        lbl_edtFabrH23.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT23').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT23').AsInteger > 0) then begin

        lbl_edtFabrV23.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT23').AsInteger);

      end else begin

        lbl_edtFabrV23.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRHORIZ24').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRHORIZ24').AsInteger > 0) then begin

        lbl_edtFabrH24.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRHORIZ24').AsInteger);

      end else begin

        lbl_edtFabrH24.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('FABRVERT24').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('FABRVERT24').AsInteger > 0) then begin

        lbl_edtFabrV24.Text := IntToStr(ibEtiquetaGrande.FieldByName('FABRVERT24').AsInteger);

      end else begin

        lbl_edtFabrV24.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

//ESTRUTURA PARA TRAZER OS DADOS DA UNIDADE

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ1').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ1').AsInteger > 0) then begin

        lbl_edtUnidH1.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ1').AsInteger);

      end else begin

        lbl_edtUnidH1.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT1').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT1').AsInteger > 0) then begin

        lbl_edtUnidV1.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT1').AsInteger);

      end else begin

        lbl_edtUnidV1.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ2').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ2').AsInteger > 0) then begin

        lbl_edtUnidH2.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ2').AsInteger);

      end else begin

        lbl_edtUnidH2.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT2').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT2').AsInteger > 0) then begin

        lbl_edtUnidV2.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT2').AsInteger);

      end else begin

        lbl_edtUnidV2.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ3').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ3').AsInteger > 0) then begin

        lbl_edtUnidH3.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ3').AsInteger);

      end else begin

        lbl_edtUnidH3.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT3').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT3').AsInteger > 0) then begin

        lbl_edtUnidV3.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT3').AsInteger);

      end else begin

        lbl_edtUnidV3.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ4').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ4').AsInteger > 0) then begin

        lbl_edtUnidH4.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ4').AsInteger);

      end else begin

        lbl_edtUnidH4.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT4').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT4').AsInteger > 0) then begin

        lbl_edtUnidV4.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT4').AsInteger);

      end else begin

        lbl_edtUnidV4.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ5').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ5').AsInteger > 0) then begin

        lbl_edtUnidH5.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ5').AsInteger);

      end else begin

        lbl_edtUnidH5.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT5').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT5').AsInteger > 0) then begin

        lbl_edtUnidV5.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT5').AsInteger);

      end else begin

        lbl_edtUnidV5.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ6').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ6').AsInteger > 0) then begin

        lbl_edtUnidH6.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ6').AsInteger);

      end else begin

        lbl_edtUnidH6.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT6').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT6').AsInteger > 0) then begin

        lbl_edtUnidV6.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT6').AsInteger);

      end else begin

        lbl_edtUnidV6.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ7').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ7').AsInteger > 0) then begin

        lbl_edtUnidH7.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ7').AsInteger);

      end else begin

        lbl_edtUnidH7.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT7').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT7').AsInteger > 0) then begin

        lbl_edtUnidV7.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT7').AsInteger);

      end else begin

        lbl_edtUnidV7.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ8').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ8').AsInteger > 0) then begin

        lbl_edtUnidH8.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ8').AsInteger);

      end else begin

        lbl_edtUnidH8.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT8').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT8').AsInteger > 0) then begin

        lbl_edtUnidV8.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT8').AsInteger);

      end else begin

        lbl_edtUnidV8.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ9').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ9').AsInteger > 0) then begin

        lbl_edtUnidH9.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ9').AsInteger);

      end else begin

        lbl_edtUnidH9.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT9').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT9').AsInteger > 0) then begin

        lbl_edtUnidV9.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT9').AsInteger);

      end else begin

        lbl_edtUnidV9.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ10').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ10').AsInteger > 0) then begin

        lbl_edtUnidH10.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ10').AsInteger);

      end else begin

        lbl_edtUnidH10.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT10').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT10').AsInteger > 0) then begin

        lbl_edtUnidV10.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT10').AsInteger);

      end else begin

        lbl_edtUnidV10.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ11').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ11').AsInteger > 0) then begin

        lbl_edtUnidH11.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ11').AsInteger);

      end else begin

        lbl_edtUnidH11.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT11').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT11').AsInteger > 0) then begin

        lbl_edtUnidV11.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT11').AsInteger);

      end else begin

        lbl_edtUnidV11.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ12').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ12').AsInteger > 0) then begin

        lbl_edtUnidH12.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ12').AsInteger);

      end else begin

        lbl_edtUnidH12.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT12').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT12').AsInteger > 0) then begin

        lbl_edtUnidV12.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT12').AsInteger);

      end else begin

        lbl_edtUnidV12.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ13').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ13').AsInteger > 0) then begin

        lbl_edtUnidH13.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ13').AsInteger);

      end else begin

        lbl_edtUnidH13.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT13').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT13').AsInteger > 0) then begin

        lbl_edtUnidV13.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT13').AsInteger);

      end else begin

        lbl_edtUnidV13.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ14').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ14').AsInteger > 0) then begin

        lbl_edtUnidH14.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ14').AsInteger);

      end else begin

        lbl_edtUnidH14.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT14').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT14').AsInteger > 0) then begin

        lbl_edtUnidV14.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT14').AsInteger);

      end else begin

        lbl_edtUnidV14.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ15').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ15').AsInteger > 0) then begin

        lbl_edtUnidH15.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ15').AsInteger);

      end else begin

        lbl_edtUnidH15.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT15').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT15').AsInteger > 0) then begin

        lbl_edtUnidV15.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT15').AsInteger);

      end else begin

        lbl_edtUnidV15.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ16').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ16').AsInteger > 0) then begin

        lbl_edtUnidH16.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ16').AsInteger);

      end else begin

        lbl_edtUnidH16.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT16').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT16').AsInteger > 0) then begin

        lbl_edtUnidV16.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT16').AsInteger);

      end else begin

        lbl_edtUnidV16.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ17').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ17').AsInteger > 0) then begin

        lbl_edtUnidH17.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ17').AsInteger);

      end else begin

        lbl_edtUnidH17.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT17').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT17').AsInteger > 0) then begin

        lbl_edtUnidV17.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT17').AsInteger);

      end else begin

        lbl_edtUnidV17.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ18').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ18').AsInteger > 0) then begin

        lbl_edtUnidH18.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ18').AsInteger);

      end else begin

        lbl_edtUnidH18.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT18').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT18').AsInteger > 0) then begin

        lbl_edtUnidV18.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT18').AsInteger);

      end else begin

        lbl_edtUnidV18.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ19').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ19').AsInteger > 0) then begin

        lbl_edtUnidH19.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ19').AsInteger);

      end else begin

        lbl_edtUnidH19.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT19').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT19').AsInteger > 0) then begin

        lbl_edtUnidV19.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT19').AsInteger);

      end else begin

        lbl_edtUnidV19.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ20').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ20').AsInteger > 0) then begin

        lbl_edtUnidH20.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ20').AsInteger);

      end else begin

        lbl_edtUnidH20.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT20').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT20').AsInteger > 0) then begin

        lbl_edtUnidV20.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT20').AsInteger);

      end else begin

        lbl_edtUnidV20.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ21').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ21').AsInteger > 0) then begin

        lbl_edtUnidH21.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ21').AsInteger);

      end else begin

        lbl_edtUnidH21.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT21').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT21').AsInteger > 0) then begin

        lbl_edtUnidV21.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT21').AsInteger);

      end else begin

        lbl_edtUnidV21.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ22').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ22').AsInteger > 0) then begin

        lbl_edtUnidH22.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ22').AsInteger);

      end else begin

        lbl_edtUnidH22.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT22').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT22').AsInteger > 0) then begin

        lbl_edtUnidV22.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT22').AsInteger);

      end else begin

        lbl_edtUnidV22.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ23').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ23').AsInteger > 0) then begin

        lbl_edtUnidH23.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ23').AsInteger);

      end else begin

        lbl_edtUnidH23.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT23').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT23').AsInteger > 0) then begin

        lbl_edtUnidV23.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT23').AsInteger);

      end else begin

        lbl_edtUnidV23.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDHORIZ24').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDHORIZ24').AsInteger > 0) then begin

        lbl_edtUnidH24.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDHORIZ24').AsInteger);

      end else begin

        lbl_edtUnidH24.Text := '0';

      end;

      if (ibEtiquetaGrande.FieldByName('UNIDVERT24').AsInteger = 0)or(ibEtiquetaGrande.FieldByName('UNIDVERT24').AsInteger > 0) then begin

        lbl_edtUnidV24.Text := IntToStr(ibEtiquetaGrande.FieldByName('UNIDVERT24').AsInteger);

      end else begin

        lbl_edtUnidV24.Text := '0';

      end;

////////////////////////////////////////////////////////////////////////////////

    end;//if recordcount

  end;//with

end;

procedure TfrmConfigEtiquetaGr.GravarConfig;

var
IDEtiqueta : Integer;
Et1Horiz,Et1Vert,Et2Horiz,Et2Vert,Et3Horiz,Et3Vert : Integer;
Et4Horiz,Et4Vert,Et5Horiz,Et5Vert,Et6Horiz,Et6Vert : Integer;
Et7Horiz,Et7Vert,Et8Horiz,Et8Vert,Et9Horiz,Et9Vert : Integer;
Et10Horiz,Et10Vert,Et11Horiz,Et11Vert,Et12Horiz,Et12Vert : Integer;
Et13Horiz,Et13Vert,Et14Horiz,Et14Vert,Et15Horiz,Et15Vert : Integer;
Et16Horiz,Et16Vert,Et17Horiz,Et17Vert,Et18Horiz,Et18Vert : Integer;
Et19Horiz,Et19Vert,Et20Horiz,Et20Vert,Et21Horiz,Et21Vert : Integer;
Et22Horiz,Et22Vert,Et23Horiz,Et23Vert,Et24Horiz,Et24Vert : Integer;

Vlr1Horiz,Vlr1Vert,Vlr2Horiz,Vlr2Vert,Vlr3Horiz,Vlr3Vert,Vlr4Horiz,Vlr4Vert : Integer;
Vlr5Horiz,Vlr5Vert,Vlr6Horiz,Vlr6Vert,Vlr7Horiz,Vlr7Vert,Vlr8Horiz,Vlr8Vert : Integer;
Vlr9Horiz,Vlr9Vert,Vlr10Horiz,Vlr10Vert,Vlr11Horiz,Vlr11Vert,Vlr12Horiz,Vlr12Vert : Integer;
Vlr13Horiz,Vlr13Vert,Vlr14Horiz,Vlr14Vert,Vlr15Horiz,Vlr15Vert,Vlr16Horiz,Vlr16Vert : Integer;
Vlr17Horiz,Vlr17Vert,Vlr18Horiz,Vlr18Vert,Vlr19Horiz,Vlr19Vert,Vlr20Horiz,Vlr20Vert : Integer;
Vlr21Horiz,Vlr21Vert,Vlr22Horiz,Vlr22Vert,Vlr23Horiz,Vlr23Vert,Vlr24Horiz,Vlr24Vert : Integer;

Ref1Horiz,Ref1Vert,Ref2Horiz,Ref2Vert,Ref3Horiz,Ref3Vert,Ref4Horiz,Ref4Vert : Integer;
Ref5Horiz,Ref5Vert,Ref6Horiz,Ref6Vert,Ref7Horiz,Ref7Vert,Ref8Horiz,Ref8Vert : Integer;
Ref9Horiz,Ref9Vert,Ref10Horiz,Ref10Vert,Ref11Horiz,Ref11Vert,Ref12Horiz,Ref12Vert : Integer;
Ref13Horiz,Ref13Vert,Ref14Horiz,Ref14Vert,Ref15Horiz,Ref15Vert,Ref16Horiz,Ref16Vert : Integer;
Ref17Horiz,Ref17Vert,Ref18Horiz,Ref18Vert,Ref19Horiz,Ref19Vert,Ref20Horiz,Ref20Vert : Integer;
Ref21Horiz,Ref21Vert,Ref22Horiz,Ref22Vert,Ref23Horiz,Ref23Vert,Ref24Horiz,Ref24Vert : Integer;

Cod1Horiz,Cod1Vert,Cod2Horiz,Cod2Vert,Cod3Horiz,Cod3Vert,Cod4Horiz,Cod4Vert : Integer;
Cod5Horiz,Cod5Vert,Cod6Horiz,Cod6Vert,Cod7Horiz,Cod7Vert,Cod8Horiz,Cod8Vert : Integer;
Cod9Horiz,Cod9Vert,Cod10Horiz,Cod10Vert,Cod11Horiz,Cod11Vert,Cod12Horiz,Cod12Vert : Integer;
Cod13Horiz,Cod13Vert,Cod14Horiz,Cod14Vert,Cod15Horiz,Cod15Vert,Cod16Horiz,Cod16Vert : Integer;
Cod17Horiz,Cod17Vert,Cod18Horiz,Cod18Vert,Cod19Horiz,Cod19Vert,Cod20Horiz,Cod20Vert : Integer;
Cod21Horiz,Cod21Vert,Cod22Horiz,Cod22Vert,Cod23Horiz,Cod23Vert,Cod24Horiz,Cod24Vert : Integer;

Fabr1Horiz,Fabr1Vert,Fabr2Horiz,Fabr2Vert,Fabr3Horiz,Fabr3Vert,Fabr4Horiz,Fabr4Vert : Integer;
Fabr5Horiz,Fabr5Vert,Fabr6Horiz,Fabr6Vert,Fabr7Horiz,Fabr7Vert,Fabr8Horiz,Fabr8Vert : Integer;
Fabr9Horiz,Fabr9Vert,Fabr10Horiz,Fabr10Vert,Fabr11Horiz,Fabr11Vert,Fabr12Horiz,Fabr12Vert : Integer;
Fabr13Horiz,Fabr13Vert,Fabr14Horiz,Fabr14Vert,Fabr15Horiz,Fabr15Vert,Fabr16Horiz,Fabr16Vert : Integer;
Fabr17Horiz,Fabr17Vert,Fabr18Horiz,Fabr18Vert,Fabr19Horiz,Fabr19Vert,Fabr20Horiz,Fabr20Vert : Integer;
Fabr21Horiz,Fabr21Vert,Fabr22Horiz,Fabr22Vert,Fabr23Horiz,Fabr23Vert,Fabr24Horiz,Fabr24Vert : Integer;

Unid1Horiz,Unid1Vert,Unid2Horiz,Unid2Vert,Unid3Horiz,Unid3Vert,Unid4Horiz,Unid4Vert : Integer;
Unid5Horiz,Unid5Vert,Unid6Horiz,Unid6Vert,Unid7Horiz,Unid7Vert,Unid8Horiz,Unid8Vert : Integer;
Unid9Horiz,Unid9Vert,Unid10Horiz,Unid10Vert,Unid11Horiz,Unid11Vert,Unid12Horiz,Unid12Vert : Integer;
Unid13Horiz,Unid13Vert,Unid14Horiz,Unid14Vert,Unid15Horiz,Unid15Vert,Unid16Horiz,Unid16Vert : Integer;
Unid17Horiz,Unid17Vert,Unid18Horiz,Unid18Vert,Unid19Horiz,Unid19Vert,Unid20Horiz,Unid20Vert : Integer;
Unid21Horiz,Unid21Vert,Unid22Horiz,Unid22Vert,Unid23Horiz,Unid23Vert,Unid24Horiz,Unid24Vert : Integer;

begin


  with dmModule do begin

    Commit(ibEtiquetaGrande);
    ibEtiquetaGrande.Close;
    ibEtiquetaGrande.SQL.Clear;
    ibEtiquetaGrande.SQL.Add('SELECT * FROM TBLETIQUETAGRANDE');
    ibEtiquetaGrande.Open;

    IDEtiqueta := ibEtiquetaGrande.FieldByName('IDETIQUETAGRANDE').AsInteger;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta1Horiz.Text <> '' Then begin

      Et1Horiz  := StrToInt(lbl_edtEtiqueta1Horiz.Text);

    end else begin

      Et1Horiz := 0;

    end;

    if lbl_edtEtiqueta1Vert.Text <> '' Then begin

      Et1Vert := StrToInt(lbl_edtEtiqueta1Vert.Text);

    end else begin

      Et1Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta2Horiz.Text <> '' Then begin

      Et2Horiz  := StrToInt(lbl_edtEtiqueta2Horiz.Text);

    end else begin

      Et2Horiz := 0;

    end;

    if lbl_edtEtiqueta2Vert.Text <> '' Then begin

      Et2Vert := StrToInt(lbl_edtEtiqueta2Vert.Text);

    end else begin

      Et2Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta3Horiz.Text <> '' Then begin

      Et3Horiz  := StrToInt(lbl_edtEtiqueta3Horiz.Text);

    end else begin

      Et3Horiz := 0;

    end;

    if lbl_edtEtiqueta3Vert.Text <> '' Then begin

      Et3Vert := StrToInt(lbl_edtEtiqueta3Vert.Text);

    end else begin

      Et3Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta4Horiz.Text <> '' Then begin

      Et4Horiz  := StrToInt(lbl_edtEtiqueta4Horiz.Text);

    end else begin

      Et4Horiz := 0;

    end;

    if lbl_edtEtiqueta4Vert.Text <> '' Then begin

      Et4Vert := StrToInt(lbl_edtEtiqueta4Vert.Text);

    end else begin

      Et4Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta5Horiz.Text <> '' Then begin

      Et5Horiz  := StrToInt(lbl_edtEtiqueta5Horiz.Text);

    end else begin

      Et5Horiz := 0;

    end;

    if lbl_edtEtiqueta5Vert.Text <> '' Then begin

      Et5Vert := StrToInt(lbl_edtEtiqueta5Vert.Text);

    end else begin

      Et5Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta6Horiz.Text <> '' Then begin

      Et6Horiz  := StrToInt(lbl_edtEtiqueta6Horiz.Text);

    end else begin

      Et6Horiz := 0;

    end;

    if lbl_edtEtiqueta6Vert.Text <> '' Then begin

      Et6Vert := StrToInt(lbl_edtEtiqueta6Vert.Text);

    end else begin

      Et6Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta7Horiz.Text <> '' Then begin

      Et7Horiz  := StrToInt(lbl_edtEtiqueta7Horiz.Text);

    end else begin

      Et7Horiz := 0;

    end;

    if lbl_edtEtiqueta7Vert.Text <> '' Then begin

      Et7Vert := StrToInt(lbl_edtEtiqueta7Vert.Text);

    end else begin

      Et7Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta8Horiz.Text <> '' Then begin

      Et8Horiz  := StrToInt(lbl_edtEtiqueta8Horiz.Text);

    end else begin

      Et8Horiz := 0;

    end;

    if lbl_edtEtiqueta8Vert.Text <> '' Then begin

      Et8Vert := StrToInt(lbl_edtEtiqueta8Vert.Text);

    end else begin

      Et8Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta9Horiz.Text <> '' Then begin

      Et9Horiz  := StrToInt(lbl_edtEtiqueta9Horiz.Text);

    end else begin

      Et9Horiz := 0;

    end;

    if lbl_edtEtiqueta9Vert.Text <> '' Then begin

      Et9Vert := StrToInt(lbl_edtEtiqueta9Vert.Text);

    end else begin

      Et9Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta10Horiz.Text <> '' Then begin

      Et10Horiz  := StrToInt(lbl_edtEtiqueta10Horiz.Text);

    end else begin

      Et10Horiz := 0;

    end;

    if lbl_edtEtiqueta10Vert.Text <> '' Then begin

      Et10Vert := StrToInt(lbl_edtEtiqueta10Vert.Text);

    end else begin

      Et10Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta11Horiz.Text <> '' Then begin

      Et11Horiz  := StrToInt(lbl_edtEtiqueta11Horiz.Text);

    end else begin

      Et11Horiz := 0;

    end;

    if lbl_edtEtiqueta11Vert.Text <> '' Then begin

      Et11Vert := StrToInt(lbl_edtEtiqueta11Vert.Text);

    end else begin

      Et11Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta12Horiz.Text <> '' Then begin

      Et12Horiz  := StrToInt(lbl_edtEtiqueta12Horiz.Text);

    end else begin

      Et12Horiz := 0;

    end;

    if lbl_edtEtiqueta12Vert.Text <> '' Then begin

      Et12Vert := StrToInt(lbl_edtEtiqueta12Vert.Text);

    end else begin

      Et12Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta13Horiz.Text <> '' Then begin

      Et13Horiz  := StrToInt(lbl_edtEtiqueta13Horiz.Text);

    end else begin

      Et13Horiz := 0;

    end;

    if lbl_edtEtiqueta13Vert.Text <> '' Then begin

      Et13Vert := StrToInt(lbl_edtEtiqueta13Vert.Text);

    end else begin

      Et13Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta14Horiz.Text <> '' Then begin

      Et14Horiz  := StrToInt(lbl_edtEtiqueta14Horiz.Text);

    end else begin

      Et14Horiz := 0;

    end;

    if lbl_edtEtiqueta14Vert.Text <> '' Then begin

      Et14Vert := StrToInt(lbl_edtEtiqueta14Vert.Text);

    end else begin

      Et14Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta15Horiz.Text <> '' Then begin

      Et15Horiz  := StrToInt(lbl_edtEtiqueta15Horiz.Text);

    end else begin

      Et15Horiz := 0;

    end;

    if lbl_edtEtiqueta15Vert.Text <> '' Then begin

      Et15Vert := StrToInt(lbl_edtEtiqueta15Vert.Text);

    end else begin

      Et15Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta16Horiz.Text <> '' Then begin

      Et16Horiz  := StrToInt(lbl_edtEtiqueta16Horiz.Text);

    end else begin

      Et16Horiz := 0;

    end;

    if lbl_edtEtiqueta16Vert.Text <> '' Then begin

      Et16Vert := StrToInt(lbl_edtEtiqueta16Vert.Text);

    end else begin

      Et16Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta17Horiz.Text <> '' Then begin

      Et17Horiz  := StrToInt(lbl_edtEtiqueta17Horiz.Text);

    end else begin

      Et17Horiz := 0;

    end;

    if lbl_edtEtiqueta17Vert.Text <> '' Then begin

      Et17Vert := StrToInt(lbl_edtEtiqueta17Vert.Text);

    end else begin

      Et17Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta18Horiz.Text <> '' Then begin

      Et18Horiz  := StrToInt(lbl_edtEtiqueta18Horiz.Text);

    end else begin

      Et18Horiz := 0;

    end;

    if lbl_edtEtiqueta18Vert.Text <> '' Then begin

      Et18Vert := StrToInt(lbl_edtEtiqueta18Vert.Text);

    end else begin

      Et18Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta19Horiz.Text <> '' Then begin

      Et19Horiz  := StrToInt(lbl_edtEtiqueta19Horiz.Text);

    end else begin

      Et19Horiz := 0;

    end;

    if lbl_edtEtiqueta19Vert.Text <> '' Then begin

      Et19Vert := StrToInt(lbl_edtEtiqueta19Vert.Text);

    end else begin

      Et19Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta20Horiz.Text <> '' Then begin

      Et20Horiz  := StrToInt(lbl_edtEtiqueta20Horiz.Text);

    end else begin

      Et20Horiz := 0;

    end;

    if lbl_edtEtiqueta20Vert.Text <> '' Then begin

      Et20Vert := StrToInt(lbl_edtEtiqueta20Vert.Text);

    end else begin

      Et20Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta21Horiz.Text <> '' Then begin

      Et21Horiz  := StrToInt(lbl_edtEtiqueta21Horiz.Text);

    end else begin

      Et21Horiz := 0;

    end;

    if lbl_edtEtiqueta21Vert.Text <> '' Then begin

      Et21Vert := StrToInt(lbl_edtEtiqueta21Vert.Text);

    end else begin

      Et21Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta22Horiz.Text <> '' Then begin

      Et22Horiz  := StrToInt(lbl_edtEtiqueta22Horiz.Text);

    end else begin

      Et22Horiz := 0;

    end;

    if lbl_edtEtiqueta22Vert.Text <> '' Then begin

      Et22Vert := StrToInt(lbl_edtEtiqueta22Vert.Text);

    end else begin

      Et22Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta23Horiz.Text <> '' Then begin

      Et23Horiz  := StrToInt(lbl_edtEtiqueta23Horiz.Text);

    end else begin

      Et23Horiz := 0;

    end;

    if lbl_edtEtiqueta23Vert.Text <> '' Then begin

      Et23Vert := StrToInt(lbl_edtEtiqueta23Vert.Text);

    end else begin

      Et23Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtEtiqueta24Horiz.Text <> '' Then begin

      Et24Horiz  := StrToInt(lbl_edtEtiqueta24Horiz.Text);

    end else begin

      Et24Horiz := 0;

    end;

    if lbl_edtEtiqueta24Vert.Text <> '' Then begin

      Et24Vert := StrToInt(lbl_edtEtiqueta24Vert.Text);

    end else begin

      Et24Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr1Horz.Text <> '' Then begin

      Vlr1Horiz  := StrToInt(lbl_edtVlr1Horz.Text);

    end else begin

      Vlr1Horiz := 0;

    end;

    if lbl_edtVlr1Vert.Text <> '' Then begin

      Vlr1Vert := StrToInt(lbl_edtVlr1Vert.Text);

    end else begin

      Vlr1Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr2Horiz.Text <> '' Then begin

      Vlr2Horiz  := StrToInt(lbl_edtVlr2Horiz.Text);

    end else begin

      Vlr2Horiz := 0;

    end;

    if lbl_edtVlr2Vert.Text <> '' Then begin

      Vlr2Vert := StrToInt(lbl_edtVlr2Vert.Text);

    end else begin

      Vlr2Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr3Horiz.Text <> '' Then begin

      Vlr3Horiz  := StrToInt(lbl_edtVlr3Horiz.Text);

    end else begin

      Vlr3Horiz := 0;

    end;

    if lbl_edtVlr3Vert.Text <> '' Then begin

      Vlr3Vert := StrToInt(lbl_edtVlr3Vert.Text);

    end else begin

      Vlr3Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr4Horiz.Text <> '' Then begin

      Vlr4Horiz  := StrToInt(lbl_edtVlr4Horiz.Text);

    end else begin

      Vlr4Horiz := 0;

    end;

    if lbl_edtVlr4Vert.Text <> '' Then begin

      Vlr4Vert := StrToInt(lbl_edtVlr4Vert.Text);

    end else begin

      Vlr4Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr5Horiz.Text <> '' Then begin

      Vlr5Horiz  := StrToInt(lbl_edtVlr5Horiz.Text);

    end else begin

      Vlr5Horiz := 0;

    end;

    if lbl_edtVlr5Vert.Text <> '' Then begin

      Vlr5Vert := StrToInt(lbl_edtVlr5Vert.Text);

    end else begin

      Vlr5Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr6Horiz.Text <> '' Then begin

      Vlr6Horiz  := StrToInt(lbl_edtVlr6Horiz.Text);

    end else begin

      Vlr6Horiz := 0;

    end;

    if lbl_edtVlr6Vert.Text <> '' Then begin

      Vlr6Vert := StrToInt(lbl_edtVlr6Vert.Text);

    end else begin

      Vlr6Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr7Horiz.Text <> '' Then begin

      Vlr7Horiz  := StrToInt(lbl_edtVlr7Horiz.Text);

    end else begin

      Vlr7Horiz := 0;

    end;

    if lbl_edtVlr7Vert.Text <> '' Then begin

      Vlr7Vert := StrToInt(lbl_edtVlr7Vert.Text);

    end else begin

      Vlr7Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr8Horiz.Text <> '' Then begin

      Vlr8Horiz  := StrToInt(lbl_edtVlr8Horiz.Text);

    end else begin

      Vlr8Horiz := 0;

    end;

    if lbl_edtVlr8Vert.Text <> '' Then begin

      Vlr8Vert := StrToInt(lbl_edtVlr8Vert.Text);

    end else begin

      Vlr8Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr9Horiz.Text <> '' Then begin

      Vlr9Horiz  := StrToInt(lbl_edtVlr9Horiz.Text);

    end else begin

      Vlr9Horiz := 0;

    end;

    if lbl_edtVlr9Vert.Text <> '' Then begin

      Vlr9Vert := StrToInt(lbl_edtVlr9Vert.Text);

    end else begin

      Vlr9Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr10Horiz.Text <> '' Then begin

      Vlr10Horiz  := StrToInt(lbl_edtVlr10Horiz.Text);

    end else begin

      Vlr10Horiz := 0;

    end;

    if lbl_edtVlr10Vert.Text <> '' Then begin

      Vlr10Vert := StrToInt(lbl_edtVlr10Vert.Text);

    end else begin

      Vlr10Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr11Horiz.Text <> '' Then begin

      Vlr11Horiz  := StrToInt(lbl_edtVlr11Horiz.Text);

    end else begin

      Vlr11Horiz := 0;

    end;

    if lbl_edtVlr11Vert.Text <> '' Then begin

      Vlr11Vert := StrToInt(lbl_edtVlr11Vert.Text);

    end else begin

      Vlr11Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr12Horiz.Text <> '' Then begin

      Vlr12Horiz  := StrToInt(lbl_edtVlr12Horiz.Text);

    end else begin

      Vlr12Horiz := 0;

    end;

    if lbl_edtVlr12Vert.Text <> '' Then begin

      Vlr12Vert := StrToInt(lbl_edtVlr12Vert.Text);

    end else begin

      Vlr12Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr13Horiz.Text <> '' Then begin

      Vlr13Horiz  := StrToInt(lbl_edtVlr13Horiz.Text);

    end else begin

      Vlr13Horiz := 0;

    end;

    if lbl_edtVlr13Vert.Text <> '' Then begin

      Vlr13Vert := StrToInt(lbl_edtVlr13Vert.Text);

    end else begin

      Vlr13Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr14Horiz.Text <> '' Then begin

      Vlr14Horiz  := StrToInt(lbl_edtVlr14Horiz.Text);

    end else begin

      Vlr14Horiz := 0;

    end;

    if lbl_edtVlr14Vert.Text <> '' Then begin

      Vlr14Vert := StrToInt(lbl_edtVlr14Vert.Text);

    end else begin

      Vlr14Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////


    if lbl_edtVlr15Horiz.Text <> '' Then begin

      Vlr15Horiz  := StrToInt(lbl_edtVlr15Horiz.Text);

    end else begin

      Vlr15Horiz := 0;

    end;

    if lbl_edtVlr15Vert.Text <> '' Then begin

      Vlr15Vert := StrToInt(lbl_edtVlr15Vert.Text);

    end else begin

      Vlr15Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////


    if lbl_edtVlr16Horiz.Text <> '' Then begin

      Vlr16Horiz  := StrToInt(lbl_edtVlr16Horiz.Text);

    end else begin

      Vlr16Horiz := 0;

    end;

    if lbl_edtVlr16Vert.Text <> '' Then begin

      Vlr16Vert := StrToInt(lbl_edtVlr16Vert.Text);

    end else begin

      Vlr16Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr17Horiz.Text <> '' Then begin

      Vlr17Horiz  := StrToInt(lbl_edtVlr17Horiz.Text);

    end else begin

      Vlr17Horiz := 0;

    end;

    if lbl_edtVlr17Vert.Text <> '' Then begin

      Vlr17Vert := StrToInt(lbl_edtVlr17Vert.Text);

    end else begin

      Vlr17Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr18Horiz.Text <> '' Then begin

      Vlr18Horiz  := StrToInt(lbl_edtVlr18Horiz.Text);

    end else begin

      Vlr18Horiz := 0;

    end;

    if lbl_edtVlr18Vert.Text <> '' Then begin

      Vlr18Vert := StrToInt(lbl_edtVlr18Vert.Text);

    end else begin

      Vlr18Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////


    if lbl_edtVlr19Horiz.Text <> '' Then begin

      Vlr19Horiz  := StrToInt(lbl_edtVlr19Horiz.Text);

    end else begin

      Vlr19Horiz := 0;

    end;

    if lbl_edtVlr19Vert.Text <> '' Then begin

      Vlr19Vert := StrToInt(lbl_edtVlr19Vert.Text);

    end else begin

      Vlr19Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////


    if lbl_edtVlr20Horiz.Text <> '' Then begin

      Vlr20Horiz  := StrToInt(lbl_edtVlr20Horiz.Text);

    end else begin

      Vlr20Horiz := 0;

    end;

    if lbl_edtVlr20Vert.Text <> '' Then begin

      Vlr20Vert := StrToInt(lbl_edtVlr20Vert.Text);

    end else begin

      Vlr20Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////


    if lbl_edtVlr21Horiz.Text <> '' Then begin

      Vlr21Horiz  := StrToInt(lbl_edtVlr21Horiz.Text);

    end else begin

      Vlr21Horiz := 0;

    end;

    if lbl_edtVlr21Vert.Text <> '' Then begin

      Vlr21Vert := StrToInt(lbl_edtVlr21Vert.Text);

    end else begin

      Vlr21Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtVlr22Horiz.Text <> '' Then begin

      Vlr22Horiz  := StrToInt(lbl_edtVlr22Horiz.Text);

    end else begin

      Vlr22Horiz := 0;

    end;

    if lbl_edtVlr22Vert.Text <> '' Then begin

      Vlr22Vert := StrToInt(lbl_edtVlr22Vert.Text);

    end else begin

      Vlr22Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////


    if lbl_edtVlr23Horiz.Text <> '' Then begin

      Vlr23Horiz  := StrToInt(lbl_edtVlr23Horiz.Text);

    end else begin

      Vlr23Horiz := 0;

    end;

    if lbl_edtVlr23Vert.Text <> '' Then begin

      Vlr23Vert := StrToInt(lbl_edtVlr23Vert.Text);

    end else begin

      Vlr23Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////


    if lbl_edtVlr24Horiz.Text <> '' Then begin

      Vlr24Horiz  := StrToInt(lbl_edtVlr24Horiz.Text);

    end else begin

      Vlr24Horiz := 0;

    end;

    if lbl_edtVlr24Vert.Text <> '' Then begin

      Vlr24Vert := StrToInt(lbl_edtVlr24Vert.Text);

    end else begin

      Vlr24Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

//ESTRUTURA PARA GRAVAR REFERENCIA

    if lbl_edtRefH1.Text <> '' Then begin

      Ref1Horiz  := StrToInt(lbl_edtRefH1.Text);

    end else begin

      Ref1Horiz := 0;

    end;

    if lbl_edtRefV1.Text <> '' Then begin

      Ref1Vert := StrToInt(lbl_edtRefV1.Text);

    end else begin

      Ref1Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH2.Text <> '' Then begin

      Ref2Horiz  := StrToInt(lbl_edtRefH2.Text);

    end else begin

      Ref2Horiz := 0;

    end;

    if lbl_edtRefV2.Text <> '' Then begin

      Ref2Vert := StrToInt(lbl_edtRefV2.Text);

    end else begin

      Ref2Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH3.Text <> '' Then begin

      Ref3Horiz  := StrToInt(lbl_edtRefH3.Text);

    end else begin

      Ref3Horiz := 0;

    end;

    if lbl_edtRefV3.Text <> '' Then begin

      Ref3Vert := StrToInt(lbl_edtRefV3.Text);

    end else begin

      Ref3Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH4.Text <> '' Then begin

      Ref4Horiz  := StrToInt(lbl_edtRefH4.Text);

    end else begin

      Ref4Horiz := 0;

    end;

    if lbl_edtRefV4.Text <> '' Then begin

      Ref4Vert := StrToInt(lbl_edtRefV4.Text);

    end else begin

      Ref4Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH5.Text <> '' Then begin

      Ref5Horiz  := StrToInt(lbl_edtRefH5.Text);

    end else begin

      Ref5Horiz := 0;

    end;

    if lbl_edtRefV5.Text <> '' Then begin

      Ref5Vert := StrToInt(lbl_edtRefV5.Text);

    end else begin

      Ref5Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH6.Text <> '' Then begin

      Ref6Horiz  := StrToInt(lbl_edtRefH6.Text);

    end else begin

      Ref6Horiz := 0;

    end;

    if lbl_edtRefV6.Text <> '' Then begin

      Ref6Vert := StrToInt(lbl_edtRefV6.Text);

    end else begin

      Ref6Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH7.Text <> '' Then begin

      Ref7Horiz  := StrToInt(lbl_edtRefH7.Text);

    end else begin

      Ref7Horiz := 0;

    end;

    if lbl_edtRefV7.Text <> '' Then begin

      Ref7Vert := StrToInt(lbl_edtRefV7.Text);

    end else begin

      Ref7Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH8.Text <> '' Then begin

      Ref8Horiz  := StrToInt(lbl_edtRefH8.Text);

    end else begin

      Ref8Horiz := 0;

    end;

    if lbl_edtRefV8.Text <> '' Then begin

      Ref8Vert := StrToInt(lbl_edtRefV8.Text);

    end else begin

      Ref8Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH9.Text <> '' Then begin

      Ref9Horiz  := StrToInt(lbl_edtRefH9.Text);

    end else begin

      Ref9Horiz := 0;

    end;

    if lbl_edtRefV9.Text <> '' Then begin

      Ref9Vert := StrToInt(lbl_edtRefV9.Text);

    end else begin

      Ref9Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH10.Text <> '' Then begin

      Ref10Horiz  := StrToInt(lbl_edtRefH10.Text);

    end else begin

      Ref10Horiz := 0;

    end;

    if lbl_edtRefV10.Text <> '' Then begin

      Ref10Vert := StrToInt(lbl_edtRefV10.Text);

    end else begin

      Ref10Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH11.Text <> '' Then begin

      Ref11Horiz  := StrToInt(lbl_edtRefH11.Text);

    end else begin

      Ref11Horiz := 0;

    end;

    if lbl_edtRefV11.Text <> '' Then begin

      Ref11Vert := StrToInt(lbl_edtRefV11.Text);

    end else begin

      Ref11Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH12.Text <> '' Then begin

      Ref12Horiz  := StrToInt(lbl_edtRefH12.Text);

    end else begin

      Ref12Horiz := 0;

    end;

    if lbl_edtRefV12.Text <> '' Then begin

      Ref12Vert := StrToInt(lbl_edtRefV12.Text);

    end else begin

      Ref12Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH13.Text <> '' Then begin

      Ref13Horiz  := StrToInt(lbl_edtRefH13.Text);

    end else begin

      Ref13Horiz := 0;

    end;

    if lbl_edtRefV13.Text <> '' Then begin

      Ref13Vert := StrToInt(lbl_edtRefV13.Text);

    end else begin

      Ref13Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH14.Text <> '' Then begin

      Ref14Horiz  := StrToInt(lbl_edtRefH14.Text);

    end else begin

      Ref14Horiz := 0;

    end;

    if lbl_edtRefV14.Text <> '' Then begin

      Ref14Vert := StrToInt(lbl_edtRefV14.Text);

    end else begin

      Ref14Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH15.Text <> '' Then begin

      Ref15Horiz  := StrToInt(lbl_edtRefH15.Text);

    end else begin

      Ref15Horiz := 0;

    end;

    if lbl_edtRefV15.Text <> '' Then begin

      Ref15Vert := StrToInt(lbl_edtRefV15.Text);

    end else begin

      Ref15Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH16.Text <> '' Then begin

      Ref16Horiz  := StrToInt(lbl_edtRefH16.Text);

    end else begin

      Ref16Horiz := 0;

    end;

    if lbl_edtRefV16.Text <> '' Then begin

      Ref16Vert := StrToInt(lbl_edtRefV16.Text);

    end else begin

      Ref16Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH17.Text <> '' Then begin

      Ref17Horiz  := StrToInt(lbl_edtRefH17.Text);

    end else begin

      Ref17Horiz := 0;

    end;

    if lbl_edtRefV17.Text <> '' Then begin

      Ref17Vert := StrToInt(lbl_edtRefV17.Text);

    end else begin

      Ref17Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH18.Text <> '' Then begin

      Ref18Horiz  := StrToInt(lbl_edtRefH18.Text);

    end else begin

      Ref18Horiz := 0;

    end;

    if lbl_edtRefV18.Text <> '' Then begin

      Ref18Vert := StrToInt(lbl_edtRefV18.Text);

    end else begin

      Ref18Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH19.Text <> '' Then begin

      Ref19Horiz  := StrToInt(lbl_edtRefH19.Text);

    end else begin

      Ref19Horiz := 0;

    end;

    if lbl_edtRefV19.Text <> '' Then begin

      Ref19Vert := StrToInt(lbl_edtRefV19.Text);

    end else begin

      Ref19Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH20.Text <> '' Then begin

      Ref20Horiz  := StrToInt(lbl_edtRefH20.Text);

    end else begin

      Ref20Horiz := 0;

    end;

    if lbl_edtRefV20.Text <> '' Then begin

      Ref20Vert := StrToInt(lbl_edtRefV20.Text);

    end else begin

      Ref20Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH21.Text <> '' Then begin

      Ref21Horiz  := StrToInt(lbl_edtRefH21.Text);

    end else begin

      Ref21Horiz := 0;

    end;

    if lbl_edtRefV21.Text <> '' Then begin

      Ref21Vert := StrToInt(lbl_edtRefV21.Text);

    end else begin

      Ref21Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH22.Text <> '' Then begin

      Ref22Horiz  := StrToInt(lbl_edtRefH22.Text);

    end else begin

      Ref22Horiz := 0;

    end;

    if lbl_edtRefV22.Text <> '' Then begin

      Ref22Vert := StrToInt(lbl_edtRefV22.Text);

    end else begin

      Ref22Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH23.Text <> '' Then begin

      Ref23Horiz  := StrToInt(lbl_edtRefH23.Text);

    end else begin

      Ref23Horiz := 0;

    end;

    if lbl_edtRefV23.Text <> '' Then begin

      Ref23Vert := StrToInt(lbl_edtRefV23.Text);

    end else begin

      Ref23Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtRefH24.Text <> '' Then begin

      Ref24Horiz  := StrToInt(lbl_edtRefH24.Text);

    end else begin

      Ref24Horiz := 0;

    end;

    if lbl_edtRefV24.Text <> '' Then begin

      Ref24Vert := StrToInt(lbl_edtRefV24.Text);

    end else begin

      Ref24Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

//ESTRUTURA PARA O CÓDIGO INTERNO

    if lbl_edtCodInternoH1.Text <> '' Then begin

      Cod1Horiz  := StrToInt(lbl_edtCodInternoH1.Text);

    end else begin

      Cod1Horiz := 0;

    end;

    if lbl_edtCodInternoV1.Text <> '' Then begin

      Cod1Vert := StrToInt(lbl_edtCodInternoV1.Text);

    end else begin

      Cod1Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH2.Text <> '' Then begin

      Cod2Horiz  := StrToInt(lbl_edtCodInternoH2.Text);

    end else begin

      Cod2Horiz := 0;

    end;

    if lbl_edtCodInternoV2.Text <> '' Then begin

      Cod2Vert := StrToInt(lbl_edtCodInternoV2.Text);

    end else begin

      Cod2Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH3.Text <> '' Then begin

      Cod3Horiz  := StrToInt(lbl_edtCodInternoH3.Text);

    end else begin

      Cod3Horiz := 0;

    end;

    if lbl_edtCodInternoV3.Text <> '' Then begin

      Cod3Vert := StrToInt(lbl_edtCodInternoV3.Text);

    end else begin

      Cod3Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH4.Text <> '' Then begin

      Cod4Horiz  := StrToInt(lbl_edtCodInternoH4.Text);

    end else begin

      Cod4Horiz := 0;

    end;

    if lbl_edtCodInternoV4.Text <> '' Then begin

      Cod4Vert := StrToInt(lbl_edtCodInternoV4.Text);

    end else begin

      Cod4Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH5.Text <> '' Then begin

      Cod5Horiz  := StrToInt(lbl_edtCodInternoH5.Text);

    end else begin

      Cod5Horiz := 0;

    end;

    if lbl_edtCodInternoV5.Text <> '' Then begin

      Cod5Vert := StrToInt(lbl_edtCodInternoV5.Text);

    end else begin

      Cod5Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH6.Text <> '' Then begin

      Cod6Horiz  := StrToInt(lbl_edtCodInternoH6.Text);

    end else begin

      Cod6Horiz := 0;

    end;

    if lbl_edtCodInternoV6.Text <> '' Then begin

      Cod6Vert := StrToInt(lbl_edtCodInternoV6.Text);

    end else begin

      Cod6Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH7.Text <> '' Then begin

      Cod7Horiz  := StrToInt(lbl_edtCodInternoH7.Text);

    end else begin

      Cod7Horiz := 0;

    end;

    if lbl_edtCodInternoV7.Text <> '' Then begin

      Cod7Vert := StrToInt(lbl_edtCodInternoV7.Text);

    end else begin

      Cod7Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH8.Text <> '' Then begin

      Cod8Horiz  := StrToInt(lbl_edtCodInternoH8.Text);

    end else begin

      Cod8Horiz := 0;

    end;

    if lbl_edtCodInternoV8.Text <> '' Then begin

      Cod8Vert := StrToInt(lbl_edtCodInternoV8.Text);

    end else begin

      Cod8Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH9.Text <> '' Then begin

      Cod9Horiz  := StrToInt(lbl_edtCodInternoH9.Text);

    end else begin

      Cod9Horiz := 0;

    end;

    if lbl_edtCodInternoV9.Text <> '' Then begin

      Cod9Vert := StrToInt(lbl_edtCodInternoV9.Text);

    end else begin

      Cod9Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH10.Text <> '' Then begin

      Cod10Horiz  := StrToInt(lbl_edtCodInternoH10.Text);

    end else begin

      Cod10Horiz := 0;

    end;

    if lbl_edtCodInternoV10.Text <> '' Then begin

      Cod10Vert := StrToInt(lbl_edtCodInternoV10.Text);

    end else begin

      Cod10Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH11.Text <> '' Then begin

      Cod11Horiz  := StrToInt(lbl_edtCodInternoH11.Text);

    end else begin

      Cod11Horiz := 0;

    end;

    if lbl_edtCodInternoV11.Text <> '' Then begin

      Cod11Vert := StrToInt(lbl_edtCodInternoV11.Text);

    end else begin

      Cod11Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH12.Text <> '' Then begin

      Cod12Horiz  := StrToInt(lbl_edtCodInternoH12.Text);

    end else begin

      Cod12Horiz := 0;

    end;

    if lbl_edtCodInternoV12.Text <> '' Then begin

      Cod12Vert := StrToInt(lbl_edtCodInternoV12.Text);

    end else begin

      Cod12Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH13.Text <> '' Then begin

      Cod13Horiz  := StrToInt(lbl_edtCodInternoH13.Text);

    end else begin

      Cod13Horiz := 0;

    end;

    if lbl_edtCodInternoV13.Text <> '' Then begin

      Cod13Vert := StrToInt(lbl_edtCodInternoV13.Text);

    end else begin

      Cod13Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH14.Text <> '' Then begin

      Cod14Horiz  := StrToInt(lbl_edtCodInternoH14.Text);

    end else begin

      Cod14Horiz := 0;

    end;

    if lbl_edtCodInternoV14.Text <> '' Then begin

      Cod14Vert := StrToInt(lbl_edtCodInternoV14.Text);

    end else begin

      Cod14Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH15.Text <> '' Then begin

      Cod15Horiz  := StrToInt(lbl_edtCodInternoH15.Text);

    end else begin

      Cod15Horiz := 0;

    end;

    if lbl_edtCodInternoV15.Text <> '' Then begin

      Cod15Vert := StrToInt(lbl_edtCodInternoV15.Text);

    end else begin

      Cod15Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH16.Text <> '' Then begin

      Cod16Horiz  := StrToInt(lbl_edtCodInternoH16.Text);

    end else begin

      Cod16Horiz := 0;

    end;

    if lbl_edtCodInternoV16.Text <> '' Then begin

      Cod16Vert := StrToInt(lbl_edtCodInternoV16.Text);

    end else begin

      Cod16Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH17.Text <> '' Then begin

      Cod17Horiz  := StrToInt(lbl_edtCodInternoH17.Text);

    end else begin

      Cod17Horiz := 0;

    end;

    if lbl_edtCodInternoV17.Text <> '' Then begin

      Cod17Vert := StrToInt(lbl_edtCodInternoV17.Text);

    end else begin

      Cod17Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH18.Text <> '' Then begin

      Cod18Horiz  := StrToInt(lbl_edtCodInternoH18.Text);

    end else begin

      Cod18Horiz := 0;

    end;

    if lbl_edtCodInternoV18.Text <> '' Then begin

      Cod18Vert := StrToInt(lbl_edtCodInternoV18.Text);

    end else begin

      Cod18Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH19.Text <> '' Then begin

      Cod19Horiz  := StrToInt(lbl_edtCodInternoH19.Text);

    end else begin

      Cod19Horiz := 0;

    end;

    if lbl_edtCodInternoV19.Text <> '' Then begin

      Cod19Vert := StrToInt(lbl_edtCodInternoV19.Text);

    end else begin

      Cod19Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH20.Text <> '' Then begin

      Cod20Horiz  := StrToInt(lbl_edtCodInternoH20.Text);

    end else begin

      Cod20Horiz := 0;

    end;

    if lbl_edtCodInternoV20.Text <> '' Then begin

      Cod20Vert := StrToInt(lbl_edtCodInternoV20.Text);

    end else begin

      Cod20Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH21.Text <> '' Then begin

      Cod21Horiz  := StrToInt(lbl_edtCodInternoH21.Text);

    end else begin

      Cod21Horiz := 0;

    end;

    if lbl_edtCodInternoV21.Text <> '' Then begin

      Cod21Vert := StrToInt(lbl_edtCodInternoV21.Text);

    end else begin

      Cod21Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH22.Text <> '' Then begin

      Cod22Horiz  := StrToInt(lbl_edtCodInternoH22.Text);

    end else begin

      Cod22Horiz := 0;

    end;

    if lbl_edtCodInternoV22.Text <> '' Then begin

      Cod22Vert := StrToInt(lbl_edtCodInternoV22.Text);

    end else begin

      Cod22Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH23.Text <> '' Then begin

      Cod23Horiz  := StrToInt(lbl_edtCodInternoH23.Text);

    end else begin

      Cod23Horiz := 0;

    end;

    if lbl_edtCodInternoV23.Text <> '' Then begin

      Cod23Vert := StrToInt(lbl_edtCodInternoV23.Text);

    end else begin

      Cod23Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtCodInternoH24.Text <> '' Then begin

      Cod24Horiz  := StrToInt(lbl_edtCodInternoH24.Text);

    end else begin

      Cod24Horiz := 0;

    end;

    if lbl_edtCodInternoV24.Text <> '' Then begin

      Cod24Vert := StrToInt(lbl_edtCodInternoV24.Text);

    end else begin

      Cod24Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

//ESTRUTURA PARA FABRICANTE

    if lbl_edtFabrH1.Text <> '' Then begin

      Fabr1Horiz  := StrToInt(lbl_edtFabrH1.Text);

    end else begin

      Fabr1Horiz := 0;

    end;

    if lbl_edtFabrV1.Text <> '' Then begin

      Fabr1Vert := StrToInt(lbl_edtFabrV1.Text);

    end else begin

      Fabr1Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH2.Text <> '' Then begin

      Fabr2Horiz  := StrToInt(lbl_edtFabrH2.Text);

    end else begin

      Fabr2Horiz := 0;

    end;

    if lbl_edtFabrV2.Text <> '' Then begin

      Fabr2Vert := StrToInt(lbl_edtFabrV2.Text);

    end else begin

      Fabr2Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH3.Text <> '' Then begin

      Fabr3Horiz  := StrToInt(lbl_edtFabrH3.Text);

    end else begin

      Fabr3Horiz := 0;

    end;

    if lbl_edtFabrV3.Text <> '' Then begin

      Fabr3Vert := StrToInt(lbl_edtFabrV3.Text);

    end else begin

      Fabr3Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH4.Text <> '' Then begin

      Fabr4Horiz  := StrToInt(lbl_edtFabrH4.Text);

    end else begin

      Fabr4Horiz := 0;

    end;

    if lbl_edtFabrV4.Text <> '' Then begin

      Fabr4Vert := StrToInt(lbl_edtFabrV4.Text);

    end else begin

      Fabr4Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH5.Text <> '' Then begin

      Fabr5Horiz  := StrToInt(lbl_edtFabrH5.Text);

    end else begin

      Fabr5Horiz := 0;

    end;

    if lbl_edtFabrV5.Text <> '' Then begin

      Fabr5Vert := StrToInt(lbl_edtFabrV5.Text);

    end else begin

      Fabr5Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH6.Text <> '' Then begin

      Fabr6Horiz  := StrToInt(lbl_edtFabrH6.Text);

    end else begin

      Fabr6Horiz := 0;

    end;

    if lbl_edtFabrV6.Text <> '' Then begin

      Fabr6Vert := StrToInt(lbl_edtFabrV6.Text);

    end else begin

      Fabr6Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH7.Text <> '' Then begin

      Fabr7Horiz  := StrToInt(lbl_edtFabrH7.Text);

    end else begin

      Fabr7Horiz := 0;

    end;

    if lbl_edtFabrV7.Text <> '' Then begin

      Fabr7Vert := StrToInt(lbl_edtFabrV7.Text);

    end else begin

      Fabr7Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH8.Text <> '' Then begin

      Fabr8Horiz  := StrToInt(lbl_edtFabrH8.Text);

    end else begin

      Fabr8Horiz := 0;

    end;

    if lbl_edtFabrV8.Text <> '' Then begin

      Fabr8Vert := StrToInt(lbl_edtFabrV8.Text);

    end else begin

      Fabr8Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH9.Text <> '' Then begin

      Fabr9Horiz  := StrToInt(lbl_edtFabrH9.Text);

    end else begin

      Fabr9Horiz := 0;

    end;

    if lbl_edtFabrV9.Text <> '' Then begin

      Fabr9Vert := StrToInt(lbl_edtFabrV9.Text);

    end else begin

      Fabr9Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH10.Text <> '' Then begin

      Fabr10Horiz  := StrToInt(lbl_edtFabrH10.Text);

    end else begin

      Fabr10Horiz := 0;

    end;

    if lbl_edtFabrV10.Text <> '' Then begin

      Fabr10Vert := StrToInt(lbl_edtFabrV10.Text);

    end else begin

      Fabr10Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH11.Text <> '' Then begin

      Fabr11Horiz  := StrToInt(lbl_edtFabrH11.Text);

    end else begin

      Fabr11Horiz := 0;

    end;

    if lbl_edtFabrV11.Text <> '' Then begin

      Fabr11Vert := StrToInt(lbl_edtFabrV11.Text);

    end else begin

      Fabr11Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH12.Text <> '' Then begin

      Fabr12Horiz  := StrToInt(lbl_edtFabrH12.Text);

    end else begin

      Fabr12Horiz := 0;

    end;

    if lbl_edtFabrV12.Text <> '' Then begin

      Fabr12Vert := StrToInt(lbl_edtFabrV12.Text);

    end else begin

      Fabr12Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH13.Text <> '' Then begin

      Fabr13Horiz  := StrToInt(lbl_edtFabrH13.Text);

    end else begin

      Fabr13Horiz := 0;

    end;

    if lbl_edtFabrV13.Text <> '' Then begin

      Fabr13Vert := StrToInt(lbl_edtFabrV13.Text);

    end else begin

      Fabr13Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH14.Text <> '' Then begin

      Fabr14Horiz  := StrToInt(lbl_edtFabrH14.Text);

    end else begin

      Fabr14Horiz := 0;

    end;

    if lbl_edtFabrV14.Text <> '' Then begin

      Fabr14Vert := StrToInt(lbl_edtFabrV14.Text);

    end else begin

      Fabr14Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH15.Text <> '' Then begin

      Fabr15Horiz  := StrToInt(lbl_edtFabrH15.Text);

    end else begin

      Fabr15Horiz := 0;

    end;

    if lbl_edtFabrV15.Text <> '' Then begin

      Fabr15Vert := StrToInt(lbl_edtFabrV15.Text);

    end else begin

      Fabr15Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH16.Text <> '' Then begin

      Fabr16Horiz  := StrToInt(lbl_edtFabrH16.Text);

    end else begin

      Fabr16Horiz := 0;

    end;

    if lbl_edtFabrV16.Text <> '' Then begin

      Fabr16Vert := StrToInt(lbl_edtFabrV16.Text);

    end else begin

      Fabr16Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH17.Text <> '' Then begin

      Fabr17Horiz  := StrToInt(lbl_edtFabrH17.Text);

    end else begin

      Fabr17Horiz := 0;

    end;

    if lbl_edtFabrV17.Text <> '' Then begin

      Fabr17Vert := StrToInt(lbl_edtFabrV17.Text);

    end else begin

      Fabr17Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH18.Text <> '' Then begin

      Fabr18Horiz  := StrToInt(lbl_edtFabrH18.Text);

    end else begin

      Fabr18Horiz := 0;

    end;

    if lbl_edtFabrV18.Text <> '' Then begin

      Fabr18Vert := StrToInt(lbl_edtFabrV18.Text);

    end else begin

      Fabr18Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH19.Text <> '' Then begin

      Fabr19Horiz  := StrToInt(lbl_edtFabrH19.Text);

    end else begin

      Fabr19Horiz := 0;

    end;

    if lbl_edtFabrV19.Text <> '' Then begin

      Fabr19Vert := StrToInt(lbl_edtFabrV19.Text);

    end else begin

      Fabr19Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH20.Text <> '' Then begin

      Fabr20Horiz  := StrToInt(lbl_edtFabrH20.Text);

    end else begin

      Fabr20Horiz := 0;

    end;

    if lbl_edtFabrV20.Text <> '' Then begin

      Fabr20Vert := StrToInt(lbl_edtFabrV20.Text);

    end else begin

      Fabr20Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH21.Text <> '' Then begin

      Fabr21Horiz  := StrToInt(lbl_edtFabrH21.Text);

    end else begin

      Fabr21Horiz := 0;

    end;

    if lbl_edtFabrV21.Text <> '' Then begin

      Fabr21Vert := StrToInt(lbl_edtFabrV21.Text);

    end else begin

      Fabr21Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH22.Text <> '' Then begin

      Fabr22Horiz  := StrToInt(lbl_edtFabrH22.Text);

    end else begin

      Fabr22Horiz := 0;

    end;

    if lbl_edtFabrV22.Text <> '' Then begin

      Fabr22Vert := StrToInt(lbl_edtFabrV22.Text);

    end else begin

      Fabr22Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH23.Text <> '' Then begin

      Fabr23Horiz  := StrToInt(lbl_edtFabrH23.Text);

    end else begin

      Fabr23Horiz := 0;

    end;

    if lbl_edtFabrV23.Text <> '' Then begin

      Fabr23Vert := StrToInt(lbl_edtFabrV23.Text);

    end else begin

      Fabr23Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtFabrH24.Text <> '' Then begin

      Fabr24Horiz  := StrToInt(lbl_edtFabrH24.Text);

    end else begin

      Fabr24Horiz := 0;

    end;

    if lbl_edtFabrV24.Text <> '' Then begin

      Fabr24Vert := StrToInt(lbl_edtFabrV24.Text);

    end else begin

      Fabr24Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

//ESTRUTURA PARA UNIDADE DO PRODUTO

    if lbl_edtUnidH1.Text <> '' Then begin

      Unid1Horiz  := StrToInt(lbl_edtUnidH1.Text);

    end else begin

      Unid1Horiz := 0;

    end;

    if lbl_edtUnidV1.Text <> '' Then begin

      Unid1Vert := StrToInt(lbl_edtUnidV1.Text);

    end else begin

      Unid1Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH2.Text <> '' Then begin

      Unid2Horiz  := StrToInt(lbl_edtUnidH2.Text);

    end else begin

      Unid2Horiz := 0;

    end;

    if lbl_edtUnidV2.Text <> '' Then begin

      Unid2Vert := StrToInt(lbl_edtUnidV2.Text);

    end else begin

      Unid2Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH3.Text <> '' Then begin

      Unid3Horiz  := StrToInt(lbl_edtUnidH3.Text);

    end else begin

      Unid3Horiz := 0;

    end;

    if lbl_edtUnidV3.Text <> '' Then begin

      Unid3Vert := StrToInt(lbl_edtUnidV3.Text);

    end else begin

      Unid3Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH4.Text <> '' Then begin

      Unid4Horiz  := StrToInt(lbl_edtUnidH4.Text);

    end else begin

      Unid4Horiz := 0;

    end;

    if lbl_edtUnidV4.Text <> '' Then begin

      Unid4Vert := StrToInt(lbl_edtUnidV4.Text);

    end else begin

      Unid4Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH5.Text <> '' Then begin

      Unid5Horiz  := StrToInt(lbl_edtUnidH5.Text);

    end else begin

      Unid5Horiz := 0;

    end;

    if lbl_edtUnidV5.Text <> '' Then begin

      Unid5Vert := StrToInt(lbl_edtUnidV5.Text);

    end else begin

      Unid5Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH6.Text <> '' Then begin

      Unid6Horiz  := StrToInt(lbl_edtUnidH6.Text);

    end else begin

      Unid6Horiz := 0;

    end;

    if lbl_edtUnidV6.Text <> '' Then begin

      Unid6Vert := StrToInt(lbl_edtUnidV6.Text);

    end else begin

      Unid6Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH7.Text <> '' Then begin

      Unid7Horiz  := StrToInt(lbl_edtUnidH7.Text);

    end else begin

      Unid7Horiz := 0;

    end;

    if lbl_edtUnidV7.Text <> '' Then begin

      Unid7Vert := StrToInt(lbl_edtUnidV7.Text);

    end else begin

      Unid7Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH8.Text <> '' Then begin

      Unid8Horiz  := StrToInt(lbl_edtUnidH8.Text);

    end else begin

      Unid8Horiz := 0;

    end;

    if lbl_edtUnidV8.Text <> '' Then begin

      Unid8Vert := StrToInt(lbl_edtUnidV8.Text);

    end else begin

      Unid8Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH9.Text <> '' Then begin

      Unid9Horiz  := StrToInt(lbl_edtUnidH9.Text);

    end else begin

      Unid9Horiz := 0;

    end;

    if lbl_edtUnidV9.Text <> '' Then begin

      Unid9Vert := StrToInt(lbl_edtUnidV9.Text);

    end else begin

      Unid9Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH10.Text <> '' Then begin

      Unid10Horiz  := StrToInt(lbl_edtUnidH10.Text);

    end else begin

      Unid10Horiz := 0;

    end;

    if lbl_edtUnidV10.Text <> '' Then begin

      Unid10Vert := StrToInt(lbl_edtUnidV10.Text);

    end else begin

      Unid10Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH11.Text <> '' Then begin

      Unid11Horiz  := StrToInt(lbl_edtUnidH11.Text);

    end else begin

      Unid11Horiz := 0;

    end;

    if lbl_edtUnidV11.Text <> '' Then begin

      Unid11Vert := StrToInt(lbl_edtUnidV11.Text);

    end else begin

      Unid11Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH12.Text <> '' Then begin

      Unid12Horiz  := StrToInt(lbl_edtUnidH12.Text);

    end else begin

      Unid12Horiz := 0;

    end;

    if lbl_edtUnidV12.Text <> '' Then begin

      Unid12Vert := StrToInt(lbl_edtUnidV12.Text);

    end else begin

      Unid12Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH13.Text <> '' Then begin

      Unid13Horiz  := StrToInt(lbl_edtUnidH13.Text);

    end else begin

      Unid13Horiz := 0;

    end;

    if lbl_edtUnidV13.Text <> '' Then begin

      Unid13Vert := StrToInt(lbl_edtUnidV13.Text);

    end else begin

      Unid13Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH14.Text <> '' Then begin

      Unid14Horiz  := StrToInt(lbl_edtUnidH14.Text);

    end else begin

      Unid14Horiz := 0;

    end;

    if lbl_edtUnidV14.Text <> '' Then begin

      Unid14Vert := StrToInt(lbl_edtUnidV14.Text);

    end else begin

      Unid14Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH15.Text <> '' Then begin

      Unid15Horiz  := StrToInt(lbl_edtUnidH15.Text);

    end else begin

      Unid15Horiz := 0;

    end;

    if lbl_edtUnidV15.Text <> '' Then begin

      Unid15Vert := StrToInt(lbl_edtUnidV15.Text);

    end else begin

      Unid15Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH16.Text <> '' Then begin

      Unid16Horiz  := StrToInt(lbl_edtUnidH16.Text);

    end else begin

      Unid16Horiz := 0;

    end;

    if lbl_edtUnidV16.Text <> '' Then begin

      Unid16Vert := StrToInt(lbl_edtUnidV16.Text);

    end else begin

      Unid16Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH17.Text <> '' Then begin

      Unid17Horiz  := StrToInt(lbl_edtUnidH17.Text);

    end else begin

      Unid17Horiz := 0;

    end;

    if lbl_edtUnidV17.Text <> '' Then begin

      Unid17Vert := StrToInt(lbl_edtUnidV17.Text);

    end else begin

      Unid17Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH18.Text <> '' Then begin

      Unid18Horiz  := StrToInt(lbl_edtUnidH18.Text);

    end else begin

      Unid18Horiz := 0;

    end;

    if lbl_edtUnidV18.Text <> '' Then begin

      Unid18Vert := StrToInt(lbl_edtUnidV18.Text);

    end else begin

      Unid18Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH19.Text <> '' Then begin

      Unid19Horiz  := StrToInt(lbl_edtUnidH19.Text);

    end else begin

      Unid19Horiz := 0;

    end;

    if lbl_edtUnidV19.Text <> '' Then begin

      Unid19Vert := StrToInt(lbl_edtUnidV19.Text);

    end else begin

      Unid19Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH20.Text <> '' Then begin

      Unid20Horiz  := StrToInt(lbl_edtUnidH20.Text);

    end else begin

      Unid20Horiz := 0;

    end;

    if lbl_edtUnidV20.Text <> '' Then begin

      Unid20Vert := StrToInt(lbl_edtUnidV20.Text);

    end else begin

      Unid20Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH21.Text <> '' Then begin

      Unid21Horiz  := StrToInt(lbl_edtUnidH21.Text);

    end else begin

      Unid21Horiz := 0;

    end;

    if lbl_edtUnidV21.Text <> '' Then begin

      Unid21Vert := StrToInt(lbl_edtUnidV21.Text);

    end else begin

      Unid21Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH22.Text <> '' Then begin

      Unid22Horiz  := StrToInt(lbl_edtUnidH22.Text);

    end else begin

      Unid22Horiz := 0;

    end;

    if lbl_edtUnidV22.Text <> '' Then begin

      Unid22Vert := StrToInt(lbl_edtUnidV22.Text);

    end else begin

      Unid22Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH23.Text <> '' Then begin

      Unid23Horiz  := StrToInt(lbl_edtUnidH23.Text);

    end else begin

      Unid23Horiz := 0;

    end;

    if lbl_edtUnidV23.Text <> '' Then begin

      Unid23Vert := StrToInt(lbl_edtUnidV23.Text);

    end else begin

      Unid23Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if lbl_edtUnidH24.Text <> '' Then begin

      Unid24Horiz  := StrToInt(lbl_edtUnidH24.Text);

    end else begin

      Unid24Horiz := 0;

    end;

    if lbl_edtUnidV24.Text <> '' Then begin

      Unid24Vert := StrToInt(lbl_edtUnidV24.Text);

    end else begin

      Unid24Vert := 0;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGrande.RecordCount > 0 Then begin

      ibEtiquetaGrande.Close;
      ibEtiquetaGrande.SQL.Clear;
      ibEtiquetaGrande.SQL.Add('UPDATE TBLETIQUETAGRANDE SET '
      +'ETIQUETA1HORIZ  = ''' + IntToStr(Et1Horiz) + ''','
      +'ETIQUETA1VERT   = ''' + IntToStr(Et1Vert) + ''','
      +'ETIQUETA2HORIZ  = ''' + IntToStr(Et2Horiz) + ''','
      +'ETIQUETA2VERT   = ''' + IntToStr(Et2Vert) + ''','
      +'ETIQUETA3HORIZ  = ''' + IntToStr(Et3Horiz) + ''','
      +'ETIQUETA3VERT   = ''' + IntToStr(Et3Vert) + ''','
      +'ETIQUETA4HORIZ  = ''' + IntToStr(Et4Horiz) + ''','
      +'ETIQUETA4VERT   = ''' + IntToStr(Et4Vert) + ''','
      +'ETIQUETA5HORIZ  = ''' + IntToStr(Et5Horiz) + ''','
      +'ETIQUETA5VERT   = ''' + IntToStr(Et5Vert) + ''','
      +'ETIQUETA6HORIZ  = ''' + IntToStr(Et6Horiz) + ''','
      +'ETIQUETA6VERT   = ''' + IntToStr(Et6Vert) + ''','
      +'ETIQUETA7HORIZ  = ''' + IntToStr(Et7Horiz) + ''','
      +'ETIQUETA7VERT   = ''' + IntToStr(Et7Vert) + ''','
      +'ETIQUETA8HORIZ  = ''' + IntToStr(Et8Horiz) + ''','
      +'ETIQUETA8VERT   = ''' + IntToStr(Et8Vert) + ''','
      +'ETIQUETA9HORIZ  = ''' + IntToStr(Et9Horiz) + ''','
      +'ETIQUETA9VERT   = ''' + IntToStr(Et9Vert) + ''','
      +'ETIQUETA10HORIZ  = ''' + IntToStr(Et10Horiz) + ''','
      +'ETIQUETA10VERT   = ''' + IntToStr(Et10Vert) + ''','
      +'ETIQUETA11HORIZ  = ''' + IntToStr(Et11Horiz) + ''','
      +'ETIQUETA11VERT   = ''' + IntToStr(Et11Vert) + ''','
      +'ETIQUETA12HORIZ  = ''' + IntToStr(Et12Horiz) + ''','
      +'ETIQUETA12VERT   = ''' + IntToStr(Et12Vert) + ''','
      +'ETIQUETA13HORIZ  = ''' + IntToStr(Et13Horiz) + ''','
      +'ETIQUETA13VERT   = ''' + IntToStr(Et13Vert) + ''','
      +'ETIQUETA14HORIZ  = ''' + IntToStr(Et14Horiz) + ''','
      +'ETIQUETA14VERT   = ''' + IntToStr(Et14Vert) + ''','
      +'ETIQUETA15HORIZ  = ''' + IntToStr(Et15Horiz) + ''','
      +'ETIQUETA15VERT   = ''' + IntToStr(Et15Vert) + ''','
      +'ETIQUETA16HORIZ  = ''' + IntToStr(Et16Horiz) + ''','
      +'ETIQUETA16VERT   = ''' + IntToStr(Et16Vert) + ''','
      +'ETIQUETA17HORIZ  = ''' + IntToStr(Et17Horiz) + ''','
      +'ETIQUETA17VERT   = ''' + IntToStr(Et17Vert) + ''','
      +'ETIQUETA18HORIZ  = ''' + IntToStr(Et18Horiz) + ''','
      +'ETIQUETA18VERT   = ''' + IntToStr(Et18Vert) + ''','
      +'ETIQUETA19HORIZ  = ''' + IntToStr(Et19Horiz) + ''','
      +'ETIQUETA19VERT   = ''' + IntToStr(Et19Vert) + ''','
      +'ETIQUETA20HORIZ  = ''' + IntToStr(Et20Horiz) + ''','
      +'ETIQUETA20VERT   = ''' + IntToStr(Et20Vert) + ''','
      +'ETIQUETA21HORIZ  = ''' + IntToStr(Et21Horiz) + ''','
      +'ETIQUETA21VERT   = ''' + IntToStr(Et21Vert) + ''','
      +'ETIQUETA22HORIZ  = ''' + IntToStr(Et22Horiz) + ''','
      +'ETIQUETA22VERT   = ''' + IntToStr(Et22Vert) + ''','
      +'ETIQUETA23HORIZ  = ''' + IntToStr(Et23Horiz) + ''','
      +'ETIQUETA23VERT   = ''' + IntToStr(Et23Vert) + ''','
      +'ETIQUETA24HORIZ  = ''' + IntToStr(Et24Horiz) + ''','
      +'ETIQUETA24VERT   = ''' + IntToStr(Et24Vert) + ''','
      +'VALOR1HORIZ  = ''' + IntToStr(Vlr1Horiz) + ''','
      +'VALOR1VERT   = ''' + IntToStr(Vlr1Vert) + ''','
      +'VALOR2HORIZ  = ''' + IntToStr(Vlr2Horiz) + ''','
      +'VALOR2VERT   = ''' + IntToStr(Vlr2Vert) + ''','
      +'VALOR3HORIZ  = ''' + IntToStr(Vlr3Horiz) + ''','
      +'VALOR3VERT   = ''' + IntToStr(Vlr3Vert) + ''','
      +'VALOR4HORIZ  = ''' + IntToStr(Vlr4Horiz) + ''','
      +'VALOR4VERT   = ''' + IntToStr(Vlr4Vert) + ''','
      +'VALOR5HORIZ  = ''' + IntToStr(Vlr5Horiz) + ''','
      +'VALOR5VERT   = ''' + IntToStr(Vlr5Vert) + ''','
      +'VALOR6HORIZ  = ''' + IntToStr(Vlr6Horiz) + ''','
      +'VALOR6VERT   = ''' + IntToStr(Vlr6Vert) + ''','
      +'VALOR7HORIZ  = ''' + IntToStr(Vlr7Horiz) + ''','
      +'VALOR7VERT   = ''' + IntToStr(Vlr7Vert) + ''','
      +'VALOR8HORIZ  = ''' + IntToStr(Vlr8Horiz) + ''','
      +'VALOR8VERT   = ''' + IntToStr(Vlr8Vert) + ''','
      +'VALOR9HORIZ  = ''' + IntToStr(Vlr9Horiz) + ''','
      +'VALOR9VERT   = ''' + IntToStr(Vlr9Vert) + ''','
      +'VALOR10HORIZ  = ''' + IntToStr(Vlr10Horiz) + ''','
      +'VALOR10VERT   = ''' + IntToStr(Vlr10Vert) + ''','
      +'VALOR11HORIZ  = ''' + IntToStr(Vlr11Horiz) + ''','
      +'VALOR11VERT   = ''' + IntToStr(Vlr11Vert) + ''','
      +'VALOR12HORIZ  = ''' + IntToStr(Vlr12Horiz) + ''','
      +'VALOR12VERT   = ''' + IntToStr(Vlr12Vert) + ''','
      +'VALOR13HORIZ  = ''' + IntToStr(Vlr13Horiz) + ''','
      +'VALOR13VERT   = ''' + IntToStr(Vlr13Vert) + ''','
      +'VALOR14HORIZ  = ''' + IntToStr(Vlr14Horiz) + ''','
      +'VALOR14VERT   = ''' + IntToStr(Vlr14Vert) + ''','
      +'VALOR15HORIZ  = ''' + IntToStr(Vlr15Horiz) + ''','
      +'VALOR15VERT   = ''' + IntToStr(Vlr15Vert) + ''','
      +'VALOR16HORIZ  = ''' + IntToStr(Vlr16Horiz) + ''','
      +'VALOR16VERT   = ''' + IntToStr(Vlr16Vert) + ''','
      +'VALOR17HORIZ  = ''' + IntToStr(Vlr17Horiz) + ''','
      +'VALOR17VERT   = ''' + IntToStr(Vlr17Vert) + ''','
      +'VALOR18HORIZ  = ''' + IntToStr(Vlr18Horiz) + ''','
      +'VALOR18VERT   = ''' + IntToStr(Vlr18Vert) + ''','
      +'VALOR19HORIZ  = ''' + IntToStr(Vlr19Horiz) + ''','
      +'VALOR19VERT   = ''' + IntToStr(Vlr19Vert) + ''','
      +'VALOR20HORIZ  = ''' + IntToStr(Vlr20Horiz) + ''','
      +'VALOR20VERT   = ''' + IntToStr(Vlr20Vert) + ''','
      +'VALOR21HORIZ  = ''' + IntToStr(Vlr21Horiz) + ''','
      +'VALOR21VERT   = ''' + IntToStr(Vlr21Vert) + ''','
      +'VALOR22HORIZ  = ''' + IntToStr(Vlr22Horiz) + ''','
      +'VALOR22VERT   = ''' + IntToStr(Vlr22Vert) + ''','
      +'VALOR23HORIZ  = ''' + IntToStr(Vlr23Horiz) + ''','
      +'VALOR23VERT   = ''' + IntToStr(Vlr23Vert) + ''','
      +'VALOR24HORIZ  = ''' + IntToStr(Vlr24Horiz) + ''','
      +'VALOR24VERT   = ''' + IntToStr(Vlr24Vert) + ''','
      +'REF1HORIZ     = ''' + IntToStr(Ref1Horiz) + ''','
      +'REF1VERT      = ''' + IntToStr(Ref1Vert) + ''','
      +'REF2HORIZ     = ''' + IntToStr(Ref2Horiz) + ''','
      +'REF2VERT      = ''' + IntToStr(Ref2Vert) + ''','
      +'REF3HORIZ     = ''' + IntToStr(Ref3Horiz) + ''','
      +'REF3VERT      = ''' + IntToStr(Ref3Vert) + ''','
      +'REF4HORIZ     = ''' + IntToStr(Ref4Horiz) + ''','
      +'REF4VERT      = ''' + IntToStr(Ref4Vert) + ''','
      +'REF5HORIZ     = ''' + IntToStr(Ref5Horiz) + ''','
      +'REF5VERT      = ''' + IntToStr(Ref5Vert) + ''','
      +'REF6HORIZ     = ''' + IntToStr(Ref6Horiz) + ''','
      +'REF6VERT      = ''' + IntToStr(Ref6Vert) + ''','
      +'REF7HORIZ     = ''' + IntToStr(Ref7Horiz) + ''','
      +'REF7VERT      = ''' + IntToStr(Ref7Vert) + ''','
      +'REF8HORIZ     = ''' + IntToStr(Ref8Horiz) + ''','
      +'REF8VERT      = ''' + IntToStr(Ref8Vert) + ''','
      +'REF9HORIZ     = ''' + IntToStr(Ref9Horiz) + ''','
      +'REF9VERT      = ''' + IntToStr(Ref9Vert) + ''','
      +'REF10HORIZ     = ''' + IntToStr(Ref10Horiz) + ''','
      +'REF10VERT      = ''' + IntToStr(Ref10Vert) + ''','
      +'REF11HORIZ     = ''' + IntToStr(Ref11Horiz) + ''','
      +'REF11VERT      = ''' + IntToStr(Ref11Vert) + ''','
      +'REF12HORIZ     = ''' + IntToStr(Ref12Horiz) + ''','
      +'REF12VERT      = ''' + IntToStr(Ref12Vert) + ''','
      +'REF13HORIZ     = ''' + IntToStr(Ref13Horiz) + ''','
      +'REF13VERT      = ''' + IntToStr(Ref13Vert) + ''','
      +'REF14HORIZ     = ''' + IntToStr(Ref14Horiz) + ''','
      +'REF14VERT      = ''' + IntToStr(Ref14Vert) + ''','
      +'REF15HORIZ     = ''' + IntToStr(Ref15Horiz) + ''','
      +'REF15VERT      = ''' + IntToStr(Ref15Vert) + ''','
      +'REF16HORIZ     = ''' + IntToStr(Ref16Horiz) + ''','
      +'REF16VERT      = ''' + IntToStr(Ref16Vert) + ''','
      +'REF17HORIZ     = ''' + IntToStr(Ref17Horiz) + ''','
      +'REF17VERT      = ''' + IntToStr(Ref17Vert) + ''','
      +'REF18HORIZ     = ''' + IntToStr(Ref18Horiz) + ''','
      +'REF18VERT      = ''' + IntToStr(Ref18Vert) + ''','
      +'REF19HORIZ     = ''' + IntToStr(Ref19Horiz) + ''','
      +'REF19VERT      = ''' + IntToStr(Ref19Vert) + ''','
      +'REF20HORIZ     = ''' + IntToStr(Ref20Horiz) + ''','
      +'REF20VERT      = ''' + IntToStr(Ref20Vert) + ''','
      +'REF21HORIZ     = ''' + IntToStr(Ref21Horiz) + ''','
      +'REF21VERT      = ''' + IntToStr(Ref21Vert) + ''','
      +'REF22HORIZ     = ''' + IntToStr(Ref22Horiz) + ''','
      +'REF22VERT      = ''' + IntToStr(Ref22Vert) + ''','
      +'REF23HORIZ     = ''' + IntToStr(Ref23Horiz) + ''','
      +'REF23VERT      = ''' + IntToStr(Ref23Vert) + ''','
      +'REF24HORIZ     = ''' + IntToStr(Ref24Horiz) + ''','
      +'REF24VERT      = ''' + IntToStr(Ref24Vert) + ''' WHERE IDETIQUETAGRANDE = ''' + IntToStr(IDEtiqueta) + '''');
      ibEtiquetaGrande.ExecSQL;
      Commit(ibEtiquetaGrande);

///////////////////////////////////////

      ibEtiquetaGrande.Close;
      ibEtiquetaGrande.SQL.Clear;
      ibEtiquetaGrande.SQL.Add('UPDATE TBLETIQUETAGRANDE SET '
      +'CODINTHORIZ1   = ''' + IntToStr(Cod1Horiz) + ''','
      +'CODINTVERT1    = ''' + IntToStr(Cod1Vert) + ''','
      +'CODINTHORIZ2   = ''' + IntToStr(Cod2Horiz) + ''','
      +'CODINTVERT2    = ''' + IntToStr(Cod2Vert) + ''','
      +'CODINTHORIZ3   = ''' + IntToStr(Cod3Horiz) + ''','
      +'CODINTVERT3    = ''' + IntToStr(Cod3Vert) + ''','
      +'CODINTHORIZ4   = ''' + IntToStr(Cod4Horiz) + ''','
      +'CODINTVERT4    = ''' + IntToStr(Cod4Vert) + ''','
      +'CODINTHORIZ5   = ''' + IntToStr(Cod5Horiz) + ''','
      +'CODINTVERT5    = ''' + IntToStr(Cod5Vert) + ''','
      +'CODINTHORIZ6   = ''' + IntToStr(Cod6Horiz) + ''','
      +'CODINTVERT6    = ''' + IntToStr(Cod6Vert) + ''','
      +'CODINTHORIZ7   = ''' + IntToStr(Cod7Horiz) + ''','
      +'CODINTVERT7    = ''' + IntToStr(Cod7Vert) + ''','
      +'CODINTHORIZ8   = ''' + IntToStr(Cod8Horiz) + ''','
      +'CODINTVERT8    = ''' + IntToStr(Cod8Vert) + ''','
      +'CODINTHORIZ9   = ''' + IntToStr(Cod9Horiz) + ''','
      +'CODINTVERT9    = ''' + IntToStr(Cod9Vert) + ''','
      +'CODINTHORIZ10   = ''' + IntToStr(Cod10Horiz) + ''','
      +'CODINTVERT10    = ''' + IntToStr(Cod10Vert) + ''','
      +'CODINTHORIZ11   = ''' + IntToStr(Cod11Horiz) + ''','
      +'CODINTVERT11    = ''' + IntToStr(Cod11Vert) + ''','
      +'CODINTHORIZ12   = ''' + IntToStr(Cod12Horiz) + ''','
      +'CODINTVERT12    = ''' + IntToStr(Cod12Vert) + ''','
      +'CODINTHORIZ13   = ''' + IntToStr(Cod13Horiz) + ''','
      +'CODINTVERT13    = ''' + IntToStr(Cod13Vert) + ''','
      +'CODINTHORIZ14   = ''' + IntToStr(Cod14Horiz) + ''','
      +'CODINTVERT14    = ''' + IntToStr(Cod14Vert) + ''','
      +'CODINTHORIZ15   = ''' + IntToStr(Cod15Horiz) + ''','
      +'CODINTVERT15    = ''' + IntToStr(Cod15Vert) + ''','
      +'CODINTHORIZ16   = ''' + IntToStr(Cod16Horiz) + ''','
      +'CODINTVERT16    = ''' + IntToStr(Cod16Vert) + ''','
      +'CODINTHORIZ17   = ''' + IntToStr(Cod17Horiz) + ''','
      +'CODINTVERT17    = ''' + IntToStr(Cod17Vert) + ''','
      +'CODINTHORIZ18   = ''' + IntToStr(Cod18Horiz) + ''','
      +'CODINTVERT18    = ''' + IntToStr(Cod18Vert) + ''','
      +'CODINTHORIZ19   = ''' + IntToStr(Cod19Horiz) + ''','
      +'CODINTVERT19    = ''' + IntToStr(Cod19Vert) + ''','
      +'CODINTHORIZ20   = ''' + IntToStr(Cod20Horiz) + ''','
      +'CODINTVERT20    = ''' + IntToStr(Cod20Vert) + ''','
      +'CODINTHORIZ21   = ''' + IntToStr(Cod21Horiz) + ''','
      +'CODINTVERT21    = ''' + IntToStr(Cod21Vert) + ''','
      +'CODINTHORIZ22   = ''' + IntToStr(Cod22Horiz) + ''','
      +'CODINTVERT22    = ''' + IntToStr(Cod22Vert) + ''','
      +'CODINTHORIZ23   = ''' + IntToStr(Cod23Horiz) + ''','
      +'CODINTVERT23    = ''' + IntToStr(Cod23Vert) + ''','
      +'CODINTHORIZ24   = ''' + IntToStr(Cod24Horiz) + ''','
      +'CODINTVERT24    = ''' + IntToStr(Cod24Vert) + ''','
      +'FABRHORIZ1      = ''' + IntToStr(Fabr1Horiz) + ''','
      +'FABRVERT1       = ''' + IntToStr(Fabr1Vert) + ''','
      +'FABRHORIZ2      = ''' + IntToStr(Fabr2Horiz) + ''','
      +'FABRVERT2       = ''' + IntToStr(Fabr2Vert) + ''','
      +'FABRHORIZ3      = ''' + IntToStr(Fabr3Horiz) + ''','
      +'FABRVERT3       = ''' + IntToStr(Fabr3Vert) + ''','
      +'FABRHORIZ4      = ''' + IntToStr(Fabr4Horiz) + ''','
      +'FABRVERT4       = ''' + IntToStr(Fabr4Vert) + ''','
      +'FABRHORIZ5      = ''' + IntToStr(Fabr5Horiz) + ''','
      +'FABRVERT5       = ''' + IntToStr(Fabr5Vert) + ''','
      +'FABRHORIZ6      = ''' + IntToStr(Fabr6Horiz) + ''','
      +'FABRVERT6       = ''' + IntToStr(Fabr6Vert) + ''','
      +'FABRHORIZ7      = ''' + IntToStr(Fabr7Horiz) + ''','
      +'FABRVERT7       = ''' + IntToStr(Fabr7Vert) + ''','
      +'FABRHORIZ8      = ''' + IntToStr(Fabr8Horiz) + ''','
      +'FABRVERT8       = ''' + IntToStr(Fabr8Vert) + ''','
      +'FABRHORIZ9      = ''' + IntToStr(Fabr9Horiz) + ''','
      +'FABRVERT9       = ''' + IntToStr(Fabr9Vert) + ''','
      +'FABRHORIZ10      = ''' + IntToStr(Fabr10Horiz)+ ''','
      +'FABRVERT10       = ''' + IntToStr(Fabr10Vert) + ''','
      +'FABRHORIZ11      = ''' + IntToStr(Fabr11Horiz)  + ''','
      +'FABRVERT11       = ''' + IntToStr(Fabr11Vert) + ''','
      +'FABRHORIZ12      = ''' + IntToStr(Fabr12Horiz) + ''','
      +'FABRVERT12       = ''' + IntToStr(Fabr12Vert) + ''','
      +'FABRHORIZ13     = ''' + IntToStr(Fabr13Horiz) + ''','
      +'FABRVERT13       = ''' + IntToStr(Fabr13Vert) + ''','
      +'FABRHORIZ14      = ''' + IntToStr(Fabr14Horiz) + ''','
      +'FABRVERT14       = ''' + IntToStr(Fabr14Vert) + ''','
      +'FABRHORIZ15      = ''' + IntToStr(Fabr15Horiz) + ''','
      +'FABRVERT15       = ''' + IntToStr(Fabr15Vert) + ''','
      +'FABRHORIZ16      = ''' + IntToStr(Fabr16Horiz) + ''','
      +'FABRVERT16       = ''' + IntToStr(Fabr16Vert) + ''','
      +'FABRHORIZ17      = ''' + IntToStr(Fabr17Horiz) + ''','
      +'FABRVERT17       = ''' + IntToStr(Fabr17Vert) + ''','
      +'FABRHORIZ18      = ''' + IntToStr(Fabr18Horiz) + ''','
      +'FABRVERT18       = ''' + IntToStr(Fabr18Vert) + ''','
      +'FABRHORIZ19      = ''' + IntToStr(Fabr19Horiz) + ''','
      +'FABRVERT19       = ''' + IntToStr(Fabr19Vert) + ''','
      +'FABRHORIZ20      = ''' + IntToStr(Fabr20Horiz) + ''','
      +'FABRVERT20       = ''' + IntToStr(Fabr20Vert) + ''','
      +'FABRHORIZ21      = ''' + IntToStr(Fabr21Horiz) + ''','
      +'FABRVERT21       = ''' + IntToStr(Fabr21Vert) + ''','
      +'FABRHORIZ22      = ''' + IntToStr(Fabr22Horiz)  + ''','
      +'FABRVERT22       = ''' + IntToStr(Fabr22Vert) + ''','
      +'FABRHORIZ23      = ''' + IntToStr(Fabr23Horiz) + ''','
      +'FABRVERT23       = ''' + IntToStr(Fabr23Vert) + ''','
      +'FABRHORIZ24      = ''' + IntToStr(Fabr24Horiz) + ''','
      +'FABRVERT24       = ''' + IntToStr(Fabr24Vert) + ''','
      +'UNIDHORIZ1       = ''' + IntToStr(Unid1Horiz) + ''','
      +'UNIDVERT1        = ''' + IntToStr(Unid1Vert) + ''','
      +'UNIDHORIZ2       = ''' + IntToStr(Unid2Horiz) + ''','
      +'UNIDVERT2        = ''' + IntToStr(Unid2Vert) + ''','
      +'UNIDHORIZ3       = ''' + IntToStr(Unid3Horiz) + ''','
      +'UNIDVERT3        = ''' + IntToStr(Unid3Vert) + ''','
      +'UNIDHORIZ4       = ''' + IntToStr(Unid4Horiz) + ''','
      +'UNIDVERT4        = ''' + IntToStr(Unid4Vert) + ''','
      +'UNIDHORIZ5       = ''' + IntToStr(Unid5Horiz) + ''','
      +'UNIDVERT5        = ''' + IntToStr(Unid5Vert) + ''','
      +'UNIDHORIZ6       = ''' + IntToStr(Unid6Horiz) + ''','
      +'UNIDVERT6        = ''' + IntToStr(Unid6Vert) + ''','
      +'UNIDHORIZ7       = ''' + IntToStr(Unid7Horiz) + ''','
      +'UNIDVERT7        = ''' + IntToStr(Unid7Vert) + ''','
      +'UNIDHORIZ8       = ''' + IntToStr(Unid8Horiz) + ''','
      +'UNIDVERT8        = ''' + IntToStr(Unid8Vert) + ''','
      +'UNIDHORIZ9       = ''' + IntToStr(Unid9Horiz) + ''','
      +'UNIDVERT9        = ''' + IntToStr(Unid9Vert) + ''','
      +'UNIDHORIZ10       = ''' + IntToStr(Unid10Horiz) + ''','
      +'UNIDVERT10        = ''' + IntToStr(Unid10Vert) + ''','
      +'UNIDHORIZ11       = ''' + IntToStr(Unid11Horiz) + ''','
      +'UNIDVERT11        = ''' + IntToStr(Unid11Vert) + ''','
      +'UNIDHORIZ12       = ''' + IntToStr(Unid12Horiz) + ''','
      +'UNIDVERT12        = ''' + IntToStr(Unid12Vert) + ''','
      +'UNIDHORIZ13       = ''' + IntToStr(Unid13Horiz) + ''','
      +'UNIDVERT13        = ''' + IntToStr(Unid13Vert) + ''','
      +'UNIDHORIZ14       = ''' + IntToStr(Unid14Horiz) + ''','
      +'UNIDVERT14        = ''' + IntToStr(Unid14Vert) + ''','
      +'UNIDHORIZ15       = ''' + IntToStr(Unid15Horiz) + ''','
      +'UNIDVERT15        = ''' + IntToStr(Unid15Vert) + ''','
      +'UNIDHORIZ16       = ''' + IntToStr(Unid16Horiz) + ''','
      +'UNIDVERT16        = ''' + IntToStr(Unid16Vert) + ''','
      +'UNIDHORIZ17       = ''' + IntToStr(Unid17Horiz) + ''','
      +'UNIDVERT17        = ''' + IntToStr(Unid17Vert) + ''','
      +'UNIDHORIZ18       = ''' + IntToStr(Unid18Horiz) + ''','
      +'UNIDVERT18        = ''' + IntToStr(Unid18Vert) + ''','
      +'UNIDHORIZ19       = ''' + IntToStr(Unid19Horiz) + ''','
      +'UNIDVERT19        = ''' + IntToStr(Unid19Vert) + ''','
      +'UNIDHORIZ20       = ''' + IntToStr(Unid20Horiz) + ''','
      +'UNIDVERT20        = ''' + IntToStr(Unid20Vert) + ''','
      +'UNIDHORIZ21       = ''' + IntToStr(Unid21Horiz) + ''','
      +'UNIDVERT21        = ''' + IntToStr(Unid21Vert) + ''','
      +'UNIDHORIZ22       = ''' + IntToStr(Unid22Horiz) + ''','
      +'UNIDVERT22        = ''' + IntToStr(Unid22Vert) + ''','
      +'UNIDHORIZ23       = ''' + IntToStr(Unid23Horiz) + ''','
      +'UNIDVERT23        = ''' + IntToStr(Unid23Vert) + ''','
      +'UNIDHORIZ24       = ''' + IntToStr(Unid24Horiz) + ''','
      +'UNIDVERT24        = ''' + IntToStr(Unid24Vert) + ''' WHERE IDETIQUETAGRANDE = ''' + IntToStr(IDEtiqueta) + '''');
      ibEtiquetaGrande.ExecSQL;
      Commit(ibEtiquetaGrande);



    end else begin

      ibEtiquetaGrande.Close;
      ibEtiquetaGrande.SQL.Clear;
      ibEtiquetaGrande.SQL.Add('INSERT INTO TBLETIQUETAGRANDE'
      +'(ETIQUETA1HORIZ,ETIQUETA1VERT,ETIQUETA2HORIZ,ETIQUETA2VERT,'
      + 'ETIQUETA3HORIZ,ETIQUETA3VERT,ETIQUETA4HORIZ,ETIQUETA4VERT,'
      + 'ETIQUETA5HORIZ,ETIQUETA5VERT,ETIQUETA6HORIZ,ETIQUETA6VERT,'
      + 'ETIQUETA7HORIZ,ETIQUETA7VERT,ETIQUETA8HORIZ,ETIQUETA8VERT,'
      + 'ETIQUETA9HORIZ,ETIQUETA9VERT,ETIQUETA10HORIZ,ETIQUETA10VERT,'
      + 'ETIQUETA11HORIZ,ETIQUETA11VERT,ETIQUETA12HORIZ,ETIQUETA12VERT,'
      + 'ETIQUETA13HORIZ,ETIQUETA13VERT,ETIQUETA14HORIZ,ETIQUETA14VERT,'
      + 'ETIQUETA15HORIZ,ETIQUETA15VERT,ETIQUETA16HORIZ,ETIQUETA16VERT,'
      + 'ETIQUETA17HORIZ,ETIQUETA17VERT,ETIQUETA18HORIZ,ETIQUETA18VERT,'
      + 'ETIQUETA19HORIZ,ETIQUETA19VERT,ETIQUETA20HORIZ,ETIQUETA20VERT,'
      + 'ETIQUETA21HORIZ,ETIQUETA21VERT,ETIQUETA22HORIZ,ETIQUETA22VERT,'
      + 'ETIQUETA23HORIZ,ETIQUETA23VERT,ETIQUETA24HORIZ,ETIQUETA24VERT,'
      + 'VALOR1HORIZ,VALOR1VERT,VALOR2HORIZ,VALOR2VERT,'
      + 'VALOR3HORIZ,VALOR3VERT,VALOR4HORIZ,VALOR4VERT,'
      + 'VALOR5HORIZ,VALOR5VERT,VALOR6HORIZ,VALOR6VERT,'
      + 'VALOR7HORIZ,VALOR7VERT,VALOR8HORIZ,VALOR8VERT,'
      + 'VALOR9HORIZ,VALOR9VERT,VALOR10HORIZ,VALOR10VERT,'
      + 'VALOR11HORIZ,VALOR11VERT,VALOR12HORIZ,VALOR12VERT,'
      + 'VALOR13HORIZ,VALOR13VERT,VALOR14HORIZ,VALOR14VERT,'
      + 'VALOR15HORIZ,VALOR15VERT,VALOR16HORIZ,VALOR16VERT,'
      + 'VALOR17HORIZ,VALOR17VERT,VALOR18HORIZ,VALOR18VERT,'
      + 'VALOR19HORIZ,VALOR19VERT,VALOR20HORIZ,VALOR20VERT,'
      + 'VALOR21HORIZ,VALOR21VERT,VALOR22HORIZ,VALOR22VERT,'
      + 'VALOR23HORIZ,VALOR23VERT,VALOR24HORIZ,VALOR24VERT) values'
      +'(''' + IntToStr(Et1Horiz) + ''',''' + IntToStr(Et1Vert) + ''','
      +' ''' + IntToStr(Et2Horiz) + ''',''' + IntToStr(Et2Vert) + ''','
      +' ''' + IntToStr(Et3Horiz) + ''',''' + IntToStr(Et3Vert) + ''','
      +' ''' + IntToStr(Et4Horiz) + ''',''' + IntToStr(Et4Vert) + ''','
      +' ''' + IntToStr(Et5Horiz) + ''',''' + IntToStr(Et5Vert) + ''','
      +' ''' + IntToStr(Et6Horiz) + ''',''' + IntToStr(Et6Vert) + ''','
      +' ''' + IntToStr(Et7Horiz) + ''',''' + IntToStr(Et7Vert) + ''','
      +' ''' + IntToStr(Et8Horiz) + ''',''' + IntToStr(Et8Vert) + ''','
      +' ''' + IntToStr(Et9Horiz) + ''',''' + IntToStr(Et9Vert) + ''','
      +' ''' + IntToStr(Et10Horiz) + ''',''' + IntToStr(Et10Vert) + ''','
      +' ''' + IntToStr(Et11Horiz) + ''',''' + IntToStr(Et11Vert) + ''','
      +' ''' + IntToStr(Et12Horiz) + ''',''' + IntToStr(Et12Vert) + ''','
      +' ''' + IntToStr(Et13Horiz) + ''',''' + IntToStr(Et13Vert) + ''','
      +' ''' + IntToStr(Et14Horiz) + ''',''' + IntToStr(Et14Vert) + ''','
      +' ''' + IntToStr(Et15Horiz) + ''',''' + IntToStr(Et15Vert) + ''','
      +' ''' + IntToStr(Et16Horiz) + ''',''' + IntToStr(Et16Vert) + ''','
      +' ''' + IntToStr(Et17Horiz) + ''',''' + IntToStr(Et17Vert) + ''','
      +' ''' + IntToStr(Et18Horiz) + ''',''' + IntToStr(Et18Vert) + ''','
      +' ''' + IntToStr(Et19Horiz) + ''',''' + IntToStr(Et19Vert) + ''','
      +' ''' + IntToStr(Et20Horiz) + ''',''' + IntToStr(Et20Vert) + ''','
      +' ''' + IntToStr(Et21Horiz) + ''',''' + IntToStr(Et21Vert) + ''','
      +' ''' + IntToStr(Et22Horiz) + ''',''' + IntToStr(Et22Vert) + ''','
      +' ''' + IntToStr(Et23Horiz) + ''',''' + IntToStr(Et23Vert) + ''','
      +' ''' + IntToStr(Et24Horiz) + ''',''' + IntToStr(Et24Vert) + ''','
      +' ''' + IntToStr(Vlr1Horiz) + ''',''' + IntToStr(Vlr1Vert) + ''','
      +' ''' + IntToStr(Vlr2Horiz) + ''',''' + IntToStr(Vlr2Vert) + ''','
      +' ''' + IntToStr(Vlr3Horiz) + ''',''' + IntToStr(Vlr3Vert) + ''','
      +' ''' + IntToStr(Vlr4Horiz) + ''',''' + IntToStr(Vlr4Vert) + ''','
      +' ''' + IntToStr(Vlr5Horiz) + ''',''' + IntToStr(Vlr5Vert) + ''','
      +' ''' + IntToStr(Vlr6Horiz) + ''',''' + IntToStr(Vlr6Vert) + ''','
      +' ''' + IntToStr(Vlr7Horiz) + ''',''' + IntToStr(Vlr7Vert) + ''','
      +' ''' + IntToStr(Vlr8Horiz) + ''',''' + IntToStr(Vlr8Vert) + ''','
      +' ''' + IntToStr(Vlr9Horiz) + ''',''' + IntToStr(Vlr9Vert) + ''','
      +' ''' + IntToStr(Vlr10Horiz) + ''',''' + IntToStr(Vlr10Vert) + ''','
      +' ''' + IntToStr(Vlr11Horiz) + ''',''' + IntToStr(Vlr11Vert) + ''','
      +' ''' + IntToStr(Vlr12Horiz) + ''',''' + IntToStr(Vlr12Vert) + ''','
      +' ''' + IntToStr(Vlr13Horiz) + ''',''' + IntToStr(Vlr13Vert) + ''','
      +' ''' + IntToStr(Vlr14Horiz) + ''',''' + IntToStr(Vlr14Vert) + ''','
      +' ''' + IntToStr(Vlr15Horiz) + ''',''' + IntToStr(Vlr15Vert) + ''','
      +' ''' + IntToStr(Vlr16Horiz) + ''',''' + IntToStr(Vlr16Vert) + ''','
      +' ''' + IntToStr(Vlr17Horiz) + ''',''' + IntToStr(Vlr17Vert) + ''','
      +' ''' + IntToStr(Vlr18Horiz) + ''',''' + IntToStr(Vlr18Vert) + ''','
      +' ''' + IntToStr(Vlr19Horiz) + ''',''' + IntToStr(Vlr19Vert) + ''','
      +' ''' + IntToStr(Vlr20Horiz) + ''',''' + IntToStr(Vlr20Vert) + ''','
      +' ''' + IntToStr(Vlr21Horiz) + ''',''' + IntToStr(Vlr21Vert) + ''','
      +' ''' + IntToStr(Vlr22Horiz) + ''',''' + IntToStr(Vlr22Vert) + ''','
      +' ''' + IntToStr(Vlr23Horiz) + ''',''' + IntToStr(Vlr23Vert) + ''','
      +' ''' + IntToStr(Vlr24Horiz) + ''',''' + IntToStr(Vlr24Vert) + ''')');
      ibEtiquetaGrande.ExecSQL;
      Commit(ibEtiquetaGrande);

    end;//if recordcount

  end;//with
  
end;

procedure TfrmConfigEtiquetaGr.ibeaImprimirClick(Sender: TObject);

var

Et1Horiz,Et1Vert,Et2Horiz,Et2Vert,Et3Horiz,Et3Vert : Integer;
Et4Horiz,Et4Vert,Et5Horiz,Et5Vert,Et6Horiz,Et6Vert : Integer;
Et7Horiz,Et7Vert,Et8Horiz,Et8Vert,Et9Horiz,Et9Vert : Integer;
Et10Horiz,Et10Vert,Et11Horiz,Et11Vert,Et12Horiz,Et12Vert : Integer;
Et13Horiz,Et13Vert,Et14Horiz,Et14Vert,Et15Horiz,Et15Vert : Integer;
Et16Horiz,Et16Vert,Et17Horiz,Et17Vert,Et18Horiz,Et18Vert : Integer;
Et19Horiz,Et19Vert,Et20Horiz,Et20Vert,Et21Horiz,Et21Vert : Integer;
Et22Horiz,Et22Vert,Et23Horiz,Et23Vert,Et24Horiz,Et24Vert : Integer;

Vlr1Horiz,Vlr1Vert,Vlr2Horiz,Vlr2Vert,Vlr3Horiz,Vlr3Vert : Integer;
Vlr4Horiz,Vlr4Vert,Vlr5Horiz,Vlr5Vert,Vlr6Horiz,Vlr6Vert : Integer;
Vlr7Horiz,Vlr7Vert,Vlr8Horiz,Vlr8Vert,Vlr9Horiz,Vlr9Vert : Integer;
Vlr10Horiz,Vlr10Vert,Vlr11Horiz,Vlr11Vert,Vlr12Horiz,Vlr12Vert : Integer;
Vlr13Horiz,Vlr13Vert,Vlr14Horiz,Vlr14Vert,Vlr15Horiz,Vlr15Vert : Integer;
Vlr16Horiz,Vlr16Vert,Vlr17Horiz,Vlr17Vert,Vlr18Horiz,Vlr18Vert : Integer;
Vlr19Horiz,Vlr19Vert,Vlr20Horiz,Vlr20Vert,Vlr21Horiz,Vlr21Vert : Integer;
Vlr22Horiz,Vlr22Vert,Vlr23Horiz,Vlr23Vert,Vlr24Horiz,Vlr24Vert : Integer;
IndiceHorizontal,IndiceVertical  :Real;
Prod1Horiz,Prod1Vert,Prod2Horiz,Prod2Vert,Prod3Horiz,Prod3Vert : Integer;
Prod4Horiz,Prod4Vert,Prod5Horiz,Prod5Vert,Prod6Horiz,Prod6Vert : Integer;
Prod7Horiz,Prod7Vert,Prod8Horiz,Prod8Vert,Prod9Horiz,Prod9Vert : Integer;
Prod10Horiz,Prod10Vert,Prod11Horiz,Prod11Vert,Prod12Horiz,Prod12Vert : Integer;
Prod13Horiz,Prod13Vert,Prod14Horiz,Prod14Vert,Prod15Horiz,Prod15Vert : Integer;
Prod16Horiz,Prod16Vert,Prod17Horiz,Prod17Vert,Prod18Horiz,Prod18Vert : Integer;
Prod19Horiz,Prod19Vert,Prod20Horiz,Prod20Vert,Prod21Horiz,Prod21Vert : Integer;
Prod22Horiz,Prod22Vert,Prod23Horiz,Prod23Vert,Prod24Horiz,Prod24Vert : Integer;

VlrProd1Horiz,VlrProd1Vert,VlrProd2Horiz,VlrProd2Vert,VlrProd3Horiz,VlrProd3Vert : Integer;
VlrProd4Horiz,VlrProd4Vert,VlrProd5Horiz,VlrProd5Vert,VlrProd6Horiz,VlrProd6Vert : Integer;
VlrProd7Horiz,VlrProd7Vert,VlrProd8Horiz,VlrProd8Vert,VlrProd9Horiz,VlrProd9Vert : Integer;
VlrProd10Horiz,VlrProd10Vert,VlrProd11Horiz,VlrProd11Vert,VlrProd12Horiz,VlrProd12Vert : Integer;
VlrProd13Horiz,VlrProd13Vert,VlrProd14Horiz,VlrProd14Vert,VlrProd15Horiz,VlrProd15Vert : Integer;
VlrProd16Horiz,VlrProd16Vert,VlrProd17Horiz,VlrProd17Vert,VlrProd18Horiz,VlrProd18Vert : Integer;
VlrProd19Horiz,VlrProd19Vert,VlrProd20Horiz,VlrProd20Vert,VlrProd21Horiz,VlrProd21Vert : Integer;
VlrProd22Horiz,VlrProd22Vert,VlrProd23Horiz,VlrProd23Vert,VlrProd24Horiz,VlrProd24Vert : Integer;

Ref1Horiz,Ref1Vert,Ref2Horiz,Ref2Vert,Ref3Horiz,Ref3Vert : Integer;
Ref4Horiz,Ref4Vert,Ref5Horiz,Ref5Vert,Ref6Horiz,Ref6Vert : Integer;
Ref7Horiz,Ref7Vert,Ref8Horiz,Ref8Vert,Ref9Horiz,Ref9Vert : Integer;
Ref10Horiz,Ref10Vert,Ref11Horiz,Ref11Vert,Ref12Horiz,Ref12Vert : Integer;
Ref13Horiz,Ref13Vert,Ref14Horiz,Ref14Vert,Ref15Horiz,Ref15Vert : Integer;
Ref16Horiz,Ref16Vert,Ref17Horiz,Ref17Vert,Ref18Horiz,Ref18Vert : Integer;
Ref19Horiz,Ref19Vert,Ref20Horiz,Ref20Vert,Ref21Horiz,Ref21Vert : Integer;
Ref22Horiz,Ref22Vert,Ref23Horiz,Ref23Vert,Ref24Horiz,Ref24Vert : Integer;

CodInt1Horiz,CodInt1Vert,CodInt2Horiz,CodInt2Vert,CodInt3Horiz,CodInt3Vert : Integer;
CodInt4Horiz,CodInt4Vert,CodInt5Horiz,CodInt5Vert,CodInt6Horiz,CodInt6Vert : Integer;
CodInt7Horiz,CodInt7Vert,CodInt8Horiz,CodInt8Vert,CodInt9Horiz,CodInt9Vert : Integer;
CodInt10Horiz,CodInt10Vert,CodInt11Horiz,CodInt11Vert,CodInt12Horiz,CodInt12Vert : Integer;
CodInt13Horiz,CodInt13Vert,CodInt14Horiz,CodInt14Vert,CodInt15Horiz,CodInt15Vert : Integer;
CodInt16Horiz,CodInt16Vert,CodInt17Horiz,CodInt17Vert,CodInt18Horiz,CodInt18Vert : Integer;
CodInt19Horiz,CodInt19Vert,CodInt20Horiz,CodInt20Vert,CodInt21Horiz,CodInt21Vert : Integer;
CodInt22Horiz,CodInt22Vert,CodInt23Horiz,CodInt23Vert,CodInt24Horiz,CodInt24Vert : Integer;

Fabr1Horiz,Fabr1Vert,Fabr2Horiz,Fabr2Vert,Fabr3Horiz,Fabr3Vert : Integer;
Fabr4Horiz,Fabr4Vert,Fabr5Horiz,Fabr5Vert,Fabr6Horiz,Fabr6Vert : Integer;
Fabr7Horiz,Fabr7Vert,Fabr8Horiz,Fabr8Vert,Fabr9Horiz,Fabr9Vert : Integer;
Fabr10Horiz,Fabr10Vert,Fabr11Horiz,Fabr11Vert,Fabr12Horiz,Fabr12Vert : Integer;
Fabr13Horiz,Fabr13Vert,Fabr14Horiz,Fabr14Vert,Fabr15Horiz,Fabr15Vert : Integer;
Fabr16Horiz,Fabr16Vert,Fabr17Horiz,Fabr17Vert,Fabr18Horiz,Fabr18Vert : Integer;
Fabr19Horiz,Fabr19Vert,Fabr20Horiz,Fabr20Vert,Fabr21Horiz,Fabr21Vert : Integer;
Fabr22Horiz,Fabr22Vert,Fabr23Horiz,Fabr23Vert,Fabr24Horiz,Fabr24Vert : Integer;

Unid1Horiz,Unid1Vert,Unid2Horiz,Unid2Vert,Unid3Horiz,Unid3Vert : Integer;
Unid4Horiz,Unid4Vert,Unid5Horiz,Unid5Vert,Unid6Horiz,Unid6Vert : Integer;
Unid7Horiz,Unid7Vert,Unid8Horiz,Unid8Vert,Unid9Horiz,Unid9Vert : Integer;
Unid10Horiz,Unid10Vert,Unid11Horiz,Unid11Vert,Unid12Horiz,Unid12Vert : Integer;
Unid13Horiz,Unid13Vert,Unid14Horiz,Unid14Vert,Unid15Horiz,Unid15Vert : Integer;
Unid16Horiz,Unid16Vert,Unid17Horiz,Unid17Vert,Unid18Horiz,Unid18Vert : Integer;
Unid19Horiz,Unid19Vert,Unid20Horiz,Unid20Vert,Unid21Horiz,Unid21Vert : Integer;
Unid22Horiz,Unid22Vert,Unid23Horiz,Unid23Vert,Unid24Horiz,Unid24Vert : Integer;

//VARIAVEIS PARA O INDICE HORIZONTAL E VERTICAL DA IMPRESSAO DE ETIQUETA

R1Horiz,R1Vert,R2Horiz,R2Vert,R3Horiz,R3Vert : Integer;
R4Horiz,R4Vert,R5Horiz,R5Vert,R6Horiz,R6Vert : Integer;
R7Horiz,R7Vert,R8Horiz,R8Vert,R9Horiz,R9Vert : Integer;
R10Horiz,R10Vert,R11Horiz,R11Vert,R12Horiz,R12Vert : Integer;
R13Horiz,R13Vert,R14Horiz,R14Vert,R15Horiz,R15Vert : Integer;
R16Horiz,R16Vert,R17Horiz,R17Vert,R18Horiz,R18Vert : Integer;
R19Horiz,R19Vert,R20Horiz,R20Vert,R21Horiz,R21Vert : Integer;
R22Horiz,R22Vert,R23Horiz,R23Vert,R24Horiz,R24Vert : Integer;

Cod1Horiz,Cod1Vert,Cod2Horiz,Cod2Vert,Cod3Horiz,Cod3Vert : Integer;
Cod4Horiz,Cod4Vert,Cod5Horiz,Cod5Vert,Cod6Horiz,Cod6Vert : Integer;
Cod7Horiz,Cod7Vert,Cod8Horiz,Cod8Vert,Cod9Horiz,Cod9Vert : Integer;
Cod10Horiz,Cod10Vert,Cod11Horiz,Cod11Vert,Cod12Horiz,Cod12Vert : Integer;
Cod13Horiz,Cod13Vert,Cod14Horiz,Cod14Vert,Cod15Horiz,Cod15Vert : Integer;
Cod16Horiz,Cod16Vert,Cod17Horiz,Cod17Vert,Cod18Horiz,Cod18Vert : Integer;
Cod19Horiz,Cod19Vert,Cod20Horiz,Cod20Vert,Cod21Horiz,Cod21Vert : Integer;
Cod22Horiz,Cod22Vert,Cod23Horiz,Cod23Vert,Cod24Horiz,Cod24Vert : Integer;

F1Horiz,F1Vert,F2Horiz,F2Vert,F3Horiz,F3Vert : Integer;
F4Horiz,F4Vert,F5Horiz,F5Vert,F6Horiz,F6Vert : Integer;
F7Horiz,F7Vert,F8Horiz,F8Vert,F9Horiz,F9Vert : Integer;
F10Horiz,F10Vert,F11Horiz,F11Vert,F12Horiz,F12Vert : Integer;
F13Horiz,F13Vert,F14Horiz,F14Vert,F15Horiz,F15Vert : Integer;
F16Horiz,F16Vert,F17Horiz,F17Vert,F18Horiz,F18Vert : Integer;
F19Horiz,F19Vert,F20Horiz,F20Vert,F21Horiz,F21Vert : Integer;
F22Horiz,F22Vert,F23Horiz,F23Vert,F24Horiz,F24Vert : Integer;

U1Horiz,U1Vert,U2Horiz,U2Vert,U3Horiz,U3Vert : Integer;
U4Horiz,U4Vert,U5Horiz,U5Vert,U6Horiz,U6Vert : Integer;
U7Horiz,U7Vert,U8Horiz,U8Vert,U9Horiz,U9Vert : Integer;
U10Horiz,U10Vert,U11Horiz,U11Vert,U12Horiz,U12Vert : Integer;
U13Horiz,U13Vert,U14Horiz,U14Vert,U15Horiz,U15Vert : Integer;
U16Horiz,U16Vert,U17Horiz,U17Vert,U18Horiz,U18Vert : Integer;
U19Horiz,U19Vert,U20Horiz,U20Vert,U21Horiz,U21Vert : Integer;
U22Horiz,U22Vert,U23Horiz,U23Vert,U24Horiz,U24Vert : Integer;

begin

  with dmModule do begin

    Commit(ibEtiquetaGrande);
    ibEtiquetaGrande.Close;
    ibEtiquetaGrande.SQL.Clear;
    ibEtiquetaGrande.SQL.Add('SELECT * FROM TBLETIQUETAGRANDE');
    ibEtiquetaGrande.Open;

    Commit(ibEtiquetaGr);
    ibEtiquetaGr.Close;
    ibEtiquetaGr.SQL.Clear;
    ibEtiquetaGr.SQL.Add('SELECT TBLETIQUETAGR.*,CADPRODUTOS.NOMEUNIDVENDA,'
    + 'CADPRODUTOS.MARCA FROM TBLETIQUETAGR '
    + 'LEFT OUTER JOIN CADPRODUTOS ON TBLETIQUETAGR.IDPROD=CADPRODUTOS.IDPROD');
    ibEtiquetaGr.Open;

    (ibEtiquetaGr.FieldByName('VLRVENDA') as TFloatField).DisplayFormat := CasasDecimais('Produtos');

    Et1Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA1HORIZ').AsInteger;
    Et1Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA1VERT').AsInteger;
    Et2Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA2HORIZ').AsInteger;
    Et2Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA2VERT').AsInteger;
    Et3Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA3HORIZ').AsInteger;
    Et3Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA3VERT').AsInteger;
    Et4Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA4HORIZ').AsInteger;
    Et4Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA4VERT').AsInteger;
    Et5Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA5HORIZ').AsInteger;
    Et5Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA5VERT').AsInteger;
    Et6Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA6HORIZ').AsInteger;
    Et6Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA6VERT').AsInteger;
    Et7Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA7HORIZ').AsInteger;
    Et7Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA7VERT').AsInteger;
    Et8Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA8HORIZ').AsInteger;
    Et8Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA8VERT').AsInteger;
    Et9Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA9HORIZ').AsInteger;
    Et9Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA9VERT').AsInteger;
    Et10Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA10HORIZ').AsInteger;
    Et10Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA10VERT').AsInteger;
    Et11Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA11HORIZ').AsInteger;
    Et11Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA11VERT').AsInteger;
    Et12Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA12HORIZ').AsInteger;
    Et12Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA12VERT').AsInteger;
    Et13Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA13HORIZ').AsInteger;
    Et13Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA13VERT').AsInteger;
    Et14Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA14HORIZ').AsInteger;
    Et14Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA14VERT').AsInteger;
    Et15Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA15HORIZ').AsInteger;
    Et15Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA15VERT').AsInteger;
    Et16Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA16HORIZ').AsInteger;
    Et16Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA16VERT').AsInteger;
    Et17Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA17HORIZ').AsInteger;
    Et17Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA17VERT').AsInteger;
    Et18Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA18HORIZ').AsInteger;
    Et18Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA18VERT').AsInteger;
    Et19Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA19HORIZ').AsInteger;
    Et19Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA19VERT').AsInteger;
    Et20Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA20HORIZ').AsInteger;
    Et20Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA20VERT').AsInteger;
    Et21Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA21HORIZ').AsInteger;
    Et21Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA21VERT').AsInteger;
    Et22Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA22HORIZ').AsInteger;
    Et22Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA22VERT').AsInteger;
    Et23Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA23HORIZ').AsInteger;
    Et23Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA23VERT').AsInteger;
    Et24Horiz     := ibEtiquetaGrande.FieldByName('ETIQUETA24HORIZ').AsInteger;
    Et24Vert      := ibEtiquetaGrande.FieldByName('ETIQUETA24VERT').AsInteger;

    Vlr1Horiz     := ibEtiquetaGrande.FieldByName('VALOR1HORIZ').AsInteger;
    Vlr1Vert      := ibEtiquetaGrande.FieldByName('VALOR1VERT').AsInteger;
    Vlr2Horiz     := ibEtiquetaGrande.FieldByName('VALOR2HORIZ').AsInteger;
    Vlr2Vert      := ibEtiquetaGrande.FieldByName('VALOR2VERT').AsInteger;
    Vlr3Horiz     := ibEtiquetaGrande.FieldByName('VALOR3HORIZ').AsInteger;
    Vlr3Vert      := ibEtiquetaGrande.FieldByName('VALOR3VERT').AsInteger;
    Vlr4Horiz     := ibEtiquetaGrande.FieldByName('VALOR4HORIZ').AsInteger;
    Vlr4Vert      := ibEtiquetaGrande.FieldByName('VALOR4VERT').AsInteger;
    Vlr5Horiz     := ibEtiquetaGrande.FieldByName('VALOR5HORIZ').AsInteger;
    Vlr5Vert      := ibEtiquetaGrande.FieldByName('VALOR5VERT').AsInteger;
    Vlr6Horiz     := ibEtiquetaGrande.FieldByName('VALOR6HORIZ').AsInteger;
    Vlr6Vert      := ibEtiquetaGrande.FieldByName('VALOR6VERT').AsInteger;
    Vlr7Horiz     := ibEtiquetaGrande.FieldByName('VALOR7HORIZ').AsInteger;
    Vlr7Vert      := ibEtiquetaGrande.FieldByName('VALOR7VERT').AsInteger;
    Vlr8Horiz     := ibEtiquetaGrande.FieldByName('VALOR8HORIZ').AsInteger;
    Vlr8Vert      := ibEtiquetaGrande.FieldByName('VALOR8VERT').AsInteger;
    Vlr9Horiz     := ibEtiquetaGrande.FieldByName('VALOR9HORIZ').AsInteger;
    Vlr9Vert      := ibEtiquetaGrande.FieldByName('VALOR9VERT').AsInteger;
    Vlr10Horiz     := ibEtiquetaGrande.FieldByName('VALOR10HORIZ').AsInteger;
    Vlr10Vert      := ibEtiquetaGrande.FieldByName('VALOR10VERT').AsInteger;
    Vlr11Horiz     := ibEtiquetaGrande.FieldByName('VALOR11HORIZ').AsInteger;
    Vlr11Vert      := ibEtiquetaGrande.FieldByName('VALOR11VERT').AsInteger;
    Vlr12Horiz     := ibEtiquetaGrande.FieldByName('VALOR12HORIZ').AsInteger;
    Vlr12Vert      := ibEtiquetaGrande.FieldByName('VALOR12VERT').AsInteger;
    Vlr13Horiz     := ibEtiquetaGrande.FieldByName('VALOR13HORIZ').AsInteger;
    Vlr13Vert      := ibEtiquetaGrande.FieldByName('VALOR13VERT').AsInteger;
    Vlr14Horiz     := ibEtiquetaGrande.FieldByName('VALOR14HORIZ').AsInteger;
    Vlr14Vert      := ibEtiquetaGrande.FieldByName('VALOR14VERT').AsInteger;
    Vlr15Horiz     := ibEtiquetaGrande.FieldByName('VALOR15HORIZ').AsInteger;
    Vlr15Vert      := ibEtiquetaGrande.FieldByName('VALOR15VERT').AsInteger;
    Vlr16Horiz     := ibEtiquetaGrande.FieldByName('VALOR16HORIZ').AsInteger;
    Vlr16Vert      := ibEtiquetaGrande.FieldByName('VALOR16VERT').AsInteger;
    Vlr17Horiz     := ibEtiquetaGrande.FieldByName('VALOR17HORIZ').AsInteger;
    Vlr17Vert      := ibEtiquetaGrande.FieldByName('VALOR17VERT').AsInteger;
    Vlr18Horiz     := ibEtiquetaGrande.FieldByName('VALOR18HORIZ').AsInteger;
    Vlr18Vert      := ibEtiquetaGrande.FieldByName('VALOR18VERT').AsInteger;
    Vlr19Horiz     := ibEtiquetaGrande.FieldByName('VALOR19HORIZ').AsInteger;
    Vlr19Vert      := ibEtiquetaGrande.FieldByName('VALOR19VERT').AsInteger;
    Vlr20Horiz     := ibEtiquetaGrande.FieldByName('VALOR20HORIZ').AsInteger;
    Vlr20Vert      := ibEtiquetaGrande.FieldByName('VALOR20VERT').AsInteger;
    Vlr21Horiz     := ibEtiquetaGrande.FieldByName('VALOR21HORIZ').AsInteger;
    Vlr21Vert      := ibEtiquetaGrande.FieldByName('VALOR21VERT').AsInteger;
    Vlr22Horiz     := ibEtiquetaGrande.FieldByName('VALOR22HORIZ').AsInteger;
    Vlr22Vert      := ibEtiquetaGrande.FieldByName('VALOR22VERT').AsInteger;
    Vlr23Horiz     := ibEtiquetaGrande.FieldByName('VALOR23HORIZ').AsInteger;
    Vlr23Vert      := ibEtiquetaGrande.FieldByName('VALOR23VERT').AsInteger;
    Vlr24Horiz     := ibEtiquetaGrande.FieldByName('VALOR24HORIZ').AsInteger;
    Vlr24Vert      := ibEtiquetaGrande.FieldByName('VALOR24VERT').AsInteger;

    Ref1Horiz     := ibEtiquetaGrande.FieldByName('REF1HORIZ').AsInteger;
    Ref1Vert      := ibEtiquetaGrande.FieldByName('REF1VERT').AsInteger;
    Ref2Horiz     := ibEtiquetaGrande.FieldByName('REF2HORIZ').AsInteger;
    Ref2Vert      := ibEtiquetaGrande.FieldByName('REF2VERT').AsInteger;
    Ref3Horiz     := ibEtiquetaGrande.FieldByName('REF3HORIZ').AsInteger;
    Ref3Vert      := ibEtiquetaGrande.FieldByName('REF3VERT').AsInteger;
    Ref4Horiz     := ibEtiquetaGrande.FieldByName('REF4HORIZ').AsInteger;
    Ref4Vert      := ibEtiquetaGrande.FieldByName('REF4VERT').AsInteger;
    Ref5Horiz     := ibEtiquetaGrande.FieldByName('REF5HORIZ').AsInteger;
    Ref5Vert      := ibEtiquetaGrande.FieldByName('REF5VERT').AsInteger;
    Ref6Horiz     := ibEtiquetaGrande.FieldByName('REF6HORIZ').AsInteger;
    Ref6Vert      := ibEtiquetaGrande.FieldByName('REF6VERT').AsInteger;
    Ref7Horiz     := ibEtiquetaGrande.FieldByName('REF7HORIZ').AsInteger;
    Ref7Vert      := ibEtiquetaGrande.FieldByName('REF7VERT').AsInteger;
    Ref8Horiz     := ibEtiquetaGrande.FieldByName('REF8HORIZ').AsInteger;
    Ref8Vert      := ibEtiquetaGrande.FieldByName('REF8VERT').AsInteger;
    Ref9Horiz     := ibEtiquetaGrande.FieldByName('REF9HORIZ').AsInteger;
    Ref9Vert      := ibEtiquetaGrande.FieldByName('REF9VERT').AsInteger;
    Ref10Horiz     := ibEtiquetaGrande.FieldByName('REF10HORIZ').AsInteger;
    Ref10Vert      := ibEtiquetaGrande.FieldByName('REF10VERT').AsInteger;
    Ref11Horiz     := ibEtiquetaGrande.FieldByName('REF11HORIZ').AsInteger;
    Ref11Vert      := ibEtiquetaGrande.FieldByName('REF11VERT').AsInteger;
    Ref12Horiz     := ibEtiquetaGrande.FieldByName('REF12HORIZ').AsInteger;
    Ref12Vert      := ibEtiquetaGrande.FieldByName('REF12VERT').AsInteger;
    Ref13Horiz     := ibEtiquetaGrande.FieldByName('REF13HORIZ').AsInteger;
    Ref13Vert      := ibEtiquetaGrande.FieldByName('REF13VERT').AsInteger;
    Ref14Horiz     := ibEtiquetaGrande.FieldByName('REF14HORIZ').AsInteger;
    Ref14Vert      := ibEtiquetaGrande.FieldByName('REF14VERT').AsInteger;
    Ref15Horiz     := ibEtiquetaGrande.FieldByName('REF15HORIZ').AsInteger;
    Ref15Vert      := ibEtiquetaGrande.FieldByName('REF15VERT').AsInteger;
    Ref16Horiz     := ibEtiquetaGrande.FieldByName('REF16HORIZ').AsInteger;
    Ref16Vert      := ibEtiquetaGrande.FieldByName('REF16VERT').AsInteger;
    Ref17Horiz     := ibEtiquetaGrande.FieldByName('REF17HORIZ').AsInteger;
    Ref17Vert      := ibEtiquetaGrande.FieldByName('REF17VERT').AsInteger;
    Ref18Horiz     := ibEtiquetaGrande.FieldByName('REF18HORIZ').AsInteger;
    Ref18Vert      := ibEtiquetaGrande.FieldByName('REF18VERT').AsInteger;
    Ref19Horiz     := ibEtiquetaGrande.FieldByName('REF19HORIZ').AsInteger;
    Ref19Vert      := ibEtiquetaGrande.FieldByName('REF19VERT').AsInteger;
    Ref20Horiz     := ibEtiquetaGrande.FieldByName('REF20HORIZ').AsInteger;
    Ref20Vert      := ibEtiquetaGrande.FieldByName('REF20VERT').AsInteger;
    Ref21Horiz     := ibEtiquetaGrande.FieldByName('REF21HORIZ').AsInteger;
    Ref21Vert      := ibEtiquetaGrande.FieldByName('REF21VERT').AsInteger;
    Ref22Horiz     := ibEtiquetaGrande.FieldByName('REF22HORIZ').AsInteger;
    Ref22Vert      := ibEtiquetaGrande.FieldByName('REF22VERT').AsInteger;
    Ref23Horiz     := ibEtiquetaGrande.FieldByName('REF23HORIZ').AsInteger;
    Ref23Vert      := ibEtiquetaGrande.FieldByName('REF23VERT').AsInteger;
    Ref24Horiz     := ibEtiquetaGrande.FieldByName('REF24HORIZ').AsInteger;
    Ref24Vert      := ibEtiquetaGrande.FieldByName('REF24VERT').AsInteger;

    CodInt1Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ1').AsInteger;
    CodInt1Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT1').AsInteger;
    CodInt2Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ2').AsInteger;
    CodInt2Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT2').AsInteger;
    CodInt3Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ3').AsInteger;
    CodInt3Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT3').AsInteger;
    CodInt4Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ4').AsInteger;
    CodInt4Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT4').AsInteger;
    CodInt5Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ5').AsInteger;
    CodInt5Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT5').AsInteger;
    CodInt6Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ6').AsInteger;
    CodInt6Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT6').AsInteger;
    CodInt7Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ7').AsInteger;
    CodInt7Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT7').AsInteger;
    CodInt8Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ8').AsInteger;
    CodInt8Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT8').AsInteger;
    CodInt9Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ9').AsInteger;
    CodInt9Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT9').AsInteger;
    CodInt10Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ10').AsInteger;
    CodInt10Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT10').AsInteger;
    CodInt11Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ11').AsInteger;
    CodInt11Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT11').AsInteger;
    CodInt12Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ12').AsInteger;
    CodInt12Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT12').AsInteger;
    CodInt13Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ13').AsInteger;
    CodInt13Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT13').AsInteger;
    CodInt14Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ14').AsInteger;
    CodInt14Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT14').AsInteger;
    CodInt15Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ15').AsInteger;
    CodInt15Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT15').AsInteger;
    CodInt16Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ16').AsInteger;
    CodInt16Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT16').AsInteger;
    CodInt17Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ17').AsInteger;
    CodInt17Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT17').AsInteger;
    CodInt18Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ18').AsInteger;
    CodInt18Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT18').AsInteger;
    CodInt19Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ19').AsInteger;
    CodInt19Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT19').AsInteger;
    CodInt20Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ20').AsInteger;
    CodInt20Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT20').AsInteger;
    CodInt21Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ21').AsInteger;
    CodInt21Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT21').AsInteger;
    CodInt22Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ22').AsInteger;
    CodInt22Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT22').AsInteger;
    CodInt23Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ23').AsInteger;
    CodInt23Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT23').AsInteger;
    CodInt24Horiz     := ibEtiquetaGrande.FieldByName('CODINTHORIZ24').AsInteger;
    CodInt24Vert      := ibEtiquetaGrande.FieldByName('CODINTVERT24').AsInteger;

    Fabr1Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ1').AsInteger;
    Fabr1Vert      := ibEtiquetaGrande.FieldByName('FABRVERT1').AsInteger;
    Fabr2Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ2').AsInteger;
    Fabr2Vert      := ibEtiquetaGrande.FieldByName('FABRVERT2').AsInteger;
    Fabr3Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ3').AsInteger;
    Fabr3Vert      := ibEtiquetaGrande.FieldByName('FABRVERT3').AsInteger;
    Fabr4Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ4').AsInteger;
    Fabr4Vert      := ibEtiquetaGrande.FieldByName('FABRVERT4').AsInteger;
    Fabr5Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ5').AsInteger;
    Fabr5Vert      := ibEtiquetaGrande.FieldByName('FABRVERT5').AsInteger;
    Fabr6Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ6').AsInteger;
    Fabr6Vert      := ibEtiquetaGrande.FieldByName('FABRVERT6').AsInteger;
    Fabr7Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ7').AsInteger;
    Fabr7Vert      := ibEtiquetaGrande.FieldByName('FABRVERT7').AsInteger;
    Fabr8Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ8').AsInteger;
    Fabr8Vert      := ibEtiquetaGrande.FieldByName('FABRVERT8').AsInteger;
    Fabr9Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ9').AsInteger;
    Fabr9Vert      := ibEtiquetaGrande.FieldByName('FABRVERT9').AsInteger;
    Fabr10Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ10').AsInteger;
    Fabr10Vert      := ibEtiquetaGrande.FieldByName('FABRVERT10').AsInteger;
    Fabr11Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ11').AsInteger;
    Fabr11Vert      := ibEtiquetaGrande.FieldByName('FABRVERT11').AsInteger;
    Fabr12Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ12').AsInteger;
    Fabr12Vert      := ibEtiquetaGrande.FieldByName('FABRVERT12').AsInteger;
    Fabr13Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ13').AsInteger;
    Fabr13Vert      := ibEtiquetaGrande.FieldByName('FABRVERT13').AsInteger;
    Fabr14Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ14').AsInteger;
    Fabr14Vert      := ibEtiquetaGrande.FieldByName('FABRVERT14').AsInteger;
    Fabr15Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ15').AsInteger;
    Fabr15Vert      := ibEtiquetaGrande.FieldByName('FABRVERT15').AsInteger;
    Fabr16Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ16').AsInteger;
    Fabr16Vert      := ibEtiquetaGrande.FieldByName('FABRVERT16').AsInteger;
    Fabr17Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ17').AsInteger;
    Fabr17Vert      := ibEtiquetaGrande.FieldByName('FABRVERT17').AsInteger;
    Fabr18Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ18').AsInteger;
    Fabr18Vert      := ibEtiquetaGrande.FieldByName('FABRVERT18').AsInteger;
    Fabr19Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ19').AsInteger;
    Fabr19Vert      := ibEtiquetaGrande.FieldByName('FABRVERT19').AsInteger;
    Fabr20Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ20').AsInteger;
    Fabr20Vert      := ibEtiquetaGrande.FieldByName('FABRVERT20').AsInteger;
    Fabr21Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ21').AsInteger;
    Fabr21Vert      := ibEtiquetaGrande.FieldByName('FABRVERT21').AsInteger;
    Fabr22Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ22').AsInteger;
    Fabr22Vert      := ibEtiquetaGrande.FieldByName('FABRVERT22').AsInteger;
    Fabr23Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ23').AsInteger;
    Fabr23Vert      := ibEtiquetaGrande.FieldByName('FABRVERT23').AsInteger;
    Fabr24Horiz     := ibEtiquetaGrande.FieldByName('FABRHORIZ24').AsInteger;
    Fabr24Vert      := ibEtiquetaGrande.FieldByName('FABRVERT24').AsInteger;

    Unid1Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ1').AsInteger;
    Unid1Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT1').AsInteger;
    Unid2Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ2').AsInteger;
    Unid2Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT2').AsInteger;
    Unid3Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ3').AsInteger;
    Unid3Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT3').AsInteger;
    Unid4Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ4').AsInteger;
    Unid4Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT4').AsInteger;
    Unid5Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ5').AsInteger;
    Unid5Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT5').AsInteger;
    Unid6Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ6').AsInteger;
    Unid6Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT6').AsInteger;
    Unid7Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ7').AsInteger;
    Unid7Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT7').AsInteger;
    Unid8Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ8').AsInteger;
    Unid8Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT8').AsInteger;
    Unid9Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ9').AsInteger;
    Unid9Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT9').AsInteger;
    Unid10Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ10').AsInteger;
    Unid10Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT10').AsInteger;
    Unid11Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ11').AsInteger;
    Unid11Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT11').AsInteger;
    Unid12Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ12').AsInteger;
    Unid12Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT12').AsInteger;
    Unid13Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ13').AsInteger;
    Unid13Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT13').AsInteger;
    Unid14Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ14').AsInteger;
    Unid14Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT14').AsInteger;
    Unid15Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ15').AsInteger;
    Unid15Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT15').AsInteger;
    Unid16Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ16').AsInteger;
    Unid16Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT16').AsInteger;
    Unid17Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ17').AsInteger;
    Unid17Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT17').AsInteger;
    Unid18Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ18').AsInteger;
    Unid18Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT18').AsInteger;
    Unid19Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ19').AsInteger;
    Unid19Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT19').AsInteger;
    Unid20Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ20').AsInteger;
    Unid20Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT20').AsInteger;
    Unid21Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ21').AsInteger;
    Unid21Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT21').AsInteger;
    Unid22Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ22').AsInteger;
    Unid22Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT22').AsInteger;
    Unid23Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ23').AsInteger;
    Unid23Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT23').AsInteger;
    Unid24Horiz     := ibEtiquetaGrande.FieldByName('UNIDHORIZ24').AsInteger;
    Unid24Vert      := ibEtiquetaGrande.FieldByName('UNIDVERT24').AsInteger;


  IndiceHorizontal := Printer.PageWidth / 960;
  IndiceVertical := Printer.PageHeight / 792;
  Printer.BeginDoc;

  with Printer.Canvas do begin

    Prod1Horiz      := Round(Et1Horiz * IndiceHorizontal);
    Prod1Vert       := Round(Et1Vert * IndiceVertical);
    VlrProd1Horiz   := Round(Vlr1Horiz * IndiceHorizontal);
    VlrProd1Vert    := Round(Vlr1Vert * IndiceVertical);
    Prod2Horiz      := Round(Et2Horiz * IndiceHorizontal);
    Prod2Vert       := Round(Et2Vert * IndiceVertical);
    VlrProd2Horiz   := Round(Vlr2Horiz * IndiceHorizontal);
    VlrProd2Vert    := Round(Vlr2Vert * IndiceVertical);
    Prod3Horiz      := Round(Et3Horiz * IndiceHorizontal);
    Prod3Vert       := Round(Et3Vert * IndiceVertical);
    VlrProd3Horiz   := Round(Vlr3Horiz * IndiceHorizontal);
    VlrProd3Vert    := Round(Vlr3Vert * IndiceVertical);
    Prod4Horiz      := Round(Et4Horiz * IndiceHorizontal);
    Prod4Vert       := Round(Et4Vert * IndiceVertical);
    VlrProd4Horiz   := Round(Vlr4Horiz * IndiceHorizontal);
    VlrProd4Vert    := Round(Vlr4Vert * IndiceVertical);
    Prod5Horiz      := Round(Et5Horiz * IndiceHorizontal);
    Prod5Vert       := Round(Et5Vert * IndiceVertical);
    VlrProd5Horiz   := Round(Vlr5Horiz * IndiceHorizontal);
    VlrProd5Vert    := Round(Vlr5Vert * IndiceVertical);
    Prod6Horiz      := Round(Et6Horiz * IndiceHorizontal);
    Prod6Vert       := Round(Et6Vert * IndiceVertical);
    VlrProd6Horiz   := Round(Vlr6Horiz * IndiceHorizontal);
    VlrProd6Vert    := Round(Vlr6Vert * IndiceVertical);
    Prod7Horiz      := Round(Et7Horiz * IndiceHorizontal);
    Prod7Vert       := Round(Et7Vert * IndiceVertical);
    VlrProd7Horiz   := Round(Vlr7Horiz * IndiceHorizontal);
    VlrProd7Vert    := Round(Vlr7Vert * IndiceVertical);
    Prod8Horiz      := Round(Et8Horiz * IndiceHorizontal);
    Prod8Vert       := Round(Et8Vert * IndiceVertical);
    VlrProd8Horiz   := Round(Vlr8Horiz * IndiceHorizontal);
    VlrProd8Vert    := Round(Vlr8Vert * IndiceVertical);
    Prod9Horiz      := Round(Et9Horiz * IndiceHorizontal);
    Prod9Vert       := Round(Et9Vert * IndiceVertical);
    VlrProd9Horiz   := Round(Vlr9Horiz * IndiceHorizontal);
    VlrProd9Vert    := Round(Vlr9Vert * IndiceVertical);
    Prod10Horiz     := Round(Et10Horiz * IndiceHorizontal);
    Prod10Vert      := Round(Et10Vert * IndiceVertical);
    VlrProd10Horiz  := Round(Vlr10Horiz * IndiceHorizontal);
    VlrProd10Vert   := Round(Vlr10Vert * IndiceVertical);
    Prod11Horiz     := Round(Et11Horiz * IndiceHorizontal);
    Prod11Vert      := Round(Et11Vert * IndiceVertical);
    VlrProd11Horiz  := Round(Vlr11Horiz * IndiceHorizontal);
    VlrProd11Vert   := Round(Vlr11Vert * IndiceVertical);
    Prod12Horiz     := Round(Et12Horiz * IndiceHorizontal);
    Prod12Vert      := Round(Et12Vert * IndiceVertical);
    VlrProd12Horiz  := Round(Vlr12Horiz * IndiceHorizontal);
    VlrProd12Vert   := Round(Vlr12Vert * IndiceVertical);
    Prod13Horiz     := Round(Et13Horiz * IndiceHorizontal);
    Prod13Vert      := Round(Et13Vert * IndiceVertical);
    VlrProd13Horiz  := Round(Vlr13Horiz * IndiceHorizontal);
    VlrProd13Vert   := Round(Vlr13Vert * IndiceVertical);
    Prod14Horiz     := Round(Et14Horiz * IndiceHorizontal);
    Prod14Vert      := Round(Et14Vert * IndiceVertical);
    VlrProd14Horiz  := Round(Vlr14Horiz * IndiceHorizontal);
    VlrProd14Vert   := Round(Vlr14Vert * IndiceVertical);
    Prod15Horiz     := Round(Et15Horiz * IndiceHorizontal);
    Prod15Vert      := Round(Et15Vert * IndiceVertical);
    VlrProd15Horiz  := Round(Vlr15Horiz * IndiceHorizontal);
    VlrProd15Vert   := Round(Vlr15Vert * IndiceVertical);
    Prod16Horiz     := Round(Et16Horiz * IndiceHorizontal);
    Prod16Vert      := Round(Et16Vert * IndiceVertical);
    VlrProd16Horiz  := Round(Vlr16Horiz * IndiceHorizontal);
    VlrProd16Vert   := Round(Vlr16Vert * IndiceVertical);
    Prod17Horiz     := Round(Et17Horiz * IndiceHorizontal);
    Prod17Vert      := Round(Et17Vert * IndiceVertical);
    VlrProd17Horiz  := Round(Vlr17Horiz * IndiceHorizontal);
    VlrProd17Vert   := Round(Vlr17Vert * IndiceVertical);
    Prod18Horiz     := Round(Et18Horiz * IndiceHorizontal);
    Prod18Vert      := Round(Et18Vert * IndiceVertical);
    VlrProd18Horiz  := Round(Vlr18Horiz * IndiceHorizontal);
    VlrProd18Vert   := Round(Vlr18Vert * IndiceVertical);
    Prod19Horiz     := Round(Et19Horiz * IndiceHorizontal);
    Prod19Vert      := Round(Et19Vert * IndiceVertical);
    VlrProd19Horiz  := Round(Vlr19Horiz * IndiceHorizontal);
    VlrProd19Vert   := Round(Vlr19Vert * IndiceVertical);
    Prod20Horiz     := Round(Et20Horiz * IndiceHorizontal);
    Prod20Vert      := Round(Et20Vert * IndiceVertical);
    VlrProd20Horiz  := Round(Vlr20Horiz * IndiceHorizontal);
    VlrProd20Vert   := Round(Vlr20Vert * IndiceVertical);
    Prod21Horiz     := Round(Et21Horiz * IndiceHorizontal);
    Prod21Vert      := Round(Et21Vert * IndiceVertical);
    VlrProd21Horiz  := Round(Vlr21Horiz * IndiceHorizontal);
    VlrProd21Vert   := Round(Vlr21Vert * IndiceVertical);
    Prod22Horiz     := Round(Et22Horiz * IndiceHorizontal);
    Prod22Vert      := Round(Et22Vert * IndiceVertical);
    VlrProd22Horiz  := Round(Vlr22Horiz * IndiceHorizontal);
    VlrProd22Vert   := Round(Vlr22Vert * IndiceVertical);
    Prod23Horiz     := Round(Et23Horiz * IndiceHorizontal);
    Prod23Vert      := Round(Et23Vert * IndiceVertical);
    VlrProd23Horiz  := Round(Vlr23Horiz * IndiceHorizontal);
    VlrProd23Vert   := Round(Vlr23Vert * IndiceVertical);
    Prod24Horiz     := Round(Et24Horiz * IndiceHorizontal);
    Prod24Vert      := Round(Et24Vert * IndiceVertical);
    VlrProd24Horiz  := Round(Vlr24Horiz * IndiceHorizontal);
    VlrProd24Vert   := Round(Vlr24Vert * IndiceVertical);

    R1Horiz         := Round(Ref1Horiz * IndiceHorizontal);
    R1Vert          := Round(Ref1Vert * IndiceVertical);
    R2Horiz         := Round(Ref2Horiz * IndiceHorizontal);
    R2Vert          := Round(Ref2Vert * IndiceVertical);
    R3Horiz         := Round(Ref3Horiz * IndiceHorizontal);
    R3Vert          := Round(Ref3Vert * IndiceVertical);
    R4Horiz         := Round(Ref4Horiz * IndiceHorizontal);
    R4Vert          := Round(Ref4Vert * IndiceVertical);
    R5Horiz         := Round(Ref5Horiz * IndiceHorizontal);
    R5Vert          := Round(Ref5Vert * IndiceVertical);
    R6Horiz         := Round(Ref6Horiz * IndiceHorizontal);
    R6Vert          := Round(Ref6Vert * IndiceVertical);
    R7Horiz         := Round(Ref7Horiz * IndiceHorizontal);
    R7Vert          := Round(Ref7Vert * IndiceVertical);
    R8Horiz         := Round(Ref8Horiz * IndiceHorizontal);
    R8Vert          := Round(Ref8Vert * IndiceVertical);
    R9Horiz         := Round(Ref9Horiz * IndiceHorizontal);
    R9Vert          := Round(Ref9Vert * IndiceVertical);
    R10Horiz        := Round(Ref10Horiz * IndiceHorizontal);
    R10Vert         := Round(Ref10Vert * IndiceVertical);
    R11Horiz        := Round(Ref11Horiz * IndiceHorizontal);
    R11Vert         := Round(Ref11Vert * IndiceVertical);
    R12Horiz        := Round(Ref12Horiz * IndiceHorizontal);
    R12Vert         := Round(Ref12Vert * IndiceVertical);
    R13Horiz        := Round(Ref13Horiz * IndiceHorizontal);
    R13Vert         := Round(Ref13Vert * IndiceVertical);
    R14Horiz        := Round(Ref14Horiz * IndiceHorizontal);
    R14Vert         := Round(Ref14Vert * IndiceVertical);
    R15Horiz        := Round(Ref15Horiz * IndiceHorizontal);
    R15Vert         := Round(Ref15Vert * IndiceVertical);
    R16Horiz        := Round(Ref16Horiz * IndiceHorizontal);
    R16Vert         := Round(Ref16Vert * IndiceVertical);
    R17Horiz        := Round(Ref17Horiz * IndiceHorizontal);
    R17Vert         := Round(Ref17Vert * IndiceVertical);
    R18Horiz        := Round(Ref18Horiz * IndiceHorizontal);
    R18Vert         := Round(Ref18Vert * IndiceVertical);
    R19Horiz        := Round(Ref19Horiz * IndiceHorizontal);
    R19Vert         := Round(Ref19Vert * IndiceVertical);
    R20Horiz        := Round(Ref20Horiz * IndiceHorizontal);
    R20Vert         := Round(Ref20Vert * IndiceVertical);
    R21Horiz        := Round(Ref21Horiz * IndiceHorizontal);
    R21Vert         := Round(Ref21Vert * IndiceVertical);
    R22Horiz        := Round(Ref22Horiz * IndiceHorizontal);
    R22Vert         := Round(Ref22Vert * IndiceVertical);
    R23Horiz        := Round(Ref23Horiz * IndiceHorizontal);
    R23Vert         := Round(Ref23Vert * IndiceVertical);
    R24Horiz        := Round(Ref24Horiz * IndiceHorizontal);
    R24Vert         := Round(Ref24Vert * IndiceVertical);

    Cod1Horiz     := Round(CodInt1Horiz * IndiceHorizontal);
    Cod1Vert      := Round(CodInt1Vert * IndiceVertical);
    Cod2Horiz     := Round(CodInt2Horiz * IndiceHorizontal);
    Cod2Vert      := Round(CodInt2Vert * IndiceVertical);
    Cod3Horiz     := Round(CodInt3Horiz * IndiceHorizontal);
    Cod3Vert      := Round(CodInt3Vert * IndiceVertical);
    Cod4Horiz     := Round(CodInt4Horiz * IndiceHorizontal);
    Cod4Vert      := Round(CodInt4Vert * IndiceVertical);
    Cod5Horiz     := Round(CodInt5Horiz * IndiceHorizontal);
    Cod5Vert      := Round(CodInt5Vert * IndiceVertical);
    Cod6Horiz     := Round(CodInt6Horiz * IndiceHorizontal);
    Cod6Vert      := Round(CodInt6Vert * IndiceVertical);
    Cod7Horiz     := Round(CodInt7Horiz * IndiceHorizontal);
    Cod7Vert      := Round(CodInt7Vert * IndiceVertical);
    Cod8Horiz     := Round(CodInt8Horiz * IndiceHorizontal);
    Cod8Vert      := Round(CodInt8Vert * IndiceVertical);
    Cod9Horiz     := Round(CodInt9Horiz * IndiceHorizontal);
    Cod9Vert      := Round(CodInt9Vert * IndiceVertical);
    Cod10Horiz    := Round(CodInt10Horiz * IndiceHorizontal);
    Cod10Vert     := Round(CodInt10Vert * IndiceVertical);
    Cod11Horiz    := Round(CodInt11Horiz * IndiceHorizontal);
    Cod11Vert     := Round(CodInt11Vert * IndiceVertical);
    Cod12Horiz    := Round(CodInt12Horiz * IndiceHorizontal);
    Cod12Vert     := Round(CodInt12Vert * IndiceVertical);
    Cod13Horiz    := Round(CodInt13Horiz * IndiceHorizontal);
    Cod13Vert     := Round(CodInt13Vert * IndiceVertical);
    Cod14Horiz    := Round(CodInt14Horiz * IndiceHorizontal);
    Cod14Vert     := Round(CodInt14Vert * IndiceVertical);
    Cod15Horiz    := Round(CodInt15Horiz * IndiceHorizontal);
    Cod15Vert     := Round(CodInt15Vert * IndiceVertical);
    Cod16Horiz    := Round(CodInt16Horiz * IndiceHorizontal);
    Cod16Vert     := Round(CodInt16Vert * IndiceVertical);
    Cod17Horiz    := Round(CodInt17Horiz * IndiceHorizontal);
    Cod17Vert     := Round(CodInt17Vert * IndiceVertical);
    Cod18Horiz    := Round(CodInt18Horiz * IndiceHorizontal);
    Cod18Vert     := Round(CodInt18Vert * IndiceVertical);
    Cod19Horiz    := Round(CodInt19Horiz * IndiceHorizontal);
    Cod19Vert     := Round(CodInt19Vert * IndiceVertical);
    Cod20Horiz    := Round(CodInt20Horiz * IndiceHorizontal);
    Cod20Vert     := Round(CodInt20Vert * IndiceVertical);
    Cod21Horiz    := Round(CodInt21Horiz * IndiceHorizontal);
    Cod21Vert     := Round(CodInt21Vert * IndiceVertical);
    Cod22Horiz    := Round(CodInt22Horiz * IndiceHorizontal);
    Cod22Vert     := Round(CodInt22Vert * IndiceVertical);
    Cod23Horiz    := Round(CodInt23Horiz * IndiceHorizontal);
    Cod23Vert     := Round(CodInt23Vert * IndiceVertical);
    Cod24Horiz    := Round(CodInt24Horiz * IndiceHorizontal);
    Cod24Vert     := Round(CodInt24Vert * IndiceVertical);

    F1Horiz       := Round(Fabr1Horiz * IndiceHorizontal);
    F1Vert        := Round(Fabr1Vert * IndiceVertical);
    F2Horiz       := Round(Fabr2Horiz * IndiceHorizontal);
    F2Vert        := Round(Fabr2Vert * IndiceVertical);
    F3Horiz       := Round(Fabr3Horiz * IndiceHorizontal);
    F3Vert        := Round(Fabr3Vert * IndiceVertical);
    F4Horiz       := Round(Fabr4Horiz * IndiceHorizontal);
    F4Vert        := Round(Fabr4Vert * IndiceVertical);
    F5Horiz       := Round(Fabr5Horiz * IndiceHorizontal);
    F5Vert        := Round(Fabr5Vert * IndiceVertical);
    F6Horiz       := Round(Fabr6Horiz * IndiceHorizontal);
    F6Vert        := Round(Fabr6Vert * IndiceVertical);
    F7Horiz       := Round(Fabr7Horiz * IndiceHorizontal);
    F7Vert        := Round(Fabr7Vert * IndiceVertical);
    F8Horiz       := Round(Fabr8Horiz * IndiceHorizontal);
    F8Vert        := Round(Fabr8Vert * IndiceVertical);
    F9Horiz       := Round(Fabr9Horiz * IndiceHorizontal);
    F9Vert        := Round(Fabr9Vert * IndiceVertical);
    F10Horiz      := Round(Fabr10Horiz * IndiceHorizontal);
    F10Vert       := Round(Fabr10Vert * IndiceVertical);
    F11Horiz      := Round(Fabr11Horiz * IndiceHorizontal);
    F11Vert       := Round(Fabr11Vert * IndiceVertical);
    F12Horiz      := Round(Fabr12Horiz * IndiceHorizontal);
    F12Vert       := Round(Fabr12Vert * IndiceVertical);
    F13Horiz      := Round(Fabr13Horiz * IndiceHorizontal);
    F13Vert       := Round(Fabr13Vert * IndiceVertical);
    F14Horiz      := Round(Fabr14Horiz * IndiceHorizontal);
    F14Vert       := Round(Fabr14Vert * IndiceVertical);
    F15Horiz      := Round(Fabr15Horiz * IndiceHorizontal);
    F15Vert       := Round(Fabr15Vert * IndiceVertical);
    F16Horiz      := Round(Fabr16Horiz * IndiceHorizontal);
    F16Vert       := Round(Fabr16Vert * IndiceVertical);
    F17Horiz      := Round(Fabr17Horiz * IndiceHorizontal);
    F17Vert       := Round(Fabr17Vert * IndiceVertical);
    F18Horiz      := Round(Fabr18Horiz * IndiceHorizontal);
    F18Vert       := Round(Fabr18Vert * IndiceVertical);
    F19Horiz      := Round(Fabr19Horiz * IndiceHorizontal);
    F19Vert       := Round(Fabr19Vert * IndiceVertical);
    F20Horiz      := Round(Fabr20Horiz * IndiceHorizontal);
    F20Vert       := Round(Fabr20Vert * IndiceVertical);
    F21Horiz      := Round(Fabr21Horiz * IndiceHorizontal);
    F21Vert       := Round(Fabr21Vert * IndiceVertical);
    F22Horiz      := Round(Fabr22Horiz * IndiceHorizontal);
    F22Vert       := Round(Fabr22Vert * IndiceVertical);
    F23Horiz      := Round(Fabr23Horiz * IndiceHorizontal);
    F23Vert       := Round(Fabr23Vert * IndiceVertical);
    F24Horiz      := Round(Fabr24Horiz * IndiceHorizontal);
    F24Vert       := Round(Fabr24Vert * IndiceVertical);

    U1Horiz       := Round(Unid1Horiz * IndiceHorizontal);
    U1Vert        := Round(Unid1Vert * IndiceVertical);
    U2Horiz       := Round(Unid2Horiz * IndiceHorizontal);
    U2Vert        := Round(Unid2Vert * IndiceVertical);
    U3Horiz       := Round(Unid3Horiz * IndiceHorizontal);
    U3Vert        := Round(Unid3Vert * IndiceVertical);
    U4Horiz       := Round(Unid4Horiz * IndiceHorizontal);
    U4Vert        := Round(Unid4Vert * IndiceVertical);
    U5Horiz       := Round(Unid5Horiz * IndiceHorizontal);
    U5Vert        := Round(Unid5Vert * IndiceVertical);
    U6Horiz       := Round(Unid6Horiz * IndiceHorizontal);
    U6Vert        := Round(Unid6Vert * IndiceVertical);
    U7Horiz       := Round(Unid7Horiz * IndiceHorizontal);
    U7Vert        := Round(Unid7Vert * IndiceVertical);
    U8Horiz       := Round(Unid8Horiz * IndiceHorizontal);
    U8Vert        := Round(Unid8Vert * IndiceVertical);
    U9Horiz       := Round(Unid9Horiz * IndiceHorizontal);
    U9Vert        := Round(Unid9Vert * IndiceVertical);
    U10Horiz      := Round(Unid10Horiz * IndiceHorizontal);
    U10Vert       := Round(Unid10Vert * IndiceVertical);
    U11Horiz      := Round(Unid11Horiz * IndiceHorizontal);
    U11Vert       := Round(Unid11Vert * IndiceVertical);
    U12Horiz      := Round(Unid12Horiz * IndiceHorizontal);
    U12Vert       := Round(Unid12Vert * IndiceVertical);
    U13Horiz      := Round(Unid13Horiz * IndiceHorizontal);
    U13Vert       := Round(Unid13Vert * IndiceVertical);
    U14Horiz      := Round(Unid14Horiz * IndiceHorizontal);
    U14Vert       := Round(Unid14Vert * IndiceVertical);
    U15Horiz      := Round(Unid15Horiz * IndiceHorizontal);
    U15Vert       := Round(Unid15Vert * IndiceVertical);
    U16Horiz      := Round(Unid16Horiz * IndiceHorizontal);
    U16Vert       := Round(Unid16Vert * IndiceVertical);
    U17Horiz      := Round(Unid17Horiz * IndiceHorizontal);
    U17Vert       := Round(Unid17Vert * IndiceVertical);
    U18Horiz      := Round(Unid18Horiz * IndiceHorizontal);
    U18Vert       := Round(Unid18Vert * IndiceVertical);
    U19Horiz      := Round(Unid19Horiz * IndiceHorizontal);
    U19Vert       := Round(Unid19Vert * IndiceVertical);
    U20Horiz      := Round(Unid20Horiz * IndiceHorizontal);
    U20Vert       := Round(Unid20Vert * IndiceVertical);
    U21Horiz      := Round(Unid21Horiz * IndiceHorizontal);
    U21Vert       := Round(Unid21Vert * IndiceVertical);
    U22Horiz      := Round(Unid22Horiz * IndiceHorizontal);
    U22Vert       := Round(Unid22Vert * IndiceVertical);
    U23Horiz      := Round(Unid23Horiz * IndiceHorizontal);
    U23Vert       := Round(Unid23Vert * IndiceVertical);
    U24Horiz      := Round(Unid24Horiz * IndiceHorizontal);
    U24Vert       := Round(Unid24Vert * IndiceVertical);

    while not ibEtiquetaGr.Eof do begin

    if ibEtiquetaGr.FieldByName('ETIQUETA1').AsString = 'Sim' Then begin

      TextOut(Prod1Horiz,Prod1Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd1Horiz,VlrProd1Vert,('R$ ') +FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF1HORIZ').AsString > '0' Then begin
      TextOut(Ref1Horiz,Ref1Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ1').AsInteger > 0 Then begin
      TextOut(CodInt1Horiz,CodInt1Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ1').AsString > '0' Then begin
      TextOut(Fabr1Horiz,Fabr1Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ1').AsString > '0' Then begin
      TextOut(Unid1Horiz,Unid1Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;
////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA2').AsString = 'Sim' Then begin

      TextOut(Prod2Horiz,Prod2Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd2Horiz,VlrProd2Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF2HORIZ').AsString > '0' Then begin
      TextOut(Ref2Horiz,Ref2Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ2').AsString > '0' Then begin
      TextOut(CodInt2Horiz,CodInt2Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ2').AsString > '0' Then begin
      TextOut(Fabr2Horiz,Fabr2Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ2').AsString > '0' Then begin
      TextOut(Unid2Horiz,Unid2Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA3').AsString = 'Sim' Then begin

      TextOut(Prod3Horiz,Prod3Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd3Horiz,VlrProd3Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF3HORIZ').AsString > '0' Then begin
      TextOut(Ref3Horiz,Ref3Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ3').AsString > '0' Then begin
      TextOut(CodInt3Horiz,CodInt3Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ3').AsString > '0' Then begin
      TextOut(Fabr3Horiz,Fabr3Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ3').AsString > '0' Then begin
      TextOut(Unid3Horiz,Unid3Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA4').AsString = 'Sim' Then begin

      TextOut(Prod4Horiz,Prod4Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd4Horiz,VlrProd4Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF4HORIZ').AsString > '0' Then begin
      TextOut(Ref4Horiz,Ref4Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ4').AsString > '0' Then begin
      TextOut(CodInt4Horiz,CodInt4Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ4').AsString > '0' Then begin
      TextOut(Fabr4Horiz,Fabr4Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ4').AsString > '0' Then begin
      TextOut(Unid4Horiz,Unid4Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA5').AsString = 'Sim' Then begin

      TextOut(Prod5Horiz,Prod5Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd5Horiz,VlrProd5Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF5HORIZ').AsString > '0' Then begin
      TextOut(Ref5Horiz,Ref5Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ5').AsString > '0' Then begin
      TextOut(CodInt5Horiz,CodInt5Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ5').AsString > '0' Then begin
      TextOut(Fabr5Horiz,Fabr5Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ5').AsString > '0' Then begin
      TextOut(Unid5Horiz,Unid5Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA6').AsString = 'Sim' Then begin

      TextOut(Prod6Horiz,Prod6Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd6Horiz,VlrProd6Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF6HORIZ').AsString > '0' Then begin
      TextOut(Ref6Horiz,Ref6Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ6').AsString > '0' Then begin
      TextOut(CodInt6Horiz,CodInt6Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ6').AsString > '0' Then begin
      TextOut(Fabr6Horiz,Fabr6Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ6').AsString > '0' Then begin
      TextOut(Unid6Horiz,Unid6Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA7').AsString = 'Sim' Then begin

      TextOut(Prod7Horiz,Prod7Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd7Horiz,VlrProd7Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF7HORIZ').AsString > '0' Then begin
      TextOut(Ref7Horiz,Ref7Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ7').AsString > '0' Then begin
      TextOut(CodInt7Horiz,CodInt7Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ7').AsString > '0' Then begin
      TextOut(Fabr7Horiz,Fabr7Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ7').AsString > '0' Then begin
      TextOut(Unid7Horiz,Unid7Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA8').AsString = 'Sim' Then begin

      TextOut(Prod8Horiz,Prod8Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd8Horiz,VlrProd8Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF8HORIZ').AsString > '0' Then begin
      TextOut(Ref8Horiz,Ref8Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ8').AsString > '0' Then begin
      TextOut(CodInt8Horiz,CodInt8Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ8').AsString > '0' Then begin
      TextOut(Fabr8Horiz,Fabr8Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ8').AsString > '0' Then begin
      TextOut(Unid8Horiz,Unid8Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA9').AsString = 'Sim' Then begin

      TextOut(Prod9Horiz,Prod9Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd9Horiz,VlrProd9Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF9HORIZ').AsString > '0' Then begin
      TextOut(Ref9Horiz,Ref9Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ9').AsString > '0' Then begin
      TextOut(CodInt9Horiz,CodInt9Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ9').AsString > '0' Then begin
      TextOut(Fabr9Horiz,Fabr9Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ9').AsString > '0' Then begin
      TextOut(Unid9Horiz,Unid9Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA10').AsString = 'Sim' Then begin

      TextOut(Prod10Horiz,Prod10Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd10Horiz,VlrProd10Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF10HORIZ').AsString > '0' Then begin
      TextOut(Ref10Horiz,Ref10Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ10').AsString > '0' Then begin
      TextOut(CodInt10Horiz,CodInt10Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ10').AsString > '0' Then begin
      TextOut(Fabr10Horiz,Fabr10Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ10').AsString > '0' Then begin
      TextOut(Unid10Horiz,Unid10Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA11').AsString = 'Sim' Then begin

      TextOut(Prod11Horiz,Prod11Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd11Horiz,VlrProd11Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF11HORIZ').AsString > '0' Then begin
      TextOut(Ref11Horiz,Ref11Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ11').AsString > '0' Then begin
      TextOut(CodInt11Horiz,CodInt11Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ11').AsString > '0' Then begin
      TextOut(Fabr11Horiz,Fabr11Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ11').AsString > '0' Then begin
      TextOut(Unid11Horiz,Unid11Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA12').AsString = 'Sim' Then begin

      TextOut(Prod12Horiz,Prod12Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd12Horiz,VlrProd12Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF12HORIZ').AsString > '0' Then begin
      TextOut(Ref12Horiz,Ref12Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ12').AsString > '0' Then begin
      TextOut(CodInt12Horiz,CodInt12Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ12').AsString > '0' Then begin
      TextOut(Fabr12Horiz,Fabr12Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ12').AsString > '0' Then begin
      TextOut(Unid12Horiz,Unid12Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA13').AsString = 'Sim' Then begin

      TextOut(Prod13Horiz,Prod13Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd13Horiz,VlrProd13Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF13HORIZ').AsString > '0' Then begin
      TextOut(Ref13Horiz,Ref13Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ13').AsString > '0' Then begin
      TextOut(CodInt13Horiz,CodInt13Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ13').AsString > '0' Then begin
      TextOut(Fabr13Horiz,Fabr13Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ13').AsString > '0' Then begin
      TextOut(Unid13Horiz,Unid13Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA14').AsString = 'Sim' Then begin

      TextOut(Prod14Horiz,Prod14Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd14Horiz,VlrProd14Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF14HORIZ').AsString > '0' Then begin
      TextOut(Ref14Horiz,Ref14Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ14').AsString > '0' Then begin
      TextOut(CodInt14Horiz,CodInt14Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ14').AsString > '0' Then begin
      TextOut(Fabr14Horiz,Fabr14Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ14').AsString > '0' Then begin
      TextOut(Unid14Horiz,Unid14Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA15').AsString = 'Sim' Then begin

      TextOut(Prod15Horiz,Prod15Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd15Horiz,VlrProd15Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF15HORIZ').AsString > '0' Then begin
      TextOut(Ref15Horiz,Ref15Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ15').AsString > '0' Then begin
      TextOut(CodInt15Horiz,CodInt15Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ15').AsString > '0' Then begin
      TextOut(Fabr15Horiz,Fabr15Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ15').AsString > '0' Then begin
      TextOut(Unid15Horiz,Unid15Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA16').AsString = 'Sim' Then begin

      TextOut(Prod16Horiz,Prod16Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd16Horiz,VlrProd16Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF16HORIZ').AsString > '0' Then begin
      TextOut(Ref16Horiz,Ref16Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ16').AsString > '0' Then begin
      TextOut(CodInt16Horiz,CodInt16Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ16').AsString > '0' Then begin
      TextOut(Fabr16Horiz,Fabr16Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ16').AsString > '0' Then begin
      TextOut(Unid16Horiz,Unid16Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA17').AsString = 'Sim' Then begin

      TextOut(Prod17Horiz,Prod17Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd17Horiz,VlrProd17Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF17HORIZ').AsString > '0' Then begin
      TextOut(Ref17Horiz,Ref17Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ17').AsString > '0' Then begin
      TextOut(CodInt17Horiz,CodInt17Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ17').AsString > '0' Then begin
      TextOut(Fabr17Horiz,Fabr17Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ17').AsString > '0' Then begin
      TextOut(Unid17Horiz,Unid17Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA18').AsString = 'Sim' Then begin

      TextOut(Prod18Horiz,Prod18Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd18Horiz,VlrProd18Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF18HORIZ').AsString > '0' Then begin
      TextOut(Ref18Horiz,Ref18Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ18').AsString > '0' Then begin
      TextOut(CodInt18Horiz,CodInt18Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ18').AsString > '0' Then begin
      TextOut(Fabr18Horiz,Fabr18Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ18').AsString > '0' Then begin
      TextOut(Unid18Horiz,Unid18Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA19').AsString = 'Sim' Then begin

      TextOut(Prod19Horiz,Prod19Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd19Horiz,VlrProd19Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF19HORIZ').AsString > '0' Then begin
      TextOut(Ref19Horiz,Ref19Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ19').AsString > '0' Then begin
      TextOut(CodInt19Horiz,CodInt19Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ19').AsString > '0' Then begin
      TextOut(Fabr19Horiz,Fabr19Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ19').AsString > '0' Then begin
      TextOut(Unid19Horiz,Unid19Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA20').AsString = 'Sim' Then begin

      TextOut(Prod20Horiz,Prod20Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd20Horiz,VlrProd20Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF20HORIZ').AsString > '0' Then begin
      TextOut(Ref20Horiz,Ref20Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ20').AsString > '0' Then begin
      TextOut(CodInt20Horiz,CodInt20Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ20').AsString > '0' Then begin
      TextOut(Fabr20Horiz,Fabr20Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ20').AsString > '0' Then begin
      TextOut(Unid20Horiz,Unid20Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA21').AsString = 'Sim' Then begin

      TextOut(Prod21Horiz,Prod21Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd21Horiz,VlrProd21Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF21HORIZ').AsString > '0' Then begin
      TextOut(Ref21Horiz,Ref21Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ21').AsString > '0' Then begin
      TextOut(CodInt21Horiz,CodInt21Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ21').AsString > '0' Then begin
      TextOut(Fabr21Horiz,Fabr21Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ21').AsString > '0' Then begin
      TextOut(Unid21Horiz,Unid21Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA22').AsString = 'Sim' Then begin

      TextOut(Prod22Horiz,Prod22Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd22Horiz,VlrProd22Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF22HORIZ').AsString > '0' Then begin
      TextOut(Ref22Horiz,Ref22Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ22').AsString > '0' Then begin
      TextOut(CodInt22Horiz,CodInt22Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ22').AsString > '0' Then begin
      TextOut(Fabr22Horiz,Fabr22Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ22').AsString > '0' Then begin
      TextOut(Unid22Horiz,Unid22Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA23').AsString = 'Sim' Then begin

      TextOut(Prod23Horiz,Prod23Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd23Horiz,VlrProd23Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF23HORIZ').AsString > '0' Then begin
      TextOut(Ref23Horiz,Ref23Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ23').AsString > '0' Then begin
      TextOut(CodInt23Horiz,CodInt23Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ23').AsString > '0' Then begin
      TextOut(Fabr23Horiz,Fabr23Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ23').AsString > '0' Then begin
      TextOut(Unid23Horiz,Unid23Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    if ibEtiquetaGr.FieldByName('ETIQUETA24').AsString = 'Sim' Then begin

      TextOut(Prod24Horiz,Prod24Vert,ibEtiquetaGr.FieldByName('NOMEPROD').AsString);
      TextOut(VlrProd24Horiz,VlrProd24Vert,('R$ ')+FormatFloat(CasasDecimais('Produtos'),ibEtiquetaGr.FieldByName('VLRVENDA').AsFloat));

      if ibEtiquetaGrande.FieldByName('REF24HORIZ').AsString > '0' Then begin
      TextOut(Ref24Horiz,Ref24Vert,('Ref. ') +ibEtiquetaGr.FieldByName('REF').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('CODINTHORIZ24').AsString > '0' Then begin
      TextOut(CodInt24Horiz,CodInt24Vert,('Cod. ')+IntToStr(ibEtiquetaGr.FieldByName('IDPROD').AsInteger));
      end;

      if ibEtiquetaGrande.FieldByName('FABRHORIZ24').AsString > '0' Then begin
      TextOut(Fabr24Horiz,Fabr24Vert,('Fabr. ') +ibEtiquetaGr.FieldByName('MARCA').AsString);
      end;

      if ibEtiquetaGrande.FieldByName('UNIDHORIZ24').AsString > '0' Then begin
      TextOut(Unid24Horiz,Unid24Vert,('Tipo ') +ibEtiquetaGr.FieldByName('NOMEUNIDVENDA').AsString);
      end;

    end;

////////////////////////////////////////////////////////////////////////////////

    ibEtiquetaGr.Next;

    end;//while

    Printer.EndDoc;

  end;//with printer

  end;//with

end;

procedure TfrmConfigEtiquetaGr.FormShow(Sender: TObject);
begin

  pcConfigEtiqueta.ActivePageIndex := 0;
  with dmModule do begin

    ExecSELECTConfigEtiqueta;
    
  end;//with

end;

procedure TfrmConfigEtiquetaGr.ibeaGravarConfigClick(Sender: TObject);
begin

  with dmModule do begin

    GravarConfig;
    Application.MessageBox('Configuração Efetuada!!','Configuração de Etiquetas',+MB_OK+MB_DEFBUTTON1+MB_ICONINFORMATION);
    ExecSELECTConfigEtiqueta;

  end;//with

end;

end.
