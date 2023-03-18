object frmCRGeralP: TfrmCRGeralP
  Left = 118
  Top = 125
  BorderIcons = [biSystemMenu]
  Caption = 'Contas a Receber Geral por Per'#237'odo'
  ClientHeight = 102
  ClientWidth = 394
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
  object lbl_De: TLabel
    Left = 16
    Top = 24
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
    Left = 120
    Top = 24
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
  object dtpDataIni: TDateTimePicker
    Left = 17
    Top = 40
    Width = 93
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.447937638891744400
    TabOrder = 0
  end
  object dtpDataF: TDateTimePicker
    Left = 116
    Top = 40
    Width = 93
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.447937638891744400
    TabOrder = 1
  end
end
