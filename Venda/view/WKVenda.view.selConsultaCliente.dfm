inherited frmConsultaCliente: TfrmConsultaCliente
  Caption = 'Consulta cliente'
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
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 213
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 25
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
