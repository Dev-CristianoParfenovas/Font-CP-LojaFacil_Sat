object frmVendasCupom: TfrmVendasCupom
  Left = 205
  Top = 213
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Vendas por Cupom'
  ClientHeight = 162
  ClientWidth = 302
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
  object ibeaVisualizar: TSpeedButton
    Left = 64
    Top = 88
    Width = 73
    Height = 25
    Caption = '&Visualizar'
    OnClick = ibeaVisualizarClick
  end
  object ibeaSair: TSpeedButton
    Left = 144
    Top = 88
    Width = 73
    Height = 25
    Caption = '&Sair'
    OnClick = ibeaSairClick
  end
  object lbl_edtNCupom: TLabeledEdit
    Left = 64
    Top = 56
    Width = 121
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Cupom'
    TabOrder = 0
  end
end
