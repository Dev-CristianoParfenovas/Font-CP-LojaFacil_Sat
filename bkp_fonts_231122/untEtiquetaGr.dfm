object frmEtiquetaGr: TfrmEtiquetaGr
  Left = 3
  Top = -2
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Etiqueta'
  ClientHeight = 296
  ClientWidth = 679
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
  object lbl_Produto: TLabel
    Left = 201
    Top = 6
    Width = 37
    Height = 13
    Caption = 'Produto'
  end
  object lbl_edtRef: TLabeledEdit
    Left = 6
    Top = 21
    Width = 91
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Ref.'
    TabOrder = 0
    OnExit = lbl_edtRefExit
    OnKeyPress = lbl_edtRefKeyPress
  end
  object lbl_edtCodBarras: TLabeledEdit
    Left = 105
    Top = 21
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd.Barras'
    TabOrder = 1
    OnChange = lbl_edtCodBarrasChange
    OnKeyPress = lbl_edtCodBarrasKeyPress
  end
  object cboProdutos: TComboBox
    Left = 199
    Top = 21
    Width = 249
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = cboProdutosClick
  end
  object lbl_edtVlrVenda: TLabeledEdit
    Left = 452
    Top = 21
    Width = 71
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor'
    ReadOnly = True
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 52
    Width = 663
    Height = 108
    Caption = 'Imprime a Etiqueta de acordo com o n'#250'mero clicado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object ckEtiqueta1: TCheckBox
      Left = 7
      Top = 24
      Width = 94
      Height = 17
      Caption = 'Etiqueta n'#186' 1'
      TabOrder = 0
    end
    object ckEtiqueta2: TCheckBox
      Left = 118
      Top = 24
      Width = 100
      Height = 17
      Caption = 'Etiqueta n'#186' 2'
      TabOrder = 1
    end
    object ckEtiqueta3: TCheckBox
      Left = 227
      Top = 24
      Width = 101
      Height = 17
      Caption = 'Etiqueta n'#186' 3'
      TabOrder = 2
    end
    object ckEtiqueta4: TCheckBox
      Left = 336
      Top = 24
      Width = 102
      Height = 17
      Caption = 'Etiqueta n'#186' 4'
      TabOrder = 3
    end
    object ckEtiqueta5: TCheckBox
      Left = 447
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Etiqueta n'#186' 5'
      TabOrder = 4
    end
    object ckEtiqueta6: TCheckBox
      Left = 555
      Top = 24
      Width = 94
      Height = 17
      Caption = 'Etiqueta n'#186' 6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object ckEtiqueta7: TCheckBox
      Left = 7
      Top = 44
      Width = 100
      Height = 17
      Caption = 'Etiqueta n'#186' 7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object ckEtiqueta8: TCheckBox
      Left = 118
      Top = 44
      Width = 101
      Height = 17
      Caption = 'Etiqueta n'#186' 8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object ckEtiqueta9: TCheckBox
      Left = 227
      Top = 44
      Width = 102
      Height = 17
      Caption = 'Etiqueta n'#186' 9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object ckEtiqueta10: TCheckBox
      Left = 336
      Top = 44
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object ckEtiqueta16: TCheckBox
      Left = 336
      Top = 63
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 16'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object ckEtiqueta11: TCheckBox
      Left = 447
      Top = 44
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 11'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object ckEtiqueta17: TCheckBox
      Left = 447
      Top = 63
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 17'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
    end
    object ckEtiqueta12: TCheckBox
      Left = 555
      Top = 44
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    object ckEtiqueta18: TCheckBox
      Left = 555
      Top = 63
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 18'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object ckEtiqueta13: TCheckBox
      Left = 7
      Top = 65
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 13'
      TabOrder = 15
    end
    object ckEtiqueta19: TCheckBox
      Left = 7
      Top = 85
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 19'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
    end
    object ckEtiqueta14: TCheckBox
      Left = 118
      Top = 65
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 14'
      TabOrder = 17
    end
    object ckEtiqueta20: TCheckBox
      Left = 118
      Top = 85
      Width = 107
      Height = 17
      Caption = 'Etiqueta n'#186' 20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
    end
    object ckEtiqueta15: TCheckBox
      Left = 227
      Top = 65
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 15'
      TabOrder = 19
    end
    object ckEtiqueta21: TCheckBox
      Left = 227
      Top = 85
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 21'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
    end
    object ckEtiqueta22: TCheckBox
      Left = 336
      Top = 85
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 22'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 21
    end
    object ckEtiqueta23: TCheckBox
      Left = 447
      Top = 85
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 22
    end
    object ckEtiqueta24: TCheckBox
      Left = 555
      Top = 85
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 24'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 23
    end
  end
  object dbgProdutos: TDBGrid
    Left = 8
    Top = 172
    Width = 561
    Height = 114
    Cursor = crHandPoint
    BorderStyle = bsNone
    Color = clInfoBk
    DataSource = dmModule.dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
