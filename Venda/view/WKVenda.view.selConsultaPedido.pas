unit WKVenda.view.selConsultaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WKVenda.view.template.selConsulta,
  Data.DB, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  WKVenda.Controller.Pedido, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UDMConnection;

type
  TfrmConsultaPedido = class(TfrmTemplateConsulta)
    procedure FormCreate(Sender: TObject);
    procedure TimerCharBuscaTimer(Sender: TObject);
    procedure dbgListaTitleClick(Column: TColumn);
    procedure dbgListaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  protected
    procedure Buscar; override;

  private
    FIdCliente : Integer;
    FController : TPedidoController;
    procedure criarController;
  public
    constructor create(AOwner : TComponent; const AIdCliente : Integer); reintroduce; overload;
    constructor create(AOwner : TComponent); reintroduce; overload;
  end;

var
  frmConsultaPedido: TfrmConsultaPedido;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TfrmConsultaPedido.Buscar;
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
    FController.DataSource(dsGrid, nil)
               .Listar(strWHERE.ToString);
  Finally
    TimerCharBusca.Enabled := False;
  End;
end;

constructor TfrmConsultaPedido.create(AOwner: TComponent; const AIdCliente : Integer);
const
  WHERE_CLI = 'AND IdCliente = %d';

begin
  Self.create(AOwner);
  FIdCliente := AIdCliente;
  FController.DataSource(dsGrid, NIL)
             .Listar(Format(WHERE_CLI, [AIdCliente]));
end;

constructor TfrmConsultaPedido.create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIdCliente := 0;
end;

procedure TfrmConsultaPedido.criarController;
begin
  if not Assigned(FController) then
    FController := TPedidoController.New
                      .DataSource(dsGrid, Nil);
end;

procedure TfrmConsultaPedido.dbgListaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  //
end;

procedure TfrmConsultaPedido.dbgListaTitleClick(Column: TColumn);
begin
  inherited;
  //
end;

procedure TfrmConsultaPedido.FormCreate(Sender: TObject);
begin
  inherited;
  criarController;
  ColFieldSel := 'Nome';
  lblBusca.Caption := format(LABEL_BUSCA, ['Nome']);
  OrderBy := 'Nome';
  Direction := 'ASC';
end;

procedure TfrmConsultaPedido.TimerCharBuscaTimer(Sender: TObject);
begin
  inherited;
   Buscar;
end;

end.
