object untPedidoNuvem: TuntPedidoNuvem
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pedidos'
  ClientHeight = 416
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbPedidos: TDBGrid
    Left = 40
    Top = 39
    Width = 473
    Height = 120
    DataSource = dsProdutos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idprod'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 40
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object memoResp: TMemo
    Left = 40
    Top = 165
    Width = 473
    Height = 104
    Lines.Strings = (
      ''
      '')
    TabOrder = 2
  end
  object memoConvert: TMemo
    Left = 40
    Top = 288
    Width = 473
    Height = 89
    TabOrder = 3
  end
  object Button2: TButton
    Left = 136
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
  object mtProdutos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'idprod'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 248
    object mtProdutosidprod: TStringField
      FieldName = 'idprod'
      Size = 5
    end
    object mtProdutosnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
  end
  object dsProdutos: TDataSource
    DataSet = mtProdutos
    Left = 320
  end
end
