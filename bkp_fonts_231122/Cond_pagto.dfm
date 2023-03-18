object frmCondpagto: TfrmCondpagto
  Left = 197
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Condi'#231#245'es de Pagamento'
  ClientHeight = 317
  ClientWidth = 546
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
  object lblCondpagto: TLabel
    Left = 2
    Top = 2
    Width = 234
    Height = 16
    Caption = 'Tabela Condi'#231#245'es de Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object ibeaNovo: TSpeedButton
    Left = 24
    Top = 67
    Width = 57
    Height = 25
    Caption = 'Novo'
    OnClick = ibeaNovoClick
  end
  object ibeaAlterar: TSpeedButton
    Left = 91
    Top = 68
    Width = 57
    Height = 25
    Caption = 'Alterar'
    OnClick = ibeaAlterarClick
  end
  object ibeaExcluir: TSpeedButton
    Left = 159
    Top = 68
    Width = 57
    Height = 25
    Caption = 'Excluir'
  end
  object ibeaSair: TSpeedButton
    Left = 487
    Top = 25
    Width = 57
    Height = 25
    Caption = 'Sair'
    OnClick = ibeaSairClick
  end
  object lbl_edtDescricao: TLabeledEdit
    Left = 9
    Top = 39
    Width = 184
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 0
  end
  object lbl_edtAcrescimo: TLabeledEdit
    Left = 204
    Top = 39
    Width = 61
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'Acr'#233'scimo'
    TabOrder = 1
  end
  object lbl_edtDesconto: TLabeledEdit
    Left = 275
    Top = 39
    Width = 61
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Desconto'
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 99
    Width = 546
    Height = 199
    Align = alBottom
    BorderWidth = 2
    Caption = 'Panel1'
    TabOrder = 3
    object dbgCondpagto: TDBGrid
      Left = 3
      Top = 3
      Width = 540
      Height = 193
      Cursor = crHandPoint
      Align = alClient
      BorderStyle = bsNone
      Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgCondpagtoCellClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 298
    Width = 546
    Height = 19
    Panels = <>
  end
end
