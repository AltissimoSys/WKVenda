unit WKVenda.view.selConsultaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  WKVenda.view.template.selConsulta, Data.DB, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, WKVenda.Controller.Produto,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  UDMConnection;

type
  TfrmConsultaProduto = class(TfrmTemplateConsulta)
    procedure FormCreate(Sender: TObject);
  protected
    procedure Buscar; override;
	procedure edtGridBuscaChange(Sender: TObject);
    procedure TimerCharBuscaTimer(Sender: TObject);
  private
    FController : TProdutoController;
    procedure criarController;
  public

  end;

var
  frmConsultaProduto: TfrmConsultaProduto;

implementation

{$R *.dfm}

procedure TfrmConsultaProduto.Buscar;
const
  WHERE_ = 'AND %s LIKE %s';

begin
  inherited;

  var strWHERE : TStringBuilder;
  Try
    strWHERE := TStringBuilder.Create;
    strWHERE.Clear;

    strWHERE.AppendLine(Format(WHERE_, [ColFieldSel, QuotedStr(edtGridBusca.Text + '%')]));
    strWHERE.AppendLine(Format('ORDER BY %s', [OrderBy + ' ' + Direction])) ;
    FController.Listar(strWHERE.ToString);
  Finally
    TimerCharBusca.Enabled := False;
  End;
end;

procedure TfrmConsultaProduto.criarController;
begin
  if not Assigned(FController)then
    FController := TProdutoController.New.DataSource(dsGrid);
end;

procedure TfrmConsultaProduto.edtGridBuscaChange(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmConsultaProduto.FormCreate(Sender: TObject);
begin
  inherited;
  criarController;
  ColFieldSel := 'Descricao';
  lblBusca.Caption := Format(LABEL_BUSCA, ['Descricao']);

  OrderBy := 'Descricao';
  Direction := 'ASC';
end;

procedure TfrmConsultaProduto.TimerCharBuscaTimer(Sender: TObject);
begin
  inherited;
  Buscar;
end;

end.
