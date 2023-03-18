object frmVendasDetalhado: TfrmVendasDetalhado
  Left = 71
  Top = 206
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Vendas Detalhado'
  ClientHeight = 113
  ClientWidth = 399
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
    Left = 9
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
    Left = 105
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
  object dtpDataCaixaIni: TDateTimePicker
    Left = 8
    Top = 56
    Width = 93
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.611684745366801500
    TabOrder = 0
  end
  object dtpDataCaixa: TDateTimePicker
    Left = 104
    Top = 56
    Width = 93
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41550.000000000000000000
    Time = 0.611684745366801500
    TabOrder = 1
  end
end
