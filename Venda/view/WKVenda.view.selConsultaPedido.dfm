inherited frmConsultaPedido: TfrmConsultaPedido
  Caption = 'frmConsultaPedido'
  ClientHeight = 597
  ClientWidth = 915
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 931
  ExplicitHeight = 636
  TextHeight = 15
  inherited Bevel3: TBevel
    Width = 911
    ExplicitWidth = 911
  end
  inherited pnlPrincipal: TPanel
    Width = 911
    Height = 473
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 911
    ExplicitHeight = 473
    inherited pnlGrid: TPanel
      Width = 905
      Height = 467
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 905
      ExplicitHeight = 467
      inherited dbgLista: TDBGrid
        Width = 903
        Height = 465
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Cliente'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataEmissao'
            Title.Caption = 'Emiss'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorTotal'
            Title.Caption = '$ Total'
            Visible = True
          end>
      end
    end
  end
  inherited pnlTop: TPanel
    Width = 911
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 911
    inherited lblBusca: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtGridBusca: TEdit
      Width = 905
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 905
    end
  end
  inherited pnlBottom: TPanel
    Top = 546
    Width = 911
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 546
    ExplicitWidth = 911
    inherited PnlBtnConfirma: TPanel
      Left = 799
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 799
    end
    inherited Panel1: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited dsGrid: TDataSource
    Left = 373
    Top = 262
  end
end
