object frmOrdemServico: TfrmOrdemServico
  Left = 125
  Top = 121
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Pedido'
  ClientHeight = 529
  ClientWidth = 784
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
  object lbl_Cli: TLabel
    Left = 8
    Top = 72
    Width = 40
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Por: TLabel
    Left = 256
    Top = 72
    Width = 83
    Height = 13
    Caption = 'Solicitado por:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Prod: TLabel
    Left = 8
    Top = 136
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Qtde: TLabel
    Left = 262
    Top = 136
    Width = 32
    Height = 13
    Caption = 'Qtde.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Vlr: TLabel
    Left = 330
    Top = 136
    Width = 20
    Height = 13
    Caption = 'Vlr.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Total: TLabel
    Left = 429
    Top = 136
    Width = 30
    Height = 13
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Obs: TLabel
    Left = 11
    Top = 184
    Width = 31
    Height = 13
    Caption = 'Obs.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_QtdeItem: TLabel
    Left = 528
    Top = 136
    Width = 64
    Height = 13
    Caption = 'Qtde. Itens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Data: TLabel
    Left = 300
    Top = 9
    Width = 28
    Height = 13
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_TotalServicos: TLabel
    Left = 428
    Top = 185
    Width = 91
    Height = 38
    Caption = 'Total'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lbl_SubTotal: TLabel
    Left = 428
    Top = 233
    Width = 224
    Height = 38
    AutoSize = False
    Caption = '0,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -32
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object dbgContasaReceber: TDBGrid
    Left = 11
    Top = 296
    Width = 763
    Height = 217
    Cursor = crHandPoint
    BorderStyle = bsNone
    FixedColor = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
  end
  object dtpDataPedido: TDateTimePicker
    Left = 299
    Top = 24
    Width = 97
    Height = 21
    Date = 42436.000000000000000000
    Time = 0.992783923611568800
    TabOrder = 6
  end
  object cboCliente: TComboBox
    Left = 8
    Top = 88
    Width = 241
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 0
  end
  object cboProduto: TComboBox
    Left = 9
    Top = 152
    Width = 243
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 1
  end
  object memoObs: TMemo
    Left = 8
    Top = 200
    Width = 409
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object lbl_edtNumeroPed: TLabeledEdit
    Left = 93
    Top = 25
    Width = 94
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Registro'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 3
  end
  object lbl_edtNumeroPedido: TLabeledEdit
    Left = 192
    Top = 25
    Width = 100
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Pedido'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 5
  end
end
