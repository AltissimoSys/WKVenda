unit WKVenda.Controller.PedidoItem;

interface

uses DB, WKVenda.Model.PedidoItem, SysUtils;

type

  TPedidoItemController = class
  private
    FModel : TModelPedidoItem;
    constructor create(const APedido : Integer);
  public
    destructor Destroy; override;
    class function new(const AIdPedido : Integer) : TPedidoItemController;
    function setObject(const AIdPedido : Integer) : TPedidoItemController;

    function Id : Integer; overload;
    function Id(AValue : Integer) : TPedidoItemController; overload;

    function IdPedido : Integer; overload;
    function IdPedido(AValue : Integer) : TPedidoItemController; overload;

    function IdProduto : Integer; overload;
    function IdProduto(AValue : Integer) : TPedidoItemController; overload;

    function Quantidade : Double; overload;
    function Quantidade(AValue : Double) : TPedidoItemController; overload;

    function ValorUnitario : Double; overload;
    function ValorUnitario(AValue : Double) : TPedidoItemController; overload;

    function ValorTotal : Double; overload;
    function ValorTotal(AValue : Double) : TPedidoItemController; overload;

    function DataSource(AValue : TDataSource) : TPedidoItemController;
    function Listar(const AIdPedido : Integer) : TPedidoItemController;

    function RecordObject : TPedidoItemController;
  end;

implementation

{ TPedidoItemController }

constructor TPedidoItemController.create(const APedido: Integer);
begin
  FModel := TModelPedidoItem.new(APedido);
end;

function TPedidoItemController.DataSource(
  AValue: TDataSource): TPedidoItemController;
begin
  Result := Self;
  FModel.DataSource(AValue);
end;

destructor TPedidoItemController.destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

function TPedidoItemController.Id(AValue: Integer): TPedidoItemController;
begin
  Result := Self;
  FModel.Id(AValue);
end;

function TPedidoItemController.IdPedido(AValue: Integer): TPedidoItemController;
begin
  Result := Self;
  FModel.IdPedido(AValue);
end;

function TPedidoItemController.IdProduto(
  AValue: Integer): TPedidoItemController;
begin
  Result := Self;
  FModel.IdProduto(AValue);
end;

function TPedidoItemController.IdProduto: Integer;
begin
  Result := FModel.IdProduto;
end;

function TPedidoItemController.IdPedido: Integer;
begin
  Result := FModel.IdPedido;
end;

function TPedidoItemController.Id: Integer;
begin
  Result := FModel.Id;
end;

function TPedidoItemController.Listar(
  const AIdPedido: Integer): TPedidoItemController;
begin
  Result := Self;
  FModel.Listar(AIdPedido);
end;

class function TPedidoItemController.new(
  const AIdPedido: Integer): TPedidoItemController;
begin
  Result := Self.create(AIdPedido);
end;

function TPedidoItemController.Quantidade(
  AValue: Double): TPedidoItemController;
begin
  Result := Self;
  FModel.Quantidade(AValue);
end;

function TPedidoItemController.RecordObject: TPedidoItemController;
begin
  Try
    FModel.RecordObject;
  Except on E:Exception do
    Begin
      raise Exception.Create(e.Message);
    End;
  End;
end;

function TPedidoItemController.Quantidade: Double;
begin
  Result := FModel.Quantidade;
end;

function TPedidoItemController.setObject(
  const AIdPedido: Integer): TPedidoItemController;
begin
  Result := Self;
  FModel.setObject(AIdPedido);
end;

function TPedidoItemController.ValorTotal(
  AValue: Double): TPedidoItemController;
begin
  Result := Self;
  FModel.ValorTotal(AValue);
end;

function TPedidoItemController.ValorTotal: Double;
begin
  Result := FModel.ValorTotal;
end;

function TPedidoItemController.ValorUnitario(
  AValue: Double): TPedidoItemController;
begin
  Result := Self;
  FModel.ValorUnitario(AValue);
end;

function TPedidoItemController.ValorUnitario: Double;
begin
  Result := FModel.ValorUnitario;
end;

end.
