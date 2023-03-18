object frmEntradadeEstoque: TfrmEntradadeEstoque
  Left = 192
  Top = 114
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Entrada no Estoque'
  ClientHeight = 566
  ClientWidth = 689
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
  object pcEstoque: TPageControl
    Left = 4
    Top = 8
    Width = 681
    Height = 553
    ActivePage = tbsEntrada
    TabOrder = 0
    OnChange = pcEstoqueChange
    object tbsEntrada: TTabSheet
      Caption = 'Entrada de Mercadorias'
      object lbl_Fornecedor: TLabel
        Left = 195
        Top = 74
        Width = 57
        Height = 13
        Caption = 'Fornecedor:'
      end
      object lbl_Prod: TLabel
        Left = 194
        Top = 121
        Width = 40
        Height = 13
        Caption = 'Produto:'
      end
      object lbl_DtaEmissao: TLabel
        Left = 186
        Top = 9
        Width = 80
        Height = 13
        Caption = 'Data de Emiss'#227'o'
      end
      object btnSair: TBitBtn
        Left = 621
        Top = 3
        Width = 52
        Height = 45
        Hint = 'Sair'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnSairClick
      end
      object lbl_edtNLancto: TLabeledEdit
        Left = 10
        Top = 90
        Width = 57
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#186' Lan'#231'to.'
        ReadOnly = True
        TabOrder = 1
      end
      object lbl_edtNNota: TLabeledEdit
        Left = 76
        Top = 90
        Width = 108
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#186' NF.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
      end
      object cboFornecedor: TComboBox
        Left = 192
        Top = 90
        Width = 203
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        TabOrder = 3
        OnChange = cboFornecedorChange
      end
      object btnNovo: TBitBtn
        Left = 9
        Top = 3
        Width = 52
        Height = 45
        Hint = 'Gerar Lan'#231'amento'
        Caption = 'Novo'
        Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnNovoClick
      end
      object btnExcluir: TBitBtn
        Left = 72
        Top = 3
        Width = 52
        Height = 45
        Hint = 'Excluir'
        Caption = 'Excluir'
        Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnExcluirClick
      end
      object dbgEntradaEstoque: TDBGrid
        Left = 2
        Top = 191
        Width = 668
        Height = 262
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
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = dbgEntradaEstoqueCellClick
      end
      object lbl_edtCodBarras: TLabeledEdit
        Left = 11
        Top = 137
        Width = 87
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'd.Barras'
        TabOrder = 7
        OnChange = lbl_edtCodBarrasChange
        OnKeyPress = lbl_edtCodBarrasKeyPress
      end
      object lbl_edtRef: TLabeledEdit
        Left = 106
        Top = 137
        Width = 77
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 20
        EditLabel.Height = 13
        EditLabel.Caption = 'Ref.'
        TabOrder = 8
      end
      object cboProdutos: TComboBox
        Left = 192
        Top = 137
        Width = 203
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        TabOrder = 9
      end
      object lbl_edtQtde: TLabeledEdit
        Left = 405
        Top = 137
        Width = 60
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Qtde.'
        TabOrder = 10
        Text = '1'
        OnExit = lbl_edtQtdeExit
        OnKeyPress = lbl_edtQtdeKeyPress
      end
      object lbl_edtVlrUnit: TLabeledEdit
        Left = 475
        Top = 137
        Width = 70
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Vlr.Unit.'
        TabOrder = 11
      end
      object lbl_edtVlrTotal: TLabeledEdit
        Left = 557
        Top = 137
        Width = 70
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 39
        EditLabel.Height = 13
        EditLabel.Caption = 'Vlr.Total'
        TabOrder = 12
        OnExit = lbl_edtVlrTotalExit
        OnKeyPress = lbl_edtVlrTotalKeyPress
      end
      object lbl_edtTotal: TLabeledEdit
        Left = 517
        Top = 489
        Width = 153
        Height = 32
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clInfoBk
        EditLabel.Width = 146
        EditLabel.Height = 16
        EditLabel.Caption = 'Total  da Nota Fiscal'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
      end
      object btnIncluir: TBitBtn
        Left = 403
        Top = 82
        Width = 42
        Height = 35
        Hint = 'Incluir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnClick = btnIncluirClick
      end
      object lbl_edtIDProduto: TLabeledEdit
        Left = 22
        Top = 168
        Width = 77
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 20
        EditLabel.Height = 13
        EditLabel.Caption = 'Ref.'
        TabOrder = 15
        Visible = False
      end
      object dtpDataEmissao: TDateTimePicker
        Left = 184
        Top = 24
        Width = 93
        Height = 24
        BevelInner = bvSpace
        BevelOuter = bvSpace
        BevelKind = bkFlat
        Date = 40094.000000000000000000
        Time = 0.955839652779104700
        TabOrder = 16
      end
      object lbl_edtIDFornecedor: TLabeledEdit
        Left = 270
        Top = 64
        Width = 51
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 11
        EditLabel.Height = 13
        EditLabel.Caption = 'ID'
        TabOrder = 17
        Visible = False
      end
    end
    object tbsManut: TTabSheet
      Caption = 'Consulta / Manuten'#231#227'o'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lbl_EmissaoBuscaNF: TLabel
        Left = 6
        Top = 5
        Width = 80
        Height = 13
        Caption = 'Data de Emiss'#227'o'
      end
      object lbl_Forn: TLabel
        Left = 108
        Top = 5
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
      end
      object dbgDetalheLancto: TDBGrid
        Left = 2
        Top = 51
        Width = 668
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
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = dbgDetalheLanctoCellClick
      end
      object dtpDataBuscaNF: TDateTimePicker
        Left = 4
        Top = 20
        Width = 93
        Height = 24
        BevelInner = bvSpace
        BevelOuter = bvSpace
        BevelKind = bkFlat
        Date = 40094.000000000000000000
        Time = 0.955839652779104700
        TabOrder = 1
        OnChange = dtpDataBuscaNFChange
      end
      object lbl_edtBuscaNF: TLabeledEdit
        Left = 5
        Top = 252
        Width = 108
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Busca por N'#186' NF.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
      end
      object dbgHistoricoNF: TDBGrid
        Left = 2
        Top = 279
        Width = 668
        Height = 188
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
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
      object lbl_edtTotalHistorico: TLabeledEdit
        Left = 517
        Top = 489
        Width = 153
        Height = 32
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clInfoBk
        EditLabel.Width = 146
        EditLabel.Height = 16
        EditLabel.Caption = 'Total  da Nota Fiscal'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object cboFornecedorDetalhe: TComboBox
        Left = 106
        Top = 21
        Width = 203
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        TabOrder = 5
        OnClick = cboFornecedorDetalheClick
      end
      object btnLimpar: TBitBtn
        Left = 314
        Top = 20
        Width = 54
        Height = 21
        Hint = 'Limpar'
        Caption = '&Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = btnLimparClick
      end
      object btnSairDetalhe: TBitBtn
        Left = 621
        Top = 3
        Width = 52
        Height = 45
        Hint = 'Sair'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btnSairDetalheClick
      end
      object btnRelatorio: TBitBtn
        Left = 124
        Top = 238
        Width = 42
        Height = 35
        Hint = 'Relatorio'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = btnRelatorioClick
      end
      object btnExcluirNota: TBitBtn
        Left = 177
        Top = 238
        Width = 42
        Height = 35
        Hint = 'Relatorio'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
    end
  end
end
