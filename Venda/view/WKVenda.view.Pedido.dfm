inherited frmPedido: TfrmPedido
  Caption = 'Lan'#231'amento pedidos'
  ClientHeight = 675
  ClientWidth = 1111
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1127
  ExplicitHeight = 714
  TextHeight = 15
  inherited Bevel3: TBevel
    Width = 1107
    Shape = bsSpacer
    Style = bsRaised
    ExplicitWidth = 1109
  end
  inherited pnlPrincipal: TPanel
    Width = 1107
    Height = 540
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 1107
    ExplicitHeight = 540
    inherited pnlGrid: TPanel
      Left = 616
      Width = 488
      Height = 534
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 616
      ExplicitWidth = 488
      ExplicitHeight = 534
      inherited dbgLista: TDBGrid
        Width = 486
        Height = 457
        Columns = <
          item
            Expanded = False
            FieldName = 'IdProduto'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ProdutoNome'
            Title.Caption = 'Produto'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorUnitario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorTotal'
            Visible = True
          end>
      end
      object pnlBottomGrid: TPanel
        Left = 1
        Top = 458
        Width = 486
        Height = 75
        Align = alBottom
        TabOrder = 1
      end
    end
    object pnlDadosFundo: TPanel
      Left = 3
      Top = 3
      Width = 613
      Height = 534
      Align = alLeft
      BevelOuter = bvNone
      Color = 12645002
      Padding.Left = 1
      Padding.Top = 1
      Padding.Bottom = 1
      ParentBackground = False
      TabOrder = 1
      object pnlDados: TPanel
        Left = 1
        Top = 1
        Width = 612
        Height = 532
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object pcCabPedido: TPageControl
          Left = 0
          Top = 137
          Width = 612
          Height = 395
          ActivePage = tbsPedido
          Align = alClient
          TabOrder = 0
          object tbsPedido: TTabSheet
            Caption = 'Pedido'
            ImageIndex = 1
            object pnlPedidoCab: TPanel
              Left = 0
              Top = 0
              Width = 604
              Height = 365
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              Padding.Left = 2
              Padding.Top = 2
              Padding.Right = 2
              Padding.Bottom = 2
              ParentBackground = False
              TabOrder = 0
              object Label5: TLabel
                Left = 4
                Top = 11
                Width = 104
                Height = 21
                Caption = 'C'#243'digo Pedido:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label6: TLabel
                Left = 140
                Top = 11
                Width = 60
                Height = 21
                Caption = 'Emiss'#227'o:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label7: TLabel
                Left = 325
                Top = 13
                Width = 75
                Height = 21
                Caption = 'Valor Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object pnlEdtIdPedido: TPanel
                Left = 4
                Top = 40
                Width = 127
                Height = 35
                BevelOuter = bvNone
                Color = 12645002
                Padding.Left = 1
                Padding.Bottom = 2
                ParentBackground = False
                TabOrder = 0
                object edtIdPedido: TDBEdit
                  Left = 1
                  Top = 0
                  Width = 126
                  Height = 33
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  DataField = 'Id'
                  DataSource = dsPedido
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object Panel3: TPanel
                Left = 324
                Top = 40
                Width = 127
                Height = 35
                BevelOuter = bvNone
                Color = 12645002
                Padding.Left = 1
                Padding.Bottom = 2
                ParentBackground = False
                TabOrder = 1
                object edtValorTotal: TDBEdit
                  Left = 1
                  Top = 0
                  Width = 126
                  Height = 33
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  DataField = 'ValorTotal'
                  DataSource = dsPedido
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object Panel4: TPanel
                Left = 140
                Top = 40
                Width = 173
                Height = 35
                BevelOuter = bvNone
                Color = 12645002
                Padding.Left = 1
                Padding.Bottom = 2
                ParentBackground = False
                TabOrder = 2
                object edtDataEmissao: TDBEdit
                  Left = 1
                  Top = 0
                  Width = 172
                  Height = 33
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  DataField = 'DataEmissao'
                  DataSource = dsPedido
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object pnlBtnPedido: TPanel
                Left = 472
                Top = 11
                Width = 117
                Height = 64
                BevelOuter = bvNone
                Color = 10085288
                ParentBackground = False
                TabOrder = 3
                object btnPedido: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 117
                  Height = 64
                  Cursor = crHandPoint
                  Align = alClient
                  Anchors = [akTop, akRight, akBottom]
                  Caption = 'Buscar Pedido'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnPedidoClick
                  ExplicitLeft = 5
                end
              end
            end
          end
        end
        object pnlDadosTop: TPanel
          Left = 0
          Top = 0
          Width = 612
          Height = 137
          Align = alTop
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object Label2: TLabel
            Left = 8
            Top = 2
            Width = 49
            Height = 20
            Caption = 'Cliente:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 9
            Top = 76
            Width = 40
            Height = 15
            Caption = 'Cidade:'
          end
          object Label4: TLabel
            Left = 408
            Top = 76
            Width = 17
            Height = 15
            Caption = 'UF:'
          end
          object Panel2: TPanel
            Left = 8
            Top = 23
            Width = 481
            Height = 35
            BevelOuter = bvNone
            Color = 12645002
            Padding.Left = 1
            Padding.Top = 1
            Padding.Right = 1
            Padding.Bottom = 1
            ParentBackground = False
            TabOrder = 0
            object edtIdCliente: TEdit
              Left = 1
              Top = 1
              Width = 70
              Height = 33
              Align = alLeft
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edtIdClienteExit
            end
            object pnlBtnSelCliente: TPanel
              Left = 71
              Top = 1
              Width = 43
              Height = 33
              Align = alLeft
              BevelOuter = bvNone
              Color = 14865050
              ParentBackground = False
              TabOrder = 1
              object btnSelCliente: TSpeedButton
                Left = 0
                Top = 0
                Width = 43
                Height = 33
                Cursor = crHandPoint
                Align = alClient
                Caption = '...'
                ImageIndex = 0
                Flat = True
                ExplicitLeft = 3
              end
            end
            object edtNomeCliente: TDBEdit
              Left = 114
              Top = 1
              Width = 366
              Height = 33
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              DataField = 'Nome'
              DataSource = dsCliente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
          end
          object edtCidade: TDBEdit
            Left = 9
            Top = 92
            Width = 393
            Height = 23
            DataField = 'Cidade'
            DataSource = dsCliente
            ReadOnly = True
            TabOrder = 1
          end
          object EdtUF: TDBEdit
            Left = 408
            Top = 92
            Width = 81
            Height = 23
            DataField = 'UF'
            DataSource = dsCliente
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited pnlTop: TPanel
    Width = 1107
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 1107
    inherited lblBusca: TLabel
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label1: TLabel
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtGridBusca: TEdit
      Width = 1101
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 1101
    end
  end
  inherited pnlBottom: TPanel
    Top = 613
    Width = 1107
    Height = 60
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 613
    ExplicitWidth = 1107
    ExplicitHeight = 60
    inherited PnlBtnConfirma: TPanel
      Left = 995
      Height = 52
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 995
      ExplicitHeight = 52
      inherited btnConfirma: TSpeedButton
        Height = 52
        Cursor = crHandPoint
        Font.Color = clWhite
        Font.Height = -16
        ParentFont = False
        ExplicitHeight = 52
      end
    end
    inherited Panel1: TPanel
      Height = 52
      StyleElements = [seFont, seClient, seBorder]
      ExplicitHeight = 52
      inherited SpeedButton1: TSpeedButton
        Height = 52
        Cursor = crHandPoint
        Font.Height = -16
        ParentFont = False
        ExplicitHeight = 52
      end
    end
  end
  inherited dsGrid: TDataSource
    Left = 901
    Top = 102
  end
  inherited TimerCharBusca: TTimer
    Left = 809
    Top = 122
  end
  object dsCliente: TDataSource
    Left = 306
    Top = 400
  end
  object dsPedido: TDataSource
    Left = 418
    Top = 440
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = DMConnection.FDCon
    SQL.Strings = (
      'select pr.Descricao AS ProdutoNome, pdi.* from pedidoitens pdi'
      'INNER JOIN Produto pr '
      #9'ON pdi.IdProduto = pr.Id'
      'WHERE pdi.IdPedido = 1')
    Left = 922
    Top = 196
  end
end
