object frmBuscaProdutos: TfrmBuscaProdutos
  Left = 128
  Top = 83
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busca de Produtos'
  ClientHeight = 424
  ClientWidth = 731
  Color = clWhite
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
  object sb_ord_nome: TSpeedButton
    Left = 73
    Top = 10
    Width = 129
    Height = 22
    Cursor = crHandPoint
    Hint = 'Ordenar por Nome'
    Caption = 'Ordenar por Nomes'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333FFF33FFFFF33333300033000
      00333337773377777333333330333300033333337FF33777F333333330733300
      0333333377FFF777F33333333700000073333333777777773333333333033000
      3333333337FF777F333333333307300033333333377F777F3333333333703007
      33333333377F7773333333333330000333333333337777F33333333333300003
      33333333337777F3333333333337007333333333337777333333333333330033
      3333333333377333333333333333033333333333333733333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sb_ord_nomeClick
  end
  object Bevel1: TBevel
    Left = 8
    Top = 336
    Width = 711
    Height = 3
  end
  object sbLimpar: TSpeedButton
    Left = 209
    Top = 10
    Width = 129
    Height = 22
    Cursor = crHandPoint
    Hint = 'Ordenar por Nome'
    Caption = 'Limpar Campos'
    Flat = True
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbLimparClick
  end
  object Image2: TImage
    Left = 545
    Top = 98
    Width = 12
    Height = 9
    AutoSize = True
    Picture.Data = {
      07544269746D61707A010000424D7A0100000000000036000000280000000C00
      000009000000010018000000000044010000120B0000120B0000000000000000
      0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
      C0000000C0C0C0000000C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0}
    Transparent = True
  end
  object lbl_Info: TLabel
    Left = 565
    Top = 96
    Width = 149
    Height = 13
    Caption = 'Exibe detalhes do produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Forn: TLabel
    Left = 20
    Top = 47
    Width = 78
    Height = 13
    Caption = 'Fornecedores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_F3: TLabel
    Left = 10
    Top = 406
    Width = 239
    Height = 13
    Caption = 'F3 - Para Selecionar um Produto na grade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_F2: TLabel
    Left = 659
    Top = 31
    Width = 49
    Height = 13
    Caption = 'F2 - Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeaIncluir: TSpeedButton
    Left = 642
    Top = 60
    Width = 43
    Height = 27
    Caption = 'Incluir'
    OnClick = ibeaIncluirClick
  end
  object ibeaSair: TSpeedButton
    Left = 658
    Top = 4
    Width = 51
    Height = 27
    Caption = 'Sair'
    OnClick = ibeaSairClick
  end
  object dbgProd: TDBGrid
    Left = 16
    Top = 97
    Width = 529
    Height = 215
    Cursor = crHandPoint
    Hint = 'Clique no Cliente para selecionar'
    DataSource = dmModule.dtsProdutos
    DragCursor = crHandPoint
    FixedColor = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgProdCellClick
    OnDrawColumnCell = dbgProdDrawColumnCell
    OnKeyDown = dbgProdKeyDown
    OnKeyPress = dbgProdKeyPress
    OnKeyUp = dbgProdKeyUp
  end
  object lbl_edtIDProd: TLabeledEdit
    Left = 7
    Top = 16
    Width = 57
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 3
    EditLabel.Height = 13
    EditLabel.Caption = '.'
    TabOrder = 1
    Visible = False
  end
  object lbl_edtCodBarrasAd: TLabeledEdit
    Left = 127
    Top = 63
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'Cod.Barras - F4'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 2
    OnChange = lbl_edtCodBarrasAdChange
    OnKeyPress = lbl_edtCodBarrasAdKeyPress
  end
  object lbl_edtCodInterno: TLabeledEdit
    Left = 221
    Top = 63
    Width = 58
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Ref.'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 3
    OnExit = lbl_edtCodInternoExit
    OnKeyPress = lbl_edtCodInternoKeyPress
  end
  object lbl_edtValor: TLabeledEdit
    Left = 283
    Top = 63
    Width = 58
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 4
    OnChange = lbl_edtValorChange
    OnKeyPress = lbl_edtValorKeyPress
  end
  object lbl_edtNome: TLabeledEdit
    Left = 346
    Top = 63
    Width = 184
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 133
    EditLabel.Height = 13
    EditLabel.Caption = 'Primeira Letra ou Nome'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 5
    OnChange = lbl_edtNomeChange
    OnKeyPress = lbl_edtNomeKeyPress
  end
  object lbl_edtNCM: TLabeledEdit
    Left = 535
    Top = 63
    Width = 102
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clInfoBk
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'NCM/SH'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 6
    OnChange = lbl_edtNomeChange
    OnKeyPress = lbl_edtNomeKeyPress
  end
  object lbl_edtProduto: TLabeledEdit
    Left = 15
    Top = 378
    Width = 290
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clInfoBk
    EditLabel.Width = 124
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o do Produto'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 7
    OnChange = lbl_edtNomeChange
    OnKeyPress = lbl_edtNomeKeyPress
  end
  object lbl_edtQtdeEstoque: TLabeledEdit
    Left = 310
    Top = 378
    Width = 78
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clInfoBk
    EditLabel.Width = 78
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde.Estoque'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 8
    OnChange = lbl_edtNomeChange
    OnKeyPress = lbl_edtNomeKeyPress
  end
  object lbl_edtPrecoVenda: TLabeledEdit
    Left = 394
    Top = 378
    Width = 90
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clInfoBk
    EditLabel.Width = 92
    EditLabel.Height = 13
    EditLabel.Caption = 'Pre'#231'o de Venda'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 9
    OnChange = lbl_edtNomeChange
    OnKeyPress = lbl_edtNomeKeyPress
  end
  object lbl_edtFabricanteProd: TLabeledEdit
    Left = 491
    Top = 378
    Width = 111
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clInfoBk
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'Fabricante'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 10
    OnChange = lbl_edtNomeChange
    OnKeyPress = lbl_edtNomeKeyPress
  end
  object cboFornecedores: TComboBox
    Left = 21
    Top = 63
    Width = 101
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 11
    OnClick = cboFornecedoresClick
  end
  object lbl_edtLocalProd: TLabeledEdit
    Left = 608
    Top = 378
    Width = 117
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clInfoBk
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Localiza'#231#227'o'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 12
    OnChange = lbl_edtNomeChange
    OnKeyPress = lbl_edtNomeKeyPress
  end
  object ckBuscaLetra: TCheckBox
    Left = 463
    Top = 13
    Width = 97
    Height = 17
    Caption = 'Busca Por Letra _F5'
    TabOrder = 13
    OnClick = ckBuscaLetraCheck
  end
  object ckBuscaNome: TCheckBox
    Left = 464
    Top = 30
    Width = 97
    Height = 17
    Caption = 'Busca Por Nome_F6'
    TabOrder = 14
    OnClick = ckBuscaNomeCheck
  end
  object ckPrecob: TCheckBox
    Left = 551
    Top = 114
    Width = 97
    Height = 17
    Caption = 'Pre'#231'o(B)'
    TabOrder = 15
    OnClick = ckPrecobCheck
  end
  object ckPrecoc: TCheckBox
    Left = 551
    Top = 132
    Width = 97
    Height = 17
    Caption = 'Pre'#231'o(C)'
    TabOrder = 16
    OnClick = ckPrecocCheck
  end
  object ckPrecoD: TCheckBox
    Left = 552
    Top = 150
    Width = 97
    Height = 17
    Caption = 'Pre'#231'o(D)'
    TabOrder = 17
  end
end
