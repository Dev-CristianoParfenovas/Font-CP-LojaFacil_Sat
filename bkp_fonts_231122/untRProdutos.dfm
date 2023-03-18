object frmRProdutos: TfrmRProdutos
  Left = 213
  Top = 286
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Produtos'
  ClientHeight = 190
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_edtPorLetra: TLabeledEdit
    Left = 24
    Top = 112
    Width = 121
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'Por Letra()'
    TabOrder = 0
    OnChange = lbl_edtPorLetraChange
  end
  object ckGeral: TCheckBox
    Left = 40
    Top = 24
    Width = 46
    Height = 17
    Caption = 'Geral'
    TabOrder = 1
  end
  object ckImprimirCod: TCheckBox
    Left = 40
    Top = 41
    Width = 46
    Height = 17
    Caption = 'Geral'
    TabOrder = 2
  end
  object ckImprimirRef: TCheckBox
    Left = 41
    Top = 59
    Width = 46
    Height = 17
    Caption = 'Geral'
    TabOrder = 3
  end
end
