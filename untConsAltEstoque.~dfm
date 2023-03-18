object frmConsAlteraEstoque: TfrmConsAlteraEstoque
  Left = 102
  Top = 87
  Width = 616
  Height = 427
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta e Altera'#231#227'o de Estoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 10
    Top = 40
    Width = 42
    Height = 13
    Caption = 'Estoque:'
  end
  object Label6: TLabel
    Left = 317
    Top = 40
    Width = 40
    Height = 13
    Caption = 'Produto:'
  end
  object Bevel1: TBevel
    Left = 3
    Top = 287
    Width = 601
    Height = 4
  end
  object Label1: TLabel
    Left = 2
    Top = 3
    Width = 226
    Height = 13
    Caption = 'Permite Consultar e Alterar seu Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object cboConsEstoque: TComboBox
    Left = 9
    Top = 55
    Width = 107
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    ItemHeight = 13
    TabOrder = 0
    OnChange = cboConsEstoqueChange
    OnClick = cboConsEstoqueClick
  end
  object cboConsProd: TComboBox
    Left = 316
    Top = 55
    Width = 195
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    ItemHeight = 13
    TabOrder = 1
    OnChange = cboConsProdChange
  end
  object lbl_edtQtdeEs: TLabeledEdit
    Left = 11
    Top = 104
    Width = 44
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtde:'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 2
    OnExit = lbl_edtQtdeEsExit
  end
  object lbl_edtQtdeESMin: TLabeledEdit
    Left = 70
    Top = 104
    Width = 74
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'Estoque M'#237'n.'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 3
    Text = '0'
  end
  object lbl_edtVlrUnitEs: TLabeledEdit
    Left = 156
    Top = 104
    Width = 87
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor Unit'#225'rio:'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 4
  end
  object lbl_edtTotalEs: TLabeledEdit
    Left = 263
    Top = 104
    Width = 87
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor Total:'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 5
  end
  object ibeaExcluir: TIBEAntialiasButton
    Left = 448
    Top = 96
    Width = 61
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
    TabOrder = 6
    OnClick = ibeaExcluirClick
  end
  object ibeaSairCons: TIBEAntialiasButton
    Left = 540
    Top = 24
    Width = 61
    Height = 31
    Cursor = crHandPoint
    Caption = '&Sair'
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      08000000000040020000120B0000120B00000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C00099A8AC00D8E9
      EC000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00984E0000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
      FDFDFDFDFD9249FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD9292929249FD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD92929292D2D29249FDFDFDFDFDFDFDFDFD
      FDFDFDFDFD929292D2D2D2D2D29249929292929292929292FDFDFDFDFD92DBDB
      DBDBDBDBD3D249E4EDEDEDED07070792FDFDFDFDFD92DBDBDBDBDBDBDBD2496A
      3232323232320792FDFDFDFDFD92DBDBDBDBDBDBDBDB496A3232323232320792
      FDFDFDFDFD92DBDBDBDBDBDBDBDB496A3232323232320792FDFDFDFDFD92DBDB
      DBDBDBDBDBDB496A3232323232320792FDFDFDFDFD92DBDBDBDBDBDBDBDB496A
      3232323232320792FDFDFDFDFD92DBDBDBDBDBEDDBDB496B3232323232320792
      FDFDFDFDFD92DBDBDBDBEDFFEDDB49F5F57C7C7373730792FDFDFDFDFD92E4DC
      DBDBEDFFEDDB49F5FFFFFFFF09090792FDFDFDFDFD92E4E4E4E4DCEDDBDB49F5
      FFFFFFFFFFFF0792FDFDFDFDFD92E4E4E4E4E4E4E4DB49F5FFFFFFFFFFFF0792
      FDFDFDFDFD92E4E4E4E4E4E4E4DB49F5FFFFFFFFFFFF0792FDFDFDFDFD92E4E4
      E4E4E4E4E4DB49F5FFFFFFFFFFFF0792FDFDFDFDFD92E4E4E4E4E4E4E4DB49F5
      FFFFFFFFFFFF0792FDFDFDFDFD92E4E4E4E4E4E4E4DB49F5FFFFFFFFFFFF0792
      FDFDFDFDFD92E4E4E4E4E4E4E4DB49F5FFFFFFFFFFFF0792FDFDFDFDFD9292DB
      DCE4E4E4E4DB49F5FFFFFFFFFFFF0792FDFDFDFDFDFDFD92929BDBE4E4DB4992
      9292929292929292FDFDFDFDFDFDFDFDFDFD92929B9B49FDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFD9249FDFDFDFDFDFDFDFDFDFDFD}
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
    OnClick = ibeaSairConsClick
  end
  object dbgConsEstoque: TDBGrid
    Left = 4
    Top = 140
    Width = 597
    Height = 137
    Cursor = crHandPoint
    BorderStyle = bsNone
    DataSource = dmModule.dtsEntrProdEstoque
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgConsEstoqueCellClick
  end
  object ibeaaltEstoque: TIBEAntialiasButton
    Left = 375
    Top = 96
    Width = 61
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
    TabOrder = 9
    OnClick = ibeaaltEstoqueClick
  end
  object lbl_edtTotalCusto: TLabeledEdit
    Left = 504
    Top = 323
    Width = 98
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 126
    EditLabel.Height = 16
    EditLabel.Caption = 'Total de Custo Geral:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
  object lbl_edtTotalVenda: TLabeledEdit
    Left = 504
    Top = 359
    Width = 98
    Height = 19
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 132
    EditLabel.Height = 16
    EditLabel.Caption = 'Total de Venda Geral:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
  end
  object ibeaConsulta: TIBEAntialiasButton
    Left = 520
    Top = 96
    Width = 61
    Height = 31
    Cursor = crHandPoint
    Hint = 'Abre Consulta de Produtos'
    Caption = '&Consulta'
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C00099A8AC00D8E9
      EC000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00984E0000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFF09B4
      6A21216AB409FFFFFFFFFFFFFFB42121212121212121B4FFFFFFFFFF6B212121
      212121212121216BFFFFFFB4212929292929292921212121B4FF092129292929
      73092A29292121212109B429292929BCFFFF09292929212121B46A292931BEFF
      FFFFFF0729292921216A21313107FFFF0907FFFFBE29292921212931313209BE
      313109FFFFBD292921216A3131313A3131313209FFFFB429216AB43131313939
      3931317AF6FFBD2921B4092931393939393931317BBD29292109FFB431393939
      3939313131312929B4FFFFFF6B313939393131313131296BFFFFFFFFFFB42931
      393131313129B4FFFFFFFFFFFFFF09B46A29296AB409FFFFFFFF}
    ParentShowHint = False
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
    ShowHint = True
    TabStop = True
    TabOrder = 12
    OnClick = ibeaConsultaClick
  end
  object lbl_edtNome: TLabeledEdit
    Left = 123
    Top = 56
    Width = 181
    Height = 19
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    EditLabel.Width = 157
    EditLabel.Height = 13
    EditLabel.Caption = 'Primeira Letra ou Nome Completo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpAbove
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 13
    OnChange = lbl_edtNomeChange
  end
end
