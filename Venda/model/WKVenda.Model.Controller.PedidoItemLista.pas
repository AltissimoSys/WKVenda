unit WKVenda.Model.Controller.PedidoItemLista;

interface

uses WKVenda.entity.PedidoItemLista, FireDAC.Comp.Client, WKVenda.Utils,
     SysUtils, WKVenda.entity.PedidoItem, DB;

type

  TModelPedidoItemLista = class
  private
    class function getSQL : String; overload;
    class function getSQL(const AIdPedido : Integer) : String; overload;

  public
    class function getLis(AIdPedido : Integer) : TListaPedidoItem;
    class function getAll(AIdPedido : Integer) : TFDMemTable;
  end;

implementation

{ TModelPedidoItemLista }

class function TModelPedidoItemLista.getAll(AIdPedido: Integer): TFDMemTable;
  procedure Add(AFields : TFields);
  var
    i: Integer;
  Begin
    Result.Append;
    for i := 0 to AFields.Count-1 do
    Begin
      Result.Fields[i].Value := AFields[i].Value;
    End;
  End;

begin
  var dts : TDataset;
  Try
    Result := TFDMemTable.Create(nil);
    dts := getDataSet(getSQL(AIdPedido));
    dts.first;
    while not dts.eof do
    Begin
      Result.Append;
      Add(dts.Fields);
      dts.Next;
    End;
  Finally
    FreeAndNil(dts);
  End;
end;

class function TModelPedidoItemLista.getLis(
  AIdPedido: Integer): TListaPedidoItem;
begin
  var qry: TFDQuery;
  Try
    Result := TListaPedidoItem.Create;

    qry := TFDQuery.Create(nil);
    fillQuery(qry, getSQL(AIdPedido));

    qry.first;
    while not qry.eof do
    Begin
      var item : TPedidoItem;
      item := TPedidoItem.Create;
      item.Id := qry.FieldByName('Id').AsInteger;
      item.IdPedido := qry.FieldByName('IdPedido').AsInteger;
      item.IdProduto := qry.FieldByName('IdProduto').AsInteger;
      item.Quantidade := qry.FieldByName('Quantidade').AsFloat;
      item.ValorUnitario := qry.FieldByName('ValorUnitario').AsFloat;
      item.ValorTotal := qry.FieldByName('ValorTotal').AsFloat;

      Result.Add(item);

      qry.Next;
    End;

  Finally
    FreeAndNil(qry);
  End;
end;

class function TModelPedidoItemLista.getSQL: String;
var
  strSQL: TStringBuilder;
begin
  Try
    strSQL := TStringBuilder.Create;

    with strSQL do
    Begin
      AppendLine('select * from pedidoitens');
      AppendLine('WHERE 1=1');
    End;
    Result := strSQL.toString;
  Finally
    FreeAndNil(strSQL);
  End;
end;

class function TModelPedidoItemLista.getSQL(const AIdPedido: Integer): String;
var
  strSQL : TStringBuilder;
begin
  Try
    strSQL := TStringBuilder.Create;
    strSQL.Append(getSQL);
    strSQL.AppendLine(Format('AND IdPedido = %d', [AIdPedido]));
    Result := strSQL.ToString;
  Finally
    FreeAndNil(strSQL);
  End;
end;

end.
