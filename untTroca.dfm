object frmTrocaMercadoria: TfrmTrocaMercadoria
  Left = 198
  Top = 48
  BorderIcons = [biSystemMenu]
  Caption = 'Troca de Mercadoria'
  ClientHeight = 398
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_ProdD: TLabel
    Left = 8
    Top = 43
    Width = 146
    Height = 20
    Caption = 'Produto Devolvido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lbl_Vendedor: TLabel
    Left = 13
    Top = 4
    Width = 55
    Height = 13
    Caption = 'Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_ObsTroca: TLabel
    Left = 201
    Top = 4
    Width = 27
    Height = 13
    Caption = 'Obs:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_F1: TLabel
    Left = 16
    Top = 271
    Width = 99
    Height = 16
    Caption = 'F1 - Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_F4: TLabel
    Left = 16
    Top = 343
    Width = 93
    Height = 16
    Caption = 'F4 - Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_F2: TLabel
    Left = 16
    Top = 293
    Width = 59
    Height = 16
    Caption = 'F2 - Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 317
    Width = 140
    Height = 16
    Caption = 'F3 - Imprimir Cr'#233'dito'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 371
    Width = 252
    Height = 16
    Caption = 'F5 - Lan'#231'a Cr'#233'dito de troca no Caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeaSair: TSpeedButton
    Left = 528
    Top = 4
    Width = 65
    Height = 22
    Caption = '&Sair'
    OnClick = ibeaSairClick
  end
  object lbl_edtCodBarraTroca: TLabeledEdit
    Left = 8
    Top = 81
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd.Barras'
    MaxLength = 13
    TabOrder = 0
    OnChange = lbl_edtCodBarraTrocaChange
    OnKeyPress = lbl_edtCodBarraTrocaKeyPress
  end
  object lbl_edtNomeProdTroca: TLabeledEdit
    Left = 178
    Top = 81
    Width = 200
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 2
  end
  object lbl_edtVlrVendaTroca: TLabeledEdit
    Left = 384
    Top = 81
    Width = 66
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'Vlr. de Venda'
    TabOrder = 3
  end
  object lbl_edtQtde: TLabeledEdit
    Left = 458
    Top = 81
    Width = 32
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde.'
    TabOrder = 4
    Text = '1'
    OnExit = lbl_edtQtdeExit
    OnKeyPress = lbl_edtQtdeKeyPress
  end
  object dbgEstoque: TDBGrid
    Left = 9
    Top = 109
    Width = 531
    Height = 110
    Cursor = crHandPoint
    BorderStyle = bsNone
    DataSource = dmModule.dtsEntrProdEstoque
    FixedColor = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
  end
  object lbl_edtCodProdTroca: TLabeledEdit
    Left = 546
    Top = 81
    Width = 32
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd.'
    TabOrder = 6
  end
  object lbl_edtTotalDevolvido: TLabeledEdit
    Left = 497
    Top = 81
    Width = 45
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Total'
    TabOrder = 5
    Text = '0,00'
    OnExit = lbl_edtTotalDevolvidoExit
    OnKeyPress = lbl_edtTotalDevolvidoKeyPress
  end
  object lbl_edtRefTroca: TLabeledEdit
    Left = 101
    Top = 81
    Width = 73
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Ref.'
    TabOrder = 1
    OnExit = lbl_edtRefTrocaExit
    OnKeyPress = lbl_edtRefTrocaKeyPress
  end
  object cboFunc: TComboBox
    Left = 11
    Top = 19
    Width = 182
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnKeyPress = cboFuncKeyPress
  end
  object memoObsTroca: TMemo
    Left = 201
    Top = 18
    Width = 312
    Height = 38
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '')
    MaxLength = 100
    ParentFont = False
    TabOrder = 9
  end
  object lbl_edtCodBarras: TLabeledEdit
    Left = 8
    Top = 241
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd.Barras'
    MaxLength = 13
    TabOrder = 10
  end
  object lbl_edtRef: TLabeledEdit
    Left = 101
    Top = 241
    Width = 73
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Ref.'
    TabOrder = 11
  end
  object lbl_edtDescricao: TLabeledEdit
    Left = 178
    Top = 241
    Width = 200
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 12
  end
  object lbl_edtVlrVenda: TLabeledEdit
    Left = 384
    Top = 241
    Width = 66
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'Vlr. de Venda'
    TabOrder = 13
  end
  object lbl_edtQtdeProd: TLabeledEdit
    Left = 458
    Top = 241
    Width = 32
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde.'
    TabOrder = 14
    Text = '1'
    OnExit = lbl_edtQtdeExit
    OnKeyPress = lbl_edtQtdeKeyPress
  end
  object lbl_edtTotal: TLabeledEdit
    Left = 497
    Top = 241
    Width = 45
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Total'
    TabOrder = 15
    Text = '0,00'
  end
  object lbl_edtIDProd: TLabeledEdit
    Left = 546
    Top = 241
    Width = 32
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd.'
    TabOrder = 16
  end
end
