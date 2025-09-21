unit WKVenda.Controller.Pedido;

interface

uses WKVenda.Model.Pedido, sysUtils, DB, WKVenda.Controller.PedidoItem;

type

  TPedidoController = class
  private
    FModel : TModelPedido;
    constructor create;
  public
    destructor Destroy; override;
    class function New : TPedidoController;
    function setObject(const AId : Integer) : TPedidoController;

    function Id : Integer; overload;
    function Id(AValue : Integer) : TPedidoController; overload;

    function DataEmissao : TDateTime; overload;
    function DataEmissao(AValue : TDateTime) : TPedidoController; overload;

    function IdCliente : Integer; overload;
    function IdCliente(AValue : Integer) : TPedidoController; overload;

    function ValorTotal : Double; overload;
    function ValorTotal(AValue : Double) : TPedidoController; overload;

    function Item : TPedidoItemController;

    function DataSource(AValue : TDataSource) : TPedidoController;
    function Listar(const AFiltro : String) : TPedidoController;

    function RecordObject : TPedidoController;

    function IsLoaded : Boolean;
  end;

implementation

{ TPedidoController }

constructor TPedidoController.create;
begin
  FModel := TModelPedido.New;
end;

function TPedidoController.DataEmissao: TDateTime;
begin
  Result := FModel.DataEmissao;
end;

function TPedidoController.DataEmissao(AValue: TDateTime): TPedidoController;
begin
  Result := Self;
  FModel.DataEmissao(AValue);
end;

function TPedidoController.DataSource(AValue: TDataSource): TPedidoController;
begin
  Result := Self;
  FModel.DataSource(AValue);
end;

destructor TPedidoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

function TPedidoController.Id(AValue: Integer): TPedidoController;
begin
  Result := Self;
  FModel.Id(AValue);
end;

function TPedidoController.IdCliente: Integer;
begin
  Result := FModel.IdCliente;
end;

function TPedidoController.IdCliente(AValue: Integer): TPedidoController;
begin
  Result := Self;
  FModel.IdCliente(AValue);
end;

function TPedidoController.IsLoaded: Boolean;
begin
  Result := FModel.IsLoaded;
end;

function TPedidoController.Id: Integer;
begin
  Result := FModel.Id;
end;

function TPedidoController.Listar(const AFiltro: String): TPedidoController;
begin
  Result := Self;

  FModel.Listar(AFiltro);
end;

class function TPedidoController.New: TPedidoController;
begin
  Result := Self.Create;
end;

function TPedidoController.Item: TPedidoItemController;
begin
  Result := FModel.Item;
end;

function TPedidoController.RecordObject: TPedidoController;
begin
  Result := Self;
  FModel.RecordObject;
end;

function TPedidoController.setObject(const AId: Integer): TPedidoController;
begin
  Result := Self;
  FModel.setObject(AId);
end;

function TPedidoController.ValorTotal(AValue: Double): TPedidoController;
begin
  Result := Self;
  FModel.ValorTotal(AValue);
end;

function TPedidoController.ValorTotal: Double;
begin
  Result := FModel.ValorTotal;
end;

end.
