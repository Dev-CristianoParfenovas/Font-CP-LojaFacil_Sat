object frmPimaco6089Variada: TfrmPimaco6089Variada
  Left = 107
  Top = 132
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Etiquetas modelo 6089'
  ClientHeight = 532
  ClientWidth = 648
  Color = clWhite
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
  object lbl_VctoLote: TLabel
    Left = 8
    Top = 48
    Width = 49
    Height = 13
    Caption = 'Vcto. Lote'
  end
  object dbgProdutos: TDBGrid
    Left = 8
    Top = 384
    Width = 561
    Height = 145
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
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 91
    Width = 561
    Height = 289
    Caption = 'Imprime a Etiqueta de acordo com o n'#250'mero clicado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
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
      Left = 7
      Top = 46
      Width = 94
      Height = 17
      Caption = 'Etiqueta n'#186' 6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object ckEtiqueta7: TCheckBox
      Left = 118
      Top = 46
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
      Left = 227
      Top = 46
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
      Left = 336
      Top = 46
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
      Left = 447
      Top = 46
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
      Left = 7
      Top = 89
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 16'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object ckEtiqueta11: TCheckBox
      Left = 7
      Top = 67
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 11'
      TabOrder = 11
    end
    object ckEtiqueta17: TCheckBox
      Left = 118
      Top = 89
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 17'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
    end
    object ckEtiqueta12: TCheckBox
      Left = 118
      Top = 67
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 12'
      TabOrder = 13
    end
    object ckEtiqueta18: TCheckBox
      Left = 227
      Top = 89
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 18'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object ckEtiqueta13: TCheckBox
      Left = 227
      Top = 67
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 13'
      TabOrder = 15
    end
    object ckEtiqueta19: TCheckBox
      Left = 336
      Top = 89
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
      Left = 336
      Top = 67
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 14'
      TabOrder = 17
    end
    object ckEtiqueta20: TCheckBox
      Left = 447
      Top = 89
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
      Left = 447
      Top = 67
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 15'
      TabOrder = 19
    end
    object ckEtiqueta26: TCheckBox
      Left = 7
      Top = 132
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 26'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
    end
    object ckEtiqueta21: TCheckBox
      Left = 7
      Top = 110
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 21'
      TabOrder = 21
    end
    object ckEtiqueta27: TCheckBox
      Left = 118
      Top = 132
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 27'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 22
    end
    object ckEtiqueta22: TCheckBox
      Left = 118
      Top = 110
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 22'
      TabOrder = 23
    end
    object ckEtiqueta28: TCheckBox
      Left = 227
      Top = 132
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 28'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
    end
    object ckEtiqueta23: TCheckBox
      Left = 227
      Top = 110
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 23'
      TabOrder = 25
    end
    object ckEtiqueta29: TCheckBox
      Left = 336
      Top = 132
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 29'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 26
    end
    object ckEtiqueta24: TCheckBox
      Left = 336
      Top = 110
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 24'
      TabOrder = 27
    end
    object ckEtiqueta30: TCheckBox
      Left = 447
      Top = 132
      Width = 107
      Height = 17
      Caption = 'Etiqueta n'#186' 30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 28
    end
    object ckEtiqueta25: TCheckBox
      Left = 447
      Top = 110
      Width = 107
      Height = 17
      Caption = 'Etiqueta n'#186' 25'
      TabOrder = 29
    end
    object ckEtiqueta46: TCheckBox
      Left = 7
      Top = 222
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 46'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 30
    end
    object ckEtiqueta47: TCheckBox
      Left = 118
      Top = 222
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 47'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 31
    end
    object ckEtiqueta41: TCheckBox
      Left = 7
      Top = 198
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 41'
      TabOrder = 32
    end
    object ckEtiqueta42: TCheckBox
      Left = 118
      Top = 198
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 42'
      TabOrder = 33
    end
    object ckEtiqueta48: TCheckBox
      Left = 227
      Top = 222
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 48'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 34
    end
    object ckEtiqueta43: TCheckBox
      Left = 227
      Top = 198
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 43'
      TabOrder = 35
    end
    object ckEtiqueta49: TCheckBox
      Left = 336
      Top = 222
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 49'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 36
    end
    object ckEtiqueta44: TCheckBox
      Left = 336
      Top = 198
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 44'
      TabOrder = 37
    end
    object ckEtiqueta50: TCheckBox
      Left = 447
      Top = 222
      Width = 107
      Height = 17
      Caption = 'Etiqueta n'#186' 50'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 38
    end
    object ckEtiqueta45: TCheckBox
      Left = 447
      Top = 198
      Width = 107
      Height = 17
      Caption = 'Etiqueta n'#186' 45'
      TabOrder = 39
    end
    object ckEtiqueta36: TCheckBox
      Left = 7
      Top = 176
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 36'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 40
    end
    object ckEtiqueta31: TCheckBox
      Left = 7
      Top = 152
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 31'
      TabOrder = 41
    end
    object ckEtiqueta37: TCheckBox
      Left = 118
      Top = 176
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 37'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 42
    end
    object ckEtiqueta32: TCheckBox
      Left = 118
      Top = 152
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 32'
      TabOrder = 43
    end
    object ckEtiqueta38: TCheckBox
      Left = 227
      Top = 176
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 38'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 44
    end
    object ckEtiqueta33: TCheckBox
      Left = 227
      Top = 152
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 33'
      TabOrder = 45
    end
    object ckEtiqueta39: TCheckBox
      Left = 336
      Top = 176
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 39'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 46
    end
    object ckEtiqueta34: TCheckBox
      Left = 336
      Top = 152
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 34'
      TabOrder = 47
    end
    object ckEtiqueta40: TCheckBox
      Left = 447
      Top = 176
      Width = 107
      Height = 17
      Caption = 'Etiqueta n'#186' 40'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 48
    end
    object ckEtiqueta35: TCheckBox
      Left = 447
      Top = 152
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 35'
      TabOrder = 49
    end
    object ckEtiqueta56: TCheckBox
      Left = 7
      Top = 267
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 56'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 50
    end
    object ckEtiqueta51: TCheckBox
      Left = 7
      Top = 243
      Width = 106
      Height = 17
      Caption = 'Etiqueta n'#186' 51'
      TabOrder = 51
    end
    object ckEtiqueta57: TCheckBox
      Left = 118
      Top = 267
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 57'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 52
    end
    object ckEtiqueta52: TCheckBox
      Left = 118
      Top = 243
      Width = 105
      Height = 17
      Caption = 'Etiqueta n'#186' 52'
      TabOrder = 53
    end
    object ckEtiqueta58: TCheckBox
      Left = 227
      Top = 267
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 58'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 54
    end
    object ckEtiqueta53: TCheckBox
      Left = 227
      Top = 243
      Width = 104
      Height = 17
      Caption = 'Etiqueta n'#186' 53'
      TabOrder = 55
    end
    object ckEtiqueta59: TCheckBox
      Left = 336
      Top = 267
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 59'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 56
    end
    object ckEtiqueta54: TCheckBox
      Left = 336
      Top = 243
      Width = 103
      Height = 17
      Caption = 'Etiqueta n'#186' 54'
      TabOrder = 57
    end
    object ckEtiqueta60: TCheckBox
      Left = 447
      Top = 267
      Width = 107
      Height = 17
      Caption = 'Etiqueta n'#186' 60'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 58
    end
    object ckEtiqueta55: TCheckBox
      Left = 447
      Top = 243
      Width = 107
      Height = 17
      Caption = 'Etiqueta n'#186' 55'
      TabOrder = 59
    end
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
  object lbl_edtCodBarras: TLabeledEdit
    Left = 8
    Top = 21
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd.Barras'
    TabOrder = 3
    OnChange = lbl_edtCodBarrasChange
    OnExit = lbl_edtCodBarrasExit
    OnKeyPress = lbl_edtCodBarrasKeyPress
  end
  object lbl_edtRef: TLabeledEdit
    Left = 102
    Top = 21
    Width = 91
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Ref.'
    TabOrder = 4
    OnExit = lbl_edtRefExit
    OnKeyPress = lbl_edtRefKeyPress
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
    TabOrder = 5
  end
  object dtpVctoLote: TDateTimePicker
    Left = 8
    Top = 61
    Width = 92
    Height = 21
    Date = 42436.000000000000000000
    Time = 0.920104525459464600
    TabOrder = 6
  end
end
