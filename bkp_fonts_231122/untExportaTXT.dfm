object frmExportaTXT: TfrmExportaTXT
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'frmExportaTXT'
  ClientHeight = 186
  ClientWidth = 478
  Color = clWhite
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
  object lbl_DTData: TLabel
    Left = 2
    Top = 72
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
  object lbl_Explicacao: TLabel
    Left = 3
    Top = 128
    Width = 275
    Height = 13
    Caption = 'Exporta produtos alterados conforme data acima'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sbExportar: TSpeedButton
    Left = 196
    Top = 76
    Width = 41
    Height = 42
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFA46769A66A6BA6696BA6696AA6696AA5696AA5696AA5696AA6696AA6696AA4
      6769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFAA7070FFFED7FAE2B7FBE0ADF8D9A0F6D191F4CC86F3CA
      82F8D484FCD484A5696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFAA6F70FFF6D8F2D9BB8087CF2C46E6
      0323FB2B44DE7B79AFEEC280F4CB82A5696AFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB7572FFFCE682
      8CDC0222FE001EFF001EFF001EFF0221FC7F7EB0F4CB82A5696AFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFAC7F75FFFFF62D4BF2001EFF001EFF001EFF001EFF001EFF2C46DEF6CE89A5
      696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB58374FFFFFF0323FE001EFF001EFF001EFF001EFF001E
      FF0323FBF8D396A5696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9575FFFFFF2D4EFA001EFF001EFF
      001EFF001EFF001EFF2D48E6FFE0A4A6696AFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD59A77FFFFFF88
      9DFC0222FF001EFF001EFF001EFF0222FE8692D7E0C2A0A5686AFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFDCA17DFFFFFFFFFFFF889EFF2E50FC0324FE2D4DF47E84D5CBAF98AF8B7BA3
      676BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFDCA37EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCF8F0E7BD90
      82A36B649F6B65AC6959A46769A46769A46769A46769A46769A46769A46769A4
      6769A46769A46769A46769A46769FF00FFE7B082FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF4F6FAAF8282D18A4FD4894AFF00FFA46769FEE9C7F4DAB5F6D9ABF4D4
      A0F2CE95F0C788EFC581EEC580F4CC83EFC480A46769FF00FFE9B081FBFAFBFA
      F3EFFAF3EFFAF3EFFCF8F4EEE0D8B07F76B67660FF00FFFF00FFA46769FCEACE
      F3DABCF0D5B4F0D0A9EECB9EEDC693EAC088E9BC7FEFC581EFC480A46769FF00
      FFE6A978CF906CD1926DD1926DD1926DD1926DD7976EAF7464FF00FF015403FF
      00FFA46769E7C6AC973D17963D16963C15963B13963A1395391195380FB4642F
      EFC480A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF025C05025C04A7756BFFF4E5A4512C811E00811E00811E00811E0081
      1E00832001E0AB6FEFC583A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF056F0C025B05A7756BFFFFFCE6C7B2832101811E
      00811E00811E00811E00B06437F0CE93F2C98CA46769FF00FFFF00FFFF00FF01
      5503015503FF00FFFF00FFFF00FFFF00FFFF00FF057E0C025C04BC8268FFFFFC
      FAF0E6B87555811E00811E00811E008A2B07EBC59CF3D3A0F3CE97A46769FF00
      FFFF00FF004F000F821C015503FF00FFFF00FFFF00FFFF00FF036E0704800B02
      5803D1926DFFFFFCFEF7F2F6E9E18E2F0C811E00811E00C48662F4D7B5FBDCAD
      F6D3A0A46769FF00FF00520113842335C660015503004C00015403035F060369
      07068F0D037208015403D1926DFFFFFCFFFFFFFFFEFECF9D84811E00983E19F8
      E5CCF8E3C5EBD9B7C5A48FA4676905620A1A922F3ED96F3FDC6F1CA0350B7B16
      097811067F0D06920E05890C015503FF00FFDA9D75FFFFFCFFFFFFFFFFFFFFFE
      FE9A4420E0BBA5F4E3D1D5B19FB79280A77D70A467690A6E1242E07545E67A30
      C65623BC411BB7330EA51D06981005840C015503FF00FFFF00FFDA9D75FFFFFC
      FFFFFFFFFFFFFFFFFFF3E7E0FFFEF8E6D5CCA56B5FA56B5FA56B5FAF6A56FF00
      FF0155032DC24F18A92D015503015503015503015503015503FF00FFFF00FFFF
      00FFE7AB79FFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9DCA56B5FE1974E
      D38749FF00FFFF00FFFF00FF01550315A428015503FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFE7AB79FAF3EFFAF3EFFAF3EFFAF3EFFAF3EFFAF3EFDC
      C2B8A56B5FBF7D60FF00FFFF00FFFF00FFFF00FFFF00FF015503015503FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD192
      6DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = sbExportarClick
  end
  object Label1: TLabel
    Left = 98
    Top = 72
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
  object dtpDataIni: TDateTimePicker
    Left = 2
    Top = 88
    Width = 89
    Height = 25
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41018.000000000000000000
    Time = 0.485951782407937600
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 167
    Width = 478
    Height = 19
    Color = clWhite
    Panels = <
      item
        Style = psOwnerDraw
        Width = 150
      end>
    OnDrawPanel = StatusBar1DrawPanel
  end
  object ProgressBar1: TProgressBar
    Left = -7
    Top = 149
    Width = 483
    Height = 17
    TabOrder = 2
    Visible = False
  end
  object edtCaminho: TLabeledEdit
    Left = 248
    Top = 96
    Width = 225
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho do arquivo'
    TabOrder = 4
    Text = 'C:\CADTXT.TXT'
  end
  object dtpDataF: TDateTimePicker
    Left = 96
    Top = 88
    Width = 89
    Height = 25
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41018.000000000000000000
    Time = 0.485951782407937600
    TabOrder = 3
  end
end
