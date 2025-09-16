inherited frmPedido: TfrmPedido
  Caption = 'Lan'#231'amento pedidos'
  ClientHeight = 675
  ClientWidth = 1188
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  ExplicitWidth = 1204
  ExplicitHeight = 714
  TextHeight = 15
  inherited Bevel3: TBevel
    Width = 1184
    Shape = bsSpacer
    Style = bsRaised
    ExplicitWidth = 1109
  end
  inherited pnlPrincipal: TPanel
    Width = 1184
    Height = 540
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 1332
    ExplicitHeight = 540
    inherited pnlGrid: TPanel
      Left = 616
      Width = 565
      Height = 534
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 616
      ExplicitWidth = 713
      ExplicitHeight = 534
      object Bevel1: TBevel [0]
        Left = 1
        Top = 138
        Width = 563
        Height = 3
        Align = alTop
        Shape = bsSpacer
        Style = bsRaised
        ExplicitWidth = 711
      end
      inherited dbgLista: TDBGrid
        Top = 141
        Width = 563
        Height = 339
        DrawingStyle = gdsGradient
        Font.Height = -19
        ParentFont = False
        TitleFont.Height = -19
        StyleName = 'Windows'
        Columns = <
          item
            Color = clWhite
            Expanded = False
            FieldName = 'IdProduto'
            Title.Caption = 'C'#243'digo Prod.'
            Title.Color = clWhite
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ProdutoNome'
            Title.Caption = 'Produto'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Title.Caption = 'Qtde.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorUnitario'
            Title.Caption = 'Vlr. Unit'#225'rio'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorTotal'
            Title.Caption = 'Vlr. Total'
            Width = 90
            Visible = True
          end>
      end
      object pnlBottomGrid: TPanel
        Left = 1
        Top = 480
        Width = 563
        Height = 53
        Align = alBottom
        TabOrder = 1
        ExplicitWidth = 711
        object pnlBtnIncItem: TPanel
          Left = 1
          Top = 1
          Width = 104
          Height = 51
          Align = alLeft
          BevelOuter = bvNone
          Color = 14865050
          ParentBackground = False
          TabOrder = 0
          object btnIncItem: TSpeedButton
            Left = 0
            Top = 0
            Width = 104
            Height = 51
            Cursor = crHandPoint
            Align = alClient
            Caption = '&Incluir'
            Enabled = False
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            OnClick = btnIncItemClick
            ExplicitTop = -1
          end
        end
        object pnlBtnCancelarEditItem: TPanel
          Left = 105
          Top = 1
          Width = 105
          Height = 51
          Align = alLeft
          BevelOuter = bvNone
          Color = 11120122
          ParentBackground = False
          TabOrder = 1
          object btnCancelarEditItem: TSpeedButton
            Left = 0
            Top = 0
            Width = 105
            Height = 51
            Cursor = crHandPoint
            Align = alClient
            Caption = '&Cancelar'
            Enabled = False
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            OnClick = btnCancelarEditItemClick
            ExplicitLeft = 1
            ExplicitTop = -3
            ExplicitHeight = 52
          end
        end
      end
      object pnlTopItem: TPanel
        Left = 1
        Top = 1
        Width = 563
        Height = 137
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        ExplicitWidth = 711
        object Label11: TLabel
          Left = 104
          Top = 66
          Width = 99
          Height = 25
          Caption = 'Vr. Unit'#225'rio:'
        end
        object Label12: TLabel
          Left = 231
          Top = 66
          Width = 71
          Height = 25
          Caption = 'Vr. Total:'
        end
        object Label10: TLabel
          Left = 16
          Top = 64
          Width = 49
          Height = 25
          Caption = 'Qtde.:'
        end
        object Label8: TLabel
          Left = 24
          Top = 0
          Width = 72
          Height = 25
          Caption = 'Produto:'
        end
        object Panel5: TPanel
          Left = 16
          Top = 25
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
          object edtIdProduto: TEdit
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
            OnExit = edtIdProdutoExit
          end
          object Panel6: TPanel
            Left = 71
            Top = 1
            Width = 43
            Height = 33
            Align = alLeft
            BevelOuter = bvNone
            Color = 14865050
            ParentBackground = False
            TabOrder = 1
            object btnSelProduto: TSpeedButton
              Left = 0
              Top = 0
              Width = 43
              Height = 33
              Cursor = crHandPoint
              Align = alClient
              Caption = '...'
              ImageIndex = 0
              Flat = True
              OnClick = btnSelProdutoClick
              ExplicitLeft = 3
            end
          end
          object edtDescricaoProd: TEdit
            Left = 114
            Top = 1
            Width = 366
            Height = 33
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 2
          end
        end
        object edtQuantidade: TEdit
          Left = 15
          Top = 90
          Width = 82
          Height = 33
          TabOrder = 1
        end
        object edtValorUnitario: TEdit
          Left = 104
          Top = 90
          Width = 121
          Height = 33
          TabOrder = 2
        end
        object edtValorTotalItem: TEdit
          Left = 231
          Top = 90
          Width = 121
          Height = 33
          TabOrder = 3
        end
        object pnlBtnAddItem: TPanel
          Left = 362
          Top = 88
          Width = 43
          Height = 34
          BevelOuter = bvNone
          Color = 14865050
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
          object btnAddItem: TSpeedButton
            Left = 0
            Top = 0
            Width = 43
            Height = 34
            Align = alClient
            ImageIndex = 2
            Images = ImageList1
            Flat = True
            Layout = blGlyphTop
            OnClick = btnAddItemClick
            ExplicitLeft = -24
            ExplicitTop = 21
            ExplicitHeight = 33
          end
        end
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
                Left = 180
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
                Left = 397
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
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object Panel3: TPanel
                Left = 396
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
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object Panel4: TPanel
                Left = 180
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
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object pnlBtnPedido: TPanel
                Left = 418
                Top = 96
                Width = 104
                Height = 52
                BevelOuter = bvNone
                Color = 10085288
                ParentBackground = False
                TabOrder = 3
                object btnPedido: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 104
                  Height = 52
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
                  ExplicitWidth = 117
                  ExplicitHeight = 64
                end
              end
              object pnlBtnNovoPedido: TPanel
                Left = 4
                Top = 96
                Width = 104
                Height = 52
                BevelOuter = bvNone
                Color = 385718
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                Padding.Left = 1
                Padding.Top = 1
                Padding.Right = 1
                Padding.Bottom = 1
                ParentBackground = False
                ParentFont = False
                TabOrder = 4
                object btnNovoPedido: TSpeedButton
                  Left = 1
                  Top = 1
                  Width = 102
                  Height = 50
                  Align = alClient
                  Caption = 'Novo'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnNovoPedidoClick
                  ExplicitLeft = 2
                  ExplicitTop = 0
                  ExplicitWidth = 104
                  ExplicitHeight = 52
                end
              end
              object pnlBtnGravarCab: TPanel
                Left = 116
                Top = 96
                Width = 104
                Height = 52
                BevelOuter = bvNone
                Color = 14865050
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 5
                object btnGravarCab: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 104
                  Height = 52
                  Align = alClient
                  Caption = 'Gravar'
                  Enabled = False
                  Flat = True
                  OnClick = btnGravarCabClick
                  ExplicitLeft = -2
                end
              end
              object pnlBtnCancelarIncPed: TPanel
                Left = 226
                Top = 96
                Width = 104
                Height = 52
                BevelOuter = bvNone
                Color = 11120122
                ParentBackground = False
                TabOrder = 6
                object btnCancelarIncPed: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 104
                  Height = 52
                  Cursor = crHandPoint
                  Align = alClient
                  Caption = '&Cancelar'
                  Enabled = False
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnCancelarIncPedClick
                  ExplicitLeft = 1
                  ExplicitTop = -3
                  ExplicitWidth = 105
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
          object pnlEdtCliente: TPanel
            Left = 8
            Top = 23
            Width = 481
            Height = 35
            BevelOuter = bvNone
            Color = 12645002
            Enabled = False
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
              OnChange = edtIdClienteChange
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
    Width = 1184
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 1332
    inherited lblBusca: TLabel
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label1: TLabel
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtGridBusca: TEdit
      Width = 1178
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 1326
    end
  end
  inherited pnlBottom: TPanel
    Top = 613
    Width = 1184
    Height = 60
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 613
    ExplicitWidth = 1332
    ExplicitHeight = 60
    inherited PnlBtnConfirma: TPanel
      Left = 1072
      Height = 52
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 1220
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
    Left = 1197
    Top = 374
  end
  inherited TimerCharBusca: TTimer
    Left = 1241
    Top = 290
  end
  object dsCliente: TDataSource
    Left = 306
    Top = 400
  end
  object dsPedido: TDataSource
    Left = 418
    Top = 440
  end
  object ImageList1: TImageList
    Left = 834
    Top = 396
    Bitmap = {
      494C010105000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A0A0AF5000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000F2F2F20D000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000A0A0AF50000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000000000000000000000000000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF000000FF000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000FF000000FF00000000000000000000
      000000000000000000FF000000FF000000000000000000000000B6B6B6490000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF0000000000000000000000FF000000FF121212ED0000
      0000000000000000000000000000000000FF000000FF00000000000000000000
      000000000000000000FF000000FF000000FF0000000000000000000000FF0000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF0000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000FF000000FF00000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000FF0000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000000000
      000000000000000000FF0000000000000000000000FF000000FF000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0000000000000000000000FF000000FF000000005F5F5FA0969696690000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0A0A0AF500000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF0000000000000000000000FF000000FF000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0000000000000000000000FF000000FF000000004B4B4BB4ABABAB540000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      000000000000000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF0000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000FF000000FF00000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000FF0000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF0000000000000000000000FF000000FF8181817E0000
      0000000000000000000000000000000000FF000000FF00000000000000000000
      000000000000000000FF000000FF000000FF0000000000000000000000FF0000
      0000000000000000000000000000000000FF0000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000FF000000FF00000000000000000000
      000000000000000000FF000000FF0000000000000000000000001C1C1CE30000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000FFF2F2F20D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      000000000000000000FF000000000000000000000000000000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF000000FF000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000FF0000
      00FF000000FF77777788000000000000000000000000000000001A1A1AE50000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      00001B1B1BE4000000FF000000FFA9A9A9569595956A000000FF000000FFB4B4
      B44B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      000000000000000000FF00000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000004C4C4CB35F5F5FA000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00F81F000000000000E7E7000000000000
      DFFB000000000000BFFD000000000000BFFD0000000000007FFE000000000000
      7FFE0000000000007FFE0000000000007FFE0000000000007FFE000000000000
      7FFE000000000000BFFD000000000000BFFD000000000000DFFB000000000000
      E7E7000000000000F81F000000000000FFFF8003F81FFFFFFFFFBFFBE007FFFF
      FFFFBFFBC3C3F01FFEFFBFFB8FF1E7E7FEFFBFFB9E79CFF7FEFFBEFB1E78DEFB
      FEFFBEFB3E7CDEFBFEFFB83B300C9EFBE007BEFB300C981BFEFFBEFB3E7CDEFB
      FEFFBFFB1E78DEFBFEFFBFFB9E79CFF3FEFF87FB8FF1E7E7FFFFC7FBC3C3F00F
      FFFFE7FBE007FE7FFFFFF003F81FFFFF00000000000000000000000000000000
      000000000000}
  end
end
