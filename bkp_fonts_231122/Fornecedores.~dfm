object frmFornecedores: TfrmFornecedores
  Left = 5
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 540
  ClientWidth = 799
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDadoscliente: TLabel
    Left = 2
    Top = 0
    Width = 140
    Height = 16
    Caption = 'Dados do Fornecedor:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object ibeaNovo: TSpeedButton
    Left = 30
    Top = 23
    Width = 81
    Height = 25
    Caption = '&Novo'
    OnClick = ibeaNovoClick
  end
  object ibeaAlterar: TSpeedButton
    Left = 128
    Top = 23
    Width = 81
    Height = 25
    Caption = '&Alterar'
    OnClick = ibeaAlterarClick
  end
  object ibeaExcluir: TSpeedButton
    Left = 224
    Top = 23
    Width = 81
    Height = 25
    Caption = '&Excluir'
    OnClick = ibeaExcluirClick
  end
  object ibeaSair: TSpeedButton
    Left = 328
    Top = 23
    Width = 81
    Height = 25
    Caption = '&Sair'
    OnClick = ibeaSairClick
  end
  object grpbDadosfornec: TGroupBox
    Left = 6
    Top = 55
    Width = 780
    Height = 224
    Caption = 'Dados Cadastrais:'
    TabOrder = 0
    object lblData: TLabel
      Left = 651
      Top = 17
      Width = 32
      Height = 13
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_CondPagto: TLabel
      Left = 560
      Top = 176
      Width = 99
      Height = 13
      Caption = 'Condi'#231#245'es de Pagto.'
    end
    object lbl_edtCodigo: TLabeledEdit
      Left = 11
      Top = 32
      Width = 85
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo:'
      TabOrder = 0
    end
    object lbl_edtNome: TLabeledEdit
      Left = 108
      Top = 32
      Width = 294
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 118
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome/Raz'#227'o Social:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object lbl_edtNomefantasia: TLabeledEdit
      Left = 416
      Top = 32
      Width = 213
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 74
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome Fantasia:'
      TabOrder = 2
    end
    object lbl_edtEndereco: TLabeledEdit
      Left = 11
      Top = 111
      Width = 280
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Endere'#231'o:'
      TabOrder = 8
      OnExit = lbl_edtEnderecoExit
    end
    object lbl_edtBairro: TLabeledEdit
      Left = 479
      Top = 111
      Width = 195
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Bairro:'
      TabOrder = 11
    end
    object lbl_edtCidade: TLabeledEdit
      Left = 12
      Top = 150
      Width = 168
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Cidade:'
      TabOrder = 13
    end
    object lbl_edtEstado: TLabeledEdit
      Left = 192
      Top = 150
      Width = 45
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Estado:'
      TabOrder = 14
    end
    object lbl_edtCep: TLabeledEdit
      Left = 687
      Top = 111
      Width = 77
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Cep:'
      MaxLength = 9
      TabOrder = 12
      OnChange = lbl_edtCepChange
      OnExit = lbl_edtCepExit
    end
    object lbl_edtTelcom: TLabeledEdit
      Left = 306
      Top = 150
      Width = 123
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Tel.Coml:'
      MaxLength = 9
      TabOrder = 16
      OnExit = lbl_edtTelcomExit
    end
    object lbl_edtCnpj: TLabeledEdit
      Left = 12
      Top = 72
      Width = 124
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'CNPJ:'
      MaxLength = 18
      TabOrder = 3
      OnExit = lbl_edtCnpjExit
    end
    object lbl_edtIE: TLabeledEdit
      Left = 147
      Top = 72
      Width = 124
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Inscri'#231#227'o:'
      MaxLength = 20
      TabOrder = 4
    end
    object lbl_edtEmail: TLabeledEdit
      Left = 484
      Top = 72
      Width = 150
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'E-mail:'
      TabOrder = 6
    end
    object lbl_edtCelular: TLabeledEdit
      Left = 640
      Top = 150
      Width = 123
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = 'Celular:'
      MaxLength = 9
      TabOrder = 19
      OnExit = lbl_edtCelularExit
    end
    object lbl_edtSite: TLabeledEdit
      Left = 286
      Top = 72
      Width = 180
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 96
      EditLabel.Height = 13
      EditLabel.Caption = 'WebSite(Comercial):'
      TabOrder = 5
    end
    object lbl_edtContato: TLabeledEdit
      Left = 651
      Top = 72
      Width = 114
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Contato:'
      TabOrder = 7
    end
    object lbl_edtNumero: TLabeledEdit
      Left = 309
      Top = 111
      Width = 55
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#250'mero:'
      TabOrder = 9
    end
    object lbl_edtCompl: TLabeledEdit
      Left = 379
      Top = 111
      Width = 85
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 67
      EditLabel.Height = 13
      EditLabel.Caption = 'Complemento:'
      TabOrder = 10
    end
    object lbl_edtDDD: TLabeledEdit
      Left = 249
      Top = 150
      Width = 45
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'DDD:'
      MaxLength = 3
      TabOrder = 15
    end
    object lbl_edtDDDFax: TLabeledEdit
      Left = 443
      Top = 150
      Width = 45
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'DDD:'
      MaxLength = 3
      TabOrder = 17
    end
    object lbl_edtTelFax: TLabeledEdit
      Left = 502
      Top = 150
      Width = 123
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = 'Tel.Fax:'
      MaxLength = 9
      TabOrder = 18
    end
    object lbl_edtPontoreferencia: TLabeledEdit
      Left = 15
      Top = 194
      Width = 234
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 101
      EditLabel.Height = 13
      EditLabel.Caption = 'Ponto de Referencia:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      TabOrder = 20
    end
    object lbl_edtObs: TLabeledEdit
      Left = 271
      Top = 194
      Width = 276
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'Observa'#231#227'o:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clRed
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      TabOrder = 21
    end
    object lbl_edtDesconto: TLabeledEdit
      Left = 692
      Top = 194
      Width = 70
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'Desconto %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      TabOrder = 22
    end
    object dtpDataForn: TDateTimePicker
      Left = 640
      Top = 32
      Width = 97
      Height = 21
      BevelInner = bvSpace
      BevelOuter = bvSpace
      BevelKind = bkFlat
      Date = 41550.635511423620000000
      Time = 41550.635511423620000000
      TabOrder = 23
    end
    object cboCondPagto: TComboBox
      Left = 561
      Top = 192
      Width = 125
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      ItemHeight = 13
      TabOrder = 24
    end
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 288
    Width = 786
    Height = 38
    TabOrder = 1
    object sb_ord_nome: TSpeedButton
      Left = 466
      Top = 11
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
    object sb_ord_cod: TSpeedButton
      Left = 327
      Top = 10
      Width = 129
      Height = 22
      Cursor = crHandPoint
      Hint = 'Ordenar por C'#243'digo'
      Caption = 'Ordenar por C'#243'digo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
        F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
        F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
        F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
        F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
        F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sb_ord_codClick
    end
    object lbl_edtPesquisa: TLabeledEdit
      Left = 183
      Top = 12
      Width = 121
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      EditLabel.Width = 176
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Pesquisa de Fornecedores: '
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clNavy
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      ParentBiDiMode = False
      TabOrder = 0
      OnChange = lbl_edtPesquisaChange
    end
  end
  object dbgFornecedor: TDBGrid
    Left = -1
    Top = 331
    Width = 793
    Height = 198
    BorderStyle = bsNone
    DataSource = dmModule.dtsCadastro
    FixedColor = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgFornecedorCellClick
    OnDrawColumnCell = dbgFornecedorDrawColumnCell
  end
end
