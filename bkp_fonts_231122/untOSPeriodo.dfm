object frmOSPeriodo: TfrmOSPeriodo
  Left = 186
  Top = 110
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'OS por Per'#237'odo'
  ClientHeight = 153
  ClientWidth = 308
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
  object lbl_Func: TLabel
    Left = 8
    Top = 83
    Width = 67
    Height = 13
    Caption = 'Funcion'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_DataIni: TLabel
    Left = 10
    Top = 9
    Width = 66
    Height = 13
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_DataF: TLabel
    Left = 106
    Top = 9
    Width = 59
    Height = 13
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ibeSair: TBmsXPButton
    Left = 217
    Top = 8
    Width = 80
    Height = 21
    Caption = '&Sair'
    Layout = tlTop
    WordWrap = False
    ShowAccelChar = True
    TabOrder = 0
    OnClick = ibeSairClick
  end
  object ibeaVisualizar: TBmsXPButton
    Left = 216
    Top = 96
    Width = 80
    Height = 21
    Caption = '&Visualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = tlTop
    WordWrap = False
    ShowAccelChar = True
    ParentFont = False
    TabOrder = 1
    OnClick = ibeaVisualizarClick
  end
  object cboFuncionario: TmxFlatComboBox
    Left = 8
    Top = 96
    Width = 202
    Height = 21
    Activate = False
    BorderColor = clBtnShadow
    Flat = True
    ShowBorder = True
    Version = '1.26'
    ItemHeight = 13
    TabOrder = 2
  end
  object dtpDataIni: TmxFlatDateTimePicker
    Left = 8
    Top = 24
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 39658.8183006713
    Time = 39658.8183006713
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    Activate = False
    BorderColor = clBtnShadow
    Flat = True
    ShowBorder = True
    Version = '1.26'
  end
  object dtpDataF: TmxFlatDateTimePicker
    Left = 104
    Top = 24
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 39658.8183273264
    Time = 39658.8183273264
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
    Activate = False
    BorderColor = clBtnShadow
    Flat = True
    ShowBorder = True
    Version = '1.26'
  end
  object ckAberto: TBmsXPCheckBox
    Left = 8
    Top = 56
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
    Color = clBtnFace
    ParentColor = False
    TabOrder = 5
    onCheck = ckAbertoCheck
  end
  object ckBaixado: TBmsXPCheckBox
    Left = 88
    Top = 56
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
    Color = clBtnFace
    ParentColor = False
    TabOrder = 6
    onCheck = ckBaixadoCheck
  end
end
