object frmEstoqueMForn: TfrmEstoqueMForn
  Left = 229
  Top = 135
  Caption = 'Relat'#243'rio de Estoque M'#237'nimo/Negativo por Fornecedor'
  ClientHeight = 144
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 82
    Height = 13
    Caption = 'Fornecedores:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeaVisualizar: TSpeedButton
    Left = 257
    Top = 62
    Width = 67
    Height = 26
    Caption = 'Visualizar'
    OnClick = ibeaVisualizarClick
  end
  object ibeaSair: TSpeedButton
    Left = 337
    Top = 62
    Width = 67
    Height = 26
    Caption = 'Sair'
    OnClick = ibeaSairClick
  end
  object cboFornecedores: TComboBox
    Left = 8
    Top = 64
    Width = 241
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 0
  end
  object ckGeral: TCheckBox
    Left = 8
    Top = 8
    Width = 55
    Height = 17
    Caption = 'Geral'
    TabOrder = 1
    OnClick = ckGeralCheck
  end
  object ckEstoqueN: TCheckBox
    Left = 65
    Top = 8
    Width = 172
    Height = 17
    Caption = '&Com Estoque M'#237'nimo/Negativo'
    TabOrder = 2
    OnClick = ckEstoqueNCheck
  end
end
