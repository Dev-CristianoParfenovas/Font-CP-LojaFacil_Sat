object frmInstrucoesCaixa: TfrmInstrucoesCaixa
  Left = 96
  Top = 54
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Instru'#231#245'es do Caixa'
  ClientHeight = 371
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_F1: TLabel
    Left = 26
    Top = 9
    Width = 111
    Height = 13
    Caption = 'F1 - Limpa Campos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F2: TLabel
    Left = 26
    Top = 34
    Width = 91
    Height = 13
    Caption = 'F2 - Quantidade'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F3: TLabel
    Left = 26
    Top = 59
    Width = 73
    Height = 13
    Caption = 'F3 - Receber'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F4: TLabel
    Left = 26
    Top = 83
    Width = 98
    Height = 13
    Caption = 'F4 - Abre Cupom'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F7: TLabel
    Left = 27
    Top = 155
    Width = 148
    Height = 13
    Caption = 'F7 - Pesquisa de Produtos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_f8: TLabel
    Left = 27
    Top = 179
    Width = 76
    Height = 13
    Caption = 'F8 - Pre'#231'o(B)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_f9: TLabel
    Left = 27
    Top = 204
    Width = 77
    Height = 13
    Caption = 'F9 - Pre'#231'o(C)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_VendaMetro: TLabel
    Left = 21
    Top = 225
    Width = 107
    Height = 13
    Caption = 'F10 - Nota Paulista'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F11: TLabel
    Left = 21
    Top = 248
    Width = 136
    Height = 13
    Caption = 'F11 - Manut. de Cupons'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Ctrlc: TLabel
    Left = 258
    Top = 9
    Width = 208
    Height = 13
    Caption = 'CTRL_C - Abre Pesquisa de Clientes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F5: TLabel
    Left = 26
    Top = 108
    Width = 150
    Height = 13
    Caption = 'F5 - Cadastro de Produtos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F6: TLabel
    Left = 27
    Top = 131
    Width = 206
    Height = 13
    Caption = 'F6 - Cancelar Item durante a venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Ctrn: TLabel
    Left = 259
    Top = 34
    Width = 165
    Height = 13
    Caption = 'CTRL_N - Nota fiscal Paulista'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Ctrl: TLabel
    Left = 259
    Top = 59
    Width = 234
    Height = 13
    Caption = 'CTRL_L - Cancela '#250'ltima venda efetuada'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_CTRLX: TLabel
    Left = 260
    Top = 81
    Width = 240
    Height = 13
    Caption = 'CTRL_X - Leitura X para impressora fiscal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_CTRLZ: TLabel
    Left = 260
    Top = 104
    Width = 240
    Height = 13
    Caption = 'CTRL_Z - Leitura Z para impressora fiscal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_CTRLP: TLabel
    Left = 260
    Top = 125
    Width = 281
    Height = 13
    Caption = 'CTRL_P - Cadastrar Formas de Pagto impr fiscal.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Aviso: TLabel
    Left = 192
    Top = 313
    Width = 157
    Height = 13
    Caption = 'PARA SAIR PRECIONE F2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 260
    Top = 149
    Width = 102
    Height = 13
    Caption = 'CTRL_H - Sangria'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 260
    Top = 170
    Width = 262
    Height = 13
    Caption = 'CTRL_Q - Limpa Campos NF Paulista no caixa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 261
    Top = 192
    Width = 266
    Height = 13
    Caption = 'CTRL_F - Fecha Cx se for aberto por operador'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 261
    Top = 213
    Width = 284
    Height = 13
    Caption = 'CTRL_F6 - Cancela Cupom Inteiro durante Venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 261
    Top = 232
    Width = 291
    Height = 13
    Caption = 'CTRL_U - Reimprime o '#250'ltimo cupom SAT validado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
end
