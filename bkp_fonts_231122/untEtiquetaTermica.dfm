object frmEtiquetaTermica: TfrmEtiquetaTermica
  Left = 188
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Etiquetas'
  ClientHeight = 158
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_F2: TLabel
    Left = 147
    Top = 104
    Width = 71
    Height = 13
    Caption = 'F2 - IMPRIMIR'
  end
  object lbl_F3: TLabel
    Left = 18
    Top = 6
    Width = 93
    Height = 13
    Caption = 'F3 - Limpar Campos'
  end
  object lbl_F5: TLabel
    Left = 394
    Top = 30
    Width = 39
    Height = 13
    Caption = 'F5 - Sair'
  end
  object cbModelo: TComboBox
    Left = 15
    Top = 28
    Width = 90
    Height = 21
    TabOrder = 0
    Text = 'etqEpl2'
    Items.Strings = (
      'etqNenhuma'
      'etqPpla'
      'etqPPlb'
      'etqZPLII'
      'etqEpl2')
  end
  object lbl_edtCodBarras: TLabeledEdit
    Left = 8
    Top = 64
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd. de Barras'
    TabOrder = 1
    OnChange = lbl_edtCodBarrasChange
    OnKeyPress = lbl_edtCodBarrasKeyPress
  end
  object lbl_edtNomeProd: TLabeledEdit
    Left = 104
    Top = 64
    Width = 265
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 2
  end
  object lbl_edtValor: TLabeledEdit
    Left = 376
    Top = 64
    Width = 81
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor'
    TabOrder = 3
  end
  object lbl_edtQtdeCopias: TLabeledEdit
    Left = 8
    Top = 120
    Width = 121
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde. de C'#243'pias'
    TabOrder = 4
    Text = '1'
  end
  object cbPorta: TComboBox
    Left = 111
    Top = 28
    Width = 90
    Height = 21
    TabOrder = 5
    Text = 'LPT1'
    Items.Strings = (
      'LPT1'
      'LPT2'
      'LPT3'
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5')
  end
  object lbl_edtAvanco: TLabeledEdit
    Left = 232
    Top = 120
    Width = 121
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde. de C'#243'pias'
    TabOrder = 6
    Text = '600'
    Visible = False
  end
  object ACBrETQ1: TACBrETQ
    Porta = 'LPT1'
    Ativo = False
    Left = 216
    Top = 16
  end
end
