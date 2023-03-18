object frmProdDataRegistro: TfrmProdDataRegistro
  Left = 186
  Top = 113
  Width = 414
  Height = 161
  BorderIcons = [biSystemMenu]
  Caption = 'Produtos por Data de Registro'
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
  object lbl_DTIni: TLabel
    Left = 25
    Top = 32
    Width = 66
    Height = 13
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_DTF: TLabel
    Left = 128
    Top = 32
    Width = 59
    Height = 13
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeaVisualizar: TSpeedButton
    Left = 229
    Top = 45
    Width = 73
    Height = 25
    Caption = '&Visualizar'
    OnClick = ibeaVisualizarClick
  end
  object ibeaSair: TSpeedButton
    Left = 312
    Top = 45
    Width = 73
    Height = 25
    Caption = '&Sair'
    OnClick = ibeaSairClick
  end
  object dtpDataIni: TDateTimePicker
    Left = 24
    Top = 48
    Width = 95
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.605647604160000000
    Time = 41550.605647604160000000
    TabOrder = 0
  end
  object dtpDataF: TDateTimePicker
    Left = 128
    Top = 48
    Width = 95
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.605647604160000000
    Time = 41550.605647604160000000
    TabOrder = 1
  end
end
