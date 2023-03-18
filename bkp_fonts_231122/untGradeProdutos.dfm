object frmGradeProdutos: TfrmGradeProdutos
  Left = 140
  Top = 172
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Grade'
  ClientHeight = 446
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sbGravarEstoque: TSpeedButton
    Left = 264
    Top = 104
    Width = 49
    Height = 41
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFD8E8DB7AB8853194441585291585293194447AB885D8E8DBFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F87AB885007B16007B1600841800
      7B16007B16007B16007B16007B167AB885F8F8F8FFFFFFFFFFFFFFFFFFF8F8F8
      4BA55B008418008C19008C19008C19008C19008C19008418008418007B16007B
      164BA55BF8F8F8FFFFFFFFFFFF7AB88500841800941A00941A00941A00941A00
      941A00941A00941A008C19008418007B16007B167AB885FFFFFFD5E6D8008418
      00941A009E1D00A61E00A61E42BB57D2F0D71BA935009C1C00941A008C190084
      18007B16007B16D8E8DB75B68000941A00A61E00AD1F00AD1F75D486FFFFFFFF
      FFFFD2F0D70FAA2B009E1D00941A008C19008418007B1675B68031944400A61E
      00AD1F0CB82BAEE9B8FFFFFFFFFFFFFFFFFFFFFFFFBDEAC506A923009E1D0094
      1A008C190084182D923F128E2800B62100B621BAEEC3FFFFFFFFFFFFC9F3D1B7
      EEC1FFFFFFFFFFFFA5E3B000A61E009C1C00941A00841811842512912800BA21
      00C6241ECE3EDEF8E3ABEEB709CC2C09CC2CC9F3D1FFFFFFFFFFFF87D89600A6
      1E00941A008C191185262F9E4300C62400C62400CE2512D13400CE2500CE2500
      CE2515CD36DEF8E3FFFFFFFFFFFF69CB7B009C1C008C192D923F75B68000BA21
      00CE2500CE2500D62700D62700D62700CE2500CE252DD24BF0FBF2FFFFFFA2E0
      AD009C1C008C1975B680D8E8DB009E1D00CE2500D62700D62700D62700D62700
      D62700CE2500C62442D35C99E2A600AD1F009E1D008418D8E8DBFFFFFF7AB885
      00B62100D62700D62700DD2800D62700D62700CE2500C62400C62400B62100AD
      1F00941A7AB885FFFFFFFFFFFFF8F8F84BA55B00BA2100D62700D62700D62700
      CE2500CE2500C62400BA2100B621009C1C4BA55BF8F8F8FFFFFFFFFFFFFFFFFF
      F8F8F875B680009E1D00C62400D62700CE2500CE2500C62400B62104931D7AB8
      85F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8E8DB7AB8852F9E4313
      9A2B139A2B2F9E437AB885D8E8DBFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object lbl_edtIDProd: TLabeledEdit
    Left = 56
    Top = 40
    Width = 57
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'ID Produto'
    TabOrder = 0
  end
  object lbl_edtNomeProd: TLabeledEdit
    Left = 128
    Top = 40
    Width = 185
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 1
  end
  object lbl_edtQtdeP: TLabeledEdit
    Left = 181
    Top = 80
    Width = 57
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde'
    TabOrder = 2
  end
  object cboP: TComboBox
    Left = 56
    Top = 80
    Width = 111
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    ItemHeight = 13
    TabOrder = 3
  end
  object cboM: TComboBox
    Left = 56
    Top = 119
    Width = 111
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    ItemHeight = 13
    TabOrder = 4
  end
  object cboG: TComboBox
    Left = 56
    Top = 157
    Width = 111
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    ItemHeight = 13
    TabOrder = 5
  end
  object lbl_edtQtdeM: TLabeledEdit
    Left = 181
    Top = 119
    Width = 57
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde'
    TabOrder = 6
  end
  object lbl_edtQtdeG: TLabeledEdit
    Left = 182
    Top = 157
    Width = 57
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde'
    TabOrder = 7
  end
end
