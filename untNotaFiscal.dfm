object frmNotaFiscal: TfrmNotaFiscal
  Left = 0
  Top = 34
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Nota Fiscal'
  ClientHeight = 532
  ClientWidth = 790
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Emissao: TLabel
    Left = 99
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Emiss'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 581
    Top = 7
    Width = 30
    Height = 13
    Caption = 'Tipo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lbl_Vcto: TLabel
    Left = 188
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Vcto.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeaNovo: TSpeedButton
    Left = 278
    Top = 15
    Width = 70
    Height = 34
    Caption = '&Novo'
    Flat = True
    Glyph.Data = {
      36010000424D3601000000000000760000002800000011000000100000000100
      040000000000C0000000C40E0000C40E00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333300000003333330000000000300000003333330FFFFFFFF0300000003333
      330FFFFFFFF0300000003333330F00F000F0300000003330330FFFFFFFF03000
      00003339030F0800F0F0300000003339900FFFFFFFF0300000000999990F00F0
      00003000000009999990FFF0FF03300000000999999908F0F033300000000999
      9990FFF003333000000009999900000033333000000033399033333333333000
      0000333903333333333330000000333033333333333330000000}
    OnClick = ibeaNovoClick
  end
  object ibeaExcluir: TSpeedButton
    Left = 361
    Top = 15
    Width = 70
    Height = 34
    Caption = '&Excluir'
    Flat = True
    Glyph.Data = {
      4E010000424D4E01000000000000760000002800000013000000120000000100
      040000000000D8000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333000003333883333333333333000003339118333339833333000003339
      1118333911833330000033391111839111183330000033339111181111183330
      0000333339111111118333300000333333911111183333300000333333311111
      8333333000003333333911118333333000003333339111118333333000003333
      3911181118333330000033339111839111833330000033339118333911183330
      0000333339133333911133300000333333333333391933300000333333333333
      333333300000333333333333333333300000}
    OnClick = ibeaExcluirClick
  end
  object ibeaBuscaCli: TSpeedButton
    Left = 523
    Top = 11
    Width = 45
    Height = 34
    Flat = True
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF004242730008085A0008087B001818
      7B0018187B0018187B0018187B0010107B0000005200BDBDBD00FF00FF007384
      730042634200426B42004A6B4A004A6B4A00182963002121AD002121E7003131
      FF003939FF003939FF003131FF002929FF0008007B00EFEFEF00FF00FF0042A5
      4A0018B5180021F7180039FF310042FF390039DE420029299C004242CE004242
      EF004242F7004242F7004242F7003131E70042426300FF00FF00FF00FF0094CE
      9C0029A5290039DE390039FF390042FF420042FF3900296373005A5AC6005A5A
      D6005A5ADE005A5ADE005A5AD60021188C00BDBDBD00FF00FF00FF00FF00F7FF
      F70031A539005AC65A005ADE5A005ADE5A005ADE5A004ABD52003139A5007B7B
      D6007B7BD6007B7BD6004242B50063637B00FF00FF00FF00FF00FF00FF00FF00
      FF0094CE9C0052BD52007BD67B007BD67B0073D673002184210029294200424A
      BD00848CE700525ACE0018183900BDBDBD00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00397B42005ACE630073DE8400319439001829290094ADD600B5D6
      F700C6DEFF00C6DEFF00B5CEE70039424A00B5B5B500FF00FF00FF00FF00FF00
      FF006B7384009CB5DE00BDD6FF00C6DEFF00C6DEFF0094BDE700A5CEF700B5D6
      FF00BDDEFF00BDDEFF00BDDEFF00B5D6F70029313100FF00FF00FF00FF00B5BD
      C60094B5E700ADCEF700B5D6FF00BDDEFF00ADCEF70094BDEF00A5CEFF00ADCE
      FF00ADD6FF00ADD6FF00ADD6FF00ADD6FF0063738C00BDBDBD00FF00FF00ADC6
      E70094BDF700A5CEFF00ADD6FF00ADD6FF005A7BBD007BADDE009CC6FF009CCE
      FF006B94CE004263A500395A9400526B9C004A63840094949400FF00FF009C6B
      6B00949CBD009CC6FF009CB5E7008C636B0029317300184AAD00739CDE006394
      D600184AA500184294001839730018315A000010290094949400FF00FF00A55A
      5A00A55A4A00A5949C00AD737300A5524A0073426300426BC6005284D6005284
      DE00527BCE005273B500526BA5005263840010183100DEDEDE00FF00FF00D6BD
      BD00BD7B6B00D69C8C00CE948C00C6948C00BD8484007B7BA5008CADE7009CB5
      EF009CB5E7009CADD60094A5C60031426300A5A5A500FF00FF00FF00FF00FF00
      FF00DEBDBD00CE9C9400E7BDBD00DEC6BD00CEA5A5008C5A5A00848CAD008CA5
      D6005A7BC6008494BD0073849C00D6D6D600FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00F7F7F700E7CECE00E7CECE00D6C6C600EFEFEF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = ibeaBuscaCliClick
  end
  object ibeaSair: TSpeedButton
    Left = 713
    Top = 7
    Width = 70
    Height = 34
    Caption = '&Sair'
    Flat = True
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E
      1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B
      8C4B4B914B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B89
      4B4B9C4B4CB64B4CBD4B4C9F4B4C4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B
      4B9A4D4EAF4E4FC14E4FC04D4EBF4C4DBF4C4D9F4B4C4E1E1F994B4B824B4B82
      4B4B824B4B824B4B824B4B824B4B824B4B824B4BFF00FFFF00FFFF00FFFF00FF
      FF00FF824B4BC55455C95455C75354C65253C55152C45051C24F50A04C4D4E1E
      1FFE8B8CFC9293FB9A9CFAA3A4F8AAABF7B1B1F7B5B6F7B5B6824B4BFF00FFFF
      00FFFF00FFFF00FFFF00FF824B4BCE5859CC5758CB5657CA5556C95455C75354
      C65253A34E4F4E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
      B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD15B5CD05A5BCF595ACE
      5859CC5758CB5657CA5556A550504E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C
      1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD55E
      5FD55E5FD45D5ED35C5DD15B5CD05A5BCF595AA651524E1E1F3F9E4C1EBC4C1E
      BC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
      FF00FF824B4BDA6364D96263D86062D75F60D55E5FD45D5ED35C5DA953544E1E
      1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF
      00FFFF00FFFF00FFFF00FF824B4BDE6667DD6566DC6465DA6364D96263D86062
      D75F60AB55554E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
      B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE2696AE16869E06768DE
      6667E06D6EE69091DC6465AC56574E1E1F58A55B1EBC4C1EBC4C1EBC4C1EBC4C
      1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE76D
      6EE66C6DE56B6CE36A6BEEA6A7FFFFFFEB9C9CAF58594E1E1FEECEAFB7EBAA5E
      D3775ED37745CA6745CA6745CA67F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
      FF00FF824B4BEB7072EA6F70E96E6FE76D6EF2A9AAFFFFFFEB9596B15A5A4E1E
      1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3D9F6BDD9F6BDF7B5B6824B4BFF00FFFF
      00FFFF00FFFF00FFFF00FF824B4BEF7475EE7374ED7273EB7072EA6F70EF9091
      E76D6EB25B5C4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
      B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF37778F37778F27677F0
      7576EF7475EE7374ED7273B55D5D4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
      FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF87B
      7DF77A7BF6797AF47879F37778F27677F07576B75F5F4E1E1FEECEAFFFFFD3FF
      FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
      FF00FF824B4BFC7F80FB7E7FFA7D7EF87B7DF77A7BF6797AF47879B860624E1E
      1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
      00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FE8081FC7F80FC7F80FB7E7F
      FA7D7EBB63634E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
      B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FF8182FF
      8182FF8182FE8081FE8081BD65654E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
      FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF77E
      7FFF8182FF8182FF8182FF8182FF8182FF8182BF66664E1E1FEECEAFFFFFD3FF
      FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
      FF00FF824B4B824B4BAF5E5FD56F70FF8182FF8182FF8182FF8182BF66664E1E
      1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B915152B66263EE7A7B
      FF8182BF66664E1E1F914B4B824B4B824B4B824B4B824B4B824B4B824B4B824B
      4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF824B4B824B4B9855559F58584E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = ibeaSairClick
  end
  object ibeaImprimirNF: TSpeedButton
    Left = 317
    Top = 362
    Width = 50
    Height = 31
    Flat = True
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF0000000000FF00FF0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF0000FFFFBF00FF
      FFBFFF00FFBFFF00FF00000000000000000000000000FF00FF0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007F7F7F007F7F7F3F7F7F
      7F3FFF00FF3FFF00FF0000000000FF00FF0000000000FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF00FF00FF000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FF00FF0000000000FF00FF0000000000FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00FF0000000000FF00FF000000000000000000FF00FF00FF00
      FF0000000000FFFFFF00FFFFFFBFFFFFFFBFFFFFFFBFFFFFFFBFFFFFFFBFFFFF
      FFBFFFFFFFBF000000BFFF00FF0000000000FF00FF0000000000FF00FF00FF00
      FF00FF00FF0000000000FFFFFF00000000BF0000000000000000000000000000
      0000FFFFFF00000000BF000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FFFFFF00FFFFFFBFFFFFFFBFFFFFFFBFFFFFFFBFFFFF
      FFBFFFFFFFBFFFFFFFBF000000BFFF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00000000BF00000000000000000000
      000000000000FFFFFF00000000BFFF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFFBFFFFFFFBFFFFFFFBFFFFF
      FFBFFFFFFFBFFFFFFFBFFFFFFFBF000000BFFF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = ibeaImprimirNFClick
  end
  object lbl_edtNumeroNF: TLabeledEdit
    Left = 8
    Top = 24
    Width = 81
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clInfoBk
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' da Nota'
    EditLabel.Color = clBtnFace
    EditLabel.ParentColor = False
    ReadOnly = True
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 56
    Width = 782
    Height = 218
    Caption = 'Informa'#231#245'es do Cliente e Nota Fiscal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbl_Cliente: TLabel
      Left = 221
      Top = 30
      Width = 122
      Height = 13
      Caption = 'Nome / Raz'#227'o Social'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_Natureza: TLabel
      Left = 10
      Top = 126
      Width = 84
      Height = 13
      Caption = 'Natureza/C'#243'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_CondPagto: TLabel
      Left = 206
      Top = 126
      Width = 71
      Height = 13
      Caption = 'Cond.Pagto.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_Transp: TLabel
      Left = 341
      Top = 126
      Width = 87
      Height = 13
      Caption = 'Transportadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_CodNatureza: TLabel
      Left = 96
      Top = 126
      Width = 97
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_Obs: TLabel
      Left = 238
      Top = 170
      Width = 27
      Height = 13
      Caption = 'Obs:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_edtCodCliente: TLabeledEdit
      Left = 8
      Top = 45
      Width = 68
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'd.Cliente'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object lbl_edtCnpjCpf: TLabeledEdit
      Left = 516
      Top = 45
      Width = 112
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'CNPJ / CPF'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object lbl_edtIE: TLabeledEdit
      Left = 634
      Top = 45
      Width = 143
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 13
      EditLabel.Height = 13
      EditLabel.Caption = 'IE'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object lbl_edtEnd: TLabeledEdit
      Left = 8
      Top = 88
      Width = 222
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Endere'#231'o'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object lbl_edtNumero: TLabeledEdit
      Left = 235
      Top = 88
      Width = 54
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#250'mero'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object lbl_edtUF: TLabeledEdit
      Left = 534
      Top = 88
      Width = 39
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 17
      EditLabel.Height = 13
      EditLabel.Caption = 'UF'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object lbl_edtBairro: TLabeledEdit
      Left = 360
      Top = 88
      Width = 168
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = 'Bairro'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object lbl_edtCep: TLabeledEdit
      Left = 295
      Top = 88
      Width = 59
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'Cep'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object cboCliente: TComboBox
      Left = 219
      Top = 45
      Width = 291
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 8
      OnClick = cboClienteClick
    end
    object lbl_edtDDD: TLabeledEdit
      Left = 81
      Top = 45
      Width = 40
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'DDD'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object lbl_edtTelefone: TLabeledEdit
      Left = 127
      Top = 45
      Width = 87
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Telefone'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnExit = lbl_edtTelefoneExit
      OnKeyPress = lbl_edtTelefoneKeyPress
    end
    object cboNatureza: TComboBox
      Left = 9
      Top = 142
      Width = 192
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 11
      OnClick = cboNaturezaClick
    end
    object cboCondPagto: TComboBox
      Left = 205
      Top = 142
      Width = 128
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 12
    end
    object cboTransportadora: TComboBox
      Left = 339
      Top = 142
      Width = 142
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 13
    end
    object lbl_edtFrete: TLabeledEdit
      Left = 486
      Top = 142
      Width = 47
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Frete'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object lbl_edtPeso: TLabeledEdit
      Left = 579
      Top = 88
      Width = 60
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Peso Liq.'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object lbl_edtICMS: TLabeledEdit
      Left = 11
      Top = 188
      Width = 54
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'ICMS'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object lbl_edtIPI: TLabeledEdit
      Left = 77
      Top = 188
      Width = 54
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 17
      EditLabel.Height = 13
      EditLabel.Caption = 'IPI'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
    object memoObs: TMemo
      Left = 268
      Top = 168
      Width = 290
      Height = 44
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 18
    end
    object lbl_edtEspecie: TLabeledEdit
      Left = 541
      Top = 142
      Width = 156
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Esp'#233'cie'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
    end
    object lbl_edtClassifFiscal: TLabeledEdit
      Left = 142
      Top = 188
      Width = 76
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 75
      EditLabel.Height = 13
      EditLabel.Caption = 'Classif.Fiscal'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
    end
    object lbl_edtVlrFrete: TLabeledEdit
      Left = 703
      Top = 142
      Width = 72
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 67
      EditLabel.Height = 13
      EditLabel.Caption = 'Vlr.do Frete'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
    end
    object lbl_edtPesoBruto: TLabeledEdit
      Left = 643
      Top = 88
      Width = 51
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = 'Peso B.'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
    end
    object lbl_edtQtdeItens: TLabeledEdit
      Left = 702
      Top = 88
      Width = 61
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = 'Qtde.Itens'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 280
    Width = 782
    Height = 74
    Caption = 'Lan'#231'amento de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl_Prod: TLabel
      Left = 165
      Top = 30
      Width = 150
      Height = 13
      Caption = 'Descri'#231#227'o do Produto - F7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ibeaIncluir: TSpeedButton
      Left = 726
      Top = 29
      Width = 45
      Height = 39
      Flat = True
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
      OnClick = ibeaIncluirClick
    end
    object lbl_edtCodBarras: TLabeledEdit
      Left = 8
      Top = 45
      Width = 84
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'd.de Barras'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = lbl_edtCodBarrasChange
      OnKeyPress = lbl_edtCodBarrasKeyPress
    end
    object lbl_edtQtde: TLabeledEdit
      Left = 401
      Top = 45
      Width = 42
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'Qtde.'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = lbl_edtQtdeExit
      OnKeyPress = lbl_edtQtdeKeyPress
    end
    object lbl_edtVlrUnitario: TLabeledEdit
      Left = 448
      Top = 45
      Width = 62
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = 'Vlr.Unit'#225'rio'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = lbl_edtVlrUnitarioKeyPress
    end
    object cboProd: TComboBox
      Left = 163
      Top = 45
      Width = 234
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      OnClick = cboProdClick
    end
    object lbl_edtRef: TLabeledEdit
      Left = 98
      Top = 45
      Width = 60
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 25
      EditLabel.Height = 13
      EditLabel.Caption = 'Ref.'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = lbl_edtRefExit
      OnKeyPress = lbl_edtRefKeyPress
    end
    object lbl_edtDesc: TLabeledEdit
      Left = 517
      Top = 45
      Width = 57
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Desconto'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnExit = lbl_edtDescExit
      OnKeyPress = lbl_edtDescKeyPress
    end
    object lbl_edtAcrescimo: TLabeledEdit
      Left = 580
      Top = 45
      Width = 57
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = 'Acr'#233'scimo'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnExit = lbl_edtAcrescimoExit
      OnKeyPress = lbl_edtAcrescimoKeyPress
    end
    object lbl_edtTotal: TLabeledEdit
      Left = 646
      Top = 45
      Width = 62
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = clInfoBk
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Vlr.Total'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
  end
  object dbgNotaFiscal: TDBGrid
    Left = 4
    Top = 399
    Width = 776
    Height = 164
    Cursor = crHandPoint
    BorderStyle = bsNone
    FixedColor = clInfoBk
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgNotaFiscalCellClick
  end
  object dtpDataEmissao: TDateTimePicker
    Left = 97
    Top = 24
    Width = 84
    Height = 21
    Date = 39310.017364189800000000
    Time = 39310.017364189800000000
    TabOrder = 4
  end
  object ckSaida: TCheckBox
    Left = 581
    Top = 23
    Width = 60
    Height = 17
    Caption = '&Sa'#237'da'
    TabOrder = 5
    OnClick = ckSaidaClick
  end
  object ckEntrada: TCheckBox
    Left = 637
    Top = 23
    Width = 60
    Height = 17
    Caption = '&Entrada'
    TabOrder = 6
    OnClick = ckEntradaClick
  end
  object lbl_edtTotalGeral: TLabeledEdit
    Left = 670
    Top = 368
    Width = 112
    Height = 25
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clInfoBk
    EditLabel.Width = 99
    EditLabel.Height = 20
    EditLabel.Caption = 'Total da Nota:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object lbl_edtTrazerNota: TLabeledEdit
    Left = 157
    Top = 372
    Width = 63
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 141
    EditLabel.Height = 13
    EditLabel.Caption = 'Trazer Nota por N'#250'mero:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 8
    OnKeyPress = lbl_edtTrazerNotaKeyPress
  end
  object dtpVcto: TDateTimePicker
    Left = 186
    Top = 23
    Width = 84
    Height = 21
    Date = 39310.017364189800000000
    Time = 39310.017364189800000000
    TabOrder = 9
  end
  object lbl_edtNNotaImprimir: TLabeledEdit
    Left = 229
    Top = 372
    Width = 63
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' da Nota'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnKeyPress = lbl_edtTrazerNotaKeyPress
  end
end
