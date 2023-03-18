object frmBackup: TfrmBackup
  Left = 171
  Top = 166
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Backup CP Sistemas'
  ClientHeight = 220
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_DataBKP: TLabel
    Left = 306
    Top = 40
    Width = 72
    Height = 13
    Caption = 'Data do BKP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 201
    Width = 399
    Height = 19
    Color = clWhite
    Panels = <
      item
        Style = psOwnerDraw
        Width = 150
      end>
    OnDrawPanel = StatusBar1DrawPanel
  end
  object progBarBKP: TProgressBar
    Left = 1
    Top = 184
    Width = 398
    Height = 17
    TabOrder = 4
  end
  object dtpDataBkp: TDateTimePicker
    Left = 304
    Top = 56
    Width = 90
    Height = 21
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Date = 41549.000000000000000000
    Time = 0.811881863417511300
    TabOrder = 1
  end
  object lbl_edtOrigem: TLabeledEdit
    Left = 3
    Top = 56
    Width = 297
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Origem'
    TabOrder = 2
  end
  object lbl_edtDestino: TLabeledEdit
    Left = 3
    Top = 120
    Width = 297
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Destino'
    TabOrder = 3
  end
end
