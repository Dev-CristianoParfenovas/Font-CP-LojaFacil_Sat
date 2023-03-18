object frmTblPreco: TfrmTblPreco
  Left = 92
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Tabela de Pre'#231'os'
  ClientHeight = 340
  ClientWidth = 458
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
  object lbl_AtualizaVenda: TLabel
    Left = 147
    Top = 5
    Width = 141
    Height = 13
    Caption = 'Atualiza Pre'#231'o de Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 0
    Top = 168
    Width = 466
    Height = 1
  end
  object lbl_AtualizaCusto: TLabel
    Left = 147
    Top = 178
    Width = 137
    Height = 13
    Caption = 'Atualiza Pre'#231'o de Custo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 40
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
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 307
    Width = 465
    Height = 17
    TabOrder = 1
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 321
    Width = 458
    Height = 19
    Color = clWhite
    Panels = <
      item
        Style = psOwnerDraw
        Width = 150
      end>
    OnDrawPanel = StatusBar1DrawPanel
  end
  object cboFornecedores: TComboBox
    Left = 8
    Top = 56
    Width = 145
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 2
    OnChange = cboFornecedoresChange
  end
  object GroupBox1: TGroupBox
    Left = 160
    Top = 51
    Width = 185
    Height = 57
    Caption = 'Atualizar Pre'#231'o de Venda em:'
    TabOrder = 3
  end
  object lbl_edtFabricante: TLabeledEdit
    Left = 8
    Top = 120
    Width = 148
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'Fabricante'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 4
    OnChange = lbl_edtFabricanteChange
  end
  object lbl_edtPorcentagem: TLabeledEdit
    Left = 376
    Top = 56
    Width = 77
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor ou  (%)'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 5
  end
  object lbl_edtValorCusto: TLabeledEdit
    Left = 376
    Top = 278
    Width = 77
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor ou  (%)'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 6
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 227
    Width = 185
    Height = 57
    Caption = 'Atualizar Pre'#231'o de Custo em:'
    TabOrder = 7
  end
  object ckPorcentagem: TCheckBox
    Left = 16
    Top = 16
    Width = 97
    Height = 17
    Caption = 'ckPorcentagem'
    TabOrder = 8
  end
  object ckValor: TCheckBox
    Left = 353
    Top = 16
    Width = 97
    Height = 17
    Caption = 'ckPorcentagem'
    TabOrder = 9
  end
  object ckGeral: TCheckBox
    Left = 353
    Top = 227
    Width = 97
    Height = 17
    Caption = 'ckPorcentagem'
    TabOrder = 10
  end
  object ckEstoqueZero: TCheckBox
    Left = 25
    Top = 192
    Width = 97
    Height = 17
    Caption = 'ckPorcentagem'
    TabOrder = 11
  end
  object ckPorcentagemCusto: TCheckBox
    Left = 209
    Top = 216
    Width = 97
    Height = 17
    Caption = 'ckPorcentagem'
    TabOrder = 12
  end
  object ckValorCusto: TCheckBox
    Left = 209
    Top = 240
    Width = 97
    Height = 17
    Caption = 'ckPorcentagem'
    TabOrder = 13
  end
end
