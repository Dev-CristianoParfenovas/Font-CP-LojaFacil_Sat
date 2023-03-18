object frmVendasFornecedor: TfrmVendasFornecedor
  Left = 134
  Top = 160
  Width = 465
  Height = 175
  Caption = 'Vendas por Fornecedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 60
    Width = 82
    Height = 13
    Caption = 'Fornecedores:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_DTIni: TLabel
    Left = 10
    Top = 18
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
    Left = 107
    Top = 18
    Width = 55
    Height = 13
    Caption = 'DataFinal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeaVisualizar: TSpeedButton
    Left = 255
    Top = 73
    Width = 73
    Height = 25
    Caption = '&Visualizar'
    OnClick = ibeaVisualizarClick
  end
  object ibeaSair: TSpeedButton
    Left = 334
    Top = 73
    Width = 73
    Height = 25
    Caption = '&Sair'
    OnClick = ibeaSairClick
  end
  object dtpDataIni: TDateTimePicker
    Left = 8
    Top = 32
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.609282037040000000
    Time = 41550.609282037040000000
    TabOrder = 0
  end
  object dtpDataF: TDateTimePicker
    Left = 106
    Top = 32
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.609282037040000000
    Time = 41550.609282037040000000
    TabOrder = 1
  end
  object cboFornecedores: TComboBox
    Left = 8
    Top = 75
    Width = 241
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    ItemHeight = 13
    TabOrder = 2
  end
end
