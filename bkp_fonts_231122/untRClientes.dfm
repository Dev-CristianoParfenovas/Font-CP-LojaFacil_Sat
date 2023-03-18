object frmRClientes: TfrmRClientes
  Left = 82
  Top = 99
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Clientes'
  ClientHeight = 193
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
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
    Left = 64
    Top = 40
    Width = 57
    Height = 17
    Caption = 'ckGeral'
    TabOrder = 1
  end
end
