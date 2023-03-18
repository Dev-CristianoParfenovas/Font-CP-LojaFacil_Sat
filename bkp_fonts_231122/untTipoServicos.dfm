object frmTipoServicos: TfrmTipoServicos
  Left = 77
  Top = 145
  BorderIcons = [biMaximize]
  BorderStyle = bsSingle
  Caption = 'Servi'#231'os'
  ClientHeight = 341
  ClientWidth = 579
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
  object lbl_edtNome: TLabeledEdit
    Left = 8
    Top = 56
    Width = 209
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 102
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o do Servi'#231'o'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
  end
  object ibeaSair: TBmsXPButton
    Left = 496
    Top = 3
    Width = 80
    Height = 21
    Caption = '&Sair'
    Layout = tlTop
    WordWrap = False
    ShowAccelChar = True
    TabOrder = 1
    OnClick = ibeaSairClick
  end
  object lbl_edtVlrServico: TLabeledEdit
    Left = 224
    Top = 56
    Width = 89
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 78
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor do Servi'#231'o'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 2
  end
  object ibeaIncluir: TBmsXPButton
    Left = 320
    Top = 56
    Width = 80
    Height = 21
    Caption = '&Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = tlTop
    WordWrap = False
    ShowAccelChar = True
    ParentFont = False
    TabOrder = 3
    OnClick = ibeaIncluirClick
  end
  object ibeaAlterar: TBmsXPButton
    Left = 408
    Top = 56
    Width = 80
    Height = 21
    Caption = '&Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = tlTop
    WordWrap = False
    ShowAccelChar = True
    ParentFont = False
    TabOrder = 4
    OnClick = ibeaAlterarClick
  end
  object ibeaExcluir: TBmsXPButton
    Left = 496
    Top = 56
    Width = 80
    Height = 21
    Caption = '&Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = tlTop
    WordWrap = False
    ShowAccelChar = True
    ParentFont = False
    TabOrder = 5
    OnClick = ibeaExcluirClick
  end
  object dbgTipoServico: TDBGrid
    Left = 5
    Top = 97
    Width = 564
    Height = 244
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
    OnCellClick = dbgTipoServicoCellClick
  end
end
