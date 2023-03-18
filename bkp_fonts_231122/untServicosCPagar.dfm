object frmServicosCPagar: TfrmServicosCPagar
  Left = 127
  Top = 112
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Servi'#231'os do Contas a Pagar'
  ClientHeight = 360
  ClientWidth = 512
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
  object ibeaIncluir: TSpeedButton
    Left = 245
    Top = 55
    Width = 73
    Height = 25
    Caption = '&Incluir'
    OnClick = ibeaIncluirClick
  end
  object ibeaAlterar: TSpeedButton
    Left = 326
    Top = 55
    Width = 73
    Height = 25
    Caption = '&Alterar'
    OnClick = ibeaAlterarClick
  end
  object ibeaExcluir: TSpeedButton
    Left = 408
    Top = 55
    Width = 73
    Height = 25
    Caption = '&Excluir'
  end
  object ibeaSair: TSpeedButton
    Left = 432
    Top = 8
    Width = 73
    Height = 25
    Caption = '&Sair'
    OnClick = ibeaSairClick
  end
  object lbl_edtNome: TLabeledEdit
    Left = 32
    Top = 56
    Width = 209
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 157
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome do Servi'#231'o ou Custo Di'#225'rio'
    TabOrder = 0
  end
  object dbgServicosaPagar: TDBGrid
    Left = 5
    Top = 111
    Width = 501
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
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnCellClick = dbgServicosaPagarCellClick
  end
  object ckServicos: TCheckBox
    Left = 34
    Top = 16
    Width = 65
    Height = 17
    Caption = 'Servi'#231'os'
    TabOrder = 2
    OnClick = ckServicosCheck
  end
  object ckCustoDiario: TCheckBox
    Left = 107
    Top = 16
    Width = 97
    Height = 17
    Caption = 'Custo Di'#225'rio'
    TabOrder = 3
    OnClick = ckCustoDiarioCheck
  end
end
