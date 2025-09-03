object frmTemplateConsulta: TfrmTemplateConsulta
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'frmTemplateConsulta'
  ClientHeight = 441
  ClientWidth = 624
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 2
  Padding.Top = 2
  Padding.Right = 2
  Padding.Bottom = 2
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  TextHeight = 15
  object Bevel3: TBevel
    Left = 2
    Top = 57
    Width = 620
    Height = 16
    Align = alTop
    Shape = bsBottomLine
    ExplicitTop = 55
  end
  object pnlPrincipal: TPanel
    Left = 2
    Top = 73
    Width = 620
    Height = 317
    Align = alClient
    Color = clWhite
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 0
    object pnlGrid: TPanel
      Left = 3
      Top = 3
      Width = 614
      Height = 311
      Align = alClient
      BevelOuter = bvNone
      Color = 12645002
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      TabOrder = 0
      object dbgLista: TDBGrid
        Left = 1
        Top = 1
        Width = 612
        Height = 309
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsGrid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = dbgListaDrawColumnCell
        OnTitleClick = dbgListaTitleClick
      end
    end
  end
  object pnlTop: TPanel
    Left = 2
    Top = 2
    Width = 620
    Height = 55
    Align = alTop
    Color = clWhite
    Padding.Left = 2
    Padding.Top = 3
    Padding.Right = 2
    Padding.Bottom = 3
    ParentBackground = False
    TabOrder = 1
    object lblBusca: TLabel
      Left = 3
      Top = 4
      Width = 246
      Height = 15
      AutoSize = False
      Caption = 'lblBusca'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 413
      Top = 7
      Width = 198
      Height = 15
      Caption = '* Clique na coluna do grid para filtrar:'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtGridBusca: TEdit
      Left = 3
      Top = 28
      Width = 614
      Height = 23
      Align = alBottom
      TabOrder = 0
      OnChange = edtGridBuscaChange
    end
  end
  object pnlBottom: TPanel
    Left = 2
    Top = 390
    Width = 620
    Height = 49
    Align = alBottom
    Color = clWhite
    Padding.Left = 2
    Padding.Top = 3
    Padding.Right = 2
    Padding.Bottom = 3
    ParentBackground = False
    TabOrder = 2
    object PnlBtnConfirma: TPanel
      Left = 508
      Top = 4
      Width = 109
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      Color = 12645002
      ParentBackground = False
      TabOrder = 0
      object btnConfirma: TSpeedButton
        Left = 0
        Top = 0
        Width = 109
        Height = 41
        Align = alClient
        Caption = '&Confirma'
        Flat = True
        OnClick = btnConfirmaClick
        ExplicitTop = -1
      end
    end
    object Panel1: TPanel
      Left = 3
      Top = 4
      Width = 105
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      Color = 11120122
      ParentBackground = False
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 105
        Height = 41
        Align = alClient
        Caption = '&Sair'
        Flat = True
        OnClick = SpeedButton1Click
        ExplicitLeft = 1
        ExplicitTop = -3
        ExplicitHeight = 46
      end
    end
  end
  object dsGrid: TDataSource
    Left = 325
    Top = 198
  end
  object TimerCharBusca: TTimer
    Interval = 2000
    OnTimer = TimerCharBuscaTimer
    Left = 521
    Top = 162
  end
end
