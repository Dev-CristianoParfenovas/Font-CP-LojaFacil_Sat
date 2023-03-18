object frmFuncVenda: TfrmFuncVenda
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Funcion'#225'rios'
  ClientHeight = 165
  ClientWidth = 351
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
  object lbl_Info: TLabel
    Left = 72
    Top = 24
    Width = 102
    Height = 13
    Caption = 'Selecione abaixo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_IDCliFunc: TLabel
    Left = 75
    Top = 6
    Width = 62
    Height = 13
    Caption = 'lbl_IDCliFunc'
    Visible = False
  end
  object F1: TLabel
    Left = 98
    Top = 103
    Width = 142
    Height = 13
    Caption = 'F1 - para incluir no caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cboUsuario: TComboBox
    Left = 69
    Top = 40
    Width = 209
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
    OnClick = cboUsuarioClick
  end
end
