object frmCotacao: TfrmCotacao
  Left = 126
  Top = 136
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cota'#231#227'o'
  ClientHeight = 566
  ClientWidth = 791
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
  object pcCotacao: TPageControl
    Left = 5
    Top = 6
    Width = 781
    Height = 555
    ActivePage = tbsCotacao
    TabOrder = 0
    OnChange = pcCotacaoChange
    object tbsCotacao: TTabSheet
      Caption = 'Cota'#231#227'o'
      object lbl_Forn: TLabel
        Left = 19
        Top = 73
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
      end
      object lbl_DTCotacao: TLabel
        Left = 19
        Top = 16
        Width = 81
        Height = 13
        Caption = 'Data da Cota'#231#227'o'
      end
      object cboFornecedores: TComboBox
        Left = 16
        Top = 89
        Width = 209
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        TabOrder = 0
      end
      object lbl_edtNomeProd: TLabeledEdit
        Left = 233
        Top = 89
        Width = 240
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 169
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o do Produto - Precione F7'
        TabOrder = 1
      end
      object lbl_edtVlrCotacao: TLabeledEdit
        Left = 481
        Top = 89
        Width = 71
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Vlr.Cota'#231#227'o'
        TabOrder = 2
        OnExit = lbl_edtVlrCotacaoExit
        OnKeyPress = lbl_edtVlrCotacaoKeyPress
      end
      object lbl_edtTotalCotacao: TLabeledEdit
        Left = 650
        Top = 491
        Width = 107
        Height = 20
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clInfoBk
        EditLabel.Width = 89
        EditLabel.Height = 13
        EditLabel.Caption = 'TOTAL COTA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object lbl_edtNumeroCotacao: TLabeledEdit
        Left = 117
        Top = 33
        Width = 76
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clInfoBk
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#186' Cota'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object lbl_edtIDProd: TLabeledEdit
        Left = 409
        Top = 65
        Width = 47
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 3
        EditLabel.Height = 13
        EditLabel.Caption = '.'
        TabOrder = 3
        Visible = False
      end
      object lbl_edtQtde: TLabeledEdit
        Left = 559
        Top = 89
        Width = 48
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Qtde.'
        TabOrder = 5
        OnExit = lbl_edtQtdeExit
        OnKeyPress = lbl_edtQtdeKeyPress
      end
      object lbl_edtTotal: TLabeledEdit
        Left = 615
        Top = 89
        Width = 71
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Total'
        TabOrder = 6
      end
      object dbgCotacao: TDBGrid
        Left = 2
        Top = 136
        Width = 767
        Height = 333
        Cursor = crHandPoint
        BorderStyle = bsNone
        FixedColor = clInfoBk
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgCotacaoCellClick
      end
      object dtpDataCotacao: TDateTimePicker
        Left = 20
        Top = 33
        Width = 93
        Height = 21
        BevelInner = bvSpace
        BevelOuter = bvSpace
        BevelKind = bkFlat
        Date = 41550.000000000000000000
        Time = 0.446621446761128000
        TabOrder = 9
      end
    end
    object tbsManutHist: TTabSheet
      Caption = 'Manuten'#231#227'o/Hist'#243'rico'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lbl_DTIni: TLabel
        Left = 19
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object lbl_DTF: TLabel
        Left = 123
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object lbl_ConForn: TLabel
        Left = 19
        Top = 73
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
      end
      object cboFornecedorCon: TComboBox
        Left = 16
        Top = 89
        Width = 209
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        TabOrder = 0
        OnChange = cboFornecedorConChange
      end
      object dbgConsulta: TDBGrid
        Left = 2
        Top = 130
        Width = 767
        Height = 258
        Cursor = crHandPoint
        BorderStyle = bsNone
        FixedColor = clInfoBk
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgConsultaCellClick
      end
      object lbl_edtTotalConsulta: TLabeledEdit
        Left = 650
        Top = 441
        Width = 107
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clInfoBk
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object dtpDataInicial: TDateTimePicker
        Left = 19
        Top = 32
        Width = 90
        Height = 21
        BevelInner = bvSpace
        BevelOuter = bvSpace
        BevelKind = bkFlat
        Date = 41550.000000000000000000
        Time = 0.446621446761128000
        TabOrder = 2
      end
      object dtpDataFinal: TDateTimePicker
        Left = 120
        Top = 32
        Width = 90
        Height = 21
        BevelInner = bvSpace
        BevelOuter = bvSpace
        BevelKind = bkFlat
        Date = 41550.000000000000000000
        Time = 0.446621446761128000
        TabOrder = 4
      end
    end
  end
end
