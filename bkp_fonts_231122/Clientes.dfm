object frmClientes: TfrmClientes
  Left = 16
  Top = 25
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 539
  ClientWidth = 792
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 485
    Top = 104
    Width = 150
    Height = 13
    Caption = 'Formas de Abastecimento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pcCadastrodeclientes: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 324
    ActivePage = tbsDadoscadastrais
    Align = alTop
    MultiLine = True
    TabIndex = 0
    TabOrder = 0
    OnChange = pcCadastrodeclientesChange
    object tbsDadoscadastrais: TTabSheet
      Caption = 'Dados Cadastrais'
      object lblData: TLabel
        Left = 554
        Top = 27
        Width = 32
        Height = 13
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblRAtividade: TLabel
        Left = 562
        Top = 69
        Width = 112
        Height = 13
        Caption = 'Ramo de Atividade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 784
        Height = 28
        Align = alTop
        Picture.Data = {
          0954474946496D616765A507000047494638396120031E00E600000006557A7A
          7A1B26BBA6A6A6000CB6000BA5D8D8D800098B111CB5646CD73842C7020FBB00
          087B0613BC898989000CAD010EB63C47CE000A9C2B37CC4952D2242FC30F1CC4
          B0B0B0303AC50008730611AF000984525BD41924C60A17C0414BCE000A94242F
          CA6C74DB1B27C5C4C4C4303BCD999999101CBC00076B0914B7020DA5E2E2E209
          16C2565FD57980DD3943CF1320C53333CC2631C51F2AC7131FBD000762353FC7
          343FCE0B16AC1923B5424AD62129B54A5AD6040E9D1722BCB5B5B50A15B4101A
          A91021B50611A4020EAF2834CB212BBF4A53D35B64D6FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000021F9040514
          0049002C0000000020031E000007FF804982838485868788898A8B8C8D8E8F90
          9192939495969798999A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A9AAABACADAEAFB0
          B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0C1C2C3C4C5C6C7C8C9CACBCCCDCECFA8
          1C09482D1C471FD81F11DBDB2FDEDFE0E1E2E3E4E5E6E7E8E9EAEBECEDEEEFF0
          F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF00030ACC77A3A08D83083160302220078E
          042E444CE3C08102856C18B969DCC8B1A3C78F20438A1C49B2A4C9932853AA5C
          C9B2A5CB973063CA9C49B3A6CD9B3873EADCC9B3E6370540832A349223C81024
          2290583B12E145C11B25A24E984AB5AAD5AB58B36ADDCAB5ABD7AF60C38A1D4B
          B6ACD9B368D3AA5DCBB6ADDBB770FFE3CA9D4BB7AEDDBB668BE8DDBB57865F19
          15025730C210018E1E12A471F800756A88C733228F983CA283E5CB98336BDECC
          B9B3E7CFA0438B1E4DBAB4E9D3A853AB5ECDBAB5EBD7B063CB9E4DBBB6EDDBB8
          73EB6E0DA3378DDFC0690001A241050810475A50281122B2E5DE302C48B7E0A1
          BAF5EBD8B36BDFCEBDBBF7EFE0C38B1F4FBEBCF9F3E8D3AB5FCFBEBDFBF7F0E3
          CB9F4FBFBEFDFBF8F3B36FC0BF7F7F080042400411121C708045114CD00174D1
          59C7C283FE4528E184145668E1851866A8E1861C76E8E187208628E288249668
          E28928A6A8E28A2CB6E8E28B30C628A3890BD468A38D0112A0E38E0F1400C206
          1B7C40C10B2144271D76FEDDA8E4FF924C36E9E493504629E594545669E59558
          66A9E5965C76E9E597608629E698649669E69968A6A9E69A650608C18E043C20
          E7030532C040041F94300375D53DC8427F57BA29E8A084166AE8A18826AAE8A2
          8C36EAE8A390462AE9A494566AE9A59866AAE9A68636C9E9A7A0862AEAA8A496
          0A209C71CE49E70176BE90E00816F809288EA6D66AEBADB8E6AAEBAEBCF6EAEB
          AFC0062BECB094A29AAAAA05D4C980374574609D92831A2BEDB4D4566BEDB5D8
          66ABEDB6DC76EBEDB7E0862BEEB8E4966BEEB9E8A6ABEEBAECB6EBEEBBF0C62B
          2F9CAACA59C0BD126C60E70D111401430337BA39EFC004176CF0C10827ACF0C2
          0C37ECF0C310473C6DBDF5DE6BF1FF8F193060C30B32D000B0C0A8522CF2C824
          976CF2C928A7ACF2CA2CB7ECF2CB30C72CF3CC34D76CF3CD38E7ACF3CE3CF7EC
          F3CF40072DB4C81617EDE306196470500527D818F2D050472DF5D454576DF5D5
          5867ADF5D65C77EDF5C946878D71064335FD34D161A7ADF6DA6CB7EDF6DB70C7
          2DF7DC74D76DF7DD78E7ADF7DE7CF7EDF7DF80072EF8E084176EF8E18827CEB6
          04632B34420A6FEA48B1E294576EF9E59867AEF9E69C77EEF9E7A0872E3ADD12
          945E67D27EF9900211C8C26DFAEBB0C72EFBECB4D76EFBEDB8E7AEFBEEBCF7EE
          FBEFC0072FFCF0C4176FFCF1C827AFFCF2CC37EFFCF3D047DF3CAB2864401802
          1AD82BFB71DC77EFFDF7E0872FFEFFF8E4976FFEF9E8A7AFFEFAECB7EFFEFBF0
          C72FFFFCF4D76FFFFDF8E7AFFFFEFCF7EFFFFFFC3390000598811AA0A0213850
          41E94030C00300E981108CA0042748C10A5AF08218CCA00637C8C10E7AF08320
          0CA1084748C2129AF084284CA10A57C8C216BAF085308CA10C6708243B312003
          28A8410D1010841E1C475F36B461D28648C4221AF188484CA21297C8C4263AF1
          89508CA214A748C52A5AF18A58CCA216B7C8C52E7AF18B600CA318C748C6329A
          F18C4344410E0150031C0C8171020CA21CE748C73ADAF18E78CCA31EF7C8C73E
          FAF18F800CA4200749C8421AF290884CA42217C9C8463AF291908CA4242749C9
          203231871910840106E0800078F2FE93A00CA5284749CA529AF294A84CA52A57
          C9CA56BAF295B08CA52C6749CB5ADAF296B8CCA52E77C9CB5EFAF297C00CA630
          87B94A4D5EC0040E48A63297C9CC663AF399D08CA634A749CD6A5AF39AD8CCA6
          36B7C9CD6E7AF39BE00CA738C749CE729AF39CE84CA73AD7C9CE76BAD39A8258
          01092E30807ADAF39EF8CCA73EF7C9CF7EFAF39F000DA840074AD0821AF4A008
          4DA84217CAD0863AF4A1108DA844274AD18A5AF4A218CDA846053A881518E0A3
          200DA948474AD2929AF4A4284DA94A57CAD296BAF4A5308DA94C674AD39ADAF4
          A638CDA94E77CAD39EFAF4A7400DAA50874AD49642E3A8484DAA5297CAD4A63A
          F5A9508DAA54A74AD5AA5AF5AA03870804003B}
        Transparent = True
      end
      object lblDadoscliente: TLabel
        Left = 3
        Top = 5
        Width = 112
        Height = 16
        Caption = 'Dados do Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Image2: TImage
        Left = -1
        Top = 148
        Width = 800
        Height = 27
        Picture.Data = {
          0954474946496D616765A507000047494638396120031E00E600000006557A7A
          7A1B26BBA6A6A6000CB6000BA5D8D8D800098B111CB5646CD73842C7020FBB00
          087B0613BC898989000CAD010EB63C47CE000A9C2B37CC4952D2242FC30F1CC4
          B0B0B0303AC50008730611AF000984525BD41924C60A17C0414BCE000A94242F
          CA6C74DB1B27C5C4C4C4303BCD999999101CBC00076B0914B7020DA5E2E2E209
          16C2565FD57980DD3943CF1320C53333CC2631C51F2AC7131FBD000762353FC7
          343FCE0B16AC1923B5424AD62129B54A5AD6040E9D1722BCB5B5B50A15B4101A
          A91021B50611A4020EAF2834CB212BBF4A53D35B64D6FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000021F9040514
          0049002C0000000020031E000007FF804982838485868788898A8B8C8D8E8F90
          9192939495969798999A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A9AAABACADAEAFB0
          B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0C1C2C3C4C5C6C7C8C9CACBCCCDCECFA8
          1C09482D1C471FD81F11DBDB2FDEDFE0E1E2E3E4E5E6E7E8E9EAEBECEDEEEFF0
          F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF00030ACC77A3A08D83083160302220078E
          042E444CE3C08102856C18B969DCC8B1A3C78F20438A1C49B2A4C9932853AA5C
          C9B2A5CB973063CA9C49B3A6CD9B3873EADCC9B3E6370540832A349223C81024
          2290583B12E145C11B25A24E984AB5AAD5AB58B36ADDCAB5ABD7AF60C38A1D4B
          B6ACD9B368D3AA5DCBB6ADDBB770FFE3CA9D4BB7AEDDBB668BE8DDBB57865F19
          15025730C210018E1E12A471F800756A88C733228F983CA283E5CB98336BDECC
          B9B3E7CFA0438B1E4DBAB4E9D3A853AB5ECDBAB5EBD7B063CB9E4DBBB6EDDBB8
          73EB6E0DA3378DDFC0690001A241050810475A50281122B2E5DE302C48B7E0A1
          BAF5EBD8B36BDFCEBDBBF7EFE0C38B1F4FBEBCF9F3E8D3AB5FCFBEBDFBF7F0E3
          CB9F4FBFBEFDFBF8F3B36FC0BF7F7F080042400411121C708045114CD00174D1
          59C7C283FE4528E184145668E1851866A8E1861C76E8E187208628E288249668
          E28928A6A8E28A2CB6E8E28B30C628A3890BD468A38D0112A0E38E0F1400C206
          1B7C40C10B2144271D76FEDDA8E4FF924C36E9E493504629E594545669E59558
          66A9E5965C76E9E597608629E698649669E69968A6A9E69A650608C18E043C20
          E7030532C040041F94300375D53DC8427F57BA29E8A084166AE8A18826AAE8A2
          8C36EAE8A390462AE9A494566AE9A59866AAE9A68636C9E9A7A0862AEAA8A496
          0A209C71CE49E70176BE90E00816F809288EA6D66AEBADB8E6AAEBAEBCF6EAEB
          AFC0062BECB094A29AAAAA05D4C980374574609D92831A2BEDB4D4566BEDB5D8
          66ABEDB6DC76EBEDB7E0862BEEB8E4966BEEB9E8A6ABEEBAECB6EBEEBBF0C62B
          2F9CAACA59C0BD126C60E70D111401430337BA39EFC004176CF0C10827ACF0C2
          0C37ECF0C310473C6DBDF5DE6BF1FF8F193060C30B32D000B0C0A8522CF2C824
          976CF2C928A7ACF2CA2CB7ECF2CB30C72CF3CC34D76CF3CD38E7ACF3CE3CF7EC
          F3CF40072DB4C81617EDE306196470500527D818F2D050472DF5D454576DF5D5
          5867ADF5D65C77EDF5C946878D71064335FD34D161A7ADF6DA6CB7EDF6DB70C7
          2DF7DC74D76DF7DD78E7ADF7DE7CF7EDF7DF80072EF8E084176EF8E18827CEB6
          04632B34420A6FEA48B1E294576EF9E59867AEF9E69C77EEF9E7A0872E3ADD12
          945E67D27EF9900211C8C26DFAEBB0C72EFBECB4D76EFBEDB8E7AEFBEEBCF7EE
          FBEFC0072FFCF0C4176FFCF1C827AFFCF2CC37EFFCF3D047DF3CAB2864401802
          1AD82BFB71DC77EFFDF7E0872FFEFFF8E4976FFEF9E8A7AFFEFAECB7EFFEFBF0
          C72FFFFCF4D76FFFFDF8E7AFFFFEFCF7EFFFFFFC3390000598811AA0A0213850
          41E94030C00300E981108CA0042748C10A5AF08218CCA00637C8C10E7AF08320
          0CA1084748C2129AF084284CA10A57C8C216BAF085308CA10C6708243B312003
          28A8410D1010841E1C475F36B461D28648C4221AF188484CA21297C8C4263AF1
          89508CA214A748C52A5AF18A58CCA216B7C8C52E7AF18B600CA318C748C6329A
          F18C4344410E0150031C0C8171020CA21CE748C73ADAF18E78CCA31EF7C8C73E
          FAF18F800CA4200749C8421AF290884CA42217C9C8463AF291908CA4242749C9
          203231871910840106E0800078F2FE93A00CA5284749CA529AF294A84CA52A57
          C9CA56BAF295B08CA52C6749CB5ADAF296B8CCA52E77C9CB5EFAF297C00CA630
          87B94A4D5EC0040E48A63297C9CC663AF399D08CA634A749CD6A5AF39AD8CCA6
          36B7C9CD6E7AF39BE00CA738C749CE729AF39CE84CA73AD7C9CE76BAD39A8258
          01092E30807ADAF39EF8CCA73EF7C9CF7EFAF39F000DA840074AD0821AF4A008
          4DA84217CAD0863AF4A1108DA844274AD18A5AF4A218CDA846053A881518E0A3
          200DA948474AD2929AF4A4284DA94A57CAD296BAF4A5308DA94C674AD39ADAF4
          A638CDA94E77CAD39EFAF4A7400DAA50874AD49642E3A8484DAA5297CAD4A63A
          F5A9508DAA54A74AD5AA5AF5AA03870804003B}
        Transparent = True
      end
      object lblEndereco: TLabel
        Left = 3
        Top = 154
        Width = 64
        Height = 16
        Caption = 'Endereco:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_edtCodCliente: TLabeledEdit
        Left = 13
        Top = 45
        Width = 81
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'd. do Cliente:'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 0
      end
      object lbl_edtNomerazao: TLabeledEdit
        Left = 13
        Top = 85
        Width = 339
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 118
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome/Raz'#227'o Social:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 4
      end
      object lbl_edtNomeusual: TLabeledEdit
        Left = 369
        Top = 85
        Width = 176
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 74
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome Fantasia:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 5
      end
      object lbl_edtCnpj_cpf: TLabeledEdit
        Left = 14
        Top = 125
        Width = 124
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 56
        EditLabel.Height = 13
        EditLabel.Caption = 'CNPJ_CPF:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        MaxLength = 18
        TabOrder = 7
        OnExit = lbl_edtCnpj_cpfExit
      end
      object lbl_edtIE_rg: TLabeledEdit
        Left = 152
        Top = 125
        Width = 124
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = 'IE_RG:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        MaxLength = 20
        TabOrder = 8
      end
      object lbl_edtContato: TLabeledEdit
        Left = 626
        Top = 125
        Width = 143
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'Contato:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 11
      end
      object lbl_edtSite: TLabeledEdit
        Left = 290
        Top = 125
        Width = 180
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = 'WebSite (Comercial):'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 9
      end
      object lbl_edtEmail: TLabeledEdit
        Left = 483
        Top = 125
        Width = 128
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 87
        EditLabel.Height = 13
        EditLabel.Caption = 'E-Mail (Comercial):'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 10
      end
      object lbl_edtEndereco: TLabeledEdit
        Left = 16
        Top = 192
        Width = 280
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 12
        OnExit = lbl_edtEnderecoExit
      end
      object lbl_edtBairro: TLabeledEdit
        Left = 487
        Top = 191
        Width = 195
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 15
      end
      object lbl_edtCep: TLabeledEdit
        Left = 697
        Top = 192
        Width = 76
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'Cep:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 16
        OnChange = lbl_edtCepChange
        OnExit = lbl_edtCepExit
      end
      object lbl_edtCidade: TLabeledEdit
        Left = 16
        Top = 233
        Width = 234
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 17
      end
      object lbl_edtEstado: TLabeledEdit
        Left = 274
        Top = 233
        Width = 45
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Estado:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        MaxLength = 2
        TabOrder = 18
      end
      object lbl_edtTelCom: TLabeledEdit
        Left = 393
        Top = 233
        Width = 99
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'Tel. Comercial:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 20
        OnExit = lbl_edtTelComExit
      end
      object lbl_edtTelFax: TLabeledEdit
        Left = 563
        Top = 233
        Width = 99
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 41
        EditLabel.Height = 13
        EditLabel.Caption = 'Tel. Fax:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 22
        OnExit = lbl_edtTelFaxExit
      end
      object lbl_edtCelular: TLabeledEdit
        Left = 676
        Top = 233
        Width = 99
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 56
        EditLabel.Height = 13
        EditLabel.Caption = 'Tel. Celular:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 23
        OnExit = lbl_edtCelularExit
      end
      object lbl_edtIcm: TLabeledEdit
        Left = 443
        Top = 44
        Width = 55
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = 'ICMS %:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        MaxLength = 2
        TabOrder = 2
      end
      object dtpDataCli: TmxFlatDateTimePicker
        Left = 553
        Top = 41
        Width = 83
        Height = 21
        Cursor = crHandPoint
        CalAlignment = dtaLeft
        Date = 38296.4262078009
        Time = 38296.4262078009
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 3
        Activate = True
        BorderColor = clBtnShadow
        Flat = True
        ShowBorder = True
        Version = '1.26'
      end
      object rdgrTipodecliente: TRadioGroup
        Left = 113
        Top = 26
        Width = 240
        Height = 41
        BiDiMode = bdLeftToRight
        Caption = 'Tipo de Cliente:'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Pessoa F'#237'sica                                         '
          'Pessoa Jur'#237'dica')
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        OnClick = rdgrTipodeclienteClick
      end
      object lbl_edtNumero: TLabeledEdit
        Left = 315
        Top = 192
        Width = 55
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 13
      end
      object lbl_edtComplemento: TLabeledEdit
        Left = 385
        Top = 192
        Width = 89
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'Compl:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 14
      end
      object lbl_edtPontoreferencia: TLabeledEdit
        Left = 18
        Top = 272
        Width = 234
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 101
        EditLabel.Height = 13
        EditLabel.Caption = 'Ponto de Referencia:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 24
      end
      object lbl_edtObs: TLabeledEdit
        Left = 273
        Top = 272
        Width = 501
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'Observa'#231#227'o:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clRed
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 25
      end
      object lbl_edtDDD: TLabeledEdit
        Left = 334
        Top = 233
        Width = 45
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'DDD:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        MaxLength = 3
        TabOrder = 19
      end
      object lbl_edtDDDFax: TLabeledEdit
        Left = 504
        Top = 233
        Width = 45
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'DDD:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        MaxLength = 3
        TabOrder = 21
      end
      object cboRamoativ: TComboBox
        Left = 558
        Top = 84
        Width = 207
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 6
      end
    end
    object tbsHistorico: TTabSheet
      Caption = 'Hist'#243'rico'
      Enabled = False
      ImageIndex = 3
      object Image7: TImage
        Left = 0
        Top = 0
        Width = 784
        Height = 28
        Align = alTop
        Picture.Data = {
          0954474946496D616765A507000047494638396120031E00E600000006557A7A
          7A1B26BBA6A6A6000CB6000BA5D8D8D800098B111CB5646CD73842C7020FBB00
          087B0613BC898989000CAD010EB63C47CE000A9C2B37CC4952D2242FC30F1CC4
          B0B0B0303AC50008730611AF000984525BD41924C60A17C0414BCE000A94242F
          CA6C74DB1B27C5C4C4C4303BCD999999101CBC00076B0914B7020DA5E2E2E209
          16C2565FD57980DD3943CF1320C53333CC2631C51F2AC7131FBD000762353FC7
          343FCE0B16AC1923B5424AD62129B54A5AD6040E9D1722BCB5B5B50A15B4101A
          A91021B50611A4020EAF2834CB212BBF4A53D35B64D6FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000021F9040514
          0049002C0000000020031E000007FF804982838485868788898A8B8C8D8E8F90
          9192939495969798999A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A9AAABACADAEAFB0
          B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0C1C2C3C4C5C6C7C8C9CACBCCCDCECFA8
          1C09482D1C471FD81F11DBDB2FDEDFE0E1E2E3E4E5E6E7E8E9EAEBECEDEEEFF0
          F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF00030ACC77A3A08D83083160302220078E
          042E444CE3C08102856C18B969DCC8B1A3C78F20438A1C49B2A4C9932853AA5C
          C9B2A5CB973063CA9C49B3A6CD9B3873EADCC9B3E6370540832A349223C81024
          2290583B12E145C11B25A24E984AB5AAD5AB58B36ADDCAB5ABD7AF60C38A1D4B
          B6ACD9B368D3AA5DCBB6ADDBB770FFE3CA9D4BB7AEDDBB668BE8DDBB57865F19
          15025730C210018E1E12A471F800756A88C733228F983CA283E5CB98336BDECC
          B9B3E7CFA0438B1E4DBAB4E9D3A853AB5ECDBAB5EBD7B063CB9E4DBBB6EDDBB8
          73EB6E0DA3378DDFC0690001A241050810475A50281122B2E5DE302C48B7E0A1
          BAF5EBD8B36BDFCEBDBBF7EFE0C38B1F4FBEBCF9F3E8D3AB5FCFBEBDFBF7F0E3
          CB9F4FBFBEFDFBF8F3B36FC0BF7F7F080042400411121C708045114CD00174D1
          59C7C283FE4528E184145668E1851866A8E1861C76E8E187208628E288249668
          E28928A6A8E28A2CB6E8E28B30C628A3890BD468A38D0112A0E38E0F1400C206
          1B7C40C10B2144271D76FEDDA8E4FF924C36E9E493504629E594545669E59558
          66A9E5965C76E9E597608629E698649669E69968A6A9E69A650608C18E043C20
          E7030532C040041F94300375D53DC8427F57BA29E8A084166AE8A18826AAE8A2
          8C36EAE8A390462AE9A494566AE9A59866AAE9A68636C9E9A7A0862AEAA8A496
          0A209C71CE49E70176BE90E00816F809288EA6D66AEBADB8E6AAEBAEBCF6EAEB
          AFC0062BECB094A29AAAAA05D4C980374574609D92831A2BEDB4D4566BEDB5D8
          66ABEDB6DC76EBEDB7E0862BEEB8E4966BEEB9E8A6ABEEBAECB6EBEEBBF0C62B
          2F9CAACA59C0BD126C60E70D111401430337BA39EFC004176CF0C10827ACF0C2
          0C37ECF0C310473C6DBDF5DE6BF1FF8F193060C30B32D000B0C0A8522CF2C824
          976CF2C928A7ACF2CA2CB7ECF2CB30C72CF3CC34D76CF3CD38E7ACF3CE3CF7EC
          F3CF40072DB4C81617EDE306196470500527D818F2D050472DF5D454576DF5D5
          5867ADF5D65C77EDF5C946878D71064335FD34D161A7ADF6DA6CB7EDF6DB70C7
          2DF7DC74D76DF7DD78E7ADF7DE7CF7EDF7DF80072EF8E084176EF8E18827CEB6
          04632B34420A6FEA48B1E294576EF9E59867AEF9E69C77EEF9E7A0872E3ADD12
          945E67D27EF9900211C8C26DFAEBB0C72EFBECB4D76EFBEDB8E7AEFBEEBCF7EE
          FBEFC0072FFCF0C4176FFCF1C827AFFCF2CC37EFFCF3D047DF3CAB2864401802
          1AD82BFB71DC77EFFDF7E0872FFEFFF8E4976FFEF9E8A7AFFEFAECB7EFFEFBF0
          C72FFFFCF4D76FFFFDF8E7AFFFFEFCF7EFFFFFFC3390000598811AA0A0213850
          41E94030C00300E981108CA0042748C10A5AF08218CCA00637C8C10E7AF08320
          0CA1084748C2129AF084284CA10A57C8C216BAF085308CA10C6708243B312003
          28A8410D1010841E1C475F36B461D28648C4221AF188484CA21297C8C4263AF1
          89508CA214A748C52A5AF18A58CCA216B7C8C52E7AF18B600CA318C748C6329A
          F18C4344410E0150031C0C8171020CA21CE748C73ADAF18E78CCA31EF7C8C73E
          FAF18F800CA4200749C8421AF290884CA42217C9C8463AF291908CA4242749C9
          203231871910840106E0800078F2FE93A00CA5284749CA529AF294A84CA52A57
          C9CA56BAF295B08CA52C6749CB5ADAF296B8CCA52E77C9CB5EFAF297C00CA630
          87B94A4D5EC0040E48A63297C9CC663AF399D08CA634A749CD6A5AF39AD8CCA6
          36B7C9CD6E7AF39BE00CA738C749CE729AF39CE84CA73AD7C9CE76BAD39A8258
          01092E30807ADAF39EF8CCA73EF7C9CF7EFAF39F000DA840074AD0821AF4A008
          4DA84217CAD0863AF4A1108DA844274AD18A5AF4A218CDA846053A881518E0A3
          200DA948474AD2929AF4A4284DA94A57CAD296BAF4A5308DA94C674AD39ADAF4
          A638CDA94E77CAD39EFAF4A7400DAA50874AD49642E3A8484DAA5297CAD4A63A
          F5A9508DAA54A74AD5AA5AF5AA03870804003B}
        Transparent = True
      end
      object Label5: TLabel
        Left = 4
        Top = 5
        Width = 318
        Height = 16
        Caption = 'Hist'#243'rico - '#218'ltimos Lan'#231'amentos / Valor Pendente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbgHistorico: TDBGrid
        Left = 1
        Top = 81
        Width = 779
        Height = 172
        BorderStyle = bsNone
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object mxFlatPanel2: TmxFlatPanel
        Left = 11
        Top = 34
        Width = 763
        Height = 29
        BevelOuter = bvNone
        BorderWidth = 2
        Caption = ' '
        TabOrder = 1
        Activate = False
        BorderColor = clBtnShadow
        Flat = True
        ShowBorder = True
        Version = '1.26'
        object lbl_TracoHistorico: TLabel
          Left = 79
          Top = 2
          Width = 16
          Height = 24
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_edtCliHistorico: TLabel
          Left = 96
          Top = 3
          Width = 495
          Height = 24
          AutoSize = False
          Caption = '     '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 3
          Top = 3
          Width = 78
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object tbsAdicionaispista: TTabSheet
      Caption = 'Adicionais de Pista'
      ImageIndex = 1
      object Image3: TImage
        Left = 0
        Top = 0
        Width = 784
        Height = 28
        Align = alTop
        Picture.Data = {
          0954474946496D616765A507000047494638396120031E00E600000006557A7A
          7A1B26BBA6A6A6000CB6000BA5D8D8D800098B111CB5646CD73842C7020FBB00
          087B0613BC898989000CAD010EB63C47CE000A9C2B37CC4952D2242FC30F1CC4
          B0B0B0303AC50008730611AF000984525BD41924C60A17C0414BCE000A94242F
          CA6C74DB1B27C5C4C4C4303BCD999999101CBC00076B0914B7020DA5E2E2E209
          16C2565FD57980DD3943CF1320C53333CC2631C51F2AC7131FBD000762353FC7
          343FCE0B16AC1923B5424AD62129B54A5AD6040E9D1722BCB5B5B50A15B4101A
          A91021B50611A4020EAF2834CB212BBF4A53D35B64D6FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000021F9040514
          0049002C0000000020031E000007FF804982838485868788898A8B8C8D8E8F90
          9192939495969798999A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A9AAABACADAEAFB0
          B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0C1C2C3C4C5C6C7C8C9CACBCCCDCECFA8
          1C09482D1C471FD81F11DBDB2FDEDFE0E1E2E3E4E5E6E7E8E9EAEBECEDEEEFF0
          F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF00030ACC77A3A08D83083160302220078E
          042E444CE3C08102856C18B969DCC8B1A3C78F20438A1C49B2A4C9932853AA5C
          C9B2A5CB973063CA9C49B3A6CD9B3873EADCC9B3E6370540832A349223C81024
          2290583B12E145C11B25A24E984AB5AAD5AB58B36ADDCAB5ABD7AF60C38A1D4B
          B6ACD9B368D3AA5DCBB6ADDBB770FFE3CA9D4BB7AEDDBB668BE8DDBB57865F19
          15025730C210018E1E12A471F800756A88C733228F983CA283E5CB98336BDECC
          B9B3E7CFA0438B1E4DBAB4E9D3A853AB5ECDBAB5EBD7B063CB9E4DBBB6EDDBB8
          73EB6E0DA3378DDFC0690001A241050810475A50281122B2E5DE302C48B7E0A1
          BAF5EBD8B36BDFCEBDBBF7EFE0C38B1F4FBEBCF9F3E8D3AB5FCFBEBDFBF7F0E3
          CB9F4FBFBEFDFBF8F3B36FC0BF7F7F080042400411121C708045114CD00174D1
          59C7C283FE4528E184145668E1851866A8E1861C76E8E187208628E288249668
          E28928A6A8E28A2CB6E8E28B30C628A3890BD468A38D0112A0E38E0F1400C206
          1B7C40C10B2144271D76FEDDA8E4FF924C36E9E493504629E594545669E59558
          66A9E5965C76E9E597608629E698649669E69968A6A9E69A650608C18E043C20
          E7030532C040041F94300375D53DC8427F57BA29E8A084166AE8A18826AAE8A2
          8C36EAE8A390462AE9A494566AE9A59866AAE9A68636C9E9A7A0862AEAA8A496
          0A209C71CE49E70176BE90E00816F809288EA6D66AEBADB8E6AAEBAEBCF6EAEB
          AFC0062BECB094A29AAAAA05D4C980374574609D92831A2BEDB4D4566BEDB5D8
          66ABEDB6DC76EBEDB7E0862BEEB8E4966BEEB9E8A6ABEEBAECB6EBEEBBF0C62B
          2F9CAACA59C0BD126C60E70D111401430337BA39EFC004176CF0C10827ACF0C2
          0C37ECF0C310473C6DBDF5DE6BF1FF8F193060C30B32D000B0C0A8522CF2C824
          976CF2C928A7ACF2CA2CB7ECF2CB30C72CF3CC34D76CF3CD38E7ACF3CE3CF7EC
          F3CF40072DB4C81617EDE306196470500527D818F2D050472DF5D454576DF5D5
          5867ADF5D65C77EDF5C946878D71064335FD34D161A7ADF6DA6CB7EDF6DB70C7
          2DF7DC74D76DF7DD78E7ADF7DE7CF7EDF7DF80072EF8E084176EF8E18827CEB6
          04632B34420A6FEA48B1E294576EF9E59867AEF9E69C77EEF9E7A0872E3ADD12
          945E67D27EF9900211C8C26DFAEBB0C72EFBECB4D76EFBEDB8E7AEFBEEBCF7EE
          FBEFC0072FFCF0C4176FFCF1C827AFFCF2CC37EFFCF3D047DF3CAB2864401802
          1AD82BFB71DC77EFFDF7E0872FFEFFF8E4976FFEF9E8A7AFFEFAECB7EFFEFBF0
          C72FFFFCF4D76FFFFDF8E7AFFFFEFCF7EFFFFFFC3390000598811AA0A0213850
          41E94030C00300E981108CA0042748C10A5AF08218CCA00637C8C10E7AF08320
          0CA1084748C2129AF084284CA10A57C8C216BAF085308CA10C6708243B312003
          28A8410D1010841E1C475F36B461D28648C4221AF188484CA21297C8C4263AF1
          89508CA214A748C52A5AF18A58CCA216B7C8C52E7AF18B600CA318C748C6329A
          F18C4344410E0150031C0C8171020CA21CE748C73ADAF18E78CCA31EF7C8C73E
          FAF18F800CA4200749C8421AF290884CA42217C9C8463AF291908CA4242749C9
          203231871910840106E0800078F2FE93A00CA5284749CA529AF294A84CA52A57
          C9CA56BAF295B08CA52C6749CB5ADAF296B8CCA52E77C9CB5EFAF297C00CA630
          87B94A4D5EC0040E48A63297C9CC663AF399D08CA634A749CD6A5AF39AD8CCA6
          36B7C9CD6E7AF39BE00CA738C749CE729AF39CE84CA73AD7C9CE76BAD39A8258
          01092E30807ADAF39EF8CCA73EF7C9CF7EFAF39F000DA840074AD0821AF4A008
          4DA84217CAD0863AF4A1108DA844274AD18A5AF4A218CDA846053A881518E0A3
          200DA948474AD2929AF4A4284DA94A57CAD296BAF4A5308DA94C674AD39ADAF4
          A638CDA94E77CAD39EFAF4A7400DAA50874AD49642E3A8484DAA5297CAD4A63A
          F5A9508DAA54A74AD5AA5AF5AA03870804003B}
        Transparent = True
      end
      object Label1: TLabel
        Left = 2
        Top = 5
        Width = 162
        Height = 16
        Caption = 'Dados de Adicional Pista:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object GroupBox2: TGroupBox
        Left = 10
        Top = 64
        Width = 765
        Height = 232
        TabOrder = 0
        object Image4: TImage
          Left = 2
          Top = 86
          Width = 761
          Height = 28
          Picture.Data = {
            0954474946496D616765A507000047494638396120031E00E600000006557A7A
            7A1B26BBA6A6A6000CB6000BA5D8D8D800098B111CB5646CD73842C7020FBB00
            087B0613BC898989000CAD010EB63C47CE000A9C2B37CC4952D2242FC30F1CC4
            B0B0B0303AC50008730611AF000984525BD41924C60A17C0414BCE000A94242F
            CA6C74DB1B27C5C4C4C4303BCD999999101CBC00076B0914B7020DA5E2E2E209
            16C2565FD57980DD3943CF1320C53333CC2631C51F2AC7131FBD000762353FC7
            343FCE0B16AC1923B5424AD62129B54A5AD6040E9D1722BCB5B5B50A15B4101A
            A91021B50611A4020EAF2834CB212BBF4A53D35B64D6FFFFFF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000021F9040514
            0049002C0000000020031E000007FF804982838485868788898A8B8C8D8E8F90
            9192939495969798999A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A9AAABACADAEAFB0
            B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0C1C2C3C4C5C6C7C8C9CACBCCCDCECFA8
            1C09482D1C471FD81F11DBDB2FDEDFE0E1E2E3E4E5E6E7E8E9EAEBECEDEEEFF0
            F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF00030ACC77A3A08D83083160302220078E
            042E444CE3C08102856C18B969DCC8B1A3C78F20438A1C49B2A4C9932853AA5C
            C9B2A5CB973063CA9C49B3A6CD9B3873EADCC9B3E6370540832A349223C81024
            2290583B12E145C11B25A24E984AB5AAD5AB58B36ADDCAB5ABD7AF60C38A1D4B
            B6ACD9B368D3AA5DCBB6ADDBB770FFE3CA9D4BB7AEDDBB668BE8DDBB57865F19
            15025730C210018E1E12A471F800756A88C733228F983CA283E5CB98336BDECC
            B9B3E7CFA0438B1E4DBAB4E9D3A853AB5ECDBAB5EBD7B063CB9E4DBBB6EDDBB8
            73EB6E0DA3378DDFC0690001A241050810475A50281122B2E5DE302C48B7E0A1
            BAF5EBD8B36BDFCEBDBBF7EFE0C38B1F4FBEBCF9F3E8D3AB5FCFBEBDFBF7F0E3
            CB9F4FBFBEFDFBF8F3B36FC0BF7F7F080042400411121C708045114CD00174D1
            59C7C283FE4528E184145668E1851866A8E1861C76E8E187208628E288249668
            E28928A6A8E28A2CB6E8E28B30C628A3890BD468A38D0112A0E38E0F1400C206
            1B7C40C10B2144271D76FEDDA8E4FF924C36E9E493504629E594545669E59558
            66A9E5965C76E9E597608629E698649669E69968A6A9E69A650608C18E043C20
            E7030532C040041F94300375D53DC8427F57BA29E8A084166AE8A18826AAE8A2
            8C36EAE8A390462AE9A494566AE9A59866AAE9A68636C9E9A7A0862AEAA8A496
            0A209C71CE49E70176BE90E00816F809288EA6D66AEBADB8E6AAEBAEBCF6EAEB
            AFC0062BECB094A29AAAAA05D4C980374574609D92831A2BEDB4D4566BEDB5D8
            66ABEDB6DC76EBEDB7E0862BEEB8E4966BEEB9E8A6ABEEBAECB6EBEEBBF0C62B
            2F9CAACA59C0BD126C60E70D111401430337BA39EFC004176CF0C10827ACF0C2
            0C37ECF0C310473C6DBDF5DE6BF1FF8F193060C30B32D000B0C0A8522CF2C824
            976CF2C928A7ACF2CA2CB7ECF2CB30C72CF3CC34D76CF3CD38E7ACF3CE3CF7EC
            F3CF40072DB4C81617EDE306196470500527D818F2D050472DF5D454576DF5D5
            5867ADF5D65C77EDF5C946878D71064335FD34D161A7ADF6DA6CB7EDF6DB70C7
            2DF7DC74D76DF7DD78E7ADF7DE7CF7EDF7DF80072EF8E084176EF8E18827CEB6
            04632B34420A6FEA48B1E294576EF9E59867AEF9E69C77EEF9E7A0872E3ADD12
            945E67D27EF9900211C8C26DFAEBB0C72EFBECB4D76EFBEDB8E7AEFBEEBCF7EE
            FBEFC0072FFCF0C4176FFCF1C827AFFCF2CC37EFFCF3D047DF3CAB2864401802
            1AD82BFB71DC77EFFDF7E0872FFEFFF8E4976FFEF9E8A7AFFEFAECB7EFFEFBF0
            C72FFFFCF4D76FFFFDF8E7AFFFFEFCF7EFFFFFFC3390000598811AA0A0213850
            41E94030C00300E981108CA0042748C10A5AF08218CCA00637C8C10E7AF08320
            0CA1084748C2129AF084284CA10A57C8C216BAF085308CA10C6708243B312003
            28A8410D1010841E1C475F36B461D28648C4221AF188484CA21297C8C4263AF1
            89508CA214A748C52A5AF18A58CCA216B7C8C52E7AF18B600CA318C748C6329A
            F18C4344410E0150031C0C8171020CA21CE748C73ADAF18E78CCA31EF7C8C73E
            FAF18F800CA4200749C8421AF290884CA42217C9C8463AF291908CA4242749C9
            203231871910840106E0800078F2FE93A00CA5284749CA529AF294A84CA52A57
            C9CA56BAF295B08CA52C6749CB5ADAF296B8CCA52E77C9CB5EFAF297C00CA630
            87B94A4D5EC0040E48A63297C9CC663AF399D08CA634A749CD6A5AF39AD8CCA6
            36B7C9CD6E7AF39BE00CA738C749CE729AF39CE84CA73AD7C9CE76BAD39A8258
            01092E30807ADAF39EF8CCA73EF7C9CF7EFAF39F000DA840074AD0821AF4A008
            4DA84217CAD0863AF4A1108DA844274AD18A5AF4A218CDA846053A881518E0A3
            200DA948474AD2929AF4A4284DA94A57CAD296BAF4A5308DA94C674AD39ADAF4
            A638CDA94E77CAD39EFAF4A7400DAA50874AD49642E3A8484DAA5297CAD4A63A
            F5A9508DAA54A74AD5AA5AF5AA03870804003B}
          Transparent = True
        end
        object lbl_Produto: TLabel
          Left = 287
          Top = 49
          Width = 93
          Height = 13
          Caption = 'Produto Autorizado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 569
          Top = 49
          Width = 99
          Height = 13
          Caption = 'Condi'#231#245'es de Pagto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 7
          Top = 91
          Width = 139
          Height = 16
          Caption = 'Detalhe dos Produtos:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblFuncionario: TLabel
          Left = 15
          Top = 10
          Width = 58
          Height = 13
          Caption = 'Funcion'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 14
          Top = 50
          Width = 32
          Height = 13
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_TipoProd: TLabel
          Left = 108
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_edtVeiculo: TLabeledEdit
          Left = 221
          Top = 25
          Width = 187
          Height = 19
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 40
          EditLabel.Height = 13
          EditLabel.Caption = 'Ve'#237'culo:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 0
        end
        object lbl_edtPlaca: TLabeledEdit
          Left = 419
          Top = 25
          Width = 90
          Height = 19
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 30
          EditLabel.Height = 13
          EditLabel.Caption = 'Placa:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 1
        end
        object lbl_edtCidadecliente: TLabeledEdit
          Left = 521
          Top = 25
          Width = 180
          Height = 19
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Cidade:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 2
        end
        object lbl_edtEstadocliente: TLabeledEdit
          Left = 711
          Top = 25
          Width = 38
          Height = 19
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Estado:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 3
        end
        object ibeaIncluir: TIBEAntialiasButton
          Left = 685
          Top = 52
          Width = 65
          Height = 33
          Caption = ' &Novo'
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
          Properties.Disabled.Border = clBtnHighlight
          Properties.Disabled.Color = clBtnShadow
          Properties.Disabled.Font.Charset = DEFAULT_CHARSET
          Properties.Disabled.Font.Color = clCaptionText
          Properties.Disabled.Font.Height = -11
          Properties.Disabled.Font.Name = 'MS Sans Serif'
          Properties.Disabled.Font.Style = []
          Properties.FocusColor = clBtnShadow
          Properties.MouseAway.Border = clBtnShadow
          Properties.MouseAway.Color = clBtnFace
          Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
          Properties.MouseAway.Font.Color = clBtnText
          Properties.MouseAway.Font.Height = -11
          Properties.MouseAway.Font.Name = 'MS Sans Serif'
          Properties.MouseAway.Font.Style = []
          Properties.MouseDown.Border = clBtnShadow
          Properties.MouseDown.Color = clBtnFace
          Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
          Properties.MouseDown.Font.Color = clBtnText
          Properties.MouseDown.Font.Height = -11
          Properties.MouseDown.Font.Name = 'MS Sans Serif'
          Properties.MouseDown.Font.Style = []
          Properties.MouseUp.Border = clBtnShadow
          Properties.MouseUp.Color = clBtnHighlight
          Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
          Properties.MouseUp.Font.Color = clBtnText
          Properties.MouseUp.Font.Height = -11
          Properties.MouseUp.Font.Name = 'MS Sans Serif'
          Properties.MouseUp.Font.Style = []
          TabStop = True
          TabOrder = 5
          OnClick = ibeaIncluirClick
        end
        object cboCondpagto: TComboBox
          Left = 568
          Top = 64
          Width = 109
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          ItemHeight = 0
          TabOrder = 4
        end
        object dbgDetalheprod: TDBGrid
          Left = 5
          Top = 115
          Width = 754
          Height = 112
          Cursor = crHandPoint
          BorderStyle = bsNone
          DataSource = dmModule.dtsAdicionalPista
          Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dbgDetalheprodCellClick
        end
        object cboProduto: TComboBox
          Left = 287
          Top = 64
          Width = 216
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          ItemHeight = 0
          TabOrder = 7
        end
        object dtpDataAd: TmxFlatDateTimePicker
          Left = 14
          Top = 64
          Width = 83
          Height = 21
          Cursor = crHandPoint
          CalAlignment = dtaLeft
          Date = 38296.4262078009
          Time = 38296.4262078009
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 8
          Activate = True
          BorderColor = clBtnShadow
          Flat = True
          ShowBorder = True
          Version = '1.26'
        end
        object cboTipoProd: TComboBox
          Left = 108
          Top = 64
          Width = 164
          Height = 21
          BevelKind = bkFlat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemHeight = 0
          ParentFont = False
          TabOrder = 9
          OnClick = cboTipoProdClick
        end
        object lbl_edtQtde: TLabeledEdit
          Left = 516
          Top = 65
          Width = 38
          Height = 19
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'Qtde'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 10
        end
        object cboFuncionario: TComboBox
          Left = 16
          Top = 24
          Width = 196
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          ItemHeight = 0
          TabOrder = 11
        end
      end
      object mxFlatPanel1: TmxFlatPanel
        Left = 11
        Top = 34
        Width = 763
        Height = 29
        BevelOuter = bvNone
        BorderWidth = 2
        Caption = ' '
        TabOrder = 1
        Activate = False
        BorderColor = clBtnShadow
        Flat = True
        ShowBorder = True
        Version = '1.26'
        object lblTracoAP: TLabel
          Left = 79
          Top = 2
          Width = 16
          Height = 24
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblClienteAP: TLabel
          Left = 96
          Top = 3
          Width = 495
          Height = 24
          AutoSize = False
          Caption = '     '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblCodCli: TLabel
          Left = 3
          Top = 3
          Width = 78
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object tbsCobrancafinanceiro: TTabSheet
      Caption = 'Cobran'#231'a e Financeiro'
      ImageIndex = 2
      TabVisible = False
      object Image5: TImage
        Left = 0
        Top = 0
        Width = 784
        Height = 25
        Align = alTop
        Picture.Data = {
          07544269746D617016C50000424D16C500000000000036000000280000002003
          0000150000000100180000000000E0C40000C40E0000C40E0000000000000000
          0000945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          53528C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202}
      end
      object Label2: TLabel
        Left = 10
        Top = 3
        Width = 191
        Height = 16
        Caption = 'Limite de Cr'#233'dito e Cobran'#231'a:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 62
        Top = 38
        Width = 116
        Height = 13
        Caption = 'Bloqueio de Cr'#233'dito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 491
        Top = 38
        Width = 114
        Height = 13
        Caption = 'Motivo do Bloqueio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image6: TImage
        Left = -16
        Top = 181
        Width = 800
        Height = 25
        Picture.Data = {
          07544269746D617016C50000424D16C500000000000036000000280000002003
          0000150000000100180000000000E0C40000C40E0000C40E0000000000000000
          0000945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B
          945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A
          5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B945A5B94
          5A5B965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755965755965755965755965755965755965755965755965755965755965755
          9657559657559657559657559657559657559657559657559657559657559657
          5596575596575596575596575596575596575596575596575596575596575596
          5755935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          53528C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041854041854041854041854041854041854041854041854041854041854041
          8540418540418540418540418540418540418540418540418540418540418540
          4185404185404185404185404185404185404185404185404185404185404185
          4041833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B
          8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C
          4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C4C4B8C
          4C4B935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352935352935352935352935352935352935352935352935352935352935352
          9353529353529353529353529353529353529353529353529353529353529353
          5293535293535293535293535293535293535293535293535293535293535293
          5352A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464
          A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A264
          64A26464A26464A26464A26464A26464A26464A26464A26464A26464A26464A2
          6464833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B
          833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A
          3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B833A3B83
          3A3B400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202400202400202400202400202400202400202400202400202400202400202
          4002024002024002024002024002024002024002024002024002024002024002
          0240020240020240020240020240020240020240020240020240020240020240
          0202}
      end
      object Label15: TLabel
        Left = 3
        Top = 185
        Width = 121
        Height = 16
        Caption = 'Dados Financeiros:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object cboBlocCred: TComboBox
        Left = 183
        Top = 36
        Width = 92
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        ItemHeight = 0
        TabOrder = 0
      end
      object lbl_edtLimite: TLabeledEdit
        Left = 338
        Top = 35
        Width = 121
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'Limite:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 1
      end
      object cboMotivo: TComboBox
        Left = 607
        Top = 36
        Width = 92
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        ItemHeight = 0
        TabOrder = 2
      end
      object GroupBox3: TGroupBox
        Left = 32
        Top = 63
        Width = 713
        Height = 117
        Caption = 'Local de  Cobran'#231'a:'
        TabOrder = 3
        object lbl_edtEnd: TLabeledEdit
          Left = 7
          Top = 39
          Width = 348
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Endere'#231'o:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 0
        end
        object lbl_edtBairrocobr: TLabeledEdit
          Left = 378
          Top = 39
          Width = 196
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 30
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 1
        end
        object lbl_edtCepcobr: TLabeledEdit
          Left = 590
          Top = 39
          Width = 111
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Cep:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 2
        end
        object lbl_edtCidadecobr: TLabeledEdit
          Left = 7
          Top = 82
          Width = 257
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Cidade:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 3
        end
        object lbl_edtEstCobr: TLabeledEdit
          Left = 288
          Top = 82
          Width = 49
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Estado:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 4
        end
        object lbl_edtTelcobr: TLabeledEdit
          Left = 355
          Top = 82
          Width = 129
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 45
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 5
        end
        object lbl_edtEmailcobr: TLabeledEdit
          Left = 504
          Top = 82
          Width = 197
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'E-mail:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 6
        end
      end
      object GroupBox4: TGroupBox
        Left = 34
        Top = 208
        Width = 713
        Height = 85
        Caption = 'Refer'#234'ncias Banc'#225'rias:'
        TabOrder = 4
        object lbl_edtBco1cobr: TLabeledEdit
          Left = 45
          Top = 19
          Width = 242
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'Banco:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 0
        end
        object lbl_edtAg1cobr: TLabeledEdit
          Left = 348
          Top = 19
          Width = 100
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'Ag'#234'ncia:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 1
        end
        object lbl_edtCccobr: TLabeledEdit
          Left = 544
          Top = 19
          Width = 156
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 74
          EditLabel.Height = 13
          EditLabel.Caption = 'Conta Corrente:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 2
        end
        object lbl_edtBco2cobr: TLabeledEdit
          Left = 45
          Top = 51
          Width = 242
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'Banco:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 3
        end
        object lbl_edtAg2cobr: TLabeledEdit
          Left = 348
          Top = 51
          Width = 100
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'Ag'#234'ncia:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 4
        end
        object lbl_edtCc2cobr: TLabeledEdit
          Left = 544
          Top = 51
          Width = 156
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditLabel.Width = 74
          EditLabel.Height = 13
          EditLabel.Caption = 'Conta Corrente:'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 5
        end
      end
    end
  end
  object ibeaNovo: TIBEAntialiasButton
    Left = 41
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&Novo'
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
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 3
    OnClick = ibeaNovoClick
  end
  object ibeaAlterar: TIBEAntialiasButton
    Left = 436
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&Alterar'
    Glyph.Data = {
      36010000424D3601000000000000760000002800000011000000100000000100
      040000000000C0000000C40E0000C40E00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      0000300000003333330FFFFFFFF03000000000300000FF0F00F070000000E00B
      FBFB0FFFFFF070000000E0BFBF000FFFF0F070000000E0FBFBFBF0F00FF07000
      0000E0BFBF00000B0FF070000000E0FBFBFBFBF0FFF070000000E0BF0000000F
      FFF070000000000BFB00B0FF00F0700000003330000B0FFFFFF0300000003333
      30B0FFFF00003000000033330B0FF00F0FF0300000003330B00FFFFF0F033000
      00003309030FFFFF003330000000333033000000033330000000}
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 4
    OnClick = ibeaAlterarClick
  end
  object ibeaExcluir: TIBEAntialiasButton
    Left = 515
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&Excluir'
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
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 9
    OnClick = ibeaExcluirClick
  end
  object ibeaPrimeiro: TIBEAntialiasButton
    Left = 120
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&Primeiro'
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 5
    OnClick = ibeaPrimeiroClick
  end
  object ibeaAnterior: TIBEAntialiasButton
    Left = 199
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&Anterior'
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 6
    OnClick = ibeaAnteriorClick
  end
  object ibeaProximo: TIBEAntialiasButton
    Left = 278
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&Pr'#243'ximo'
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 7
    OnClick = ibeaProximoClick
  end
  object ibeaUltimo: TIBEAntialiasButton
    Left = 357
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&'#218'ltimo'
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 8
    OnClick = ibeaUltimoClick
  end
  object ibeaSair: TIBEAntialiasButton
    Left = 673
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&Sair'
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
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 11
    OnClick = ibeaSairClick
  end
  object GroupBox1: TGroupBox
    Left = -1
    Top = 359
    Width = 800
    Height = 38
    TabOrder = 1
    object sb_ord_cod: TSpeedButton
      Left = 363
      Top = 11
      Width = 129
      Height = 22
      Cursor = crHandPoint
      Hint = 'Ordenar por C'#243'digo'
      Caption = 'Ordenar por C'#243'digo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
        F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
        F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
        F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
        F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
        F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sb_ord_codClick
    end
    object sb_ord_nome: TSpeedButton
      Left = 508
      Top = 11
      Width = 129
      Height = 22
      Cursor = crHandPoint
      Hint = 'Ordenar por Nome'
      Caption = 'Ordenar por Nomes'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333FFF33FFFFF33333300033000
        00333337773377777333333330333300033333337FF33777F333333330733300
        0333333377FFF777F33333333700000073333333777777773333333333033000
        3333333337FF777F333333333307300033333333377F777F3333333333703007
        33333333377F7773333333333330000333333333337777F33333333333300003
        33333333337777F3333333333337007333333333337777333333333333330033
        3333333333377333333333333333033333333333333733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sb_ord_nomeClick
    end
    object lbl_edtPesquisaCli: TLabeledEdit
      Left = 150
      Top = 12
      Width = 198
      Height = 19
      BevelInner = bvSpace
      BevelKind = bkFlat
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      EditLabel.Width = 140
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Pesquisa de Clientes: '
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clMaroon
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentBiDiMode = False
      TabOrder = 0
      OnChange = lbl_edtPesquisaCliChange
    end
  end
  object dbgClientes: TDBGrid
    Left = -1
    Top = 397
    Width = 794
    Height = 134
    Cursor = crHandPoint
    DataSource = dmModule.dtsCadastro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgClientesCellClick
  end
  object ibeaConsultar: TIBEAntialiasButton
    Left = 594
    Top = 327
    Width = 72
    Height = 31
    Cursor = crHandPoint
    Caption = '&Consultar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E000000000000000000000000008C8C8C
      5757577777770000000000000000000000000000000000000000000000000000
      00000000000000000000ABABAB737589AA878E5F5B5B77777700000000000000
      000000000000000000000000000000000000000000000000000089B0CA4088DF
      7376A8AD8A8D5F5B5B7777770000000000000000000000000000000000000000
      00000000000000000000BDE3FF53B8FF4385D97979A7AD8A8D5F5B5B77777700
      0000000000000000000000000000000000000000000000000000000000A5D8FF
      53B8FF4385D97979A7AD8A8D5F5B5B9696960000000000000000000000000000
      000000000000000000000000000000008DCDFF53B8FF4483D67979A7987D8281
      8181A1A1A16C6C6C5757575757576262628C8C8C000000000000000000000000
      0000008DCDFF53B8FF588CCF8C8C8C8B7574BC9A86CEB096E0C7AED2B4A48B75
      745757578C8C8C000000000000000000000000000000A5D8FFC9D0D4AD8A8DF1
      CFA9FFF5C3FFFED4FFFFDAFFFFDAF5EFE09F85815757578C8C8C000000000000
      000000000000000000E2CECEEFC9A6FFF5C3FFF5C3FFFFDAFFFEEAFFFFFCFFFF
      FCF3EDDA7B61616C6C6C000000000000000000000000000000E0BDB3FFF5C3FF
      E4B1FFF9C7FFFFDAFFFEEAFFFFFCFFFFF7FFFFDAB79E8C575757000000000000
      000000000000000000E5BEA5FFF5CAFFDEABFFF5C3FFFED4FFFFE6FFFEEAFFFF
      E6FFFFDACCB299575757000000000000000000000000000000E5BEA5FFF5CAFF
      E5B9FFEEBDFFFCCDFFFED4FFFFDAFFFFDAFFFED4CCAC936C6C6C000000000000
      000000000000000000E0C0B6FFF5CAFFF2D7FFE5B9FFF1BEFFF5C3FFF9C7FFF5
      C3FFF5C3B794818C8C8C000000000000000000000000000000DCC5C5EFDAC2FF
      FFFCFFF7EAFFEEBDFFDEABFFE4B1FFF1BEF3D2A8907676000000000000000000
      000000000000000000000000D8BCBAF1E5DDFFFEEAFFFCCDFFEEBDFFF5C3F5CF
      A4B9938A000000000000000000000000000000000000000000000000000000DC
      C5C5D2B19ECEA88EE0B89EDCB3A08C8C8C000000000000000000}
    Properties.Disabled.Border = clBtnHighlight
    Properties.Disabled.Color = clBtnShadow
    Properties.Disabled.Font.Charset = DEFAULT_CHARSET
    Properties.Disabled.Font.Color = clCaptionText
    Properties.Disabled.Font.Height = -11
    Properties.Disabled.Font.Name = 'MS Sans Serif'
    Properties.Disabled.Font.Style = []
    Properties.FocusColor = clBtnShadow
    Properties.MouseAway.Border = clBtnShadow
    Properties.MouseAway.Color = clBtnFace
    Properties.MouseAway.Font.Charset = DEFAULT_CHARSET
    Properties.MouseAway.Font.Color = clBtnText
    Properties.MouseAway.Font.Height = -11
    Properties.MouseAway.Font.Name = 'MS Sans Serif'
    Properties.MouseAway.Font.Style = []
    Properties.MouseDown.Border = clBtnShadow
    Properties.MouseDown.Color = clBtnFace
    Properties.MouseDown.Font.Charset = DEFAULT_CHARSET
    Properties.MouseDown.Font.Color = clBtnText
    Properties.MouseDown.Font.Height = -11
    Properties.MouseDown.Font.Name = 'MS Sans Serif'
    Properties.MouseDown.Font.Style = []
    Properties.MouseUp.Border = clBtnShadow
    Properties.MouseUp.Color = clBtnHighlight
    Properties.MouseUp.Font.Charset = DEFAULT_CHARSET
    Properties.MouseUp.Font.Color = clBtnText
    Properties.MouseUp.Font.Height = -11
    Properties.MouseUp.Font.Name = 'MS Sans Serif'
    Properties.MouseUp.Font.Style = []
    TabStop = True
    TabOrder = 10
    OnClick = ibeaConsultarClick
  end
  object popmnuAdPista: TPopupMenu
    Left = 8
    Top = 328
    object AlterarAdicionalPista1: TMenuItem
      Caption = 'Alterar Adicional Pista'
      OnClick = AlterarAdicionalPista1Click
    end
  end
end
