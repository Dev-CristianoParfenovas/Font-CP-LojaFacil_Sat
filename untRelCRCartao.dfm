object frmRelCRCartao: TfrmRelCRCartao
  Left = 167
  Top = 191
  BorderIcons = [biSystemMenu]
  Caption = 'Contas a Receber por Cart'#227'o'
  ClientHeight = 135
  ClientWidth = 455
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
  object lbl_Cartao: TLabel
    Left = 272
    Top = 16
    Width = 85
    Height = 13
    Caption = 'Tipo de Cart'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_De: TLabel
    Left = 8
    Top = 16
    Width = 21
    Height = 13
    Caption = 'De:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Ate: TLabel
    Left = 112
    Top = 16
    Width = 24
    Height = 13
    Caption = 'At'#233':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cboCartao: TComboBox
    Left = 272
    Top = 32
    Width = 185
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 0
  end
  object dtpDataIni: TDateTimePicker
    Left = 7
    Top = 32
    Width = 92
    Height = 21
    Date = 42436.000000000000000000
    Time = 0.977824432869965700
    TabOrder = 1
  end
  object dtpDataF: TDateTimePicker
    Left = 107
    Top = 32
    Width = 92
    Height = 21
    Date = 42436.000000000000000000
    Time = 0.977824432869965700
    TabOrder = 2
  end
  object ckGeral: TCheckBox
    Left = 40
    Top = 8
    Width = 97
    Height = 17
    Caption = 'ckGeral'
    TabOrder = 3
  end
end
