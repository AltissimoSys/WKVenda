unit WKVenda.Model.PedidoItem;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  WKVenda.entity.PedidoItem, WKVenda.Utils, UDMConnection;

type
  TModelPedidoItem = class(TDataModule)
    cdsPedidosItem: TFDMemTable;

  strict private
    procedure criarCDS;
    procedure ClearObject;
    procedure setObject(AFields: TFields); overload;

  private
    FPedidoItem : TPedidoItem;
    FDataSource : TDataSource;

    constructor create(AOwner : TComponent; const APedido : Integer); reintroduce;
  public
    destructor Destroy; override;
    class function new(const APedido : Integer) : TModelPedidoItem;
    class function getSQL: String;

    function setObject(const AId : Integer) : TModelPedidoItem; overload;

    function Id : Integer; overload;
    function Id(AValue : Integer) : TModelPedidoItem; overload;

    function IdPedido : Integer; overload;
    function IdPedido(AValue : Integer) : TModelPedidoItem; overload;

    function IdProduto : Integer; overload;
    function IdProduto(AValue : Integer) : TModelPedidoItem; overload;

    function Quantidade : Double; overload;
    function Quantidade(AValue : Double) : TModelPedidoItem; overload;

    function ValorUnitario : Double; overload;
    function ValorUnitario(AValue : Double) : TModelPedidoItem; overload;

    function ValorTotal : Double; overload;
    function ValorTotal(AValue : Double) : TModelPedidoItem; overload;

    function DataSource(AValue : TDataSource) : TModelPedidoItem;

    function Listar(const AIdPedido : Integer) : TModelPedidoItem;

    class function getSQLInsUpd : String;
    function RecordObject : TModelPedidoItem;
  end;

var
  ModelPedidoItem: TModelPedidoItem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModelPedidoItem }

procedure TModelPedidoItem.ClearObject;
begin
  FPedidoItem.IsLoaded      := False;
  FPedidoItem.Id            := 0;
  FPedidoItem.IdPedido      := 0;
  FPedidoItem.IdProduto     := 0;
  FPedidoItem.Quantidade    := 0;
  FPedidoItem.ValorUnitario := 0;
  FPedidoItem.ValorTotal    := 0;
end;

constructor TModelPedidoItem.create(AOwner : TComponent; const APedido : Integer);
begin
  FPedidoItem := TPedidoItem.create;

  inherited Create(AOwner);
  FPedidoItem := TPedidoItem.Create;
  ClearObject;
  criarCDS;
end;

procedure TModelPedidoItem.criarCDS;
begin
  var str : TStringBuilder;
  Try
    str := TStringBuilder.Create;
    str.Clear;

    str.Append(getSQL);
    str.AppendLine('AND 1=0');

    cdsPedidosItem := WKVenda.Utils.CriarDataset(str.ToString);

  Finally
    FreeAndNil(str);
  End;
end;

function TModelPedidoItem.DataSource(AValue: TDataSource): TModelPedidoItem;
begin
  Result := Self;
  AValue.DataSet := cdsPedidosItem;
  FDataSource := AValue;
end;

destructor TModelPedidoItem.destroy;
begin
  FreeAndNil(FPedidoItem);
  inherited;
end;

class function TModelPedidoItem.getSQL: String;
var
  strSQL: TStringBuilder;
begin
  Try
    strSQL := TStringBuilder.Create;

    with strSQL do
    Begin
      AppendLine('select pr.Descricao AS ProdutoNome, pdi.*');
      AppendLine('FROM pedidoitens pdi');
      AppendLine('INNER JOIN Produto pr');
      AppendLine('	ON pdi.IdProduto = pr.Id');
      AppendLine('WHERE 1=1');
    End;
    Result := strSQL.toString;
  Finally
    FreeAndNil(strSQL);
  End;
end;

class function TModelPedidoItem.getSQLInsUpd: String;
begin
  var str := TStringBuilder.Create;
  Try
    str.Clear;
    with str do
    Begin
      AppendLine('INSERT INTO PedidoItens');
      AppendLine('            (');
      AppendLine('             Id,');
      AppendLine('             IdPedido,');
      AppendLine('             IdProduto,');
      AppendLine('             Quantidade,');
      AppendLine('             ValorUnitario,');
      AppendLine('             ValorTotal');
      AppendLine('            )');
      AppendLine('            VALUES');
      AppendLine('            (');
      AppendLine('             :Id,');
      AppendLine('             :IdPedido,');
      AppendLine('             :IdProduto,');
      AppendLine('             :Quantidade,');
      AppendLine('             :ValorUnitario,');
      AppendLine('             :ValorTotal');
      AppendLine('            )');
      AppendLine('ON DUPLICATE KEYUPDATE Quantidade = :Quantidade,');
      AppendLine('       ValorUnitario = : ValorUnitario,');
      AppendLine('       ValorTotal = :ValorTotal');
    End;
    Result := str.ToString;

  Finally
    FreeAndNil(str);
  End;
end;

function TModelPedidoItem.Id(AValue: Integer): TModelPedidoItem;
begin
  Result := Self;
  FPedidoItem.Id := AValue;
end;

function TModelPedidoItem.IdPedido(AValue: Integer): TModelPedidoItem;
begin
  Result := Self;
  FPedidoItem.IdPedido := AValue;
end;

function TModelPedidoItem.IdProduto(AValue: Integer): TModelPedidoItem;
begin
  Result := Self;
  FPedidoItem.IdProduto := AValue;
end;

function TModelPedidoItem.IdProduto: Integer;
begin
  Result := FPedidoItem.IdProduto;
end;

function TModelPedidoItem.IdPedido: Integer;
begin
  Result := FPedidoItem.IdPedido;
end;

function TModelPedidoItem.Id: Integer;
begin
  Result := FPedidoItem.Id;
end;

function TModelPedidoItem.Listar(const AIdPedido: Integer): TModelPedidoItem;
const
  WHERE_ = 'AND IdPedido = %d';
begin
  Result := Self;

    var strSQL : TStringBuilder;
  Try
    strSQL := TStringBuilder.Create;
    strSQL.Append(getSQL);
    strSQL.AppendLine(Format(WHERE_, [AIdPedido]));

    fillDataset(cdsPedidosItem, strSQL.ToString);
  Finally
    FreeAndNil(strSQL);
  End;
end;

class function TModelPedidoItem.new(const APedido: Integer): TModelPedidoItem;
begin
  Result := Self.create(Nil, APedido);
end;

function TModelPedidoItem.Quantidade(AValue: Double): TModelPedidoItem;
begin
  Result := Self;
  FPedidoItem.Quantidade := AValue;
end;

function TModelPedidoItem.RecordObject: TModelPedidoItem;
begin
  var qry := TFDQuery.Create(Nil);
  Try
    qry.SQL.Text := getSQLInsUpd;
    qry.Connection := DMConnection.FDCon;
    qry.ParamByName('Id').Value              := FPedidoItem.Id;
    qry.ParamByName('IdPedido').AsInteger    := FPedidoItem.IdPedido;
    qry.ParamByName('IdProduto').AsInteger   := FPedidoItem.IdProduto;
    qry.ParamByName('Quantidade').AsFloat    := FPedidoItem.Quantidade;
    qry.ParamByName('ValorUnitario').AsFloat := FPedidoItem.ValorUnitario;
    qry.ParamByName('ValorTotal').AsFloat    := FPedidoItem.ValorTotal;

    Try
      qry.ExecSQL;
    Except on E:Exception do
      Begin
        raise Exception.Create('Erro ao gravar itens do pedido: ' + e.Message);
      End;
    End;
  Finally
    FreeAndNil(qry);
  End;
end;

function TModelPedidoItem.setObject(const AId: Integer): TModelPedidoItem;
const
  SQL_ = 'AND Id = %d';

begin
  var qry: TFDQuery;
  var str : TStringBuilder;
  Try
    Result := Self;

    ClearObject;

    str := TStringBuilder.Create;
    str.Append(getSQL);
    str.AppendLine(Format(SQL_, []));

    fillQuery(qry, str.ToString);

    if not qry.IsEmpty then
      setObject(qry.Fields)
  Finally
    FreeAndNil(str);
    FreeAndNil(qry);
  End;
end;

function TModelPedidoItem.Quantidade: Double;
begin
  Result := FPedidoItem.Quantidade;
end;

procedure TModelPedidoItem.setObject(AFields: TFields);
begin
  Try
    FPedidoItem.Id            := AFields.FieldByName('Id').AsInteger;
    FPedidoItem.IdPedido      := AFields.FieldByName('IdPedido').AsInteger;
    FPedidoItem.IdProduto     := AFields.FieldByName('IdProduto').AsInteger;
    FPedidoItem.Quantidade    := AFields.FieldByName('Quantidade').AsFloat;
    FPedidoItem.ValorUnitario := AFields.FieldByName('Quantidade').AsFloat;
  Except
    FPedidoItem.IsLoaded := False;
  End;
end;

function TModelPedidoItem.ValorTotal(AValue: Double): TModelPedidoItem;
begin
  Result := Self;
  FPedidoItem.ValorTotal := AValue;
end;

function TModelPedidoItem.ValorTotal: Double;
begin
  Result := FPedidoItem.ValorTotal;
end;

function TModelPedidoItem.ValorUnitario(AValue: Double): TModelPedidoItem;
begin
  Result := Self;
  FPedidoItem.ValorUnitario := AValue;
end;

function TModelPedidoItem.ValorUnitario: Double;
begin
  Result := FPedidoItem.ValorUnitario;
end;

end.
