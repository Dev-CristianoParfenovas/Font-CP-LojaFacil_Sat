object frmTblPrecoForn: TfrmTblPrecoForn
  Left = 253
  Top = 223
  Caption = 'frmTblPrecoForn'
  ClientHeight = 153
  ClientWidth = 352
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
  object lbl_Forn: TLabel
    Left = 28
    Top = 57
    Width = 78
    Height = 13
    Caption = 'Fornecedores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cboFornecedores: TComboBox
    Left = 29
    Top = 72
    Width = 193
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 0
  end
end
