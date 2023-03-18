object frmPedCompraP: TfrmPedCompraP
  Left = 59
  Top = 117
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pedido de Compras Efetuadas por Per'#237'odo'
  ClientHeight = 123
  ClientWidth = 299
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
  object lbl_DtIni: TLabel
    Left = 10
    Top = 9
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
  object lbl_DtF: TLabel
    Left = 114
    Top = 9
    Width = 63
    Height = 13
    Caption = 'Data Final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeaSair: TBmsXPButton
    Left = 216
    Top = 3
    Width = 80
    Height = 21
    Caption = '&Sair'
    Layout = tlTop
    WordWrap = False
    ShowAccelChar = True
    TabOrder = 0
    OnClick = ibeaSairClick
  end
  object ibeaVisualizar: TBmsXPButton
    Left = 124
    Top = 54
    Width = 80
    Height = 21
    Caption = '&Visualizar'
    Layout = tlTop
    WordWrap = False
    ShowAccelChar = True
    TabOrder = 1
    OnClick = ibeaVisualizarClick
  end
  object dtpDataIni: TmxFlatDateTimePicker
    Left = 8
    Top = 24
    Width = 93
    Height = 21
    CalAlignment = dtaLeft
    Date = 39513.922251088
    Time = 39513.922251088
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    Activate = False
    BorderColor = clGradientInactiveCaption
    Flat = True
    ShowBorder = True
    Version = '1.26'
  end
  object dtpDataF: TmxFlatDateTimePicker
    Left = 112
    Top = 24
    Width = 93
    Height = 21
    CalAlignment = dtaLeft
    Date = 39513.9222760069
    Time = 39513.9222760069
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    Activate = False
    BorderColor = clGradientInactiveCaption
    Flat = True
    ShowBorder = True
    Version = '1.26'
  end
end
