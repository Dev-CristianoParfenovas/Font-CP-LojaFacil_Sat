object frmFluxoPedVenda: TfrmFluxoPedVenda
  Left = 186
  Top = 110
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Fluxo de Pedido de Venda'
  ClientHeight = 341
  ClientWidth = 536
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
  object lbl_DataIni: TLabel
    Left = 5
    Top = 30
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object lbl_DataF: TLabel
    Left = 99
    Top = 30
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object lbl_Vendedor: TLabel
    Left = 197
    Top = 30
    Width = 46
    Height = 13
    Caption = 'Vendedor'
  end
  object lbl_edtTotalDinh: TLabeledEdit
    Left = 24
    Top = 130
    Width = 81
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Dinheiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object lbl_edtCheque: TLabeledEdit
    Left = 112
    Top = 130
    Width = 81
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'Cheque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object lbl_edtChequePre: TLabeledEdit
    Left = 202
    Top = 130
    Width = 81
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Cheque Pr'#233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object lbl_edtDuplicata: TLabeledEdit
    Left = 292
    Top = 130
    Width = 81
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Duplicata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object lbl_edtTotalGeral: TLabeledEdit
    Left = 384
    Top = 130
    Width = 81
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Total Geral'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object lbl_edtComissao: TLabeledEdit
    Left = 344
    Top = 46
    Width = 51
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Comiss'#227'o%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnExit = lbl_edtComissaoExit
    OnKeyPress = lbl_edtComissaoKeyPress
  end
  object lbl_edtTotalAPagar: TLabeledEdit
    Left = 402
    Top = 46
    Width = 64
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'Total a Pagar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object dbgFluxoPed: TDBGrid
    Left = 3
    Top = 168
    Width = 529
    Height = 170
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
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
  end
  object dtpDataIni: TDateTimePicker
    Left = 5
    Top = 46
    Width = 90
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.496093379631929600
    TabOrder = 7
  end
  object dtpDataF: TDateTimePicker
    Left = 101
    Top = 46
    Width = 90
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.496093379631929600
    TabOrder = 9
  end
  object cboVendedor: TComboBox
    Left = 196
    Top = 46
    Width = 145
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvRaised
    TabOrder = 10
    OnChange = cboVendedorChange
  end
end
