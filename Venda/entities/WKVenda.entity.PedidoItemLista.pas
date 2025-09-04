unit WKVenda.entity.PedidoItemLista;

interface

uses WKVenda.entity.PedidoItem, generics.collections;

type

TListaPedidoItem = class(TObjectList<TPedidoItem>)
private

public
  procedure Add(AValue : TPedidoItem); reintroduce;
end;

implementation

{ TListaPedidoItem }

procedure TListaPedidoItem.Add(AValue: TPedidoItem);
begin
  inherited Add(AValue);
end;

end.
