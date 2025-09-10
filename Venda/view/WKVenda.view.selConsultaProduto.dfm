inherited frmConsultaProduto: TfrmConsultaProduto
  Caption = 'Consulta produto'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlPrincipal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pnlGrid: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited dbgLista: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrecoVenda'
            Title.Caption = '$ Pre'#231'o Venda'
            Width = 90
            Visible = True
          end>
      end
    end
  end
  inherited pnlTop: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblBusca: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtGridBusca: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited pnlBottom: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited PnlBtnConfirma: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Panel1: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
  end
end
