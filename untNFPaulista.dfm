object frmNFPaulista: TfrmNFPaulista
  Left = 186
  Top = 113
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Nota Paulista'
  ClientHeight = 90
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Negrito: TLabel
    Left = 8
    Top = 5
    Width = 190
    Height = 13
    Caption = 'Para Incluir no Caixa precione F1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 7
    Top = 70
    Width = 132
    Height = 13
    Caption = 'Precione ESC para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Nome: TLabeledEdit
    Left = 1
    Top = 40
    Width = 128
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 0
    OnEnter = lbl_NomeEnter
    OnExit = lbl_NomeExit
    OnKeyPress = lbl_NomeKeyPress
  end
  object lbl_Cpf: TLabeledEdit
    Left = 132
    Top = 41
    Width = 128
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 1
    OnEnter = lbl_CpfEnter
    OnExit = lbl_CpfExit
    OnKeyPress = lbl_CpfKeyPress
  end
  object lbl_Cnpj: TLabeledEdit
    Left = 263
    Top = 41
    Width = 128
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'CNPJ'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 2
    OnEnter = lbl_CnpjEnter
    OnExit = lbl_CnpjExit
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 216
    Top = 8
  end
end
