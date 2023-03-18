object frmContasaPagarP: TfrmContasaPagarP
  Left = 187
  Top = 111
  BorderIcons = [biSystemMenu]
  Caption = 'Contas a Pagar por per'#237'odo'
  ClientHeight = 100
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_DTIni: TLabel
    Left = 24
    Top = 40
    Width = 66
    Height = 13
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_DTF: TLabel
    Left = 120
    Top = 40
    Width = 55
    Height = 13
    Caption = 'DataFinal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Serv: TLabel
    Left = 218
    Top = 40
    Width = 63
    Height = 13
    Caption = 'Por Servi'#231'os:'
  end
  object lbl_F: TLabel
    Left = 387
    Top = 40
    Width = 87
    Height = 13
    Caption = 'Por Fornecedores:'
  end
  object cboServicos: TComboBox
    Left = 216
    Top = 56
    Width = 161
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvRaised
    TabOrder = 0
  end
  object cboFornecedores: TComboBox
    Left = 387
    Top = 56
    Width = 161
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvRaised
    TabOrder = 1
  end
  object dtpDataCaixaIni: TDateTimePicker
    Left = 24
    Top = 56
    Width = 92
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.462904722218809200
    TabOrder = 2
  end
  object dtpDataCaixaF: TDateTimePicker
    Left = 121
    Top = 55
    Width = 92
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.462904722218809200
    TabOrder = 3
  end
end
