object frmEmissaoServicos: TfrmEmissaoServicos
  Left = -1
  Top = 16
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Servicos'
  ClientHeight = 532
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcServicos: TBmsXPPageControl
    Left = 8
    Top = 8
    Width = 777
    Height = 521
    ActivePage = tbsPagina1
    HotTrack = True
    TabIndex = 0
    TabOrder = 0
    object tbsPagina1: TTabSheet
      Caption = 'Servi'#231'os'
      object lbl_CodBarra: TLabel
        Left = 8
        Top = 48
        Width = 63
        Height = 13
        Caption = 'C'#243'd.Barras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_Descricao: TLabel
        Left = 121
        Top = 48
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_ServicoAvulso: TLabel
        Left = 278
        Top = 48
        Width = 86
        Height = 13
        Caption = 'Servi'#231'o Avulso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_VlrUn: TLabel
        Left = 471
        Top = 48
        Width = 47
        Height = 13
        Caption = 'Vlr.Unit.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_VlrTotal: TLabel
        Left = 549
        Top = 48
        Width = 49
        Height = 13
        Caption = 'Vlr.Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_NServ: TLabel
        Left = 90
        Top = 3
        Width = 58
        Height = 13
        Caption = 'N'#186'Servico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_Obs: TLabel
        Left = 9
        Top = 89
        Width = 31
        Height = 13
        Caption = 'Obs.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_TotalServicos: TLabel
        Left = 524
        Top = 97
        Width = 91
        Height = 38
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = True
      end
      object lbl_SubTotal: TLabel
        Left = 524
        Top = 137
        Width = 224
        Height = 38
        AutoSize = False
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_Func: TLabel
        Left = 177
        Top = 2
        Width = 67
        Height = 13
        Caption = 'Funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_TipoPreco: TLabel
        Left = 181
        Top = 48
        Width = 87
        Height = 13
        AutoSize = False
        Caption = 'lbl_TipoPreco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lbl_Clientes: TLabel
        Left = 337
        Top = 2
        Width = 46
        Height = 13
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_edtTrazerServ: TLabel
        Left = 80
        Top = 200
        Width = 58
        Height = 13
        Caption = 'N'#186'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_TotalServico: TLabel
        Left = 155
        Top = 200
        Width = 30
        Height = 13
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_F1: TLabel
        Left = 8
        Top = 436
        Width = 145
        Height = 13
        Caption = 'F1 - Limpa Campos do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lbl_F4: TLabel
        Left = 8
        Top = 451
        Width = 85
        Height = 13
        Caption = 'F4 - Inicia Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lbl_F4Servico: TLabel
        Left = 7
        Top = 1
        Width = 57
        Height = 13
        Caption = 'F4 - Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object ibeaRelatorioP: TSpeedButton
        Left = 598
        Top = 11
        Width = 50
        Height = 33
        Flat = True
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000320B0000320B000000010000000100008C5A5A009C6B
          6300A57B7300B5847300E79C4200EFAD5A00E7AD7300E7B57B00F7C67B000052
          AD000063CE00FF00FF00BD848400BD8C8400BDBDBD00CE9C8400DEAD8400E7B5
          8C00EFBD9400FFD6A500FFD6AD00F7DEBD00DED6CE00D6D6D600EFDECE00F7DE
          C600FFDEC600EFDED600FFE7CE00EFE7D600EFE7DE00F7E7D600F7EFD600F7E7
          DE00F7EFDE00C6FFFF00EFE7E700F7EFE700F7EFEF00FFF7EF00FFF7F700FFFF
          F700FFFFFF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000B0B0B0B0B0B
          0B0B0202020202020202020202020202000B0B0B0B0B0B0B0B0B0218221F1F1F
          1F1F1F1F1F1F2018000B0B0B0B0B0B0B0B0B0218221D1D1D1D18181818181D18
          000B0B0B0B0B0B0B0B0B021B251E1E1D1D1D1D1818181D18000B0B0B0B0B0B0B
          0B0B031B251914141414141414151D18000B0B0B0B0B0B0B0B0B031B251C1515
          1515151515191D18000B0B02020202020202031E272221211F1F1F1F1D1D1F18
          010B0B0218221F1F1F1F0D1E271513131313131313152118010B0B0218232323
          23230D1E28252221211F1F1F1F1F2118010B0B021B23232323230F2429221F1F
          1F1F1F1C191F221B020B0B031B2309090A0A0F252A1A1313131313131319251D
          020B0B031B232323232310262A2827272625252525252516020B0B031E232323
          232310262A2A2A28282828272824170E030B0B0D1E2309090A0A11262A2A2A29
          2828282503030303030B0B0D1E232323232311262A2A2A2A2A292A1E03060504
          0C0B0B0F24232323232312272A2A2A2A2A2A2A240308050C0B0B0B0F25230909
          0A0A12272A2A2A2A2A2A2A2403070C0B0B0B0B10262323232326121010101010
          10101010030C0B0B0B0B0B102623232323232323272824170E030B0B0B0B0B0B
          0B0B0B1126232323232323232503030303030B0B0B0B0B0B0B0B0B1126232323
          232323231E030605040C0B0B0B0B0B0B0B0B0B12272323232323232324030805
          0C0B0B0B0B0B0B0B0B0B0B12272A2A2A2A2A2A2A2403070C0B0B0B0B0B0B0B0B
          0B0B0B12101010101010101010030C0B0B0B0B0B0B0B0B0B0B0B}
        OnClick = ibeaRelatorioPClick
      end
      object lbl_edtCodBarras: TmxFlatEdit
        Left = 8
        Top = 64
        Width = 105
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        TabOrder = 0
        OnExit = lbl_edtCodBarrasExit
        OnKeyPress = lbl_edtCodBarrasKeyPress
      end
      object lbl_edtVlrUnit: TmxFlatEdit
        Left = 469
        Top = 64
        Width = 71
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        TabOrder = 1
        OnExit = lbl_edtVlrUnitExit
        OnKeyPress = lbl_edtVlrUnitKeyPress
      end
      object lbl_edtVlrTotal: TmxFlatEdit
        Left = 547
        Top = 64
        Width = 71
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        TabOrder = 2
      end
      object lbl_edtCodServico: TmxFlatEdit
        Left = 89
        Top = 17
        Width = 79
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object cboServicos: TmxFlatComboBox
        Left = 119
        Top = 64
        Width = 151
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        ItemHeight = 13
        TabOrder = 4
        OnChange = cboServicosChange
      end
      object ibeaIncluir: TBmsXPButton
        Left = 624
        Top = 64
        Width = 68
        Height = 21
        Caption = '&Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 5
        OnClick = ibeaIncluirClick
      end
      object ibeaSair: TBmsXPButton
        Left = 694
        Top = 4
        Width = 74
        Height = 21
        Caption = '&Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 6
        OnClick = ibeaSairClick
      end
      object dbgServicos: TDBGrid
        Left = 5
        Top = 242
        Width = 748
        Height = 179
        Cursor = crHandPoint
        BorderStyle = bsNone
        FixedColor = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
        ParentFont = False
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = dbgServicosCellClick
      end
      object memoObs: TmxFlatMemo
        Left = 8
        Top = 108
        Width = 509
        Height = 73
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          '')
        MaxLength = 300
        ParentFont = False
        TabOrder = 8
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
      end
      object ibeaNovoServico: TBmsXPButton
        Left = 5
        Top = 16
        Width = 80
        Height = 21
        Caption = '&Novo Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 9
        OnClick = ibeaNovoServicoClick
      end
      object ibeaEncerrarServico: TBmsXPButton
        Left = 504
        Top = 16
        Width = 88
        Height = 21
        Caption = '&Encerrar Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 10
        OnClick = ibeaEncerrarServicoClick
      end
      object cboFuncionario: TmxFlatComboBox
        Left = 175
        Top = 17
        Width = 151
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        ItemHeight = 13
        TabOrder = 11
      end
      object ibeaExcluir: TBmsXPButton
        Left = 699
        Top = 64
        Width = 68
        Height = 21
        Caption = '&Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 12
        OnClick = ibeaExcluirClick
      end
      object cboCliente: TmxFlatComboBox
        Left = 336
        Top = 17
        Width = 151
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        ItemHeight = 13
        TabOrder = 13
      end
      object lbl_edtTrazerServico: TmxFlatEdit
        Left = 80
        Top = 216
        Width = 68
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        TabOrder = 14
        OnExit = lbl_edtTrazerServicoExit
        OnKeyPress = lbl_edtTrazerServicoKeyPress
      end
      object ibeaExcluirServico: TBmsXPButton
        Left = 688
        Top = 216
        Width = 80
        Height = 21
        Caption = '&Excluir Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 15
        OnClick = ibeaExcluirServicoClick
      end
      object lbl_edtVlrTotalServ: TmxFlatEdit
        Left = 153
        Top = 216
        Width = 64
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        TabOrder = 16
      end
      object ibeaImprimirFicha: TBmsXPButton
        Left = 590
        Top = 216
        Width = 88
        Height = 21
        Caption = 'Imprimir Ficha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 17
        OnClick = ibeaImprimirFichaClick
      end
      object ibeaAlterarServico: TBmsXPButton
        Left = 409
        Top = 216
        Width = 80
        Height = 21
        Caption = '&Alterar Obs.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 18
        OnClick = ibeaAlterarServicoClick
      end
      object ibeaLimparServico: TBmsXPButton
        Left = 498
        Top = 216
        Width = 80
        Height = 21
        Caption = '&Limpar Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 19
        OnClick = ibeaLimparServicoClick
      end
      object lbl_edtServicoAvulso: TmxFlatEdit
        Left = 276
        Top = 64
        Width = 188
        Height = 21
        Activate = False
        BorderColor = clGradientActiveCaption
        Flat = True
        ShowBorder = True
        Version = '1.26'
        TabOrder = 20
        OnKeyPress = lbl_edtServicoAvulsoKeyPress
      end
      object ckAberto: TBmsXPCheckBox
        Left = 4
        Top = 207
        Width = 73
        Height = 13
        WordWrap = False
        ShowAccelChar = True
        Layout = tlTop
        AutoSize = False
        Alignment = taLeftJustify
        Shadow.Color = clWindow
        Shadow.Style = ssTopLeft
        Shadow.OffSet = 0
        Caption = 'Em Aberto'
        Color = clWhite
        ParentColor = False
        TabOrder = 21
        onCheck = ckAbertoCheck
      end
      object ckBaixado: TBmsXPCheckBox
        Left = 4
        Top = 223
        Width = 65
        Height = 13
        WordWrap = False
        ShowAccelChar = True
        Layout = tlTop
        AutoSize = False
        Alignment = taLeftJustify
        Shadow.Color = clWindow
        Shadow.Style = ssTopLeft
        Shadow.OffSet = 0
        Caption = 'Baixado'
        Color = clWhite
        ParentColor = False
        TabOrder = 22
        onCheck = ckBaixadoCheck
      end
      object ibeaBaixarServico: TBmsXPButton
        Left = 221
        Top = 216
        Width = 80
        Height = 21
        Caption = '&Baixar Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 23
        OnClick = ibeaBaixarServicoClick
      end
      object ibeaRetornoServico: TBmsXPButton
        Left = 311
        Top = 216
        Width = 87
        Height = 21
        Caption = '&Retornar Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = tlTop
        WordWrap = False
        ShowAccelChar = True
        ParentFont = False
        TabOrder = 24
        OnClick = ibeaRetornoServicoClick
      end
    end
  end
end
