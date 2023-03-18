object frmConfigNota: TfrmConfigNota
  Left = 1
  Top = 42
  BorderIcons = [biSystemMenu]
  Caption = 'Confirgura'#231#227'o de impress'#227'o para Nota fiscal'
  ClientHeight = 458
  ClientWidth = 780
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
  object lbl_edtNNotaHoriz: TLabeledEdit
    Left = 8
    Top = 24
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Nota Col.'
    TabOrder = 0
  end
  object lbl_edtNNotaVert: TLabeledEdit
    Left = 94
    Top = 24
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Nota Linh.'
    TabOrder = 1
  end
  object lbl_edtSaidaHoriz: TLabeledEdit
    Left = 180
    Top = 24
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'NF Saida Col.'
    TabOrder = 2
  end
  object lbl_edtSaidaVert: TLabeledEdit
    Left = 266
    Top = 24
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'NF Saida Linh.'
    TabOrder = 3
  end
  object lbl_edtEntradaHoriz: TLabeledEdit
    Left = 352
    Top = 24
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'NF Entr.Col.'
    TabOrder = 4
  end
  object lbl_edtEntradaVert: TLabeledEdit
    Left = 438
    Top = 24
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 62
    EditLabel.Height = 13
    EditLabel.Caption = 'NF Entr.Linh.'
    TabOrder = 5
  end
  object lbl_edtNomeNatHoriz: TLabeledEdit
    Left = 524
    Top = 24
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'Natureza Col.'
    TabOrder = 6
  end
  object lbl_edtNomeNatVert: TLabeledEdit
    Left = 610
    Top = 24
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Natura Linh.'
    TabOrder = 7
  end
  object lbl_edtCodNatHoriz: TLabeledEdit
    Left = 8
    Top = 67
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'Cod.Nat.Col.'
    TabOrder = 8
  end
  object lbl_edtCodNatVert: TLabeledEdit
    Left = 94
    Top = 67
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Cod.Nat.Linh.'
    TabOrder = 9
  end
  object lbl_edtInscEstSistTribHoriz: TLabeledEdit
    Left = 180
    Top = 67
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Inscr.E.S.T.Col.'
    TabOrder = 10
  end
  object lbl_edtInscEstSistTribVert: TLabeledEdit
    Left = 266
    Top = 67
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 79
    EditLabel.Height = 13
    EditLabel.Caption = 'Inscr.E.S.T.Linh.'
    TabOrder = 11
  end
  object lbl_edtNomeCliHoriz: TLabeledEdit
    Left = 352
    Top = 67
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Cliente Col.'
    TabOrder = 12
  end
  object lbl_edtNomeCliVert: TLabeledEdit
    Left = 438
    Top = 67
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Cliente Linh.'
    TabOrder = 13
  end
  object lbl_edtCnpjHoriz: TLabeledEdit
    Left = 524
    Top = 67
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'CNPJ Col.'
    TabOrder = 14
  end
  object lbl_edtCnpjVert: TLabeledEdit
    Left = 610
    Top = 67
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'CNPJ Linh.'
    TabOrder = 15
  end
  object lbl_edtDataEmissaoHoriz: TLabeledEdit
    Left = 8
    Top = 109
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Dt Emissao Col.'
    TabOrder = 16
  end
  object lbl_edtDataEmissaoVert: TLabeledEdit
    Left = 94
    Top = 109
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 79
    EditLabel.Height = 13
    EditLabel.Caption = 'Dt Emissao Linh.'
    TabOrder = 17
  end
  object lbl_edtEndCliHoriz: TLabeledEdit
    Left = 180
    Top = 109
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'Endereco Col.'
    TabOrder = 18
  end
  object lbl_edtEndCliVert: TLabeledEdit
    Left = 266
    Top = 109
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'Endereco Linh.'
    TabOrder = 19
  end
  object lbl_edtBairroCliHoriz: TLabeledEdit
    Left = 352
    Top = 109
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Bairro Col.'
    TabOrder = 20
  end
  object lbl_edtBairroCliVert: TLabeledEdit
    Left = 438
    Top = 109
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Bairro Linh.'
    TabOrder = 21
  end
  object lbl_edtDataSaideEntrHoriz: TLabeledEdit
    Left = 8
    Top = 152
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Dt S/E. Col.'
    TabOrder = 22
  end
  object lbl_edtDataSaideEntrVert: TLabeledEdit
    Left = 94
    Top = 152
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Dt S/E Linh.'
    TabOrder = 23
  end
  object lbl_edtMunicHoriz: TLabeledEdit
    Left = 180
    Top = 152
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Municipio Col.'
    TabOrder = 24
  end
  object lbl_edtMunicVert: TLabeledEdit
    Left = 266
    Top = 152
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 71
    EditLabel.Height = 13
    EditLabel.Caption = 'Municipio Linh.'
    TabOrder = 25
  end
  object lbl_edtFonecliHoriz: TLabeledEdit
    Left = 352
    Top = 152
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 63
    EditLabel.Height = 13
    EditLabel.Caption = 'Telefone Col.'
    TabOrder = 26
  end
  object lbl_edtFonecliVert: TLabeledEdit
    Left = 438
    Top = 152
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'Telefone Linh.'
    TabOrder = 27
  end
  object lbl_edtUFHoriz: TLabeledEdit
    Left = 524
    Top = 152
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 35
    EditLabel.Height = 13
    EditLabel.Caption = 'UF Col.'
    TabOrder = 28
  end
  object lbl_edtUFVert: TLabeledEdit
    Left = 610
    Top = 152
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'UF Linh.'
    TabOrder = 29
  end
  object lbl_edtIEHoriz: TLabeledEdit
    Left = 8
    Top = 195
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'I.E. Col.'
    TabOrder = 30
  end
  object lbl_edtIEVert: TLabeledEdit
    Left = 94
    Top = 195
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'I.E.Linh.'
    TabOrder = 31
  end
  object lbl_edtHoraSaidaHoriz: TLabeledEdit
    Left = 180
    Top = 195
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Hora Saida Col.'
    TabOrder = 32
  end
  object lbl_edtHoraSaidaVert: TLabeledEdit
    Left = 266
    Top = 195
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 79
    EditLabel.Height = 13
    EditLabel.Caption = 'Hora Saida Linh.'
    TabOrder = 33
  end
  object lbl_edtNFaturaHoriz: TLabeledEdit
    Left = 352
    Top = 195
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Fatura Col.'
    TabOrder = 34
  end
  object lbl_edtNFaturaVert: TLabeledEdit
    Left = 438
    Top = 195
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 71
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Fatura Linh.'
    TabOrder = 35
  end
  object lbl_edtVctoHoriz: TLabeledEdit
    Left = 524
    Top = 195
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = 'Vcto.Col.'
    TabOrder = 36
  end
  object lbl_edtVctoVert: TLabeledEdit
    Left = 610
    Top = 195
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Vcto.Linh.'
    TabOrder = 37
  end
  object lbl_edtValorHoriz: TLabeledEdit
    Left = 8
    Top = 238
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor Col.'
    TabOrder = 38
  end
  object lbl_edtValorVert: TLabeledEdit
    Left = 94
    Top = 238
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor Linh.'
    TabOrder = 39
  end
  object lbl_edtCodProdHoriz: TLabeledEdit
    Left = 524
    Top = 238
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Cod.Prod.Col.'
    TabOrder = 40
  end
  object lbl_edtCodProdVert: TLabeledEdit
    Left = 610
    Top = 238
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'Cod.Prod.Linh.'
    TabOrder = 41
  end
  object lbl_edtNomeProdHoriz: TLabeledEdit
    Left = 9
    Top = 281
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome Prod.Col.'
    TabOrder = 42
  end
  object lbl_edtNomeProdVert: TLabeledEdit
    Left = 95
    Top = 281
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 79
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome Prod.Linh.'
    TabOrder = 43
  end
  object lbl_edtQtdeCol: TLabeledEdit
    Left = 181
    Top = 281
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde.Col.'
    TabOrder = 44
  end
  object lbl_edtQtdeLinh: TLabeledEdit
    Left = 267
    Top = 281
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde.Linh.'
    TabOrder = 45
  end
  object lbl_edtVlrUnitHoriz: TLabeledEdit
    Left = 352
    Top = 281
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor Unit.Col.'
    TabOrder = 46
  end
  object lbl_edtVlrUnitVert: TLabeledEdit
    Left = 438
    Top = 281
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor Unit.Linh.'
    TabOrder = 47
  end
  object lbl_edtVlrTotalHoriz: TLabeledEdit
    Left = 524
    Top = 281
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'Vlr.Total Col.'
    TabOrder = 48
  end
  object lbl_edtVlrTotalVert: TLabeledEdit
    Left = 610
    Top = 281
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Vlr.Total Linh.'
    TabOrder = 49
  end
  object lbl_edtTotalProdHoriz: TLabeledEdit
    Left = 9
    Top = 324
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'Total Prod.Col.'
    TabOrder = 50
  end
  object lbl_edtTotalProdVert: TLabeledEdit
    Left = 95
    Top = 324
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 75
    EditLabel.Height = 13
    EditLabel.Caption = 'Total Prod.Linh.'
    TabOrder = 51
  end
  object lbl_edtTotalNFHoriz: TLabeledEdit
    Left = 181
    Top = 324
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Total NF. Col.'
    TabOrder = 52
  end
  object lbl_edtTotalNFVert: TLabeledEdit
    Left = 267
    Top = 324
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'Total NF. Linh.'
    TabOrder = 53
  end
  object lbl_edtTranspHoriz: TLabeledEdit
    Left = 352
    Top = 324
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Transp. Col.'
    TabOrder = 54
  end
  object lbl_edtTranspVert: TLabeledEdit
    Left = 438
    Top = 324
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Transp.Linh.'
    TabOrder = 55
  end
  object lbl_edtFreteContaHoriz: TLabeledEdit
    Left = 524
    Top = 324
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Frete Conta Col.'
    TabOrder = 56
  end
  object lbl_edtFreteContaVert: TLabeledEdit
    Left = 610
    Top = 324
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 81
    EditLabel.Height = 13
    EditLabel.Caption = 'Frete Conta Linh.'
    TabOrder = 57
  end
  object lbl_edtEndTranspHoriz: TLabeledEdit
    Left = 9
    Top = 367
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'End.Col.'
    TabOrder = 58
  end
  object lbl_edtEndTranspVert: TLabeledEdit
    Left = 95
    Top = 367
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'End.Linh.'
    TabOrder = 59
  end
  object lbl_edtQuantidadeHoriz: TLabeledEdit
    Left = 181
    Top = 367
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Quant.Col.'
    TabOrder = 60
  end
  object lbl_edtQuantidadeVert: TLabeledEdit
    Left = 267
    Top = 367
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'Quant.Linh.'
    TabOrder = 61
  end
  object lbl_edtEspecieHoriz: TLabeledEdit
    Left = 352
    Top = 367
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Especie Col.'
    TabOrder = 62
  end
  object lbl_edtEspecieVert: TLabeledEdit
    Left = 438
    Top = 367
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'Especie Linh.'
    TabOrder = 63
  end
  object lbl_edtPBrutoHoriz: TLabeledEdit
    Left = 524
    Top = 367
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Peso Bruto Col.'
    TabOrder = 64
  end
  object lbl_edtPBrutoVert: TLabeledEdit
    Left = 610
    Top = 367
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 78
    EditLabel.Height = 13
    EditLabel.Caption = 'Peso Bruto Linh.'
    TabOrder = 65
  end
  object lbl_edtPLiqHoriz: TLabeledEdit
    Left = 9
    Top = 407
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 62
    EditLabel.Height = 13
    EditLabel.Caption = 'Peso Liq.Col.'
    TabOrder = 66
  end
  object lbl_edtPLiqVert: TLabeledEdit
    Left = 95
    Top = 407
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'Peso Liq.Linh.'
    TabOrder = 67
  end
  object lbl_edtDadosAdHoriz: TLabeledEdit
    Left = 181
    Top = 407
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'Dados Ad.Col.'
    TabOrder = 68
  end
  object lbl_edtDadosAdVert: TLabeledEdit
    Left = 267
    Top = 407
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Dados Ad.Linh.'
    TabOrder = 69
  end
  object lbl_edtCepCliHoriz: TLabeledEdit
    Left = 524
    Top = 109
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'Cep Col.'
    TabOrder = 70
  end
  object lbl_edtCepCliVert: TLabeledEdit
    Left = 610
    Top = 109
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Cep Linh.'
    TabOrder = 71
  end
  object lbl_edtNNotaCanhotoCol: TLabeledEdit
    Left = 352
    Top = 407
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186'Canh.Col'
    TabOrder = 72
  end
  object lbl_edtNNotaCanhotoLinh: TLabeledEdit
    Left = 438
    Top = 407
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Canh.Linha'
    TabOrder = 73
  end
  object lbl_edtVctoParcCol: TLabeledEdit
    Left = 179
    Top = 238
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Vcto.Parc.Col'
    TabOrder = 75
  end
  object lbl_edtVctoParcLinh: TLabeledEdit
    Left = 265
    Top = 238
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'Vcto.Parc.Linh'
    TabOrder = 77
  end
  object lbl_edtVlrParcCol: TLabeledEdit
    Left = 350
    Top = 238
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Vlr.Parc.Col.'
    TabOrder = 74
  end
  object lbl_edtVlrParcLinh: TLabeledEdit
    Left = 436
    Top = 238
    Width = 79
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'Vlr.Parc.Linh'
    TabOrder = 76
  end
end
