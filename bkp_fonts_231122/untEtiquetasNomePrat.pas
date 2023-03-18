unit untEtiquetasNomePrat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BmsXPButton, StdCtrls, ExtCtrls;

type
  TfrmEtiquetasNomePrat = class(TForm)
    btSair: TBmsXPButton;
    btVisualizar: TBmsXPButton;
    lbl_edtNome1: TLabeledEdit;
    lbl_edtVlr1: TLabeledEdit;
    lbl_edtCompl1: TLabeledEdit;
    lbl_edtNome2: TLabeledEdit;
    lbl_edtCompl2: TLabeledEdit;
    lbl_edtVlr2: TLabeledEdit;
    lbl_edtNome3: TLabeledEdit;
    lbl_edtCompl3: TLabeledEdit;
    lbl_edtVlr3: TLabeledEdit;
    lbl_edtNome4: TLabeledEdit;
    lbl_edtCompl4: TLabeledEdit;
    lbl_edtVlr4: TLabeledEdit;
    lbl_edtNome5: TLabeledEdit;
    lbl_edtCompl5: TLabeledEdit;
    lbl_edtVlr5: TLabeledEdit;
    lbl_edtNome6: TLabeledEdit;
    lbl_edtCompl6: TLabeledEdit;
    lbl_edtVlr6: TLabeledEdit;
    lbl_edtNome7: TLabeledEdit;
    lbl_edtCompl7: TLabeledEdit;
    lbl_edtVlr7: TLabeledEdit;
    lbl_edtNome8: TLabeledEdit;
    lbl_edtCompl8: TLabeledEdit;
    lbl_edtVlr8: TLabeledEdit;
    lbl_edtNome9: TLabeledEdit;
    lbl_edtCompl9: TLabeledEdit;
    lbl_edtVlr9: TLabeledEdit;
    lbl_edtNome10: TLabeledEdit;
    lbl_edtCompl10: TLabeledEdit;
    lbl_edtVlr10: TLabeledEdit;
    BmsXPButton1: TBmsXPButton;
    Bevel1: TBevel;
    lbl_edtNome11: TLabeledEdit;
    lbl_edtNome12: TLabeledEdit;
    lbl_edtNome13: TLabeledEdit;
    lbl_edtNome14: TLabeledEdit;
    lbl_edtNome15: TLabeledEdit;
    lbl_edtNome16: TLabeledEdit;
    lbl_edtNome17: TLabeledEdit;
    lbl_edtNome18: TLabeledEdit;
    lbl_edtNome19: TLabeledEdit;
    lbl_edtNome20: TLabeledEdit;
    lbl_edtCompl11: TLabeledEdit;
    lbl_edtCompl12: TLabeledEdit;
    lbl_edtCompl13: TLabeledEdit;
    lbl_edtCompl14: TLabeledEdit;
    lbl_edtCompl15: TLabeledEdit;
    lbl_edtCompl16: TLabeledEdit;
    lbl_edtCompl17: TLabeledEdit;
    lbl_edtCompl18: TLabeledEdit;
    lbl_edtCompl19: TLabeledEdit;
    lbl_edtCompl20: TLabeledEdit;
    lbl_edtVlr11: TLabeledEdit;
    lbl_edtVlr12: TLabeledEdit;
    lbl_edtVlr13: TLabeledEdit;
    lbl_edtVlr14: TLabeledEdit;
    lbl_edtVlr15: TLabeledEdit;
    lbl_edtVlr16: TLabeledEdit;
    lbl_edtVlr17: TLabeledEdit;
    lbl_edtVlr18: TLabeledEdit;
    lbl_edtVlr19: TLabeledEdit;
    lbl_edtVlr20: TLabeledEdit;
    procedure btVisualizarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure BmsXPButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEtiquetasNomePrat: TfrmEtiquetasNomePrat;

implementation

uses untdmModule, untREtiquetasNome, uBuscaProdutos;

{$R *.dfm}

procedure TfrmEtiquetasNomePrat.btVisualizarClick(Sender: TObject);
begin

  with dmModule do begin

      Application.CreateForm(TfrmEtiquetasNome, frmEtiquetasNome);

    TRY

      with frmEtiquetasNome do begin

        if lbl_edtNome1.Text <> '' Then begin

          qrl_Nome1.Caption  := lbl_edtNome1.Text;

        end else begin

          qrl_Nome1.Caption  := '';

        end;

        if lbl_edtCompl1.Text <> '' Then begin

          qrl_Inf1.Caption  := lbl_edtCompl1.Text;

        end else begin

          qrl_Inf1.Caption  := '';

        end;

        if lbl_edtVlr1.Text <> '' Then begin

          qrl_Vlr1.Caption  := lbl_edtVlr1.Text;

        end else begin

          qrl_Vlr1.Caption  := '';
          qrl_P1.Caption := '';

        end;

        if lbl_edtNome2.Text <> '' Then begin

          qrl_Nome2.Caption  := lbl_edtNome2.Text;

        end else begin

          qrl_Nome2.Caption  := '';

        end;

        if lbl_edtCompl2.Text <> '' Then begin

          qrl_Inf2.Caption  := lbl_edtCompl2.Text;

        end else begin

          qrl_Inf2.Caption  := '';

        end;

        if lbl_edtVlr2.Text <> '' Then begin

          qrl_Vlr2.Caption  := lbl_edtVlr2.Text;

        end else begin

          qrl_Vlr2.Caption  := '';
          qrl_P2.Caption := '';

        end;

        if lbl_edtNome3.Text <> '' Then begin

          qrl_Nome3.Caption  := lbl_edtNome3.Text;

        end else begin

          qrl_Nome3.Caption  := '';

        end;

        if lbl_edtCompl3.Text <> '' Then begin

          qrl_Inf3.Caption  := lbl_edtCompl3.Text;

        end else begin

          qrl_Inf3.Caption  := '';

        end;

        if lbl_edtVlr3.Text <> '' Then begin

          qrl_Vlr3.Caption  := lbl_edtVlr3.Text;

        end else begin

          qrl_Vlr3.Caption  := '';
          qrl_P3.Caption := '';

        end;

        if lbl_edtNome4.Text <> '' Then begin

          qrl_Nome4.Caption  := lbl_edtNome4.Text;

        end else begin

          qrl_Nome4.Caption  := '';

        end;

        if lbl_edtCompl4.Text <> '' Then begin

          qrl_Inf4.Caption  := lbl_edtCompl4.Text;

        end else begin

          qrl_Inf4.Caption  := '';

        end;

        if lbl_edtVlr4.Text <> '' Then begin

          qrl_Vlr4.Caption  := lbl_edtVlr4.Text;

        end else begin

          qrl_Vlr4.Caption  := '';
          qrl_P4.Caption := '';

        end;

        if lbl_edtNome5.Text <> '' Then begin

          qrl_Nome5.Caption  := lbl_edtNome5.Text;

        end else begin

          qrl_Nome5.Caption  := '';

        end;

        if lbl_edtCompl5.Text <> '' Then begin

          qrl_Inf5.Caption  := lbl_edtCompl5.Text;

        end else begin

          qrl_Inf5.Caption  := '';

        end;

        if lbl_edtVlr5.Text <> '' Then begin

          qrl_Vlr5.Caption  := lbl_edtVlr5.Text;

        end else begin

          qrl_Vlr5.Caption  := '';
          qrl_P5.Caption := '';

        end;

        if lbl_edtNome6.Text <> '' Then begin

          qrl_Nome6.Caption  := lbl_edtNome6.Text;

        end else begin

          qrl_Nome6.Caption  := '';

        end;

        if lbl_edtCompl6.Text <> '' Then begin

          qrl_Inf6.Caption  := lbl_edtCompl6.Text;

        end else begin

          qrl_Inf6.Caption  := '';

        end;

        if lbl_edtVlr6.Text <> '' Then begin

          qrl_Vlr6.Caption  := lbl_edtVlr6.Text;

        end else begin

          qrl_Vlr6.Caption  := '';
          qrl_P6.Caption := '';

        end;

        if lbl_edtNome7.Text <> '' Then begin

          qrl_Nome7.Caption  := lbl_edtNome7.Text;

        end else begin

          qrl_Nome7.Caption  := '';

        end;

        if lbl_edtCompl7.Text <> '' Then begin

          qrl_Inf7.Caption  := lbl_edtCompl7.Text;

        end else begin

          qrl_Inf7.Caption  := '';

        end;

        if lbl_edtVlr7.Text <> '' Then begin

          qrl_Vlr7.Caption  := lbl_edtVlr7.Text;

        end else begin

          qrl_Vlr7.Caption  := '';
          qrl_P7.Caption := '';

        end;

        if lbl_edtNome8.Text <> '' Then begin

          qrl_Nome8.Caption  := lbl_edtNome8.Text;

        end else begin

          qrl_Nome8.Caption  := '';

        end;

        if lbl_edtCompl8.Text <> '' Then begin

          qrl_Inf8.Caption  := lbl_edtCompl8.Text;

        end else begin

          qrl_Inf8.Caption  := '';

        end;

        if lbl_edtVlr8.Text <> '' Then begin

          qrl_Vlr8.Caption  := lbl_edtVlr8.Text;

        end else begin

          qrl_Vlr8.Caption  := '';
          qrl_P8.Caption := '';

        end;

        if lbl_edtNome9.Text <> '' Then begin

          qrl_Nome9.Caption  := lbl_edtNome9.Text;

        end else begin

          qrl_Nome9.Caption  := '';

        end;

        if lbl_edtCompl9.Text <> '' Then begin

          qrl_Inf9.Caption  := lbl_edtCompl9.Text;

        end else begin

          qrl_Inf9.Caption  := '';

        end;

        if lbl_edtVlr9.Text <> '' Then begin

          qrl_Vlr9.Caption  := lbl_edtVlr9.Text;

        end else begin

          qrl_Vlr9.Caption  := '';
          qrl_P9.Caption := '';

        end;

        if lbl_edtNome10.Text <> '' Then begin

          qrl_Nome10.Caption  := lbl_edtNome10.Text;

        end else begin

          qrl_Nome10.Caption  := '';

        end;

        if lbl_edtCompl10.Text <> '' Then begin

          qrl_Inf10.Caption  := lbl_edtCompl10.Text;

        end else begin

          qrl_Inf10.Caption  := '';

        end;

        if lbl_edtVlr10.Text <> '' Then begin

          qrl_Vlr10.Caption  := lbl_edtVlr10.Text;

        end else begin

          qrl_Vlr10.Caption  := '';
          qrl_P10.Caption := '';

        end;


        if lbl_edtNome11.Text <> '' Then begin

          qrl_Nome11.Caption  := lbl_edtNome11.Text;

        end else begin

          qrl_Nome11.Caption  := '';

        end;

        if lbl_edtCompl11.Text <> '' Then begin

          qrl_Inf11.Caption  := lbl_edtCompl11.Text;

        end else begin

          qrl_Inf11.Caption  := '';

        end;

        if lbl_edtVlr11.Text <> '' Then begin

          qrl_Vlr11.Caption  := lbl_edtVlr11.Text;

        end else begin

          qrl_Vlr11.Caption  := '';
          qrl_P11.Caption := '';

        end;

        if lbl_edtNome12.Text <> '' Then begin

          qrl_Nome12.Caption  := lbl_edtNome12.Text;

        end else begin

          qrl_Nome12.Caption  := '';

        end;

        if lbl_edtCompl12.Text <> '' Then begin

          qrl_Inf12.Caption  := lbl_edtCompl12.Text;

        end else begin

          qrl_Inf12.Caption  := '';

        end;

        if lbl_edtVlr12.Text <> '' Then begin

          qrl_Vlr12.Caption  := lbl_edtVlr12.Text;

        end else begin

          qrl_Vlr12.Caption  := '';
          qrl_P12.Caption := '';

        end;

        if lbl_edtNome13.Text <> '' Then begin

          qrl_Nome13.Caption  := lbl_edtNome13.Text;

        end else begin

          qrl_Nome13.Caption  := '';

        end;

        if lbl_edtCompl13.Text <> '' Then begin

          qrl_Inf13.Caption  := lbl_edtCompl13.Text;

        end else begin

          qrl_Inf13.Caption  := '';

        end;

        if lbl_edtVlr13.Text <> '' Then begin

          qrl_Vlr13.Caption  := lbl_edtVlr13.Text;

        end else begin

          qrl_Vlr13.Caption  := '';
          qrl_P13.Caption := '';

        end;

        if lbl_edtNome14.Text <> '' Then begin

          qrl_Nome14.Caption  := lbl_edtNome14.Text;

        end else begin

          qrl_Nome14.Caption  := '';

        end;

        if lbl_edtCompl14.Text <> '' Then begin

          qrl_Inf14.Caption  := lbl_edtCompl14.Text;

        end else begin

          qrl_Inf14.Caption  := '';

        end;

        if lbl_edtVlr14.Text <> '' Then begin

          qrl_Vlr14.Caption  := lbl_edtVlr14.Text;

        end else begin

          qrl_Vlr14.Caption  := '';
          qrl_P14.Caption := '';

        end;

        if lbl_edtNome15.Text <> '' Then begin

          qrl_Nome15.Caption  := lbl_edtNome15.Text;

        end else begin

          qrl_Nome15.Caption  := '';

        end;

        if lbl_edtCompl15.Text <> '' Then begin

          qrl_Inf15.Caption  := lbl_edtCompl15.Text;

        end else begin

          qrl_Inf15.Caption  := '';

        end;

        if lbl_edtVlr15.Text <> '' Then begin

          qrl_Vlr15.Caption  := lbl_edtVlr15.Text;

        end else begin

          qrl_Vlr15.Caption  := '';
          qrl_P15.Caption := '';

        end;

        if lbl_edtNome16.Text <> '' Then begin

          qrl_Nome16.Caption  := lbl_edtNome16.Text;

        end else begin

          qrl_Nome16.Caption  := '';

        end;

        if lbl_edtCompl16.Text <> '' Then begin

          qrl_Inf16.Caption  := lbl_edtCompl16.Text;

        end else begin

          qrl_Inf16.Caption  := '';

        end;

        if lbl_edtVlr16.Text <> '' Then begin

          qrl_Vlr16.Caption  := lbl_edtVlr16.Text;

        end else begin

          qrl_Vlr16.Caption  := '';
          qrl_P16.Caption := '';

        end;

        if lbl_edtNome17.Text <> '' Then begin

          qrl_Nome17.Caption  := lbl_edtNome17.Text;

        end else begin

          qrl_Nome17.Caption  := '';

        end;

        if lbl_edtCompl17.Text <> '' Then begin

          qrl_Inf17.Caption  := lbl_edtCompl17.Text;

        end else begin

          qrl_Inf17.Caption  := '';

        end;

        if lbl_edtVlr17.Text <> '' Then begin

          qrl_Vlr17.Caption  := lbl_edtVlr17.Text;

        end else begin

          qrl_Vlr17.Caption  := '';
          qrl_P17.Caption := '';

        end;

        if lbl_edtNome18.Text <> '' Then begin

          qrl_Nome18.Caption  := lbl_edtNome18.Text;

        end else begin

          qrl_Nome18.Caption  := '';

        end;

        if lbl_edtCompl18.Text <> '' Then begin

          qrl_Inf18.Caption  := lbl_edtCompl18.Text;

        end else begin

          qrl_Inf18.Caption  := '';

        end;

        if lbl_edtVlr18.Text <> '' Then begin

          qrl_Vlr18.Caption  := lbl_edtVlr18.Text;

        end else begin

          qrl_Vlr18.Caption  := '';
          qrl_P18.Caption := '';

        end;

        if lbl_edtNome19.Text <> '' Then begin

          qrl_Nome19.Caption  := lbl_edtNome19.Text;

        end else begin

          qrl_Nome19.Caption  := '';

        end;

        if lbl_edtCompl19.Text <> '' Then begin

          qrl_Inf19.Caption  := lbl_edtCompl19.Text;

        end else begin

          qrl_Inf19.Caption  := '';

        end;

        if lbl_edtVlr19.Text <> '' Then begin

          qrl_Vlr19.Caption  := lbl_edtVlr19.Text;

        end else begin

          qrl_Vlr19.Caption  := '';
          qrl_P19.Caption := '';

        end;

        if lbl_edtNome20.Text <> '' Then begin

          qrl_Nome20.Caption  := lbl_edtNome20.Text;

        end else begin

          qrl_Nome20.Caption  := '';

        end;

        if lbl_edtCompl20.Text <> '' Then begin

          qrl_Inf20.Caption  := lbl_edtCompl20.Text;

        end else begin

          qrl_Inf20.Caption  := '';

        end;

        if lbl_edtVlr20.Text <> '' Then begin

          qrl_Vlr20.Caption  := lbl_edtVlr20.Text;

        end else begin

          qrl_Vlr20.Caption  := '';
          qrl_P20.Caption := '';

        end;

        qrpEtiquetasNome.Preview;

      end; {if}


      EXCEPT
        on E : Exception do begin
           frmEtiquetasNome.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////

  end;{with}

end;

procedure TfrmEtiquetasNomePrat.btSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmEtiquetasNomePrat.BmsXPButton1Click(Sender: TObject);

var
ConfirmaLimparCampos : Integer;

begin

  ConfirmaLimparCampos := Application.MessageBox('Essa opção limpa todos os campos,deseja continuar?','Limpar Campos',+MB_YESNO+MB_DEFBUTTON1+MB_ICONQUESTION);

  if ConfirmaLimparCampos = 6 Then begin

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
    lbl_edtNome13.Clear;
    lbl_edtNome14.Clear;
    lbl_edtNome15.Clear;
    lbl_edtNome16.Clear;
    lbl_edtNome17.Clear;
    lbl_edtNome18.Clear;
    lbl_edtNome19.Clear;
    lbl_edtNome20.Clear;

    lbl_edtCompl1.Clear;
    lbl_edtCompl2.Clear;
    lbl_edtCompl3.Clear;
    lbl_edtCompl4.Clear;
    lbl_edtCompl5.Clear;
    lbl_edtCompl6.Clear;
    lbl_edtCompl7.Clear;
    lbl_edtCompl8.Clear;
    lbl_edtCompl9.Clear;
    lbl_edtCompl10.Clear;
    lbl_edtCompl11.Clear;
    lbl_edtCompl12.Clear;
    lbl_edtCompl13.Clear;
    lbl_edtCompl14.Clear;
    lbl_edtCompl15.Clear;
    lbl_edtCompl16.Clear;
    lbl_edtCompl17.Clear;
    lbl_edtCompl18.Clear;
    lbl_edtCompl19.Clear;
    lbl_edtCompl20.Clear;

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
    lbl_edtVlr13.Clear;
    lbl_edtVlr14.Clear;
    lbl_edtVlr15.Clear;
    lbl_edtVlr16.Clear;
    lbl_edtVlr17.Clear;
    lbl_edtVlr18.Clear;
    lbl_edtVlr19.Clear;
    lbl_edtVlr20.Clear;

  end;//if

end;

procedure TfrmEtiquetasNomePrat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  with dmModule do begin

    case key of

    VK_F7 :begin

          try
             if frmBuscaProdutos = Nil then
                frmBuscaProdutos := TfrmBuscaProdutos.Create(self);
          except
              ShowMessage('Erro na criação do formulário !!');
              exit;
          end;

          frmBuscaProdutos.ShowModal;
          FreeAndNil(frmBuscaProdutos);

    end;

    end;

  end;//with

end;

end.
