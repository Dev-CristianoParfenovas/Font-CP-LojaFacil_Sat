unit untEtiquetasLojaR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmEtiquetasLojaR = class(TForm)
    lbl_edtNome1: TLabeledEdit;
    lbl_edtNome2: TLabeledEdit;
    lbl_edtNome3: TLabeledEdit;
    lbl_edtNome4: TLabeledEdit;
    lbl_edtNome5: TLabeledEdit;
    lbl_edtNome6: TLabeledEdit;
    lbl_edtNome7: TLabeledEdit;
    lbl_edtNome8: TLabeledEdit;
    lbl_edtNome9: TLabeledEdit;
    lbl_edtNome10: TLabeledEdit;
    lbl_edtNome11: TLabeledEdit;
    lbl_edtNome12: TLabeledEdit;
    lbl_edtRef1: TLabeledEdit;
    lbl_edtCod1: TLabeledEdit;
    lbl_edtVlr1: TLabeledEdit;
    lbl_edtRef2: TLabeledEdit;
    lbl_edtRef3: TLabeledEdit;
    lbl_edtRef4: TLabeledEdit;
    lbl_edtRef5: TLabeledEdit;
    lbl_edtRef6: TLabeledEdit;
    lbl_edtRef7: TLabeledEdit;
    lbl_edtRef8: TLabeledEdit;
    lbl_edtRef9: TLabeledEdit;
    lbl_edtRef10: TLabeledEdit;
    lbl_edtRef11: TLabeledEdit;
    lbl_edtRef12: TLabeledEdit;
    lbl_edtCod2: TLabeledEdit;
    lbl_edtCod3: TLabeledEdit;
    lbl_edtCod4: TLabeledEdit;
    lbl_edtCod5: TLabeledEdit;
    lbl_edtCod6: TLabeledEdit;
    lbl_edtCod7: TLabeledEdit;
    lbl_edtCod8: TLabeledEdit;
    lbl_edtCod9: TLabeledEdit;
    lbl_edtCod10: TLabeledEdit;
    lbl_edtCod11: TLabeledEdit;
    lbl_edtCod12: TLabeledEdit;
    lbl_edtVlr2: TLabeledEdit;
    lbl_edtVlr3: TLabeledEdit;
    lbl_edtVlr4: TLabeledEdit;
    lbl_edtVlr5: TLabeledEdit;
    lbl_edtVlr6: TLabeledEdit;
    lbl_edtVlr7: TLabeledEdit;
    lbl_edtVlr8: TLabeledEdit;
    lbl_edtVlr9: TLabeledEdit;
    lbl_edtVlr10: TLabeledEdit;
    lbl_edtVlr11: TLabeledEdit;
    lbl_edtVlr12: TLabeledEdit;
    sbSair: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lbl_edtTam1: TLabeledEdit;
    lbl_edtTam2: TLabeledEdit;
    lbl_edtTam3: TLabeledEdit;
    lbl_edtTam4: TLabeledEdit;
    lbl_edtTam5: TLabeledEdit;
    lbl_edtTam6: TLabeledEdit;
    lbl_edtTam7: TLabeledEdit;
    lbl_edtTam8: TLabeledEdit;
    lbl_edtTam9: TLabeledEdit;
    lbl_edtTam10: TLabeledEdit;
    lbl_edtTam11: TLabeledEdit;
    lbl_edtTam12: TLabeledEdit;
    sbLimparCampos: TSpeedButton;
    procedure sbSairClick(Sender: TObject);
    procedure LimparCampos;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbLimparCamposClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEtiquetasLojaR: TfrmEtiquetasLojaR;

implementation

uses untdmModule, uBuscaProdutos, REtiquetasLoja;

{$R *.dfm}

procedure TfrmEtiquetasLojaR.sbSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmEtiquetasLojaR.LimparCampos;

begin

lbl_edtNome1.Clear;
lbl_edtNome2.Clear;
lbl_edtNome3.Clear;
lbl_edtNome4.Clear;
lbl_edtNome5.Clear;
lbl_edtNome6.Clear;
lbl_edtNome7.Clear;
lbl_edtNome8.Clear;
lbl_edtNome9.Clear;
lbl_edtNome10.Clear;
lbl_edtNome11.Clear;
lbl_edtNome12.Clear;
lbl_edtRef1.Clear;
lbl_edtRef2.Clear;
lbl_edtRef3.Clear;
lbl_edtRef4.Clear;
lbl_edtRef5.Clear;
lbl_edtRef6.Clear;
lbl_edtRef7.Clear;
lbl_edtRef8.Clear;
lbl_edtRef9.Clear;
lbl_edtRef10.Clear;
lbl_edtRef11.Clear;
lbl_edtRef12.Clear;
lbl_edtCod1.Clear;
lbl_edtCod2.Clear;
lbl_edtCod3.Clear;
lbl_edtCod4.Clear;
lbl_edtCod5.Clear;
lbl_edtCod6.Clear;
lbl_edtCod7.Clear;
lbl_edtCod8.Clear;
lbl_edtCod9.Clear;
lbl_edtCod10.Clear;
lbl_edtCod11.Clear;
lbl_edtCod12.Clear;
lbl_edtTam1.Clear;
lbl_edtTam2.Clear;
lbl_edtTam3.Clear;
lbl_edtTam4.Clear;
lbl_edtTam5.Clear;
lbl_edtTam6.Clear;
lbl_edtTam7.Clear;
lbl_edtTam8.Clear;
lbl_edtTam9.Clear;
lbl_edtTam10.Clear;
lbl_edtTam11.Clear;
lbl_edtTam12.Clear;
lbl_edtVlr1.Clear;
lbl_edtVlr2.Clear;
lbl_edtVlr3.Clear;
lbl_edtVlr4.Clear;
lbl_edtVlr5.Clear;
lbl_edtVlr6.Clear;
lbl_edtVlr7.Clear;
lbl_edtVlr8.Clear;
lbl_edtVlr9.Clear;
lbl_edtVlr10.Clear;
lbl_edtVlr11.Clear;
lbl_edtVlr12.Clear;

end;

procedure TfrmEtiquetasLojaR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  with dmModule do begin

    case key of

    VK_F7 :begin

    frmBuscaProdutos.ShowModal;

    end;

    end;

  end;//with
  
end;

procedure TfrmEtiquetasLojaR.SpeedButton1Click(Sender: TObject);
begin

  with dmModule do begin

      Application.CreateForm(TfrmREtiquetasLoja, frmREtiquetasLoja);


      TRY

      with frmREtiquetasLoja do begin

        if lbl_edtNome1.Text <> '' Then begin

          if lbl_edtRef1.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE1.Caption := lbl_edtRef1.Text;

            frmREtiquetasLoja.qrl_RefC1.Caption := lbl_edtRef1.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE1.Caption := '';

            frmREtiquetasLoja.qrl_RefC1.Caption := '';

          end;//ref1

          if lbl_edtCod1.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE1.Caption := lbl_edtCod1.Text;

            frmREtiquetasLoja.qrl_CodC1.Caption := lbl_edtCod1.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE1.Caption := '';

            frmREtiquetasLoja.qrl_CodC1.Caption := '';

          end;//cod1

          if lbl_edtTam1.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE1.Caption := lbl_edtTam1.Text;

            frmREtiquetasLoja.qrl_TamC1.Caption := lbl_edtTam1.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE1.Caption := '';

            frmREtiquetasLoja.qrl_TamC1.Caption := '';

          end;//tam1

          if lbl_edtVlr1.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr1.Caption := lbl_edtVlr1.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr1.Caption := '';

          end;//vlr1

        end;//if nome 1

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome2.Text <> '' Then begin

          if lbl_edtRef2.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE2.Caption := lbl_edtRef2.Text;

            frmREtiquetasLoja.qrl_RefC2.Caption := lbl_edtRef2.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE2.Caption := '';

            frmREtiquetasLoja.qrl_RefC2.Caption := '';

          end;//ref2

          if lbl_edtCod2.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE2.Caption := lbl_edtCod2.Text;

            frmREtiquetasLoja.qrl_CodC2.Caption := lbl_edtCod2.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE2.Caption := '';

            frmREtiquetasLoja.qrl_CodC2.Caption := '';

          end;//cod2

          if lbl_edtTam2.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE2.Caption := lbl_edtTam2.Text;

            frmREtiquetasLoja.qrl_TamC2.Caption := lbl_edtTam2.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE2.Caption := '';

            frmREtiquetasLoja.qrl_TamC2.Caption := '';

          end;//tam2

          if lbl_edtVlr2.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr2.Caption := lbl_edtVlr2.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr2.Caption := '';

          end;//vlr2

        end;//if nome 2

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome3.Text <> '' Then begin

          if lbl_edtRef3.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE3.Caption := lbl_edtRef3.Text;

            frmREtiquetasLoja.qrl_RefC3.Caption := lbl_edtRef3.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE3.Caption := '';

            frmREtiquetasLoja.qrl_RefC3.Caption := '';

          end;//ref3

          if lbl_edtCod3.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE3.Caption := lbl_edtCod3.Text;

            frmREtiquetasLoja.qrl_CodC3.Caption := lbl_edtCod3.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE3.Caption := '';

            frmREtiquetasLoja.qrl_CodC3.Caption := '';

          end;//cod3

          if lbl_edtTam3.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE3.Caption := lbl_edtTam3.Text;

            frmREtiquetasLoja.qrl_TamC3.Caption := lbl_edtTam3.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE3.Caption := '';

            frmREtiquetasLoja.qrl_TamC3.Caption := '';

          end;//tam3

          if lbl_edtVlr3.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr3.Caption := lbl_edtVlr3.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr3.Caption := '';

          end;//vlr3

        end;//if nome 3

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome4.Text <> '' Then begin

          if lbl_edtRef4.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE4.Caption := lbl_edtRef4.Text;

            frmREtiquetasLoja.qrl_RefC4.Caption := lbl_edtRef4.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE4.Caption := '';

            frmREtiquetasLoja.qrl_RefC4.Caption := '';

          end;//ref4

          if lbl_edtCod4.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE4.Caption := lbl_edtCod4.Text;

            frmREtiquetasLoja.qrl_CodC4.Caption := lbl_edtCod4.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE4.Caption := '';

            frmREtiquetasLoja.qrl_CodC4.Caption := '';

          end;//cod4

          if lbl_edtTam4.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE4.Caption := lbl_edtTam4.Text;

            frmREtiquetasLoja.qrl_TamC4.Caption := lbl_edtTam4.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE4.Caption := '';

            frmREtiquetasLoja.qrl_TamC4.Caption := '';

          end;//tam4

          if lbl_edtVlr4.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr4.Caption := lbl_edtVlr4.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr4.Caption := '';

          end;//vlr4

        end;//if nome 4

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome5.Text <> '' Then begin

          if lbl_edtRef5.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE5.Caption := lbl_edtRef5.Text;

            frmREtiquetasLoja.qrl_RefC5.Caption := lbl_edtRef5.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE5.Caption := '';

            frmREtiquetasLoja.qrl_RefC5.Caption := '';

          end;//ref5

          if lbl_edtCod5.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE5.Caption := lbl_edtCod5.Text;

            frmREtiquetasLoja.qrl_CodC5.Caption := lbl_edtCod5.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE5.Caption := '';

            frmREtiquetasLoja.qrl_CodC5.Caption := '';

          end;//cod5

          if lbl_edtTam5.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE5.Caption := lbl_edtTam5.Text;

            frmREtiquetasLoja.qrl_TamC5.Caption := lbl_edtTam5.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE5.Caption := '';

            frmREtiquetasLoja.qrl_TamC5.Caption := '';

          end;//tam5

          if lbl_edtVlr5.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr5.Caption := lbl_edtVlr5.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr5.Caption := '';

          end;//vlr5

        end;//if nome 5

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome6.Text <> '' Then begin

          if lbl_edtRef6.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE6.Caption := lbl_edtRef6.Text;

            frmREtiquetasLoja.qrl_RefC6.Caption := lbl_edtRef6.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE6.Caption := '';

            frmREtiquetasLoja.qrl_RefC6.Caption := '';

          end;//ref6

          if lbl_edtCod6.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE6.Caption := lbl_edtCod6.Text;

            frmREtiquetasLoja.qrl_CodC6.Caption := lbl_edtCod6.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE6.Caption := '';

            frmREtiquetasLoja.qrl_CodC6.Caption := '';

          end;//cod6

          if lbl_edtTam6.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE6.Caption := lbl_edtTam6.Text;

            frmREtiquetasLoja.qrl_TamC6.Caption := lbl_edtTam6.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE6.Caption := '';

            frmREtiquetasLoja.qrl_TamC6.Caption := '';

          end;//tam6

          if lbl_edtVlr6.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr6.Caption := lbl_edtVlr6.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr6.Caption := '';

          end;//vlr6

        end;//if nome 6

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome7.Text <> '' Then begin

          if lbl_edtRef7.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE7.Caption := lbl_edtRef7.Text;

            frmREtiquetasLoja.qrl_RefC7.Caption := lbl_edtRef7.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE7.Caption := '';

            frmREtiquetasLoja.qrl_RefC7.Caption := '';

          end;//ref7

          if lbl_edtCod7.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE7.Caption := lbl_edtCod7.Text;

            frmREtiquetasLoja.qrl_CodC7.Caption := lbl_edtCod7.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE7.Caption := '';

            frmREtiquetasLoja.qrl_CodC7.Caption := '';

          end;//cod7

          if lbl_edtTam7.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE7.Caption := lbl_edtTam7.Text;

            frmREtiquetasLoja.qrl_TamC7.Caption := lbl_edtTam7.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE7.Caption := '';

            frmREtiquetasLoja.qrl_TamC7.Caption := '';

          end;//tam7

          if lbl_edtVlr7.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr7.Caption := lbl_edtVlr7.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr7.Caption := '';

          end;//vlr7

        end;//if nome 7

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome8.Text <> '' Then begin

          if lbl_edtRef8.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE8.Caption := lbl_edtRef8.Text;

            frmREtiquetasLoja.qrl_RefC8.Caption := lbl_edtRef8.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE8.Caption := '';

            frmREtiquetasLoja.qrl_RefC8.Caption := '';

          end;//ref8

          if lbl_edtCod8.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE8.Caption := lbl_edtCod8.Text;

            frmREtiquetasLoja.qrl_CodC8.Caption := lbl_edtCod8.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE8.Caption := '';

            frmREtiquetasLoja.qrl_CodC8.Caption := '';

          end;//cod8

          if lbl_edtTam8.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE8.Caption := lbl_edtTam8.Text;

            frmREtiquetasLoja.qrl_TamC8.Caption := lbl_edtTam8.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE8.Caption := '';

            frmREtiquetasLoja.qrl_TamC8.Caption := '';

          end;//tam8

          if lbl_edtVlr8.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr8.Caption := lbl_edtVlr8.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr8.Caption := '';

          end;//vlr8

        end;//if nome 8

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome9.Text <> '' Then begin

          if lbl_edtRef9.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE9.Caption := lbl_edtRef9.Text;

            frmREtiquetasLoja.qrl_RefC9.Caption := lbl_edtRef9.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE9.Caption := '';

            frmREtiquetasLoja.qrl_RefC9.Caption := '';

          end;//ref9

          if lbl_edtCod9.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE9.Caption := lbl_edtCod9.Text;

            frmREtiquetasLoja.qrl_CodC9.Caption := lbl_edtCod9.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE9.Caption := '';

            frmREtiquetasLoja.qrl_CodC9.Caption := '';

          end;//cod9

          if lbl_edtTam9.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE9.Caption := lbl_edtTam9.Text;

            frmREtiquetasLoja.qrl_TamC9.Caption := lbl_edtTam9.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE9.Caption := '';

            frmREtiquetasLoja.qrl_TamC9.Caption := '';

          end;//tam9

          if lbl_edtVlr9.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr9.Caption := lbl_edtVlr9.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr9.Caption := '';

          end;//vlr9

        end;//if nome 9

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome10.Text <> '' Then begin

          if lbl_edtRef10.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE10.Caption := lbl_edtRef10.Text;

            frmREtiquetasLoja.qrl_RefC10.Caption := lbl_edtRef10.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE10.Caption := '';

            frmREtiquetasLoja.qrl_RefC10.Caption := '';

          end;//ref10

          if lbl_edtCod10.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE10.Caption := lbl_edtCod10.Text;

            frmREtiquetasLoja.qrl_CodC10.Caption := lbl_edtCod10.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE10.Caption := '';

            frmREtiquetasLoja.qrl_CodC10.Caption := '';

          end;//cod10

          if lbl_edtTam10.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE10.Caption := lbl_edtTam10.Text;

            frmREtiquetasLoja.qrl_TamC10.Caption := lbl_edtTam10.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE10.Caption := '';

            frmREtiquetasLoja.qrl_TamC10.Caption := '';

          end;//tam10

          if lbl_edtVlr10.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr10.Caption := lbl_edtVlr10.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr10.Caption := '';

          end;//vlr10

        end;//if nome 10

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome11.Text <> '' Then begin

          if lbl_edtRef11.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE11.Caption := lbl_edtRef11.Text;

            frmREtiquetasLoja.qrl_RefC11.Caption := lbl_edtRef11.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE11.Caption := '';

            frmREtiquetasLoja.qrl_RefC11.Caption := '';

          end;//ref11

          if lbl_edtCod11.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE11.Caption := lbl_edtCod11.Text;

            frmREtiquetasLoja.qrl_CodC11.Caption := lbl_edtCod11.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE11.Caption := '';

            frmREtiquetasLoja.qrl_CodC11.Caption := '';

          end;//cod11

          if lbl_edtTam11.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE11.Caption := lbl_edtTam11.Text;

            frmREtiquetasLoja.qrl_TamC11.Caption := lbl_edtTam11.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE11.Caption := '';

            frmREtiquetasLoja.qrl_TamC11.Caption := '';

          end;//tam11

          if lbl_edtVlr11.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr11.Caption := lbl_edtVlr11.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr11.Caption := '';

          end;//vlr11

        end;//if nome 11

////////////////////////////////////////////////////////////////////////////////

        if lbl_edtNome12.Text <> '' Then begin

          if lbl_edtRef12.Text <> '' Then begin

            frmREtiquetasLoja.qrl_RefE12.Caption := lbl_edtRef12.Text;

            frmREtiquetasLoja.qrl_RefC12.Caption := lbl_edtRef12.Text;

          end else begin

            frmREtiquetasLoja.qrl_RefE12.Caption := '';

            frmREtiquetasLoja.qrl_RefC12.Caption := '';

          end;//ref12

          if lbl_edtCod12.Text <> '' Then begin

            frmREtiquetasLoja.qrl_CodE12.Caption := lbl_edtCod12.Text;

            frmREtiquetasLoja.qrl_CodC12.Caption := lbl_edtCod12.Text;

          end else begin

            frmREtiquetasLoja.qrl_CodE12.Caption := '';

            frmREtiquetasLoja.qrl_CodC12.Caption := '';

          end;//cod12

          if lbl_edtTam12.Text <> '' Then begin

            frmREtiquetasLoja.qrl_TamE12.Caption := lbl_edtTam12.Text;

            frmREtiquetasLoja.qrl_TamC12.Caption := lbl_edtTam12.Text;

          end else begin

            frmREtiquetasLoja.qrl_TamE12.Caption := '';

            frmREtiquetasLoja.qrl_TamC12.Caption := '';

          end;//tam12

          if lbl_edtVlr12.Text <> '' Then begin

            frmREtiquetasLoja.qrl_Vlr12.Caption := lbl_edtVlr12.Text;

          end else begin

            frmREtiquetasLoja.qrl_Vlr12.Caption := '';

          end;//vlr12

        end;//if nome 12

////////////////////////////////////////////////////////////////////////////////
        
        qrpREtiquetasLoja.Preview;

      end; //IF


      EXCEPT
        on E : Exception do begin
           frmREtiquetasLoja.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;

  end;//with

end;

procedure TfrmEtiquetasLojaR.sbLimparCamposClick(Sender: TObject);
begin
LimparCampos;
end;

procedure TfrmEtiquetasLojaR.FormShow(Sender: TObject);
begin
LimparCampos;
end;

end.
