object frmVendasFunc: TfrmVendasFunc
  Left = 253
  Top = 205
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Vendas por Vendedor'
  ClientHeight = 236
  ClientWidth = 371
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
  object Label1: TLabel
    Left = 7
    Top = 33
    Width = 70
    Height = 13
    Caption = 'Data Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 99
    Top = 33
    Width = 59
    Height = 13
    Caption = 'DataFinal:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_Func: TLabel
    Left = 205
    Top = 33
    Width = 127
    Height = 13
    Caption = 'Funcion'#225'rio/Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeaVisualizar: TSpeedButton
    Left = 80
    Top = 152
    Width = 73
    Height = 25
    Caption = '&Visualizar'
    OnClick = ibeaVisualizarClick
  end
  object ibeaSair: TSpeedButton
    Left = 168
    Top = 152
    Width = 73
    Height = 25
    Caption = '&Sair'
    OnClick = ibeaSairClick
  end
  object cboFuncionario: TComboBox
    Left = 202
    Top = 53
    Width = 172
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 0
  end
  object dtpDataIniGeral: TDateTimePicker
    Left = 8
    Top = 53
    Width = 92
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.852005381952039900
    TabOrder = 1
  end
  object dtpDataFimGeral: TDateTimePicker
    Left = 104
    Top = 53
    Width = 92
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.852005381952039900
    TabOrder = 2
  end
end
