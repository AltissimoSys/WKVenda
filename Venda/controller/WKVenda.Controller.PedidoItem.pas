unit WKVenda.Controller.PedidoItem;

interface

uses WKVenda.Model.PedidoItem, SysUtils;

type

  TPedidoItemController = class
  private
    FModel : TModelPedidoItem;
    constructor create(const APedido : Integer);
    destructor destroy; override;
  public
    class function new(const AIdPedido : Integer) : TPedidoItemController;
    function setObject(const AIdPedido : Integer) : TPedidoItemController;


  end;

implementation

{ TPedidoItemController }

constructor TPedidoItemController.create(const APedido: Integer);
begin
  FModel := TModelPedidoItem.new(APedido);
end;

destructor TPedidoItemController.destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

class function TPedidoItemController.new(
  const AIdPedido: Integer): TPedidoItemController;
begin
  Result := Self.create(AIdPedido);
end;

function TPedidoItemController.setObject(
  const AIdPedido: Integer): TPedidoItemController;
begin
  Result := Self;
  FModel.setObject(AIdPedido);
end;

end.
